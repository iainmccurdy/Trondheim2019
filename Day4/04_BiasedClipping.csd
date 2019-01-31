; Clipping with bias

<CsoundSynthesizer>

<CsInstruments>

0dbfs  = 1


; clipping a sound file
instr	1
 aL,aR			diskin2		"ClassicalGuitar.wav",1,0,1
 kGain			invalue		"Gain"
 kBias			invalue		"Bias"
 aL						clip					(aL+kBias)*kGain, 0, 1
 aR						clip					(aR+kBias)*kGain, 0, 1
 aL						dcblock2		aL
 aR						dcblock2		aR
 								outs					aL, aR
endin

; clipping a sine tone
instr		2
 kNote			rspline		24, 70, 0.2, 0.3
 kAmp				rspline		0, 1, 0.2, 0.3
 aSig				poscil			kAmp, cpsmidinn(kNote)
 kBias			invalue		"Bias"
 kGain			invalue		"Gain"	
 aSig				clip					(aSig+kBias) * kGain, 0, 1
 aSig				dcblock2		aSig
 								outs					aSig, aSig
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
 <bsbObject type="BSBHSlider" version="2">
  <objectName>Gain</objectName>
  <x>85</x>
  <y>32</y>
  <width>337</width>
  <height>27</height>
  <uuid>{f6a14b71-9293-4c01-8da9-03c819d3ca8c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>100.00000000</maximum>
  <value>35.95845697</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>185</x>
  <y>5</y>
  <width>118</width>
  <height>26</height>
  <uuid>{9f4805bb-2cd3-48b4-af3a-c39118dadcc0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Gain (Clipped)</label>
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
  <objectName>Gain</objectName>
  <x>4</x>
  <y>32</y>
  <width>80</width>
  <height>27</height>
  <uuid>{a6bbb7e0-43c6-4192-895c-002ca65420eb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>35.958</label>
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
 <bsbObject type="BSBHSlider" version="2">
  <objectName>Bias</objectName>
  <x>85</x>
  <y>92</y>
  <width>337</width>
  <height>27</height>
  <uuid>{5e597c10-9650-442a-9f34-ae597bef779b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-0.50000000</minimum>
  <maximum>0.50000000</maximum>
  <value>-0.09940653</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>185</x>
  <y>65</y>
  <width>118</width>
  <height>26</height>
  <uuid>{e77c3419-11bb-430f-b9b8-f589d3ea7ce0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Bias</label>
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
  <objectName>Bias</objectName>
  <x>4</x>
  <y>92</y>
  <width>80</width>
  <height>27</height>
  <uuid>{a862b8a0-afe5-46ea-b256-02e8448feeb8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>-0.099</label>
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
