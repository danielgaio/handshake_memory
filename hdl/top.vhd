library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is

	generic(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 4
	);

	port (
		clk			: in std_logic;
		address		: in natural range 0 to 15;								-- 16 posicoes de memoria
		--out_data	: in std_logic;											-- flag para permitir ou não a saida de dados da memória. Usada só entre fsm e memoria
		data_out	: out std_logic_vector((DATA_WIDTH -1) downto 0)		-- dado saindo da memoria

	
		ReqLeit	 		: inout	std_logic;	-- flag
		Ack				: inout	std_logic;	-- flag
		dado_ptr		: inout	std_logic;	-- flag
		reset	 		: in	std_logic
		--read_address	: out	std_logic;	-- flag. Usada só entre fsm e memoria
	);

end top;

architecture rtl of top is	 

	-- sinais internos
    signal Ack_t           	: std_logic;
    signal dado_ptr_t      	: std_logic;
    signal ReqLeit_t       	: std_logic;
    signal read_address_t  	: std_logic;
	signal out_data_t      	: std_logic;
    signal clk_t       		: std_ulogic := '0';
    signal address_t		: natural range 0 to 15;
    signal data_out_t	   	: std_logic_vector (7 downto 0);	-- saida de dados da memoria
    signal reset_t   	   	: std_logic := '1';

	-- modulos externos
	component memory is

        port (
            clk             : in std_logic;
            read_address    : in std_logic;
		    out_data	    : in std_logic;										-- flag para permitir ou não a saida de dados da memória
            address	        : in natural range 0 to 15;							-- 16 posicoes de memoria
            data_out        : out std_logic_vector(7 downto 0)
        );

    end component;

    component memory_state_machine is

        port(
            clk		 	    : in	std_logic;
            ReqLeit	 	    : inout	std_logic;
            Ack			    : inout	std_logic;
            dado_ptr	    : inout	std_logic;
            reset	 	    : in	std_logic;
            read_address    : out	std_logic;
            out_data	    : out	std_logic
        );
    
    end component;

begin

	process(clk_t) begin

		my_memory : memory port map (
        	clk                 => clk_tb               ,
        	address             => address_tb           ,
        	read_address        => read_address_tb      ,       -- flag
        	out_data            => out_data_tb          ,       -- flag
        	data_out            => data_out_tb
    	);

    	my_memory_fsm : memory_state_machine port map (
    	    clk		 	        => clk_tb           ,
    	    ReqLeit	 	        => ReqLeit_tb       ,
    	    Ack			        => Ack_tb           ,
    	    dado_ptr	        => dado_ptr_tb      ,
    	    reset	 	        => reset_tb         ,
    	    read_address        => read_address_tb  ,
    	    out_data	        => out_data_tb                  -- flag
    	);

	end process;

end rtl;