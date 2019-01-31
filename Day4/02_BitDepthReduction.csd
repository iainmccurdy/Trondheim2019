; Emulating bit depth reduction

; Use in CsoundQt and open the widgets panel.

<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

instr  1
kNote				rspline		0, 60, 0.2, 0.3
aSig					poscil			1, cpsmidinn(kNote)
kBits  		invalue		"BitDepth"
kBits				port					kBits, 0.2				
kVals  		=  						2 ^ kBits																			; define number of values for selected bit depth
kAmp   		=  						kVals / 2																			; halve the number of value to derive amplitude range
aSig   		=  						round(aSig * kAmp) / kAmp	; scale signal up in amplitude, round values to the nearest integer and then rescale back down again
									outs					aSig/3, aSig/3
endin

</CsInstruments>

<CsScore>
i 1 0 360
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
 <bsbObject version="2" type="BSBHSlider">
  <objectName>BitDepth</objectName>
  <x>96</x>
  <y>36</y>
  <width>337</width>
  <height>27</height>
  <uuid>{7f6a679e-b90c-464a-ae3e-2b9e1979f6b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>16.00000000</maximum>
  <value>1.17804154</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>196</x>
  <y>9</y>
  <width>118</width>
  <height>26</height>
  <uuid>{7e87151c-770b-435c-aa16-4fef5e4b8db1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Bit Depth</label>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>BitDepth</objectName>
  <x>14</x>
  <y>36</y>
  <width>80</width>
  <height>27</height>
  <uuid>{7bd903c2-dd54-445a-84b5-e9e3efa0d076}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>1.178</label>
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
