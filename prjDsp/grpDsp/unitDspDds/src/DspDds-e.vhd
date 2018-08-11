--------------------------------------------------------------------------------
-- Title       : DDS sine wave generator
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDds-e.vhd 716 2017-11-12 16:57:46Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Useful with some synthesis tools only. See architecture Rtl for more details.
-- use ieee.math_real.all;

-- fixed_pkg resides in the library ieee since VHDL-2008 (QuestaSim backports
-- this to VHDL-93 too). However, Quartus (as of version 13.0sp1) still does
-- not have native support for ieee.fixed_pkg. Therefore, we provide the
-- VHDL-93 compatibility versions as part of this excercise. These must be
-- compiled into the are located in the library ieee_proposed. Include them in
-- your Config.tcl and don't forget to set the ExtraLibraries and TargetLibrary
-- parameters to compile them into the right library (ieee_proposed) with fhlow.
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

use work.Global.all;

entity DspDds is
  
  generic (
    gClkFrequency            : natural       := cDefaultClkFrequency;
    gAudioBitWidth           : natural       := cDefaultAudioBitWidth;

    -- How many bits does the phase register have?
    gPhaseResolution         : natural       := 20;

    -- How many bits of the phase register will be dithered?
    -- Should be gPhaseResolution-LogDualis(gWaveTable'length)
    -- Unfortunately this is not a globally static expression so we have
    -- express this via a literal.
    gNrOfPhaseDitherBits     : natural       := 10;

    -- How many bits do the waveform ROM table entries have?
    gWaveTableBitWidth       : natural       := 14;

    -- Precalculated waveform ROM table entries
    -- The values of the wave table are given for the first quadrant of
    -- the sine function. For more details see the paper from Martin
    -- Pechanec: "Output Spectrum of a Direct Digital Synthesizer".
    -- Can be found under the filename Dds.pdf on the internet.
    gWaveTable               : aSetOfFactors := (
      0.00076699, 0.002300969, 0.003834943, 0.005368907, 0.006902859,

        ...

      ));

  port (
    -- Sequential logic inside this unit
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- Phase steps determining the frequency to be generated
    iPhaseIncrement : in natural range 0 to 2**(gPhaseResolution-1)-1;

    -- Sample rate sync strobe signal
    iSampleStrobe : in std_ulogic;

    -- Parallel digital audio data protocol
    oVal : out std_ulogic;
    oD   : out aAudioData(0 downto -(gAudioBitWidth-1)));

begin

  -- Assure that gWaveTable is of the form 2**n!
  assert 2**LogDualis(gWaveTable'length) = gWaveTable'length
    report "gWaveTable must have 2**n entries, but has " &
           natural'image(gWaveTable'length)
    severity error;
  
  -- Assure phase resolution is equal to or higher than the number of ROM address bits
  assert gPhaseResolution >= LogDualis(gWaveTable'length)
    report "gPhaseResolution is lower than the number of address bits necessary to address each table entry in gWaveTable"
    severity error;
  
  -- Assure that no more than the complete phase register is dithered
  assert gNrOfPhaseDitherBits <= gPhaseResolution
    report "Cannot dither more bits than those used to address the wave table"
    severity error;
  
  -- Warn if phase dithering is not set to the optimum (see comment for gNrOfPhaseDitherBits)
  assert gNrOfPhaseDitherBits = (gPhaseResolution - LogDualis(gWaveTable'length))
    report "Number of phase dithering bits deviates from ideal value " &
           "(is "       & integer'image(gNrOfPhaseDitherBits)                            & " bits," &
           " expected " & integer'image(gPhaseResolution - LogDualis(gWaveTable'length)) & " bits)"
    severity warning;
  
end DspDds;
