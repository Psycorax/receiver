--------------------------------------------------------------------------------
-- Title       : Testbed for FIR filter including parameterization
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdDspFir-Rtl-a.vhd 716 2017-11-12 16:57:46Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Includes parameterization for two bandpass filters with pass
--               frequencies of 2500 Hz and 5000 Hz and stop frequencies 450 Hz
--               around the pass frequency.
--------------------------------------------------------------------------------

architecture Rtl of TbdDspFir is

  constant cClkFrequency    : natural       := gClkFrequency;
  constant cStrobeFrequency : natural       := 750E3;
  constant cMclkFrequency   : natural       := 12E6;
  constant cChoosenParamSet : aParamSetName := LineSlaveSampleRate44k1;
  constant cB               : aSetOfFactors := (-0.000152587890625,  0.00018310546875 ,  0.000152587890625,  0.000152587890625,  0.00018310546875 ,  0.000152587890625,  0.0001220703125  ,  0.00006103515625 ,  0.0              , -0.000091552734375, -0.000213623046875, -0.00030517578125 , -0.0003662109375  , -0.0003662109375  , -0.000335693359375, -0.000274658203125, -0.0001220703125  ,  0.00006103515625 ,  0.000244140625   ,  0.000457763671875,  0.0006103515625  ,  0.000732421875   ,  0.000732421875   ,  0.000640869140625,  0.000457763671875,  0.00018310546875 , -0.000152587890625, -0.000518798828125, -0.0008544921875  , -0.001129150390625, -0.001251220703125, -0.001251220703125, -0.00103759765625 , -0.000701904296875, -0.000213623046875,  0.0003662109375  ,  0.000946044921875,  0.00146484375    ,  0.001861572265625,  0.00201416015625 ,  0.001922607421875,  0.001556396484375,  0.000946044921875,  0.000152587890625, -0.000732421875   , -0.0015869140625  , -0.0023193359375  , -0.0028076171875  , -0.002960205078125, -0.002716064453125, -0.002105712890625, -0.00115966796875 ,  0.0              ,  0.001251220703125,  0.00244140625    ,  0.00341796875    ,  0.00396728515625 ,  0.00408935546875 ,  0.003631591796875,  0.002685546875   ,  0.0013427734375  , -0.00030517578125 , -0.001983642578125, -0.0035400390625  , -0.00469970703125 , -0.005340576171875, -0.00531005859375 , -0.00457763671875 , -0.00323486328125 , -0.001373291015625,  0.000762939453125,  0.0029296875     ,  0.004791259765625,  0.00616455078125 ,  0.00677490234375 ,  0.006561279296875,  0.0054931640625  ,  0.003631591796875,  0.001251220703125, -0.001434326171875, -0.0040283203125  , -0.0062255859375  , -0.0076904296875  , -0.00823974609375 , -0.00775146484375 , -0.006256103515625, -0.003875732421875, -0.000946044921875,  0.00225830078125 ,  0.0052490234375  ,  0.007659912109375,  0.009185791015625,  0.00958251953125 ,  0.008758544921875,  0.006805419921875,  0.00390625       ,  0.00042724609375 , -0.003204345703125, -0.006500244140625, -0.009063720703125, -0.010528564453125, -0.010711669921875, -0.009490966796875, -0.007080078125   , -0.003692626953125,  0.000244140625   ,  0.004180908203125,  0.0076904296875  ,  0.010284423828125,  0.0115966796875  ,  0.011474609375   ,  0.0098876953125  ,  0.00701904296875 ,  0.00323486328125 , -0.001007080078125, -0.005157470703125, -0.00872802734375 , -0.011199951171875, -0.01226806640625 , -0.011810302734375, -0.009857177734375, -0.00665283203125 , -0.002593994140625,  0.0018310546875  ,  0.006011962890625,  0.00946044921875 ,  0.01171875       ,  0.01251220703125 ,  0.01171875       ,  0.00946044921875 ,  0.006011962890625,  0.0018310546875  , -0.002593994140625, -0.00665283203125 , -0.009857177734375, -0.011810302734375, -0.01226806640625 , -0.011199951171875, -0.00872802734375 , -0.005157470703125, -0.001007080078125,  0.00323486328125 ,  0.00701904296875 ,  0.0098876953125  ,  0.011474609375   ,  0.0115966796875  ,  0.010284423828125,  0.0076904296875  ,  0.004180908203125,  0.000244140625   , -0.003692626953125, -0.007080078125   , -0.009490966796875, -0.010711669921875, -0.010528564453125, -0.009063720703125, -0.006500244140625, -0.003204345703125,  0.00042724609375 ,  0.00390625       ,  0.006805419921875,  0.008758544921875,  0.00958251953125 ,  0.009185791015625,  0.007659912109375,  0.0052490234375  ,  0.00225830078125 , -0.000946044921875, -0.003875732421875, -0.006256103515625, -0.00775146484375 , -0.00823974609375 , -0.0076904296875  , -0.0062255859375  , -0.0040283203125  , -0.001434326171875,  0.001251220703125,  0.003631591796875,  0.0054931640625  ,  0.006561279296875,  0.00677490234375 ,  0.00616455078125 ,  0.004791259765625,  0.0029296875     ,  0.000762939453125, -0.001373291015625, -0.00323486328125 , -0.00457763671875 , -0.00531005859375 , -0.005340576171875, -0.00469970703125 , -0.0035400390625  , -0.001983642578125, -0.00030517578125 ,  0.0013427734375  ,  0.002685546875   ,  0.003631591796875,  0.00408935546875 ,  0.00396728515625 ,  0.00341796875    ,  0.00244140625    ,  0.001251220703125,  0.0              , -0.00115966796875 , -0.002105712890625, -0.002716064453125, -0.002960205078125, -0.0028076171875  , -0.0023193359375  , -0.0015869140625  , -0.000732421875   ,  0.000152587890625,  0.000946044921875,  0.001556396484375,  0.001922607421875,  0.00201416015625 ,  0.001861572265625,  0.00146484375    ,  0.000946044921875,  0.0003662109375  , -0.000213623046875, -0.000701904296875, -0.00103759765625 , -0.001251220703125, -0.001251220703125, -0.001129150390625, -0.0008544921875  , -0.000518798828125, -0.000152587890625,  0.00018310546875 ,  0.000457763671875,  0.000640869140625,  0.000732421875   ,  0.000732421875   ,  0.0006103515625  ,  0.000457763671875,  0.000244140625   ,  0.00006103515625 , -0.0001220703125  , -0.000274658203125, -0.000335693359375, -0.0003662109375  , -0.0003662109375  , -0.00030517578125 , -0.000213623046875, -0.000091552734375,  0.0              ,  0.00006103515625 ,  0.0001220703125  ,  0.000152587890625,  0.00018310546875 ,  0.000152587890625,  0.000152587890625,  0.00018310546875 , -0.000152587890625);

  signal Clk48MHz         : std_ulogic;
  signal StrobeI2C        : std_ulogic;
  signal Start            : std_ulogic;
  signal Configured       : std_ulogic;
  signal AckError         : std_ulogic;
  signal Mclk             : std_ulogic;
  signal Bclk             : std_ulogic;
  signal ADClrc           : std_ulogic;
  signal WaitCtr          : unsigned(1 downto 0);
  signal ValDryL, ValDryR : std_ulogic;
  signal Ddry             : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetL, ValWetR : std_ulogic;
  signal DwetL, DwetR     : aAudioData(0 downto -(gAudioBitWidth-1));

begin

  PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
      inResetAsync => inResetAsync,
      iClk50MHz    => iClk,
      oClk48MHz    => Clk48MHz,
      oLocked      => open);


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

  GenClks : entity work.ClkMaster
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


  FirInstance : entity work.DspFir(RtlRam)
    generic map (
      gAudioBitWidth => gAudioBitWidth,
      gCoefWidth     => gCoefWidth,
      gB             => cB
      )
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      iDdry        => Ddry,
      iValDry      => ValDryL,
      oDwet        => DwetL,
      oValWet      => ValWetL);


  DwetR   <= Ddry;
  ValWetR <= ValDryR;


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

  -- Send the results out
  oADClrc <= ADClrc;
  oMclk   <= Mclk;
  oBclk   <= Bclk;

  oLed <= (0      => Start,
           1      => Configured,
           2      => AckError,
           others => cInactivated);

end architecture Rtl;
