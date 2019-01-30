; Using our looping mechanism from before we can trigger a cluster of sustained notes from instr 1.
; To make this sound more interesting, we should add some randomisation in instr 2.

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
iCount  =   0
while (iCount < 10) do
event_i "i", p1+1, 0, p3, p4
iCount  +=  1
od
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
;p4 = note number
; p1 p2 p3 p4
i 1  0  15 60
i 1  1  14 48
i 1  2  13 36
i 1  3  12 53
i 1  4  11 58
i 1  5  10 65
i 1  5  9  72
i 1  6  8  24
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
