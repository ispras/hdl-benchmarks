---------------------------------------------------------------------
-- TITLE: Shifter Unit
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/2/01
-- FILENAME: shifter.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the 32-bit shifter unit.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity shifter is
   port(value        : in  std_logic_vector(31 downto 0);
        shift_amount : in  std_logic_vector(4 downto 0);
        shift_func   : in  shift_function_type;
        c_shift      : out std_logic_vector(31 downto 0));
end; --entity shifter

architecture logic of shifter is
--   type shift_function_type is (
--      shift_nothing, shift_left_unsigned, 
--      shift_left_signed, shift_right_unsigned);
begin

shift_proc: process(value, shift_amount, shift_func)  --barrel shifter unit
   variable shift1, shift2, shift4, 
            shift8, shift16 : std_logic_vector(31 downto 0);
   variable fills : std_logic_vector(31 downto 16);
variable go_right : std_logic;
begin
   if shift_func = shift_right_unsigned or shift_func = shift_right_signed then
      go_right := '1';
   else
      go_right := '0';
   end if;
   if shift_func = shift_right_signed and value(31) = '1' then
      fills := "1111111111111111";
   else
      fills := "0000000000000000";
   end if;
   if go_right = '0' then  --shift left
      if shift_amount(0) = '1' then
         shift1 := value(30 downto 0) & '0';
      else
         shift1 := value;
      end if;
      if shift_amount(1) = '1' then
         shift2 := shift1(29 downto 0) & "00";
      else
         shift2 := shift1;
      end if;
      if shift_amount(2) = '1' then
         shift4 := shift2(27 downto 0) & "0000";
      else
         shift4 := shift2;
      end if;
      if shift_amount(3) = '1' then
         shift8 := shift4(23 downto 0) & "00000000";
      else
         shift8 := shift4;
      end if;
      if shift_amount(4) = '1' then
         shift16 := shift8(15 downto 0) & ZERO(15 downto 0);
      else
         shift16 := shift8;
      end if;
   else  --shift right
      if shift_amount(0) = '1' then
         shift1 := fills(31) & value(31 downto 1);
      else
         shift1 := value;
      end if;
      if shift_amount(1) = '1' then
         shift2 := fills(31 downto 30) & shift1(31 downto 2);
      else
         shift2 := shift1;
      end if;
      if shift_amount(2) = '1' then
         shift4 := fills(31 downto 28) & shift2(31 downto 4);
      else
         shift4 := shift2;
      end if;
      if shift_amount(3) = '1' then
         shift8 := fills(31 downto 24) & shift4(31 downto 8);
      else
         shift8 := shift4;
      end if;
      if shift_amount(4) = '1' then
         shift16 := fills(31 downto 16) & shift8(31 downto 16);
      else
         shift16 := shift8;
      end if;
   end if;  --shift_dir
   if shift_func = shift_nothing then
--      c_shift <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
      c_shift <= ZERO;
   else
      c_shift <= shift16;
   end if;
end process;

end; --architecture logic

