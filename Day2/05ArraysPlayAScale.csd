; Using an array than describes the degrees of a scale

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>


<CsInstruments>

nchnls = 2
0dbfs = 1.0

; Create an array that contains note number of a major scale

;             index:0   1   2   3   4   5   6   7
giScale[] fillarray 60, 62, 64, 65, 67, 69, 71, 72

instr  1
kIndex  init       0                          ; index used to read values from the array
kTrig   metro      8                          ; a metronomic trigger - eight time a second

if (kTrig==1) then                            ; if a trigger is received...
 event "i", 2, 0, 1, kIndex                   ; generate a note event
 kIndex wrap kIndex + 1, 0, lenarray(giScale) ; increment the index, but wrap back to the beginning if we hit the end of the array
endif

endin

instr  2
iNote  =      giScale[p4]                     ; read the note from the array (the index has been passed from instr 1 using p4)
       print  iNote                           ; print the note value (just for checking)
aEnv   expon  1, p3, 0.001
aSig   poscil aEnv*0.2, cpsmidinn(iNote)
       outs   aSig, aSig
endin

</CsInstruments>


<CsScore>
i 1 0 10
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
