/*

	W29C020C flash memory programmer
	Using ATmega32A

	Pin mappings:
	PD0-PD1			RX/TX
	PD2				Flash CE (active low)
	PD3				Flash OE (active low)
	PD4				Flash WE (active low)
	PD5				Buffer OE (active low)
	PD6-PD7			unused
	PA0-PA7			16-bit address bus, low bits
	PB0-PB7			16-bit address bus, high bits
	PC0-PC7			8-bit data bus

	Writing to flash:
	- must wait 5ms after power-up before first write
	- data must be written in 128 byte pages
	- write to page must be intiated with special command stream

	Write page:
	- Write 0aaa to address 0x5555
	- Write 0x55 to address 0x2aaa
	- Write 0xa0 to address 0x5555
	- Load 128 bytes to page (time between byte loads must not exceed 200 uS)
	- Pause 10ms

	Write byte:
	- set address
	- set CE and WE low and OE high
	- set data
	- set WE high
*/

#define PAGE_SIZE		128

// bits in port D
#define FLASH_CE		4		// PD2
#define FLASH_OE		8		// PD3
#define FLASH_WE		16		// PD4
#define BUFFER_OE		32		// PD5

// This function must be called from writePage
// assumes that we are in page writing mode and that address and data busses are in output mode
void writeByte(uint16_t address, byte data)
{
	// address is latched on the falling edge of CE or WE, whichever occurs last

	PORTD |= FLASH_CE|FLASH_OE|FLASH_WE;	// CE,OE,WE high

	// set address and data
	PORTA = address;
	PORTB = address>>8;
	PORTC = data;

	// latch address and start write cycle
	PORTD &= ~(FLASH_WE|FLASH_CE);	// WE,CE low

	// hold
	delayMicroseconds(1);

	PORTD |= FLASH_CE|FLASH_OE|FLASH_WE;	// CE,OE,WE high

	delayMicroseconds(1);
}

byte readByte(uint16_t address)
{
	// set address bus to output
	DDRA = 0xff;
	DDRB = 0xff;

	PORTD |= FLASH_CE|FLASH_OE|FLASH_WE;	// CE,OE,WE high

	// set address
	PORTA = address;
	PORTB = address>>8;
	delayMicroseconds(10);

	PORTD &= ~(FLASH_CE|FLASH_OE);		// CE,OE low

	delayMicroseconds(10);

	// read data from port C
	byte data = PINC;

	PORTD |= FLASH_CE|FLASH_OE;			// CE,OE high 

	// release address bus
	DDRA = 0;
	DDRB = 0;
	PORTA = 0;
	PORTB = 0;

	return data;
}

void writePage(uint16_t address, const byte* src)
{
	// set address and data buses to output
	DDRA = 0xff;
	DDRB = 0xff;
	DDRC = 0xff;

	// initiate page writing
	writeByte(0x5555, 0xAA);
	writeByte(0x2AAA, 0x55);
	writeByte(0x5555, 0xA0);

	// write data
	for(byte i = 0; i < PAGE_SIZE; i++)
		writeByte(address + i, src[i]);

	// wait for page to be written to flash
	delay(10);

	// release address and data buses
	DDRA = 0;
	DDRB = 0;
	DDRC = 0;
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
}

void chipErase()
{
	Serial.println("Erasing chip...");

	// set address and data buses to output
	DDRA = 0xff;
	DDRB = 0xff;
	DDRC = 0xff;

	writeByte(0x5555, 0xAA);
	writeByte(0x2AAA, 0x55);
	writeByte(0x5555, 0x80);
	writeByte(0x5555, 0xAA);
	writeByte(0x2AAA, 0x55);
	writeByte(0x5555, 0x10);
	delay(50);

	// release address and data buses
	DDRA = 0;
	DDRB = 0;
	DDRC = 0;
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
}

// Capture ownership of the flash chip.
void captureOwnership()
{
	// disable buffer
	PORTD |= BUFFER_OE;		// buffer OE high

	// set CE to output mode
	DDRD |= FLASH_CE;

	// set WE,OE and CE to HIGH
	PORTD |= FLASH_CE|FLASH_WE|FLASH_OE;

	// release address and data busses (just in case)
	DDRA = 0;
	DDRB = 0;
	DDRC = 0;
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
}

// Release ownership of the flash chip and grant VIC access to flash.
void releaseOwnership()
{
	// set WE high
	PORTD |= FLASH_WE;

	// set OE low
	PORTD &= ~FLASH_OE;

	// set CE to input mode
	DDRD &= ~FLASH_CE;
	PORTD &= ~FLASH_CE;	// disable internal pull-up

	// release address and data busses (just in case)
	DDRA = 0;
	DDRB = 0;
	DDRC = 0;
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;

	// enable buffer
	PORTD &= ~BUFFER_OE;	// buffer OE low
}

byte readSerial()
{
	while(Serial.available() == 0) {}
	return Serial.read();
}

byte ascToNibble(byte v)
{
	if(v >= '0' && v <= '9')
		return v - '0';
	if(v >= 'a' && v <= 'f')
		return v - 'a' + 10;
	if(v >= 'A' && v <= 'F')
		return v - 'A' + 10;
	return 0; // error
}

void writePageHex(byte page)
{
	captureOwnership();

	// clear buffer
	byte buffer[PAGE_SIZE];
	for(int i = 0; i < PAGE_SIZE; i++)
		buffer[i] = 0;

	// read data from serial to buffer
	byte i = 0;
	while(i < PAGE_SIZE)
	{
		byte h = readSerial();
		if(h == '*')
			break;
		h = ascToNibble(h);

		byte l = readSerial();
		if(l == '*')
			break;
		l = ascToNibble(l);
		
		buffer[i++] = (h<<4)|l; 
	}

	Serial.print("Writing page ");
	Serial.println(page);
	writePage(page * PAGE_SIZE, buffer);

	releaseOwnership();
}

void dumpPage(byte page)
{
	captureOwnership();

	Serial.print("Reading page ");
	Serial.println(page);

	const char hex[] = "0123456789ABCDEF";

	int rowLength = 0;
	for(int i = 0; i < PAGE_SIZE; i++)
	{
		byte data = readByte(page * PAGE_SIZE + i);

		// dump hex
		char str[4];
		str[0] = hex[data>>4];
		str[1] = hex[data & 0xf];
		str[2] = ' ';
		str[3] = 0;
		Serial.print(str);

	 	if(++rowLength == 16) {
	 		Serial.println(" ");
	 		rowLength = 0;
	 	}
	}
	Serial.println(" ");

	releaseOwnership();
}

void setup()
{
	// set address and data buses to input mode
	DDRA = 0;
	DDRB = 0;
	DDRC = 0;

	// set control lines (buffer OE, flash CE,OE,WE) to output
	DDRD = FLASH_CE|FLASH_OE|FLASH_WE|BUFFER_OE;

	// set all control lines to HIGH
	PORTD |= FLASH_CE|FLASH_OE|FLASH_WE|BUFFER_OE;

	// MCU is now controlling the flash memory

	Serial.begin(9600);
}

void loop()
{
	byte cmd = readSerial();
	byte page;

	Serial.println("Ready\n");

	switch(cmd)
	{
	case 'w':
		page = readSerial() - '0';
		writePageHex(page);
		break;

	case 'd':
		page = readSerial() - '0';
		dumpPage(page);
		break;

	case 'e':
		chipErase();
		break;

	case '?':
		Serial.println("wX... write hex data to page X, terminated with *");
		Serial.println("dX    dump page X");
		Serial.println("e     erase chip");
		break;

	default:
		Serial.println("Unknown command. Type ? for help");
		break;
	}
}
