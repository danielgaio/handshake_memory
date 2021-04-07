-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "04/06/2021 15:08:53"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	top IS
    PORT (
	clk_t : IN std_logic;
	address_t : IN STD.STANDARD.natural range 0 TO 15;
	data_out_t : OUT std_logic_vector(7 DOWNTO 0);
	ReqLeit_t : INOUT std_logic;
	Ack_t : INOUT std_logic;
	dado_ptr_t : INOUT std_logic;
	reset_t : IN std_logic
	);
END top;

ARCHITECTURE structure OF top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_t : std_logic;
SIGNAL ww_address_t : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_data_out_t : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_reset_t : std_logic;
SIGNAL \Ack_t~input_o\ : std_logic;
SIGNAL \dado_ptr_t~input_o\ : std_logic;
SIGNAL \ReqLeit_t~output_o\ : std_logic;
SIGNAL \Ack_t~output_o\ : std_logic;
SIGNAL \dado_ptr_t~output_o\ : std_logic;
SIGNAL \data_out_t[0]~output_o\ : std_logic;
SIGNAL \data_out_t[1]~output_o\ : std_logic;
SIGNAL \data_out_t[2]~output_o\ : std_logic;
SIGNAL \data_out_t[3]~output_o\ : std_logic;
SIGNAL \data_out_t[4]~output_o\ : std_logic;
SIGNAL \data_out_t[5]~output_o\ : std_logic;
SIGNAL \data_out_t[6]~output_o\ : std_logic;
SIGNAL \data_out_t[7]~output_o\ : std_logic;
SIGNAL \clk_t~input_o\ : std_logic;
SIGNAL \ReqLeit_t~input_o\ : std_logic;
SIGNAL \my_memory_fsm|Selector2~0_combout\ : std_logic;
SIGNAL \reset_t~input_o\ : std_logic;
SIGNAL \my_memory_fsm|state.s2~q\ : std_logic;
SIGNAL \my_memory_fsm|state~11_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s3~q\ : std_logic;
SIGNAL \my_memory_fsm|Selector1~0_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s0~q\ : std_logic;
SIGNAL \my_memory_fsm|state~10_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s1~q\ : std_logic;
SIGNAL \my_memory_fsm|Ack$latch~combout\ : std_logic;
SIGNAL \my_memory_fsm|out_data~combout\ : std_logic;
SIGNAL \address_t[0]~input_o\ : std_logic;
SIGNAL \my_memory_fsm|read_address~0_combout\ : std_logic;
SIGNAL \my_memory_fsm|read_address~combout\ : std_logic;
SIGNAL \my_memory|address_reg[0]~0_combout\ : std_logic;
SIGNAL \address_t[1]~input_o\ : std_logic;
SIGNAL \address_t[2]~input_o\ : std_logic;
SIGNAL \address_t[3]~input_o\ : std_logic;
SIGNAL \my_memory|address_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_reset_t~input_o\ : std_logic;

BEGIN

ww_clk_t <= clk_t;
ww_address_t <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(address_t, 4);
data_out_t <= ww_data_out_t;
ww_reset_t <= reset_t;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset_t~input_o\ <= NOT \reset_t~input_o\;

\ReqLeit_t~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \ReqLeit_t~output_o\);

\Ack_t~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory_fsm|Ack$latch~combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => \Ack_t~output_o\);

\dado_ptr_t~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory_fsm|out_data~combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => \dado_ptr_t~output_o\);

\data_out_t[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|address_reg\(0),
	devoe => ww_devoe,
	o => \data_out_t[0]~output_o\);

\data_out_t[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|address_reg\(1),
	devoe => ww_devoe,
	o => \data_out_t[1]~output_o\);

\data_out_t[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|address_reg\(2),
	devoe => ww_devoe,
	o => \data_out_t[2]~output_o\);

\data_out_t[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|address_reg\(3),
	devoe => ww_devoe,
	o => \data_out_t[3]~output_o\);

\data_out_t[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \data_out_t[4]~output_o\);

\data_out_t[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \data_out_t[5]~output_o\);

\data_out_t[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \data_out_t[6]~output_o\);

\data_out_t[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \data_out_t[7]~output_o\);

\clk_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_t,
	o => \clk_t~input_o\);

\ReqLeit_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ReqLeit_t,
	o => \ReqLeit_t~input_o\);

\my_memory_fsm|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|Selector2~0_combout\ = (\my_memory_fsm|state.s1~q\ & (((\my_memory_fsm|state.s2~q\ & !\my_memory_fsm|Ack$latch~combout\)) # (!\ReqLeit_t~input_o\))) # (!\my_memory_fsm|state.s1~q\ & (\my_memory_fsm|state.s2~q\ & 
-- ((!\my_memory_fsm|Ack$latch~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|state.s1~q\,
	datab => \my_memory_fsm|state.s2~q\,
	datac => \ReqLeit_t~input_o\,
	datad => \my_memory_fsm|Ack$latch~combout\,
	combout => \my_memory_fsm|Selector2~0_combout\);

\reset_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_t,
	o => \reset_t~input_o\);

\my_memory_fsm|state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \my_memory_fsm|Selector2~0_combout\,
	clrn => \ALT_INV_reset_t~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory_fsm|state.s2~q\);

\my_memory_fsm|state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|state~11_combout\ = (\my_memory_fsm|state.s2~q\ & \my_memory_fsm|Ack$latch~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|state.s2~q\,
	datab => \my_memory_fsm|Ack$latch~combout\,
	combout => \my_memory_fsm|state~11_combout\);

\my_memory_fsm|state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \my_memory_fsm|state~11_combout\,
	clrn => \ALT_INV_reset_t~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory_fsm|state.s3~q\);

\my_memory_fsm|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|Selector1~0_combout\ = (!\my_memory_fsm|state.s3~q\ & ((\ReqLeit_t~input_o\) # (\my_memory_fsm|state.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|state.s3~q\,
	datac => \ReqLeit_t~input_o\,
	datad => \my_memory_fsm|state.s0~q\,
	combout => \my_memory_fsm|Selector1~0_combout\);

\my_memory_fsm|state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \my_memory_fsm|Selector1~0_combout\,
	clrn => \ALT_INV_reset_t~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory_fsm|state.s0~q\);

\my_memory_fsm|state~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|state~10_combout\ = (\ReqLeit_t~input_o\ & ((\my_memory_fsm|state.s1~q\) # (!\my_memory_fsm|state.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReqLeit_t~input_o\,
	datab => \my_memory_fsm|state.s1~q\,
	datad => \my_memory_fsm|state.s0~q\,
	combout => \my_memory_fsm|state~10_combout\);

\my_memory_fsm|state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \my_memory_fsm|state~10_combout\,
	clrn => \ALT_INV_reset_t~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory_fsm|state.s1~q\);

\my_memory_fsm|Ack$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|Ack$latch~combout\ = (\my_memory_fsm|state.s3~q\ & ((\my_memory_fsm|Ack$latch~combout\))) # (!\my_memory_fsm|state.s3~q\ & (\my_memory_fsm|state.s1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_memory_fsm|state.s1~q\,
	datac => \my_memory_fsm|Ack$latch~combout\,
	datad => \my_memory_fsm|state.s3~q\,
	combout => \my_memory_fsm|Ack$latch~combout\);

\my_memory_fsm|out_data\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|out_data~combout\ = (\my_memory_fsm|state.s1~q\ & ((\my_memory_fsm|out_data~combout\))) # (!\my_memory_fsm|state.s1~q\ & (\my_memory_fsm|state.s2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_memory_fsm|state.s2~q\,
	datac => \my_memory_fsm|out_data~combout\,
	datad => \my_memory_fsm|state.s1~q\,
	combout => \my_memory_fsm|out_data~combout\);

\address_t[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(0),
	o => \address_t[0]~input_o\);

\my_memory_fsm|read_address~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|read_address~0_combout\ = (\my_memory_fsm|state.s2~q\) # (\my_memory_fsm|state.s3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|state.s2~q\,
	datab => \my_memory_fsm|state.s3~q\,
	combout => \my_memory_fsm|read_address~0_combout\);

\my_memory_fsm|read_address\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|read_address~combout\ = (\my_memory_fsm|read_address~0_combout\ & ((\my_memory_fsm|read_address~combout\))) # (!\my_memory_fsm|read_address~0_combout\ & (\my_memory_fsm|state.s1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_memory_fsm|state.s1~q\,
	datac => \my_memory_fsm|read_address~combout\,
	datad => \my_memory_fsm|read_address~0_combout\,
	combout => \my_memory_fsm|read_address~combout\);

\my_memory|address_reg[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory|address_reg[0]~0_combout\ = (\my_memory_fsm|read_address~combout\ & \my_memory_fsm|out_data~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|read_address~combout\,
	datab => \my_memory_fsm|out_data~combout\,
	combout => \my_memory|address_reg[0]~0_combout\);

\my_memory|address_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \address_t[0]~input_o\,
	ena => \my_memory|address_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(0));

\address_t[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(1),
	o => \address_t[1]~input_o\);

\my_memory|address_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \address_t[1]~input_o\,
	ena => \my_memory|address_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(1));

\address_t[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(2),
	o => \address_t[2]~input_o\);

\my_memory|address_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \address_t[2]~input_o\,
	ena => \my_memory|address_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(2));

\address_t[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(3),
	o => \address_t[3]~input_o\);

\my_memory|address_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~input_o\,
	d => \address_t[3]~input_o\,
	ena => \my_memory|address_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(3));

\Ack_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => Ack_t,
	o => \Ack_t~input_o\);

\dado_ptr_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => dado_ptr_t,
	o => \dado_ptr_t~input_o\);

ww_data_out_t(0) <= \data_out_t[0]~output_o\;

ww_data_out_t(1) <= \data_out_t[1]~output_o\;

ww_data_out_t(2) <= \data_out_t[2]~output_o\;

ww_data_out_t(3) <= \data_out_t[3]~output_o\;

ww_data_out_t(4) <= \data_out_t[4]~output_o\;

ww_data_out_t(5) <= \data_out_t[5]~output_o\;

ww_data_out_t(6) <= \data_out_t[6]~output_o\;

ww_data_out_t(7) <= \data_out_t[7]~output_o\;

ReqLeit_t <= \ReqLeit_t~output_o\;

Ack_t <= \Ack_t~output_o\;

dado_ptr_t <= \dado_ptr_t~output_o\;
END structure;


