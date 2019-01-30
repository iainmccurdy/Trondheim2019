; replacing poscil's default sine wave with our own waveform created using GEN10

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

;                                 partials ...
giWfm    ftgen   0, 0, 4096, 10,  1, 0, 0.2, 0.3, 0, 0.2, 0.1, 0.4, 0.2, 0.1, 0.05, 0.01

instr   1
aEnv     linsegr 0, 1, 1, 1.5, 0 ; amplitude envelope

aSig     poscil  aEnv*0.1, cpsmidinn(p4), giWfm

         outs    aSig, aSig
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
