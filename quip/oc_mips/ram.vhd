---------------------------------------------------------------------
-- TITLE: Random Access Memory
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 4/21/01
-- FILENAME: ram.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the RAM, reads the executable from "code.txt",
--    and saves a character to "output.txt" upon a write to 0xffff.
--    Modified from "The Designer's Guide to VHDL" by Peter J. Ashenden
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use ieee.std_logic_unsigned.all;
use work.mips_pack.all;

entity ram is
   generic(load_file_name : string);
   port(clk          : in std_logic;
        mem_byte_sel : in std_logic_vector(3 downto 0);
        mem_write    : in std_logic;
        mem_address  : in std_logic_vector;
        mem_data_w   : in std_logic_vector(31 downto 0);
        mem_data_r   : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram is
begin

ram_proc: process
   variable data : std_logic_vector(31 downto 0); 
   variable d    : std_logic_vector(31 downto 0); 
   variable datab : std_logic_vector(31 downto 0); 
   variable value : natural;
   subtype word is std_logic_vector(mem_data_w'length-1 downto 0);
   type storage_array is
      array(natural range 0 to 2**mem_address'length-1) of word;
   variable storage : storage_array;
   variable index : natural;
   file load_file : text is in load_file_name;
   file store_file : text is out "output.txt";
   variable hex_file_line : line;
   variable c : character;
   variable line_length : natural := 0;
begin
   --load in the ram executable image
   index := 0;
   while not endfile(load_file) loop
      readline(load_file, hex_file_line);
      hread(hex_file_line, data);
      storage(index) := data;
      index := index + 1;
   end loop;
   assert false report "done reading code" severity note;

   wait on clk;  --wait for line noise to go away

   loop
      wait on clk, mem_address, mem_write;

      --support putchar() when writing to address 0xffff
      if rising_edge(clk) then
         if mem_write = '1' and mem_address = ONES(15 downto 0) then
            index := conv_integer(mem_data_w(6 downto 0));
            if index /= 10 then
               c := character'val(index);
               write(hex_file_line, c);
               line_length := line_length + 1;
            end if;
            if index = 10 or line_length >= 72 then
               writeline(store_file, hex_file_line);
               line_length := 0;
            end if;
         end if;
      end if;

      index := conv_integer(mem_address(mem_address'length-1 downto 2));
      data := storage(index);

      if mem_write = '0' then
         mem_data_r <= data;
      end if;
      if mem_byte_sel(0) = '1' then
         data(7 downto 0) := mem_data_w(7 downto 0);
      end if;
      if mem_byte_sel(1) = '1' then
         data(15 downto 8) := mem_data_w(15 downto 8);
      end if;
      if mem_byte_sel(2) = '1' then
         data(23 downto 16) := mem_data_w(23 downto 16);
      end if;
      if mem_byte_sel(3) = '1' then
         data(31 downto 24) := mem_data_w(31 downto 24);
      end if;
      
      if rising_edge(clk) then
         if mem_write = '1' then
            storage(index) := data;
         end if;
      end if;
   end loop;
end process;

end; --architecture logic


