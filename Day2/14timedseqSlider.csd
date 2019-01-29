; timedseq allows us to store a sequence of score events as a list of values which can then be played back at will:
;  - in a loop
;  - forwards
;  - backwards
;  - variable speed
;  - etc...

<CsoundSynthesizer>

<CsInstruments>

nchnls  = 2 ; stereo
0dbfs   = 1

; Create a function table that stores the score events as a lost of numbers.
; Note that the 'i' instrument indications are omitted from these score statements.
; '\' allows us to use a newline within a single line of code. This allows is to align the score events, making them easier to read.
; Notice the use of a 'dummy' score event at the end of the sequence: "-1, 8.0,  -1,  -1"  
giSeq   ftgen   0,0,128,-2,   2, 0.00, 0.3, 40, \
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
kp1, kp2, kp3, kp4   init  0                                                  ; the p-fields need to be intialised as they are used as inputs in timedseq
kpointer    invalue      "Pointer"
kTranspose  invalue      "Transpose"
kStaccLeg   invalue      "StaccLeg"
ktrigger    timedseq     kpointer, giSeq, kp1, kp2,kp3, kp4                   ; this create timed triggers based on the score events score in the function table above and also reads and updates the additional p-fields
            schedkwhen   ktrigger, 0, 0, 2, 0, kp3*kStaccLeg, kp4+kTranspose  ; create the score events
endin

instr   2
kenv        expon        1, p3, 0.001                ; percussive decay envelope
asig        vco2         0.2 * kenv, cpsmidinn(p4)   ; a sawtooth oscillator
aCF         expon        2000, p3, 20                ; create the filter cutoff envelope. i() converts a k-rate variable to i-rate.
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
i 1  0 3600   ; instrument to create score events
i 99 0 3600   ; reverb instrument
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
 <bsbObject type="BSBHSlider" version="2">
  <objectName>Pointer</objectName>
  <x>19</x>
  <y>25</y>
  <width>591</width>
  <height>30</height>
  <uuid>{f7ab8d35-3e58-4042-bad0-5b47ff4d5f8c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>8.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>268</x>
  <y>1</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0bdf6931-01e6-4d5f-85ef-98b4f5c05a10}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Pointer</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>Transpose</objectName>
  <x>20</x>
  <y>81</y>
  <width>80</width>
  <height>25</height>
  <uuid>{e40f6b89-441a-4dc8-9e31-fbbbce454585}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-60</minimum>
  <maximum>60</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>20</x>
  <y>57</y>
  <width>80</width>
  <height>25</height>
  <uuid>{c42034e1-8bfc-4a1c-b30b-93c8a7955bee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Transpose</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>StaccLeg</objectName>
  <x>124</x>
  <y>83</y>
  <width>251</width>
  <height>24</height>
  <uuid>{73dffe0d-324d-4dae-a257-41c823079dd7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>8.00000000</maximum>
  <value>1.03784861</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>171</x>
  <y>60</y>
  <width>144</width>
  <height>25</height>
  <uuid>{dfd62e58-94d1-4e14-9ca5-c05564b60b85}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Staccato &lt;-> Legato</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
