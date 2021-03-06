library ieee;
use ieee.std_logic_1164.all;

entity four_state_mealy_state_machine is

	port(
		clk				: in	std_logic;
		ReqLeit			: inout	std_logic;
		Ack				: inout	std_logic;
		dado_ptr		: inout	std_logic;
		reset			: in	std_logic;
		req_es			: in	std_logic;	-- requisição de E/S
		write_address	: out	std_logic
	);

end entity;

architecture rtl of four_state_mealy_state_machine is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal state : state_type;

begin

	--process (clk, reset)
	process (reset, req_es, Ack, dado_ptr) begin

		if reset = '1' or req_es = '1' then
			state <= s0;

		--elsif (rising_edge(clk)) then
		else

			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when s0=>
					if Ack = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if dado_ptr = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
					if dado_ptr = '0' then
						state <= s3;
					else
						state <= s2;
					end if;
				when s3=>
					if req_es = '0' then
						state <= s3;
					else
						state <= s0;
					end if;
			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state) begin
			case state is
				when s0=>
					ReqLeit <= '1';
					write_address <= '1';
				when s1=>
					ReqLeit <= '0';

				when s2=>
					--if input = '1' then
						--output <= "10";
					--else
						--output <= "10";
					--end if;
				when s3=>
					--if input = '1' then
						--output <= "11";
					--else
						--output <= "10";
					--end if;
			end case;
	end process;

end rtl;
