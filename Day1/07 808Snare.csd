;  Env1
;   |
; sine(176)------------+
;                      |
;  Env2                +--->out
;   |                  |
; noise----HPF----LFP--+

<CsoundSynthesizer>

<CsInstruments>

0dbfs = 1.0

instr		1
aPEnv				expseg	 	0.3, p3, 0.000015 ; amplitude envelope for the sine oscillator
aPSig				poscil	 	aPEnv, 176        ; sine wave oscillator - the resonance of the snare drum
aNEnv				expon		 	1.3, p3, 0.00013  ; amplitude envelope for the white noise generator
aNSig				noise		 	aNEnv, 0          ; white noise generator
aNSig				buthp		 	aNSig, 2500	       ; highpass filter the white noise
aNSig				butlp		 	aNSig, 5000       ; lowpass filter the white noise
									out				 	aPSig + aNSig     ; mix the two part of sound and send to the (mono) output
endin

</CsInstruments>

<CsScore>
i 1 0 0.3
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
