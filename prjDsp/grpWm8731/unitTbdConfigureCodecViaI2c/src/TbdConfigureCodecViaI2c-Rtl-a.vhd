--------------------------------------------------------------------------------
-- Title       : Testbed for configuration of Wolfson WM8731 via I2C
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdConfigureCodecViaI2c-Rtl-a.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2017
--------------------------------------------------------------------------------
-- Description : This version does not use a PLL and ignores the fact that
--               actual clock frequencies deviate from their expected values.
--------------------------------------------------------------------------------

architecture Rtl of TbdConfigureCodecViaI2c is

  -- component generics
  constant cClkFrequency    : natural := 48E6;
  constant cStrobeFrequency : natural := 750E3;
  constant cMclkFrequency   : natural := 12E6;
  constant cChoosenParamSet : aParamSetName := MicroMasterSampleRate44k1;

  -- component ports
  signal Clk48MHz                : std_ulogic;
  signal StrobeI2C               : std_ulogic;
  signal Start                   : std_ulogic;
  signal Configured              : std_ulogic;
  signal AckError                : std_ulogic;
  signal Mclk                    : std_ulogic;
  signal BclkDiffersFromMclk	 : std_ulogic;
  signal ADClrcDiffersFromDAClrc : std_ulogic;
  signal WaitCtr                 : unsigned(1 downto 0);

begin  -- architecture Rtl

  -- Start will be activated some strobes after reset is released. And
  -- will be deactivated as soon as the codec is configured.
  CountDownOnce : process (Clk48MHz, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      WaitCtr <= (others => '1');
      Start   <= cInactivated;
    elsif rising_edge(Clk48MHz) then  -- rising clock edge
      if (Configured = cInactivated) then
        if (StrobeI2C = cActivated) then
          if (WaitCtr = 0) then
            Start   <= cActivated;
          else
            WaitCtr <= WaitCtr - 1;
            Start <= cInactivated;
          end if;
        end if;
      else
        Start <= cInactivated;
      end if;
    end if;
  end process CountDownOnce;


  -- entity instantiation
  ConfigureCodec : entity work.ConfigureCodecViaI2c
    generic map (
      gChoosenParamSet => cChoosenParamSet)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iStrobeI2C   => StrobeI2C,
      iStart       => Start,
      oConfigured  => Configured,
      oAckError    => AckError,
      oI2cSclk     => oI2cSclk,
      ioI2cSdin    => ioI2cSdin);

  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => cClkFrequency,
      gStrobeFrequency => cStrobeFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oStrobe      => StrobeI2C);

  GenMclk : entity work.FreqDivider
    generic map (
      gDivideBy => cClkFrequency / cMclkFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oDivdClk     => Mclk);
  
	Gen48From50ViaPll : entity work.PLL50to48
		port map (
			iClk50MHz			=> iClk,
			inResetAsync	=> inResetAsync,
			oClk48MHz			=> Clk48MHz,
			oLocked				=> open);
	
  oMclk   <= Mclk;
  
  
  -- Differs between clocks
  BclkDiffersFromMclk <= cActivated when iBclk /= Mclk else cInactivated;
  ADClrcDiffersFromDAClrc <= cActivated when iADClrc /= iDAClrc else cInactivated;
  
  oLed <= (0 => Start,
           1 => Configured,
           2 => AckError,
		   3 => BclkDiffersFromMclk,
		   4 => ADClrcDiffersFromDAClrc,
           others => cInactivated);
		   
  -- connect ADC with DAC
  oDACdat <= iADCdat;

end architecture Rtl;
