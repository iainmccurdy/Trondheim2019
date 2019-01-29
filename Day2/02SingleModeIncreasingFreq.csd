; single mode filter

; as frequency increaess the sustain time reduces proportionally
 
<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>


<CsInstruments>

0dbfs = 1

instr      1
icps      =         p4             ; read in midi notes from score
iQ        =         p5             ; Q from score (should be greater than 1 and can be very large
iAmp      =         0.3            ; Amplitude control
aImp      mpulse    1, 0           ; a single sample impulse
aSig      mode      aImp,icps,iQ   ; mode filter the impulse
          out       aSig * iAmp
endin

</CsInstruments>

<CsScore>
i 1 0     10 5000 300
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  <   .
i 1 ^+0.3 .  100 .
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
