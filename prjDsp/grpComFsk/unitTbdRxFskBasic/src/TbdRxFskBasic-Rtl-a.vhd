--------------------------------------------------------------------------------
-- Title       : Testbed for FSK receiver on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdRxFskBasic-Rtl-a.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Decoded output to LED
--------------------------------------------------------------------------------

architecture Rtl of TbdRxFskBasic is

  constant cI2cStrobeFrequency : natural       := 750E3;
  constant cMclkFrequency      : natural       := 12E6;
  constant cCodecParamSet      : aParamSetName := MicroSlaveSampleRate44k1;  --LineSlaveSampleRate44k1;

  signal Clk48MHz  : std_ulogic;
  signal PllLocked : std_ulogic;

  signal StrobeI2C        : std_ulogic;
  signal Start            : std_ulogic;
  signal Configured       : std_ulogic;
  signal WaitCtr          : unsigned(1 downto 0);
  signal Mclk             : std_ulogic;
  signal Bclk             : std_ulogic;
  signal ADClrc           : std_ulogic;
  signal ValDryL, ValDryR : std_ulogic;
  signal Ddry             : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetL, ValWetR : std_ulogic;
  signal DwetL, DwetR     : aAudioData(0 downto -(gAudioBitWidth-1));

  signal dataOut     : std_ulogic;
  signal channelSel0 : std_ulogic;
  signal channelSel1 : std_ulogic;
  signal channelSel  : natural;

  signal RxChannelInput  : std_ulogic;
  signal RxChannelSync   : std_ulogic;
  signal RxChannelSelect : natural range 0 to 1;

  signal RxDataOutput : std_ulogic;

begin

  PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
      inResetAsync => inResetAsync,
      iClk50MHz    => iClk,
      oClk48MHz    => Clk48MHz,
      oLocked      => PllLocked);


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

  -- Audio codec configuration programmer
  ConfigureCodec : entity work.ConfigureCodecViaI2c
    generic map (
      gChoosenParamSet => cCodecParamSet)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iStrobeI2C   => StrobeI2C,
      iStart       => Start,
      oConfigured  => Configured,
      oI2cSclk     => oI2cSclk,
      ioI2cSdin    => ioI2cSdin);

  -- Strobe for configuration speed control
  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => gClkFrequency,
      gStrobeFrequency => cI2cStrobeFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oStrobe      => StrobeI2C);


  -- Audio codec clock generation
  GenClks : entity work.ClkMaster
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

  oADClrc <= ADClrc;
  oMclk   <= Mclk;
  oBclk   <= Bclk;


  -- Audio codec ADC data input processor
  TheI2sToPar : entity work.I2sToPar
    generic map (
      gAudioBitWidth => gAudioBitWidth)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iBclk        => Bclk,
      iLrc         => ADClrc,
      iSd          => iADCdat,
      oD           => Ddry,
      oValL        => ValDryL,
      oValR        => ValDryR);

  RxChain : entity work.RxFsk(Rtl)
    port map (
      inResetAsync   => inResetAsync,
      iClk           => Clk48MHz,
      iChannelSelect => channelSel,
      iVal           => ValDryR,
      iD             => Ddry,
      oD             => dataOut
      );

  DwetL   <= Ddry;
  ValWetL <= ValDryL;
  DwetR   <= Ddry;
  ValWetR <= ValDryL;


  -- Audio codec DAC data output processor
  TheParToI2s : entity work.ParToI2s
    generic map (
      gAudioBitWidth => gAudioBitWidth)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iDL          => DwetL,
      iDR          => DwetR,
      iValL        => ValWetL,
      iValR        => ValWetR,
      iBclk        => Bclk,
      oLrc         => oDAClrc,
      oSd          => oDACdat);


  oSEG5 <= "1000000";
  oSEG4 <= "1000000";
  oSEG3 <= "1000000";
  oSEG2 <= "1000000";
  oSEG1 <= "1000000";
  oSEG0 <= "1000000";

  oLed <= (0      => PllLocked,
           1      => Start,
           2      => Configured,
           3      => RxDataOutput,
           4      => RxDataOutput,
           5      => dataOut,
           9      => RxChannelSync,
           others => cInactivated);


  sync : process(Clk48MHz)
  begin
    if inResetAsync = not('1') then
      channelSel1 <= '0';
      channelSel0 <= '0';
    elsif rising_edge(Clk48MHz) then
      channelSel1 <= iSwitch(0);
      channelSel0 <= channelSel1;
    end if;
  end process sync;

  channelSel <= 1 when channelSel0 = '1' else 0;

end architecture Rtl;
