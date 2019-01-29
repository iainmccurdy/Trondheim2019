
<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>

nchnls = 2
0dbfs = 1                                                                                                                
ksmps = 1


; an array stores the frequency ratios taken from the Csound manual
giRatios[] fillarray  1, 3.984, 10.668, 17.979, 23.679, 33.642

instr      1
iCount    =    0                             ; create a counter
while (iCount < lenarray:i(giRatios)) do     ; loop until the reach the end of the array
;            p1 p2 p3   p4   p5 p6   p7
event_i "i", 2, 0, 0.1, 500, 1, 2000, iCount ; trigger a note: one note for each mode partial
iCount    +=   1
od


endin


; a mode synthesis layer
instr      2
kFreq      init      p4 
iAmp       =         p5                                  ; read note velocity
kQ         init      p6                                  ; Q from GUI widget
p3         =         2*i(kQ)/i(kFreq)                    ; note duration will depend on 'Q' and frequency
iRatio     =         giRatios[p7]                        ; read ratio from array
aImp       mpulse    1, 0                                ; a single sample impulse
iCFoct     =         (iAmp*5) + 7                        ; create an value for the filter cutoff (oct format)
aImp       butlp     aImp, cpsoct(iCFoct)                ; lowpass filter the impulse

aSig       mode      aImp, kFreq * iRatio, kQ            ; modes...
aEnv       expsegr   1, 0.5, 0.001
           outs      aSig * 0.1 * aEnv, aSig * 0.1 * aEnv; scale and send to output
endin

</CsInstruments>

<CsScore>
i 1 0 3600
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
