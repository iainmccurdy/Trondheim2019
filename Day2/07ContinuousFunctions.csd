; random spline functions control:
; - rate of metronome
; - fundamental frequency (pitch) of the mode synthesiser
; - amplitude of the mode synthesiser

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1                                                                                                                
ksmps = 1


instr   1
kRate   rspline 0.5, 16, 0.2, 0.4    ; a random spline function is used to control the rate of the metronome
kTrig   metro   kRate                ; create a metronome
kFreq   rspline 100, 1000, 0.2, 0.4  ; a random spline generates the fundamental frequency of the mode synthesiser
kAmp    rspline 0, 1, 0.2, 0.4       ; a random spline generates the amplitude (velocity) of the mode synthesiser

;                                
        schedkwhen  kTrig, 0, 0, 2, 0, 1, kFreq, kAmp, 100
endin


instr      2
kFreq      init      p4 
iAmp       =         p5                                  ; read note velocity
kQ         =         p6                                  ; Q from GUI widget
kQRel      expsegr   1, 0.0002, 0.005         
aImp       mpulse    1, 0                                ; a single sample impulse
iCFoct     =         (iAmp*5) + 7                        ; create an value for the filter cutoff (oct format)
aImp       butlp     aImp, cpsoct(iCFoct)                ; lowpass filter the impulse

a1         mode      aImp, kFreq * 1,        kQ * kQRel   ; modes...
a2         mode      aImp, kFreq * 2.77828,  kQ * kQRel
a3         mode      aImp, kFreq * 5.18099,  kQ * kQRel
a4         mode      aImp, kFreq * 8.16289,  kQ * kQRel
a5         mode      aImp, kFreq * 11.66063, kQ * kQRel
a6         mode      aImp, kFreq * 15.63801, kQ * kQRel
a7         mode      aImp, kFreq * 19.99,    kQ * kQRel
aMix       sum       a1, a2, a3, a4, a5, a6, a7          ; mix modes
aEnv       expsegr   1, 0.5, 0.001
           outs      aMix * 0.1 * aEnv, aMix * 0.1 * aEnv; scale and send to output
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
