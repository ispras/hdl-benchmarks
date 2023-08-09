-- $Id: phase_detector.vhdl,v 1.1.1.1 2005/01/04 02:05:58 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Phase detector
-- Project     : FM Receiver 
-------------------------------------------------------------------------------
-- File        : phase_detector.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/12/18
-- Last update : 
-- Simulators  : Modelsim 6.0
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : multiply input signal with signal nco
-------------------------------------------------------------------------------
-- Copyright (c) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity phase_detector is
   port (
   clock        : in  bit;
   signal_input : in  bit_vector (07 downto 0);
   signal_nco   : in  bit_vector (07 downto 0);
   phase_output : out bit_vector (07 downto 0)
   );
end phase_detector;

architecture structural of phase_detector is
   component mult_8bit
   port (
   mult_01    : in  bit_vector (07 downto 00);
   mult_02    : in  bit_vector (07 downto 00);
   result_mult: out bit_vector (15 downto 00)
   );
   end component;
   
   signal output_mult  : bit_vector (15 downto 0);

   begin

phase_mult: mult_8bit
   port map (
   mult_01     (07 downto 0)  => signal_input,
   mult_02     (07 downto 0)  => signal_nco,
   result_mult (15 downto 0)  => output_mult
   );

   process (clock)
   
   begin
     if ((clock = '1') and clock'event) then
	   phase_output <= output_mult(15 downto 8);
     end if;
   end process;
end structural;
