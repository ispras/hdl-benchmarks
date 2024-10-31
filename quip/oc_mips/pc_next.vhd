---------------------------------------------------------------------
-- TITLE: Program Counter Next
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/8/01
-- FILENAME: pc_next.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the Program Counter logic.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity pc_next is
   port(clk          : in std_logic;
        reset_in     : in std_logic;
        pc_new       : in std_logic_vector(31 downto 2);
        take_branch  : in std_logic;
        pause_in     : in std_logic;
        opcode25_0   : in std_logic_vector(25 downto 0);
        pc_source    : in pc_source_type;
        pc_out       : out std_logic_vector(31 downto 0));
end; --pc_next

architecture logic of pc_next is
--   type pc_source_type is (from_inc4, from_opcode25_0, from_branch, 
--      from_lbranch);
   signal pc_reg : std_logic_vector(31 downto 2); --:= ZERO(31 downto 2);
begin

pc_next: process(clk, reset_in, pc_new, take_branch, pause_in, 
                 opcode25_0, pc_source,
                 pc_reg)
   variable pc_inc, pc_next : std_logic_vector(31 downto 2);
begin
   pc_inc := bv_increment(pc_reg);  --pc_reg+1
   pc_next := pc_reg;
   case pc_source is
   when from_inc4 =>
      if pause_in = '0' then
         pc_next := pc_inc;
      end if;
   when from_opcode25_0 =>
      pc_next := pc_reg(31 downto 28) & opcode25_0;
   when from_branch | from_lbranch =>
      if take_branch = '1' then
         pc_next := pc_new;
      else
         pc_next := pc_inc;
      end if;
   when others =>
   end case;
   if reset_in = '1' then
      pc_next := ZERO(31 downto 2);
   end if;

   if rising_edge(clk) then
      pc_reg <= pc_next;
   end if;

   pc_out <= pc_reg & "00";
end process;

end; --logic

