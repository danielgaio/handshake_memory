library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity memory_tb is
end memory_tb;

architecture tb of memory_tb is

    -- Instanciacao do componente Top
    component top is
        generic(
		    DATA_WIDTH : natural := 8
	    );
        port (
            signal clk_t			: in std_logic;
		    signal address_t		: in natural range 0 to 15;	-- 16 posicoes de memoria
		    signal data_out_t		: out std_logic_vector((DATA_WIDTH -1) downto 0); -- dado saindo da memoria
		    signal ReqLeit_t		: in	std_logic;	-- flag
		    signal Ack_t_in_sm		: in	std_logic;	-- flag
		    signal Ack_t_out_sm		: out	std_logic;	-- flag
		    signal dado_ptr_t		: out	std_logic;	-- flag
		    signal reset_t	 		: in	std_logic
        );
    end component;

    -- sinais internos
    signal Ack_tb_in_sm     : std_logic;
    signal Ack_tb_out_sm    : std_logic;
    signal dado_ptr_tb      : std_logic;
    signal ReqLeit_tb       : std_logic;
    signal clk_tb       	: std_logic := '0';
    signal address_tb		: natural range 0 to 15;
    signal data_out_tb	    : std_logic_vector (7 downto 0);
    signal reset_tb   	    : std_logic := '1';

    constant clock_period: time := 10 ns;
    signal stop_the_clock: boolean;

begin
    -- PORT para o TOP
    my_top : top port map (
        clk_t	         => clk_tb              ,
        address_t        => address_tb          ,
        data_out_t       => data_out_tb         ,
        ReqLeit_t        => ReqLeit_tb          ,
        Ack_t_in_sm	     => Ack_tb_in_sm        ,
        Ack_t_out_sm     => Ack_tb_out_sm       ,
        dado_ptr_t       => dado_ptr_tb         ,
        reset_t	         => reset_tb
    );

    stimulus: process begin
        -- Put initialisation code here
        reset_tb <= '1';
        wait for 5 ns;
        reset_tb <= '0';
        wait for 5 ns;

        -- Put test bench stimulus code here
        --1
        ReqLeit_tb <= '1';
        report "aqui eh setado o endereco a ser lido";
        address_tb <= 3;
        wait until Ack_tb_out_sm='1';
        --3
        ReqLeit_tb <= '0';
        wait until dado_ptr_tb='1';
        --5
        report "aqui eh feita a leitura do dado solicitado";
        --report integer'(data_out_tb);
        Ack_tb_in_sm <= '1';
        --6
        wait until dado_ptr_tb='0';
        report "memoria zerou dado ptr";
        wait until Ack_tb_out_sm='0';
        report "memoria zerou Ack";

        stop_the_clock <= true;
        wait;
    end process;

    clocking: process begin
        while not stop_the_clock loop
            clk_tb <= '0', '1' after clock_period / 2;
            wait for clock_period;
        end loop;
        wait;
    end process;
end tb;