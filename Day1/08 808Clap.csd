; 808 Clap

<CsoundSynthesizer>

<CsInstruments>

0dbfs = 1.0

instr  1
;               1st             2nd             3rd                4th
kEnv   expseg   1,0.01,0.01, 0, 1,0.01,0.01, 0, 1,0.01,0.01, 0, 1, p3-(0.03), 0.00001 ; amplitude envelope with 3 short percussive impulses and a 4th longer impulse
aNoise noise    kEnv, 0                                                               ; generate some noise
kCF    expseg   5000, 0.03, 5000, 0.07, 1700, 1, 800, 2, 500, 1, 500                  ; an envelope shapes the lowpass filter cutoff
aFilt  butlp    aNoise, kCF               ; lowpass filter the noise (decaying cutoff frequency)
aFilt  buthp    aFilt, 1000               ; highpass filter the noise
aRes   butbp    aFilt, 900, 600           ; bandpass filter the noise
aFilt  =        aFilt + (aRes*6)
       out      aFilt * 0.8
endin

</CsInstruments>

<CsScore>
i 1 0.1 0.9
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
