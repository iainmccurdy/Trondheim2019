; Hiss, crackle and pop

; Filtering clicks (dust of varying densities)

<CsoundSynthesizer>

<CsInstruments>


nchnls = 2
0dbfs  = 1


instr  1 
 ; hiss
 iDensityH							=								7000
 aHiss											dust2				0.01, iDensityH
 aHiss											buthp				aHiss, 5000																							; highpass filter the dust
 aHiss											butlp				aHiss, 9000																							; lowpass filter the dust
 kHissAmp								invalue		"HissAmp"
	 															outs					aHiss*kHissAmp, aHiss*kHissAmp

; crackle
 iDensityC						=									100
 aCrkl										dust2					0.04, iDensityC
 kCF												randomh			5, 13, iDensityC
 aCrkl										butlp					aCrkl, cpsoct(kCF)															; lowpass filter the crackles
 kPan											randomh			0, 1, iDensityC																		; sample and hold random function
 aCrklL,aCrklR	pan2						aCrkl, a(kPan)
 kCrklAmp							invalue		"CrklAmp"
	 														outs						aCrklL*kCrklAmp, aCrklR*kCrklAmp

; pops
 iDensityP							=									30
 aPop											dust2					0.1, iDensityP
 kCF												randomh			5, 13, iDensityP
 aPop											butbp					aPop, a(cpsoct(kCF)), a(cpsoct(kCF)*0.4)
 kPan											randomh			0, 1, iDensityP
 aPopL,aPopR				pan2						aPop, a(kPan)
 kPopAmp								invalue			"PopAmp"
	 														outs						aPopL*kPopAmp, aPopR*kPopAmp
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>HissAmp</objectName>
  <x>8</x>
  <y>66</y>
  <width>80</width>
  <height>80</height>
  <uuid>{98e62d92-c9a1-4ecd-9827-ff14c07947bf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>8</x>
  <y>41</y>
  <width>80</width>
  <height>25</height>
  <uuid>{bda8245a-64d3-4c8a-b055-77bb689f0005}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Hiss</label>
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
  <objectName>HissAmp</objectName>
  <x>8</x>
  <y>146</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8cb1fbce-24a0-4867-aa25-bd6fdfc72103}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>1.000</label>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>CrklAmp</objectName>
  <x>91</x>
  <y>66</y>
  <width>80</width>
  <height>80</height>
  <uuid>{5a66c01b-336f-4727-9c62-523962fdaadd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>91</x>
  <y>41</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0350f331-93d5-4806-861d-3ab9082fb651}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Crackle</label>
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
  <objectName>CrklAmp</objectName>
  <x>91</x>
  <y>146</y>
  <width>80</width>
  <height>25</height>
  <uuid>{24dd5c5e-1ccc-41a6-a3aa-b69d9c017688}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>1.000</label>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>PopAmp</objectName>
  <x>174</x>
  <y>66</y>
  <width>80</width>
  <height>80</height>
  <uuid>{33149272-c8bc-48fa-ad7f-91c992cd0c06}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>174</x>
  <y>41</y>
  <width>80</width>
  <height>25</height>
  <uuid>{d886ea61-fd29-4c78-ad8c-86575b9f70cf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Pop</label>
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
  <objectName>PopAmp</objectName>
  <x>175</x>
  <y>146</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8d83f807-b7ad-4c1e-a2c9-2b403763eee6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>1.000</label>
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
  <x>8</x>
  <y>12</y>
  <width>247</width>
  <height>25</height>
  <uuid>{e0628e73-6552-4b4d-bad6-48c60d0d7759}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>MIXER</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>224</r>
   <g>255</g>
   <b>10</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
