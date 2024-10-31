-- $Id: nco.vhdl,v 1.1.1.1 2005/01/04 02:05:58 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : NCO (Numerical Controlled Oscillator)
-- Project     : FM Receiver 
-------------------------------------------------------------------------------
-- File        : nco.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/10/27
-- Last update : 2005/01/01
-- Simulators  : Modelsim 6.0
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Works like VCO in analog PLL
-------------------------------------------------------------------------------
-- Copyright (c) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;

entity nco is
      port (
           clock       : in  bit;
	   clear       : in  bit;
           input_nco   : in  bit_vector (17 downto 0);
           offset      : in  bit_vector (17 downto 0);
           output_nco  : out bit_vector (07 downto 0)
           );
end nco;

architecture structural of nco is
   component addacc 
     port (
           clock       : in  bit;
           acc         : in  bit_vector (17 downto 0);
           result      : out bit_vector (17 downto 0);
           offset      : in  bit_vector (17 downto 0)
           );
   end component;

   component rom
     port (
           address     : in  bit_vector (09 downto 0);
           data        : out bit_vector (07 downto 0)
           );
   end component;

   signal adder_output : bit_vector (17 downto 0);
   signal address_in   : bit_vector (09 downto 0);
   signal output_rom   : bit_vector (07 downto 0);

begin
   address_in (9) <= adder_output(17);
   address_in (8) <= adder_output(16);
   address_in (7) <= adder_output(15);
   address_in (6) <= adder_output(14);
   address_in (5) <= adder_output(13);
   address_in (4) <= adder_output(12);
   address_in (3) <= adder_output(11);
   address_in (2) <= adder_output(10);
   address_in (1) <= adder_output(09);
   address_in (0) <= adder_output(08);

   output_nco (07) <= (output_rom (07) and not(clear));
   output_nco (06) <= (output_rom (06) and not(clear));
   output_nco (05) <= (output_rom (05) and not(clear));
   output_nco (04) <= (output_rom (04) and not(clear));
   output_nco (03) <= (output_rom (03) and not(clear));
   output_nco (02) <= (output_rom (02) and not(clear));
   output_nco (01) <= (output_rom (01) and not(clear));
   output_nco (00) <= (output_rom (00) and not(clear));
 
 myaddacc  : addacc
     port map (
              clock                 => clock,
              acc                   => input_nco,
              result (17 downto 0)  => adder_output,
              offset                => offset
              );
 myrom     : rom
     port map (
              address (09 downto 0) => address_in,
              data    (07 downto 0) => output_rom
              );

end structural;
