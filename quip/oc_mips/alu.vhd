---------------------------------------------------------------------
-- TITLE: Arithmetic Logic Unit
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/8/01
-- FILENAME: alu.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the ALU.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity alu is
   port(a_in         : in  std_logic_vector(31 downto 0);
        b_in         : in  std_logic_vector(31 downto 0);
        alu_function : in  alu_function_type;
        c_alu        : out std_logic_vector(31 downto 0));
end; --alu

architecture logic of alu is
--   type alu_function_type is (alu_nothing, alu_add, alu_subtract, 
--      alu_less_than, alu_less_than_signed, alu_equal, alu_not_equal,
--      alu_ltz, alu_lez, alu_eqz, alu_nez, alu_gez, alu_gtz,
--      alu_or, alu_and, alu_xor, alu_nor);
begin

alu_proc: process(a_in, b_in, alu_function) 
   variable c           : std_logic_vector(31 downto 0);
   variable aa, bb, sum : std_logic_vector(32 downto 0);
   variable do_sub      : std_logic;
   variable a_eq_b      : std_logic;
   variable a_zero      : std_logic;
   variable sign_ext    : std_logic;
begin
   c := ZERO;
   if alu_function = alu_add then
      do_sub := '0';
   else
      do_sub := '1';
   end if;
   if alu_function = alu_less_than then
      sign_ext := '0';
   else
      sign_ext := '1';
   end if;
   aa := (a_in(31) and sign_ext) & a_in;
   bb := (b_in(31) and sign_ext) & b_in;
   sum := bv_adder(aa, bb, do_sub);
--   sum := bv_adder_lookahead(aa, bb, do_sub);
   if a_in = b_in then
      a_eq_b := '1';
   else
      a_eq_b := '0';
   end if;
   if a_in = ZERO then
      a_zero := '1';
   else
      a_zero := '0';
   end if;
   case alu_function is
   when alu_add | alu_subtract => --c=a+b
      c := sum(31 downto 0);
   when alu_less_than =>          --c=a<b
      c(0) := sum(32);
   when alu_less_than_signed =>   --c=a<b;
      c(0) := sum(32);
   when alu_equal =>              --c=a==b
      c(0) := a_eq_b;
   when alu_not_equal =>          --c=a!=b
      c(0) := not a_eq_b;
   when alu_ltz =>                --c=a<0
      c(0) := a_in(31);
   when alu_lez =>                --c=a<=0
      c(0) := a_in(31) or a_zero;
   when alu_eqz =>                --c=a==0
      c(0) := a_zero;
   when alu_nez =>                --c=a!=0
      c(0) := not a_zero;
   when alu_gez =>                --c=a>=0
      c(0) := not a_in(31);
   when alu_gtz =>                --c=a>0
      c(0) := not a_zero and not a_in(31);
   when alu_or =>                 --c=a|b
      c := a_in or b_in;
   when alu_and =>                --c=a&b
      c := a_in and b_in;
   when alu_xor =>                --c=a^b
      c := a_in xor b_in;
   when alu_nor =>                --c=~(a|b)
      c := a_in nor b_in;
   when others =>                 --alu_function = alu_nothing
      c := ZERO;
   end case;

--   if alu_function = alu_nothing then
--      c_alu <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
--   else
      c_alu <= c;
--   end if;
end process;

end; --architecture logic

