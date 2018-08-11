--------------------------------------------------------------------------------
-- Title       : Testbench for design "TbdI2sParI2s"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbTbdI2sParI2s-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.Global.all;

--------------------------------------------------------------------------------

entity tbTbdI2sParI2s is
end entity tbTbdI2sParI2s;

-------------------------------------------------------------------------------

architecture Bhv of tbTbdI2sParI2s is

  -- component generics
  constant cClkFrequency               : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cSampleRate                 : natural := 44117;
  constant cAudioBitWidth              : natural := 16;

  -- component ports
  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal I2cSclk     : std_logic;
  signal I2cSdin     : std_logic;
  signal Mclk        : std_ulogic;
  signal Bclk        : std_ulogic;
  signal ADCdat      : std_ulogic;
  signal ADClrc      : std_ulogic;
  signal DACdat      : std_ulogic;
  signal DAClrc      : std_ulogic;
  signal Led         : std_ulogic_vector(9 downto 0);
  signal Configured  : std_ulogic;
  signal AckError    : std_ulogic;



begin  -- architecture Bhv


  I2cSclk <= 'H';
  I2cSdin <= 'H';

  DUT : entity work.TbdI2sParI2s
    generic map (
      gClkFrequency  => cClkFrequency,
      gAudioBitWidth => cAudioBitWidth,
      gSampleRate    => cSampleRate)

    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oI2cSclk     => I2cSclk,
      ioI2cSdin    => I2cSdin,
      oMclk        => Mclk,
      oBclk        => Bclk,
      iADCdat      => ADCdat,
      oADClrc      => ADClrc,
      oDACdat      => DACdat,
      oDAClrc      => DAClrc,
      oLed         => Led);

  Configured <= Led(1);
  AckError   <= Led(2);


  -- clock generation
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

  -- Set some value other than 'U'. Since we don't know what data comes along the '-'
  -- value fits best.
  -- ADCdat <= '-';


  -- Generate pseudo random data with an LFSR.
  RandomBit : process is
    -- Define a data structure for an LFSR.
    variable Lfsr : std_ulogic_vector(31 downto 0) := (others => '1');
  begin
    -- With every falling edge of Bclk.
    wait until Bclk'event and (Bclk = '0');
    -- Shift the LFSR once. Shift in a new bit based on linear automata theory.
    Lfsr   := Lfsr(Lfsr'left-1 downto 0) & (Lfsr(Lfsr'left) xor Lfsr(11));
    -- Take any of the bits in the LFSR as source for the output.
    ADCdat <= Lfsr(0);
  end process;

end architecture Bhv;
