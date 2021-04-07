-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity memory_state_machine_tb is
end;

architecture bench of memory_state_machine_tb is

  component memory_state_machine
  	port(
  		clk		 		    : in	std_logic;
  		ReqLeit   	 	: in	std_logic;
  		Ack_in_sm		  : in	std_logic;
  		Ack_out_sm	  : out	std_logic;
  		dado_ptr  		: out	std_logic;
  		reset	 		    : in	std_logic;
  		read_address	: out	std_logic;
  		out_data		  : out	std_logic
  	);
  end component;

  signal clk          : std_logic;
  signal ReqLeit      : std_logic;
  signal Ack_in_sm    : std_logic;
  signal Ack_out_sm   : std_logic;
  signal dado_ptr     : std_logic;
  signal reset        : std_logic;
  signal read_address : std_logic;
  signal out_data     : std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: memory_state_machine port map ( clk          => clk,
                                       ReqLeit      => ReqLeit,
                                       Ack_in_sm    => Ack_in_sm,
                                       Ack_out_sm   => Ack_out_sm,
                                       dado_ptr     => dado_ptr,
                                       reset        => reset,
                                       read_address => read_address,
                                       out_data     => out_data );

  stimulus: process
  begin
  
    -- Put initialisation code here

    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Put test bench stimulus code here
    --1
    ReqLeit <= '1';
    report "aqui eh setado o endereco a ser lido";
    wait until Ack_out_sm='1';
    --3
    ReqLeit <= '0';
    wait until dado_ptr='1';
    --5
    report "aqui eh feita a leitura do dado solicitado";
    Ack_in_sm <= '1';
    --6
    wait until dado_ptr='0';
    report "memoria zerou dado ptr";
    wait until Ack_out_sm='0';
    report "memoria zerou Ack";

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;