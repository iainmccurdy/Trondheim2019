; timedseq allows us to store a sequence of score events as a list of values which can then be played back at will:
;  - in a loop
;  - forwards
;  - backwards
;  - variable speed
;  - etc...

<CsoundSynthesizer>

<CsInstruments>

nchnls  = 1 ; stereo
0dbfs = 1

; Create a function table that stores the score events as a list of numbers.
; Note that the 'i' instrument indications are omitted from these score statements.
; '\' allows us to use a newline within a single line of code. This allows is to align the score events, making them easier to read.
; Notice the use of a 'dummy' score event at the end of the sequence: "-1, 8.0,  -1,  -1"  
giSeq   ftgen   0,0,128,-2,   2, 0.00, 0.3, 60, \
                              2, 0.25, 0.3, 64, \
                              2, 0.50, 0.3, 67, \
                              2, 0.75, 0.3, 72, \
                             -1, 1.00,  -1, -1


instr   1
kp1, kp2, kp3, kp4   init              0                    ; the p-fields need to be intialised as they are used as inputs in timedseq

kpointer    linseg       1, 1, 1                            ; this is our pointer that reads the melody. It is a random spline between 0 and 8, changing rate between 0.2 and 0.4   


ktrigger    timedseq     kpointer, giSeq, kp1, kp2,kp3, kp4 ; this create timed triggers based on the score events score in the function table above and also reads and updates the additional p-fields
            schedkwhen   ktrigger, 0, 0, 2, 0, kp3, kp4     ; create the score events
endin

instr   2
aEnv1   expon     1, p3*0.1, 0.01                ; percussive envelope
a1      poscil    aEnv1*0.2, cpsmidinn(p4)*2.71  ; a sine oscillator
aEnv2   expon     1, p3, 0.01                    ; percussive envelope
a2      poscil    aEnv2*0.2, cpsmidinn(p4)       ; a sine oscillator
aSig    =         a1 + a2
        out       aSig
endin

</CsInstruments>

<CsScore>
i 1  0 3600   ; instrument to create score events
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
