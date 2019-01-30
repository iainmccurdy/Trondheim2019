; plays a glissando of notes from a score note

<CsoundSynthesizer>

<CsOptions>
-odac -dm0 -+rtmidi=portmidi -M0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

seed 0

instr   1
iPlk  =        0.1
iAmp  =        p5        ; random amplitude
iNote =        p4
iCPS  =        cpsmidinn(iNote)
kPick =        0.2
kRefl =        0.2
aSig  repluck  iPlk, iAmp*0.2, iCPS, kPick, kRefl, a(0)
aEnv  expsegr  0.001,0.001,1,20,0.0001,0.1,0.0001
aSig  *=       aEnv
      outs     aSig, aSig

if iAmp>0.1 then ; limit the number if repeats
      event_i  "i", 1, p6, p3, iNote+1, p5*0.8, p6*1.1  ; call the note again
endif

endin

</CsInstruments>

<CsScore>
; p4 = starting note
; p5 = starting amplitude
; p6 = starting note gap
; p1 p2   p3 p4 p5 p6
i 1  0    8  48 1  0.05

f 0 3600
</CsScore>

</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
