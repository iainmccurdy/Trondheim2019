; Generates 'gestures' of notes

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>


<CsInstruments>

nchnls = 2
0dbfs = 1.0

; Create an array that contains note numbers of a major scale
;             index:0   1   2   3   4   5   6   7
giScale[] fillarray 60, 62, 64, 65, 67, 69, 71, 72

instr  1
kIndex  init       0                 ; index used to read values from the array
kTrig   metro      0.3               ; a metronomic trigger - eight time a second
schedkwhen kTrig, 0, 0, 2, 0, 0      ; trigger instrument 2 once. Instr 2 contains only i-rate code so a note duration (p3) of zero is fone 
endin


instr 2
iCount = 0                            ; create a counter. It begins at zero
while (iCount < 10) do                ; while the counter is less than 10...
iNdx  random   0, lenarray:i(giScale) ; generate a random index between zero and the length of the array
;            p1 p2                p3  p4             p5
event_i "i", 3, (iCount*0.2)^1.2, 2, giScale[iNdx], 1-(iCount/9)  ; trigger a note. Read the note number from the array. Notes get slower. Gets quieter as the string of notes progresses.
iCount += 1                           ; increment counter
od
endin


instr  3
iAmp   =      p5 ^ 2
aEnv   expon  1, p3, 0.001
aSig   poscil aEnv*0.2*iAmp, cpsmidinn(p4)
       outs   aSig, aSig
endin

</CsInstruments>

<CsScore>
i 1 0 1000
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
