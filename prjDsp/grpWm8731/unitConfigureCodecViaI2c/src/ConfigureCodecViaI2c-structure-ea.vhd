-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"

-- DATE "10/08/2017 16:33:06"

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

ENTITY 	ConfigureCodecViaI2c IS
    PORT (
	iClk : IN std_logic;
	inResetAsync : IN std_logic;
	iStrobeI2C : IN std_logic;
	iStart : IN std_logic;
	oConfigured : OUT std_logic;
	oAckError : OUT std_logic;
	oI2cSclk : OUT std_logic;
	ioI2cSdin : INOUT std_logic
	);
END ConfigureCodecViaI2c;

-- Design Ports Information
-- oConfigured	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oAckError	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oI2cSclk	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ioI2cSdin	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iStrobeI2C	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iStart	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iClk	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ConfigureCodecViaI2c IS
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
SIGNAL ww_iStrobeI2C : std_logic;
SIGNAL ww_iStart : std_logic;
SIGNAL ww_oConfigured : std_logic;
SIGNAL ww_oAckError : std_logic;
SIGNAL ww_oI2cSclk : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \iClk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \iStrobeI2C~input_o\ : std_logic;
SIGNAL \Selector4~5_combout\ : std_logic;
SIGNAL \R.BitCtr[2]~4_combout\ : std_logic;
SIGNAL \R.BitCtr[2]~5_combout\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
SIGNAL \Selector4~4_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \R.FrameState.Data1~q\ : std_logic;
SIGNAL \NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \R.FrameState.Ack2~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \R.FrameState.Data2~q\ : std_logic;
SIGNAL \Selector4~6_combout\ : std_logic;
SIGNAL \R.FrameState.RWBit~q\ : std_logic;
SIGNAL \R.FrameState.Ack1~q\ : std_logic;
SIGNAL \R.BitCtr[1]~6_combout\ : std_logic;
SIGNAL \R.BitCtr[1]~7_combout\ : std_logic;
SIGNAL \R.BitCtr[0]~0_combout\ : std_logic;
SIGNAL \R.BitCtr[3]~2_combout\ : std_logic;
SIGNAL \R.BitCtr[3]~3_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \R.FrameState.Address~q\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \R.FrameState.Idle~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \R.FrameState.Start~q\ : std_logic;
SIGNAL \R.BitCtr[0]~1_combout\ : std_logic;
SIGNAL \R.BitCtr[0]~8_combout\ : std_logic;
SIGNAL \R.BitCtr[0]~9_combout\ : std_logic;
SIGNAL \NextR~8_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \R.FrameState.Ack3~q\ : std_logic;
SIGNAL \R.FrameState.Stop~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \iStart~input_o\ : std_logic;
SIGNAL \R.Configured~0_combout\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \R.Activity~q\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \R.Sclk~q\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector16~2_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \R.Data[15]~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux9~3_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux9~4_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \Selector16~3_combout\ : std_logic;
SIGNAL \R.Sdin~q\ : std_logic;
SIGNAL \R.Configured~1_combout\ : std_logic;
SIGNAL \R.Configured~q\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \R.AckError~q\ : std_logic;
SIGNAL \R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_iStart~input_o\ : std_logic;
SIGNAL \ALT_INV_iStrobeI2C~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector16~2_combout\ : std_logic;
SIGNAL \ALT_INV_Selector16~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr[0]~8_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr[1]~6_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr[2]~4_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr[3]~2_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr[0]~1_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Start~q\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector4~5_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Address~q\ : std_logic;
SIGNAL \ALT_INV_Selector4~4_combout\ : std_logic;
SIGNAL \ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ALT_INV_NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ALT_INV_Selector17~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector16~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ALT_INV_R.Configured~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Idle~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Stop~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.Activity~q\ : std_logic;
SIGNAL \ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);

BEGIN

ww_iClk <= iClk;
ww_inResetAsync <= inResetAsync;
ww_iStrobeI2C <= iStrobeI2C;
ww_iStart <= iStart;
oConfigured <= ww_oConfigured;
oAckError <= ww_oAckError;
oI2cSclk <= ww_oI2cSclk;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_iStart~input_o\ <= NOT \iStart~input_o\;
\ALT_INV_iStrobeI2C~input_o\ <= NOT \iStrobeI2C~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\ALT_INV_Selector2~0_combout\ <= NOT \Selector2~0_combout\;
\ALT_INV_Selector16~2_combout\ <= NOT \Selector16~2_combout\;
\ALT_INV_Selector16~1_combout\ <= NOT \Selector16~1_combout\;
\ALT_INV_Mux9~4_combout\ <= NOT \Mux9~4_combout\;
\ALT_INV_Mux9~3_combout\ <= NOT \Mux9~3_combout\;
\ALT_INV_R.Data\(15) <= NOT \R.Data\(15);
\ALT_INV_R.Data\(7) <= NOT \R.Data\(7);
\ALT_INV_R.Data\(11) <= NOT \R.Data\(11);
\ALT_INV_R.Data\(3) <= NOT \R.Data\(3);
\ALT_INV_Mux9~2_combout\ <= NOT \Mux9~2_combout\;
\ALT_INV_R.Data\(13) <= NOT \R.Data\(13);
\ALT_INV_R.Data\(5) <= NOT \R.Data\(5);
\ALT_INV_R.Data\(9) <= NOT \R.Data\(9);
\ALT_INV_R.Data\(1) <= NOT \R.Data\(1);
\ALT_INV_Mux9~1_combout\ <= NOT \Mux9~1_combout\;
\ALT_INV_R.Data\(14) <= NOT \R.Data\(14);
\ALT_INV_R.Data\(6) <= NOT \R.Data\(6);
\ALT_INV_R.Data\(10) <= NOT \R.Data\(10);
\ALT_INV_R.Data\(2) <= NOT \R.Data\(2);
\ALT_INV_Mux9~0_combout\ <= NOT \Mux9~0_combout\;
\ALT_INV_R.Data\(4) <= NOT \R.Data\(4);
\ALT_INV_R.Data\(0) <= NOT \R.Data\(0);
\ALT_INV_R.Data\(12) <= NOT \R.Data\(12);
\ALT_INV_R.BitCtr[0]~8_combout\ <= NOT \R.BitCtr[0]~8_combout\;
\ALT_INV_R.BitCtr[1]~6_combout\ <= NOT \R.BitCtr[1]~6_combout\;
\ALT_INV_R.BitCtr[2]~4_combout\ <= NOT \R.BitCtr[2]~4_combout\;
\ALT_INV_R.BitCtr[3]~2_combout\ <= NOT \R.BitCtr[3]~2_combout\;
\ALT_INV_R.BitCtr[0]~1_combout\ <= NOT \R.BitCtr[0]~1_combout\;
\ALT_INV_R.FrameState.Start~q\ <= NOT \R.FrameState.Start~q\;
\ALT_INV_R.BitCtr[0]~0_combout\ <= NOT \R.BitCtr[0]~0_combout\;
\ALT_INV_Selector4~5_combout\ <= NOT \Selector4~5_combout\;
\ALT_INV_R.FrameState.Address~q\ <= NOT \R.FrameState.Address~q\;
\ALT_INV_Selector4~4_combout\ <= NOT \Selector4~4_combout\;
\ALT_INV_R.Sdin~q\ <= NOT \R.Sdin~q\;
\ALT_INV_R.FrameState.Data1~q\ <= NOT \R.FrameState.Data1~q\;
\ALT_INV_NextR~8_combout\ <= NOT \NextR~8_combout\;
\ALT_INV_R.BitCtr\(0) <= NOT \R.BitCtr\(0);
\ALT_INV_R.BitCtr\(1) <= NOT \R.BitCtr\(1);
\ALT_INV_R.BitCtr\(2) <= NOT \R.BitCtr\(2);
\ALT_INV_R.BitCtr\(3) <= NOT \R.BitCtr\(3);
\ALT_INV_R.FrameState.Data2~q\ <= NOT \R.FrameState.Data2~q\;
\ALT_INV_R.FrameState.RWBit~q\ <= NOT \R.FrameState.RWBit~q\;
\ALT_INV_NextStateAndOutput~2_combout\ <= NOT \NextStateAndOutput~2_combout\;
\ALT_INV_Selector17~1_combout\ <= NOT \Selector17~1_combout\;
\ALT_INV_Selector16~0_combout\ <= NOT \Selector16~0_combout\;
\ALT_INV_R.FrameState.Ack3~q\ <= NOT \R.FrameState.Ack3~q\;
\ALT_INV_R.FrameState.Ack2~q\ <= NOT \R.FrameState.Ack2~q\;
\ALT_INV_R.FrameState.Ack1~q\ <= NOT \R.FrameState.Ack1~q\;
\ALT_INV_R.Configured~0_combout\ <= NOT \R.Configured~0_combout\;
\ALT_INV_R.FrameState.Idle~q\ <= NOT \R.FrameState.Idle~q\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Selector1~0_combout\ <= NOT \Selector1~0_combout\;
\ALT_INV_R.Sclk~q\ <= NOT \R.Sclk~q\;
\ALT_INV_R.FrameState.Stop~q\ <= NOT \R.FrameState.Stop~q\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_R.Activity~q\ <= NOT \R.Activity~q\;
\ALT_INV_R.AckError~q\ <= NOT \R.AckError~q\;
\ALT_INV_R.Configured~q\ <= NOT \R.Configured~q\;
\ALT_INV_R.AddrCtr\(0) <= NOT \R.AddrCtr\(0);
\ALT_INV_R.AddrCtr\(3) <= NOT \R.AddrCtr\(3);
\ALT_INV_R.AddrCtr\(4) <= NOT \R.AddrCtr\(4);
\ALT_INV_R.AddrCtr\(5) <= NOT \R.AddrCtr\(5);
\ALT_INV_R.AddrCtr\(6) <= NOT \R.AddrCtr\(6);
\ALT_INV_R.AddrCtr\(1) <= NOT \R.AddrCtr\(1);
\ALT_INV_R.AddrCtr\(2) <= NOT \R.AddrCtr\(2);

-- Location: IOOBUF_X89_Y21_N39
\oI2cSclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_R.Sclk~q\,
	devoe => ww_devoe,
	o => ww_oI2cSclk);

-- Location: IOOBUF_X89_Y20_N79
\oConfigured~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \R.Configured~q\,
	devoe => ww_devoe,
	o => ww_oConfigured);

-- Location: IOOBUF_X89_Y20_N45
\oAckError~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \R.AckError~q\,
	devoe => ww_devoe,
	o => ww_oAckError);

-- Location: IOOBUF_X89_Y23_N39
\ioI2cSdin~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_R.Sdin~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ioI2cSdin);

-- Location: IOIBUF_X89_Y23_N21
\iClk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk,
	o => \iClk~input_o\);

-- Location: CLKCTRL_G11
\iClk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \iClk~input_o\,
	outclk => \iClk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y23_N55
\iStrobeI2C~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iStrobeI2C,
	o => \iStrobeI2C~input_o\);

-- Location: LABCELL_X88_Y22_N24
\Selector4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~5_combout\ = (\R.FrameState.RWBit~q\ & ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110011000000001111001100000000111100110000000011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.FrameState.RWBit~q\,
	combout => \Selector4~5_combout\);

-- Location: MLABCELL_X87_Y22_N42
\R.BitCtr[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[2]~4_combout\ = ( \R.BitCtr\(0) & ( (!\R.FrameState.Ack1~q\ & (!\R.FrameState.Start~q\ & !\R.BitCtr\(2))) ) ) # ( !\R.BitCtr\(0) & ( (!\R.FrameState.Ack1~q\ & (!\R.FrameState.Start~q\ & (!\R.BitCtr\(1) $ (!\R.BitCtr\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000010000000010000001000000011000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_R.FrameState.Ack1~q\,
	datac => \ALT_INV_R.FrameState.Start~q\,
	datad => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_R.BitCtr\(0),
	combout => \R.BitCtr[2]~4_combout\);

-- Location: LABCELL_X85_Y22_N30
\R.BitCtr[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[2]~5_combout\ = ( \R.BitCtr\(2) & ( \R.BitCtr[2]~4_combout\ & ( (!\iStrobeI2C~input_o\) # (((\R.BitCtr[0]~1_combout\ & \R.BitCtr[0]~0_combout\)) # (\R.Sclk~q\)) ) ) ) # ( \R.BitCtr\(2) & ( !\R.BitCtr[2]~4_combout\ ) ) # ( !\R.BitCtr\(2) & ( 
-- !\R.BitCtr[2]~4_combout\ & ( (\iStrobeI2C~input_o\ & (!\R.Sclk~q\ & ((!\R.BitCtr[0]~1_combout\) # (!\R.BitCtr[0]~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001000000111111111111111100000000000000001010111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.BitCtr[0]~1_combout\,
	datac => \ALT_INV_R.Sclk~q\,
	datad => \ALT_INV_R.BitCtr[0]~0_combout\,
	datae => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_R.BitCtr[2]~4_combout\,
	combout => \R.BitCtr[2]~5_combout\);

-- Location: IOIBUF_X89_Y23_N4
\inResetAsync~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inResetAsync,
	o => \inResetAsync~input_o\);

-- Location: FF_X85_Y22_N32
\R.BitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.BitCtr[2]~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(2));

-- Location: MLABCELL_X87_Y22_N36
\Selector4~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~4_combout\ = ( !\R.Sclk~q\ & ( (!\R.BitCtr\(0) & (!\R.BitCtr\(2) & (!\R.BitCtr\(1) & \iStrobeI2C~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(0),
	datab => \ALT_INV_R.BitCtr\(2),
	datac => \ALT_INV_R.BitCtr\(1),
	datad => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \Selector4~4_combout\);

-- Location: LABCELL_X88_Y22_N54
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \R.FrameState.Data1~q\ & ( \R.Sclk~q\ ) ) # ( \R.FrameState.Data1~q\ & ( !\R.Sclk~q\ & ( (!\iStrobeI2C~input_o\) # ((!\NextR~8_combout\) # ((!\R.BitCtr\(3)) # (\R.FrameState.Ack1~q\))) ) ) ) # ( !\R.FrameState.Data1~q\ & ( 
-- !\R.Sclk~q\ & ( (\iStrobeI2C~input_o\ & \R.FrameState.Ack1~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111111111110111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_NextR~8_combout\,
	datac => \ALT_INV_R.FrameState.Ack1~q\,
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.FrameState.Data1~q\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \Selector6~0_combout\);

-- Location: FF_X88_Y22_N56
\R.FrameState.Data1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector6~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Data1~q\);

-- Location: LABCELL_X88_Y22_N3
\NextStateAndOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \NextStateAndOutput~2_combout\ = ( !\R.Sclk~q\ & ( \iStrobeI2C~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \NextStateAndOutput~2_combout\);

-- Location: LABCELL_X88_Y22_N0
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \NextR~8_combout\ & ( (!\NextStateAndOutput~2_combout\ & (((\R.FrameState.Ack2~q\)))) # (\NextStateAndOutput~2_combout\ & (\R.BitCtr\(3) & (\R.FrameState.Data1~q\))) ) ) # ( !\NextR~8_combout\ & ( (!\NextStateAndOutput~2_combout\ 
-- & \R.FrameState.Ack2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000000001101010110000000110101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.FrameState.Data1~q\,
	datad => \ALT_INV_R.FrameState.Ack2~q\,
	dataf => \ALT_INV_NextR~8_combout\,
	combout => \Selector7~0_combout\);

-- Location: FF_X88_Y22_N2
\R.FrameState.Ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Ack2~q\);

-- Location: LABCELL_X88_Y22_N51
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( \R.FrameState.Data2~q\ & ( \R.FrameState.Ack2~q\ ) ) # ( !\R.FrameState.Data2~q\ & ( \R.FrameState.Ack2~q\ & ( (!\R.Sclk~q\ & \iStrobeI2C~input_o\) ) ) ) # ( \R.FrameState.Data2~q\ & ( !\R.FrameState.Ack2~q\ & ( 
-- (!\NextR~8_combout\) # (((!\iStrobeI2C~input_o\) # (\R.BitCtr\(3))) # (\R.Sclk~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111011111100000000110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextR~8_combout\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_R.BitCtr\(3),
	datad => \ALT_INV_iStrobeI2C~input_o\,
	datae => \ALT_INV_R.FrameState.Data2~q\,
	dataf => \ALT_INV_R.FrameState.Ack2~q\,
	combout => \Selector8~0_combout\);

-- Location: FF_X88_Y22_N53
\R.FrameState.Data2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector8~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Data2~q\);

-- Location: LABCELL_X88_Y22_N42
\Selector4~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~6_combout\ = ( \R.FrameState.Data1~q\ & ( \R.FrameState.Data2~q\ & ( (\Selector4~5_combout\ & !\Selector4~4_combout\) ) ) ) # ( !\R.FrameState.Data1~q\ & ( \R.FrameState.Data2~q\ & ( (\Selector4~5_combout\ & ((!\Selector4~4_combout\) # 
-- (\R.BitCtr\(3)))) ) ) ) # ( \R.FrameState.Data1~q\ & ( !\R.FrameState.Data2~q\ & ( (!\Selector4~4_combout\ & (\Selector4~5_combout\)) # (\Selector4~4_combout\ & (!\R.BitCtr\(3) & ((\R.FrameState.Address~q\) # (\Selector4~5_combout\)))) ) ) ) # ( 
-- !\R.FrameState.Data1~q\ & ( !\R.FrameState.Data2~q\ & ( ((!\R.BitCtr\(3) & (\R.FrameState.Address~q\ & \Selector4~4_combout\))) # (\Selector4~5_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011101010101010100110001010101000100010101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector4~5_combout\,
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.FrameState.Address~q\,
	datad => \ALT_INV_Selector4~4_combout\,
	datae => \ALT_INV_R.FrameState.Data1~q\,
	dataf => \ALT_INV_R.FrameState.Data2~q\,
	combout => \Selector4~6_combout\);

-- Location: FF_X88_Y22_N44
\R.FrameState.RWBit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector4~6_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.RWBit~q\);

-- Location: FF_X88_Y22_N26
\R.FrameState.Ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.FrameState.RWBit~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \NextStateAndOutput~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Ack1~q\);

-- Location: MLABCELL_X87_Y22_N45
\R.BitCtr[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[1]~6_combout\ = ( \R.BitCtr\(0) & ( (!\R.BitCtr\(1) & (!\R.FrameState.Ack1~q\ & !\R.FrameState.Start~q\)) ) ) # ( !\R.BitCtr\(0) & ( (\R.BitCtr\(1) & (!\R.FrameState.Ack1~q\ & !\R.FrameState.Start~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000000000010001000000000010001000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_R.FrameState.Ack1~q\,
	datad => \ALT_INV_R.FrameState.Start~q\,
	dataf => \ALT_INV_R.BitCtr\(0),
	combout => \R.BitCtr[1]~6_combout\);

-- Location: MLABCELL_X87_Y22_N33
\R.BitCtr[1]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[1]~7_combout\ = ( \R.BitCtr\(1) & ( \R.BitCtr[1]~6_combout\ & ( ((!\iStrobeI2C~input_o\) # ((\R.BitCtr[0]~1_combout\ & \R.BitCtr[0]~0_combout\))) # (\R.Sclk~q\) ) ) ) # ( \R.BitCtr\(1) & ( !\R.BitCtr[1]~6_combout\ ) ) # ( !\R.BitCtr\(1) & ( 
-- !\R.BitCtr[1]~6_combout\ & ( (!\R.Sclk~q\ & (\iStrobeI2C~input_o\ & ((!\R.BitCtr[0]~1_combout\) # (!\R.BitCtr[0]~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001000111111111111111100000000000000001111111100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr[0]~1_combout\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_R.BitCtr[0]~0_combout\,
	datad => \ALT_INV_iStrobeI2C~input_o\,
	datae => \ALT_INV_R.BitCtr\(1),
	dataf => \ALT_INV_R.BitCtr[1]~6_combout\,
	combout => \R.BitCtr[1]~7_combout\);

-- Location: FF_X87_Y22_N35
\R.BitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.BitCtr[1]~7_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(1));

-- Location: MLABCELL_X87_Y22_N48
\R.BitCtr[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[0]~0_combout\ = ( \R.BitCtr\(2) & ( \R.BitCtr\(0) & ( (!\R.FrameState.Address~q\ & !\R.FrameState.Data2~q\) ) ) ) # ( !\R.BitCtr\(2) & ( \R.BitCtr\(0) & ( (!\R.FrameState.Address~q\ & !\R.FrameState.Data2~q\) ) ) ) # ( \R.BitCtr\(2) & ( 
-- !\R.BitCtr\(0) & ( (!\R.FrameState.Address~q\ & !\R.FrameState.Data2~q\) ) ) ) # ( !\R.BitCtr\(2) & ( !\R.BitCtr\(0) & ( (!\R.BitCtr\(1) & ((!\R.BitCtr\(3)) # ((!\R.FrameState.Address~q\ & !\R.FrameState.Data2~q\)))) # (\R.BitCtr\(1) & 
-- (((!\R.FrameState.Address~q\ & !\R.FrameState.Data2~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010001000111100000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.FrameState.Address~q\,
	datad => \ALT_INV_R.FrameState.Data2~q\,
	datae => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_R.BitCtr\(0),
	combout => \R.BitCtr[0]~0_combout\);

-- Location: MLABCELL_X87_Y22_N6
\R.BitCtr[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[3]~2_combout\ = ( \R.BitCtr\(2) & ( \R.FrameState.Start~q\ & ( !\R.FrameState.Ack1~q\ ) ) ) # ( !\R.BitCtr\(2) & ( \R.FrameState.Start~q\ & ( !\R.FrameState.Ack1~q\ ) ) ) # ( \R.BitCtr\(2) & ( !\R.FrameState.Start~q\ & ( (!\R.BitCtr\(3) & 
-- !\R.FrameState.Ack1~q\) ) ) ) # ( !\R.BitCtr\(2) & ( !\R.FrameState.Start~q\ & ( (!\R.FrameState.Ack1~q\ & (!\R.BitCtr\(3) $ (((!\R.BitCtr\(1) & !\R.BitCtr\(0)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110110000000000110011000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.BitCtr\(0),
	datad => \ALT_INV_R.FrameState.Ack1~q\,
	datae => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_R.FrameState.Start~q\,
	combout => \R.BitCtr[3]~2_combout\);

-- Location: MLABCELL_X87_Y22_N30
\R.BitCtr[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[3]~3_combout\ = ( \R.BitCtr\(3) & ( \R.BitCtr[3]~2_combout\ & ( ((!\iStrobeI2C~input_o\) # ((\R.BitCtr[0]~1_combout\ & \R.BitCtr[0]~0_combout\))) # (\R.Sclk~q\) ) ) ) # ( \R.BitCtr\(3) & ( !\R.BitCtr[3]~2_combout\ ) ) # ( !\R.BitCtr\(3) & ( 
-- !\R.BitCtr[3]~2_combout\ & ( (!\R.Sclk~q\ & (\iStrobeI2C~input_o\ & ((!\R.BitCtr[0]~1_combout\) # (!\R.BitCtr[0]~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001000111111111111111100000000000000001111001111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr[0]~1_combout\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.BitCtr[0]~0_combout\,
	datae => \ALT_INV_R.BitCtr\(3),
	dataf => \ALT_INV_R.BitCtr[3]~2_combout\,
	combout => \R.BitCtr[3]~3_combout\);

-- Location: FF_X87_Y22_N32
\R.BitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.BitCtr[3]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(3));

-- Location: LABCELL_X88_Y22_N48
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \R.FrameState.Address~q\ & ( \R.FrameState.Start~q\ ) ) # ( !\R.FrameState.Address~q\ & ( \R.FrameState.Start~q\ & ( (!\R.Sclk~q\ & \iStrobeI2C~input_o\) ) ) ) # ( \R.FrameState.Address~q\ & ( !\R.FrameState.Start~q\ & ( 
-- (!\NextR~8_combout\) # (((!\iStrobeI2C~input_o\) # (\R.BitCtr\(3))) # (\R.Sclk~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110111111111100001100000011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextR~8_combout\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.FrameState.Address~q\,
	dataf => \ALT_INV_R.FrameState.Start~q\,
	combout => \Selector3~0_combout\);

-- Location: FF_X88_Y22_N50
\R.FrameState.Address\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Address~q\);

-- Location: LABCELL_X88_Y22_N15
\Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = ( \R.Sclk~q\ & ( ((\iStrobeI2C~input_o\ & \R.Activity~q\)) # (\R.FrameState.Idle~q\) ) ) # ( !\R.Sclk~q\ & ( (!\iStrobeI2C~input_o\ & (((\R.FrameState.Idle~q\)))) # (\iStrobeI2C~input_o\ & (!\R.FrameState.Stop~q\ & 
-- ((\R.FrameState.Idle~q\) # (\R.Activity~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000011111010000100001111101000010001111111110001000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Activity~q\,
	datac => \ALT_INV_R.FrameState.Stop~q\,
	datad => \ALT_INV_R.FrameState.Idle~q\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \Selector1~1_combout\);

-- Location: FF_X88_Y22_N17
\R.FrameState.Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector1~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Idle~q\);

-- Location: LABCELL_X88_Y22_N21
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \R.FrameState.Idle~q\ & ( (\R.FrameState.Start~q\ & ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\))) ) ) # ( !\R.FrameState.Idle~q\ & ( (!\iStrobeI2C~input_o\ & (((\R.FrameState.Start~q\)))) # (\iStrobeI2C~input_o\ & (((\R.Sclk~q\ & 
-- \R.FrameState.Start~q\)) # (\R.Activity~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110111111000001011011111100000000101110110000000010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_R.Activity~q\,
	datad => \ALT_INV_R.FrameState.Start~q\,
	dataf => \ALT_INV_R.FrameState.Idle~q\,
	combout => \Selector2~0_combout\);

-- Location: MLABCELL_X87_Y22_N24
\Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = ( \Selector4~4_combout\ & ( \R.FrameState.Data2~q\ & ( (\R.BitCtr\(3) & (\Selector2~0_combout\ & !\R.FrameState.Data1~q\)) ) ) ) # ( !\Selector4~4_combout\ & ( \R.FrameState.Data2~q\ & ( \Selector2~0_combout\ ) ) ) # ( 
-- \Selector4~4_combout\ & ( !\R.FrameState.Data2~q\ & ( (\Selector2~0_combout\ & ((!\R.BitCtr\(3) & (!\R.FrameState.Address~q\)) # (\R.BitCtr\(3) & ((!\R.FrameState.Data1~q\))))) ) ) ) # ( !\Selector4~4_combout\ & ( !\R.FrameState.Data2~q\ & ( 
-- \Selector2~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000010110000100000001111000011110000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Address~q\,
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_Selector2~0_combout\,
	datad => \ALT_INV_R.FrameState.Data1~q\,
	datae => \ALT_INV_Selector4~4_combout\,
	dataf => \ALT_INV_R.FrameState.Data2~q\,
	combout => \Selector2~1_combout\);

-- Location: FF_X87_Y22_N26
\R.FrameState.Start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector2~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Start~q\);

-- Location: MLABCELL_X87_Y22_N3
\R.BitCtr[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[0]~1_combout\ = ( !\R.FrameState.Ack1~q\ & ( (!\R.FrameState.Start~q\ & !\R.FrameState.Data1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Start~q\,
	datac => \ALT_INV_R.FrameState.Data1~q\,
	dataf => \ALT_INV_R.FrameState.Ack1~q\,
	combout => \R.BitCtr[0]~1_combout\);

-- Location: MLABCELL_X87_Y22_N0
\R.BitCtr[0]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[0]~8_combout\ = ( !\R.FrameState.Ack1~q\ & ( (\R.BitCtr\(0)) # (\R.FrameState.Start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010111110101111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Start~q\,
	datac => \ALT_INV_R.BitCtr\(0),
	dataf => \ALT_INV_R.FrameState.Ack1~q\,
	combout => \R.BitCtr[0]~8_combout\);

-- Location: LABCELL_X85_Y22_N33
\R.BitCtr[0]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.BitCtr[0]~9_combout\ = ( \R.BitCtr\(0) & ( \R.BitCtr[0]~8_combout\ & ( (!\iStrobeI2C~input_o\) # (((\R.BitCtr[0]~1_combout\ & \R.BitCtr[0]~0_combout\)) # (\R.Sclk~q\)) ) ) ) # ( \R.BitCtr\(0) & ( !\R.BitCtr[0]~8_combout\ ) ) # ( !\R.BitCtr\(0) & ( 
-- !\R.BitCtr[0]~8_combout\ & ( (\iStrobeI2C~input_o\ & (!\R.Sclk~q\ & ((!\R.BitCtr[0]~1_combout\) # (!\R.BitCtr[0]~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000000111111111111111100000000000000001010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.BitCtr[0]~1_combout\,
	datac => \ALT_INV_R.BitCtr[0]~0_combout\,
	datad => \ALT_INV_R.Sclk~q\,
	datae => \ALT_INV_R.BitCtr\(0),
	dataf => \ALT_INV_R.BitCtr[0]~8_combout\,
	combout => \R.BitCtr[0]~9_combout\);

-- Location: FF_X85_Y22_N35
\R.BitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.BitCtr[0]~9_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(0));

-- Location: MLABCELL_X87_Y22_N39
\NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \NextR~8_combout\ = ( !\R.BitCtr\(1) & ( (!\R.BitCtr\(0) & !\R.BitCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(0),
	datab => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_R.BitCtr\(1),
	combout => \NextR~8_combout\);

-- Location: LABCELL_X88_Y22_N36
\Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = ( \R.FrameState.Ack3~q\ & ( \R.Sclk~q\ ) ) # ( \R.FrameState.Ack3~q\ & ( !\R.Sclk~q\ & ( (!\iStrobeI2C~input_o\) # ((\NextR~8_combout\ & (\R.FrameState.Data2~q\ & !\R.BitCtr\(3)))) ) ) ) # ( !\R.FrameState.Ack3~q\ & ( !\R.Sclk~q\ & 
-- ( (\iStrobeI2C~input_o\ & (\NextR~8_combout\ & (\R.FrameState.Data2~q\ & !\R.BitCtr\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000101010111010101000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_NextR~8_combout\,
	datac => \ALT_INV_R.FrameState.Data2~q\,
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \Selector9~0_combout\);

-- Location: FF_X88_Y22_N38
\R.FrameState.Ack3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Ack3~q\);

-- Location: FF_X88_Y22_N11
\R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.FrameState.Ack3~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \NextStateAndOutput~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Stop~q\);

-- Location: LABCELL_X88_Y22_N18
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \R.FrameState.Stop~q\ & ( (\iStrobeI2C~input_o\ & !\R.Sclk~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Stop~q\,
	combout => \Selector1~0_combout\);

-- Location: IOIBUF_X89_Y23_N38
\ioI2cSdin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ioI2cSdin,
	o => \ioI2cSdin~input_o\);

-- Location: LABCELL_X88_Y22_N6
\Selector17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = ( \iStrobeI2C~input_o\ & ( \R.FrameState.Ack1~q\ & ( (\ioI2cSdin~input_o\ & \R.Sclk~q\) ) ) ) # ( \iStrobeI2C~input_o\ & ( !\R.FrameState.Ack1~q\ & ( (\ioI2cSdin~input_o\ & (\R.Sclk~q\ & ((\R.FrameState.Ack3~q\) # 
-- (\R.FrameState.Ack2~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001010100000000000000000000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ioI2cSdin~input_o\,
	datab => \ALT_INV_R.FrameState.Ack2~q\,
	datac => \ALT_INV_R.FrameState.Ack3~q\,
	datad => \ALT_INV_R.Sclk~q\,
	datae => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.FrameState.Ack1~q\,
	combout => \Selector17~1_combout\);

-- Location: IOIBUF_X89_Y20_N61
\iStart~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iStart,
	o => \iStart~input_o\);

-- Location: MLABCELL_X84_Y22_N51
\R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~0_combout\ = ( \iStrobeI2C~input_o\ & ( !\R.Activity~q\ & ( (!\R.FrameState.Idle~q\ & \iStart~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Idle~q\,
	datac => \ALT_INV_iStart~input_o\,
	datae => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.Activity~q\,
	combout => \R.Configured~0_combout\);

-- Location: MLABCELL_X84_Y22_N0
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~26\ = CARRY(( \R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(0),
	cin => GND,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: MLABCELL_X84_Y22_N3
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \R.AddrCtr\(1) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~6\ = CARRY(( \R.AddrCtr\(1) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(1),
	cin => \Add0~26\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: MLABCELL_X84_Y22_N6
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \R.AddrCtr\(2) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~2\ = CARRY(( \R.AddrCtr\(2) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(2),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X84_Y22_N8
\R.AddrCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(2));

-- Location: MLABCELL_X84_Y22_N9
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \R.AddrCtr\(3) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~22\ = CARRY(( \R.AddrCtr\(3) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(3),
	cin => \Add0~2\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X84_Y22_N11
\R.AddrCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(3));

-- Location: MLABCELL_X84_Y22_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \R.AddrCtr\(4) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( \R.AddrCtr\(4) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(4),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X84_Y22_N14
\R.AddrCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(4));

-- Location: MLABCELL_X84_Y22_N15
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \R.AddrCtr\(5) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( \R.AddrCtr\(5) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(5),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X84_Y22_N17
\R.AddrCtr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(5));

-- Location: MLABCELL_X84_Y22_N18
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \R.AddrCtr\(6) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(6),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\);

-- Location: FF_X84_Y22_N20
\R.AddrCtr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(6));

-- Location: MLABCELL_X84_Y22_N42
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( \R.AddrCtr\(0) & ( !\R.AddrCtr\(6) & ( (\R.AddrCtr\(3) & (!\R.AddrCtr\(4) & !\R.AddrCtr\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.AddrCtr\(3),
	datac => \ALT_INV_R.AddrCtr\(4),
	datad => \ALT_INV_R.AddrCtr\(5),
	datae => \ALT_INV_R.AddrCtr\(0),
	dataf => \ALT_INV_R.AddrCtr\(6),
	combout => \Equal0~1_combout\);

-- Location: MLABCELL_X84_Y22_N24
\R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.AddrCtr[6]~0_combout\ = ( \Equal0~0_combout\ & ( \Selector1~0_combout\ & ( ((\R.Activity~q\ & !\Equal0~1_combout\)) # (\R.Configured~0_combout\) ) ) ) # ( !\Equal0~0_combout\ & ( \Selector1~0_combout\ & ( (\R.Configured~0_combout\) # (\R.Activity~q\) ) 
-- ) ) # ( \Equal0~0_combout\ & ( !\Selector1~0_combout\ & ( \R.Configured~0_combout\ ) ) ) # ( !\Equal0~0_combout\ & ( !\Selector1~0_combout\ & ( \R.Configured~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111101011111010111110100111101001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Activity~q\,
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_R.Configured~0_combout\,
	datae => \ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_Selector1~0_combout\,
	combout => \R.AddrCtr[6]~0_combout\);

-- Location: FF_X84_Y22_N2
\R.AddrCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(0));

-- Location: FF_X84_Y22_N5
\R.AddrCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(1));

-- Location: MLABCELL_X84_Y22_N39
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\R.AddrCtr\(1) & ( !\R.AddrCtr\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_R.AddrCtr\(1),
	dataf => \ALT_INV_R.AddrCtr\(2),
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X84_Y22_N30
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \R.Activity~q\ & ( \Equal0~1_combout\ & ( (!\Selector17~1_combout\ & (!\R.Configured~0_combout\ & ((!\Selector1~0_combout\) # (!\Equal0~0_combout\)))) ) ) ) # ( !\R.Activity~q\ & ( \Equal0~1_combout\ & ( (!\Selector17~1_combout\ 
-- & \R.Configured~0_combout\) ) ) ) # ( \R.Activity~q\ & ( !\Equal0~1_combout\ & ( (!\Selector17~1_combout\ & !\R.Configured~0_combout\) ) ) ) # ( !\R.Activity~q\ & ( !\Equal0~1_combout\ & ( (!\Selector17~1_combout\ & \R.Configured~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100110000001100000000001100000011001100000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector1~0_combout\,
	datab => \ALT_INV_Selector17~1_combout\,
	datac => \ALT_INV_R.Configured~0_combout\,
	datad => \ALT_INV_Equal0~0_combout\,
	datae => \ALT_INV_R.Activity~q\,
	dataf => \ALT_INV_Equal0~1_combout\,
	combout => \Selector0~0_combout\);

-- Location: FF_X84_Y22_N32
\R.Activity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector0~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Activity~q\);

-- Location: LABCELL_X88_Y22_N12
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = ( \R.FrameState.Stop~q\ & ( (\R.Sclk~q\ & ((!\iStrobeI2C~input_o\) # (!\R.Activity~q\))) ) ) # ( !\R.FrameState.Stop~q\ & ( (\R.FrameState.Idle~q\ & (!\R.Sclk~q\ $ (((!\iStrobeI2C~input_o\) # (!\R.Activity~q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100001110000000010000111000000000111011100000000011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Activity~q\,
	datac => \ALT_INV_R.FrameState.Idle~q\,
	datad => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Stop~q\,
	combout => \Selector15~0_combout\);

-- Location: FF_X88_Y22_N14
\R.Sclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector15~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Sclk~q\);

-- Location: LABCELL_X88_Y22_N27
\Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = ( !\R.FrameState.Ack1~q\ & ( (!\R.FrameState.Ack3~q\ & !\R.FrameState.Ack2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Ack3~q\,
	datac => \ALT_INV_R.FrameState.Ack2~q\,
	dataf => \ALT_INV_R.FrameState.Ack1~q\,
	combout => \Selector16~0_combout\);

-- Location: MLABCELL_X87_Y22_N54
\Selector16~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~2_combout\ = ( \R.FrameState.Idle~q\ & ( \R.FrameState.Address~q\ & ( (\Selector16~0_combout\ & ((!\R.BitCtr\(0) & ((!\R.BitCtr\(2)) # (\R.BitCtr\(1)))) # (\R.BitCtr\(0) & ((\R.BitCtr\(2)))))) ) ) ) # ( \R.FrameState.Idle~q\ & ( 
-- !\R.FrameState.Address~q\ & ( \Selector16~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000011000000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_Selector16~0_combout\,
	datac => \ALT_INV_R.BitCtr\(0),
	datad => \ALT_INV_R.BitCtr\(2),
	datae => \ALT_INV_R.FrameState.Idle~q\,
	dataf => \ALT_INV_R.FrameState.Address~q\,
	combout => \Selector16~2_combout\);

-- Location: LABCELL_X85_Y22_N21
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \R.AddrCtr\(1) & ( (!\R.AddrCtr\(2)) # (!\R.AddrCtr\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(0),
	dataf => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux1~0_combout\);

-- Location: MLABCELL_X87_Y22_N21
\R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Data[15]~0_combout\ = ( \R.FrameState.Start~q\ & ( (\R.Activity~q\ & \iStrobeI2C~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Activity~q\,
	datad => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.FrameState.Start~q\,
	combout => \R.Data[15]~0_combout\);

-- Location: FF_X85_Y22_N23
\R.Data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux1~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(6));

-- Location: LABCELL_X85_Y22_N18
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\R.AddrCtr\(2) & !\R.AddrCtr\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(0),
	combout => \Mux5~0_combout\);

-- Location: FF_X85_Y22_N20
\R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux5~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(2));

-- Location: FF_X85_Y22_N59
\R.Data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(5),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(14));

-- Location: FF_X85_Y22_N56
\R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(1),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(10));

-- Location: LABCELL_X85_Y22_N54
\Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = ( \R.Data\(10) & ( \R.BitCtr\(2) & ( (!\R.BitCtr\(3) & (\R.Data\(6))) # (\R.BitCtr\(3) & ((\R.Data\(14)))) ) ) ) # ( !\R.Data\(10) & ( \R.BitCtr\(2) & ( (!\R.BitCtr\(3) & (\R.Data\(6))) # (\R.BitCtr\(3) & ((\R.Data\(14)))) ) ) ) # ( 
-- \R.Data\(10) & ( !\R.BitCtr\(2) & ( (\R.Data\(2)) # (\R.BitCtr\(3)) ) ) ) # ( !\R.Data\(10) & ( !\R.BitCtr\(2) & ( (!\R.BitCtr\(3) & \R.Data\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100001111110011111101000100011101110100010001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Data\(6),
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.Data\(2),
	datad => \ALT_INV_R.Data\(14),
	datae => \ALT_INV_R.Data\(10),
	dataf => \ALT_INV_R.BitCtr\(2),
	combout => \Mux9~1_combout\);

-- Location: LABCELL_X85_Y22_N45
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!\R.AddrCtr\(2) & \R.AddrCtr\(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux3~0_combout\);

-- Location: FF_X85_Y22_N47
\R.Data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux3~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(4));

-- Location: FF_X85_Y22_N8
\R.Data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(3),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(12));

-- Location: LABCELL_X85_Y22_N42
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (!\R.AddrCtr\(1) $ (((!\R.AddrCtr\(2)) # (!\R.AddrCtr\(0))))) # (\R.AddrCtr\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111101101111001111110110111100111111011011110011111101101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(1),
	datac => \ALT_INV_R.AddrCtr\(3),
	datad => \ALT_INV_R.AddrCtr\(0),
	combout => \Mux7~0_combout\);

-- Location: FF_X85_Y22_N44
\R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux7~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(0));

-- Location: LABCELL_X85_Y22_N6
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( \R.Data\(12) & ( \R.Data\(0) & ( (!\R.BitCtr\(3) & ((!\R.BitCtr\(2)) # (\R.Data\(4)))) # (\R.BitCtr\(3) & (\R.BitCtr\(2))) ) ) ) # ( !\R.Data\(12) & ( \R.Data\(0) & ( (!\R.BitCtr\(3) & ((!\R.BitCtr\(2)) # (\R.Data\(4)))) ) ) ) # ( 
-- \R.Data\(12) & ( !\R.Data\(0) & ( (\R.BitCtr\(2) & ((\R.Data\(4)) # (\R.BitCtr\(3)))) ) ) ) # ( !\R.Data\(12) & ( !\R.Data\(0) & ( (!\R.BitCtr\(3) & (\R.BitCtr\(2) & \R.Data\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000110000111111000000110011001100001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.BitCtr\(2),
	datad => \ALT_INV_R.Data\(4),
	datae => \ALT_INV_R.Data\(12),
	dataf => \ALT_INV_R.Data\(0),
	combout => \Mux9~0_combout\);

-- Location: LABCELL_X85_Y22_N15
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = !\R.AddrCtr\(1) $ (((!\R.AddrCtr\(2)) # (!\R.AddrCtr\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000110110001101100011011000110110001101100011011000110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(1),
	datac => \ALT_INV_R.AddrCtr\(0),
	combout => \Mux4~0_combout\);

-- Location: FF_X85_Y22_N17
\R.Data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux4~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(3));

-- Location: FF_X85_Y22_N40
\R.Data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(2),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(11));

-- Location: FF_X85_Y22_N50
\R.Data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(6),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(15));

-- Location: LABCELL_X85_Y22_N12
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!\R.AddrCtr\(2) & (!\R.AddrCtr\(1) & !\R.AddrCtr\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(1),
	datac => \ALT_INV_R.AddrCtr\(3),
	combout => \Mux0~0_combout\);

-- Location: FF_X85_Y22_N14
\R.Data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux0~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(7));

-- Location: LABCELL_X85_Y22_N48
\Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~3_combout\ = ( \R.Data\(15) & ( \R.Data\(7) & ( ((!\R.BitCtr\(3) & (\R.Data\(3))) # (\R.BitCtr\(3) & ((\R.Data\(11))))) # (\R.BitCtr\(2)) ) ) ) # ( !\R.Data\(15) & ( \R.Data\(7) & ( (!\R.BitCtr\(3) & (((\R.BitCtr\(2))) # (\R.Data\(3)))) # 
-- (\R.BitCtr\(3) & (((!\R.BitCtr\(2) & \R.Data\(11))))) ) ) ) # ( \R.Data\(15) & ( !\R.Data\(7) & ( (!\R.BitCtr\(3) & (\R.Data\(3) & (!\R.BitCtr\(2)))) # (\R.BitCtr\(3) & (((\R.Data\(11)) # (\R.BitCtr\(2))))) ) ) ) # ( !\R.Data\(15) & ( !\R.Data\(7) & ( 
-- (!\R.BitCtr\(2) & ((!\R.BitCtr\(3) & (\R.Data\(3))) # (\R.BitCtr\(3) & ((\R.Data\(11)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000001110000001001010111010100101010011110100010111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(3),
	datab => \ALT_INV_R.Data\(3),
	datac => \ALT_INV_R.BitCtr\(2),
	datad => \ALT_INV_R.Data\(11),
	datae => \ALT_INV_R.Data\(15),
	dataf => \ALT_INV_R.Data\(7),
	combout => \Mux9~3_combout\);

-- Location: LABCELL_X85_Y22_N0
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \R.AddrCtr\(1) & ( (\R.AddrCtr\(2) & (\R.AddrCtr\(0) & !\R.AddrCtr\(3))) ) ) # ( !\R.AddrCtr\(1) & ( (!\R.AddrCtr\(0) & (!\R.AddrCtr\(2) $ (!\R.AddrCtr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000010010000100100000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(0),
	datac => \ALT_INV_R.AddrCtr\(3),
	dataf => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux6~0_combout\);

-- Location: FF_X85_Y22_N2
\R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux6~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(1));

-- Location: FF_X85_Y22_N11
\R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(0),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(9));

-- Location: LABCELL_X85_Y22_N3
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \R.AddrCtr\(1) & ( (!\R.AddrCtr\(3) & ((!\R.AddrCtr\(2)) # (!\R.AddrCtr\(0)))) ) ) # ( !\R.AddrCtr\(1) & ( (!\R.AddrCtr\(0) & (!\R.AddrCtr\(2) $ (!\R.AddrCtr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010010001000010001001000100011101110000000001110111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(2),
	datab => \ALT_INV_R.AddrCtr\(0),
	datad => \ALT_INV_R.AddrCtr\(3),
	dataf => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux2~0_combout\);

-- Location: FF_X85_Y22_N5
\R.Data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux2~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(5));

-- Location: FF_X85_Y22_N38
\R.Data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(4),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(13));

-- Location: LABCELL_X85_Y22_N36
\Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = ( \R.Data\(13) & ( \R.BitCtr\(2) & ( (\R.BitCtr\(3)) # (\R.Data\(5)) ) ) ) # ( !\R.Data\(13) & ( \R.BitCtr\(2) & ( (\R.Data\(5) & !\R.BitCtr\(3)) ) ) ) # ( \R.Data\(13) & ( !\R.BitCtr\(2) & ( (!\R.BitCtr\(3) & (\R.Data\(1))) # 
-- (\R.BitCtr\(3) & ((\R.Data\(9)))) ) ) ) # ( !\R.Data\(13) & ( !\R.BitCtr\(2) & ( (!\R.BitCtr\(3) & (\R.Data\(1))) # (\R.BitCtr\(3) & ((\R.Data\(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100110011010101010011001100001111000000000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Data\(1),
	datab => \ALT_INV_R.Data\(9),
	datac => \ALT_INV_R.Data\(5),
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.Data\(13),
	dataf => \ALT_INV_R.BitCtr\(2),
	combout => \Mux9~2_combout\);

-- Location: LABCELL_X85_Y22_N24
\Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~4_combout\ = ( \Mux9~2_combout\ & ( \R.BitCtr\(1) & ( (!\R.BitCtr\(0) & (\Mux9~1_combout\)) # (\R.BitCtr\(0) & ((\Mux9~3_combout\))) ) ) ) # ( !\Mux9~2_combout\ & ( \R.BitCtr\(1) & ( (!\R.BitCtr\(0) & (\Mux9~1_combout\)) # (\R.BitCtr\(0) & 
-- ((\Mux9~3_combout\))) ) ) ) # ( \Mux9~2_combout\ & ( !\R.BitCtr\(1) & ( (\R.BitCtr\(0)) # (\Mux9~0_combout\) ) ) ) # ( !\Mux9~2_combout\ & ( !\R.BitCtr\(1) & ( (\Mux9~0_combout\ & !\R.BitCtr\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100111111111101010101000011110101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux9~1_combout\,
	datab => \ALT_INV_Mux9~0_combout\,
	datac => \ALT_INV_Mux9~3_combout\,
	datad => \ALT_INV_R.BitCtr\(0),
	datae => \ALT_INV_Mux9~2_combout\,
	dataf => \ALT_INV_R.BitCtr\(1),
	combout => \Mux9~4_combout\);

-- Location: MLABCELL_X87_Y22_N18
\Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = ( !\R.FrameState.Data2~q\ & ( !\R.FrameState.Data1~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.FrameState.Data1~q\,
	dataf => \ALT_INV_R.FrameState.Data2~q\,
	combout => \Selector16~1_combout\);

-- Location: MLABCELL_X87_Y22_N12
\Selector16~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~3_combout\ = ( \R.FrameState.Stop~q\ & ( \R.Sclk~q\ & ( (\Selector16~2_combout\ & ((!\Mux9~4_combout\) # (\Selector16~1_combout\))) ) ) ) # ( !\R.FrameState.Stop~q\ & ( \R.Sclk~q\ & ( (\Selector16~2_combout\ & ((!\Mux9~4_combout\) # 
-- (\Selector16~1_combout\))) ) ) ) # ( \R.FrameState.Stop~q\ & ( !\R.Sclk~q\ & ( (\Selector16~2_combout\ & (!\iStrobeI2C~input_o\ & ((!\Mux9~4_combout\) # (\Selector16~1_combout\)))) ) ) ) # ( !\R.FrameState.Stop~q\ & ( !\R.Sclk~q\ & ( 
-- (\Selector16~2_combout\ & ((!\Mux9~4_combout\) # (\Selector16~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010101000101010001010000000001000101010001010100010101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector16~2_combout\,
	datab => \ALT_INV_Mux9~4_combout\,
	datac => \ALT_INV_Selector16~1_combout\,
	datad => \ALT_INV_iStrobeI2C~input_o\,
	datae => \ALT_INV_R.FrameState.Stop~q\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \Selector16~3_combout\);

-- Location: FF_X87_Y22_N13
\R.Sdin\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector16~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Sdin~q\);

-- Location: MLABCELL_X84_Y22_N54
\R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~1_combout\ = ( \R.Configured~q\ & ( \Equal0~0_combout\ & ( (!\R.Configured~0_combout\) # (\R.Activity~q\) ) ) ) # ( !\R.Configured~q\ & ( \Equal0~0_combout\ & ( (\R.Activity~q\ & (((\Selector1~0_combout\ & \Equal0~1_combout\)) # 
-- (\R.Configured~0_combout\))) ) ) ) # ( \R.Configured~q\ & ( !\Equal0~0_combout\ & ( (!\R.Configured~0_combout\) # (\R.Activity~q\) ) ) ) # ( !\R.Configured~q\ & ( !\Equal0~0_combout\ & ( (\R.Configured~0_combout\ & \R.Activity~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111100000000000111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector1~0_combout\,
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_R.Configured~0_combout\,
	datad => \ALT_INV_R.Activity~q\,
	datae => \ALT_INV_R.Configured~q\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \R.Configured~1_combout\);

-- Location: FF_X84_Y22_N55
\R.Configured\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.Configured~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Configured~q\);

-- Location: LABCELL_X88_Y22_N30
\Selector17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = ( \R.AckError~q\ & ( \R.Sclk~q\ & ( (!\R.Configured~0_combout\) # ((\iStrobeI2C~input_o\ & (\ioI2cSdin~input_o\ & !\Selector16~0_combout\))) ) ) ) # ( !\R.AckError~q\ & ( \R.Sclk~q\ & ( (\iStrobeI2C~input_o\ & (\ioI2cSdin~input_o\ 
-- & !\Selector16~0_combout\)) ) ) ) # ( \R.AckError~q\ & ( !\R.Sclk~q\ & ( !\R.Configured~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000101000000001100110111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Configured~0_combout\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ALT_INV_Selector16~0_combout\,
	datae => \ALT_INV_R.AckError~q\,
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \Selector17~0_combout\);

-- Location: FF_X88_Y22_N31
\R.AckError\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector17~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AckError~q\);

-- Location: LABCELL_X29_Y59_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


