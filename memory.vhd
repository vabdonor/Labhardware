library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity memory is
    generic (
        addr_width: natural := 16;
        data_width: natural := 8
    );
    port (
        clock: in std_logic;

        data_read : in std_logic; 
        data_write: in std_logic;
        data_addr : in std_logic_vector(addr_width-1 downto 0);
        data_in : in std_logic_vector(data_width-1 downto 0);
        data_out : out std_logic_vector((data_width*4) -1 downto 0)
    );
 end entity; 

 architecture behavioral of memory is
    type mem_type is array((2**data_width - 1)  downto 0) of std_logic_vector((data_width-1) downto 0);
    signal mem : mem_type;

    begin 
        mem_process: process(clock) is
        begin
            if(rising_edge(clock)) then
                if(data_write = '1' and data_read = '0') then
                    mem(to_integer(unsigned(data_addr))) <= data_in;
                else
                data_out <= mem(to_integer(unsigned(data_addr)));
            end if;
        end if;
     end process mem_process;

end  behavioral;



