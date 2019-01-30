; repluck is a simple model of a plucked string

<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1

instr   1
iPlk  =        0.5                                ; pluck position (0 to 1)
kAmp  =        0.2                                ; amplitude (0 to 1)
iCPS  =        220                                ; frequency
kPick =        0.1                                ; pick up position
kRefl =        0.2                                ; amount of damping (0 to 1) - low values for more sustain, high values less sustain
aSig  repluck  iPlk, kAmp, iCPS, kPick, kRefl, a(0)
aEnv  expsegr  0.001, 0.003, 1, 0.1, 0.001        ; repluck tends to produce a hard click at the beginning. An envelope can be used to control this.
aSig  *=       aEnv
      outs     aSig, aSig
      
endin

</CsInstruments>

<CsScore>
;p4 = note number
; p1 p2 p3 p4
i 1  0  15 60
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
