; using feedback with 'streson'

<CsoundSynthesizer>

<CsInstruments>

0dbfs  = 1

instr  1
 ; create some input noise
 aImp			dust2				1, 10																														; generate some noise
 aImp			butlp				aImp, 1000																										; lowpass filter the noise

 ; create a resonanting string
 aSig			init					0																																			; initialise the feedback signal
 iFreq		=								p4																																		; define the frequency of the 'string'
 aSig			streson		aImp+aSig*0.3, 50, 0.9													; synthesise a 'string'

 ; apply filters
 kCF				rspline		4,11,0.4,0.8																								
 aSig			butbp				aSig, cpsoct(kCF), cpsoct(kCF)*5
 
 ; add a delay (position/distance from amplifier)
 aDel			rspline		0.01,0.03, 0.01, 0.02
 aSig			flanger		aSig, aDel, 0, 1

 ; clip the signal in case it overloads
 aSig			clip					aSig, 0, 0.5
 aSig			dcblock2	aSig
 
 							out						aSig
endin

</CsInstruments>

<CsScore>
i 1 0 300 50
</CsScore>

</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>432</width>
 <height>327</height>
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
