-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "10/12/2017 17:05:25"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TbdConfigureCodecViaI2c IS
    PORT (
	iClk : IN std_logic;
	inResetAsync : IN std_logic;
	oI2cSclk : OUT std_logic;
	ioI2cSdin : INOUT std_logic;
	oMclk : OUT std_logic;
	iBclk : IN std_logic;
	iADCdat : IN std_logic;
	iADClrc : IN std_logic;
	oDACdat : OUT std_logic;
	iDAClrc : IN std_logic;
	oLed : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(9 DOWNTO 0)
	);
END TbdConfigureCodecViaI2c;

-- Design Ports Information
-- oI2cSclk	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oMclk	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iADClrc	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- oDACdat	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iDAClrc	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- oLed[0]	=>  Location: PIN_V16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[1]	=>  Location: PIN_W16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[2]	=>  Location: PIN_V17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[3]	=>  Location: PIN_V18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[4]	=>  Location: PIN_W17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[5]	=>  Location: PIN_W19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[6]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[7]	=>  Location: PIN_W20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[8]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[9]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ioI2cSdin	=>  Location: PIN_K12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iADCdat	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iBclk	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iClk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF TbdConfigureCodecViaI2c IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iClk : std_logic;
SIGNAL ww_inResetAsync : std_logic;
SIGNAL ww_oI2cSclk : std_logic;
SIGNAL ww_oMclk : std_logic;
SIGNAL ww_iBclk : std_logic;
SIGNAL ww_iADCdat : std_logic;
SIGNAL ww_iADClrc : std_logic;
SIGNAL ww_oDACdat : std_logic;
SIGNAL ww_iDAClrc : std_logic;
SIGNAL ww_oLed : std_logic_vector(9 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iADClrc~input_o\ : std_logic;
SIGNAL \iDAClrc~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \GenMclk|ClkCounter[0]~0_combout\ : std_logic;
SIGNAL \GenMclk|DivdClk~q\ : std_logic;
SIGNAL \GenMclk|DivdClk~0_combout\ : std_logic;
SIGNAL \GenMclk|DivdClk~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[2]~3_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[3]~2_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[4]~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[5]~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|Equal0~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[2]~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[2]~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack2~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector8~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[0]~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[1]~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[1]~7_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector4~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~2\ : std_logic;
SIGNAL \ConfigureCodec|Add0~25_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~26\ : std_logic;
SIGNAL \ConfigureCodec|Add0~21_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~22\ : std_logic;
SIGNAL \ConfigureCodec|Add0~17_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~18\ : std_logic;
SIGNAL \ConfigureCodec|Add0~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~14\ : std_logic;
SIGNAL \ConfigureCodec|Add0~9_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~10\ : std_logic;
SIGNAL \ConfigureCodec|Add0~5_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~q\ : std_logic;
SIGNAL \WaitCtr[0]~1_combout\ : std_logic;
SIGNAL \WaitCtr[1]~0_combout\ : std_logic;
SIGNAL \Start~0_combout\ : std_logic;
SIGNAL \Start~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~0_combout\ : std_logic;
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|Selector17~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Mux5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~q\ : std_logic;
SIGNAL \iADCdat~input_o\ : std_logic;
SIGNAL \ConfigureCodec|Selector17~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AckError~q\ : std_logic;
SIGNAL \iBclk~input_o\ : std_logic;
SIGNAL \BclkDiffersFromMclk~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \GenMclk|ClkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GenStrobeI2C|ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \ConfigureCodec|R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack2~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \GenMclk|ALT_INV_DivdClk~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_inResetAsync~input_o\ : std_logic;
SIGNAL \ALT_INV_iBclk~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector2~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector16~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[1]~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[2]~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector2~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector17~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter\ : std_logic_vector(5 DOWNTO 2);
SIGNAL \ConfigureCodec|ALT_INV_Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~q\ : std_logic;
SIGNAL ALT_INV_WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~q\ : std_logic;
SIGNAL \GenMclk|ALT_INV_ClkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_Start~q\ : std_logic;
SIGNAL \GenMclk|ALT_INV_DivdClk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);

BEGIN

ww_iClk <= iClk;
ww_inResetAsync <= inResetAsync;
oI2cSclk <= ww_oI2cSclk;
oMclk <= ww_oMclk;
ww_iBclk <= iBclk;
ww_iADCdat <= iADCdat;
ww_iADClrc <= iADClrc;
oDACdat <= ww_oDACdat;
ww_iDAClrc <= iDAClrc;
oLed <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oLed);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (vcc & vcc & vcc & \iClk~input_o\);

\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & 
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack2~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Ack2~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ <= NOT \GenStrobeI2C|oStrobe~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sclk~DUPLICATE_q\;
\GenMclk|ALT_INV_DivdClk~DUPLICATE_q\ <= NOT \GenMclk|DivdClk~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\;
\ALT_INV_inResetAsync~input_o\ <= NOT \inResetAsync~input_o\;
\ALT_INV_iBclk~input_o\ <= NOT \iBclk~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\ConfigureCodec|ALT_INV_Selector2~5_combout\ <= NOT \ConfigureCodec|Selector2~5_combout\;
\ConfigureCodec|ALT_INV_Selector16~2_combout\ <= NOT \ConfigureCodec|Selector16~2_combout\;
\ConfigureCodec|ALT_INV_Selector16~1_combout\ <= NOT \ConfigureCodec|Selector16~1_combout\;
\ConfigureCodec|ALT_INV_Mux9~4_combout\ <= NOT \ConfigureCodec|Mux9~4_combout\;
\ConfigureCodec|ALT_INV_Mux9~3_combout\ <= NOT \ConfigureCodec|Mux9~3_combout\;
\ConfigureCodec|ALT_INV_R.Data\(15) <= NOT \ConfigureCodec|R.Data\(15);
\ConfigureCodec|ALT_INV_R.Data\(7) <= NOT \ConfigureCodec|R.Data\(7);
\ConfigureCodec|ALT_INV_R.Data\(11) <= NOT \ConfigureCodec|R.Data\(11);
\ConfigureCodec|ALT_INV_R.Data\(3) <= NOT \ConfigureCodec|R.Data\(3);
\ConfigureCodec|ALT_INV_Mux9~2_combout\ <= NOT \ConfigureCodec|Mux9~2_combout\;
\ConfigureCodec|ALT_INV_R.Data\(13) <= NOT \ConfigureCodec|R.Data\(13);
\ConfigureCodec|ALT_INV_R.Data\(5) <= NOT \ConfigureCodec|R.Data\(5);
\ConfigureCodec|ALT_INV_R.Data\(9) <= NOT \ConfigureCodec|R.Data\(9);
\ConfigureCodec|ALT_INV_R.Data\(1) <= NOT \ConfigureCodec|R.Data\(1);
\ConfigureCodec|ALT_INV_Mux9~1_combout\ <= NOT \ConfigureCodec|Mux9~1_combout\;
\ConfigureCodec|ALT_INV_R.Data\(14) <= NOT \ConfigureCodec|R.Data\(14);
\ConfigureCodec|ALT_INV_R.Data\(6) <= NOT \ConfigureCodec|R.Data\(6);
\ConfigureCodec|ALT_INV_R.Data\(10) <= NOT \ConfigureCodec|R.Data\(10);
\ConfigureCodec|ALT_INV_R.Data\(2) <= NOT \ConfigureCodec|R.Data\(2);
\ConfigureCodec|ALT_INV_Mux9~0_combout\ <= NOT \ConfigureCodec|Mux9~0_combout\;
\ConfigureCodec|ALT_INV_R.Data\(4) <= NOT \ConfigureCodec|R.Data\(4);
\ConfigureCodec|ALT_INV_R.Data\(0) <= NOT \ConfigureCodec|R.Data\(0);
\ConfigureCodec|ALT_INV_R.Data\(12) <= NOT \ConfigureCodec|R.Data\(12);
\ConfigureCodec|ALT_INV_R.BitCtr[1]~6_combout\ <= NOT \ConfigureCodec|R.BitCtr[1]~6_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr[2]~4_combout\ <= NOT \ConfigureCodec|R.BitCtr[2]~4_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~2_combout\ <= NOT \ConfigureCodec|R.BitCtr[3]~2_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~1_combout\ <= NOT \ConfigureCodec|R.BitCtr[3]~1_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~q\ <= NOT \ConfigureCodec|R.FrameState.Start~q\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~0_combout\ <= NOT \ConfigureCodec|R.BitCtr[3]~0_combout\;
\ConfigureCodec|ALT_INV_Selector4~0_combout\ <= NOT \ConfigureCodec|Selector4~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Address~q\ <= NOT \ConfigureCodec|R.FrameState.Address~q\;
\ConfigureCodec|ALT_INV_Selector2~4_combout\ <= NOT \ConfigureCodec|Selector2~4_combout\;
\ConfigureCodec|ALT_INV_R.Sdin~q\ <= NOT \ConfigureCodec|R.Sdin~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ <= NOT \ConfigureCodec|R.FrameState.Data1~q\;
\ConfigureCodec|ALT_INV_NextR~8_combout\ <= NOT \ConfigureCodec|NextR~8_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr\(0) <= NOT \ConfigureCodec|R.BitCtr\(0);
\ConfigureCodec|ALT_INV_R.BitCtr\(1) <= NOT \ConfigureCodec|R.BitCtr\(1);
\ConfigureCodec|ALT_INV_R.BitCtr\(2) <= NOT \ConfigureCodec|R.BitCtr\(2);
\ConfigureCodec|ALT_INV_R.BitCtr\(3) <= NOT \ConfigureCodec|R.BitCtr\(3);
\ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ <= NOT \ConfigureCodec|R.FrameState.Data2~q\;
\ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ <= NOT \ConfigureCodec|R.FrameState.RWBit~q\;
\ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ <= NOT \ConfigureCodec|NextStateAndOutput~2_combout\;
\ConfigureCodec|ALT_INV_Selector17~1_combout\ <= NOT \ConfigureCodec|Selector17~1_combout\;
\GenStrobeI2C|ALT_INV_ClkCounter\(2) <= NOT \GenStrobeI2C|ClkCounter\(2);
\GenStrobeI2C|ALT_INV_ClkCounter\(3) <= NOT \GenStrobeI2C|ClkCounter\(3);
\GenStrobeI2C|ALT_INV_ClkCounter\(4) <= NOT \GenStrobeI2C|ClkCounter\(4);
\GenStrobeI2C|ALT_INV_ClkCounter\(5) <= NOT \GenStrobeI2C|ClkCounter\(5);
\ConfigureCodec|ALT_INV_Selector16~0_combout\ <= NOT \ConfigureCodec|Selector16~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ <= NOT \ConfigureCodec|R.FrameState.Ack3~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ <= NOT \ConfigureCodec|R.FrameState.Ack2~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ <= NOT \ConfigureCodec|R.FrameState.Ack1~q\;
\ConfigureCodec|ALT_INV_R.Configured~0_combout\ <= NOT \ConfigureCodec|R.Configured~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ <= NOT \ConfigureCodec|R.FrameState.Idle~q\;
\ConfigureCodec|ALT_INV_Equal0~0_combout\ <= NOT \ConfigureCodec|Equal0~0_combout\;
\ConfigureCodec|ALT_INV_Selector1~0_combout\ <= NOT \ConfigureCodec|Selector1~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ <= NOT \ConfigureCodec|R.FrameState.Stop~q\;
\ConfigureCodec|ALT_INV_R.Activity~q\ <= NOT \ConfigureCodec|R.Activity~q\;
ALT_INV_WaitCtr(0) <= NOT WaitCtr(0);
ALT_INV_WaitCtr(1) <= NOT WaitCtr(1);
\GenStrobeI2C|ALT_INV_oStrobe~q\ <= NOT \GenStrobeI2C|oStrobe~q\;
\GenMclk|ALT_INV_ClkCounter\(0) <= NOT \GenMclk|ClkCounter\(0);
\ConfigureCodec|ALT_INV_R.Sclk~q\ <= NOT \ConfigureCodec|R.Sclk~q\;
\ConfigureCodec|ALT_INV_R.AckError~q\ <= NOT \ConfigureCodec|R.AckError~q\;
\ConfigureCodec|ALT_INV_R.Configured~q\ <= NOT \ConfigureCodec|R.Configured~q\;
\ALT_INV_Start~q\ <= NOT \Start~q\;
\GenMclk|ALT_INV_DivdClk~q\ <= NOT \GenMclk|DivdClk~q\;
\ConfigureCodec|ALT_INV_R.AddrCtr\(1) <= NOT \ConfigureCodec|R.AddrCtr\(1);
\ConfigureCodec|ALT_INV_R.AddrCtr\(2) <= NOT \ConfigureCodec|R.AddrCtr\(2);
\ConfigureCodec|ALT_INV_R.AddrCtr\(3) <= NOT \ConfigureCodec|R.AddrCtr\(3);
\ConfigureCodec|ALT_INV_R.AddrCtr\(4) <= NOT \ConfigureCodec|R.AddrCtr\(4);
\ConfigureCodec|ALT_INV_R.AddrCtr\(5) <= NOT \ConfigureCodec|R.AddrCtr\(5);
\ConfigureCodec|ALT_INV_R.AddrCtr\(6) <= NOT \ConfigureCodec|R.AddrCtr\(6);
\ConfigureCodec|ALT_INV_R.AddrCtr\(0) <= NOT \ConfigureCodec|R.AddrCtr\(0);

-- Location: IOOBUF_X12_Y81_N19
\oI2cSclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_oI2cSclk);

-- Location: IOOBUF_X2_Y81_N76
\oMclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenMclk|DivdClk~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_oMclk);

-- Location: IOOBUF_X16_Y81_N2
\oDACdat~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \iADCdat~input_o\,
	devoe => ww_devoe,
	o => ww_oDACdat);

-- Location: IOOBUF_X52_Y0_N2
\oLed[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Start~q\,
	devoe => ww_devoe,
	o => ww_oLed(0));

-- Location: IOOBUF_X52_Y0_N19
\oLed[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|R.Configured~q\,
	devoe => ww_devoe,
	o => ww_oLed(1));

-- Location: IOOBUF_X60_Y0_N2
\oLed[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|R.AckError~q\,
	devoe => ww_devoe,
	o => ww_oLed(2));

-- Location: IOOBUF_X80_Y0_N2
\oLed[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \BclkDiffersFromMclk~0_combout\,
	devoe => ww_devoe,
	o => ww_oLed(3));

-- Location: IOOBUF_X60_Y0_N19
\oLed[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(4));

-- Location: IOOBUF_X80_Y0_N19
\oLed[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(5));

-- Location: IOOBUF_X84_Y0_N2
\oLed[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(6));

-- Location: IOOBUF_X89_Y6_N5
\oLed[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(7));

-- Location: IOOBUF_X89_Y8_N5
\oLed[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(8));

-- Location: IOOBUF_X89_Y6_N22
\oLed[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(9));

-- Location: IOOBUF_X12_Y81_N2
\ioI2cSdin~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|ALT_INV_R.Sdin~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ioI2cSdin);

-- Location: IOIBUF_X32_Y0_N1
\iClk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk,
	o => \iClk~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X36_Y0_N1
\inResetAsync~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inResetAsync,
	o => \inResetAsync~input_o\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "480.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 10000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 20,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 24,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 24,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 6,
	pll_m_cnt_prst => 5,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 3,
	pll_n_cnt_lo_div => 2,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_inResetAsync~input_o\,
	refclkin => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\(0),
	tclk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 5,
	dprio0_cnt_lo_div => 5,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "48.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G0
\Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\(0),
	outclk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: LABCELL_X24_Y20_N3
\GenMclk|ClkCounter[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenMclk|ClkCounter[0]~0_combout\ = !\GenMclk|ClkCounter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenMclk|ALT_INV_ClkCounter\(0),
	combout => \GenMclk|ClkCounter[0]~0_combout\);

-- Location: FF_X24_Y20_N5
\GenMclk|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenMclk|ClkCounter[0]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenMclk|ClkCounter\(0));

-- Location: FF_X23_Y20_N32
\GenMclk|DivdClk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenMclk|DivdClk~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \GenMclk|ClkCounter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenMclk|DivdClk~q\);

-- Location: LABCELL_X23_Y20_N30
\GenMclk|DivdClk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenMclk|DivdClk~0_combout\ = !\GenMclk|DivdClk~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenMclk|ALT_INV_DivdClk~q\,
	combout => \GenMclk|DivdClk~0_combout\);

-- Location: FF_X23_Y20_N31
\GenMclk|DivdClk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenMclk|DivdClk~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \GenMclk|ClkCounter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenMclk|DivdClk~DUPLICATE_q\);

-- Location: LABCELL_X24_Y20_N48
\GenStrobeI2C|ClkCounter[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[2]~3_combout\ = ( \GenMclk|DivdClk~DUPLICATE_q\ & ( !\GenMclk|ClkCounter\(0) $ (!\GenStrobeI2C|ClkCounter\(2)) ) ) # ( !\GenMclk|DivdClk~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenMclk|ALT_INV_ClkCounter\(0),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	dataf => \GenMclk|ALT_INV_DivdClk~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[2]~3_combout\);

-- Location: FF_X24_Y20_N50
\GenStrobeI2C|ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[2]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(2));

-- Location: LABCELL_X23_Y20_N27
\GenStrobeI2C|ClkCounter[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[3]~2_combout\ = !\GenStrobeI2C|ClkCounter\(3) $ (((!\GenMclk|ClkCounter\(0)) # ((!\GenStrobeI2C|ClkCounter\(2)) # (!\GenMclk|DivdClk~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000011111111000000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenMclk|ALT_INV_ClkCounter\(0),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datac => \GenMclk|ALT_INV_DivdClk~q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	combout => \GenStrobeI2C|ClkCounter[3]~2_combout\);

-- Location: FF_X23_Y20_N29
\GenStrobeI2C|ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[3]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(3));

-- Location: LABCELL_X23_Y20_N24
\GenStrobeI2C|ClkCounter[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[4]~1_combout\ = ( \GenMclk|DivdClk~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(4) $ (((!\GenMclk|ClkCounter\(0)) # ((!\GenStrobeI2C|ClkCounter\(2)) # (!\GenStrobeI2C|ClkCounter\(3))))) ) ) # ( !\GenMclk|DivdClk~DUPLICATE_q\ & ( 
-- \GenStrobeI2C|ClkCounter\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenMclk|ALT_INV_ClkCounter\(0),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	dataf => \GenMclk|ALT_INV_DivdClk~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[4]~1_combout\);

-- Location: FF_X23_Y20_N25
\GenStrobeI2C|ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[4]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(4));

-- Location: LABCELL_X23_Y20_N18
\GenStrobeI2C|ClkCounter[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[5]~0_combout\ = ( \GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(4) & ( (!\GenStrobeI2C|ClkCounter\(3)) # ((!\GenStrobeI2C|ClkCounter\(2)) # ((!\GenMclk|ClkCounter\(0)) # (!\GenMclk|DivdClk~q\))) ) ) ) # ( 
-- !\GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(4) & ( (\GenStrobeI2C|ClkCounter\(3) & (\GenStrobeI2C|ClkCounter\(2) & (\GenMclk|ClkCounter\(0) & \GenMclk|DivdClk~q\))) ) ) ) # ( \GenStrobeI2C|ClkCounter\(5) & ( !\GenStrobeI2C|ClkCounter\(4) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datac => \GenMclk|ALT_INV_ClkCounter\(0),
	datad => \GenMclk|ALT_INV_DivdClk~q\,
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	combout => \GenStrobeI2C|ClkCounter[5]~0_combout\);

-- Location: FF_X23_Y20_N20
\GenStrobeI2C|ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[5]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(5));

-- Location: LABCELL_X23_Y20_N48
\GenStrobeI2C|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|Equal0~0_combout\ = ( \GenMclk|ClkCounter\(0) & ( \GenStrobeI2C|ClkCounter\(4) & ( (\GenStrobeI2C|ClkCounter\(5) & (\GenStrobeI2C|ClkCounter\(2) & (\GenStrobeI2C|ClkCounter\(3) & \GenMclk|DivdClk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	datad => \GenMclk|ALT_INV_DivdClk~q\,
	datae => \GenMclk|ALT_INV_ClkCounter\(0),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	combout => \GenStrobeI2C|Equal0~0_combout\);

-- Location: FF_X23_Y20_N49
\GenStrobeI2C|oStrobe~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|Equal0~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~DUPLICATE_q\);

-- Location: FF_X23_Y20_N16
\ConfigureCodec|R.Sclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~q\);

-- Location: LABCELL_X24_Y20_N6
\ConfigureCodec|NextStateAndOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextStateAndOutput~2_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|NextStateAndOutput~2_combout\);

-- Location: FF_X23_Y20_N50
\GenStrobeI2C|oStrobe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|Equal0~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~q\);

-- Location: LABCELL_X23_Y20_N45
\ConfigureCodec|Selector2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~5_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.Activity~q\ & (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ((\ConfigureCodec|R.FrameState.Start~q\)))) # (\ConfigureCodec|R.Activity~q\ & 
-- ((!\ConfigureCodec|R.FrameState.Idle~q\) # ((\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Start~q\)))) ) ) # ( !\GenStrobeI2C|oStrobe~q\ & ( \ConfigureCodec|R.FrameState.Start~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector2~5_combout\);

-- Location: FF_X24_Y20_N32
\ConfigureCodec|R.BitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[1]~7_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(1));

-- Location: LABCELL_X24_Y20_N51
\ConfigureCodec|R.BitCtr[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[2]~4_combout\ = ( \ConfigureCodec|R.BitCtr\(2) & ( (!\ConfigureCodec|R.FrameState.Start~q\ & (!\ConfigureCodec|R.BitCtr\(1) & (!\ConfigureCodec|R.FrameState.Ack1~q\ & !\ConfigureCodec|R.BitCtr\(0)))) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr\(2) & ( (!\ConfigureCodec|R.FrameState.Start~q\ & (!\ConfigureCodec|R.FrameState.Ack1~q\ & ((\ConfigureCodec|R.BitCtr\(0)) # (\ConfigureCodec|R.BitCtr\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010100000001000001010000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	combout => \ConfigureCodec|R.BitCtr[2]~4_combout\);

-- Location: LABCELL_X24_Y20_N33
\ConfigureCodec|R.BitCtr[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[2]~5_combout\ = ( \ConfigureCodec|R.BitCtr[3]~0_combout\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & (((\ConfigureCodec|R.BitCtr\(2))))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- ((!\ConfigureCodec|R.BitCtr[3]~1_combout\ & (!\ConfigureCodec|R.BitCtr[2]~4_combout\)) # (\ConfigureCodec|R.BitCtr[3]~1_combout\ & ((\ConfigureCodec|R.BitCtr\(2)))))) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~0_combout\ & ( 
-- (!\ConfigureCodec|NextStateAndOutput~2_combout\ & ((\ConfigureCodec|R.BitCtr\(2)))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & (!\ConfigureCodec|R.BitCtr[2]~4_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111010010100001111101001000000111110110100000011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~1_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[2]~4_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~0_combout\,
	combout => \ConfigureCodec|R.BitCtr[2]~5_combout\);

-- Location: FF_X24_Y20_N35
\ConfigureCodec|R.BitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[2]~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(2));

-- Location: FF_X24_Y20_N34
\ConfigureCodec|R.BitCtr[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[2]~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\);

-- Location: FF_X24_Y20_N37
\ConfigureCodec|R.BitCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[0]~8_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X25_Y20_N9
\ConfigureCodec|NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~8_combout\ = ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~8_combout\);

-- Location: FF_X24_Y20_N26
\ConfigureCodec|R.BitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[3]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(3));

-- Location: FF_X24_Y20_N14
\ConfigureCodec|R.FrameState.Data1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector6~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~q\);

-- Location: LABCELL_X24_Y20_N12
\ConfigureCodec|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector6~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( (\ConfigureCodec|R.FrameState.Data1~q\) # (\ConfigureCodec|NextStateAndOutput~2_combout\) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( 
-- (\ConfigureCodec|R.FrameState.Data1~q\ & ((!\ConfigureCodec|NextR~8_combout\) # ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # (!\ConfigureCodec|R.BitCtr\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111110000000001111111000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datab => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	combout => \ConfigureCodec|Selector6~0_combout\);

-- Location: FF_X24_Y20_N13
\ConfigureCodec|R.FrameState.Data1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector6~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\);

-- Location: FF_X24_Y20_N17
\ConfigureCodec|R.FrameState.Ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack2~q\);

-- Location: LABCELL_X24_Y20_N15
\ConfigureCodec|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector7~0_combout\ = ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & (((\ConfigureCodec|R.FrameState.Ack2~q\)))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- (\ConfigureCodec|NextR~8_combout\ & (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\))) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & \ConfigureCodec|R.FrameState.Ack2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000001110011010000000111001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datab => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector7~0_combout\);

-- Location: FF_X24_Y20_N16
\ConfigureCodec|R.FrameState.Ack2~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack2~DUPLICATE_q\);

-- Location: LABCELL_X23_Y20_N36
\ConfigureCodec|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector8~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack2~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Data2~q\) # (\ConfigureCodec|NextStateAndOutput~2_combout\) ) ) # ( !\ConfigureCodec|R.FrameState.Ack2~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.FrameState.Data2~q\ & ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # ((!\ConfigureCodec|NextR~8_combout\) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111011000000001111101101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector8~0_combout\);

-- Location: FF_X23_Y20_N37
\ConfigureCodec|R.FrameState.Data2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector8~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data2~q\);

-- Location: LABCELL_X24_Y20_N18
\ConfigureCodec|R.BitCtr[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[3]~0_combout\ = ( !\ConfigureCodec|R.FrameState.Address~q\ & ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Data2~q\ ) ) ) # ( \ConfigureCodec|R.FrameState.Address~q\ & ( 
-- !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(2) & (!\ConfigureCodec|R.BitCtr\(1) & !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\)) ) ) ) # ( !\ConfigureCodec|R.FrameState.Address~q\ & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- ( (!\ConfigureCodec|R.FrameState.Data2~q\) # ((!\ConfigureCodec|R.BitCtr\(2) & (!\ConfigureCodec|R.BitCtr\(1) & !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100011110000100010000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.BitCtr[3]~0_combout\);

-- Location: LABCELL_X24_Y20_N36
\ConfigureCodec|R.BitCtr[0]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[0]~8_combout\ = ( \ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\) # (\ConfigureCodec|R.FrameState.Ack1~q\) ) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( (\ConfigureCodec|NextStateAndOutput~2_combout\ & ((!\ConfigureCodec|R.FrameState.Start~q\) # (\ConfigureCodec|R.FrameState.Ack1~q\))) ) ) ) # ( 
-- \ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\) # (((\ConfigureCodec|R.BitCtr[3]~0_combout\ & !\ConfigureCodec|R.FrameState.Start~q\)) # 
-- (\ConfigureCodec|R.FrameState.Ack1~q\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( (\ConfigureCodec|NextStateAndOutput~2_combout\ & (((!\ConfigureCodec|R.BitCtr[3]~0_combout\ & 
-- !\ConfigureCodec|R.FrameState.Start~q\)) # (\ConfigureCodec|R.FrameState.Ack1~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001010101101110101111111101010000010101011010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	combout => \ConfigureCodec|R.BitCtr[0]~8_combout\);

-- Location: FF_X24_Y20_N38
\ConfigureCodec|R.BitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[0]~8_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(0));

-- Location: LABCELL_X24_Y20_N0
\ConfigureCodec|R.BitCtr[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[1]~6_combout\ = ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( (!\ConfigureCodec|R.FrameState.Start~q\ & (!\ConfigureCodec|R.BitCtr\(1) $ (!\ConfigureCodec|R.BitCtr\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000000000001111000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	combout => \ConfigureCodec|R.BitCtr[1]~6_combout\);

-- Location: LABCELL_X24_Y20_N30
\ConfigureCodec|R.BitCtr[1]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[1]~7_combout\ = ( \ConfigureCodec|R.BitCtr[3]~0_combout\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & (((\ConfigureCodec|R.BitCtr\(1))))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- ((!\ConfigureCodec|R.BitCtr[3]~1_combout\ & (!\ConfigureCodec|R.BitCtr[1]~6_combout\)) # (\ConfigureCodec|R.BitCtr[3]~1_combout\ & ((\ConfigureCodec|R.BitCtr\(1)))))) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~0_combout\ & ( 
-- (!\ConfigureCodec|NextStateAndOutput~2_combout\ & ((\ConfigureCodec|R.BitCtr\(1)))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & (!\ConfigureCodec|R.BitCtr[1]~6_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111010010100001111101001000000111110110100000011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~1_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[1]~6_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~0_combout\,
	combout => \ConfigureCodec|R.BitCtr[1]~7_combout\);

-- Location: FF_X24_Y20_N31
\ConfigureCodec|R.BitCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[1]~7_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\);

-- Location: MLABCELL_X25_Y20_N48
\ConfigureCodec|Selector2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~4_combout\ = ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Sclk~DUPLICATE_q\))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector2~4_combout\);

-- Location: LABCELL_X24_Y20_N54
\ConfigureCodec|Selector2~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~6_combout\ = ( \ConfigureCodec|R.FrameState.Address~q\ & ( \ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|Selector2~5_combout\ & ((!\ConfigureCodec|Selector2~4_combout\) # ((\ConfigureCodec|R.BitCtr\(3) & 
-- !\ConfigureCodec|R.FrameState.Data1~q\)))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Address~q\ & ( \ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|Selector2~5_combout\ & ((!\ConfigureCodec|Selector2~4_combout\) # ((\ConfigureCodec|R.BitCtr\(3) & 
-- !\ConfigureCodec|R.FrameState.Data1~q\)))) ) ) ) # ( \ConfigureCodec|R.FrameState.Address~q\ & ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|Selector2~5_combout\ & ((!\ConfigureCodec|Selector2~4_combout\) # ((\ConfigureCodec|R.BitCtr\(3) & 
-- !\ConfigureCodec|R.FrameState.Data1~q\)))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Address~q\ & ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|Selector2~5_combout\ & ((!\ConfigureCodec|Selector2~4_combout\) # 
-- ((!\ConfigureCodec|R.BitCtr\(3)) # (!\ConfigureCodec|R.FrameState.Data1~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010100010001010100010001000101010001000100010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector2~5_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector2~4_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	combout => \ConfigureCodec|Selector2~6_combout\);

-- Location: FF_X24_Y20_N56
\ConfigureCodec|R.FrameState.Start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector2~6_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Start~q\);

-- Location: LABCELL_X24_Y20_N42
\ConfigureCodec|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector3~0_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( ((\ConfigureCodec|R.FrameState.Address~q\ & ((!\ConfigureCodec|NextR~8_combout\) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)))) # 
-- (\ConfigureCodec|R.FrameState.Start~q\) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( \ConfigureCodec|R.FrameState.Address~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010101111101110101010111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector3~0_combout\);

-- Location: FF_X24_Y20_N43
\ConfigureCodec|R.FrameState.Address\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Address~q\);

-- Location: MLABCELL_X25_Y20_N45
\ConfigureCodec|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector4~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.RWBit~q\ & \ConfigureCodec|R.Sclk~DUPLICATE_q\) ) ) # ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.RWBit~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector4~0_combout\);

-- Location: MLABCELL_X25_Y20_N0
\ConfigureCodec|Selector4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector4~1_combout\ = ( \ConfigureCodec|Selector4~0_combout\ & ( \ConfigureCodec|Selector2~4_combout\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((!\ConfigureCodec|R.FrameState.Data2~q\))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ 
-- & (!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\)) ) ) ) # ( !\ConfigureCodec|Selector4~0_combout\ & ( \ConfigureCodec|Selector2~4_combout\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Address~q\ & 
-- !\ConfigureCodec|R.FrameState.Data2~q\)) ) ) ) # ( \ConfigureCodec|Selector4~0_combout\ & ( !\ConfigureCodec|Selector2~4_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100100010000000001111101001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datae => \ConfigureCodec|ALT_INV_Selector4~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector2~4_combout\,
	combout => \ConfigureCodec|Selector4~1_combout\);

-- Location: FF_X25_Y20_N1
\ConfigureCodec|R.FrameState.RWBit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector4~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.RWBit~q\);

-- Location: FF_X24_Y20_N8
\ConfigureCodec|R.FrameState.Ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.FrameState.RWBit~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|NextStateAndOutput~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack1~q\);

-- Location: LABCELL_X24_Y20_N9
\ConfigureCodec|R.BitCtr[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[3]~1_combout\ = ( !\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( (!\ConfigureCodec|R.FrameState.Ack1~q\ & !\ConfigureCodec|R.FrameState.Start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	combout => \ConfigureCodec|R.BitCtr[3]~1_combout\);

-- Location: LABCELL_X24_Y20_N45
\ConfigureCodec|R.BitCtr[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[3]~2_combout\ = ( \ConfigureCodec|R.BitCtr\(2) & ( (!\ConfigureCodec|R.FrameState.Start~q\ & \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) ) ) # ( !\ConfigureCodec|R.BitCtr\(2) & ( (!\ConfigureCodec|R.FrameState.Start~q\ & 
-- (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ $ (((\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\) # (\ConfigureCodec|R.BitCtr\(1)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000100010100000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	combout => \ConfigureCodec|R.BitCtr[3]~2_combout\);

-- Location: LABCELL_X24_Y20_N24
\ConfigureCodec|R.BitCtr[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.BitCtr[3]~3_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.BitCtr[3]~0_combout\ & ( (((!\ConfigureCodec|NextStateAndOutput~2_combout\) # (\ConfigureCodec|R.BitCtr[3]~2_combout\)) # (\ConfigureCodec|R.FrameState.Ack1~q\)) 
-- # (\ConfigureCodec|R.BitCtr[3]~1_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.BitCtr[3]~0_combout\ & ( (!\ConfigureCodec|R.BitCtr[3]~1_combout\ & (\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- ((\ConfigureCodec|R.BitCtr[3]~2_combout\) # (\ConfigureCodec|R.FrameState.Ack1~q\)))) ) ) ) # ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.BitCtr[3]~0_combout\ & ( ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # 
-- (\ConfigureCodec|R.BitCtr[3]~2_combout\)) # (\ConfigureCodec|R.FrameState.Ack1~q\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.BitCtr[3]~0_combout\ & ( (\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- ((\ConfigureCodec|R.BitCtr[3]~2_combout\) # (\ConfigureCodec|R.FrameState.Ack1~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001111111100111111111100000010000010101111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[3]~1_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datac => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[3]~2_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~0_combout\,
	combout => \ConfigureCodec|R.BitCtr[3]~3_combout\);

-- Location: FF_X24_Y20_N25
\ConfigureCodec|R.BitCtr[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.BitCtr[3]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y20_N39
\ConfigureCodec|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector9~0_combout\ = ( \ConfigureCodec|R.FrameState.Data2~q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & (((\ConfigureCodec|R.FrameState.Ack3~q\)))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|NextR~8_combout\))) ) ) # ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & \ConfigureCodec|R.FrameState.Ack3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000000100101011100000010010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	combout => \ConfigureCodec|Selector9~0_combout\);

-- Location: FF_X23_Y20_N41
\ConfigureCodec|R.FrameState.Ack3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack3~q\);

-- Location: FF_X23_Y20_N59
\ConfigureCodec|R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.FrameState.Ack3~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|NextStateAndOutput~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~q\);

-- Location: LABCELL_X23_Y20_N12
\ConfigureCodec|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~1_combout\ = ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( ((\ConfigureCodec|R.Activity~q\ & \GenStrobeI2C|oStrobe~q\)) # (\ConfigureCodec|R.FrameState.Idle~q\) ) ) # ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( 
-- (!\GenStrobeI2C|oStrobe~q\ & (((\ConfigureCodec|R.FrameState.Idle~q\)))) # (\GenStrobeI2C|oStrobe~q\ & (!\ConfigureCodec|R.FrameState.Stop~q\ & ((\ConfigureCodec|R.FrameState.Idle~q\) # (\ConfigureCodec|R.Activity~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010011111100000001001111110000000101111111110000010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~1_combout\);

-- Location: FF_X23_Y20_N13
\ConfigureCodec|R.FrameState.Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector1~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Idle~q\);

-- Location: LABCELL_X23_Y20_N0
\ConfigureCodec|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~0_combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.FrameState.Stop~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~0_combout\);

-- Location: LABCELL_X27_Y20_N30
\ConfigureCodec|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~1_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))
-- \ConfigureCodec|Add0~2\ = CARRY(( \ConfigureCodec|R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	cin => GND,
	sumout => \ConfigureCodec|Add0~1_sumout\,
	cout => \ConfigureCodec|Add0~2\);

-- Location: FF_X27_Y20_N31
\ConfigureCodec|R.AddrCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y20_N18
\ConfigureCodec|R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( ((\ConfigureCodec|Selector1~0_combout\ & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (!\ConfigureCodec|Equal0~0_combout\)))) # (\ConfigureCodec|R.Configured~0_combout\) ) ) 
-- # ( !\ConfigureCodec|R.Activity~q\ & ( \ConfigureCodec|R.Configured~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111111011110000111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector1~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|R.AddrCtr[6]~0_combout\);

-- Location: FF_X27_Y20_N32
\ConfigureCodec|R.AddrCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(0));

-- Location: LABCELL_X27_Y20_N33
\ConfigureCodec|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~25_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(1) ) + ( GND ) + ( \ConfigureCodec|Add0~2\ ))
-- \ConfigureCodec|Add0~26\ = CARRY(( \ConfigureCodec|R.AddrCtr\(1) ) + ( GND ) + ( \ConfigureCodec|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	cin => \ConfigureCodec|Add0~2\,
	sumout => \ConfigureCodec|Add0~25_sumout\,
	cout => \ConfigureCodec|Add0~26\);

-- Location: FF_X27_Y20_N35
\ConfigureCodec|R.AddrCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(1));

-- Location: LABCELL_X27_Y20_N36
\ConfigureCodec|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~21_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(2) ) + ( GND ) + ( \ConfigureCodec|Add0~26\ ))
-- \ConfigureCodec|Add0~22\ = CARRY(( \ConfigureCodec|R.AddrCtr\(2) ) + ( GND ) + ( \ConfigureCodec|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	cin => \ConfigureCodec|Add0~26\,
	sumout => \ConfigureCodec|Add0~21_sumout\,
	cout => \ConfigureCodec|Add0~22\);

-- Location: FF_X27_Y20_N37
\ConfigureCodec|R.AddrCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(2));

-- Location: LABCELL_X27_Y20_N39
\ConfigureCodec|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~17_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(3) ) + ( GND ) + ( \ConfigureCodec|Add0~22\ ))
-- \ConfigureCodec|Add0~18\ = CARRY(( \ConfigureCodec|R.AddrCtr\(3) ) + ( GND ) + ( \ConfigureCodec|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	cin => \ConfigureCodec|Add0~22\,
	sumout => \ConfigureCodec|Add0~17_sumout\,
	cout => \ConfigureCodec|Add0~18\);

-- Location: FF_X27_Y20_N40
\ConfigureCodec|R.AddrCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(3));

-- Location: LABCELL_X27_Y20_N42
\ConfigureCodec|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~13_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(4) ) + ( GND ) + ( \ConfigureCodec|Add0~18\ ))
-- \ConfigureCodec|Add0~14\ = CARRY(( \ConfigureCodec|R.AddrCtr\(4) ) + ( GND ) + ( \ConfigureCodec|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	cin => \ConfigureCodec|Add0~18\,
	sumout => \ConfigureCodec|Add0~13_sumout\,
	cout => \ConfigureCodec|Add0~14\);

-- Location: FF_X27_Y20_N44
\ConfigureCodec|R.AddrCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(4));

-- Location: LABCELL_X27_Y20_N45
\ConfigureCodec|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~9_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(5) ) + ( GND ) + ( \ConfigureCodec|Add0~14\ ))
-- \ConfigureCodec|Add0~10\ = CARRY(( \ConfigureCodec|R.AddrCtr\(5) ) + ( GND ) + ( \ConfigureCodec|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	cin => \ConfigureCodec|Add0~14\,
	sumout => \ConfigureCodec|Add0~9_sumout\,
	cout => \ConfigureCodec|Add0~10\);

-- Location: FF_X27_Y20_N47
\ConfigureCodec|R.AddrCtr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(5));

-- Location: LABCELL_X27_Y20_N48
\ConfigureCodec|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~5_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(6) ) + ( GND ) + ( \ConfigureCodec|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	cin => \ConfigureCodec|Add0~10\,
	sumout => \ConfigureCodec|Add0~5_sumout\);

-- Location: FF_X27_Y20_N49
\ConfigureCodec|R.AddrCtr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(6));

-- Location: LABCELL_X27_Y20_N12
\ConfigureCodec|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Equal0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr\(5) & ( !\ConfigureCodec|R.AddrCtr\(6) & ( (!\ConfigureCodec|R.AddrCtr\(1) & (!\ConfigureCodec|R.AddrCtr\(4) & (!\ConfigureCodec|R.AddrCtr\(2) & \ConfigureCodec|R.AddrCtr\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	combout => \ConfigureCodec|Equal0~0_combout\);

-- Location: LABCELL_X27_Y20_N0
\ConfigureCodec|R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~1_combout\ = ( \ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Configured~0_combout\) # (\ConfigureCodec|R.Activity~q\) ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( 
-- \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Activity~q\ & (((\ConfigureCodec|Selector1~0_combout\ & \ConfigureCodec|Equal0~0_combout\)) # (\ConfigureCodec|R.Configured~0_combout\))) ) ) ) # ( \ConfigureCodec|R.Configured~q\ & ( 
-- !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Configured~0_combout\) # (\ConfigureCodec|R.Activity~q\) ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.Configured~0_combout\ & \ConfigureCodec|R.Activity~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111100000000000111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector1~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datae => \ConfigureCodec|ALT_INV_R.Configured~q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Configured~1_combout\);

-- Location: FF_X27_Y20_N1
\ConfigureCodec|R.Configured\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Configured~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Configured~q\);

-- Location: LABCELL_X31_Y16_N42
\WaitCtr[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[0]~1_combout\ = ( WaitCtr(0) & ( ((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # (WaitCtr(1))) # (\ConfigureCodec|R.Configured~q\) ) ) # ( !WaitCtr(0) & ( (!\ConfigureCodec|R.Configured~q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010111101011111111100001010000010101111010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => ALT_INV_WaitCtr(1),
	datae => ALT_INV_WaitCtr(0),
	combout => \WaitCtr[0]~1_combout\);

-- Location: FF_X31_Y16_N43
\WaitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[0]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(0));

-- Location: LABCELL_X31_Y16_N6
\WaitCtr[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[1]~0_combout\ = ( WaitCtr(1) & ( WaitCtr(0) ) ) # ( !WaitCtr(1) & ( WaitCtr(0) & ( (!\ConfigureCodec|R.Configured~q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\) ) ) ) # ( WaitCtr(1) & ( !WaitCtr(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001010000010101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datae => ALT_INV_WaitCtr(1),
	dataf => ALT_INV_WaitCtr(0),
	combout => \WaitCtr[1]~0_combout\);

-- Location: FF_X31_Y16_N8
\WaitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[1]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(1));

-- Location: LABCELL_X31_Y16_N33
\Start~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Start~0_combout\ = ( \Start~q\ & ( WaitCtr(0) & ( (!\ConfigureCodec|R.Configured~q\ & ((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # (WaitCtr(1)))) ) ) ) # ( !\Start~q\ & ( WaitCtr(0) & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (WaitCtr(1) & 
-- !\ConfigureCodec|R.Configured~q\)) ) ) ) # ( \Start~q\ & ( !WaitCtr(0) & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Configured~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100000000000000101000000001010111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => ALT_INV_WaitCtr(1),
	datad => \ConfigureCodec|ALT_INV_R.Configured~q\,
	datae => \ALT_INV_Start~q\,
	dataf => ALT_INV_WaitCtr(0),
	combout => \Start~0_combout\);

-- Location: FF_X31_Y16_N34
Start : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Start~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Start~q\);

-- Location: LABCELL_X23_Y20_N3
\ConfigureCodec|R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~0_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & (\Start~q\ & !\ConfigureCodec|R.Activity~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datac => \ALT_INV_Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|R.Configured~0_combout\);

-- Location: IOIBUF_X12_Y81_N1
\ioI2cSdin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ioI2cSdin,
	o => \ioI2cSdin~input_o\);

-- Location: LABCELL_X23_Y20_N54
\ConfigureCodec|Selector17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector17~1_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( \ConfigureCodec|R.FrameState.Ack3~q\ & ( (\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ioI2cSdin~input_o\)) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Ack1~q\ & ( \ConfigureCodec|R.FrameState.Ack3~q\ & ( (\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ioI2cSdin~input_o\)) ) ) ) # ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( 
-- !\ConfigureCodec|R.FrameState.Ack3~q\ & ( (\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ioI2cSdin~input_o\)) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( !\ConfigureCodec|R.FrameState.Ack3~q\ & ( (\GenStrobeI2C|oStrobe~q\ & 
-- (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (\ioI2cSdin~input_o\ & \ConfigureCodec|R.FrameState.Ack2~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	combout => \ConfigureCodec|Selector17~1_combout\);

-- Location: LABCELL_X27_Y20_N6
\ConfigureCodec|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( \ConfigureCodec|Equal0~0_combout\ & ( (!\ConfigureCodec|R.Configured~0_combout\ & (!\ConfigureCodec|Selector17~1_combout\ & ((!\ConfigureCodec|Selector1~0_combout\) # 
-- (!\ConfigureCodec|R.AddrCtr\(0))))) ) ) ) # ( !\ConfigureCodec|R.Activity~q\ & ( \ConfigureCodec|Equal0~0_combout\ & ( (\ConfigureCodec|R.Configured~0_combout\ & !\ConfigureCodec|Selector17~1_combout\) ) ) ) # ( \ConfigureCodec|R.Activity~q\ & ( 
-- !\ConfigureCodec|Equal0~0_combout\ & ( (!\ConfigureCodec|R.Configured~0_combout\ & !\ConfigureCodec|Selector17~1_combout\) ) ) ) # ( !\ConfigureCodec|R.Activity~q\ & ( !\ConfigureCodec|Equal0~0_combout\ & ( (\ConfigureCodec|R.Configured~0_combout\ & 
-- !\ConfigureCodec|Selector17~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000101000001010000001010000010100001010000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector1~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector17~1_combout\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datae => \ConfigureCodec|ALT_INV_R.Activity~q\,
	dataf => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	combout => \ConfigureCodec|Selector0~0_combout\);

-- Location: FF_X27_Y20_N8
\ConfigureCodec|R.Activity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector0~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Activity~q\);

-- Location: LABCELL_X23_Y20_N15
\ConfigureCodec|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~0_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.FrameState.Stop~q\ & (\ConfigureCodec|R.FrameState.Idle~q\ & (!\ConfigureCodec|R.Activity~q\ $ (!\ConfigureCodec|R.Sclk~q\)))) # 
-- (\ConfigureCodec|R.FrameState.Stop~q\ & (!\ConfigureCodec|R.Activity~q\ & ((\ConfigureCodec|R.Sclk~q\)))) ) ) # ( !\GenStrobeI2C|oStrobe~q\ & ( (\ConfigureCodec|R.Sclk~q\ & ((\ConfigureCodec|R.FrameState.Idle~q\) # (\ConfigureCodec|R.FrameState.Stop~q\))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000111111000000000011111100000100001010100000010000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector15~0_combout\);

-- Location: FF_X23_Y20_N17
\ConfigureCodec|R.Sclk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~DUPLICATE_q\);

-- Location: FF_X27_Y20_N34
\ConfigureCodec|R.AddrCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\);

-- Location: MLABCELL_X25_Y20_N30
\ConfigureCodec|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux5~0_combout\ = ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr\(2) & !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux5~0_combout\);

-- Location: LABCELL_X23_Y20_N33
\ConfigureCodec|R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[15]~0_combout\ = (\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.FrameState.Start~q\ & \ConfigureCodec|R.Activity~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|R.Data[15]~0_combout\);

-- Location: FF_X25_Y20_N31
\ConfigureCodec|R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux5~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(2));

-- Location: MLABCELL_X25_Y20_N12
\ConfigureCodec|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux1~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr\(2)) # 
-- (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux1~0_combout\);

-- Location: FF_X25_Y20_N14
\ConfigureCodec|R.Data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux1~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(6));

-- Location: FF_X25_Y20_N38
\ConfigureCodec|R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(10));

-- Location: FF_X27_Y20_N14
\ConfigureCodec|R.Data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(5),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(14));

-- Location: MLABCELL_X25_Y20_N36
\ConfigureCodec|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~1_combout\ = ( \ConfigureCodec|R.Data\(10) & ( \ConfigureCodec|R.Data\(14) & ( ((!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(2))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(6))))) 
-- # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.Data\(10) & ( \ConfigureCodec|R.Data\(14) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(2) & (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\))) # 
-- (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((\ConfigureCodec|R.Data\(6)) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)))) ) ) ) # ( \ConfigureCodec|R.Data\(10) & ( !\ConfigureCodec|R.Data\(14) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & 
-- (((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)) # (\ConfigureCodec|R.Data\(2)))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & \ConfigureCodec|R.Data\(6))))) ) ) ) # ( !\ConfigureCodec|R.Data\(10) & ( 
-- !\ConfigureCodec|R.Data\(14) & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(2))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(6)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001110000010011000111110001000011011100110100111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(2),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(6),
	datae => \ConfigureCodec|ALT_INV_R.Data\(10),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(14),
	combout => \ConfigureCodec|Mux9~1_combout\);

-- Location: LABCELL_X27_Y20_N21
\ConfigureCodec|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux6~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(1) & ( (\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr\(3) & \ConfigureCodec|R.AddrCtr\(2))) ) ) # ( !\ConfigureCodec|R.AddrCtr\(1) & ( 
-- (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000000000010100000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux6~0_combout\);

-- Location: FF_X27_Y20_N22
\ConfigureCodec|R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux6~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(1));

-- Location: LABCELL_X27_Y20_N24
\ConfigureCodec|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux2~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(3) & (\ConfigureCodec|R.AddrCtr\(1) & !\ConfigureCodec|R.AddrCtr\(2))) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.AddrCtr\(3) & (\ConfigureCodec|R.AddrCtr\(1))) # (\ConfigureCodec|R.AddrCtr\(3) & (!\ConfigureCodec|R.AddrCtr\(1) & !\ConfigureCodec|R.AddrCtr\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000001100001111000000110000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux2~0_combout\);

-- Location: FF_X27_Y20_N26
\ConfigureCodec|R.Data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux2~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(5));

-- Location: FF_X27_Y20_N59
\ConfigureCodec|R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(9));

-- Location: FF_X27_Y20_N56
\ConfigureCodec|R.Data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(4),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(13));

-- Location: LABCELL_X27_Y20_N54
\ConfigureCodec|Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~2_combout\ = ( \ConfigureCodec|R.Data\(13) & ( \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Data\(5)) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.Data\(13) & ( 
-- \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & \ConfigureCodec|R.Data\(5)) ) ) ) # ( \ConfigureCodec|R.Data\(13) & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.Data\(1))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(9)))) ) ) ) # ( !\ConfigureCodec|R.Data\(13) & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.Data\(1))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001110111001000100111011100001010000010100101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.Data\(1),
	datac => \ConfigureCodec|ALT_INV_R.Data\(5),
	datad => \ConfigureCodec|ALT_INV_R.Data\(9),
	datae => \ConfigureCodec|ALT_INV_R.Data\(13),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~2_combout\);

-- Location: MLABCELL_X25_Y20_N57
\ConfigureCodec|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux3~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & !\ConfigureCodec|R.AddrCtr\(2)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ $ (!\ConfigureCodec|R.AddrCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux3~0_combout\);

-- Location: FF_X25_Y20_N58
\ConfigureCodec|R.Data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux3~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(4));

-- Location: FF_X25_Y20_N56
\ConfigureCodec|R.Data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(3),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(12));

-- Location: LABCELL_X27_Y20_N27
\ConfigureCodec|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux7~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(1) $ (!\ConfigureCodec|R.AddrCtr\(2))) # (\ConfigureCodec|R.AddrCtr\(3)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.AddrCtr\(3)) # (\ConfigureCodec|R.AddrCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101111011011110110111101101111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux7~0_combout\);

-- Location: FF_X27_Y20_N29
\ConfigureCodec|R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux7~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(0));

-- Location: MLABCELL_X25_Y20_N54
\ConfigureCodec|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~0_combout\ = ( \ConfigureCodec|R.Data\(0) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.Data\(4))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(12)))))) ) ) # ( !\ConfigureCodec|R.Data\(0) & ( (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.Data\(4))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(12)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010011000100000001001111010000110100111101000011010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(4),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(12),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(0),
	combout => \ConfigureCodec|Mux9~0_combout\);

-- Location: MLABCELL_X25_Y20_N33
\ConfigureCodec|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux0~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(2) & (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & !\ConfigureCodec|R.AddrCtr\(3))) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & !\ConfigureCodec|R.AddrCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux0~0_combout\);

-- Location: FF_X25_Y20_N35
\ConfigureCodec|R.Data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux0~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(7));

-- Location: FF_X25_Y20_N19
\ConfigureCodec|R.Data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(2),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(11));

-- Location: FF_X25_Y20_N26
\ConfigureCodec|R.Data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(6),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(15));

-- Location: MLABCELL_X25_Y20_N6
\ConfigureCodec|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux4~0_combout\ = (!\ConfigureCodec|R.AddrCtr\(2) & \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux4~0_combout\);

-- Location: FF_X25_Y20_N8
\ConfigureCodec|R.Data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux4~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(3));

-- Location: MLABCELL_X25_Y20_N24
\ConfigureCodec|Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~3_combout\ = ( \ConfigureCodec|R.Data\(15) & ( \ConfigureCodec|R.Data\(3) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) # (\ConfigureCodec|R.Data\(11))))) # 
-- (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)) # (\ConfigureCodec|R.Data\(7)))) ) ) ) # ( !\ConfigureCodec|R.Data\(15) & ( \ConfigureCodec|R.Data\(3) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & 
-- (((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) # (\ConfigureCodec|R.Data\(11))))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(7) & (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\))) ) ) ) # ( \ConfigureCodec|R.Data\(15) & ( 
-- !\ConfigureCodec|R.Data\(3) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & \ConfigureCodec|R.Data\(11))))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)) # 
-- (\ConfigureCodec|R.Data\(7)))) ) ) ) # ( !\ConfigureCodec|R.Data\(15) & ( !\ConfigureCodec|R.Data\(3) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & \ConfigureCodec|R.Data\(11))))) # 
-- (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(7) & (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011100000100110001111111010000110111001101001111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(7),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(11),
	datae => \ConfigureCodec|ALT_INV_R.Data\(15),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(3),
	combout => \ConfigureCodec|Mux9~3_combout\);

-- Location: MLABCELL_X25_Y20_N18
\ConfigureCodec|Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~4_combout\ = ( \ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~3_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)) # (\ConfigureCodec|Mux9~1_combout\))) # 
-- (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((\ConfigureCodec|Mux9~2_combout\) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~3_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & 
-- (\ConfigureCodec|Mux9~1_combout\ & (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((\ConfigureCodec|Mux9~2_combout\) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)))) ) ) ) # ( \ConfigureCodec|Mux9~0_combout\ & ( 
-- !\ConfigureCodec|Mux9~3_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)) # (\ConfigureCodec|Mux9~1_combout\))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & 
-- (((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & \ConfigureCodec|Mux9~2_combout\)))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( !\ConfigureCodec|Mux9~3_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~1_combout\ & 
-- (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & \ConfigureCodec|Mux9~2_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001001010010101000101111001000000111010101111010011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_Mux9~1_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_Mux9~2_combout\,
	datae => \ConfigureCodec|ALT_INV_Mux9~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~3_combout\,
	combout => \ConfigureCodec|Mux9~4_combout\);

-- Location: LABCELL_X23_Y20_N42
\ConfigureCodec|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~0_combout\ = ( !\ConfigureCodec|R.FrameState.Ack3~q\ & ( (!\ConfigureCodec|R.FrameState.Ack1~q\ & !\ConfigureCodec|R.FrameState.Ack2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	combout => \ConfigureCodec|Selector16~0_combout\);

-- Location: MLABCELL_X25_Y20_N51
\ConfigureCodec|Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~1_combout\ = ( \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Address~q\) ) ) # ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Address~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector16~1_combout\);

-- Location: MLABCELL_X25_Y20_N15
\ConfigureCodec|Selector16~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~2_combout\ = ( !\ConfigureCodec|Selector16~1_combout\ & ( (\ConfigureCodec|R.FrameState.Idle~q\ & (\ConfigureCodec|Selector16~0_combout\ & !\ConfigureCodec|Selector1~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datac => \ConfigureCodec|ALT_INV_Selector16~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector1~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector16~1_combout\,
	combout => \ConfigureCodec|Selector16~2_combout\);

-- Location: MLABCELL_X25_Y20_N42
\ConfigureCodec|Selector16~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~3_combout\ = ( \ConfigureCodec|Selector16~2_combout\ & ( (!\ConfigureCodec|Mux9~4_combout\) # ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & !\ConfigureCodec|R.FrameState.Data2~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011101010111010101110101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Mux9~4_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector16~2_combout\,
	combout => \ConfigureCodec|Selector16~3_combout\);

-- Location: FF_X25_Y20_N43
\ConfigureCodec|R.Sdin\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector16~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sdin~q\);

-- Location: IOIBUF_X8_Y81_N1
\iADCdat~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iADCdat,
	o => \iADCdat~input_o\);

-- Location: LABCELL_X23_Y20_N6
\ConfigureCodec|Selector17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector17~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.Configured~0_combout\) # ((!\ConfigureCodec|Selector16~0_combout\ & (\ioI2cSdin~input_o\ & \ConfigureCodec|R.Sclk~DUPLICATE_q\))) 
-- ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|Selector16~0_combout\ & (\ioI2cSdin~input_o\ & \ConfigureCodec|R.Sclk~DUPLICATE_q\)) ) ) ) # ( \ConfigureCodec|R.AckError~q\ & ( !\GenStrobeI2C|oStrobe~q\ & ( 
-- !\ConfigureCodec|R.Configured~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000011001010101010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector16~0_combout\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector17~0_combout\);

-- Location: FF_X23_Y20_N7
\ConfigureCodec|R.AckError\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Gen48From50ViaPll|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector17~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AckError~q\);

-- Location: IOIBUF_X16_Y81_N18
\iBclk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iBclk,
	o => \iBclk~input_o\);

-- Location: LABCELL_X22_Y60_N0
\BclkDiffersFromMclk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \BclkDiffersFromMclk~0_combout\ = ( !\iBclk~input_o\ & ( \GenMclk|DivdClk~DUPLICATE_q\ ) ) # ( \iBclk~input_o\ & ( !\GenMclk|DivdClk~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_iBclk~input_o\,
	dataf => \GenMclk|ALT_INV_DivdClk~DUPLICATE_q\,
	combout => \BclkDiffersFromMclk~0_combout\);

-- Location: IOIBUF_X8_Y81_N18
\iADClrc~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iADClrc,
	o => \iADClrc~input_o\);

-- Location: IOIBUF_X24_Y81_N1
\iDAClrc~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDAClrc,
	o => \iDAClrc~input_o\);

-- Location: LABCELL_X17_Y22_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


