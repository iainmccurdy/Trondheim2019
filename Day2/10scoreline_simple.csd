; scoreline_i allows us to create a list of score event within an instrument 
;  that will then be triggered if the instrument that contains the notes is called from the Csound score.

<CsoundSynthesizer>

<CsInstruments>

0dbfs   = 1

instr   1
; create some score events at i-time
scoreline_i {{
i 2 0    1 60
i 2 0.25 1 64
i 2 0.5  1 67
i 2 0.75 1 72
}}
endin



instr   2
aEnv1   expon     1, p3*0.05, 0.001              ; percussive envelope
a1      poscil    aEnv1*0.2, cpsmidinn(p4)*2.71  ; a sine oscillator
aEnv2   expon     1, p3, 0.001                   ; percussive envelope
a2      poscil    aEnv2*0.2, cpsmidinn(p4)       ; a sine oscillator
aSig    =         a1 + a2
        out       aSig
endin

</CsInstruments>

<CsScore>
i 1 0 0       ; play the arpeggio
i 1 4 0       ; play the arpeggio again
f 0 40        ; we need some sort of a 'dummy' score event to prevent Csound from quitting before all notes of the arpeggio have been played
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
