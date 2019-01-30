; We can make this a MIDI compatible instrument but we need to remember that p3 for MIDI activated notes will be -1.
; We can instead trigger the layers with very long note durations and then sense the note release and turn the layers off separately.

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

;                      size      
giWfm    ftgen   0, 0, 0,    1, "ClarinetA3SingleCycle.wav", 0, 0, 1

instr   1
iNum    notnum                                ; read in MIDI note number
iCount  =   0
while (iCount < 10) do
event_i "i", p1+1 + iNum*0.001, 0, 3600, iNum ; turn on layers with fractional note numbers that will relate to the note played
iCount  +=  1
od

; sense note release
kRel    release                               ; kRel=zero while note is held, 1 when it is released
if (kRel == 1) then
 turnoff2 p1+1 + iNum*0.001, 4, 1             ; turn off fractional note number. This allows us to play a chord and to release each note at a different time.
endif

endin

instr   2
aEnv     linsegr 0, 1, 1, 1.5, 0 ; amplitude envelope

; each layer will have some random detuning...
iDetune  gauss   1               ; gaussian random distribution 
aL       poscil  aEnv*0.1, cpsmidinn(p4+iDetune), giWfm

; repeated for the left channel. The random number generator will produce a different result
iDetune  gauss   1               ; gaussian random distribution 
aR       poscil  aEnv*0.1, cpsmidinn(p4+iDetune), giWfm

         outs    aL, aR
endin

</CsInstruments>

<CsScore>
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
