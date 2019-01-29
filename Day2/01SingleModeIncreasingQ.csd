; single mode filter

; When Q is very low, we mostly hear the click.
; As Q is increased we increasingly hear the resonance of the filter and the note duration increases.

; The frequency limit for 'mode' is sr/pi.
; At sr = 44100 this will be 14037 Hz.

; In older versions of Csound, exceeding this limit would cause the filter to explode with a loud 'click'
; but since version 6.12 Csound will protect against this and simply silence the filter's output.

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
i 1 0     10 200 1
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 <
i 1 ^+0.3 .  200 500
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
