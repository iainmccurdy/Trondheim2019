; oscbnk (oscillator bank) creates multiple layers of oscillators 
;   with modulation of amplitude, frequency, phase and EQ to create a dense texture.

; we can still use GEN10 function tables (or any other similar table).

; This is quite a complex opcode so the recommendation is that you start
;  by just playing with the four controls at the top of instr 1.


<CsoundSynthesizer>

<CsOptions>
-odac -dm0
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1
seed 0

; 
giWfm    ftgen   0, 0, 4096, 10, 1, 0, 0.2, 0.3, 0, 0.2, 0.1, 0.4, 0.2, 0.1, 0.05, 0.01

gicos    ftgen   0, 0, 4096, 11 ,1          ; COSINE WAVE (USED BY THE LFOS)
gieqffn  ftgen   0, 0, 4097, 7, -1, 4096, 1 ; EQ frequency
gieqlfn  ftgen   0, 0, 4097, 7, -1, 4096, 1 ; EQ level
gieqqfn  ftgen   0, 0, 4097, 7, -1, 4096, 1 ; EQ 'Q' (resonance, bandwidth etc.)

instr   1

iNote  random  48, 72

iCount = 0
while iCount<10 do
event_i "i", p1+1, 0, 3600, iCount, iNote
iCount += 1
od

gkCFoct   rspline 6, 13, 0.1, 0.2   ; filter cutoff is controlled from the global instrument
gkSpread  rspline 0,  1, 0.1, 0.3   ; detuning spread is controlled from the global instrument

endin
;
instr   2

kNote  =  p5 * semitone(gauss:i(1)*gkSpread)


;START BY PLAYING WITH THE FOLLOWING THREE CONTROLS==============================
iNVoices =       15                 ; number of voices
kfmd     =       0.006             ; amount of frequency modulation in each 
kl1maxf  =       0.1               ; maximum rate of modulation for LFO 1
kfn      =       giWfm             ; the waveform for the oscillator bank
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
aSigL    oscbnk  cpsmidinn(kNote), kamd, kfmd*cpsmidinn(kNote), kpmd, iNVoices, iseedL, kl1minf, kl1maxf, kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, keqminq, keqmaxq, ieqmode, kfn, gicos, gicos, gieqffn, gieqlfn, gieqqfn
aSigR    oscbnk  cpsmidinn(kNote), kamd, kfmd*cpsmidinn(kNote), kpmd, iNVoices, iseedR, kl1minf, kl1maxf, kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, keqminq, keqmaxq, ieqmode, kfn, gicos, gicos, gieqffn, gieqlfn, gieqqfn

aSigL    moogladder   aSigL, cpsoct(gkCFoct), 0.4
aSigR    moogladder   aSigR, cpsoct(gkCFoct), 0.4

 
aEnv     linsegr 0, 1, 1, 1.5, 0 ; amplitude envelope

; notice that because oscbnk does not have its own amplitude control so we must rescale the amplitude afterwards, here as it is sent to the output.
iAmp     =       0.01
         outs    aSigL * iAmp * aEnv, aSigR * iAmp * aEnv
endin

</CsInstruments>

<CsScore>
; p1 p2 p3
i 1  0  3600
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
