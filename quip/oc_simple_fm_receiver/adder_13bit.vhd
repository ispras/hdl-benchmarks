-- $Id: adder_13bit.vhdl,v 1.1.1.1 2005/01/04 02:05:58 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Adder 13 bit
-- Project     : FM Receiver 
-------------------------------------------------------------------------------
-- File        : adder_13bit.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/12/23
-- Last update : 
-- Simulators  : Modelsim 6.0/Windows98
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Ripple carry adder 13 bit with output 14 bit
-------------------------------------------------------------------------------
-- Copyright (c) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity adder_13bit is
   port (
      addend_13bit  : in  bit_vector (12 downto 0);
      augend_13bit  : in  bit_vector (12 downto 0);
      adder13_output: out bit_vector (13 downto 0) -- 14 bit output
      );
end adder_13bit;

architecture structural of adder_13bit is

   component fulladder
      port (
      addend        : in   bit;
      augend        : in   bit;
      carry_in      : in   bit;
      sum           : out  bit;
      carry         : out  bit
      );
   end component;

-- internal signal
signal c00 : bit;
signal c01 : bit;
signal c02 : bit;
signal c03 : bit;
signal c04 : bit;
signal c05 : bit;
signal c06 : bit;
signal c07 : bit;
signal c08 : bit;
signal c09 : bit;
signal c10 : bit;
signal c11 : bit;
signal c12 : bit;
signal c13 : bit;
signal over13 : bit;
signal adder13_output_int : bit_vector (13 downto 0);

begin

c00 		       <= '0';
over13                 <= (addend_13bit (12) xor augend_13bit (12));
adder13_output_int(13) <= ((adder13_output_int(12) and over13) or 
			  (c13 and (not (over13))));
adder13_output         <= adder13_output_int;

fa12 : fulladder
   port map (
      addend     => addend_13bit(12),
      augend     => augend_13bit(12),
      carry_in   => c12,
      sum        => adder13_output_int(12),
      carry      => c13
      );

fa11 : fulladder
   port map (
      addend     => addend_13bit(11),
      augend     => augend_13bit(11),
      carry_in   => c11,
      sum        => adder13_output_int(11),
      carry      => c12
      );

fa10 : fulladder
   port map (
      addend     => addend_13bit(10),
      augend     => augend_13bit(10),
      carry_in   => c10,
      sum        => adder13_output_int(10),
      carry      => c11
      );

fa09 : fulladder
   port map (
      addend     => addend_13bit(09),
      augend     => augend_13bit(09),
      carry_in   => c09,
      sum        => adder13_output_int(09),
      carry      => c10
      );

fa08 : fulladder
   port map (
      addend     => addend_13bit(08),
      augend     => augend_13bit(08),
      carry_in   => c08,
      sum        => adder13_output_int(08),
      carry      => c09
      );

fa07 : fulladder
   port map (
      addend     => addend_13bit(07),
      augend     => augend_13bit(07),
      carry_in   => c07,
      sum        => adder13_output_int(07),
      carry      => c08
      );

fa06 : fulladder
   port map (
      addend     => addend_13bit(06),
      augend     => augend_13bit(06),
      carry_in   => c06,
      sum        => adder13_output_int(06),
      carry      => c07
      );

fa05 : fulladder
   port map (
      addend     => addend_13bit(05),
      augend     => augend_13bit(05),
      carry_in   => c05,
      sum        => adder13_output_int(05),
      carry      => c06
      );

fa04 : fulladder
   port map (
      addend     => addend_13bit(04),
      augend     => augend_13bit(04),
      carry_in   => c04,
      sum        => adder13_output_int(04),
      carry      => c05
      );

fa03 : fulladder
   port map (
      addend     => addend_13bit(03),
      augend     => augend_13bit(03),
      carry_in   => c03,
      sum        => adder13_output_int(03),
      carry      => c04
      );

fa02 : fulladder
   port map (
      addend     => addend_13bit(02),
      augend     => augend_13bit(02),
      carry_in   => c02,
      sum        => adder13_output_int(02),
      carry      => c03
      );

fa01 : fulladder
   port map (
      addend     => addend_13bit(01),
      augend     => augend_13bit(01),
      carry_in   => c01,
      sum        => adder13_output_int(01),
      carry      => c02
      );

fa00 : fulladder
   port map (
      addend     => addend_13bit(00),
      augend     => augend_13bit(00),
      carry_in   => c00,
      sum        => adder13_output_int(00),
      carry      => c01
      );

end structural;
