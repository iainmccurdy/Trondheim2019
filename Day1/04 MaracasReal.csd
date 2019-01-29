; real maracas sound

;  Dens Amp                  CF
;    |  |                    |
;    v  v                    v   
;    DUST --> HIGHPASS -> LOWPASS -> BANDPASS -> OUT
;             (buthp)     (butlp)    (reson)


<CsoundSynthesizer>

<CsInstruments>

nchnls = 2
0dbfs = 1.0

instr  1
iVelocity =       p4                                      ; velocity with which the maraca is shaken
iAttack   =       0.06                                    ; attack time: time it takes to build up to the maximum number of beans bouncing around within the maraca shell
kEnv      expseg  0.4, iAttack, 1,  p3-iAttack, 0.001     ; amplitude envelope
kDens     expseg  10, iAttack, 8000, p3-iAttack, 1        ; dust density envelope
kAmp      exprand 0.9                                     ; random amplitude for each grain of 'dust'
aNoise    dust2   kEnv * kAmp, kDens                      ; create dust
aNoise    buthp   aNoise, 4000                            ; highpass filter dust
kCF       expseg  200, iAttack, 12000*p4, p3-iAttack, 200 ; cutoff frequency of lowpass filter
aNoise    butlp   aNoise, kCF                             ; lowpass filter
aNoise    reson   aNoise, 8000, 2000, 1                   ; resonator (bandpass) filter 
          outs    aNoise * iVelocity  , aNoise * iVelocity ; send audio to output and apply velocity
endin

</CsInstruments>

<CsScore>
i 1 0     1.2   1
i 1 ^+0.4 .   0.7
i 1 ^+0.4 .   0.9
i 1 ^+0.4 .   0.6
i 1 ^+0.4 .     1
i 1 ^+0.4 .   0.7
i 1 ^+0.4 .   0.9
i 1 ^+0.4 3   0.7
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
