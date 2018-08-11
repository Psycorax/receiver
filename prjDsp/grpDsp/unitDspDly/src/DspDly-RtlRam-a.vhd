--------------------------------------------------------------------------------
-- Title       : z^{-1} delay
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDly-RtlRam-a.vhd 711 2017-11-03 18:22:43Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Implementation infering RAM blocks
--------------------------------------------------------------------------------

architecture RtlRam of DspDly is

  type MEM is array(0 to gDelay) of aAudioData(iDdry'range);
  signal ram_block : MEM                              := (others => (others => '0'));
  signal write_ptr : unsigned(0 to LogDualis(gDelay)) := (others => '0');

begin

  readWriteRam : process (iClk, iValDry)
  begin
    if (rising_edge(iClk)) then
      if (iValDry = '1') then
        ram_block(to_integer(write_ptr)) <= iDdry;
        oDwet                            <= ram_block(to_integer(write_ptr+1) mod integer(gDelay+1));
      end if;
    end if;
  end process readWriteRam;


  addrPtrLogic : process (iClk, iValDry)
  begin
    if (rising_edge(iClk) and iValDry = '1') then
      write_ptr <= (write_ptr + 1) mod integer(gDelay+1);
    end if;
  end process addrPtrLogic;

end RtlRam;
