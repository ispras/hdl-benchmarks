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
-- Package: 	util
-- File:	util.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Misc utilities
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;

entity report_version is
  generic (msg1, msg2, msg3, msg4 : string := ""; mdel : integer := 4);
end;

architecture beh of report_version is
begin

  x : process
  
  begin
    wait for mdel * 1 ns;
    if (msg1 /= "") then print(msg1); end if;
    if (msg2 /= "") then print(msg2); end if;
    if (msg3 /= "") then print(msg3); end if;
    if (msg4 /= "") then print(msg4); end if;
    wait;
  end process;
end;

