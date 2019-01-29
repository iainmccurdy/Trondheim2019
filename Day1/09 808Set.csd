; This example shows how to play a range of different instrument 
;       depending on what note is played.

; It does this through a series of 'if' interrogations which test which note on the keyboard has been played.

; This can be useful in designing multi-percussion instrument.
; In this example we can play our different TR-808 sound by playing either C4 D4 E4 F4 or G4 

<CsoundSynthesizer>

<CsInstruments>

0dbfs = 1.0

massign 0, 1 ; all MIDI playing triggers instr 1

instr 1
 iNote notnum               ; read in the note number played
 iAmp  ampmidi 1            ; read in the key velocity
 
 if iNote==60 then          ; if middle C4...
  event_i "i",11,0,1,iAmp   ; ...play kick drum
 endif                      ; end of 'if' conditional branch

 if iNote==62 then          ; if D4... 
  event_i "i",12,0,0.3,iAmp ; ...play snare
 endif

 if iNote==64 then          ; if E4...
  event_i "i",13,0,0.12,iAmp; ...play maracas
 endif

 if iNote==65 then          ; if F4... ...play clap
  event_i "i",14,0,0.9,iAmp ; ...play clap
 endif

 if iNote==67 then          ; if G4... 
  event_i "i",15,0,0.9,iAmp ; ...play cowbell
 endif

endin

instr 11 ; kick drum
aFreq 		expseg		500, 0.02, 60, 0.5, 30			; frequency glissando 
aEnv	 		 expon			1,   p3, 0.001										; amplitude envelope
aSig	 		 poscil			aEnv, aFreq												; oscillator
							out					aSig * 0.6 * p4
endin

instr		12 ; snare drum
aPEnv				expseg	 	0.3, p3, 0.000015    ; amplitude envelope for the sine oscillator
aPSig				poscil	 	aPEnv, 176           ; sine wave oscillator - the resonance of the snare drum
aNEnv				expon		 	1.3, p3, 0.00013     ; amplitude envelope for the white noise generator
aNSig				noise		 	aNEnv, 0             ; white noise generator
aNSig				buthp		 	aNSig, 2500	         ; highpass filter the white noise
aNSig				butlp		 	aNSig, 5000 * p4     ; lowpass filter the white noise
								out				 	(aPSig + aNSig) * p4 ; mix the two part of sound and send to the (mono) output
endin

instr		13 ; maracas
aEnv			 expseg		 0.4, 0.014, 1, 0.106, 0.001 ; amplitude envelope
anoise		noise			aEnv, 0                     ; noise generator (note amplitude envelope control the first input argument) 
anoise		buthp			anoise, 6000                ; highpass filter the sound
anoise		butlp			anoise, 12000 * p4	         ; lowpass filter the sound
						 	out				 anoise * p4                 ; send the filtered sound to the output
endin

instr  14 ; clap
idens  =        8000
;               1st             2nd             3rd                4th
kenv   expseg   1,0.01,0.01, 0, 1,0.01,0.01, 0, 1,0.01,0.01, 0, 1, p3-(0.03), 0.00001 ; amplitude envelope with 3 short percussive impulses and a 4th longer impulse
anoise noise    kenv, 0                                                               ; generate some noise
kcf    expseg   5000, 0.03, 5000, 0.07, 1700, 1, 800, 2, 500, 1, 500                  ; an envelope shapes the lowpass filter cutoff
asig   butlp    anoise, kcf               ; lowpass filter the noise (decaying cutoff frequency)
asig   buthp    asig, 1000                ; highpass filter the noise
ares   butbp    asig, 900, 600            ; bandpass filter the noise
asig   =        asig + (ares*6)
       out      asig * p4
endin

instr  15 ; cowbell
aSqu1    vco2    1, 562, 2, 0.5                   ; create two square wave oscillators
aSqu2    vco2    1, 845, 2, 0.5
aSquMix  =       aSqu1 + aSqu2                    ; mix them together
aBPF     butbp   aSquMix, 845, 25                 ; create a bandpass filtered version of the mix
kEnv1    expseg  1, 0.015, 0.2, p3-0.015, 0.2     ; create envelope 1
aMix     =       (aBPF*kEnv1*4) + (aSquMix*0.04)  ; mix the bandpass filtered and unfiltered sound together
kEnv2    expseg  1, 0.05, 0.3, p3-0.05, 0.0001    ; create envelope 2
aMix     =       aMix * kEnv2                     ; apply envelope to the complete sound
         out     aMix                             ; send sound to output!
endin



</CsInstruments>

<CsScore>
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
