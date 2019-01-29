; timedseq allows us to store a sequence of score events as a list of values which can then be played back at will:
;  - in a loop
;  - forwards
;  - backwards
;  - variable speed
;  - etc...

<CsoundSynthesizer>

<CsInstruments>

nchnls 	= 2
0dbfs		= 1

; Create a function table that stores the score events as a lost of numbers.
; Note that the 'i' instrument indications are omitted from these score statements.
; '\' allows us to use a newline within a single line of code. This allows is to align the score events, making them easier to read.
; Notice the use of a 'dummy' score event at the end of the sequence: "-1, 8.0,  -1,  -1"  
giSeq		ftgen		0,0,128,-2, 	2, 0.00, 0.3, 40, \
																							2, 0.25, 0.3, 42, \
																							2, 0.50, 0.3, 43, \
																							2, 0.75, 0.3, 45, \
																							2, 1.00, 0.3, 47, \
																							2, 1.25, 0.3, 43, \
																							2, 1.50, 0.3, 47, \
																							2, 2.00, 0.3, 46, \
																							2, 2.25, 0.3, 42, \
																							2, 2.50, 0.3, 46, \
																							2, 3.00, 0.3, 45, \
																							2, 3.25, 0.3, 41, \
																							2, 3.50, 0.3, 45, \
																							2, 4.00, 0.3, 40, \
																							2, 4.25, 0.3, 42, \
																							2, 4.50, 0.3, 43, \
																							2, 4.75, 0.3, 45, \
																							2, 5.00, 0.3, 47, \
																							2, 5.25, 0.3, 43, \
																							2, 5.50, 0.3, 47, \
																							2, 5.75, 0.3, 52, \
																							2, 6.00, 0.3, 50, \
																							2, 6.25, 0.3, 47, \
																							2, 6.50, 0.3, 43, \
																							2, 6.75, 0.3, 47, \
																							2, 7.00, 1.2, 50, \
																							-1, 8.0,  -1,  -1


instr   1
kp1, kp2, kp3, kp4   init  0                                  ; the p-fields need to be intialised as they are used as inputs in timedseq
 kpointer			rspline					 0, 8, 0.2, 0.4																			 ; this is our pointer that reads the melody. It is a random spline between 0 and 8, changing rate between 0.2 and 0.4 	
 ktrigger   timedseq				 kpointer, giSeq, kp1, kp2,kp3, kp4		 ; this create timed triggers based on the score events score in the function table above and also reads and updates the additional p-fields
										schedkwhen 	 ktrigger, 0, 0, 2, 0, kp3, kp4					 ; create the score events
 ; a filter cutoff is created as a global variable (starts with a g) so that the entire melody slowly builds and decays in timbre.
 gkfilt					expseg					 200, 20, 12000, 20, 200			
endin

instr   2
kenv        expon        1, p3, 0.001                ; percussive decay envelope
asig        vco2         0.2 * kenv, cpsmidinn(p4)   ; a sawtooth oscillator
aCF         expon        i(gkfilt), p3, 20           ; create the filter cutoff envelope. i() converts a k-rate variable to i-rate.
asig        butlp        asig, aCF                   ; lowpass filter the sawtooth
            outs         asig, asig                  ; send audio to the speakers
            chnmix       asig * 0.3, "send"          ; also send some audio to the reverb instruemnt via a 'channel'
endin

instr   99
ain         chnget       "send"                      ; read in the sent audio
            chnclear     "send"                      ; clear the audio channel
aL,aR       reverbsc     ain, ain, 0.85, 4000        ; reverberate the audio
            outs         aL, aR                      ; send the reverb to the output
endin

</CsInstruments>

<CsScore>
i 1  0 40   ; instrument to create score events
i 99 0 50   ; reverb instrument
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
