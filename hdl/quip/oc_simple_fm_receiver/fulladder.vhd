-- $Id: fulladder.vhdl,v 1.1.1.1 2005/01/04 02:05:58 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Full Adder component
-- Project     : FM Receiver
-------------------------------------------------------------------------------
-- File        : fulladder.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/12/01
-- Last update : 
-- Simulators  : Modelsim 6.0
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Simple one bit adder with carry
-------------------------------------------------------------------------------
-- Copyright (c) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity fulladder is
   port (
     addend   : in   bit;
     augend   : in   bit;
     carry_in : in   bit;
     sum      : out  bit;
     carry    : out  bit
     );
end fulladder;
     
architecture data_flow of fulladder is
begin
     sum    <= ((addend xor augend) xor carry_in);
     carry  <= ((addend and augend) or (carry_in and (addend or augend)));
end data_flow;
