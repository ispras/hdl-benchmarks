---------------------------------------------------------------------
-- TITLE: Memory Controller
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 1/31/01
-- FILENAME: mem_ctrl.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Memory controller for the MIPS CPU.
--    Supports Big or Little Endian mode.
--    This entity could implement interfaces to:
--       Data cache
--       Address cache
--       Memory management unit (MMU)
--       DRAM controller
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity mem_ctrl is
   port(clk          : in std_logic;
        reset_in     : in std_logic;
        pause_in     : in std_logic;
        nullify_op   : in std_logic;
        address_pc   : in std_logic_vector(31 downto 0);
        opcode_out   : out std_logic_vector(31 downto 0);

        address_data : in std_logic_vector(31 downto 0);
        mem_source   : in mem_source_type;
        data_write   : in std_logic_vector(31 downto 0);
        data_read    : out std_logic_vector(31 downto 0);
        pause_out    : out std_logic;
        
        mem_address  : out std_logic_vector(31 downto 0);
        mem_data_w   : out std_logic_vector(31 downto 0);
        mem_data_r   : in std_logic_vector(31 downto 0);
        mem_byte_sel : out std_logic_vector(3 downto 0);
        mem_write    : out std_logic;
        mem_pause    : in std_logic);
end; --entity mem_ctrl

architecture logic of mem_ctrl is
   --"00" = big_endian; "11" = little_endian
   constant little_endian : std_logic_vector(1 downto 0) := "00";
   signal opcode_reg : std_logic_vector(31 downto 0);
   signal next_opcode_reg : std_logic_vector(31 downto 0);
   signal setup_done : std_logic;
begin

mem_proc: process(clk, reset_in, pause_in, nullify_op, address_pc, 
                  address_data, mem_source, data_write, mem_data_r,
                  mem_pause,
                  opcode_reg, next_opcode_reg, setup_done)
   variable data, datab   : std_logic_vector(31 downto 0);
   variable opcode_temp   : std_logic_vector(31 downto 0);
   variable byte_sel_temp : std_logic_vector(3 downto 0);
   variable write_temp    : std_logic;
   variable setup_done_var : std_logic;
   variable pause         : std_logic;
   variable address_temp  : std_logic_vector(31 downto 0);
   variable bits          : std_logic_vector(1 downto 0);
   variable mem_data_w_v  : std_logic_vector(31 downto 0);
begin
   byte_sel_temp := "0000";
   write_temp := '0';
   pause := '0';
   setup_done_var := setup_done;

   address_temp := address_pc;
   data := mem_data_r;
   datab := ZERO;
   mem_data_w_v := ZERO; --"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

   case mem_source is
   when mem_read32 =>
      datab := data;
   when mem_read16 | mem_read16s =>
      if address_data(1) = little_endian(1) then
         datab(15 downto 0) := data(31 downto 16);
      else
         datab(15 downto 0) := data(15 downto 0);
      end if;
      if mem_source = mem_read16 or datab(15) = '0' then
         datab(31 downto 16) := ZERO(31 downto 16);
      else
         datab(31 downto 16) := ONES(31 downto 16);
      end if;
   when mem_read8 | mem_read8s =>
      bits := address_data(1 downto 0) xor little_endian;
      case bits is
      when "00" => datab(7 downto 0) := data(31 downto 24);
      when "01" => datab(7 downto 0) := data(23 downto 16);
      when "10" => datab(7 downto 0) := data(15 downto 8);
      when others => datab(7 downto 0) := data(7 downto 0);
      end case;
      if mem_source = mem_read8 or datab(7) = '0' then
         datab(31 downto 8) := ZERO(31 downto 8);
      else
         datab(31 downto 8) := ONES(31 downto 8);
      end if;
   when mem_write32 =>
      write_temp := '1';
      mem_data_w_v := data_write;
      byte_sel_temp := "1111";
   when mem_write16 =>
      write_temp := '1';
      mem_data_w_v := data_write(15 downto 0) & data_write(15 downto 0);
      if address_data(1) = little_endian(1) then
         byte_sel_temp := "1100";
      else
         byte_sel_temp := "0011";
      end if;
   when mem_write8 =>
      write_temp := '1';
      mem_data_w_v := data_write(7 downto 0) & data_write(7 downto 0) &
                  data_write(7 downto 0) & data_write(7 downto 0);
      bits := address_data(1 downto 0) xor little_endian;
      case bits is
      when "00" =>
         byte_sel_temp := "1000"; 
      when "01" => 
         byte_sel_temp := "0100"; 
      when "10" =>
         byte_sel_temp := "0010"; 
      when others =>
         byte_sel_temp := "0001"; 
      end case;
   when others =>
   end case;

   opcode_temp := opcode_reg;
   if mem_source = mem_none then 
      setup_done_var := '0';
      if pause_in = '0' and mem_pause = '0' then
         if nullify_op = '0' then
            opcode_temp := data;
         else
            opcode_temp := ZERO;  --NOP
         end if;
      end if;
   else
      pause := not setup_done;
      setup_done_var := '1';
      if setup_done = '1' then
         address_temp := address_data;
         if mem_pause = '0' then
            opcode_temp := next_opcode_reg;
            setup_done_var := '0'; 
         end if;
      end if;
   end if;
   if reset_in = '1' then
      setup_done_var := '0';
      opcode_temp := ZERO;
   end if;

   if rising_edge(clk) then
      opcode_reg <= opcode_temp;
      if setup_done = '0' then
         next_opcode_reg <= data;
      end if;
      setup_done <= setup_done_var;
   end if;

   opcode_out <= opcode_reg;
   data_read <= datab;
   pause_out <= mem_pause or pause;
   mem_byte_sel <= byte_sel_temp;
   mem_address <= address_temp;
   mem_write <= write_temp and setup_done;
   mem_data_w <= mem_data_w_v;

end process; --data_proc

end; --architecture logic

