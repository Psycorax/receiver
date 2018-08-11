--------------------------------------------------------------------------------
-- Title       : FIR filter
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspFir-RtlRam-a.vhd 716 2017-11-12 16:57:46Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture RtlRam of DspFir is

  type RAM is array (gB'range) of aAudioData(iDdry'range);
  type ROM is array (gB'range) of aAudioData(iDdry'range);

  function init_rom return ROM is
    variable tmp : ROM;
  begin
    for i in ROM'range loop
      tmp(i) := to_sfixed(gB(i), tmp(i)'left, tmp(i)'right);
    end loop;
    return tmp;
  end function;

  signal ram_block : RAM := (others => (others => '0'));
  signal rom_block : ROM := init_rom;

  signal ram_output : aAudioData(iDdry'range);
  signal rom_output : aAudioData(iDdry'range);

  type aState is (Idle, WaitForMem, Calc, SetFinalSum, DataCalculated);

  type reg_set_t is record
    state         : aState;
    write_ram     : std_ulogic;
    write_addr    : unsigned(0 to LogDualis(gB'length));
    read_addr_ram : unsigned(0 to LogDualis(gB'length));
    read_addr_rom : unsigned(0 to LogDualis(gB'length));
    mul           : aAudioData(iDdry'range);
    sum           : aAudioData(iDdry'range);
  end record reg_set_t;

  signal R, NextR : reg_set_t;

  constant cInitValR : reg_set_t := (
    state         => Idle,
    write_ram     => '0',
    write_addr    => (others => '0'),
    read_addr_ram => (others => '0'),
    read_addr_rom => (R.read_addr_rom'high => '1', others => '0'),
    mul           => (others => '0'),
    sum           => (others => '0')
    );



begin


  RAMProc : process(iClk, R)
  begin
    if (rising_edge(iClk)) then
      if (R.write_ram = '1') then
        ram_block(to_integer(R.write_addr)) <= iDdry;
      end if;
      ram_output <= ram_block(to_integer(R.read_addr_ram));
    end if;
  end process RAMProc;


  ROMProc : process(iClk, R)
  begin
    if (rising_edge(iClk)) then
      rom_output <= rom_block(to_integer(R.read_addr_rom));
    end if;
  end process ROMProc;


  Registers : process(iClk, inResetAsync)
  begin
    if (inResetAsync = not('1')) then
      R <= cInitValR;
    elsif rising_edge(iClk) then
      R <= NextR;
    end if;
  end process Registers;


  DetermineNextState : process (iValDry, ram_output, rom_output, R, iDdry)
    variable vScaled    : aAudioData(2*iDdry'left+1 downto 2*iDdry'right);
    variable vRamOutput : aAudioData(iDdry'range);
    variable vRomOutput : aAudioData(iDdry'range);
  begin
    NextR   <= R;
    oValWet <= '0';
    oDwet   <= (others => '0');

    case R.state is
      when Idle =>
        if iValDry = '1' then
          NextR.write_ram     <= '1';
          NextR.sum           <= (others               => '0');
          NextR.read_addr_ram <= (R.read_addr_ram + 1) mod integer(gB'length);
          NextR.read_addr_rom <= (R.read_addr_rom'high => '1', others => '0');
          NextR.state         <= WaitForMem;
        end if;

      when WaitForMem =>
        NextR.write_ram <= '0';
        NextR.state     <= Calc;

      when Calc =>
        NextR.write_ram     <= '0';
        vRamOutput          := ram_output;
        vRomOutput          := rom_output;
        vScaled             := vRamOutput * vRomOutput;
        NextR.mul           <= ResizeTruncAbsVal(vScaled, R.mul);
        NextR.read_addr_ram <= (R.read_addr_ram+1) mod integer(gB'length);
        NextR.read_addr_rom <= (R.read_addr_rom+1) mod integer(gB'length);
        NextR.sum           <= ResizeTruncAbsVal(R.sum + R.mul, R.sum);

        if (R.read_addr_ram = R.write_addr) then
          NextR.write_addr <= (R.write_addr+1) mod integer(gB'length);
          NextR.state      <= SetFinalSum;
        else
          NextR.state <= WaitForMem;
        end if;

      when SetFinalSum =>
        NextR.sum   <= ResizeTruncAbsVal(R.sum + R.mul, R.sum);
        NextR.state <= DataCalculated;

      when DataCalculated =>
        oValWet     <= '1';
        oDwet       <= R.sum;
        NextR.state <= Idle;

      when others =>
        NextR <= cInitValR;

    end case;
  end process DetermineNextState;

end architecture;
