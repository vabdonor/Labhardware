library ieee, std;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;

entity codec is
    port (
        interrupt: in std_logic;
        read_signal: in std_logic;
        write_signal: in std_logic;
        valid: out std_logic;

        codec_data_in : in std_logic_vector(7 downto 0);
        codec_data_out: out std_logic_vector(7 downto 0)
    );
    end entity;

    architecture dataflow of codec is
        signal aux: aux_t;
       

        begin
            process(interrupt)
            variable aux_valid : std_logic := 0;
            
            begin
                valid <= aux_valid;
                if(read_signal = '0' and write_signal = '1') then
                    aux(to_integer(unsigned)) <= codec_data_in;
                else
                    codec_data_out <= aux(to_integer(unsigned));
                end if;
            end process;
        valid <= '1';
    end architecture;


            