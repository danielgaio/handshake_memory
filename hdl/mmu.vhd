-- Quartus Prime VHDL Template
-- Single-port RAM with single read/write address and initial contents	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mmu is

	generic(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 4
	);

	port (
		-- controles:
		clk				: in std_logic;
		ReqLeit	 		: inout	std_logic;
		address			: in natural range 0 to 15;								-- 16 posicoes de memoria
		write_address	: in std_logic;
		-- dados:
		data_bus		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);

end mmu;

architecture rtl of mmu is

	

begin

	process (write_address) begin

		if write_address = '1' then
			data_bus <= "0011";	-- solicitar valor do esdereco 3
		end if;

	end process;

end rtl;
