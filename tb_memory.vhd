library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_memory is
end entity;

architecture mixed of tb_memory is
    constant addr_width: natural := 16;
    constant data_width: natural := 8;
    signal clok, d_read, d_write: std_logic := '0';
    signal d_addr: std_logic_vector(addr_width-1 downto 0) := (others => '0');
    signal d_in : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal d_out : std_logic_vector((data_width*4)-1 downto 0);

    constant clock_period: time := 10 ns;

begin
    mem : entity work.memory(behavioral)
        generic map(addr_width, data_width)
        port map(clock => clok, data_read => d_read, data_write=> d_write, data_addr => d_addr, data_in => d_in, data_out => d_out);

        clock_process: process 
        begin
            clok <= '0';
            wait for clock_period/2;
            clok <= '1';
            wait for clock_period/2;
        end process;

        estimulo: process
        begin

            wait for 100 ns;

            
            d_write <= '1';
            d_read <= '0';
            --d_addr <= "1001";
            d_in <= "11110000";

            wait for clock_period;

            d_write <= '0';
            d_read <= '1';
            --d_addr <= "0110";
            d_in <= "00001111";

            wait for clock_period;

            d_write <= '0';
            d_read <= '1';
            --d_addr <= "1001";
            d_in <= "01010101";
            
            wait for clock_period * 3;

            d_write <= '0';
            d_read <= '1';
            --d_addr <= "0110";
            d_in <= "10101010";

            wait for clock_period * 3;

            d_write <= '0';
            d_read <= '1';
            --d_addr <= "1111";
            d_in <= "00110011";
  
            wait;
    end process;
 end architecture;
           