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
    subtype word is std_logic_vector((data_width-1) downto 0);
    type t_mem is array (0 to 2**data_width - 1) of word;

    signal mem : t_mem;
 
    begin 
    
        mem_proc: process(clock) is
        begin
            if(clock'event and clock = '1') then
                if(data_write = '1') then
                    mem(to_integer(unsigned(address))) <= data_in;
                 else
                data_out <= mem(to_integer(unsigned(address)));
            end if;
          end if;
     end process mem_proc;

end  behavioral;



