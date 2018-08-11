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

-- DATE "10/07/2017 17:49:01"

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

ENTITY 	Example1 IS
    PORT (
	iClk : IN std_logic;
	inResetAsync : IN std_logic;
	oSEG0 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG1 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG2 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG3 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG4 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG5 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0)
	);
END Example1;

-- Design Ports Information
-- oSEG0[0]	=>  Location: PIN_AE26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[1]	=>  Location: PIN_AE27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[2]	=>  Location: PIN_AE28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[3]	=>  Location: PIN_AG27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[4]	=>  Location: PIN_AF28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[5]	=>  Location: PIN_AG28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[6]	=>  Location: PIN_AH28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[1]	=>  Location: PIN_AH29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[2]	=>  Location: PIN_AH30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[3]	=>  Location: PIN_AG30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[4]	=>  Location: PIN_AF29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[5]	=>  Location: PIN_AF30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[6]	=>  Location: PIN_AD27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[0]	=>  Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[1]	=>  Location: PIN_AE29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[2]	=>  Location: PIN_AD29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[3]	=>  Location: PIN_AC28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[4]	=>  Location: PIN_AD30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[5]	=>  Location: PIN_AC29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[6]	=>  Location: PIN_AC30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[0]	=>  Location: PIN_AD26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[1]	=>  Location: PIN_AC27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[2]	=>  Location: PIN_AD25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[3]	=>  Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[4]	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[5]	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[6]	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[0]	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[1]	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[2]	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[3]	=>  Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[4]	=>  Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[5]	=>  Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[6]	=>  Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[0]	=>  Location: PIN_V25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[1]	=>  Location: PIN_AA28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[2]	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[3]	=>  Location: PIN_AB27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[4]	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[5]	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[6]	=>  Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iClk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Example1 IS
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
SIGNAL ww_oSEG0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG5 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \iClk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Counter0[0]~3_combout\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
SIGNAL \Add2~69_sumout\ : std_logic;
SIGNAL \Add2~70\ : std_logic;
SIGNAL \Add2~65_sumout\ : std_logic;
SIGNAL \Add2~66\ : std_logic;
SIGNAL \Add2~61_sumout\ : std_logic;
SIGNAL \Add2~62\ : std_logic;
SIGNAL \Add2~57_sumout\ : std_logic;
SIGNAL \Add2~58\ : std_logic;
SIGNAL \Add2~5_sumout\ : std_logic;
SIGNAL \Add2~6\ : std_logic;
SIGNAL \Add2~1_sumout\ : std_logic;
SIGNAL \Add2~2\ : std_logic;
SIGNAL \Add2~29_sumout\ : std_logic;
SIGNAL \Add2~30\ : std_logic;
SIGNAL \Add2~25_sumout\ : std_logic;
SIGNAL \Add2~26\ : std_logic;
SIGNAL \Add2~21_sumout\ : std_logic;
SIGNAL \Add2~22\ : std_logic;
SIGNAL \Add2~17_sumout\ : std_logic;
SIGNAL \Add2~18\ : std_logic;
SIGNAL \Add2~13_sumout\ : std_logic;
SIGNAL \Add2~14\ : std_logic;
SIGNAL \Add2~9_sumout\ : std_logic;
SIGNAL \Add2~10\ : std_logic;
SIGNAL \Add2~53_sumout\ : std_logic;
SIGNAL \Add2~54\ : std_logic;
SIGNAL \Add2~49_sumout\ : std_logic;
SIGNAL \Add2~50\ : std_logic;
SIGNAL \Add2~45_sumout\ : std_logic;
SIGNAL \Add2~46\ : std_logic;
SIGNAL \Add2~41_sumout\ : std_logic;
SIGNAL \Add2~42\ : std_logic;
SIGNAL \Add2~37_sumout\ : std_logic;
SIGNAL \Add2~38\ : std_logic;
SIGNAL \Add2~33_sumout\ : std_logic;
SIGNAL \Add2~34\ : std_logic;
SIGNAL \Add2~101_sumout\ : std_logic;
SIGNAL \Add2~102\ : std_logic;
SIGNAL \Add2~97_sumout\ : std_logic;
SIGNAL \Add2~98\ : std_logic;
SIGNAL \Add2~93_sumout\ : std_logic;
SIGNAL \Add2~94\ : std_logic;
SIGNAL \Add2~89_sumout\ : std_logic;
SIGNAL \Add2~90\ : std_logic;
SIGNAL \Add2~85_sumout\ : std_logic;
SIGNAL \Add2~86\ : std_logic;
SIGNAL \Add2~81_sumout\ : std_logic;
SIGNAL \Add2~82\ : std_logic;
SIGNAL \Add2~77_sumout\ : std_logic;
SIGNAL \Add2~78\ : std_logic;
SIGNAL \Add2~73_sumout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \ClkCounter[11]~DUPLICATE_q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Counter0~0_combout\ : std_logic;
SIGNAL \Counter0[2]~1_combout\ : std_logic;
SIGNAL \Counter0~2_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Counter1[3]~0_combout\ : std_logic;
SIGNAL \Counter1[0]~4_combout\ : std_logic;
SIGNAL \Counter1[0]~DUPLICATE_q\ : std_logic;
SIGNAL \Counter1~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Counter1[2]~2_combout\ : std_logic;
SIGNAL \Counter1~3_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL ClkCounter : std_logic_vector(25 DOWNTO 0);
SIGNAL Seg0 : std_logic_vector(6 DOWNTO 0);
SIGNAL Seg1 : std_logic_vector(6 DOWNTO 0);
SIGNAL Counter0 : std_logic_vector(3 DOWNTO 0);
SIGNAL Counter1 : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Counter1[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ClkCounter[11]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL ALT_INV_Counter1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_Counter0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_Seg1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ALT_INV_Seg0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ALT_INV_ClkCounter : std_logic_vector(25 DOWNTO 0);

BEGIN

ww_iClk <= iClk;
ww_inResetAsync <= inResetAsync;
oSEG0 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG0);
oSEG1 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG1);
oSEG2 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG2);
oSEG3 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG3);
oSEG4 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG4);
oSEG5 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG5);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Counter1[0]~DUPLICATE_q\ <= NOT \Counter1[0]~DUPLICATE_q\;
\ALT_INV_ClkCounter[11]~DUPLICATE_q\ <= NOT \ClkCounter[11]~DUPLICATE_q\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_Equal0~4_combout\ <= NOT \Equal0~4_combout\;
\ALT_INV_Equal0~3_combout\ <= NOT \Equal0~3_combout\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_Counter1(3) <= NOT Counter1(3);
ALT_INV_Counter1(2) <= NOT Counter1(2);
ALT_INV_Counter1(1) <= NOT Counter1(1);
ALT_INV_Counter1(0) <= NOT Counter1(0);
ALT_INV_Counter0(3) <= NOT Counter0(3);
ALT_INV_Counter0(2) <= NOT Counter0(2);
ALT_INV_Counter0(1) <= NOT Counter0(1);
ALT_INV_Counter0(0) <= NOT Counter0(0);
ALT_INV_Seg1(6) <= NOT Seg1(6);
ALT_INV_Seg1(5) <= NOT Seg1(5);
ALT_INV_Seg1(4) <= NOT Seg1(4);
ALT_INV_Seg1(3) <= NOT Seg1(3);
ALT_INV_Seg1(2) <= NOT Seg1(2);
ALT_INV_Seg1(1) <= NOT Seg1(1);
ALT_INV_Seg1(0) <= NOT Seg1(0);
ALT_INV_Seg0(6) <= NOT Seg0(6);
ALT_INV_Seg0(5) <= NOT Seg0(5);
ALT_INV_Seg0(4) <= NOT Seg0(4);
ALT_INV_Seg0(3) <= NOT Seg0(3);
ALT_INV_Seg0(2) <= NOT Seg0(2);
ALT_INV_Seg0(1) <= NOT Seg0(1);
ALT_INV_Seg0(0) <= NOT Seg0(0);
ALT_INV_ClkCounter(18) <= NOT ClkCounter(18);
ALT_INV_ClkCounter(19) <= NOT ClkCounter(19);
ALT_INV_ClkCounter(20) <= NOT ClkCounter(20);
ALT_INV_ClkCounter(21) <= NOT ClkCounter(21);
ALT_INV_ClkCounter(22) <= NOT ClkCounter(22);
ALT_INV_ClkCounter(23) <= NOT ClkCounter(23);
ALT_INV_ClkCounter(24) <= NOT ClkCounter(24);
ALT_INV_ClkCounter(25) <= NOT ClkCounter(25);
ALT_INV_ClkCounter(0) <= NOT ClkCounter(0);
ALT_INV_ClkCounter(1) <= NOT ClkCounter(1);
ALT_INV_ClkCounter(2) <= NOT ClkCounter(2);
ALT_INV_ClkCounter(3) <= NOT ClkCounter(3);
ALT_INV_ClkCounter(12) <= NOT ClkCounter(12);
ALT_INV_ClkCounter(13) <= NOT ClkCounter(13);
ALT_INV_ClkCounter(14) <= NOT ClkCounter(14);
ALT_INV_ClkCounter(15) <= NOT ClkCounter(15);
ALT_INV_ClkCounter(16) <= NOT ClkCounter(16);
ALT_INV_ClkCounter(17) <= NOT ClkCounter(17);
ALT_INV_ClkCounter(6) <= NOT ClkCounter(6);
ALT_INV_ClkCounter(7) <= NOT ClkCounter(7);
ALT_INV_ClkCounter(8) <= NOT ClkCounter(8);
ALT_INV_ClkCounter(9) <= NOT ClkCounter(9);
ALT_INV_ClkCounter(10) <= NOT ClkCounter(10);
ALT_INV_ClkCounter(11) <= NOT ClkCounter(11);
ALT_INV_ClkCounter(4) <= NOT ClkCounter(4);
ALT_INV_ClkCounter(5) <= NOT ClkCounter(5);

-- Location: IOOBUF_X89_Y8_N39
\oSEG0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(0),
	devoe => ww_devoe,
	o => ww_oSEG0(0));

-- Location: IOOBUF_X89_Y11_N79
\oSEG0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(1),
	devoe => ww_devoe,
	o => ww_oSEG0(1));

-- Location: IOOBUF_X89_Y11_N96
\oSEG0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(2),
	devoe => ww_devoe,
	o => ww_oSEG0(2));

-- Location: IOOBUF_X89_Y4_N79
\oSEG0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(3),
	devoe => ww_devoe,
	o => ww_oSEG0(3));

-- Location: IOOBUF_X89_Y13_N56
\oSEG0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(4),
	devoe => ww_devoe,
	o => ww_oSEG0(4));

-- Location: IOOBUF_X89_Y13_N39
\oSEG0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(5),
	devoe => ww_devoe,
	o => ww_oSEG0(5));

-- Location: IOOBUF_X89_Y4_N96
\oSEG0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg0(6),
	devoe => ww_devoe,
	o => ww_oSEG0(6));

-- Location: IOOBUF_X89_Y6_N39
\oSEG1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(0),
	devoe => ww_devoe,
	o => ww_oSEG1(0));

-- Location: IOOBUF_X89_Y6_N56
\oSEG1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(1),
	devoe => ww_devoe,
	o => ww_oSEG1(1));

-- Location: IOOBUF_X89_Y16_N39
\oSEG1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(2),
	devoe => ww_devoe,
	o => ww_oSEG1(2));

-- Location: IOOBUF_X89_Y16_N56
\oSEG1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(3),
	devoe => ww_devoe,
	o => ww_oSEG1(3));

-- Location: IOOBUF_X89_Y15_N39
\oSEG1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(4),
	devoe => ww_devoe,
	o => ww_oSEG1(4));

-- Location: IOOBUF_X89_Y15_N56
\oSEG1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(5),
	devoe => ww_devoe,
	o => ww_oSEG1(5));

-- Location: IOOBUF_X89_Y8_N56
\oSEG1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Seg1(6),
	devoe => ww_devoe,
	o => ww_oSEG1(6));

-- Location: IOOBUF_X89_Y9_N22
\oSEG2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG2(0));

-- Location: IOOBUF_X89_Y23_N39
\oSEG2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG2(1));

-- Location: IOOBUF_X89_Y23_N56
\oSEG2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG2(2));

-- Location: IOOBUF_X89_Y20_N79
\oSEG2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG2(3));

-- Location: IOOBUF_X89_Y25_N39
\oSEG2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG2(4));

-- Location: IOOBUF_X89_Y20_N96
\oSEG2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG2(5));

-- Location: IOOBUF_X89_Y25_N56
\oSEG2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG2(6));

-- Location: IOOBUF_X89_Y16_N5
\oSEG3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG3(0));

-- Location: IOOBUF_X89_Y16_N22
\oSEG3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG3(1));

-- Location: IOOBUF_X89_Y4_N45
\oSEG3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG3(2));

-- Location: IOOBUF_X89_Y4_N62
\oSEG3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG3(3));

-- Location: IOOBUF_X89_Y21_N39
\oSEG3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG3(4));

-- Location: IOOBUF_X89_Y11_N62
\oSEG3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG3(5));

-- Location: IOOBUF_X89_Y9_N5
\oSEG3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG3(6));

-- Location: IOOBUF_X89_Y11_N45
\oSEG4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG4(0));

-- Location: IOOBUF_X89_Y13_N5
\oSEG4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(1));

-- Location: IOOBUF_X89_Y13_N22
\oSEG4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(2));

-- Location: IOOBUF_X89_Y8_N22
\oSEG4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG4(3));

-- Location: IOOBUF_X89_Y15_N22
\oSEG4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG4(4));

-- Location: IOOBUF_X89_Y15_N5
\oSEG4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG4(5));

-- Location: IOOBUF_X89_Y20_N45
\oSEG4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG4(6));

-- Location: IOOBUF_X89_Y20_N62
\oSEG5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(0));

-- Location: IOOBUF_X89_Y21_N56
\oSEG5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG5(1));

-- Location: IOOBUF_X89_Y25_N22
\oSEG5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_oSEG5(2));

-- Location: IOOBUF_X89_Y23_N22
\oSEG5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(3));

-- Location: IOOBUF_X89_Y9_N56
\oSEG5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(4));

-- Location: IOOBUF_X89_Y23_N5
\oSEG5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(5));

-- Location: IOOBUF_X89_Y9_N39
\oSEG5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(6));

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

-- Location: CLKCTRL_G6
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

-- Location: LABCELL_X85_Y9_N33
\Counter0[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter0[0]~3_combout\ = ( !Counter0(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_Counter0(0),
	combout => \Counter0[0]~3_combout\);

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

-- Location: LABCELL_X80_Y9_N30
\Add2~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~69_sumout\ = SUM(( ClkCounter(0) ) + ( VCC ) + ( !VCC ))
-- \Add2~70\ = CARRY(( ClkCounter(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ClkCounter(0),
	cin => GND,
	sumout => \Add2~69_sumout\,
	cout => \Add2~70\);

-- Location: FF_X80_Y9_N32
\ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~69_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(0));

-- Location: LABCELL_X80_Y9_N33
\Add2~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~65_sumout\ = SUM(( ClkCounter(1) ) + ( GND ) + ( \Add2~70\ ))
-- \Add2~66\ = CARRY(( ClkCounter(1) ) + ( GND ) + ( \Add2~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(1),
	cin => \Add2~70\,
	sumout => \Add2~65_sumout\,
	cout => \Add2~66\);

-- Location: FF_X80_Y9_N35
\ClkCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~65_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(1));

-- Location: LABCELL_X80_Y9_N36
\Add2~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~61_sumout\ = SUM(( ClkCounter(2) ) + ( GND ) + ( \Add2~66\ ))
-- \Add2~62\ = CARRY(( ClkCounter(2) ) + ( GND ) + ( \Add2~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(2),
	cin => \Add2~66\,
	sumout => \Add2~61_sumout\,
	cout => \Add2~62\);

-- Location: FF_X80_Y9_N38
\ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~61_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(2));

-- Location: LABCELL_X80_Y9_N39
\Add2~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~57_sumout\ = SUM(( ClkCounter(3) ) + ( GND ) + ( \Add2~62\ ))
-- \Add2~58\ = CARRY(( ClkCounter(3) ) + ( GND ) + ( \Add2~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(3),
	cin => \Add2~62\,
	sumout => \Add2~57_sumout\,
	cout => \Add2~58\);

-- Location: FF_X80_Y9_N41
\ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~57_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(3));

-- Location: LABCELL_X80_Y9_N42
\Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~5_sumout\ = SUM(( ClkCounter(4) ) + ( GND ) + ( \Add2~58\ ))
-- \Add2~6\ = CARRY(( ClkCounter(4) ) + ( GND ) + ( \Add2~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ClkCounter(4),
	cin => \Add2~58\,
	sumout => \Add2~5_sumout\,
	cout => \Add2~6\);

-- Location: FF_X80_Y9_N44
\ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(4));

-- Location: LABCELL_X80_Y9_N45
\Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~1_sumout\ = SUM(( ClkCounter(5) ) + ( GND ) + ( \Add2~6\ ))
-- \Add2~2\ = CARRY(( ClkCounter(5) ) + ( GND ) + ( \Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(5),
	cin => \Add2~6\,
	sumout => \Add2~1_sumout\,
	cout => \Add2~2\);

-- Location: FF_X80_Y9_N47
\ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(5));

-- Location: LABCELL_X80_Y9_N48
\Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~29_sumout\ = SUM(( ClkCounter(6) ) + ( GND ) + ( \Add2~2\ ))
-- \Add2~30\ = CARRY(( ClkCounter(6) ) + ( GND ) + ( \Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(6),
	cin => \Add2~2\,
	sumout => \Add2~29_sumout\,
	cout => \Add2~30\);

-- Location: FF_X80_Y9_N50
\ClkCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~29_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(6));

-- Location: LABCELL_X80_Y9_N51
\Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~25_sumout\ = SUM(( ClkCounter(7) ) + ( GND ) + ( \Add2~30\ ))
-- \Add2~26\ = CARRY(( ClkCounter(7) ) + ( GND ) + ( \Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(7),
	cin => \Add2~30\,
	sumout => \Add2~25_sumout\,
	cout => \Add2~26\);

-- Location: FF_X80_Y9_N53
\ClkCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(7));

-- Location: LABCELL_X80_Y9_N54
\Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~21_sumout\ = SUM(( ClkCounter(8) ) + ( GND ) + ( \Add2~26\ ))
-- \Add2~22\ = CARRY(( ClkCounter(8) ) + ( GND ) + ( \Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(8),
	cin => \Add2~26\,
	sumout => \Add2~21_sumout\,
	cout => \Add2~22\);

-- Location: FF_X80_Y9_N56
\ClkCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(8));

-- Location: LABCELL_X80_Y9_N57
\Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~17_sumout\ = SUM(( ClkCounter(9) ) + ( GND ) + ( \Add2~22\ ))
-- \Add2~18\ = CARRY(( ClkCounter(9) ) + ( GND ) + ( \Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(9),
	cin => \Add2~22\,
	sumout => \Add2~17_sumout\,
	cout => \Add2~18\);

-- Location: FF_X80_Y9_N59
\ClkCounter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~17_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(9));

-- Location: LABCELL_X80_Y8_N0
\Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~13_sumout\ = SUM(( ClkCounter(10) ) + ( GND ) + ( \Add2~18\ ))
-- \Add2~14\ = CARRY(( ClkCounter(10) ) + ( GND ) + ( \Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(10),
	cin => \Add2~18\,
	sumout => \Add2~13_sumout\,
	cout => \Add2~14\);

-- Location: FF_X80_Y8_N2
\ClkCounter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~13_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(10));

-- Location: LABCELL_X80_Y8_N3
\Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~9_sumout\ = SUM(( ClkCounter(11) ) + ( GND ) + ( \Add2~14\ ))
-- \Add2~10\ = CARRY(( ClkCounter(11) ) + ( GND ) + ( \Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(11),
	cin => \Add2~14\,
	sumout => \Add2~9_sumout\,
	cout => \Add2~10\);

-- Location: FF_X80_Y8_N5
\ClkCounter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(11));

-- Location: LABCELL_X80_Y8_N6
\Add2~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~53_sumout\ = SUM(( ClkCounter(12) ) + ( GND ) + ( \Add2~10\ ))
-- \Add2~54\ = CARRY(( ClkCounter(12) ) + ( GND ) + ( \Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(12),
	cin => \Add2~10\,
	sumout => \Add2~53_sumout\,
	cout => \Add2~54\);

-- Location: FF_X80_Y8_N7
\ClkCounter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~53_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(12));

-- Location: LABCELL_X80_Y8_N9
\Add2~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~49_sumout\ = SUM(( ClkCounter(13) ) + ( GND ) + ( \Add2~54\ ))
-- \Add2~50\ = CARRY(( ClkCounter(13) ) + ( GND ) + ( \Add2~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(13),
	cin => \Add2~54\,
	sumout => \Add2~49_sumout\,
	cout => \Add2~50\);

-- Location: FF_X80_Y8_N11
\ClkCounter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~49_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(13));

-- Location: LABCELL_X80_Y8_N12
\Add2~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~45_sumout\ = SUM(( ClkCounter(14) ) + ( GND ) + ( \Add2~50\ ))
-- \Add2~46\ = CARRY(( ClkCounter(14) ) + ( GND ) + ( \Add2~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ClkCounter(14),
	cin => \Add2~50\,
	sumout => \Add2~45_sumout\,
	cout => \Add2~46\);

-- Location: FF_X80_Y8_N14
\ClkCounter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~45_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(14));

-- Location: LABCELL_X80_Y8_N15
\Add2~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~41_sumout\ = SUM(( ClkCounter(15) ) + ( GND ) + ( \Add2~46\ ))
-- \Add2~42\ = CARRY(( ClkCounter(15) ) + ( GND ) + ( \Add2~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(15),
	cin => \Add2~46\,
	sumout => \Add2~41_sumout\,
	cout => \Add2~42\);

-- Location: FF_X80_Y8_N17
\ClkCounter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~41_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(15));

-- Location: LABCELL_X80_Y8_N18
\Add2~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~37_sumout\ = SUM(( ClkCounter(16) ) + ( GND ) + ( \Add2~42\ ))
-- \Add2~38\ = CARRY(( ClkCounter(16) ) + ( GND ) + ( \Add2~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(16),
	cin => \Add2~42\,
	sumout => \Add2~37_sumout\,
	cout => \Add2~38\);

-- Location: FF_X80_Y8_N20
\ClkCounter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~37_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(16));

-- Location: LABCELL_X80_Y8_N21
\Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~33_sumout\ = SUM(( ClkCounter(17) ) + ( GND ) + ( \Add2~38\ ))
-- \Add2~34\ = CARRY(( ClkCounter(17) ) + ( GND ) + ( \Add2~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(17),
	cin => \Add2~38\,
	sumout => \Add2~33_sumout\,
	cout => \Add2~34\);

-- Location: FF_X80_Y8_N23
\ClkCounter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~33_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(17));

-- Location: LABCELL_X80_Y8_N24
\Add2~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~101_sumout\ = SUM(( ClkCounter(18) ) + ( GND ) + ( \Add2~34\ ))
-- \Add2~102\ = CARRY(( ClkCounter(18) ) + ( GND ) + ( \Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(18),
	cin => \Add2~34\,
	sumout => \Add2~101_sumout\,
	cout => \Add2~102\);

-- Location: FF_X80_Y8_N26
\ClkCounter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~101_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(18));

-- Location: LABCELL_X80_Y8_N27
\Add2~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~97_sumout\ = SUM(( ClkCounter(19) ) + ( GND ) + ( \Add2~102\ ))
-- \Add2~98\ = CARRY(( ClkCounter(19) ) + ( GND ) + ( \Add2~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(19),
	cin => \Add2~102\,
	sumout => \Add2~97_sumout\,
	cout => \Add2~98\);

-- Location: FF_X80_Y8_N29
\ClkCounter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~97_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(19));

-- Location: LABCELL_X80_Y8_N30
\Add2~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~93_sumout\ = SUM(( ClkCounter(20) ) + ( GND ) + ( \Add2~98\ ))
-- \Add2~94\ = CARRY(( ClkCounter(20) ) + ( GND ) + ( \Add2~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ClkCounter(20),
	cin => \Add2~98\,
	sumout => \Add2~93_sumout\,
	cout => \Add2~94\);

-- Location: FF_X80_Y8_N32
\ClkCounter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~93_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(20));

-- Location: LABCELL_X80_Y8_N33
\Add2~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~89_sumout\ = SUM(( ClkCounter(21) ) + ( GND ) + ( \Add2~94\ ))
-- \Add2~90\ = CARRY(( ClkCounter(21) ) + ( GND ) + ( \Add2~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(21),
	cin => \Add2~94\,
	sumout => \Add2~89_sumout\,
	cout => \Add2~90\);

-- Location: FF_X80_Y8_N35
\ClkCounter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~89_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(21));

-- Location: LABCELL_X80_Y8_N36
\Add2~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~85_sumout\ = SUM(( ClkCounter(22) ) + ( GND ) + ( \Add2~90\ ))
-- \Add2~86\ = CARRY(( ClkCounter(22) ) + ( GND ) + ( \Add2~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(22),
	cin => \Add2~90\,
	sumout => \Add2~85_sumout\,
	cout => \Add2~86\);

-- Location: FF_X80_Y8_N38
\ClkCounter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~85_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(22));

-- Location: LABCELL_X80_Y8_N39
\Add2~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~81_sumout\ = SUM(( ClkCounter(23) ) + ( GND ) + ( \Add2~86\ ))
-- \Add2~82\ = CARRY(( ClkCounter(23) ) + ( GND ) + ( \Add2~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(23),
	cin => \Add2~86\,
	sumout => \Add2~81_sumout\,
	cout => \Add2~82\);

-- Location: FF_X80_Y8_N41
\ClkCounter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~81_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(23));

-- Location: LABCELL_X80_Y8_N42
\Add2~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~77_sumout\ = SUM(( ClkCounter(24) ) + ( GND ) + ( \Add2~82\ ))
-- \Add2~78\ = CARRY(( ClkCounter(24) ) + ( GND ) + ( \Add2~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ClkCounter(24),
	cin => \Add2~82\,
	sumout => \Add2~77_sumout\,
	cout => \Add2~78\);

-- Location: FF_X80_Y8_N43
\ClkCounter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~77_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(24));

-- Location: LABCELL_X80_Y8_N45
\Add2~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~73_sumout\ = SUM(( ClkCounter(25) ) + ( GND ) + ( \Add2~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ClkCounter(25),
	cin => \Add2~78\,
	sumout => \Add2~73_sumout\);

-- Location: FF_X80_Y8_N47
\ClkCounter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~73_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClkCounter(25));

-- Location: LABCELL_X80_Y9_N18
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( !ClkCounter(2) & ( !ClkCounter(3) & ( (!ClkCounter(1) & (!ClkCounter(24) & (ClkCounter(25) & !ClkCounter(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(1),
	datab => ALT_INV_ClkCounter(24),
	datac => ALT_INV_ClkCounter(25),
	datad => ALT_INV_ClkCounter(0),
	datae => ALT_INV_ClkCounter(2),
	dataf => ALT_INV_ClkCounter(3),
	combout => \Equal0~2_combout\);

-- Location: LABCELL_X80_Y8_N48
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( ClkCounter(17) & ( ClkCounter(15) & ( (!ClkCounter(16) & (ClkCounter(14) & (ClkCounter(12) & ClkCounter(13)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(16),
	datab => ALT_INV_ClkCounter(14),
	datac => ALT_INV_ClkCounter(12),
	datad => ALT_INV_ClkCounter(13),
	datae => ALT_INV_ClkCounter(17),
	dataf => ALT_INV_ClkCounter(15),
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X80_Y8_N54
\Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ( ClkCounter(22) & ( !ClkCounter(18) & ( (ClkCounter(21) & (ClkCounter(20) & (ClkCounter(19) & ClkCounter(23)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(21),
	datab => ALT_INV_ClkCounter(20),
	datac => ALT_INV_ClkCounter(19),
	datad => ALT_INV_ClkCounter(23),
	datae => ALT_INV_ClkCounter(22),
	dataf => ALT_INV_ClkCounter(18),
	combout => \Equal0~3_combout\);

-- Location: FF_X80_Y8_N4
\ClkCounter[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add2~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ClkCounter[11]~DUPLICATE_q\);

-- Location: LABCELL_X80_Y9_N12
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !ClkCounter(8) & ( !ClkCounter(6) & ( (ClkCounter(7) & (!\ClkCounter[11]~DUPLICATE_q\ & (!ClkCounter(10) & !ClkCounter(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClkCounter(7),
	datab => \ALT_INV_ClkCounter[11]~DUPLICATE_q\,
	datac => ALT_INV_ClkCounter(10),
	datad => ALT_INV_ClkCounter(9),
	datae => ALT_INV_ClkCounter(8),
	dataf => ALT_INV_ClkCounter(6),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X80_Y9_N24
\Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = ( !ClkCounter(5) & ( !ClkCounter(4) & ( (\Equal0~2_combout\ & (\Equal0~1_combout\ & (\Equal0~3_combout\ & \Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~2_combout\,
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_Equal0~3_combout\,
	datad => \ALT_INV_Equal0~0_combout\,
	datae => ALT_INV_ClkCounter(5),
	dataf => ALT_INV_ClkCounter(4),
	combout => \Equal0~4_combout\);

-- Location: FF_X85_Y9_N34
\Counter0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter0[0]~3_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter0(0));

-- Location: LABCELL_X85_Y11_N12
\Counter0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter0~0_combout\ = ( Counter0(3) & ( (!Counter0(0) & ((Counter0(1)))) # (Counter0(0) & (Counter0(2) & !Counter0(1))) ) ) # ( !Counter0(3) & ( !Counter0(0) $ (!Counter0(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100001100111100110000010001110011000001000111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datab => ALT_INV_Counter0(0),
	datad => ALT_INV_Counter0(1),
	dataf => ALT_INV_Counter0(3),
	combout => \Counter0~0_combout\);

-- Location: FF_X85_Y11_N13
\Counter0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter0~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter0(1));

-- Location: LABCELL_X80_Y9_N6
\Counter0[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter0[2]~1_combout\ = ( Counter0(2) & ( \Equal0~4_combout\ & ( (!Counter0(1)) # (!Counter0(0)) ) ) ) # ( !Counter0(2) & ( \Equal0~4_combout\ & ( (Counter0(1) & Counter0(0)) ) ) ) # ( Counter0(2) & ( !\Equal0~4_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000101000001011111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(1),
	datac => ALT_INV_Counter0(0),
	datae => ALT_INV_Counter0(2),
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \Counter0[2]~1_combout\);

-- Location: FF_X80_Y9_N7
\Counter0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter0[2]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter0(2));

-- Location: LABCELL_X85_Y11_N15
\Counter0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter0~2_combout\ = ( Counter0(1) & ( !Counter0(3) $ (((!Counter0(2)) # (!Counter0(0)))) ) ) # ( !Counter0(1) & ( (Counter0(3) & ((!Counter0(0)) # (Counter0(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011011101000000001101110100010001111011100001000111101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datab => ALT_INV_Counter0(0),
	datad => ALT_INV_Counter0(3),
	dataf => ALT_INV_Counter0(1),
	combout => \Counter0~2_combout\);

-- Location: FF_X85_Y11_N17
\Counter0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter0~2_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter0(3));

-- Location: LABCELL_X80_Y9_N0
\Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = ( Counter0(2) & ( (!Counter0(3) $ (!Counter0(0))) # (Counter0(1)) ) ) # ( !Counter0(2) & ( (!Counter0(0)) # (!Counter0(3) $ (!Counter0(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100111100111111110011110000111111110011110011111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_Counter0(3),
	datac => ALT_INV_Counter0(1),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(2),
	combout => \Mux13~0_combout\);

-- Location: FF_X80_Y9_N1
\Seg0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux13~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(0));

-- Location: LABCELL_X85_Y11_N33
\Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = ( Counter0(1) & ( (!Counter0(0) & (!Counter0(2))) # (Counter0(0) & ((!Counter0(3)))) ) ) # ( !Counter0(1) & ( (!Counter0(2)) # (!Counter0(3) $ (Counter0(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010101111111110101010111110101010111100001010101011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datac => ALT_INV_Counter0(3),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Mux12~0_combout\);

-- Location: FF_X85_Y11_N34
\Seg0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux12~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(1));

-- Location: LABCELL_X80_Y9_N3
\Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = ( Counter0(2) & ( (!Counter0(3)) # ((!Counter0(1) & Counter0(0))) ) ) # ( !Counter0(2) & ( (!Counter0(1)) # ((Counter0(0)) # (Counter0(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111110111111101111111011111111001110110011101100111011001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(1),
	datab => ALT_INV_Counter0(3),
	datac => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(2),
	combout => \Mux11~0_combout\);

-- Location: FF_X80_Y9_N4
\Seg0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux11~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(2));

-- Location: LABCELL_X85_Y11_N6
\Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = ( Counter0(1) & ( (!Counter0(2) & ((!Counter0(3)) # (Counter0(0)))) # (Counter0(2) & ((!Counter0(0)))) ) ) # ( !Counter0(1) & ( (!Counter0(2) & ((!Counter0(0)))) # (Counter0(2) & ((Counter0(0)) # (Counter0(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101101010101101110110101010111011101101010101101110110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datab => ALT_INV_Counter0(3),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Mux10~0_combout\);

-- Location: FF_X85_Y11_N8
\Seg0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux10~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(3));

-- Location: LABCELL_X85_Y11_N45
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( Counter0(1) & ( (!Counter0(0)) # (Counter0(3)) ) ) # ( !Counter0(1) & ( (!Counter0(2) & ((!Counter0(0)))) # (Counter0(2) & (Counter0(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000110110001101100011011000111110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datab => ALT_INV_Counter0(3),
	datac => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Mux9~0_combout\);

-- Location: FF_X85_Y11_N46
\Seg0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux9~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(4));

-- Location: LABCELL_X85_Y11_N30
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( Counter0(1) & ( ((Counter0(2) & !Counter0(0))) # (Counter0(3)) ) ) # ( !Counter0(1) & ( (!Counter0(0)) # (!Counter0(2) $ (!Counter0(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111101100110111111110110011001110111001100110111011100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datab => ALT_INV_Counter0(3),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Mux8~0_combout\);

-- Location: FF_X85_Y11_N31
\Seg0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux8~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(5));

-- Location: LABCELL_X85_Y11_N9
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( Counter0(1) & ( (!Counter0(2)) # ((!Counter0(0)) # (Counter0(3))) ) ) # ( !Counter0(1) & ( (!Counter0(2) & (Counter0(3))) # (Counter0(2) & ((!Counter0(3)) # (Counter0(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011111010110100101111111111111101011111111111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datac => ALT_INV_Counter0(3),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Mux7~0_combout\);

-- Location: FF_X85_Y11_N10
\Seg0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg0(6));

-- Location: LABCELL_X85_Y11_N18
\Counter1[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter1[3]~0_combout\ = ( !Counter0(1) & ( (\Equal0~4_combout\ & (Counter0(3) & (!Counter0(2) & Counter0(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~4_combout\,
	datab => ALT_INV_Counter0(3),
	datac => ALT_INV_Counter0(2),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Counter1[3]~0_combout\);

-- Location: FF_X85_Y11_N22
\Counter1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter1[0]~4_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Counter1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter1(0));

-- Location: LABCELL_X85_Y11_N21
\Counter1[0]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter1[0]~4_combout\ = !Counter1(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_Counter1(0),
	combout => \Counter1[0]~4_combout\);

-- Location: FF_X85_Y11_N23
\Counter1[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter1[0]~4_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Counter1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter1[0]~DUPLICATE_q\);

-- Location: LABCELL_X85_Y11_N54
\Counter1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter1~1_combout\ = ( Counter1(2) & ( !\Counter1[0]~DUPLICATE_q\ $ (!Counter1(1)) ) ) # ( !Counter1(2) & ( (!\Counter1[0]~DUPLICATE_q\ & ((Counter1(1)))) # (\Counter1[0]~DUPLICATE_q\ & (!Counter1(3) & !Counter1(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011110000000011001111000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_Counter1(3),
	datac => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datad => ALT_INV_Counter1(1),
	dataf => ALT_INV_Counter1(2),
	combout => \Counter1~1_combout\);

-- Location: FF_X85_Y11_N56
\Counter1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter1~1_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Counter1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter1(1));

-- Location: LABCELL_X85_Y11_N42
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( !Counter0(1) & ( (!Counter0(2) & (Counter0(3) & Counter0(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100010000000000010001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter0(2),
	datab => ALT_INV_Counter0(3),
	datad => ALT_INV_Counter0(0),
	dataf => ALT_INV_Counter0(1),
	combout => \Equal1~0_combout\);

-- Location: LABCELL_X85_Y11_N36
\Counter1[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter1[2]~2_combout\ = ( \Equal1~0_combout\ & ( !Counter1(2) $ (((!Counter1(1)) # ((!Counter1(0)) # (!\Equal0~4_combout\)))) ) ) # ( !\Equal1~0_combout\ & ( Counter1(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter1(1),
	datab => ALT_INV_Counter1(0),
	datac => \ALT_INV_Equal0~4_combout\,
	datad => ALT_INV_Counter1(2),
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \Counter1[2]~2_combout\);

-- Location: FF_X85_Y11_N38
\Counter1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter1[2]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter1(2));

-- Location: LABCELL_X85_Y11_N57
\Counter1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Counter1~3_combout\ = ( Counter1(1) & ( !Counter1(3) $ (((!Counter1(2)) # (!Counter1(0)))) ) ) # ( !Counter1(1) & ( (Counter1(3) & ((!Counter1(0)) # (Counter1(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110101000000001111010100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Counter1(2),
	datac => ALT_INV_Counter1(0),
	datad => ALT_INV_Counter1(3),
	dataf => ALT_INV_Counter1(1),
	combout => \Counter1~3_combout\);

-- Location: FF_X85_Y11_N59
\Counter1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Counter1~3_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \Counter1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Counter1(3));

-- Location: LABCELL_X85_Y11_N48
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( Counter1(2) & ( (!Counter1(3) $ (!\Counter1[0]~DUPLICATE_q\)) # (Counter1(1)) ) ) # ( !Counter1(2) & ( (!\Counter1[0]~DUPLICATE_q\) # (!Counter1(3) $ (!Counter1(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001111111100111100111111110000111100111111110011110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_Counter1(3),
	datac => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datad => ALT_INV_Counter1(1),
	dataf => ALT_INV_Counter1(2),
	combout => \Mux6~0_combout\);

-- Location: FF_X85_Y11_N49
\Seg1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux6~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(0));

-- Location: LABCELL_X85_Y11_N51
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( Counter1(1) & ( (!\Counter1[0]~DUPLICATE_q\ & ((!Counter1(2)))) # (\Counter1[0]~DUPLICATE_q\ & (!Counter1(3))) ) ) # ( !Counter1(1) & ( (!Counter1(2)) # (!\Counter1[0]~DUPLICATE_q\ $ (Counter1(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110011001111111111001100111101110010001001110111001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datab => ALT_INV_Counter1(3),
	datad => ALT_INV_Counter1(2),
	dataf => ALT_INV_Counter1(1),
	combout => \Mux5~0_combout\);

-- Location: FF_X85_Y11_N52
\Seg1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux5~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(1));

-- Location: LABCELL_X85_Y11_N24
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (!Counter1(3) & (((!Counter1(1)) # (Counter1(2))) # (\Counter1[0]~DUPLICATE_q\))) # (Counter1(3) & ((!Counter1(2)) # ((\Counter1[0]~DUPLICATE_q\ & !Counter1(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011111011100111101111101110011110111110111001111011111011100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datab => ALT_INV_Counter1(3),
	datac => ALT_INV_Counter1(1),
	datad => ALT_INV_Counter1(2),
	combout => \Mux4~0_combout\);

-- Location: FF_X85_Y11_N25
\Seg1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux4~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(2));

-- Location: LABCELL_X85_Y11_N27
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( Counter1(2) & ( (!\Counter1[0]~DUPLICATE_q\ & ((Counter1(1)) # (Counter1(3)))) # (\Counter1[0]~DUPLICATE_q\ & ((!Counter1(1)))) ) ) # ( !Counter1(2) & ( (!\Counter1[0]~DUPLICATE_q\ & ((!Counter1(3)) # (!Counter1(1)))) # 
-- (\Counter1[0]~DUPLICATE_q\ & ((Counter1(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011011101101010101101110101110111101010100111011110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datab => ALT_INV_Counter1(3),
	datad => ALT_INV_Counter1(1),
	dataf => ALT_INV_Counter1(2),
	combout => \Mux3~0_combout\);

-- Location: FF_X85_Y11_N28
\Seg1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(3));

-- Location: LABCELL_X85_Y11_N0
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( Counter1(2) & ( ((!\Counter1[0]~DUPLICATE_q\ & Counter1(1))) # (Counter1(3)) ) ) # ( !Counter1(2) & ( (!\Counter1[0]~DUPLICATE_q\) # ((Counter1(3) & Counter1(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110011111100001111001100110011111100110011001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_Counter1(3),
	datac => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datad => ALT_INV_Counter1(1),
	dataf => ALT_INV_Counter1(2),
	combout => \Mux2~0_combout\);

-- Location: FF_X85_Y11_N1
\Seg1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux2~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(4));

-- Location: LABCELL_X85_Y11_N3
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( Counter1(2) & ( (!\Counter1[0]~DUPLICATE_q\) # (!Counter1(3) $ (Counter1(1))) ) ) # ( !Counter1(2) & ( ((!\Counter1[0]~DUPLICATE_q\ & !Counter1(1))) # (Counter1(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101100110011101110110011001111101110101110111110111010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter1[0]~DUPLICATE_q\,
	datab => ALT_INV_Counter1(3),
	datad => ALT_INV_Counter1(1),
	dataf => ALT_INV_Counter1(2),
	combout => \Mux1~0_combout\);

-- Location: FF_X85_Y11_N5
\Seg1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux1~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(5));

-- Location: LABCELL_X85_Y11_N39
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( Counter1(2) & ( (!Counter1(0) & ((!Counter1(3)) # (Counter1(1)))) # (Counter1(0) & ((!Counter1(1)) # (Counter1(3)))) ) ) # ( !Counter1(2) & ( (Counter1(1)) # (Counter1(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111111110011110011111111001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_Counter1(0),
	datac => ALT_INV_Counter1(3),
	datad => ALT_INV_Counter1(1),
	dataf => ALT_INV_Counter1(2),
	combout => \Mux0~0_combout\);

-- Location: FF_X85_Y11_N40
\Seg1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux0~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Seg1(6));

-- Location: LABCELL_X40_Y63_N0
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


