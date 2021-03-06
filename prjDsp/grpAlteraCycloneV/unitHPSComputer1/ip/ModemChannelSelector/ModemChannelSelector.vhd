--------------------------------------------------------------------------------
-- Title       : Modem Channel Selection Controller
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ModemChannelSelector.vhd 755 2017-12-10 22:43:13Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2017
--------------------------------------------------------------------------------
-- Description : Avalon memory-mapped slave that allows selection of a receiver/
--             : transmitter channel for the FSK modem
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ModemChannelSelector is
  generic (
    CHANNEL_WIDTH   : natural := 4;
    CHANNEL_DEFAULT : natural := 0
  );
  port (
    clk            : in  std_logic                     := '0';             --   clock.clk
    reset_n        : in  std_logic                     := '0';             --   reset.reset_n
    channel        : out std_logic_vector(CHANNEL_WIDTH-1 downto 0);       -- conduit.output
    s1_address     : in  std_logic_vector(0 downto 0)  := (others => '0'); --      s1.address
    s1_read        : in  std_logic                     := '0';             --        .read
    s1_readdata    : out std_logic_vector(31 downto 0);                    --        .readdata
    s1_write       : in  std_logic                     := '0';             --        .write
    s1_writedata   : in  std_logic_vector(31 downto 0) := (others => '0')  --        .writedata
  );
end entity ModemChannelSelector;

architecture rtl of ModemChannelSelector is
  
  subtype aAddress is natural range 0 to (2**s1_address'length - 1);
  constant cAddrRegChannel    : aAddress := 0;
  constant cAddrRegMagicValue : aAddress := 1;
  
  constant cMagicValue : std_logic_vector(s1_readdata'range) := X"5CD01234";
  
  signal ChannelSelected : unsigned(channel'range);
	
begin
  
  AvalonMMInterface : process(clk)
    variable vAddress : aAddress;
  begin
    if rising_edge(clk) then
      if reset_n = '0' then
        -- synchronous reset
        s1_readdata     <= (others => '0');
				ChannelSelected <= to_unsigned(CHANNEL_DEFAULT, ChannelSelected'length);
        
      else
        -- transform address bits to integer value
        vAddress := to_integer(unsigned(s1_address));
        
				if s1_write = '1' then
					-- register write
					case vAddress is
						when cAddrRegChannel =>
							ChannelSelected <= unsigned(s1_writedata(ChannelSelected'range));
						
						when others =>
							null;
					end case;
				end if;
				
				if s1_read = '1' then
				  -- register read
          s1_readdata <= (others => '0');
					
					case vAddress is
						when cAddrRegChannel =>
							-- read the current channel
							s1_readdata(ChannelSelected'range) <= std_logic_vector(ChannelSelected);
							
						when cAddrRegMagicValue =>
							-- read the magic value
							s1_readdata <= cMagicValue;
							
						when others =>
							null;
					end case;
				end if;
      end if;
    end if;
  end process;
  
  channel <= std_logic_vector(ChannelSelected);
  
end architecture rtl; -- of ModemChannelSelector
