--------------------------------------------------------------------------------
-- Title       : Testbed for parallel digital audio streaming protocol test
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdI2sParI2s-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of TbdI2sParI2s is

-- component generics
  constant cClkFrequency    : natural       := 48E6;
  constant cStrobeFrequency : natural       := 750E3;
  constant cMclkFrequency   : natural       := 12E6;
  constant cChoosenParamSet : aParamSetName := LineSlaveSampleRate44k1;

  -- component ports
  signal Data : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValL : std_ulogic;
  signal ValR : std_ulogic;

  signal Clk48MHz                : std_ulogic;
  signal StrobeI2C               : std_ulogic;
  signal Start                   : std_ulogic;
  signal Configured              : std_ulogic;
  signal AckError                : std_ulogic;
  signal Mclk                    : std_ulogic;
  signal Bclk                    : std_ulogic;
  signal ADClrc                  : std_ulogic;
  signal DAClrc                  : std_ulogic;
  signal BclkDiffersFromMclk     : std_ulogic;
  signal ADClrcDiffersFromDAClrc : std_ulogic;
  signal WaitCtr                 : unsigned(1 downto 0);

begin

  -- Start will be activated some strobes after reset is released. And
  -- will be deactivated as soon as the codec is configured.
  CountDownOnce : process (Clk48MHz, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      WaitCtr <= (others => '1');
      Start   <= cInactivated;
    elsif rising_edge(Clk48MHz) then    -- rising clock edge
      if (Configured = cInactivated) then
        if (StrobeI2C = cActivated) then
          if (WaitCtr = 0) then
            Start <= cActivated;
          else
            WaitCtr <= WaitCtr - 1;
            Start   <= cInactivated;
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

  MainClockMaster : entity work.ClkMaster
    generic map (
      gClkFrequency  => cClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => gSampleRate)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc);

  Gen48From50ViaPll : entity work.PLL50to48
    port map (
      iClk50MHz    => iClk,
      inResetAsync => inResetAsync,
      oClk48MHz    => Clk48MHz,
      oLocked      => open);

  I2sToParInst : entity work.I2sToPar
    generic map (
      gAudioBitWidth => gAudioBitWidth)

    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iBclk        => Bclk,
      iLrc         => ADClrc,
      iSd          => iADCdat,
      oD           => Data,
      oValL        => ValL,
      oValR        => ValR);

  ParToI2sInst : entity work.ParToI2s
    generic map (
      gAudioBitWidth => gAudioBitWidth)

    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iDL          => Data,
      iDR          => Data,
      iValL        => ValL,
      iValR        => ValR,
      iBclk        => Bclk,
      oLrc         => DAClrc,
      oSd          => oDACdat);


  -- Differs between clocks
  BclkDiffersFromMclk     <= cActivated when Bclk /= Mclk     else cInactivated;
  ADClrcDiffersFromDAClrc <= cActivated when ADClrc /= DAClrc else cInactivated;

  oLed <= (0      => Start,                    -- 0
           1      => Configured,               -- 1
           2      => AckError,                 -- 0
           3      => BclkDiffersFromMclk,      -- 0
           4      => ADClrcDiffersFromDAClrc,  -- 0
           others => cInactivated);


  -- connect the DAC lr clock to the ADC lr clock and to its outputs
  oDAClrc <= DAClrc;
  oADClrc <= ADClrc;

  -- connect the clocks to the Codec
  oMclk <= Mclk;
  oBclk <= Bclk;

end architecture Rtl;
