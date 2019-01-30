; This is a real time instrument that outputs notes that you play to a text file in the Csound score format.
; Each score event includes information for note number (p4) played and velocity (range 0 to 1) (p5)
; The output file will be called "Score.txt" and you can open it and copy and paste the score into your another .csd.

; Recording starts as soon as you hit the first note so the notes start at time=0
; You can move this score around in time later on by either using the 'b' score shortcut or by playing it 
; from an instrument using 'scoreline_i'. 

; So that you can hear what you are playing, this example includes a simple synthesiser, 
;  but replace this with a synthesiser of your own design. 

<CsoundSynthesizer>

; Include these command line options so that we can use either the score or MIDI to play out instrument
<CsOptions>
-M0 --midi-key=4 --midi-velocity-amp=5
</CsOptions>

<CsInstruments>

0dbfs = 1
nchnls = 2

; This instrument creates a comment at the start of the text file and runs a clock
instr  999
gkTime  timeinsts
fprints "Score.txt", "; p1 p2       p3       (p4)Note (p5)Vel\n"
endin


instr		1

; Read in note start time, note number and velocity. You need this, don't change it! 
iStart =  i(gkTime)
iNote  =  p4
iVel   =  p5



;================================================================================================
; A simple synthesiser. Change this to one of your own design.
aSig   vco2     iVel, cpsmidinn(iNote), 4, 0.5
aEnv   expsegr  0.001, 0.01, 1, 0.1, 0.001
       outs     aSig*aEnv, aSig*aEnv
;================================================================================================



; The following code calls an instrument that prints a score event to the text file. You need this, don't change it! 
if active:i(999)==0 then
 turnon 999
endif
if trigger:k(release:k(),0.5,0)==1 then
 event "i", 998, 0, 0, p1, iStart, iNote, iVel
endif

endin

; The following instrument prints a score event to the text file. You need this, don't change it! 
instr 998
Sevent sprintf "i %d  %f %f %d       %f\n", p4, p5, i(gkTime) - p5, p6, p7
puts Sevent, 1
fprints "Score.txt", Sevent

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
 <bsbObject type="BSBDisplay" version="2">
  <objectName>BufferDur</objectName>
  <x>13</x>
  <y>332</y>
  <width>70</width>
  <height>26</height>
  <uuid>{bcb65514-6c20-4ddf-a41a-eb9ef9dc68be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.109</label>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
