library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity memory_tb is
end memory_tb;

architecture tb of memory_tb is

    -- sinais internos
    signal Ack_tb           : std_logic;
    signal dado_ptr_tb      : std_logic;
    signal ReqLeit_tb       : std_logic;
    signal read_address_tb  : std_logic;
	signal out_data_tb      : std_logic;
    signal clk_tb       	: std_ulogic := '0';
    signal address_tb		: natural range 0 to 15;
    signal data_out_tb	    : std_logic_vector (7 downto 0);
    signal reset_tb   	    : std_logic := '1';


    -- modulos esternos
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
    -- interligacao das portas do modulo aos sinais internos
    --my_top : entity work.top port map (
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

    -- sequencia de sinais de teste

    -- clock generator
    clk_tb <= not clk_tb after 50 ps;

    -- desligar reset apos 2 ciclos
    reset_tb <= '0' after 110 ps;

    estimulos : process begin

        -- 

        --reset_tb <= '1'; wait for 1 ns;
        --reset_tb <= '0';

        -- Passo 1
        ReqLeit_tb      <= '1';
	    address_tb      <= 3;
        
        -- Passo 2: memoria faz sua parte
        if Ack_tb = '1' then
            ReqLeit_tb <= '0';
    
        -- Passo 3
        elsif dado_ptr_tb = '1' then
            data_out_tb <= data_out_tb;
            Ack_tb      <= '1';
        end if;

        report "Sinais injetados";
        --wait for 200 ns;

        wait;

    end process estimulos;

end tb;