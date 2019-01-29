<CsoundSynthesizer>

<CsInstruments>

0dbfs = 1.0

instr		1
	aEnv1		expseg		1, 0.02, 0.6, p3-0.02, 0.0001
	a1					vco2			 0.6, 296, 2, 0.25
	a2					vco2			 0.6, 285, 2, 0.25
	a3					vco2			 0.6, 365, 2, 0.25
	a4					vco2			 0.6, 348, 2, 0.25
	a5					vco2			 0.6, 420, 2, 0.25                                                                   
	a6					vco2			 0.6, 835, 2, 0.25
	aMix			sum				 a1, a2, a3, a4, a5, a6
	aMix			reson		 aMix, 5000,5000,1
	aMix			buthp		 aMix, 10000
	aMix			butlp		 aMix, 11000
	aNoise	noise		 0.5, 0
	aEnv2		expseg	 1, 0.05, 0.3, p3-0.05, 0.0001
	kCF				expseg	 12000, 0.7, 5000, p3-0.1, 3000
	aNoise	butlp			aNoise, kCF
	aNoise	buthp			aNoise, 8000
	aMix			=							(aMix*aEnv1) + (aNoise*aEnv2)
							out					aMix
endin


</CsInstruments>


<CsScore>
i 1 0 2
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
