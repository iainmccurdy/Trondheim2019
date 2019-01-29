;  Env    CF=6000   CF=12000
;   |       |         |
; Noise--->HPF------>LPF------>Out

<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1.0

instr		1
aEnv  expseg  0.4, 0.014, 1, 0.106, 0.001 ; amplitude envelope
aSig  noise   aEnv, 0                     ; noise generator (note amplitude envelope control the first input argument) 
aSig  buthp   aSig, 6000                  ; highpass filter the sound
aSig  butlp   aSig, 12000	                 ; lowpass filter the sound
      outs    aSig, aSig                  ; send the filtered sound to the output
endin

</CsInstruments>

<CsScore>
i 1 0 0.12  ; play a note of duration according to the instructions
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
