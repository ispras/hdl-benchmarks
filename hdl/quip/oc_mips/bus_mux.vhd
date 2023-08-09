---------------------------------------------------------------------
-- TITLE: Bus Multiplexer / Signal Router
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/8/01
-- FILENAME: bus_mux.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    This entity is the main signal router.  
--    It multiplexes signals from multiple sources to the correct location.
--    The outputs are as follows:
--       a_bus        : goes to the ALU
--       b_bus        : goes to the ALU
--       reg_dest_out : goes to the register bank
--       take_branch  : a signal to pc_next
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity bus_mux is
   port(imm_in       : in  std_logic_vector(15 downto 0);
        reg_source   : in  std_logic_vector(31 downto 0);
        a_mux        : in  a_source_type;
        a_out        : out std_logic_vector(31 downto 0);

        reg_target   : in  std_logic_vector(31 downto 0);
        b_mux        : in  b_source_type;
        b_out        : out std_logic_vector(31 downto 0);

        c_bus        : in  std_logic_vector(31 downto 0);
        c_memory     : in  std_logic_vector(31 downto 0);
        c_pc         : in  std_logic_vector(31 downto 0);
        c_mux        : in  c_source_type;
        reg_dest_out : out std_logic_vector(31 downto 0);

        branch_func  : in  branch_function_type;
        take_branch  : out std_logic);
end; --entity bus_mux

architecture logic of bus_mux is
begin
--   type a_source_type is (a_from_reg_source, a_from_imm10_6);
--   type b_source_type is (b_from_reg_target, b_from_imm, b_from_signed_imm);
--   type c_source_type is (c_from_null, c_from_alu, c_from_shift, 
--      c_from_mult, c_from_memory, c_from_pc, c_from_imm_shift16,
--      c_from_reg_source_nez, c_from_reg_source_eqz);
amux: process(reg_source, imm_in, a_mux, c_pc) 
begin
   a_out(31 downto 5) <= reg_source(31 downto 5);
   case a_mux is
   when a_from_reg_source =>
      a_out(4 downto 0) <= reg_source(4 downto 0);
   when a_from_imm10_6 =>
      a_out(4 downto 0) <= imm_in(10 downto 6);
   when others =>  --a_from_pc
      a_out <= c_pc;
   end case;
end process;

bmux: process(reg_target, imm_in, b_mux) 
begin
   case b_mux is
   when b_from_reg_target  =>
      b_out <= reg_target;
   when b_from_imm =>
      b_out <= ZERO(31 downto 16) & imm_in;
   when b_from_signed_imm =>
      if imm_in(15) = '0' then
         b_out(31 downto 16) <= ZERO(31 downto 16);
      else
         b_out(31 downto 16) <= "1111111111111111";
      end if;
      b_out(15 downto 0) <= imm_in;
   when others =>             --b_from_immX4
      if imm_in(15) = '0' then
         b_out(31 downto 18) <= "00000000000000";
      else
         b_out(31 downto 18) <= "11111111111111";
      end if;
      b_out(17 downto 0) <= imm_in & "00";
   end case;
end process;

cmux: process(c_bus, c_memory, c_pc, imm_in, c_mux) 
begin
   case c_mux is
   when c_from_alu | c_from_shift | c_from_mult =>
      reg_dest_out <= c_bus;
   when c_from_memory =>
      reg_dest_out <= c_memory;
   when c_from_pc =>
      reg_dest_out <= c_pc;
   when c_from_imm_shift16 =>
      reg_dest_out <= imm_in & ZERO(15 downto 0);
--   when from_reg_source_nez =>
--????
--   when from_reg_source_eqz =>
--????
   when others =>
      reg_dest_out <= c_bus;
   end case;
end process;

pc_mux: process(branch_func, reg_source, reg_target) 
   variable is_equal : std_logic;
begin
   if reg_source = reg_target then
      is_equal := '1';
   else
      is_equal := '0';
   end if;
   case branch_func is
   when branch_ltz =>
      take_branch <= reg_source(31);
   when branch_lez =>
      take_branch <= reg_source(31) or is_equal;
   when branch_eq =>
      take_branch <= is_equal;
   when branch_ne =>
      take_branch <= not is_equal;
   when branch_gez =>
      take_branch <= not reg_source(31);
   when branch_gtz =>
      take_branch <= not reg_source(31) and not is_equal;
   when branch_yes =>
      take_branch <= '1';
   when others =>
      take_branch <= is_equal;
   end case;
end process;

end; --architecture logic

