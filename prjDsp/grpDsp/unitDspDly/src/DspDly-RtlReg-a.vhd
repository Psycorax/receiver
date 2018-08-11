--------------------------------------------------------------------------------
-- Title       : z^{-1} delay
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDly-RtlReg-a.vhd 711 2017-11-03 18:22:43Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Implementation infering registers
--------------------------------------------------------------------------------

architecture RtlReg of DspDly is

	type aRegisterArrayArray is array (1 to gDelay) of aAudioData(iDdry'range);
	signal Registers : aRegisterArrayArray := (others=>(others=>'0'));
	
begin

  process (iClk, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
			Registers <= (others=>(others=>'0'));
    elsif rising_edge(iClk) then
      if iValDry = cActivated then
				for k in Registers'low to Registers'high-1 loop
					Registers(k+1) <= Registers(k);
				end loop;
				Registers(Registers'low) <= iDdry;
				oDwet <= Registers(Registers'high);
			end if;
    end if;
  end process;

end RtlReg;
