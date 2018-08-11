--------------------------------------------------------------------------------
-- Title       : Testbench for design "DspScaleAndAdd"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbDspScaleAndAdd-Bhv-ea.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

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

entity tbDspScaleAndAdd is
end tbDspScaleAndAdd;


architecture Bhv of tbDspScaleAndAdd is

  -- component generics
  constant cClkFrequency               : natural               := cDefaultClkFrequency;
  constant cIsLowPercentageOfDutyCycle : natural               := 65;
  constant cInResetDuration            : time                  := 140 ns;
  constant cMclkFrequency              : natural               := 12E6;
  constant cSampleRate                 : natural               := cDefaultSampleRate;
  constant cAudioBitWidth              : natural               := cDefaultAudioBitWidth;
  constant cScaleFactor                : aSetOfFactors(1 to 2) := (0.5, 0.5001);
  constant cRegisteredOutputs          : boolean               := false;

  constant cWavName : string := "SinL220HzR263Hz1sec";

  constant cDryWavFileName : string := "../../../../sounds/" & cWavName & ".wav";
  constant cWetWavFileName : string := "Wet" & cWavName & ".wav";
  constant cWetRawWavFileName : string := "WetRawFile.raw";

  constant cRecordingDurationAftWaveEnd : time := 100 us;

  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal DdryL, DdryR,
    DwetL, DwetR : aAudioData(0 downto -(cAudioBitWidth-1));
  signal ValDryL, ValDryR,
    ValWetL, ValWetR : std_ulogic;
  signal WaveAtEnd : boolean := false;
  signal ADClrc    : std_ulogic;
  signal Mclk      : std_ulogic;
  signal Bclk      : std_ulogic;
  signal Lrc       : std_ulogic;

begin

  TheWavToPar : entity work.WavToPar
    generic map (
      gWaveFileName  => cDryWavFileName,
      gSampleRate    => cSampleRate,
      gAudioBitWidth => cAudioBitWidth)
    port map (
      iClk       => Clk,
      oDL        => DdryL,
      oDR        => DdryR,
      oValL      => ValDryL,
      oValR      => ValDryR,
      oWaveAtEnd => WaveAtEnd,
      iLrc       => ADClrc);

  DUT : entity work.DspScaleAndAdd
    generic map (
      gAudioBitWidth     => cAudioBitWidth,
      gScaleFactor       => cScaleFactor,
      gRegisteredOutputs => cRegisteredOutputs)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      iDdry1       => DdryL,
      iDdry2       => DdryR,
      iValDry      => ValDryL,
      oDwet        => DwetL,
      oValWet      => ValWetL);

  ValWetR <= ValWetL;
  DwetR   <= DwetL;

  TheParToWav : entity work.ParToWav
    generic map (
      gWavFileName                 => cWetWavFileName,
      gRawWavFileName              => cWetRawWavFileName,
      gRecordingDurationAftWaveEnd => cRecordingDurationAftWaveEnd,
      gFormatTag                   => open,
      gAudioBitWidth               => open,
      gChannels                    => open,
      gSampleRate                  => cDefaultSampleRate)
    port map (
      iClk       => Clk,
      iDL        => DwetL,
      iDR        => DwetR,
      iValL      => ValWetL,
      iValR      => ValWetR,
      iWaveAtEnd => WaveAtEnd);

  GenClks : entity work.ClkMaster
    generic map (
      gClkFrequency  => cClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => cSampleRate)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc);

  ClkGen : entity work.Oscillator
    generic map (
      gFrequency                  => cClkFrequency,
      gIsLowPercentageOfDutyCycle => cIsLowPercentageOfDutyCycle)
    port map (
      oRectangleWave => Clk);

  -- reset generation
  PwrOnResetSource : entity work.PwrOnReset
    generic map (
      gInResetDuration => cInResetDuration,
      gResetLevel      => cResetActive)
    port map (
      onResetAsync => nResetAsync);


end Bhv;
