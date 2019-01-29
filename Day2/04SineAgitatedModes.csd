; Sine agitated mode filters

; This emulates the sound of a resonating body being bowed or rubbed depending on the nature of the randomisation of the tuning of the exciter signals (the sine waves).

; Exciting the resonators in this way will generate a very high and amplified output so a high degree of attenuation may be necessary.

<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

0dbfs   =   1                                                                                                                
ksmps   =   1

instr      1
 icps       =         p4 
 iAmp       =         p5                                  ; read note velocity
 iQ         =         p6                                  ; Q from GUI widget

 ; excitation signal: a bank of sine waves at close to the frequency of the resonators
 kdtn          jspline     0.1, 3, 10                             ; a randomised curve wobbles the tuning
 a1            poscil      0.1, semitone(kdtn) * icps * 1
 a2            poscil      0.1, semitone(kdtn) * icps * 2.77828
 a3            poscil      0.1, semitone(kdtn) * icps * 5.18099
 a4            poscil      0.1, semitone(kdtn) * icps * 8.16289
 a5            poscil      0.1, semitone(kdtn) * icps * 11.66063
 a6            poscil      0.1, semitone(kdtn) * icps * 15.63801
 a7            poscil      0.1, semitone(kdtn) * icps * 19.99
 aImp          sum         a1, a2, a3, a4, a5, a6, a7
 aImp          *=          0.1 * iAmp
 aEnv          linsegr     1, 0.1, 0
 aImp          *=          aEnv
                   
 ; resonators
 a1            mode        aImp, icps * 1,         iQ
 a2            mode        aImp, icps * 2.77828,   iQ
 a3            mode        aImp, icps * 5.18099,   iQ
 a4            mode        aImp, icps * 8.16289,   iQ
 a5            mode        aImp, icps * 11.66063,  iQ
 a6            mode        aImp, icps * 15.63801,  iQ
 a7            mode        aImp, icps * 19.99,     iQ
 aMix          sum         a1, a2, a3, a4, a5, a6, a7
 aEnv          linsegr     1, 5, 0
 aMix          *=          aEnv
 
               outs        aMix * 0.002, aMix * 0.002
endin

</CsInstruments>

<CsScore>
; p4 = freq
; p5 = vel
; p6 = Q
;          p4  p5  p6
i 1 0   20 200 1   3000
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
