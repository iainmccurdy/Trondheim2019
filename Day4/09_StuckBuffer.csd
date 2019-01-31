; Stuck buffer

<CsoundSynthesizer>

<CsInstruments>

0dbfs = 1
nchnls = 2

instr		1
 ; read the widget button
 kStuck							invalue	"Stuck"
 
 ; create a source signal (could also be live input)
 aSigL,aSigR		diskin		"ClassicalGuitar.wav", 1, 0, 1
 aSigL								*=						1-kStuck			; note that logic of the widget button is inverted
 aSigR								*=						1-kStuck
 
 ; stuck buffer delay
 kBufferDur			invalue	"BufferDur"																					; read in slider

 kBufferDur			port				kBufferDur, 0.1


 aBufL								flanger	aSigL, a(kBufferDur), kStuck		; delay (left channel)
 aBufR								flanger	aSigR, a(kBufferDur), kStuck
 aBufL								*=						kStuck		; this time logic of widget button is normal
 aBufR								*=						kStuck
 
 ; mix the dry signal and the stuck buffer signal at the output
 												out					aSigL+aBufL, aSigR+aBufR
endin

</CsInstruments>

<CsScore>
i 1 0 3600
</CsScore>

</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>BufferDur</objectName>
  <x>33</x>
  <y>48</y>
  <width>24</width>
  <height>283</height>
  <uuid>{55e68879-f465-4457-bfdf-e10cf8028a26}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.14332155</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>BufferDur</objectName>
  <x>13</x>
  <y>332</y>
  <width>70</width>
  <height>26</height>
  <uuid>{bcb65514-6c20-4ddf-a41a-eb9ef9dc68be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.143</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>10</x>
  <y>6</y>
  <width>77</width>
  <height>42</height>
  <uuid>{d5341d72-56f8-442c-aa01-7cbea3dff3f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Buffer
Duration</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Stuck</objectName>
  <x>92</x>
  <y>62</y>
  <width>131</width>
  <height>31</height>
  <uuid>{76e6b3d1-2015-4744-bdc7-309b09adc6e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>STUCK BUFFER</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
