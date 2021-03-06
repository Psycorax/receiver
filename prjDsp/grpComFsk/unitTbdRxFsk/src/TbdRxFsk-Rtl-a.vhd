--------------------------------------------------------------------------------
-- Title       : Testbed for FSK receiver on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdRxFsk-Rtl-a.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Decoded output through UART loaned from HPS
--------------------------------------------------------------------------------

architecture Rtl of TbdRxFsk is

  constant cI2cStrobeFrequency : natural := 750E3;
  constant cMclkFrequency      : natural := 12E6;
  constant cCodecParamSet      : aParamSetName := MicroSlaveSampleRate44k1;

  signal Clk48MHz    : std_ulogic;
  signal PllLocked   : std_ulogic;
  signal nResetAsync : std_ulogic;
  
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

  signal RxChannelInput  : std_ulogic;
  signal RxChannelSync   : std_ulogic;
  signal RxChannelSelect : natural range 0 to 1;
  
	signal RxDataOutputAsync: std_ulogic;
  signal RxDataOutput     : std_ulogic;
  signal RxDataOutputSync : std_ulogic;
  
  signal MirrorHpsLed : std_ulogic;
  
begin

  HPS_Inst : entity work.HPSComputerMin
    port map (
      -- CLOCK
      CLOCK_50         => iClk,
      
      -- RESET (for FPGA, generated by HPS)
      FPGA_RESET_N     => nResetAsync,
      
      -- UART (HPS LOAN I/O -> FPGA)
      FPGA_UART_TX     => RxDataOutputSync,
      FPGA_UART_RX     => open,
      
      -- HPS GPIO DEBUG
      MIRROR_HPS_LED   => MirrorHpsLed,
      
      -- DDR3 SDRAM
      HPS_DDR3_ADDR    => HPS_DDR3_ADDR,
      HPS_DDR3_BA      => HPS_DDR3_BA,
      HPS_DDR3_CK_P    => HPS_DDR3_CK_P,
      HPS_DDR3_CK_N    => HPS_DDR3_CK_N,
      HPS_DDR3_CKE     => HPS_DDR3_CKE,
      HPS_DDR3_CS_N    => HPS_DDR3_CS_N,
      HPS_DDR3_RAS_N   => HPS_DDR3_RAS_N,
      HPS_DDR3_CAS_N   => HPS_DDR3_CAS_N,
      HPS_DDR3_WE_N    => HPS_DDR3_WE_N,
      HPS_DDR3_RESET_N => HPS_DDR3_RESET_N,
      HPS_DDR3_DQ      => HPS_DDR3_DQ,
      HPS_DDR3_DQS_P   => HPS_DDR3_DQS_P,
      HPS_DDR3_DQS_N   => HPS_DDR3_DQS_N,
      HPS_DDR3_ODT     => HPS_DDR3_ODT,
      HPS_DDR3_DM      => HPS_DDR3_DM,
      HPS_DDR3_RZQ     => HPS_DDR3_RZQ,
      
      -- ETHERNET
      HPS_ENET_GTX_CLK => HPS_ENET_GTX_CLK,
      HPS_ENET_MDC     => HPS_ENET_MDC,
      HPS_ENET_MDIO    => HPS_ENET_MDIO,
      HPS_ENET_RX_CLK  => HPS_ENET_RX_CLK,
      HPS_ENET_RX_DATA => HPS_ENET_RX_DATA,
      HPS_ENET_RX_DV   => HPS_ENET_RX_DV,
      HPS_ENET_TX_DATA => HPS_ENET_TX_DATA,
      HPS_ENET_TX_EN   => HPS_ENET_TX_EN,
      HPS_ENET_INT_N   => HPS_ENET_INT_N,
      
      -- QSPI FLASH
      HPS_FLASH_DATA   => HPS_FLASH_DATA,
      HPS_FLASH_DCLK   => HPS_FLASH_DCLK,
      HPS_FLASH_NCSO   => HPS_FLASH_NCSO,
      
      -- I2C
      HPS_I2C_CONTROL  => HPS_I2C_CONTROL,
      HPS_I2C1_SCLK    => HPS_I2C1_SCLK,
      HPS_I2C1_SDAT    => HPS_I2C1_SDAT,
      HPS_I2C2_SCLK    => HPS_I2C2_SCLK,
      HPS_I2C2_SDAT    => HPS_I2C2_SDAT,
      
      -- SD CARD
      HPS_SD_CMD       => HPS_SD_CMD,
      HPS_SD_CLK       => HPS_SD_CLK,
      HPS_SD_DATA      => HPS_SD_DATA,
      
      -- USB
      HPS_USB_CLKOUT   => HPS_USB_CLKOUT,
      HPS_USB_DATA     => HPS_USB_DATA,
      HPS_USB_DIR      => HPS_USB_DIR,
      HPS_USB_NXT      => HPS_USB_NXT,
      HPS_USB_STP      => HPS_USB_STP,
      HPS_CONV_USB_N   => HPS_CONV_USB_N,
      
      -- SPI
      HPS_SPIM_CLK     => HPS_SPIM_CLK,
      HPS_SPIM_MISO    => HPS_SPIM_MISO,
      HPS_SPIM_MOSI    => HPS_SPIM_MOSI,
      HPS_SPIM_SS      => HPS_SPIM_SS,

      -- UART
      HPS_UART_TX      => HPS_UART_TX,
      HPS_UART_RX      => HPS_UART_RX,
      
      -- GPIO
      HPS_KEY          => HPS_KEY,
      HPS_LED          => HPS_LED,
      HPS_LTC_GPIO     => HPS_LTC_GPIO,
      HPS_GSENSOR_INT  => HPS_GSENSOR_INT);

  PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
      inResetAsync => nResetAsync,
      iClk50MHz    => iClk,
      oClk48MHz    => Clk48MHz,
      oLocked      => PllLocked);


  -- Start will be activated some strobes after reset is released. And
  -- will be deactivated as soon as the codec is configured.
  CountDownOnce : process (Clk48MHz, nResetAsync) is
  begin
    if (nResetAsync = cResetActive) then
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
      inResetAsync => nResetAsync,
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
      inResetAsync => nResetAsync,
      oStrobe      => StrobeI2C);


  -- Audio codec clock generation
  GenClks : entity work.ClkMaster
    generic map (
      gClkFrequency  => gClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => gSampleRate)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
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
      inResetAsync => nResetAsync,
      iBclk        => Bclk,
      iLrc         => ADClrc,
      iSd          => iADCdat,
      oD           => Ddry,
      oValL        => ValDryL,
      oValR        => ValDryR);

  RxChain : entity work.RxFsk(Rtl)
	   generic map (
      gClkFrequency      => gClkFrequency,
			gAudioBitWidth     => gAudioBitWidth,
			gSampleRate        => gSampleRate,
			gCoefWidth         => gCoefWidth,
			gChannelBandpasses => gChannelBandpasses,
			gLowpass           => gLowpass)
    port map (
      inResetAsync   => nResetAsync,
      iClk           => Clk48MHz,
      iChannelSelect => RxChannelSelect,
      iVal           => ValDryR,
      iD             => Ddry,
      oD             => RxDataOutputAsync
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
      inResetAsync => nResetAsync,
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
           3      => MirrorHpsLed,
           4      => RxDataOutput,
           5      => RxDataOutputSync,
           9      => RxChannelSync,
           others => cInactivated);


  sync_ch_input : process(Clk48MHz)
  begin
    if nResetAsync = not('1') then
      RxChannelInput <= '0';
      RxChannelSync <= '0';
    elsif rising_edge(Clk48MHz) then
      RxChannelInput <= iSwitch(0);
      RxChannelSync <= RxChannelInput;
    end if;
  end process sync_ch_input;

  RxChannelSelect <= 1 when RxChannelSync = '1' else 0;

	sync_dat_output : process(iClk)
  begin
    if nResetAsync = not('1') then
      RxDataOutput     <= '0';
      RxDataOutputSync <= '0';
    elsif rising_edge(Clk48MHz) then
      RxDataOutput     <= RxDataOutputAsync;
      RxDataOutputSync <= RxDataOutput;
    end if;
  end process sync_dat_output;
	
end architecture Rtl;
