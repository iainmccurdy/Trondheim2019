; oscbnk (oscillator bank) creates multiple layers of oscillators 
;   with modulation of amplitude, frequency, phase and EQ to create a dense texture.

; we can still use GEN10 function tables (or any other similar table).

; This is quite a complex opcode so the recommendation is that you start (and maybe finish?)
;  by just playing with the four controls at the top of instr 1.
; If you find that this offers you sufficient options, you can just use the rest of the code as is.

<CsoundSynthesizer>

<CsInstruments>

nchnls = 2
0dbfs = 1

; 
giWfm    ftgen   0, 0, 4096, 10, 1, 0, 0.2, 0.3, 0, 0.2, 0.1, 0.4, 0.2, 0.1, 0.05, 0.01

gicos    ftgen   0, 0, 4096, 11 ,1          ; COSINE WAVE (USED BY THE LFOS)
gieqffn  ftgen   0, 0, 4097, 7, -1, 4096, 1 ; EQ frequency
gieqlfn  ftgen   0, 0, 4097, 7, -1, 4096, 1 ; EQ level
gieqqfn  ftgen   0, 0, 4097, 7, -1, 4096, 1 ; EQ 'Q' (resonance, bandwidth etc.)

instr   1

;START BY PLAYING WITH THE FOLLOWING THREE CONTROLS==============================
iNVoices =       20          ; number of voices
kfmd     =       0.01        ; amount of frequency modulation in each 
kl1maxf  =       0.1         ; maximum rate of modulation for LFO 1
kfn      =       giWfm       ; the waveform for the oscillator bank
;================================================================================

;ADDITIONAL PARAMETERS===========================================================
kamd     =       0      ; amount of amplitude modulation
kpmd     =       0      ; amount of phase modulation
iseedL   =       0      ; random generator seed (left channel)
iseedR   =       0      ; random generator seed (right channel)
kl1minf  =       0      ; minimum rate of  modulation for LFO 1
kl2minf  =       0      ; minimum rate of  modulation for LFO 2
kl2maxf  =       0      ; maximum rate of  modulation for LFO 2
ilfomode =       238    ; LFO patchbay (see opcode manual page)
keqminf  =       0      ; EQ min cutoff freq
keqmaxf  =       8000   ; EQ max cutoff freq
keqminl  =       1      ; EQ min output level
keqmaxl  =       1      ; EQ max output level
keqminq  =       1      ; EQ min Q (quality/resonance/bandwidth etc.)
keqmaxq  =       1      ; EQ max Q (quality/resonance/bandwidth etc.)
ieqmode  =       -1     ; EQ mode. -1=Off
;================================================================================

; I have used two oscbnks to create a stereo sound
aSigL    oscbnk  cpsmidinn(p4), kamd, kfmd*cpsmidinn(p4), kpmd, iNVoices, iseedL, kl1minf, kl1maxf, kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, keqminq, keqmaxq, ieqmode, kfn, gicos, gicos, gieqffn, gieqlfn, gieqqfn
aSigR    oscbnk  cpsmidinn(p4), kamd, kfmd*cpsmidinn(p4), kpmd, iNVoices, iseedR, kl1minf, kl1maxf, kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, keqminq, keqmaxq, ieqmode, kfn, gicos, gicos, gieqffn, gieqlfn, gieqqfn
 
aEnv     linsegr 0, 1, 1, 1.5, 0 ; amplitude envelope

; notice that because oscbnk does not have its own amplitude control so we must rescale the amplitude afterwards, here as it is sent to the output.
kAmp     =       0.04
         outs    aSigL * kAmp * aEnv, aSigR * kAmp * aEnv
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
