# Audio Codec Test

This is a set of FPGA configuration files for testing the audio codec on
Altera DE1-SoC boards.


## RELEASE

- Release version: 1.2
- Release year: 2017
- Target board: Altera DE1-SoC Rev. E/Rev. F


## USER INTERFACE

### Seven-segment display (HEX5-HEX0)

- SIL-12 = LineOverSidetone_AlteraDE1SoC_V12
- FPL-12 = LineThroughFPGA_AlteraDE1SoC_V12
- SIΠ-12 = MicOverSidetone_AlteraDE1SoC_V12
- FPΠ-12 = MicThroughFPGA_AlteraDE1SoC_V12

### FPGA LEDs (LEDR9-LEDR0, red)

- LEDR0: Audio codec configuration in progress ("Start" signal)
- LEDR1: Audio codec configuration completed ("Configured" signal)
- LEDR2: Audio codec configuration failed ("AckError" signal)
- LEDR8: Bclk differs from Mclk
- LEDR9: DAClrc differs from ADClrc

### FPGA push buttons (KEY3-KEY0)

- KEY0: FPGA reset signal


## AUDIO INTERFACE

Audio input is passed through from input to output. Depending on the FPGA
configuration file, the audio signal is either routed through the analog
by-pass (skipping ADC/DAC) or through the FPGA (by using ADC/DAC).

### Mic* versions

- MIC IN (J1, red): audio input using a suitable microphone or a PC (UCA222 USB
  audio adapters: make sure to set output gain to at most 20%)
- LINE IN (J2, blue): not used
- LINE OUT (J3, green): audio output, suitable for connection to headphones or
  PC (UCA222 USB audio adapters: make sure to set input gain to at most 5%)

### Line* versions

- MIC IN (J1, red): not used
- LINE IN (J2, blue): audio input using a PC (UCA222 USB audio adapters: make
  sure to set output gain to at most 45%)
- LINE OUT (J3, green): audio output, suitable for connection to headphones or
  PC (UCA222 USB audio adapters: make sure to set input gain to at most 5%)


## COPYRIGHT

- Copyright (c) Michael Roland <michael.roland@fh-hagenberg.at>

All rights reserved.
