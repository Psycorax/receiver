--------------------------------------------------------------------------------
-- Title       : FSK receiver
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: RxFsk-Rtl-a.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of RxFsk is

  signal DwetBP0Chn0   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal DwetBP1Chn0   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetBP0Chn0 : std_ulogic;
  signal ValWetBP1Chn0 : std_ulogic;

  signal DwetBP0Chn1   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal DwetBP1Chn1   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetBP0Chn1 : std_ulogic;
  signal ValWetBP1Chn1 : std_ulogic;

  signal DwetBP0   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal DwetBP1   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetBP0 : std_ulogic;
  signal ValWetBP1 : std_ulogic;

  signal DwetLP   : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetLP : std_ulogic;

  signal regAfterSub : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValAfterSub : std_ulogic;

begin

  -- instanciate bandpasses
  BP1Chan0 : entity work.DspFir(RtlRam)
    generic map (
      gAudioBitWidth => gAudioBitWidth,
      gCoefWidth     => gCoefWidth,
      gB             => gChannelBandpasses(0).Bandpass1
      )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => iD,
      iValDry      => iVal,
      oDwet        => DwetBP1Chn0,
      oValWet      => ValWetBP1Chn0);


  BP0Chan0 : entity work.DspFir(RtlRam)
    generic map (
      gAudioBitWidth => gAudioBitWidth,
      gCoefWidth     => gCoefWidth,
      gB             => gChannelBandpasses(0).Bandpass0
      )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => iD,
      iValDry      => iVal,
      oDwet        => DwetBP0Chn0,
      oValWet      => ValWetBP0Chn0);

  BP1Chan1 : entity work.DspFir(RtlRam)
    generic map (
      gAudioBitWidth => gAudioBitWidth,
      gCoefWidth     => gCoefWidth,
      gB             => gChannelBandpasses(1).Bandpass1
      )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => iD,
      iValDry      => iVal,
      oDwet        => DwetBP1Chn1,
      oValWet      => ValWetBP1Chn1);

  BP0Chan1 : entity work.DspFir(RtlRam)
    generic map (
      gAudioBitWidth => gAudioBitWidth,
      gCoefWidth     => gCoefWidth,
      gB             => gChannelBandpasses(1).Bandpass0
      )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => iD,
      iValDry      => iVal,
      oDwet        => DwetBP0Chn1,
      oValWet      => ValWetBP0Chn1);

  -- instanciate lowpass
  LP : entity work.DspFir(RtlRam)
    generic map (
      gAudioBitWidth => gAudioBitWidth,
      gCoefWidth     => gCoefWidth,
      gB             => gLowpass
      )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => regAfterSub,
      iValDry      => ValAfterSub,
      oDwet        => DwetLP,
      oValWet      => ValWetLP);

  -- choose channel
  DwetBP0   <= DwetBP0Chn0   when iChannelSelect = 0 else DwetBP0Chn1;
  DwetBP1   <= DwetBP1Chn0   when iChannelSelect = 0 else DwetBP1Chn1;
  ValWetBP1 <= ValWetBP1Chn0 when iChannelSelect = 0 else ValWetBP1Chn1;

  -- register before data gets to low pass
  subProcess : process(iClk, ValWetBP1)
  begin
    if inResetAsync = not('1') then
      regAfterSub <= (others => '0');
      ValAfterSub <= '0';
    elsif rising_edge(iClk) then
      if ValWetBP1 = '1' then
        regAfterSub <= ResizeTruncAbsVal((abs(DwetBP1) - abs(DwetBP0)), regAfterSub);
        ValAfterSub <= '1';
      else
        ValAfterSub <= '0';
      end if;
    end if;
  end process subProcess;

  -- transform values to '0' and '1'

  transformTo1and0 : process(iClk, ValWetLP)
  begin
    if inResetAsync = not('1') then
      oD <= '0';
    elsif rising_edge(iClk) and ValWetLP = '1' then
      if DwetLP < 0.0 then
        oD <= '0';
      else
        oD <= '1';
      end if;
    end if;
  end process transformTo1and0;

end architecture Rtl;
