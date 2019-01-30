; we can limit the length of the melody by passing a counter along the chain of notes

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

seed 0

giNotes[]  fillarray  48, 51, 53, 55, 58, 60, 63

giMelodyLen = 8  ; length of melody

instr   1
iPlk  =        0.1
kAmp  =        0.2 + exprand(0.1)        ; random amplitude
iNdx  =        p4
iNote =        giNotes[iNdx]
iCPS  =        cpsmidinn(iNote)
kPick =        0.2
kRefl =        0.2
aSig  repluck  iPlk, kAmp, iCPS, kPick, kRefl, a(0)
aEnv  expsegr  0.001,0.001,1,20,0.0001,0.1,0.0001
aSig  *=       aEnv
      outs     aSig, aSig



if (p5<giMelodyLen) then
 ; Call the instrument again, but with a new array index...
 iStep random   0, 1            ; random fraction between 0 and 1
 iStep =        round(iStep)    ; iStep will be either 0 or 1
 iStep =        (iStep * 2) - 1 ; iStep will be either -1 or 1
 iNdx  mirror   iNdx + iStep, 0, lenarray:i(giNotes) - 1  ; prevent out of range indexes 
       event_i  "i", 1, 0.2, 8, iNdx, p5+1  ; call the note again


endif

endin

</CsInstruments>

<CsScore>
; p4 = starting index
; p5 = step counter
; p1 p2     p3 p4 p5
i 1  0      8  0  1

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
