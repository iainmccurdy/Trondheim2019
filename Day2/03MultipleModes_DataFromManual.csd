; as velocity increases the cutoff frequency of the lowpas filter cutoff applied to the impulse rises

<CsoundSynthesizer>

<CsOptions>

</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1                                                                                                                
ksmps = 1

instr      1
icps       =         p4 
iAmp       =         p5                                  ; read note velocity
kQ         =         p6                                  ; Q from GUI widget
kQRel      expsegr   1, 0.0002, 0.005         
aImp       mpulse    1, 0                                ; a single sample impulse
iCFoct     =         (iAmp*5) + 7                        ; create an value for the filter cutoff (oct format)
aImp       butlp     aImp, cpsoct(iCFoct)                ; lowpass filter the impulse

a1         mode      aImp, icps * 1,        kQ * kQRel   ; modes...
a2         mode      aImp, icps * 2.77828,  kQ * kQRel
a3         mode      aImp, icps * 5.18099,  kQ * kQRel
a4         mode      aImp, icps * 8.16289,  kQ * kQRel
a5         mode      aImp, icps * 11.66063, kQ * kQRel
a6         mode      aImp, icps * 15.63801, kQ * kQRel
a7         mode      aImp, icps * 19.99,    kQ * kQRel
aMix       sum       a1, a2, a3, a4, a5, a6, a7          ; mix modes
aEnv       expsegr   1, 0.5, 0.001
           outs      aMix * 0.1 * aEnv, aMix * 0.1 * aEnv; scale and send to output
endin

</CsInstruments>

<CsScore>
; p4 = freq
; p5 = vel
; p6 = Q
;          p4  p5  p6
i 1 0   20 200 0.1 3000
i 1 ^+1 20 200 <   3000
i 1 ^+1 20 200 <   3000
i 1 ^+1 20 200 <   3000
i 1 ^+1 20 200 1   3000
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
