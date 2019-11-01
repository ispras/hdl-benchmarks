----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2004 GAISLER RESEARCH
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  See the file COPYING for the full details of the license.
--
-----------------------------------------------------------------------------
-- Entity: 	rstgen
-- File:	rstgen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Reset generation with glitch filter
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity rstgen is
  generic (acthigh : integer := 0);
  port (
    rstin     : in  std_ulogic;
    clk       : in  std_ulogic;
    clklock   : in  std_ulogic;
    rstout    : out std_ulogic;
    rstoutraw : out std_ulogic
  );
end;

architecture rtl of rstgen is
signal r : std_logic_vector(4 downto 0);
signal rst : std_ulogic;
begin

  rst <= not rstin when acthigh = 1 else rstin;
  rstoutraw <= rst;

  reg1 : process (clk, rst) begin
    if rising_edge(clk) then 
      r <= r(3 downto 0) & clklock; 
      rstout <= r(4) and r(3) and r(2);
    end if;
    if rst = '0' then r <= "00000"; rstout <= '0'; end if;
  end process;

end;

