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

-- DATE "04/06/2021 21:40:39"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top IS
    PORT (
	clk_t : IN std_logic;
	address_t : IN std_logic_vector(3 DOWNTO 0);
	data_out_t : BUFFER std_logic_vector(7 DOWNTO 0);
	ReqLeit_t : IN std_logic;
	Ack_t_in_sm : IN std_logic;
	Ack_t_out_sm : BUFFER std_logic;
	dado_ptr_t : BUFFER std_logic;
	reset_t : IN std_logic
	);
END top;

-- Design Ports Information
-- data_out_t[0]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[1]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[2]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[3]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[4]	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[5]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[6]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_t[7]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ack_t_out_sm	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dado_ptr_t	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_t	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_t[0]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_t[1]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_t[2]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_t[3]	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ReqLeit_t	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_t	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ack_t_in_sm	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_ReqLeit_t : std_logic;
SIGNAL ww_Ack_t_in_sm : std_logic;
SIGNAL ww_Ack_t_out_sm : std_logic;
SIGNAL ww_dado_ptr_t : std_logic;
SIGNAL ww_reset_t : std_logic;
SIGNAL \clk_t~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_out_t[0]~output_o\ : std_logic;
SIGNAL \data_out_t[1]~output_o\ : std_logic;
SIGNAL \data_out_t[2]~output_o\ : std_logic;
SIGNAL \data_out_t[3]~output_o\ : std_logic;
SIGNAL \data_out_t[4]~output_o\ : std_logic;
SIGNAL \data_out_t[5]~output_o\ : std_logic;
SIGNAL \data_out_t[6]~output_o\ : std_logic;
SIGNAL \data_out_t[7]~output_o\ : std_logic;
SIGNAL \Ack_t_out_sm~output_o\ : std_logic;
SIGNAL \dado_ptr_t~output_o\ : std_logic;
SIGNAL \clk_t~input_o\ : std_logic;
SIGNAL \clk_t~inputclkctrl_outclk\ : std_logic;
SIGNAL \address_t[0]~input_o\ : std_logic;
SIGNAL \ReqLeit_t~input_o\ : std_logic;
SIGNAL \Ack_t_in_sm~input_o\ : std_logic;
SIGNAL \my_memory_fsm|Selector2~0_combout\ : std_logic;
SIGNAL \reset_t~input_o\ : std_logic;
SIGNAL \my_memory_fsm|state.s2~q\ : std_logic;
SIGNAL \my_memory_fsm|state~11_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s3~q\ : std_logic;
SIGNAL \my_memory_fsm|Selector1~0_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s0~feeder_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s0~q\ : std_logic;
SIGNAL \my_memory_fsm|state~10_combout\ : std_logic;
SIGNAL \my_memory_fsm|state.s1~q\ : std_logic;
SIGNAL \my_memory_fsm|read_address~0_combout\ : std_logic;
SIGNAL \my_memory_fsm|read_address~combout\ : std_logic;
SIGNAL \my_memory_fsm|dado_ptr~combout\ : std_logic;
SIGNAL \my_memory|data_out[0]~0_combout\ : std_logic;
SIGNAL \address_t[1]~input_o\ : std_logic;
SIGNAL \my_memory|address_reg[1]~feeder_combout\ : std_logic;
SIGNAL \address_t[2]~input_o\ : std_logic;
SIGNAL \address_t[3]~input_o\ : std_logic;
SIGNAL \my_memory|address_reg[3]~feeder_combout\ : std_logic;
SIGNAL \my_memory_fsm|Ack_out_sm~combout\ : std_logic;
SIGNAL \my_memory|address_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \my_memory|data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset_t~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_t <= clk_t;
ww_address_t <= address_t;
data_out_t <= ww_data_out_t;
ww_ReqLeit_t <= ReqLeit_t;
ww_Ack_t_in_sm <= Ack_t_in_sm;
Ack_t_out_sm <= ww_Ack_t_out_sm;
dado_ptr_t <= ww_dado_ptr_t;
ww_reset_t <= reset_t;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_t~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_t~input_o\);
\ALT_INV_reset_t~input_o\ <= NOT \reset_t~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y18_N23
\data_out_t[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|data_out\(0),
	devoe => ww_devoe,
	o => \data_out_t[0]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\data_out_t[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|data_out\(1),
	devoe => ww_devoe,
	o => \data_out_t[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\data_out_t[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|data_out\(2),
	devoe => ww_devoe,
	o => \data_out_t[2]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\data_out_t[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory|data_out\(3),
	devoe => ww_devoe,
	o => \data_out_t[3]~output_o\);

-- Location: IOOBUF_X0_Y23_N2
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

-- Location: IOOBUF_X30_Y24_N2
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

-- Location: IOOBUF_X3_Y0_N2
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

-- Location: IOOBUF_X18_Y0_N23
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

-- Location: IOOBUF_X1_Y0_N23
\Ack_t_out_sm~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory_fsm|Ack_out_sm~combout\,
	devoe => ww_devoe,
	o => \Ack_t_out_sm~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\dado_ptr_t~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \my_memory_fsm|dado_ptr~combout\,
	devoe => ww_devoe,
	o => \dado_ptr_t~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_t,
	o => \clk_t~input_o\);

-- Location: CLKCTRL_G2
\clk_t~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_t~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_t~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y11_N15
\address_t[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(0),
	o => \address_t[0]~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\ReqLeit_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ReqLeit_t,
	o => \ReqLeit_t~input_o\);

-- Location: IOIBUF_X0_Y6_N22
\Ack_t_in_sm~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ack_t_in_sm,
	o => \Ack_t_in_sm~input_o\);

-- Location: LCCOMB_X1_Y11_N14
\my_memory_fsm|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|Selector2~0_combout\ = (\Ack_t_in_sm~input_o\ & (\my_memory_fsm|state.s1~q\ & ((!\ReqLeit_t~input_o\)))) # (!\Ack_t_in_sm~input_o\ & ((\my_memory_fsm|state.s2~q\) # ((\my_memory_fsm|state.s1~q\ & !\ReqLeit_t~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ack_t_in_sm~input_o\,
	datab => \my_memory_fsm|state.s1~q\,
	datac => \my_memory_fsm|state.s2~q\,
	datad => \ReqLeit_t~input_o\,
	combout => \my_memory_fsm|Selector2~0_combout\);

-- Location: IOIBUF_X0_Y6_N15
\reset_t~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_t,
	o => \reset_t~input_o\);

-- Location: FF_X1_Y11_N15
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

-- Location: LCCOMB_X1_Y11_N20
\my_memory_fsm|state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|state~11_combout\ = (\my_memory_fsm|state.s2~q\ & \Ack_t_in_sm~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \my_memory_fsm|state.s2~q\,
	datad => \Ack_t_in_sm~input_o\,
	combout => \my_memory_fsm|state~11_combout\);

-- Location: FF_X1_Y11_N21
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

-- Location: LCCOMB_X1_Y11_N26
\my_memory_fsm|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|Selector1~0_combout\ = (!\my_memory_fsm|state.s3~q\ & ((\my_memory_fsm|state.s0~q\) # (\ReqLeit_t~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|state.s0~q\,
	datac => \ReqLeit_t~input_o\,
	datad => \my_memory_fsm|state.s3~q\,
	combout => \my_memory_fsm|Selector1~0_combout\);

-- Location: LCCOMB_X1_Y11_N22
\my_memory_fsm|state.s0~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|state.s0~feeder_combout\ = \my_memory_fsm|Selector1~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \my_memory_fsm|Selector1~0_combout\,
	combout => \my_memory_fsm|state.s0~feeder_combout\);

-- Location: FF_X1_Y11_N23
\my_memory_fsm|state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory_fsm|state.s0~feeder_combout\,
	clrn => \ALT_INV_reset_t~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory_fsm|state.s0~q\);

-- Location: LCCOMB_X1_Y11_N0
\my_memory_fsm|state~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|state~10_combout\ = (\ReqLeit_t~input_o\ & ((\my_memory_fsm|state.s1~q\) # (!\my_memory_fsm|state.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_memory_fsm|state.s0~q\,
	datab => \ReqLeit_t~input_o\,
	datac => \my_memory_fsm|state.s1~q\,
	combout => \my_memory_fsm|state~10_combout\);

-- Location: FF_X1_Y11_N1
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

-- Location: LCCOMB_X1_Y11_N6
\my_memory_fsm|read_address~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|read_address~0_combout\ = (\my_memory_fsm|state.s2~q\) # (\my_memory_fsm|state.s3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \my_memory_fsm|state.s2~q\,
	datad => \my_memory_fsm|state.s3~q\,
	combout => \my_memory_fsm|read_address~0_combout\);

-- Location: LCCOMB_X1_Y11_N30
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

-- Location: FF_X3_Y11_N25
\my_memory|address_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	asdata => \address_t[0]~input_o\,
	sload => VCC,
	ena => \my_memory_fsm|read_address~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(0));

-- Location: LCCOMB_X1_Y11_N28
\my_memory_fsm|dado_ptr\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|dado_ptr~combout\ = (\my_memory_fsm|state.s1~q\ & ((\my_memory_fsm|dado_ptr~combout\))) # (!\my_memory_fsm|state.s1~q\ & (\my_memory_fsm|state.s2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_memory_fsm|state.s2~q\,
	datac => \my_memory_fsm|dado_ptr~combout\,
	datad => \my_memory_fsm|state.s1~q\,
	combout => \my_memory_fsm|dado_ptr~combout\);

-- Location: LCCOMB_X1_Y11_N16
\my_memory|data_out[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory|data_out[0]~0_combout\ = (\my_memory_fsm|dado_ptr~combout\ & \my_memory_fsm|read_address~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_memory_fsm|dado_ptr~combout\,
	datac => \my_memory_fsm|read_address~combout\,
	combout => \my_memory|data_out[0]~0_combout\);

-- Location: DDIOOUTCELL_X0_Y18_N25
\my_memory|data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory|address_reg\(0),
	ena => \my_memory|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|data_out\(0));

-- Location: IOIBUF_X0_Y11_N22
\address_t[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(1),
	o => \address_t[1]~input_o\);

-- Location: LCCOMB_X6_Y11_N16
\my_memory|address_reg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory|address_reg[1]~feeder_combout\ = \address_t[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \address_t[1]~input_o\,
	combout => \my_memory|address_reg[1]~feeder_combout\);

-- Location: FF_X6_Y11_N17
\my_memory|address_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory|address_reg[1]~feeder_combout\,
	ena => \my_memory_fsm|read_address~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(1));

-- Location: DDIOOUTCELL_X34_Y10_N11
\my_memory|data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory|address_reg\(1),
	ena => \my_memory|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|data_out\(1));

-- Location: IOIBUF_X7_Y0_N1
\address_t[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(2),
	o => \address_t[2]~input_o\);

-- Location: FF_X6_Y11_N3
\my_memory|address_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	asdata => \address_t[2]~input_o\,
	sload => VCC,
	ena => \my_memory_fsm|read_address~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(2));

-- Location: DDIOOUTCELL_X0_Y18_N18
\my_memory|data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory|address_reg\(2),
	ena => \my_memory|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|data_out\(2));

-- Location: IOIBUF_X0_Y5_N15
\address_t[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_t(3),
	o => \address_t[3]~input_o\);

-- Location: LCCOMB_X1_Y9_N16
\my_memory|address_reg[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory|address_reg[3]~feeder_combout\ = \address_t[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \address_t[3]~input_o\,
	combout => \my_memory|address_reg[3]~feeder_combout\);

-- Location: FF_X1_Y9_N17
\my_memory|address_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory|address_reg[3]~feeder_combout\,
	ena => \my_memory_fsm|read_address~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|address_reg\(3));

-- Location: DDIOOUTCELL_X0_Y9_N11
\my_memory|data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_t~inputclkctrl_outclk\,
	d => \my_memory|address_reg\(3),
	ena => \my_memory|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_memory|data_out\(3));

-- Location: LCCOMB_X1_Y11_N24
\my_memory_fsm|Ack_out_sm\ : cycloneive_lcell_comb
-- Equation(s):
-- \my_memory_fsm|Ack_out_sm~combout\ = (\my_memory_fsm|state.s3~q\ & ((\my_memory_fsm|Ack_out_sm~combout\))) # (!\my_memory_fsm|state.s3~q\ & (\my_memory_fsm|state.s1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_memory_fsm|state.s1~q\,
	datac => \my_memory_fsm|Ack_out_sm~combout\,
	datad => \my_memory_fsm|state.s3~q\,
	combout => \my_memory_fsm|Ack_out_sm~combout\);

ww_data_out_t(0) <= \data_out_t[0]~output_o\;

ww_data_out_t(1) <= \data_out_t[1]~output_o\;

ww_data_out_t(2) <= \data_out_t[2]~output_o\;

ww_data_out_t(3) <= \data_out_t[3]~output_o\;

ww_data_out_t(4) <= \data_out_t[4]~output_o\;

ww_data_out_t(5) <= \data_out_t[5]~output_o\;

ww_data_out_t(6) <= \data_out_t[6]~output_o\;

ww_data_out_t(7) <= \data_out_t[7]~output_o\;

ww_Ack_t_out_sm <= \Ack_t_out_sm~output_o\;

ww_dado_ptr_t <= \dado_ptr_t~output_o\;
END structure;


