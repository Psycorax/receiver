--------------------------------------------------------------------------------
-- Title       : Configuration of Wolfson WM8731 via I2C
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ConfigureCodecViaI2c-Rtl-a.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of ConfigureCodecViaI2c is

  -----------------------------------------------------------------------------
  -- Assemble register bit map from abstract parameter definition (see DefinitionsCodec)
  -----------------------------------------------------------------------------
  constant cRegBitMap : aRegBitMap := toCodecRegBitMap(cParamSets(gChoosenParamSet));

  -- R/W bit
  constant cRWBitWrite : std_ulogic := '0';

  -----------------------------------------------------------------------------
  -- register definition
  -----------------------------------------------------------------------------
  type aActivity is (Idle, Transmitting);
  type aFrameState is (Idle, Start, Address, RWBit, Ack1, Data1, Ack2, Data2, Ack3, Stop);

  type aRegSet is record
    Activity    : aActivity;
    FrameState  : aFrameState;
    AddrCtr     : natural range 0 to (2**7 - 1);
    BitCtr      : natural range 0 to 15;
    Data        : std_ulogic_vector(15 downto 0);
    Sclk        : std_ulogic;
    Sdin        : std_ulogic;
    AckError    : std_ulogic;
    Configured  : std_ulogic;
  end record aRegSet;

  constant cRinitVal: aRegSet := (
      Activity    => Idle,
      FrameState  => Idle,
      AddrCtr     => 0,
      BitCtr      => 0,
      Data        => (others => '0'),
      Sclk        => cActivated,
      Sdin        => cActivated,
      AckError    => cInactivated,
      Configured  => cInactivated
  );

  signal R, NextR : aRegSet;

begin
 
  ------------
  -- Registers
  ------------
  Registers : process(iClk, inResetAsync)
  begin
    if (inResetAsync = cResetActive) then
      R <= cRinitVal;
    elsif rising_edge(iClk) then
      R <= NextR;  
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Next State and Output Logic: Combinatorial
  -----------------------------------------------------------------------------
  NextStateAndOutput : process (
		R,
		iStrobeI2C,
		iStart,
		ioI2cSdin
  )

  begin

    ---------------------------------------------------------------------------
    -- Set Next State Defaults
    ---------------------------------------------------------------------------
    NextR <= R;

    ---------------------------------------------------------------------------
    -- Consider Actual States and Inputs
    ---------------------------------------------------------------------------
    
    if (iStrobeI2C = cActivated) then
      -- Activity state
      case R.Activity is
        when Idle =>
          if (iStart = cActivated) and (R.FrameState = Idle) then
            -- Start signal asserted and ready for (re-)configuration
            NextR.Activity <= Transmitting;
            NextR.AddrCtr <= 0;
            NextR.Configured <= cInactivated;
            NextR.AckError <= cInactivated;
          end if;
  
        when Transmitting =>
          if (R.FrameState = Start) then
            -- Assemble next register configuration data packet (16 bits)
            -- from register address (7 bits) and register value (9 bits)
            NextR.Data <= std_ulogic_vector(to_unsigned(R.AddrCtr, 7)) & cRegBitMap(R.AddrCtr);
          end if;
  
          if (R.FrameState = Stop) and (R.Sclk = cActivated) then
            -- Continue with next register (or return to idle after transmission of the last register)
            if (R.AddrCtr = cRegBitMap'high) then
              NextR.Activity <= Idle;
              NextR.Configured <= cActivated;
            else
              NextR.AddrCtr <= R.AddrCtr + 1;
            end if;
          end if;
          
          -- Toggle Sclk (VHDL semantics imply that Sclk is only toggled if
          -- not explicitly overwritten in FrameState FSM)
          NextR.Sclk <= not R.Sclk;
      end case;
		end if;

		
		-- Frame State
		case R.FrameState is
			when Idle =>
				-- while idle: release bus
				NextR.Sdin <= cActivated;
				NextR.Sclk <= cActivated;
				
				-- go to start if Transmitting state is reached
				if (R.Activity = Transmitting and iStrobeI2C = cActivated) then
					NextR.FrameState <= Start;
				end if;
				
			when Start =>
				-- set data line low for start condition
				NextR.Sdin <= cInactivated;
				
				-- prepare the first bit counter and go to address framestate on falling edge
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.BitCtr <= (gI2cAddress'length - 1);
					NextR.FrameState <= Address;
				end if;
				
			when Address =>
				-- set the data line to the current bit of the address
				NextR.Sdin <= gI2cAddress(R.BitCtr);

				-- set the next bit on falling edge of sclk or go to RWBit state
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					if (R.BitCtr > 0) then
						NextR.BitCtr <= R.BitCtr - 1;
					else
						NextR.FrameState <= RWBit;
					end if;
				end if;
			
			when RWBit =>
				-- set the data line to low (write to slave)
				NextR.Sdin <= cInactivated;
				
				-- go to the ACK1 framestate
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.FrameState <= Ack1;
				end if;
			
			when Ack1 =>
				-- set the data line to high to release the bus line and wait for acknowledge
				NextR.Sdin <= cActivated;
				
				-- check if data line is high on a rising edge of the clock and signal an ACK error if so
				if (R.Sclk = cInactivated and iStrobeI2C = cActivated) then
					if (ioI2cSdin = cActivated) then
						NextR.Activity <= Idle;
						NextR.AckError <= cActivated;
					end if;
				end if;
				
				-- Prepare the bitcounter for the data bits and go to the Data1 framestate
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.BitCtr <= (R.Data'length - 1);
					NextR.FrameState <= Data1;
				end if;
			
			when Data1 =>
				-- set the data line to the current data bit
				NextR.Sdin <= R.Data(R.BitCtr);
				
				-- prepare the next data on a falling edge of sclk or go to the ACK2 framestate
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.BitCtr <= R.BitCtr - 1;
					if (R.BitCtr = 8) then
						NextR.FrameState <= Ack2;
					end if;
				end if;
			
			when Ack2 =>
				-- release the bus line
				NextR.Sdin <= cActivated;
				
				-- check if data line is high on a rising edge of the clock and signal an ACK error if so
				if (R.Sclk = cInactivated and iStrobeI2C = cActivated) then
					if (ioI2cSdin = cActivated) then
						NextR.Activity <= Idle;
						NextR.AckError <= cActivated;
					end if;
				end if;
				
				-- go to the Data2 framestate on the falling edge of sclk
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.FrameState <= Data2;
				end if;
				
			when Data2 =>
				-- set the data line to the current data bit
				NextR.Sdin <= R.Data(R.BitCtr);
				
				-- prepare the next data on a falling edge of sclk or go to the ACK3 framestate
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					if (R.BitCtr = 0) then
						NextR.FrameState <= Ack3;
					else
						NextR.BitCtr <= R.BitCtr - 1;
					end if;
				end if;
				
			when Ack3 =>
				-- release the bus line
				NextR.Sdin <= cActivated;
				
				-- check if data line is high on a rising edge of the clock and signal an ACK error if so
				if (R.Sclk = cInactivated and iStrobeI2C = cActivated) then
					if (ioI2cSdin = cActivated) then
						NextR.Activity <= Idle;
						NextR.AckError <= cActivated;
					end if;
				end if;
				
				-- go to the Stop framestate on the falling edge of sclk
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.FrameState <= Stop;
				end if;
				
			when Stop =>
				-- release the bus line
				NextR.Sdin <= cInactivated;
				
				-- on falling edge of sclk keep clock high and pull up data line
				if (R.Sclk = cActivated and iStrobeI2C = cActivated) then
					NextR.Sdin <= cActivated;
					NextR.Sclk <= cActivated;
					NextR.FrameState <= Idle;
				end if;
		end case;
    
  end process NextStateAndOutput;

  -----------------------------------------------------------------------------
  -- Write to Outputs
  -----------------------------------------------------------------------------
  oI2cSclk  <= '0' when (R.Sclk = cInactivated) else 'Z';
  ioI2cSdin <= '0' when (R.Sdin = cInactivated) else 'Z';
  oAckError <= R.AckError;
  oConfigured <= R.Configured;

end Rtl;
