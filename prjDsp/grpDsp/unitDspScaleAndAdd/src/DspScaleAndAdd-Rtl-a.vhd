--------------------------------------------------------------------------------
-- Title       : Scale and add amplitudes
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspScaleAndAdd-Rtl-a.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : oDwet(t) := iDdry1(t) * gScaleFactor(1)
--                         + iDdry2(t) * gScaleFactor(2)
--------------------------------------------------------------------------------

architecture Rtl of DspScaleAndAdd is

  signal sDwet      : aAudioData(iDdry1'range);
  signal sValWet    : std_ulogic;
  signal sDwetReg   : aAudioData(iDdry1'range);
  signal sValWetReg : std_ulogic;

begin

  ScaleAndAddReg : process (iClk, inResetAsync) is
    variable vDScaled1 : aAudioData(2*iDdry1'left+1 downto 2*iDdry1'right);
    variable vDScaled2 : aAudioData(2*iDdry1'left+1 downto 2*iDdry1'right);
    variable vDwet     : aAudioData(vDScaled1'left+1 downto vDScaled1'right);
    variable vValWet   : std_ulogic;
  begin
    if (inResetAsync = cResetActive) then
      sDwetReg <= (others => '0');
    elsif rising_edge(iClk) then
      if iValDry = '1' then
        vDScaled1 := iDdry1 * gScaleFactor(1);
        vDScaled2 := iDdry2 * gScaleFactor(2);
        vDwet     := vDScaled1 + vDScaled2;
        sDwetReg     <= ResizeTruncAbsVal(vDwet, iDdry1);
        sValWetReg   <= '1';
      else
        sValWetReg <= '0';
      end if;
    end if;
  end process ScaleAndAddReg;

  ScaleAndAdd : process (iClk, inResetAsync) is
    variable vDScaled1 : aAudioData(2*iDdry1'left+1 downto 2*iDdry1'right);
    variable vDScaled2 : aAudioData(2*iDdry1'left+1 downto 2*iDdry1'right);
    variable vDwet     : aAudioData(vDScaled1'left+1 downto vDScaled1'right);
    variable vValWet   : std_ulogic;
  begin
    if (inResetAsync = cResetActive) then
      sDwet <= (others => '0');
    elsif iValDry = '1' then
      vDScaled1 := iDdry1 * gScaleFactor(1);
      vDScaled2 := iDdry2 * gScaleFactor(2);
      vDwet     := vDScaled1 + vDScaled2;
      sDwet     <= ResizeTruncAbsVal(vDwet, iDdry1);
      sValWet   <= '1';
    else
      sValWet <= '0';
    end if;
  end process ScaleAndAdd;

  oDwet   <= sDwet   when gRegisteredOutputs = false else sDwetReg;
  oValWet <= sValWet when gRegisteredOutputs = false else sValWetReg;

end Rtl;
