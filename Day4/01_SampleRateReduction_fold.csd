; Using the 'fold' opcode to emulate sample rate reduction.

<CsoundSynthesizer>

<CsInstruments>

nchnls = 1
0dbfs  = 1

; fold applied to a sound file read in using diskin2
instr  1
 aL,aR		diskin2		"ClassicalGuitar.wav", 1, 0, 1
 kIncr		invalue		"Incr"
 aL					fold					aL, kIncr^2
 aR					fold					aR, kIncr^2
 							outs					aL, aR
endin

; this time a sample is played as an oscillator using poscil
giloop		ftgen				0, 0, 0, 1, "loop.wav", 0, 0, 1
instr  2
 aL					poscil			1, 1/5, giloop		
 kIncr		randomi		1, 15, 1/5, 1
 aL					fold					aL, kIncr^2
 							outs					aL, aL
endin


instr  3
 kNote		rspline	36, 80, 0.5, 1
 aSig			poscil		0.3, cpsmidinn(kNote)
 kIncr		invalue	"Incr"
 aSig			fold				aSig, kIncr^2 
 							out					aSig/10
endin


instr	4
 kTrig		metro		2
 schedkwhen	kTrig,0,0,5,0,2
endin

instr	5
 aSig			vco2				1, 300, 2, 0.5
 aEnv			expon			1, 0.2, 0.01
 aSig			*=						aEnv
 kIncr		invalue	"Incr"
 aSig			fold				aSig, kIncr^2
 aSig			butlp			aSig, 5000
 							out					aSig / 10
endin

</CsInstruments>

<CsScore>
;i 1 0 360
;i 2 0 360
;i 3 0 360
i 4 0 30
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
 <bsbObject type="BSBHSlider" version="2">
  <objectName>Incr</objectName>
  <x>95</x>
  <y>36</y>
  <width>337</width>
  <height>27</height>
  <uuid>{7f6a679e-b90c-464a-ae3e-2b9e1979f6b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>16.00000000</maximum>
  <value>3.62611276</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>195</x>
  <y>9</y>
  <width>118</width>
  <height>26</height>
  <uuid>{7e87151c-770b-435c-aa16-4fef5e4b8db1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Increment</label>
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
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Incr</objectName>
  <x>14</x>
  <y>36</y>
  <width>80</width>
  <height>27</height>
  <uuid>{7bd903c2-dd54-445a-84b5-e9e3efa0d076}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>3.626</label>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
