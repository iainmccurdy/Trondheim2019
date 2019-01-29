; Using an array than describes the degrees of a scale

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>


<CsInstruments>

nchnls = 2
0dbfs = 1.0


instr  1
kTrig   metro      0.5                        ; a metronomic trigger - eight time a second

if (kTrig==1) then                            ; if a trigger is received...
 event "i", 2, 0, 1                           ; generate a note event
endif

endin


instr   2
iCounter            = 1                       ; a counter to keep track of loop interations 
iNumberOfIterations = 4                       ; define the number of loop iterations you need
while (iCounter<=iNumberOfIterations) do      ; as long as the counter is still less than or equal to the number of loop iterations needed, keep looping!
;               start          dur note           velocity (amp)
event_i "i", 3, exprand(0.02), 10, random(36,60), 0.3 + exprand(0.2) ; trigger a note event
iCounter += 1                                 ; increment the counter
od

endin

instr   3
iCPS  =        cpsmidinn(round(p4))                 ; frequency (pitch). Read from the score as a MIDI note and then converted to a frequency.
kAmp  =        p5                                   ; amplitude
iPlk  =        0.1                                  ; pluck position
kPick =        0.2                                  ; pick up position
kRefl =        0.75                                 ; amount of damping (0 to 1)
aSig  repluck  iPlk, kAmp, iCPS, kPick, kRefl, a(0) ; a 'pluck' physical model
aAtt  linseg   0, 0.005, 1                          ; attack envelope
aSig  =        aSig * aAtt
iPan  random   0, 1
aL,aR pan2     aSig, iPan
      outs     aL, aR
endin

</CsInstruments>


<CsScore>
i 1 0 60
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
