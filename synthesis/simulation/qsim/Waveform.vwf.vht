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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "04/06/2021 15:08:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          top
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY top_vhd_vec_tst IS
END top_vhd_vec_tst;
ARCHITECTURE top_arch OF top_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Ack_t : STD_LOGIC;
SIGNAL address_t : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL clk_t : STD_LOGIC;
SIGNAL dado_ptr_t : STD_LOGIC;
SIGNAL data_out_t : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ReqLeit_t : STD_LOGIC;
SIGNAL reset_t : STD_LOGIC;
COMPONENT top
	PORT (
	Ack_t : INOUT STD_LOGIC;
	address_t : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	clk_t : IN STD_LOGIC;
	dado_ptr_t : INOUT STD_LOGIC;
	data_out_t : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ReqLeit_t : INOUT STD_LOGIC;
	reset_t : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : top
	PORT MAP (
-- list connections between master ports and signals
	Ack_t => Ack_t,
	address_t => address_t,
	clk_t => clk_t,
	dado_ptr_t => dado_ptr_t,
	data_out_t => data_out_t,
	ReqLeit_t => ReqLeit_t,
	reset_t => reset_t
	);

-- Ack_t
t_prcs_Ack_t: PROCESS
BEGIN
	Ack_t <= 'Z';
WAIT;
END PROCESS t_prcs_Ack_t;
-- address_t[3]
t_prcs_address_t_3: PROCESS
BEGIN
	address_t(3) <= '0';
WAIT;
END PROCESS t_prcs_address_t_3;
-- address_t[2]
t_prcs_address_t_2: PROCESS
BEGIN
	address_t(2) <= '0';
WAIT;
END PROCESS t_prcs_address_t_2;
-- address_t[1]
t_prcs_address_t_1: PROCESS
BEGIN
	address_t(1) <= '0';
WAIT;
END PROCESS t_prcs_address_t_1;
-- address_t[0]
t_prcs_address_t_0: PROCESS
BEGIN
	address_t(0) <= '0';
WAIT;
END PROCESS t_prcs_address_t_0;

-- clk_t
t_prcs_clk_t: PROCESS
BEGIN
	clk_t <= '0';
WAIT;
END PROCESS t_prcs_clk_t;

-- dado_ptr_t
t_prcs_dado_ptr_t: PROCESS
BEGIN
	dado_ptr_t <= 'Z';
WAIT;
END PROCESS t_prcs_dado_ptr_t;

-- ReqLeit_t
t_prcs_ReqLeit_t: PROCESS
BEGIN
	ReqLeit_t <= 'Z';
WAIT;
END PROCESS t_prcs_ReqLeit_t;

-- reset_t
t_prcs_reset_t: PROCESS
BEGIN
	reset_t <= '0';
WAIT;
END PROCESS t_prcs_reset_t;
END top_arch;
