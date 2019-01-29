; Marimba Note

;   Env1
;    |
; Sine_1(131)-----+
;                 |
;   Env2          |
;    |            |
; Sine_2(526)-----+
;                 |
;   Env3          |
;    |            |
; Sine_3(1053)----+
;                 |
;   Env4          +--->Out
;    |            |
; Sine_4(2259)----+
;                 |
;   Env5          |
;    |            |
; Sine_5(3490)----+
;                 |
;   Env6          |
;    |            |
; Sine_6(4759)----+
 
<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

instr 1
kEnv1 line    -5, 1, -35                  ; envelope 1
a1    poscil  ampdbfs(kEnv1), 131         ; oscillator (partial) 1
kEnv2 line    -16, 1, -86                 ; etc...
a2    poscil  ampdbfs(kEnv2), 526
kEnv3 line    -26, 1, -176
a3    poscil  ampdbfs(kEnv3), 1053
kEnv4 line    -50, 1, -550
a4    poscil  ampdbfs(kEnv4), 2259
kEnv5 line    -50, 1, -750
a5    poscil  ampdbfs(kEnv5), 3490
kEnv6 line    -50, 1, -950
a6    poscil  ampdbfs(kEnv6), 4759
aMix  =       a1 + a2 + a3 + a4 + a5 + a6 ; mix the five oscillators (partials)
      outs    aMix, aMix
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
