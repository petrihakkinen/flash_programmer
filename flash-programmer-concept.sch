<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
</parts>
<sheets>
<sheet>
<plain>
<text x="73.66" y="40.64" size="1.778" layer="91">FLASH</text>
<text x="111.76" y="40.64" size="1.778" layer="91">ATMEGA</text>
<text x="16.256" y="29.718" size="1.778" layer="91" rot="R90">EXPANSION PORT</text>
<text x="47.752" y="61.468" size="1.778" layer="91" rot="R90">BUFFER</text>
<text x="47.752" y="35.306" size="1.778" layer="91" rot="R90">BUFFER</text>
<text x="47.752" y="9.906" size="1.778" layer="91" rot="R90">BUFFER</text>
<text x="22.86" y="67.056" size="1.778" layer="91">ADDRESS 13-BIT</text>
<text x="26.67" y="16.51" size="1.778" layer="91">DATA 8-BIT</text>
<text x="94.996" y="29.21" size="1.778" layer="91">DATA</text>
<text x="92.456" y="54.356" size="1.778" layer="91">ADDRESS</text>
<text x="55.88" y="16.764" size="1.778" layer="91">DATA</text>
<text x="52.832" y="64.262" size="1.778" layer="91">ADDRESS</text>
<text x="52.832" y="41.656" size="1.778" layer="91">ADDRESS</text>
<text x="93.218" y="1.016" size="1.778" layer="91">R/W</text>
<text x="25.4" y="74.676" size="1.778" layer="91">BLK5</text>
<text x="70.358" y="84.836" size="1.778" layer="91">BUFFER ENABLE</text>
<text x="39.624" y="77.724" size="1.778" layer="91">OE1</text>
<text x="49.53" y="77.724" size="1.778" layer="91">OE2</text>
<text x="132.588" y="41.91" size="1.778" layer="91">SERIAL</text>
</plain>
<instances>
</instances>
<busses>
</busses>
<nets>
<net name="N$4" class="0">
<segment>
<wire x1="10.16" y1="76.2" x2="20.32" y2="76.2" width="0.1524" layer="91"/>
<wire x1="20.32" y1="76.2" x2="20.32" y2="73.66" width="0.1524" layer="91"/>
<wire x1="20.32" y1="73.66" x2="20.32" y2="66.04" width="0.1524" layer="91"/>
<wire x1="20.32" y1="66.04" x2="20.32" y2="15.24" width="0.1524" layer="91"/>
<wire x1="20.32" y1="15.24" x2="20.32" y2="5.08" width="0.1524" layer="91"/>
<wire x1="20.32" y1="5.08" x2="10.16" y2="5.08" width="0.1524" layer="91"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="76.2" width="0.1524" layer="91"/>
<wire x1="43.18" y1="25.4" x2="45.72" y2="25.4" width="0.1524" layer="91"/>
<wire x1="45.72" y1="25.4" x2="48.26" y2="25.4" width="0.1524" layer="91"/>
<wire x1="48.26" y1="25.4" x2="50.8" y2="25.4" width="0.1524" layer="91"/>
<wire x1="50.8" y1="25.4" x2="50.8" y2="15.24" width="0.1524" layer="91"/>
<wire x1="50.8" y1="15.24" x2="50.8" y2="5.08" width="0.1524" layer="91"/>
<wire x1="50.8" y1="5.08" x2="43.18" y2="5.08" width="0.1524" layer="91"/>
<wire x1="43.18" y1="5.08" x2="43.18" y2="15.24" width="0.1524" layer="91"/>
<wire x1="43.18" y1="15.24" x2="43.18" y2="25.4" width="0.1524" layer="91"/>
<wire x1="43.18" y1="76.2" x2="45.72" y2="76.2" width="0.1524" layer="91"/>
<wire x1="45.72" y1="76.2" x2="48.26" y2="76.2" width="0.1524" layer="91"/>
<wire x1="48.26" y1="76.2" x2="50.8" y2="76.2" width="0.1524" layer="91"/>
<wire x1="50.8" y1="76.2" x2="50.8" y2="63.5" width="0.1524" layer="91"/>
<wire x1="50.8" y1="63.5" x2="50.8" y2="55.88" width="0.1524" layer="91"/>
<wire x1="50.8" y1="55.88" x2="48.26" y2="55.88" width="0.1524" layer="91"/>
<wire x1="48.26" y1="55.88" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<wire x1="45.72" y1="55.88" x2="43.18" y2="55.88" width="0.1524" layer="91"/>
<wire x1="43.18" y1="55.88" x2="43.18" y2="66.04" width="0.1524" layer="91"/>
<wire x1="43.18" y1="66.04" x2="43.18" y2="76.2" width="0.1524" layer="91"/>
<wire x1="66.04" y1="71.12" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
<wire x1="66.04" y1="63.5" x2="66.04" y2="15.24" width="0.1524" layer="91"/>
<wire x1="66.04" y1="15.24" x2="66.04" y2="10.16" width="0.1524" layer="91"/>
<wire x1="66.04" y1="10.16" x2="76.2" y2="10.16" width="0.1524" layer="91"/>
<wire x1="76.2" y1="10.16" x2="88.9" y2="10.16" width="0.1524" layer="91"/>
<wire x1="88.9" y1="10.16" x2="88.9" y2="27.94" width="0.1524" layer="91"/>
<wire x1="88.9" y1="27.94" x2="88.9" y2="53.34" width="0.1524" layer="91"/>
<wire x1="88.9" y1="53.34" x2="88.9" y2="71.12" width="0.1524" layer="91"/>
<wire x1="88.9" y1="71.12" x2="66.04" y2="71.12" width="0.1524" layer="91"/>
<wire x1="50.8" y1="63.5" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
<wire x1="50.8" y1="15.24" x2="66.04" y2="15.24" width="0.1524" layer="91"/>
<wire x1="106.68" y1="71.12" x2="106.68" y2="53.34" width="0.1524" layer="91"/>
<wire x1="106.68" y1="53.34" x2="106.68" y2="27.94" width="0.1524" layer="91"/>
<wire x1="106.68" y1="27.94" x2="106.68" y2="10.16" width="0.1524" layer="91"/>
<wire x1="106.68" y1="10.16" x2="114.3" y2="10.16" width="0.1524" layer="91"/>
<wire x1="114.3" y1="10.16" x2="124.46" y2="10.16" width="0.1524" layer="91"/>
<wire x1="124.46" y1="10.16" x2="124.46" y2="40.64" width="0.1524" layer="91"/>
<wire x1="124.46" y1="40.64" x2="124.46" y2="71.12" width="0.1524" layer="91"/>
<wire x1="124.46" y1="71.12" x2="114.3" y2="71.12" width="0.1524" layer="91"/>
<wire x1="114.3" y1="71.12" x2="106.68" y2="71.12" width="0.1524" layer="91"/>
<wire x1="88.9" y1="53.34" x2="106.68" y2="53.34" width="0.1524" layer="91"/>
<wire x1="88.9" y1="27.94" x2="106.68" y2="27.94" width="0.1524" layer="91"/>
<wire x1="20.32" y1="66.04" x2="35.56" y2="66.04" width="0.1524" layer="91"/>
<wire x1="35.56" y1="66.04" x2="43.18" y2="66.04" width="0.1524" layer="91"/>
<wire x1="35.56" y1="66.04" x2="35.56" y2="43.18" width="0.1524" layer="91"/>
<wire x1="43.18" y1="50.8" x2="45.72" y2="50.8" width="0.1524" layer="91"/>
<wire x1="45.72" y1="50.8" x2="48.26" y2="50.8" width="0.1524" layer="91"/>
<wire x1="48.26" y1="50.8" x2="50.8" y2="50.8" width="0.1524" layer="91"/>
<wire x1="50.8" y1="50.8" x2="50.8" y2="40.64" width="0.1524" layer="91"/>
<wire x1="50.8" y1="40.64" x2="50.8" y2="30.48" width="0.1524" layer="91"/>
<wire x1="50.8" y1="30.48" x2="48.26" y2="30.48" width="0.1524" layer="91"/>
<wire x1="48.26" y1="30.48" x2="45.72" y2="30.48" width="0.1524" layer="91"/>
<wire x1="45.72" y1="30.48" x2="43.18" y2="30.48" width="0.1524" layer="91"/>
<wire x1="43.18" y1="30.48" x2="43.18" y2="43.18" width="0.1524" layer="91"/>
<wire x1="43.18" y1="43.18" x2="43.18" y2="50.8" width="0.1524" layer="91"/>
<wire x1="50.8" y1="40.64" x2="66.04" y2="40.64" width="0.1524" layer="91"/>
<wire x1="35.56" y1="43.18" x2="43.18" y2="43.18" width="0.1524" layer="91"/>
<wire x1="20.32" y1="15.24" x2="43.18" y2="15.24" width="0.1524" layer="91"/>
<wire x1="114.3" y1="10.16" x2="114.3" y2="0" width="0.1524" layer="91"/>
<wire x1="114.3" y1="0" x2="76.2" y2="0" width="0.1524" layer="91"/>
<wire x1="76.2" y1="0" x2="76.2" y2="10.16" width="0.1524" layer="91"/>
<wire x1="20.32" y1="73.66" x2="35.56" y2="73.66" width="0.1524" layer="91"/>
<wire x1="35.56" y1="73.66" x2="35.56" y2="83.82" width="0.1524" layer="91"/>
<wire x1="35.56" y1="83.82" x2="45.72" y2="83.82" width="0.1524" layer="91"/>
<wire x1="45.72" y1="83.82" x2="45.72" y2="76.2" width="0.1524" layer="91"/>
<wire x1="114.3" y1="71.12" x2="114.3" y2="83.82" width="0.1524" layer="91"/>
<wire x1="114.3" y1="83.82" x2="48.26" y2="83.82" width="0.1524" layer="91"/>
<wire x1="48.26" y1="83.82" x2="48.26" y2="76.2" width="0.1524" layer="91"/>
<wire x1="45.72" y1="55.88" x2="45.72" y2="50.8" width="0.1524" layer="91"/>
<wire x1="48.26" y1="55.88" x2="48.26" y2="50.8" width="0.1524" layer="91"/>
<wire x1="45.72" y1="30.48" x2="45.72" y2="25.4" width="0.1524" layer="91"/>
<wire x1="48.26" y1="30.48" x2="48.26" y2="25.4" width="0.1524" layer="91"/>
<wire x1="124.46" y1="40.64" x2="142.24" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
