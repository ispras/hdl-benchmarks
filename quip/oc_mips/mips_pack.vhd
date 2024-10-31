---------------------------------------------------------------------
-- TITLE: MIPS Misc. Package
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/15/01
-- FILENAME: mips_pack.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Data types, constants, and add functions needed for the MIPS CPU.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package mips_pack is
   constant ZERO          : std_logic_vector(31 downto 0) :=
      "00000000000000000000000000000000";
   constant ONES          : std_logic_vector(31 downto 0) :=
      "11111111111111111111111111111111";
  
--   type alu_function_type is (alu_nothing, alu_add, alu_subtract, 
--      alu_less_than, alu_less_than_signed, alu_equal, alu_not_equal,
--      alu_ltz, alu_lez, alu_eqz, alu_nez, alu_gez, alu_gtz,
--      alu_or, alu_and, alu_xor, alu_nor);
   subtype alu_function_type is std_logic_vector(4 downto 0);
   constant alu_nothing   : alu_function_type := "00000";
   constant alu_add       : alu_function_type := "00010";
   constant alu_subtract  : alu_function_type := "00011";
   constant alu_less_than : alu_function_type := "00100";
   constant alu_less_than_signed : alu_function_type := "00101";
   constant alu_equal     : alu_function_type := "00110";
   constant alu_not_equal : alu_function_type := "00111";
   constant alu_ltz       : alu_function_type := "01000";
   constant alu_lez       : alu_function_type := "01001";
   constant alu_eqz       : alu_function_type := "01010";
   constant alu_nez       : alu_function_type := "01011";
   constant alu_gez       : alu_function_type := "01100";
   constant alu_gtz       : alu_function_type := "01101";
   constant alu_or        : alu_function_type := "01110";
   constant alu_and       : alu_function_type := "01111";
   constant alu_xor       : alu_function_type := "10001";
   constant alu_nor       : alu_function_type := "10010";

--   type shift_function_type is (
--      shift_nothing, shift_left_unsigned,
--      shift_right_signed, do_right_unsigned);
   subtype shift_function_type is std_logic_vector(1 downto 0);
   constant shift_nothing        : shift_function_type := "00";
   constant shift_left_unsigned  : shift_function_type := "01";
   constant shift_right_signed   : shift_function_type := "11";
   constant shift_right_unsigned : shift_function_type := "10";

--   type mult_function_type is (
--      mult_nothing, mult_read_lo, mult_read_hi, mult_write_lo, 
--      mult_write_hi, mult_mult, mult_divide, mult_signed_divide);
   subtype mult_function_type is std_logic_vector(2 downto 0);
   constant mult_nothing       : mult_function_type := "000";
   constant mult_read_lo       : mult_function_type := "001";
   constant mult_read_hi       : mult_function_type := "010";
   constant mult_write_lo      : mult_function_type := "011";
   constant mult_write_hi      : mult_function_type := "100";
   constant mult_mult          : mult_function_type := "101";
   constant mult_divide        : mult_function_type := "110";
   constant mult_signed_divide : mult_function_type := "111";

--   type a_source_type is (from_reg_source, from_imm10_6);
   subtype a_source_type is std_logic_vector(1 downto 0);
   constant a_from_reg_source : a_source_type := "00";
   constant a_from_imm10_6    : a_source_type := "01";
   constant a_from_pc         : a_source_type := "10";

--   type b_source_type is (from_reg_target, from_imm, from_signed_imm);
   subtype b_source_type is std_logic_vector(1 downto 0);
   constant b_from_reg_target : b_source_type := "00";
   constant b_from_imm        : b_source_type := "01";
   constant b_from_signed_imm : b_source_type := "10";
   constant b_from_immX4      : b_source_type := "11";

--   type c_source_type is (from_null, from_alu, from_shift, 
--      from_mult, from_memory, from_pc, from_imm_shift16,
--      from_reg_source_nez, from_reg_source_eqz);
   subtype c_source_type is std_logic_vector(2 downto 0);
   constant c_from_alu        : c_source_type := "000";
   constant c_from_shift      : c_source_type := "001";
   constant c_from_mult       : c_source_type := "010";
   constant c_from_memory     : c_source_type := "011";
   constant c_from_pc         : c_source_type := "100";
   constant c_from_imm_shift16: c_source_type := "101";
   constant c_from_reg_sourcen: c_source_type := "110";
   constant c_from_null       : c_source_type := "111";

--   type pc_source_type is (from_inc4, from_inc8, from_reg_source, 
--      from_opcode25_0, from_branch, from_lbranch);
   subtype pc_source_type is std_logic_vector(1 downto 0);
   constant from_inc4       : pc_source_type := "00";
   constant from_opcode25_0 : pc_source_type := "01";
   constant from_branch     : pc_source_type := "10";
   constant from_lbranch    : pc_source_type := "11";

   subtype branch_function_type is std_logic_vector(2 downto 0);
   constant branch_ltz : branch_function_type := "000";
   constant branch_lez : branch_function_type := "001";
   constant branch_eq  : branch_function_type := "010";
   constant branch_ne  : branch_function_type := "011";
   constant branch_gez : branch_function_type := "100";
   constant branch_gtz : branch_function_type := "101";
   constant branch_yes : branch_function_type := "110";

   -- mode(32=1,16=2,8=3), signed, write
   subtype mem_source_type is std_logic_vector(3 downto 0);
   constant mem_none    : mem_source_type := "0000";
   constant mem_read32  : mem_source_type := "0100";
   constant mem_write32 : mem_source_type := "0101";
   constant mem_read16  : mem_source_type := "1000";
   constant mem_read16s : mem_source_type := "1010";
   constant mem_write16 : mem_source_type := "1001";
   constant mem_read8   : mem_source_type := "1100";
   constant mem_read8s  : mem_source_type := "1110";
   constant mem_write8  : mem_source_type := "1101";

   function bv_to_integer(bv: in std_logic_vector) return integer;
   function bv_adder(a     : in std_logic_vector(32 downto 0);
                     b     : in std_logic_vector(32 downto 0);
                     do_sub: in std_logic) return std_logic_vector;
   function bv_adder_lookahead(
                     a     : in std_logic_vector(32 downto 0);
                     b     : in std_logic_vector(32 downto 0);
                     do_sub: in std_logic) return std_logic_vector;
   function bv_negate(a : in std_logic_vector) return std_logic_vector;
   function bv_increment(a : in std_logic_vector(31 downto 2)
                     ) return std_logic_vector;
   function bv_inc6(a : in std_logic_vector
                     ) return std_logic_vector;
end; --package mips_pack

package body mips_pack is

function add_1(a:integer) return integer is
begin
   return a+1;
end; --function

function bv_to_integer(bv: in std_logic_vector) return integer is
   variable result : integer;
   variable b      : integer;
begin
   result := 0;
   b := 0;
   for index in bv'range loop
      if bv(index) = '1' then
         b := 1;
      else
         b := 0;
      end if;
      result := result * 2 + b;
   end loop;
   return result;
end; --function bv_to_integer

function bv_adder(a     : in std_logic_vector(32 downto 0);
                  b     : in std_logic_vector(32 downto 0);
                  do_sub: in std_logic) return std_logic_vector is
   variable carry_in : std_logic;
   variable bb       : std_logic_vector(32 downto 0);
   variable result   : std_logic_vector(32 downto 0);
begin
   result := "000000000000000000000000000000000";
   if do_sub = '0' then
      bb := b;
      carry_in := '0';
   else
      bb := not b;
      carry_in := '1';
   end if;
   for index in 0 to 32 loop
      result(index) := a(index) xor bb(index) xor carry_in;
      carry_in := (carry_in and (a(index) or bb(index))) or
                  (a(index) and bb(index));
   end loop;
   return result;
end; --function

function bv_adder_lookahead(
                  a     : in std_logic_vector(32 downto 0);
                  b     : in std_logic_vector(32 downto 0);
                  do_sub: in std_logic) return std_logic_vector is
   variable carry    : std_logic_vector(32 downto 0);
   variable p, g     : std_logic_vector(32 downto 0);
   variable bb       : std_logic_vector(32 downto 0);
   variable result   : std_logic_vector(32 downto 0);
   variable i        : natural;
begin
   carry := "000000000000000000000000000000000";
   if do_sub = '0' then
      bb := b;
      carry(0) := '0';
   else
      bb := not b;
      carry(0) := '1';
   end if;

   p := a or bb;   --propogate
   g := a and bb;  --generate
   for index in 0 to 7 loop
      i := index*4;
      carry(i+1) := g(i) or 
                    (p(i) and carry(i));
      i := index*4+1;
      carry(i+1) := g(i) or 
                    (p(i) and g(i-1)) or
                    ((p(i) and p(i-1)) and carry(i-1));
      i := index*4+2;
      carry(i+1) := g(i) or
                    (p(i) and g(i-1)) or
                    (p(i) and p(i-1) and g(i-2)) or
                    ((p(i) and p(i-1) and p(i-2)) and carry(i-2));
      i := index*4+3;
      carry(i+1) := g(i) or 
                    (p(i) and g(i-1)) or
                    (p(i) and p(i-1) and g(i-2)) or
                    (p(i) and p(i-1) and p(i-2) and g(i-3)) or
                    (((p(i) and p(i-1)) and (p(i-2) and p(i-3))) 
                       and carry(i-3));
   end loop;
   result := (a xor bb) xor carry;
   return result;
end; --function

function bv_negate(a : in std_logic_vector) return std_logic_vector is
   variable carry_in : std_logic;
   variable not_a    : std_logic_vector(31 downto 0);
   variable result   : std_logic_vector(31 downto 0);
begin
   result := ZERO;
   not_a := not a;
   carry_in := '1';
   for index in a'reverse_range loop
      result(index) := not_a(index) xor carry_in;
      carry_in := carry_in and not_a(index);
   end loop;
   return result;
end; --function

function bv_increment(a : in std_logic_vector(31 downto 2)
                     ) return std_logic_vector is
   variable carry_in : std_logic;
   variable result   : std_logic_vector(31 downto 2);
begin
   result := "000000000000000000000000000000";
   carry_in := '1';
   for index in 2 to 31 loop
      result(index) := a(index) xor carry_in;
      carry_in := a(index) and carry_in;
   end loop;
   return result;
end; --function

function bv_inc6(a : in std_logic_vector
                     ) return std_logic_vector is
   variable carry_in : std_logic;
   variable result   : std_logic_vector(5 downto 0);
begin
   result := "000000";
   carry_in := '1';
   for index in 0 to 5 loop
      result(index) := a(index) xor carry_in;
      carry_in := a(index) and carry_in;
   end loop;
   return result;
end; --function

end; --package body


