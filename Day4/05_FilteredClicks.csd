; bandpass filtering click impulses

<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

nchnls = 1
0dbfs = 1

instr	1
 kGap								rspline		0.005, 0.2, 0.2, 0.4		; gap between clicks
 aImp								mpulse			0.6, kGap														; create click impulses
 kCF									rspline		6, 13, 0.1, 0.3							; cutoff frequency
 kBandWidth		invalue		"Bandwidth"												; filter bandwidth
 aImp								reson				aImp, cpsoct(kCF), cpsoct(kCF)*kBandWidth, 2	; filter clicks
													outs					aImp, aImp
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>Bandwidth</objectName>
  <x>8</x>
  <y>36</y>
  <width>80</width>
  <height>80</height>
  <uuid>{98e62d92-c9a1-4ecd-9827-ff14c07947bf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.30700000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>8</x>
  <y>11</y>
  <width>80</width>
  <height>25</height>
  <uuid>{bda8245a-64d3-4c8a-b055-77bb689f0005}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Bandwidth</label>
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
  <objectName>Bandwidth</objectName>
  <x>8</x>
  <y>116</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8cb1fbce-24a0-4867-aa25-bd6fdfc72103}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.307</label>
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
