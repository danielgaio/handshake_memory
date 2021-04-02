-- Quartus Prime VHDL Template
-- Single-port RAM with single read/write address and initial contents	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is

	generic(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 6
	);

	port (
		clk		: in std_logic;
		address	: in natural range 0 to 15;								-- 16 posicoes de memoria
		data_out	: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);

end memory;

architecture rtl of memory is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
	--type memory_t is array(2**ADDR_WIDTH-1 downto 0) of word_t; -- acho que aqui fica (15 downto 0) para as 16 posicoes
	type memory_t is array(15 downto 0) of word_t;

	function init_ram
		return memory_t is 
		variable tmp : memory_t := (others => (others => '0'));
	begin 
		--for addr_pos in 0 to 2**ADDR_WIDTH - 1 loop
		for address_pos in 0 to 15 loop 
			-- Initialize each address with the address itself
			tmp(address_pos) := std_logic_vector(to_unsigned(address_pos, DATA_WIDTH));
		end loop;
		return tmp;
	end init_ram;	 

	-- Declare the RAM signal and specify a default value.	Quartus Prime
	-- will create a memory initialization file (.mif) based on the 
	-- default value.
	signal ram : memory_t := init_ram;	-- recebe a chamada da funcao de inicalizacao

	-- Register to hold the address
	--signal address_reg : natural range 0 to 2**ADDR_WIDTH-1;
	signal address_reg : natural range 0 to 15;

begin

	process(clk) begin
		if(rising_edge(clk)) then
			--if(we = '1') then
				--ram(addr) <= data;
			--end if;

			-- Register the address for reading
			address_reg <= address;
		end if;
	end process;

	data_out <= ram(address_reg);

end rtl;