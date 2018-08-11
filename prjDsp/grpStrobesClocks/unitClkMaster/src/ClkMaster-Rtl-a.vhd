--------------------------------------------------------------------------------
-- Title       : Generator for clock signals of the I2S digital audio interface
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ClkMaster-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of ClkMaster is

  -- TODO: definitions
  constant cClkCycPerHalfDivClkPeriod : natural := gClkFrequency/ gMclkFrequency/ 2;
  constant cClkCounterBinDigitCount   : natural := LogDualis(cClkCycPerHalfDivClkPeriod);
  constant cBitsPerStereosample       : natural := gMclkFrequency/ gSampleRate;
  constant cBitsPerChannel            : natural := cBitsPerStereosample/ 2;
  constant cBitsPerChanBinDigitCount  : natural := LogDualis(cBitsPerStereosample);

  signal MBClkCounter : unsigned(cClkCounterBinDigitCount-1 downto 0);
  signal MBClk        : std_ulogic;

  signal LRClkCounter : unsigned(cBitsPerChanBinDigitCount-1 downto 0);
  signal LRClk        : std_ulogic;

begin

  -- TODO: implementation
  ClkGenerator : process (iClk, inResetAsync) is
  begin  -- process MBClk

    -- Asynchronous reset
    if (inResetAsync = cResetActive) then
      -- We begin counting at 0
      MBClkCounter <= to_unsigned(0, MBClkCounter'length);
      MBClk        <= '0';
      LRClkCounter <= to_unsigned(0, LRClkCounter'length);
      LRClk        <= '0';


    elsif rising_edge(iClk) then
      -- We count from 0 ti cClkCycPerStrobeCyc-1
      if MBClkCounter = cClkCycPerHalfDivClkPeriod-1 then
        MBClkCounter <= (others => '0');
        MBClk        <= not(MBClk);
        LRClkCounter <= LRClkCounter+1;
        if LRClkCounter = cBitsPerStereosample-1 then
          LRClkCounter <= (others => '0');
          LRClk        <= not(LRClk);
        else
          LRClkCounter <= LRClkCounter+1;
        end if;
      else
        MBClkCounter <= MBClkCounter+1;
      end if;
    end if;
  end process ClkGenerator;

  oMclk   <= MBClk;
  oBclk   <= MBClk;
  oADClrc <= LRClk;

end Rtl;
