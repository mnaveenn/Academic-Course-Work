<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
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
<library name="Wemos">
<packages>
<package name="WEMOS">
<description>WEMOS Controller socket</description>
<pad name="3V3" x="22.86" y="0" drill="0.8" shape="octagon"/>
<pad name="D8" x="22.86" y="2.54" drill="0.8" shape="octagon"/>
<pad name="D7" x="22.86" y="5.08" drill="0.8" shape="octagon"/>
<pad name="D6" x="22.86" y="7.62" drill="0.8" shape="octagon"/>
<pad name="D5" x="22.86" y="10.16" drill="0.8" shape="octagon"/>
<pad name="D0" x="22.86" y="12.7" drill="0.8" shape="octagon"/>
<pad name="A0" x="22.86" y="15.24" drill="0.8" shape="octagon"/>
<pad name="RST" x="22.86" y="17.78" drill="0.8" shape="octagon"/>
<pad name="5V" x="0" y="0" drill="0.8" shape="octagon"/>
<pad name="GND" x="0" y="2.54" drill="0.8" shape="octagon"/>
<pad name="D4" x="0" y="5.08" drill="0.8" shape="octagon"/>
<pad name="D3" x="0" y="7.62" drill="0.8" shape="octagon"/>
<pad name="D2" x="0" y="10.16" drill="0.8" shape="octagon"/>
<pad name="D1" x="0" y="12.7" drill="0.8" shape="octagon"/>
<pad name="RX" x="0" y="15.24" drill="0.8" shape="octagon"/>
<pad name="TX" x="0" y="17.78" drill="0.8" shape="octagon"/>
<rectangle x1="21.59" y1="-1.27" x2="24.13" y2="19.05" layer="21"/>
<rectangle x1="-1.27" y1="-1.27" x2="1.27" y2="19.05" layer="21"/>
<text x="8.89" y="19.05" size="0.8128" layer="21" font="vector"> WEMOS
Controller</text>
<wire x1="2" y1="-9" x2="25" y2="-9" width="0.127" layer="21"/>
<wire x1="25" y1="-9" x2="25" y2="24" width="0.127" layer="21"/>
<wire x1="22" y1="27" x2="1" y2="27" width="0.127" layer="21"/>
<text x="7.635" y="23.54" size="0.8128" layer="21" font="vector">Radio Antenna
  Facing UP</text>
<text x="7.635" y="-7.43" size="0.8128" layer="21" font="vector">   USB bottom
Facing DOWN/PCB</text>
<wire x1="-2" y1="24" x2="-2" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="24" x2="1" y2="27" width="0.127" layer="21" curve="-90"/>
<wire x1="25" y1="24" x2="22" y2="27" width="0.127" layer="21" curve="90"/>
<wire x1="2" y1="-9" x2="2" y2="-4" width="0.127" layer="21"/>
<wire x1="2" y1="-4" x2="-2" y2="-2" width="0.127" layer="21"/>
<text x="17.78" y="-0.635" size="1.27" layer="21" font="vector">3V3</text>
<text x="17.78" y="1.905" size="1.27" layer="21" font="vector">D8</text>
<text x="17.78" y="4.445" size="1.27" layer="21" font="vector">D7</text>
<text x="17.78" y="6.985" size="1.27" layer="21" font="vector">D6</text>
<text x="17.78" y="9.525" size="1.27" layer="21" font="vector">D5</text>
<text x="17.78" y="12.065" size="1.27" layer="21" font="vector">D0</text>
<text x="17.78" y="14.605" size="1.27" layer="21" font="vector">A0</text>
<text x="17.78" y="17.145" size="1.27" layer="21" font="vector">RST</text>
<text x="2.54" y="-0.635" size="1.27" layer="21" font="vector">5V</text>
<text x="2.54" y="1.905" size="1.27" layer="21" font="vector">GND</text>
<text x="2.54" y="4.445" size="1.27" layer="21" font="vector">D4</text>
<text x="2.54" y="6.985" size="1.27" layer="21" font="vector">D3</text>
<text x="2.54" y="9.525" size="1.27" layer="21" font="vector">D2</text>
<text x="2.54" y="12.065" size="1.27" layer="21" font="vector">D1</text>
<text x="2.54" y="14.605" size="1.27" layer="21" font="vector">RX</text>
<text x="2.54" y="17.145" size="1.27" layer="21" font="vector">TX</text>
</package>
</packages>
<symbols>
<symbol name="WEMOS">
<wire x1="0" y1="0" x2="0" y2="22.86" width="0.254" layer="94"/>
<wire x1="0" y1="22.86" x2="15.24" y2="22.86" width="0.254" layer="94"/>
<wire x1="15.24" y1="22.86" x2="15.24" y2="0" width="0.254" layer="94"/>
<wire x1="15.24" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<pin name="3V3" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="D8" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="D7" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="D6" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="D5" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="D0" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="A0" x="20.32" y="17.78" length="middle" rot="R180"/>
<pin name="RST" x="20.32" y="20.32" length="middle" rot="R180"/>
<pin name="5V" x="-5.08" y="2.54" length="middle"/>
<pin name="GND" x="-5.08" y="5.08" length="middle"/>
<pin name="D4" x="-5.08" y="7.62" length="middle"/>
<pin name="D3" x="-5.08" y="10.16" length="middle"/>
<pin name="D2" x="-5.08" y="12.7" length="middle"/>
<pin name="D1" x="-5.08" y="15.24" length="middle"/>
<pin name="RX" x="-5.08" y="17.78" length="middle"/>
<pin name="TX" x="-5.08" y="20.32" length="middle"/>
<text x="0" y="23.622" size="1.27" layer="95">&gt;Name</text>
<text x="0" y="-2.54" size="1.778" layer="96">&gt;Value</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="WEMOS">
<gates>
<gate name="G$1" symbol="WEMOS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="WEMOS">
<connects>
<connect gate="G$1" pin="3V3" pad="3V3"/>
<connect gate="G$1" pin="5V" pad="5V"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="D0" pad="D0"/>
<connect gate="G$1" pin="D1" pad="D1"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="TX" pad="TX"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="uln-udn">
<description>&lt;b&gt;Driver Arrays&lt;/b&gt;&lt;p&gt;
ULN and UDN Series&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL16">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO16">
<description>&lt;b&gt;Small Outline Package&lt;/b&gt;</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-4.064" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-1.778" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="2001A">
<wire x1="-7.62" y1="10.16" x2="7.62" y2="10.16" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="7.62" y2="10.16" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="-7.62" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="-12.7" width="0.4064" layer="94"/>
<text x="-7.62" y="10.922" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="I1" x="-12.7" y="7.62" length="middle" direction="in"/>
<pin name="I2" x="-12.7" y="5.08" length="middle" direction="in"/>
<pin name="I3" x="-12.7" y="2.54" length="middle" direction="in"/>
<pin name="I4" x="-12.7" y="0" length="middle" direction="in"/>
<pin name="I5" x="-12.7" y="-2.54" length="middle" direction="in"/>
<pin name="I6" x="-12.7" y="-5.08" length="middle" direction="in"/>
<pin name="I7" x="-12.7" y="-7.62" length="middle" direction="in"/>
<pin name="O1" x="12.7" y="7.62" length="middle" direction="oc" rot="R180"/>
<pin name="O2" x="12.7" y="5.08" length="middle" direction="oc" rot="R180"/>
<pin name="O3" x="12.7" y="2.54" length="middle" direction="oc" rot="R180"/>
<pin name="O4" x="12.7" y="0" length="middle" direction="oc" rot="R180"/>
<pin name="O5" x="12.7" y="-2.54" length="middle" direction="oc" rot="R180"/>
<pin name="O6" x="12.7" y="-5.08" length="middle" direction="oc" rot="R180"/>
<pin name="O7" x="12.7" y="-7.62" length="middle" direction="oc" rot="R180"/>
<pin name="CD+" x="12.7" y="-10.16" length="middle" direction="pas" rot="R180"/>
<pin name="GND" x="-12.7" y="-10.16" length="middle" direction="pwr"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ULN2003A" prefix="IC">
<description>&lt;b&gt;DRIVER ARRAY&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="2001A" x="0" y="0"/>
</gates>
<devices>
<device name="N" package="DIL16">
<connects>
<connect gate="A" pin="CD+" pad="9"/>
<connect gate="A" pin="GND" pad="8"/>
<connect gate="A" pin="I1" pad="1"/>
<connect gate="A" pin="I2" pad="2"/>
<connect gate="A" pin="I3" pad="3"/>
<connect gate="A" pin="I4" pad="4"/>
<connect gate="A" pin="I5" pad="5"/>
<connect gate="A" pin="I6" pad="6"/>
<connect gate="A" pin="I7" pad="7"/>
<connect gate="A" pin="O1" pad="16"/>
<connect gate="A" pin="O2" pad="15"/>
<connect gate="A" pin="O3" pad="14"/>
<connect gate="A" pin="O4" pad="13"/>
<connect gate="A" pin="O5" pad="12"/>
<connect gate="A" pin="O6" pad="11"/>
<connect gate="A" pin="O7" pad="10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D" package="SO16">
<connects>
<connect gate="A" pin="CD+" pad="9"/>
<connect gate="A" pin="GND" pad="8"/>
<connect gate="A" pin="I1" pad="1"/>
<connect gate="A" pin="I2" pad="2"/>
<connect gate="A" pin="I3" pad="3"/>
<connect gate="A" pin="I4" pad="4"/>
<connect gate="A" pin="I5" pad="5"/>
<connect gate="A" pin="I6" pad="6"/>
<connect gate="A" pin="I7" pad="7"/>
<connect gate="A" pin="O1" pad="16"/>
<connect gate="A" pin="O2" pad="15"/>
<connect gate="A" pin="O3" pad="14"/>
<connect gate="A" pin="O4" pad="13"/>
<connect gate="A" pin="O5" pad="12"/>
<connect gate="A" pin="O6" pad="11"/>
<connect gate="A" pin="O7" pad="10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="relay">
<description>&lt;b&gt;Relays&lt;/b&gt;&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;Eichhoff
&lt;li&gt;Finder
&lt;li&gt;Fujitsu
&lt;li&gt;HAMLIN
&lt;li&gt;OMRON
&lt;li&gt;Matsushita
&lt;li&gt;NAiS
&lt;li&gt;Siemens
&lt;li&gt;Schrack
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="ZF112">
<description>&lt;b&gt;RELAY&lt;/b&gt;&lt;p&gt;
1 x switch</description>
<wire x1="10.287" y1="8.255" x2="-10.287" y2="8.255" width="0.1524" layer="21"/>
<wire x1="-10.287" y1="-8.255" x2="-10.287" y2="8.255" width="0.1524" layer="21"/>
<wire x1="-10.287" y1="-8.255" x2="10.287" y2="-8.255" width="0.1524" layer="21"/>
<wire x1="10.287" y1="8.255" x2="10.287" y2="-8.255" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="5.715" x2="-2.54" y2="5.715" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-5.715" x2="-4.445" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.254" layer="21"/>
<wire x1="0" y1="-1.27" x2="0" y2="1.27" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-5.715" x2="-2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="0" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-5.08" y2="1.27" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="5.715" width="0.1524" layer="21"/>
<wire x1="0" y1="1.27" x2="-1.905" y2="1.27" width="0.254" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="1.27" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-1.27" x2="-3.175" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-2.54" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="0" x2="4.445" y2="0" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="4.445" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.54" x2="4.445" y2="0" width="0.1524" layer="21"/>
<pad name="O" x="6.096" y="5.9944" drill="1.3208" shape="long"/>
<pad name="S" x="6.096" y="-5.9944" drill="1.3208" shape="long"/>
<pad name="1" x="-6.096" y="5.9944" drill="1.3208" shape="long"/>
<pad name="2" x="-6.096" y="-5.9944" drill="1.3208" shape="long"/>
<pad name="P" x="-8.2042" y="0" drill="1.8034" shape="long"/>
<text x="12.7" y="-7.62" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-10.795" y="-7.62" size="1.778" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="K">
<wire x1="-3.81" y1="-1.905" x2="-1.905" y2="-1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="1.905" x2="1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.905" x2="3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="1.905" x2="-3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="1.905" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.905" x2="0" y2="1.905" width="0.254" layer="94"/>
<text x="1.27" y="2.921" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.27" y="5.08" size="1.778" layer="95">&gt;PART</text>
<pin name="2" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="1" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
<symbol name="U">
<wire x1="3.175" y1="5.08" x2="1.905" y2="5.08" width="0.254" layer="94"/>
<wire x1="-3.175" y1="5.08" x2="-1.905" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="2.54" y2="5.715" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.254" layer="94"/>
<circle x="0" y="1.27" radius="0.127" width="0.4064" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95">&gt;PART</text>
<pin name="O" x="5.08" y="5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="S" x="-5.08" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="P" x="0" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ZF112" prefix="K">
<description>&lt;b&gt;RELAY&lt;/b&gt;&lt;p&gt;
1 x switch</description>
<gates>
<gate name="1" symbol="K" x="0" y="0" addlevel="must"/>
<gate name="2" symbol="U" x="17.78" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="ZF112">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="2" pin="O" pad="O"/>
<connect gate="2" pin="P" pad="P"/>
<connect gate="2" pin="S" pad="S"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-ptr500">
<description>&lt;b&gt;PTR Connectors&lt;/b&gt;&lt;p&gt;
Aug. 2004 / PTR Meßtechnik:&lt;br&gt;
Die Bezeichnung der Serie AK505 wurde geändert.&lt;br&gt;
Es handelt sich hierbei um AK500 in horizontaler Ausführung.&lt;p&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;Alte Bezeichnung&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;Neue Bezeichnung&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;AK505/2,grau&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#0000FF"&gt;AK500/2-5.0-H-GRAU&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;AK505/2DS,grau&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#0000FF"&gt;AK500/2DS-5.0-H-GRAU&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;AKZ505/2,grau&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=LEFT&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#0000FF"&gt;AKZ500/2-5.08-H-GRAU&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
  &lt;/TABLE&gt;

&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="AK300/3">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;</description>
<wire x1="7.5438" y1="6.223" x2="7.5438" y2="3.175" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="6.223" x2="-7.5438" y2="6.223" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="6.223" x2="8.0518" y2="6.223" width="0.1524" layer="21"/>
<wire x1="8.0518" y1="6.223" x2="8.0518" y2="1.397" width="0.1524" layer="21"/>
<wire x1="8.0518" y1="1.397" x2="7.5438" y2="1.651" width="0.1524" layer="21"/>
<wire x1="8.0518" y1="-5.461" x2="7.5438" y2="-5.207" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="-5.207" x2="7.5438" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="8.0518" y1="-3.81" x2="7.5438" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="-4.064" x2="7.5438" y2="-5.207" width="0.1524" layer="21"/>
<wire x1="8.0518" y1="-3.81" x2="8.0518" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-6.223" x2="-2.032" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="2.032" y1="0.254" x2="2.032" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-6.223" x2="2.032" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-6.223" x2="2.9718" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-6.223" x2="-2.9718" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-6.223" x2="-2.032" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-7.0358" y1="0.254" x2="-7.0358" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-7.5438" y1="-6.223" x2="-7.0358" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-7.0358" y1="-6.223" x2="-2.9718" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-4.318" x2="2.032" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-4.318" x2="-2.032" y2="0.254" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-4.318" x2="2.032" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-4.318" x2="-7.0358" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-4.318" x2="-2.9718" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-7.0358" y1="-4.318" x2="-7.0358" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="1.651" y1="-3.683" x2="1.651" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="1.651" y1="-3.683" x2="-1.651" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-1.651" y1="-3.683" x2="-1.651" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.3528" y1="-3.683" x2="-3.3528" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.3528" y1="-3.683" x2="-6.6548" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-6.6548" y1="-3.683" x2="-6.6548" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-6.6548" y1="-0.508" x2="-6.2738" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-3.3528" y1="-0.508" x2="-3.7338" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="-0.508" x2="-1.27" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-0.508" x2="1.27" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-7.5438" y1="-6.223" x2="-7.5438" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.5438" y1="0.635" x2="-7.5438" y2="3.175" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="1.651" x2="7.5438" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="0.635" x2="7.5438" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-7.5438" y1="3.175" x2="7.5438" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-7.5438" y1="3.175" x2="-7.5438" y2="6.223" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="3.175" x2="7.5438" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="3.429" x2="-2.032" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="5.969" x2="2.032" y2="5.969" width="0.1524" layer="21"/>
<wire x1="2.032" y1="5.969" x2="2.032" y2="3.429" width="0.1524" layer="21"/>
<wire x1="2.032" y1="3.429" x2="-2.032" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="3.429" x2="-2.9718" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="3.429" x2="-7.0358" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-7.0358" y1="3.429" x2="-7.0358" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="5.969" x2="-7.0358" y2="5.969" width="0.1524" layer="21"/>
<wire x1="1.4682" y1="4.0849" x2="1.5239" y2="5.0545" width="0.1524" layer="21" curve="90.564135"/>
<wire x1="-1.4732" y1="4.1656" x2="1.5146" y2="4.1189" width="0.1524" layer="21" curve="75.530157"/>
<wire x1="-1.6256" y1="5.0038" x2="1.5288" y2="5.0588" width="0.1524" layer="21" curve="-100.022513"/>
<wire x1="-1.5748" y1="5.0546" x2="-1.4311" y2="4.1297" width="0.1524" layer="21" curve="104.208873"/>
<wire x1="-1.6256" y1="4.445" x2="1.4224" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-1.4986" y1="4.318" x2="1.5494" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-3.5102" y1="4.0849" x2="-3.4545" y2="5.0545" width="0.1524" layer="21" curve="90.564135"/>
<wire x1="-6.4516" y1="4.1656" x2="-3.4638" y2="4.1188" width="0.1524" layer="21" curve="75.528719"/>
<wire x1="-6.604" y1="5.0038" x2="-3.4496" y2="5.0588" width="0.1524" layer="21" curve="-100.022513"/>
<wire x1="-6.5532" y1="5.0546" x2="-6.4095" y2="4.1297" width="0.1524" layer="21" curve="104.208873"/>
<wire x1="-6.604" y1="4.445" x2="-3.556" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="4.318" x2="-3.429" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-7.0358" y1="0.254" x2="-6.6548" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="0.254" x2="-3.3528" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-3.3528" y1="0.254" x2="-6.6548" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-7.5438" y1="0.635" x2="-6.6548" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.6548" y1="0.635" x2="-3.3528" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-3.3528" y1="0.635" x2="-1.651" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.5438" y1="0.635" x2="6.6548" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.651" y1="0.635" x2="-1.651" y2="0.635" width="0.1524" layer="51"/>
<wire x1="2.032" y1="0.254" x2="1.651" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="0.254" x2="-1.651" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.651" y1="0.254" x2="1.651" y2="0.254" width="0.1524" layer="51"/>
<wire x1="6.6548" y1="0.635" x2="3.3782" y2="0.635" width="0.1524" layer="51"/>
<wire x1="1.6764" y1="0.635" x2="3.3528" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.0358" y1="-6.223" x2="7.5438" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="7.0358" y1="0.254" x2="7.0358" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="7.0358" y1="-4.318" x2="7.0358" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="7.0358" y1="0.254" x2="6.6548" y2="0.254" width="0.1524" layer="21"/>
<wire x1="3.3782" y1="0.254" x2="6.6548" y2="0.254" width="0.1524" layer="51"/>
<wire x1="2.9718" y1="0.254" x2="3.3782" y2="0.254" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="-6.223" x2="2.9718" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="-6.223" x2="7.0358" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="-4.318" x2="7.0358" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="6.6548" y1="-3.683" x2="3.3528" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="6.6548" y1="-3.683" x2="6.6548" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="6.6548" y1="-0.508" x2="6.2738" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="3.3528" y1="-0.508" x2="3.7084" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="3.3528" y1="-3.683" x2="3.3528" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="3.429" x2="2.9718" y2="5.969" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="5.969" x2="7.0358" y2="5.969" width="0.1524" layer="21"/>
<wire x1="7.0358" y1="5.969" x2="7.0358" y2="3.429" width="0.1524" layer="21"/>
<wire x1="7.0358" y1="3.429" x2="2.9718" y2="3.429" width="0.1524" layer="21"/>
<wire x1="6.472" y1="4.0849" x2="6.5277" y2="5.0545" width="0.1524" layer="21" curve="90.564135"/>
<wire x1="3.5306" y1="4.1656" x2="6.5184" y2="4.1189" width="0.1524" layer="21" curve="75.530157"/>
<wire x1="3.3782" y1="5.0038" x2="6.5324" y2="5.0586" width="0.1524" layer="21" curve="-100.0232"/>
<wire x1="3.429" y1="5.0546" x2="3.5727" y2="4.1297" width="0.1524" layer="21" curve="104.208873"/>
<wire x1="3.3782" y1="4.445" x2="6.4262" y2="5.08" width="0.1524" layer="21"/>
<wire x1="3.5052" y1="4.318" x2="6.5532" y2="4.953" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="-4.318" x2="2.9718" y2="0.254" width="0.1524" layer="21"/>
<pad name="1" x="-5.0038" y="0" drill="1.3208" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.3208" shape="long" rot="R90"/>
<pad name="3" x="5.0038" y="0" drill="1.3208" shape="long" rot="R90"/>
<text x="-7.5692" y="6.731" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.5692" y="-8.636" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.985" y="1.27" size="1.27" layer="21" ratio="10">1</text>
<text x="-1.905" y="1.27" size="1.27" layer="21" ratio="10">2</text>
<text x="3.175" y="1.27" size="1.27" layer="21" ratio="10">3</text>
<rectangle x1="-6.2738" y1="-2.54" x2="-3.7338" y2="0.254" layer="51"/>
<rectangle x1="-1.27" y1="-2.54" x2="1.27" y2="0.254" layer="51"/>
<rectangle x1="3.7338" y1="-2.54" x2="6.2738" y2="0.254" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="KL">
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="KLV">
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<text x="-3.81" y="-3.683" size="1.778" layer="96">&gt;VALUE</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AK300/3" prefix="X" uservalue="yes">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="KL" x="0" y="5.08" addlevel="always"/>
<gate name="-2" symbol="KL" x="0" y="0" addlevel="always"/>
<gate name="-3" symbol="KLV" x="0" y="-5.08" addlevel="always"/>
</gates>
<devices>
<device name="" package="AK300/3">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
<connect gate="-3" pin="KL" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="transistor-fet">
<description>&lt;b&gt;Field Effect Transistors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;p&gt;
&lt;p&gt;
Symbols changed according to IEC617&lt;p&gt; 
All types, packages and assignment to symbols and pins checked&lt;p&gt;
Package outlines partly checked&lt;p&gt;
&lt;p&gt;
JFET = junction FET&lt;p&gt;
IGBT-x = insulated gate bipolar transistor&lt;p&gt;
x=N: NPN; x=P: PNP&lt;p&gt;
IGFET-mc-nnn; (IGFET=insulated gate field effect transistor)&lt;P&gt;
m=D: depletion mode (Verdr&amp;auml;ngungstyp)&lt;p&gt;
m=E: enhancement mode (Anreicherungstyp)&lt;p&gt;
c: N=N-channel; P=P-Channel&lt;p&gt;
GDSB: gate, drain, source, bulk&lt;p&gt;
&lt;p&gt;
by R. Vogg  15.March.2002</description>
<packages>
<package name="TO220">
<description>&lt;b&gt;TO 220 horizontal&lt;/b&gt;</description>
<wire x1="-5.207" y1="-1.27" x2="5.207" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.207" y1="14.605" x2="-5.207" y2="14.605" width="0.127" layer="21"/>
<wire x1="5.207" y1="-1.27" x2="5.207" y2="11.176" width="0.127" layer="21"/>
<wire x1="5.207" y1="11.176" x2="4.318" y2="11.176" width="0.127" layer="21"/>
<wire x1="4.318" y1="11.176" x2="4.318" y2="12.7" width="0.127" layer="21"/>
<wire x1="4.318" y1="12.7" x2="5.207" y2="12.7" width="0.127" layer="21"/>
<wire x1="5.207" y1="12.7" x2="5.207" y2="14.605" width="0.127" layer="21"/>
<wire x1="-5.207" y1="-1.27" x2="-5.207" y2="11.176" width="0.127" layer="21"/>
<wire x1="-5.207" y1="11.176" x2="-4.318" y2="11.176" width="0.127" layer="21"/>
<wire x1="-4.318" y1="11.176" x2="-4.318" y2="12.7" width="0.127" layer="21"/>
<wire x1="-4.318" y1="12.7" x2="-5.207" y2="12.7" width="0.127" layer="21"/>
<wire x1="-5.207" y1="12.7" x2="-5.207" y2="14.605" width="0.127" layer="21"/>
<wire x1="-4.572" y1="-0.635" x2="4.572" y2="-0.635" width="0.0508" layer="21"/>
<wire x1="4.572" y1="7.62" x2="4.572" y2="-0.635" width="0.0508" layer="21"/>
<wire x1="4.572" y1="7.62" x2="-4.572" y2="7.62" width="0.0508" layer="21"/>
<wire x1="-4.572" y1="-0.635" x2="-4.572" y2="7.62" width="0.0508" layer="21"/>
<circle x="0" y="11.176" radius="1.8034" width="0.127" layer="21"/>
<circle x="0" y="11.176" radius="4.191" width="0" layer="42"/>
<circle x="0" y="11.176" radius="4.191" width="0" layer="43"/>
<pad name="1" x="-2.54" y="-6.35" drill="1.1176" shape="long" rot="R90"/>
<pad name="2" x="0" y="-6.35" drill="1.1176" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-6.35" drill="1.1176" shape="long" rot="R90"/>
<text x="-3.81" y="5.207" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.937" y="2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.445" y="7.874" size="0.9906" layer="21" ratio="12">A17,5mm</text>
<text x="-3.175" y="0" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.635" y="0" size="1.27" layer="51" ratio="10">2</text>
<text x="1.905" y="0" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-4.064" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-4.064" layer="21"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-4.064" layer="21"/>
<rectangle x1="-3.175" y1="-4.064" x2="-1.905" y2="-1.27" layer="21"/>
<rectangle x1="-0.635" y1="-4.064" x2="0.635" y2="-1.27" layer="21"/>
<rectangle x1="1.905" y1="-4.064" x2="3.175" y2="-1.27" layer="21"/>
<rectangle x1="-2.921" y1="-6.604" x2="-2.159" y2="-4.699" layer="51"/>
<rectangle x1="-0.381" y1="-6.604" x2="0.381" y2="-4.699" layer="51"/>
<rectangle x1="2.159" y1="-6.604" x2="2.921" y2="-4.699" layer="51"/>
<hole x="0" y="11.176" drill="3.302"/>
</package>
</packages>
<symbols>
<symbol name="IGFET-EN-GDS">
<wire x1="-2.54" y1="-2.54" x2="-1.2192" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="0.762" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-0.762" width="0.254" layer="94"/>
<wire x1="0" y1="3.683" x2="0" y2="1.397" width="0.254" layer="94"/>
<wire x1="1.905" y1="0.635" x2="0.635" y2="0" width="0.254" layer="94"/>
<wire x1="1.905" y1="-0.635" x2="0.635" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="0.635" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.397" x2="0" y2="-3.683" width="0.254" layer="94"/>
<wire x1="-1.143" y1="2.54" x2="-1.143" y2="-2.54" width="0.254" layer="94"/>
<text x="-11.43" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="-11.43" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<pin name="D" x="5.08" y="2.54" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="S" x="5.08" y="-2.54" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="IRF540" prefix="Q">
<description>&lt;b&gt;N-Channel Enhancement MOSFET&lt;/b&gt; (HEXFET); 100V; 28A; 0,077Ohm</description>
<gates>
<gate name="G$1" symbol="IGFET-EN-GDS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO220">
<connects>
<connect gate="G$1" pin="D" pad="2"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-lstb">
<description>&lt;b&gt;Pin Headers&lt;/b&gt;&lt;p&gt;
Naming:&lt;p&gt;
MA = male&lt;p&gt;
# contacts - # rows&lt;p&gt;
W = angled&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MA03-1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.81" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-3.81" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="MA04-1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.08" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.223" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="0.635" y="1.651" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="5.334" y="-0.635" size="1.27" layer="21" ratio="10">4</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MA03-1">
<wire x1="3.81" y1="-5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<text x="-1.27" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="MA04-1">
<wire x1="3.81" y1="-7.62" x2="-1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<text x="-1.27" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MA03-1" prefix="SV" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="MA03-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA03-1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MA04-1" prefix="SV" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="MA04-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA04-1">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
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
<part name="U$1" library="Wemos" deviceset="WEMOS" device=""/>
<part name="IC1" library="uln-udn" deviceset="ULN2003A" device="N"/>
<part name="K1" library="relay" deviceset="ZF112" device=""/>
<part name="K2" library="relay" deviceset="ZF112" device=""/>
<part name="K3" library="relay" deviceset="ZF112" device=""/>
<part name="K4" library="relay" deviceset="ZF112" device=""/>
<part name="X1" library="con-ptr500" deviceset="AK300/3" device=""/>
<part name="X2" library="con-ptr500" deviceset="AK300/3" device=""/>
<part name="X3" library="con-ptr500" deviceset="AK300/3" device=""/>
<part name="X4" library="con-ptr500" deviceset="AK300/3" device=""/>
<part name="Q1" library="transistor-fet" deviceset="IRF540" device=""/>
<part name="Q2" library="transistor-fet" deviceset="IRF540" device=""/>
<part name="SV1" library="con-lstb" deviceset="MA03-1" device="" value="VCC"/>
<part name="SV2" library="con-lstb" deviceset="MA04-1" device="" value="GND"/>
<part name="X5" library="con-ptr500" deviceset="AK300/3" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="137.16" y="-10.16"/>
<instance part="IC1" gate="A" x="139.7" y="-30.48"/>
<instance part="K1" gate="1" x="157.48" y="-15.24" rot="R180"/>
<instance part="K1" gate="2" x="104.14" y="-38.1"/>
<instance part="K2" gate="1" x="167.64" y="-15.24"/>
<instance part="K2" gate="2" x="104.14" y="-50.8"/>
<instance part="K3" gate="1" x="175.26" y="-25.4" rot="R90"/>
<instance part="K3" gate="2" x="104.14" y="-25.4"/>
<instance part="K4" gate="1" x="165.1" y="-35.56" rot="R180"/>
<instance part="K4" gate="2" x="104.14" y="-10.16"/>
<instance part="X1" gate="-1" x="83.82" y="-5.08"/>
<instance part="X1" gate="-2" x="83.82" y="-10.16"/>
<instance part="X1" gate="-3" x="83.82" y="-15.24"/>
<instance part="X2" gate="-1" x="83.82" y="-20.32"/>
<instance part="X2" gate="-2" x="83.82" y="-25.4"/>
<instance part="X2" gate="-3" x="83.82" y="-30.48"/>
<instance part="X3" gate="-1" x="83.82" y="-35.56"/>
<instance part="X3" gate="-2" x="83.82" y="-40.64"/>
<instance part="X3" gate="-3" x="83.82" y="-45.72"/>
<instance part="X4" gate="-1" x="86.36" y="-58.42" rot="R90"/>
<instance part="X4" gate="-2" x="91.44" y="-58.42" rot="R90"/>
<instance part="X4" gate="-3" x="96.52" y="-58.42" rot="R90"/>
<instance part="Q1" gate="G$1" x="208.28" y="-2.54"/>
<instance part="Q2" gate="G$1" x="208.28" y="-15.24"/>
<instance part="SV1" gate="G$1" x="160.02" y="20.32" rot="R270"/>
<instance part="SV2" gate="1" x="187.96" y="7.62" rot="R180"/>
<instance part="X5" gate="-1" x="220.98" y="-7.62" rot="R90"/>
<instance part="X5" gate="-2" x="226.06" y="-7.62" rot="R90"/>
<instance part="X5" gate="-3" x="231.14" y="-7.62" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D1"/>
<wire x1="132.08" y1="5.08" x2="111.76" y2="5.08" width="0.1524" layer="91"/>
<wire x1="111.76" y1="5.08" x2="111.76" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-30.48" x2="124.46" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="124.46" y1="-30.48" x2="124.46" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="I1"/>
<wire x1="124.46" y1="-22.86" x2="127" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D2"/>
<wire x1="132.08" y1="2.54" x2="114.3" y2="2.54" width="0.1524" layer="91"/>
<wire x1="114.3" y1="2.54" x2="114.3" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-27.94" x2="121.92" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-27.94" x2="121.92" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="I2"/>
<wire x1="121.92" y1="-25.4" x2="127" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D3"/>
<wire x1="132.08" y1="0" x2="116.84" y2="0" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-25.4" x2="116.84" y2="0" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-25.4" x2="121.92" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="I3"/>
<wire x1="121.92" y1="-20.32" x2="121.92" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-22.86" x2="127" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D4"/>
<wire x1="132.08" y1="-2.54" x2="119.38" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="119.38" y1="-2.54" x2="119.38" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="119.38" y1="-33.02" x2="124.46" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="I4"/>
<wire x1="124.46" y1="-33.02" x2="127" y2="-30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="IC1" gate="A" pin="GND"/>
<wire x1="127" y1="-40.64" x2="142.24" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-40.64" x2="142.24" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="142.24" y1="-5.08" x2="139.7" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="SV1" gate="G$1" pin="3"/>
<wire x1="139.7" y1="-5.08" x2="132.08" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="162.56" y1="12.7" x2="180.34" y2="12.7" width="0.1524" layer="91"/>
<pinref part="SV2" gate="1" pin="1"/>
<wire x1="180.34" y1="12.7" x2="180.34" y2="17.78" width="0.1524" layer="91"/>
<wire x1="180.34" y1="17.78" x2="180.34" y2="25.4" width="0.1524" layer="91"/>
<wire x1="180.34" y1="25.4" x2="139.7" y2="25.4" width="0.1524" layer="91"/>
<wire x1="139.7" y1="25.4" x2="139.7" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="S"/>
<wire x1="213.36" y1="-5.08" x2="215.9" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="215.9" y1="-5.08" x2="215.9" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="S"/>
<wire x1="215.9" y1="-17.78" x2="213.36" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-17.78" x2="236.22" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="236.22" y1="-17.78" x2="236.22" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="236.22" y1="-2.54" x2="236.22" y2="17.78" width="0.1524" layer="91"/>
<wire x1="236.22" y1="17.78" x2="180.34" y2="17.78" width="0.1524" layer="91"/>
<pinref part="X5" gate="-3" pin="KL"/>
<wire x1="231.14" y1="-2.54" x2="236.22" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="IC1" gate="A" pin="CD+"/>
<wire x1="152.4" y1="-40.64" x2="144.78" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="144.78" y1="-40.64" x2="144.78" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="5V"/>
<wire x1="132.08" y1="-7.62" x2="144.78" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="144.78" y1="-7.62" x2="149.86" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-7.62" x2="149.86" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-12.7" x2="154.94" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="154.94" y1="-12.7" x2="154.94" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="K1" gate="1" pin="2"/>
<wire x1="154.94" y1="-10.16" x2="157.48" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="SV1" gate="G$1" pin="1"/>
<wire x1="157.48" y1="12.7" x2="144.78" y2="12.7" width="0.1524" layer="91"/>
<wire x1="144.78" y1="12.7" x2="144.78" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="K2" gate="1" pin="1"/>
<wire x1="157.48" y1="-10.16" x2="167.64" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="SV2" gate="1" pin="4"/>
<wire x1="180.34" y1="5.08" x2="172.72" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="182.88" y1="-10.16" x2="172.72" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="182.88" y1="-10.16" x2="182.88" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="K3" gate="1" pin="2"/>
<wire x1="180.34" y1="-25.4" x2="182.88" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="182.88" y1="-25.4" x2="182.88" y2="-43.18" width="0.1524" layer="91"/>
<pinref part="K4" gate="1" pin="1"/>
<wire x1="165.1" y1="-40.64" x2="165.1" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="165.1" y1="-43.18" x2="182.88" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="167.64" y1="-10.16" x2="172.72" y2="-10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="K1" gate="1" pin="1"/>
<wire x1="157.48" y1="-20.32" x2="157.48" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="O4"/>
<wire x1="157.48" y1="-30.48" x2="152.4" y2="-30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC1" gate="A" pin="O3"/>
<wire x1="167.64" y1="-27.94" x2="152.4" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="K2" gate="1" pin="2"/>
<wire x1="167.64" y1="-20.32" x2="167.64" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="X1" gate="-3" pin="KL"/>
<pinref part="K4" gate="2" pin="S"/>
<wire x1="88.9" y1="-15.24" x2="99.06" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="99.06" y1="-15.24" x2="99.06" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="X2" gate="-3" pin="KL"/>
<pinref part="K3" gate="2" pin="S"/>
<wire x1="88.9" y1="-30.48" x2="99.06" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="99.06" y1="-30.48" x2="99.06" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="K1" gate="2" pin="S"/>
<wire x1="96.52" y1="-33.02" x2="99.06" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="X3" gate="-1" pin="KL"/>
<wire x1="88.9" y1="-35.56" x2="96.52" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="96.52" y1="-35.56" x2="96.52" y2="-33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="X4" gate="-2" pin="KL"/>
<pinref part="X3" gate="-2" pin="KL"/>
<wire x1="91.44" y1="-53.34" x2="91.44" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="91.44" y1="-55.88" x2="88.9" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="88.9" y1="-40.64" x2="91.44" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="91.44" y1="-40.64" x2="91.44" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="X2" gate="-2" pin="KL"/>
<wire x1="88.9" y1="-25.4" x2="91.44" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="91.44" y1="-25.4" x2="91.44" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="X1" gate="-2" pin="KL"/>
<wire x1="91.44" y1="-10.16" x2="88.9" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="K4" gate="2" pin="P"/>
<pinref part="K3" gate="2" pin="P"/>
<wire x1="104.14" y1="-12.7" x2="104.14" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="K1" gate="2" pin="P"/>
<wire x1="104.14" y1="-25.4" x2="104.14" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="104.14" y1="-27.94" x2="104.14" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="K2" gate="2" pin="P"/>
<wire x1="104.14" y1="-40.64" x2="104.14" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="91.44" y1="-25.4" x2="104.14" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="SV1" gate="G$1" pin="2"/>
<wire x1="160.02" y1="12.7" x2="160.02" y2="5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D0"/>
<wire x1="160.02" y1="5.08" x2="157.48" y2="5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="175.26" y1="2.54" x2="157.48" y2="2.54" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D5"/>
<wire x1="175.26" y1="2.54" x2="175.26" y2="7.62" width="0.1524" layer="91"/>
<pinref part="SV2" gate="1" pin="3"/>
<wire x1="175.26" y1="7.62" x2="180.34" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D6"/>
<wire x1="157.48" y1="0" x2="167.64" y2="0" width="0.1524" layer="91"/>
<pinref part="SV2" gate="1" pin="2"/>
<wire x1="180.34" y1="10.16" x2="167.64" y2="10.16" width="0.1524" layer="91"/>
<wire x1="167.64" y1="10.16" x2="167.64" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D7"/>
<pinref part="Q1" gate="G$1" pin="G"/>
<wire x1="157.48" y1="-2.54" x2="198.12" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="198.12" y1="-2.54" x2="203.2" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D8"/>
<pinref part="Q2" gate="G$1" pin="G"/>
<wire x1="157.48" y1="-5.08" x2="195.58" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-5.08" x2="203.2" y2="-17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="X5" gate="-1" pin="KL"/>
<wire x1="220.98" y1="-2.54" x2="220.98" y2="0" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="D"/>
<wire x1="220.98" y1="0" x2="213.36" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="X5" gate="-2" pin="KL"/>
<wire x1="226.06" y1="-2.54" x2="226.06" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="D"/>
<wire x1="226.06" y1="-12.7" x2="213.36" y2="-12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="K4" gate="1" pin="2"/>
<wire x1="165.1" y1="-30.48" x2="165.1" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="O1"/>
<wire x1="165.1" y1="-22.86" x2="152.4" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="X4" gate="-1" pin="KL"/>
<wire x1="86.36" y1="-53.34" x2="86.36" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="K2" gate="2" pin="S"/>
<wire x1="86.36" y1="-50.8" x2="99.06" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="99.06" y1="-50.8" x2="99.06" y2="-45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="IC1" gate="A" pin="O2"/>
<pinref part="K3" gate="1" pin="1"/>
<wire x1="152.4" y1="-25.4" x2="170.18" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="202,1,127,-33.02,IC1,I5,,,,"/>
<approved hash="202,1,127,-35.56,IC1,I6,,,,"/>
<approved hash="202,1,127,-38.1,IC1,I7,,,,"/>
</errors>
</schematic>
</drawing>
</eagle>