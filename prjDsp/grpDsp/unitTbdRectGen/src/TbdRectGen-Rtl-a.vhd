--------------------------------------------------------------------------------
-- Title       : Testbed for rectangular wave generator on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdRectGen-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of TbdRectGen is

-- component constants

  constant cClkFrequency    : natural       := 48E6;
  constant cStrobeFrequency : natural       := 750E3;
  constant cMclkFrequency   : natural       := 12E6;
  constant cChoosenParamSet : aParamSetName := LineSlaveSampleRate44k1;

-- component ports

  signal DL   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValL : std_ulogic;
  signal DR   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValR : std_ulogic;


  -- component ports
  signal Clk48MHz                : std_ulogic;
  signal StrobeI2C               : std_ulogic;
  signal Start                   : std_ulogic;
  signal Configured              : std_ulogic;
  signal AckError                : std_ulogic;
  signal Mclk                    : std_ulogic;
  signal Bclk                    : std_ulogic;
  signal ADClrc                  : std_ulogic;
  signal nADClrc                 : std_ulogic;
  signal DAClrc                  : std_ulogic;
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
      gClkFrequency  => gClkFrequency,
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

  -- entity instantiation
  RectGenLeft : entity work.RectGen
    generic map (
      gClkFrequency  => gClkFrequency,
      gGenFrequency  => gGenFrequencyL,
      gAudioBitWidth => gAudioBitWidth)

    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iLrc         => nADClrc,
      oVal         => ValL,
      oD           => DL);

  RectGenRight : entity work.RectGen
    generic map (
      gClkFrequency  => gClkFrequency,
      gGenFrequency  => gGenFrequencyR,
      gAudioBitWidth => gAudioBitWidth)

    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iLrc         => ADClrc,
      oVal         => ValR,
      oD           => DR);

  ParToI2sInst : entity work.ParToI2s
    generic map (
      gAudioBitWidth => gAudioBitWidth)

    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iDL          => DL,
      iDR          => DR,
      iValL        => ValL,
      iValR        => ValR,
      iBclk        => Bclk,
      oLrc         => oDAClrc,
      oSd          => oDACdat);

  nADClrc <= not ADClrc;

  oBclk   <= Bclk;
  oMclk   <= Mclk;
  oADClrc <= ADCLRC;

  oLed <= (0      => Start,             -- 0
           1      => Configured,        -- 1
           2      => AckError,          -- 0
           others => cInactivated);


end architecture Rtl;