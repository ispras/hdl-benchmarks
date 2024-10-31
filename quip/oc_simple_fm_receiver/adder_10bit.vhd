-- $Id: adder_10bit.vhdl,v 1.1.1.1 2005/01/04 02:05:58 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Adder 10 bit
-- Project     : FM Receiver 
-------------------------------------------------------------------------------
-- File        : adder_10bit.vhdl 
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/12/23 
-- Last update : 
-- Simulators  : Modelsim 6.0
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Ripple carry adder 10 bit with output 11 bit
-------------------------------------------------------------------------------
-- Copyright (c) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity adder_10bit is
   port (
      addend_10bit  : in  bit_vector (09 downto 0);
      augend_10bit  : in  bit_vector (09 downto 0);
      adder10_output: out bit_vector (10 downto 0)
      );
end adder_10bit;

architecture structural of adder_10bit is

   component fulladder
      port (
      addend        : in   bit;
      augend        : in   bit;
      carry_in      : in   bit;
      sum           : out  bit;
      carry         : out  bit
      );
   end component;

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
signal over10 : bit;
signal adder10_output_int : bit_vector (10 downto 0);

begin

c00                     <= '0';
over10                  <= (addend_10bit (09) xor augend_10bit (09));
adder10_output_int (10) <= ((adder10_output_int (09) and over10) or 
			   (c10 and (not (over10))));
adder10_output          <= adder10_output_int;

fa09 : fulladder
   port map (
      addend     => addend_10bit(09),
      augend     => augend_10bit(09),
      carry_in   => c09,
      sum        => adder10_output_int(09),
      carry      => c10
      );

fa08 : fulladder
   port map (
      addend     => addend_10bit(08),
      augend     => augend_10bit(08),
      carry_in   => c08,
      sum        => adder10_output_int(08),
      carry      => c09
      );

fa07 : fulladder
   port map (
      addend     => addend_10bit(07),
      augend     => augend_10bit(07),
      carry_in   => c07,
      sum        => adder10_output_int(07),
      carry      => c08
      );

fa06 : fulladder
   port map (
      addend     => addend_10bit(06),
      augend     => augend_10bit(06),
      carry_in   => c06,
      sum        => adder10_output_int(06),
      carry      => c07
      );

fa05 : fulladder
   port map (
      addend     => addend_10bit(05),
      augend     => augend_10bit(05),
      carry_in   => c05,
      sum        => adder10_output_int(05),
      carry      => c06
      );

fa04 : fulladder
   port map (
      addend     => addend_10bit(04),
      augend     => augend_10bit(04),
      carry_in   => c04,
      sum        => adder10_output_int(04),
      carry      => c05
      );

fa03 : fulladder
   port map (
      addend     => addend_10bit(03),
      augend     => augend_10bit(03),
      carry_in   => c03,
      sum        => adder10_output_int(03),
      carry      => c04
      );

fa02 : fulladder
   port map (
      addend     => addend_10bit(02),
      augend     => augend_10bit(02),
      carry_in   => c02,
      sum        => adder10_output_int(02),
      carry      => c03
      );

fa01 : fulladder
   port map (
      addend     => addend_10bit(01),
      augend     => augend_10bit(01),
      carry_in   => c01,
      sum        => adder10_output_int(01),
      carry      => c02
      );

fa00 : fulladder
   port map (
      addend     => addend_10bit(00),
      augend     => augend_10bit(00),
      carry_in   => c00,
      sum        => adder10_output_int(00),
      carry      => c01
      );

end structural;
