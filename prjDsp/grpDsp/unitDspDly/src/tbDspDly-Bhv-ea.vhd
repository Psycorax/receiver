--------------------------------------------------------------------------------
-- Title       : Testbench for design "DspDds"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbDspDly-Bhv-ea.vhd 711 2017-11-03 18:22:43Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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

--------------------------------------------------------------------------------

entity tbDspDly is
end tbDspDly;

--------------------------------------------------------------------------------

architecture Bhv of tbDspDly is

  -- component generics
  constant cClkFrequency               : natural := cDefaultClkFrequency;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := cDefaultSampleRate;
  constant cAudioBitWidth              : natural := cDefaultAudioBitWidth;
  constant cDelayReg                   : natural := 0;
  constant cDelayRam                   : natural := 10;  --256;

  constant cWavName : string := "d50org";

  constant cDryWavFileName    : string := "../../../../sounds/" & cWavName & ".wav";
  constant cWetWavFileName    : string := "Wet" & cWavName & ".wav";
  constant cWetRawWavFileName : string := "WetRawFile.raw";

  constant cRecordingDurationAftWaveEnd : time := 100 us;

  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal DdryL, DdryR,
    DwetByRegL, DwetByRamL,
    DwetL, DwetR : aAudioData(0 downto -(cAudioBitWidth-1));
  signal ValDryL, ValDryR,
    ValWetByRegL, ValWetByRamL,
    ValWetL, ValWetR : std_ulogic;
  signal WaveAtEnd : boolean := false;
  signal ADClrc    : std_ulogic;
  signal Mclk      : std_ulogic;
  signal Bclk      : std_ulogic;
  signal Lrc       : std_ulogic;

  type testVals is array(0 to cDelayRam) of aAudioData(0 downto -(cAudioBitWidth-1));
  signal testVal : testVals := (others => (others => '0'));
  signal testCtr : unsigned(0 to LogDualis(cDelayRam)) := (others => '0');

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


  UseRegVersion : if cDelayReg > 0 generate
  begin
    DUTreg : entity work.DspDly(RtlReg)
      generic map (
        gAudioBitWidth => cAudioBitWidth,
        gDelay         => cDelayReg)
      port map (
        iClk         => Clk,
        inResetAsync => nResetAsync,
        iDdry        => DdryL,
        iValDry      => ValDryL,
        oDwet        => DwetByRegL);

    ValWetByRegL <= ValDryL;
  end generate UseRegVersion;

  SkipRegVersion : if cDelayReg = 0 generate
  begin
    DwetByRegL   <= DdryL;
    ValWetByRegL <= ValDryL;
  end generate SkipRegVersion;


  UseRamVersion : if cDelayRam > 0 generate
  begin
    DUTram : entity work.DspDly(RtlRam)
      generic map (
        gAudioBitWidth => cAudioBitWidth,
        gDelay         => cDelayRam)
      port map (
        iClk         => Clk,
        inResetAsync => nResetAsync,
        iDdry        => DwetByRegL,
        iValDry      => ValWetByRegL,
        oDwet        => DwetByRamL);

    ValWetByRamL <= ValWetByRegL;
  end generate UseRamVersion;

  SkipRamVersion : if cDelayRam = 0 generate
  begin
    DwetByRamL   <= DWetByRegL;
    ValWetByRamL <= ValWetByRegL;
  end generate SkipRamVersion;

  DwetL   <= DwetByRamL;
  ValWetL <= ValWetByRamL;

  DwetR   <= DdryR;
  ValWetR <= ValDryR;

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

  test : process(Clk, ValDryL)
  begin
    if nResetAsync = not('1') then
      testCtr <= (others => '0');
    elsif (rising_edge(Clk) and ValDryL = '1') then
       assert (testVal(to_integer(testCtr) mod (cDelayRam+1)) = DwetByRamL) report "not correct delay" severity warning;
      testVal(to_integer(testCtr)) <= DWetByRegL;
      testCtr <= (testCtr + 1) mod (cDelayRam+1);
    end if;
  end process test;

end Bhv;
