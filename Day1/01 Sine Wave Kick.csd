; Using envelopes to create a simple Roland TR-808 kick drum

<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

0dbfs   =  	1

instr 1
aFreq   expseg   500, 0.02, 60, 0.5, 30  ; frequency glissando 
aEnv    expon    1,   p3, 0.001          ; amplitude envelope
aSig    poscil   aEnv, aFreq             ; oscillator
        out      aSig * 0.4
endin

</CsInstruments>

<CsScore>
t 0 120
; ^+ is a shortcut used to increment the start time of a note, independent of its duration.
i 1 0      5
i 1 ^+0.5  .
i 1 ^+0.5  .
i 1 ^+0.5  .
i 1 ^+0.25 .
i 1 ^+0.25 .
i 1 ^+0.5  .
i 1 ^+0.5  .
i 1 ^+0.5  .
</CsScore>

</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>345</width>
 <height>142</height>
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
