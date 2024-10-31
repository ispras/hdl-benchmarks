---------------------------------------------------------------------
-- TITLE: Multiplication and Division Unit
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 1/31/01
-- FILENAME: mult.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the multiplication and division unit.
--    Normally takes 32 clock cycles.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity mult is
   port(clk       : in std_logic;
        a, b      : in std_logic_vector(31 downto 0);
        mult_func : in mult_function_type;
        c_mult    : out std_logic_vector(31 downto 0);
        pause_out : out std_logic);
end; --entity mult

architecture logic of mult is
--   type mult_function_type is (
--      mult_nothing, mult_read_lo, mult_read_hi, mult_write_lo, 
--      mult_write_hi, mult_mult, mult_divide, mult_signed_divide);
   signal do_div_reg    : std_logic;
   signal do_signed_reg : std_logic;
   signal count_reg     : std_logic_vector(5 downto 0);
   signal reg_a         : std_logic_vector(31 downto 0);
   signal reg_b         : std_logic_vector(63 downto 0);
   signal answer_reg    : std_logic_vector(31 downto 0);
begin

--multiplication/division unit
mult_proc: process(clk, a, b, mult_func,
                   do_div_reg, do_signed_reg, count_reg,
                   reg_a, reg_b, answer_reg) 
   variable do_div_temp    : std_logic;
   variable do_signed_temp : std_logic;
   variable count_temp     : std_logic_vector(5 downto 0);
   variable a_temp         : std_logic_vector(31 downto 0);
   variable b_temp         : std_logic_vector(63 downto 0);
   variable answer_temp    : std_logic_vector(31 downto 0);

   variable sign_extension : std_logic;
   variable aa, bb         : std_logic_vector(32 downto 0);
   variable sum            : std_logic_vector(32 downto 0);
   variable start          : std_logic;
   variable do_write       : std_logic;
   variable do_hi          : std_logic;

begin
   do_div_temp    := do_div_reg;
   do_signed_temp := do_signed_reg;
   count_temp     := count_reg;
   a_temp         := reg_a;
   b_temp         := reg_b;
   answer_temp    := answer_reg;

   sign_extension := '0';
   aa             := '0' & ZERO;
   bb             := '0' & ZERO;
   sum            := '0' & ZERO;
   start          := '0';
   do_write       := '0';
   do_hi          := '0';

   case mult_func is
   when mult_read_lo =>
   when mult_read_hi =>
      do_hi := '1';
   when mult_write_lo =>
      do_write := '1';
   when mult_write_hi =>
      do_write := '1';
      do_hi := '1';
   when mult_mult =>
      start := '1';
      do_div_temp := '0';
   when mult_divide =>
      start := '1';
      do_div_temp := '1';
      do_signed_temp := '0';
   when mult_signed_divide =>
      start := '1';
      do_div_temp := '1';
      do_signed_temp := '1';
   when others =>
   end case;

   if start = '1' then
      count_temp := "000000";
      a_temp := a;
      answer_temp := ZERO;
      if do_div_temp = '1' then
         if do_signed_temp = '0' or b(31) = '0' then
            b_temp(62 downto 31) := b;
         else
            b_temp(62 downto 31) := bv_negate(b);
            a_temp := bv_negate(a);
         end if;
         b_temp(30 downto 0) := ZERO(30 downto 0);
      else --multiply
         b_temp := zero & b;
      end if;
   elsif do_write = '1' then
      if do_hi = '0' then
         b_temp(31 downto 0) := a;
      else
         b_temp(63 downto 32) := a;
      end if;
   end if;

   if do_div_reg = '1' then
      bb := reg_b(32 downto 0);
   else
      bb := '0' & reg_b(63 downto 32);
   end if;
   sign_extension := reg_a(31) and do_signed_reg;
   aa := sign_extension & reg_a;
   sum := bv_adder(aa, bb, do_div_reg);
--   sum := bv_adder_lookahead(aa, bb, do_div_reg);

   if count_reg(5) = '0' and start = '0' then
      count_temp := bv_inc6(count_reg);
      if do_div_reg = '1' then
         answer_temp(31 downto 1) := answer_reg(30 downto 0);
         if reg_b(63 downto 32) = ZERO and sum(32) = '0' then
            a_temp := sum(31 downto 0);  --aa=aa-bb;
            answer_temp(0) := '1';
         else
            answer_temp(0) := '0';
         end if;
         if count_reg /= "011111" then
            b_temp(62 downto 0) := reg_b(63 downto 1);
         else
            b_temp(63 downto 32) := a_temp;
            b_temp(31 downto 0) := answer_temp;
         end if;
      else  -- mult_mode
         if reg_b(0) = '1' then
            b_temp(63 downto 31) := sum;
         else
            b_temp(63 downto 31) := '0' & reg_b(63 downto 32);
         end if;
         b_temp(30 downto 0) := reg_b(31 downto 1);
         if count_reg = "010000" and          --early stop
               reg_b(15 downto 0) = zero(15 downto 0) then
            count_temp := "111111";
            b_temp(31 downto 0) := reg_b(47 downto 16);
         end if;
      end if;
   end if;

   if rising_edge(clk) then
      do_div_reg <= do_div_temp;
      do_signed_reg <= do_signed_temp;
      count_reg <= count_temp;
      reg_a <= a_temp;
      reg_b <= b_temp;
      answer_reg <= answer_temp;
   end if;

   if count_reg(5) = '0' and mult_func/= mult_nothing and start = '0' then
      pause_out <= '1';
   else
      pause_out <= '0';
   end if;
   if mult_func = mult_read_lo then
      c_mult <= reg_b(31 downto 0);
   elsif mult_func = mult_read_hi then
      c_mult <= reg_b(63 downto 32);
   else
--      c_mult <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
      c_mult <= ZERO;
   end if;

end process;

end; --architecture logic


