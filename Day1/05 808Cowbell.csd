; 808 Cowbell

<CsoundSynthesizer>

<CsInstruments>

0dbfs = 1.0

instr  1
kMetro     metro  p6, p7
schedkwhen kMetro, 0, 0, p4, 0, p5
endin


instr  2
aSqu1    vco2    1, 562, 2, 0.5                   ; create two square wave oscillators
aSqu2    vco2    1, 845, 2, 0.5
aSquMix  =       aSqu1 + aSqu2                    ; mix them together
aBPF     butbp   aSquMix, 845, 25                 ; create a bandpass filtered version of the mix
kEnv1    expseg  1, 0.015, 0.2, p3-0.015, 0.2     ; create envelope 1
aMix     =       (aBPF*kEnv1*4) + (aSquMix*0.04)  ; mix the bandpass filtered and unfiltered sound together
kEnv2    expseg  1, 0.05, 0.3, p3-0.05, 0.0001    ; create envelope 2
aMix     =       aMix * kEnv2                     ; apply envelope to the complete sound
         out     aMix                             ; send sound to output!
endin


instr		3
aEnv  expseg  0.4, 0.014, 1, 0.106, 0.001 ; amplitude envelope
aSig  noise   aEnv, 0                     ; noise generator (note amplitude envelope control the first input argument) 
aSig  buthp   aSig, 6000                  ; highpass filter the sound
aSig  butlp   aSig, 12000	                ; lowpass filter the sound
      out     aSig                        ; send the filtered sound to the output
endin



</CsInstruments>


<CsScore>

; p4 = instr
; p5 = dur
; p6 = tempo
; p7 = init phase

; p1 p2 p3 p4 p5   p6 p7
i 1  0  16 2  0.85 2  0
i 1  0  4  3  0.12 2  0.5
i 1  4  4  3  0.12 4  0
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
