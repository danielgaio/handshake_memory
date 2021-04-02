library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_tb is
end memory_tb;

architecture tb of memory_tb is

    -- sinais internos
	signal data_out_tb	: std_logic_vector (7 downto 0);
    signal address_tb		: natural range 0 to 15;
    signal clk_tb       	: std_ulogic := '0';
    --signal reset_tb   	: std_logic := '1';

    -- modulos esternos
    component memory is
        port (
            clk	: in std_logic;
            address	: in natural range 0 to 15;								-- 16 posicoes de memoria
            --data_out: in std_logic_vector((DATA_WIDTH-1) downto 0);
            --we	: in std_logic := '1';
            data_out: out std_logic_vector(7 downto 0)
        );
    end component;

begin
    -- interligacao das portas do modulo aos sinais internos
    --my_top : entity work.top port map (
    my_memory : memory port map (
        clk                 => clk_tb               ,
        address             => address_tb           ,
        data_out            => data_out_tb
    );

    -- sequencia de sinais de teste

    -- clock generator
    clk_tb <= not clk_tb after 50 ps;

    -- desligar reset apos 2 ciclos
    --reset_tb <= '0' after 20 ns;

    estimulos : process begin

	    address_tb <= 3;
        report "Sinais injetados";
        wait for 200 ns;

        wait;
    end process estimulos;
end tb;