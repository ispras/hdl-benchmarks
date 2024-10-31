--  
--  ITC99 Benchmark
--  Downloaded from http://www.cad.polito.it/tools/itc99.html
--  
--  Copyright (C) 1999
--  Fulvio Corno, Matteo Sonze Reorda, Giovanni Squillero
--  Politecnico di Torino
--  
--  This source file may be used and distributed without restriction
--  provided that this copyright statement is not removed from the
--  file and that any derivative work contains the original copyright
--  notice and the associated disclaimer.
--  
--  This source file is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License as
--  published by the Free Software Foundation.
--  
--  This source is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--  
--  You should have received a copy of the GNU General Public License
--  along with this source; if not, download it from
--  http://www.gnu.org/copyleft/gpl.html
--  
--  
entity b02 is
port(reset : in bit;
	clock : in bit;
	linea : in bit;
	u     : out bit
    );
end b02;

Architecture BEHAV of b02 is

	constant A:integer:=0;
	constant B:integer:=1;
	constant C:integer:=2;
	constant D:integer:=3;
	constant E:integer:=4;
	constant F:integer:=5;
	constant G:integer:=6;

begin
    process(reset,clock)
        
	variable stato:integer range 6 downto 0;
    
    begin
        
        if reset='1' then 
           stato:=A;
           u<='0';
        elsif clock'event and clock='1' then
           case stato is
                
                when A => 
                     stato:=B; 
                     u<='0';
                when B =>     
                     if linea='0' then
                        stato:=C;
                     else
                        stato:=F;
                     end if;
                     u<='0';
                when C =>     
                     if linea='0' then
                        stato:=D;
                     else
                        stato:=G;
                     end if;
                     u<='0';
                when D => 
                     stato:=E; 
                     u<='0';
                when E =>
                     stato:=B;
                     u<='1';
                when F =>
                     stato:=G;
                     u<='0';
                when G =>     
                     if linea='0' then
                        stato:=E;
                     else
                        stato:=A;
                     end if;
                     u<='0';

           end case;
        end if;

    end process;
end BEHAV;
