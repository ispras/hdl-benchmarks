-- $Id: addacc.vhdl,v 1.1.1.1 2005/01/04 02:05:58 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Accumulator and Adder
-- Project     : FM Receiver 
-------------------------------------------------------------------------------
-- File        : addacc.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/10/25
-- Last update : 2004/11/19
-- Simulators  : Modelsim 6.0
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Accumulator used in NCO of PLL in FM Receiver
-------------------------------------------------------------------------------
-- Copyright (c) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;

entity addacc is
   port (
    clock  : in  bit;
    acc    : in  bit_vector (17 downto 0);
    result : out bit_vector (17 downto 0);
    offset : in  bit_vector (17 downto 0)
    );
end addacc;

architecture structural of addacc is
   component adder_18bit
      port (
      addend_18bit   : in  bit_vector (17 downto 0);
      augend_18bit   : in  bit_vector (17 downto 0);
      adder18_output : out bit_vector (17 downto 0)
      );
   end component;

signal result_adder01     : bit_vector (17 downto 0);
signal result_adder02     : bit_vector (17 downto 0);
signal result_adder02_reg : bit_vector (17 downto 0);

begin
adder01 : adder_18bit
  port map (
  addend_18bit     => offset,
  augend_18bit     => acc,
  adder18_output   => result_adder01
  );
adder02 : adder_18bit
  port map (
  addend_18bit     => result_adder01,
  augend_18bit     => result_adder02_reg,
  adder18_output   => result_adder02
  );
  process (clock)
  begin
	  if ((clock = '1') and clock'event) then
		  result_adder02_reg <= result_adder02;
		  result <= result_adder02;
	  end if;
  end process;
end structural; 
