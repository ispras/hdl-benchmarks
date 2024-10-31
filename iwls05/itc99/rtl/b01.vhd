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
entity b01 is 
port(
   line1: in bit; 
   line2: in bit;
   reset: in bit;
   outp  : out bit;
   overflw : out bit;
   clock : in bit );
end b01;

architecture BEHAV of b01 is

	constant a:integer:=0;
	constant b:integer:=1;
	constant c:integer:=2;
	constant e:integer:=3;
	constant f:integer:=4;
	constant g:integer:=5;
	constant wf0:integer:=6;
	constant wf1:integer:=7;

begin
        process(clock,reset)
        
	variable stato: integer range 7 downto 0;

        begin
        if reset='1' then 
		stato:=a;
		outp<='0';
		overflw<='0';
        elsif clock'event and clock='1' then 
		case stato is
		when a => 
			if line1='1' and line2='1' then
				stato:=f;
			else
				stato:=b ;
			end if;
			outp <= line1 xor line2;
			overflw <= '0' ;
		when e => 
			if line1='1' and line2='1' then
				stato:=f;
			else
				stato:=b ;
			end if;
			outp <= line1 xor line2;
			overflw <= '1';
               when b   =>
                           if line1='1' and line2='1' then 
                                          stato:=g ;
                           else 
                                          stato:=c;
                           end if;
			outp <= line1 xor line2;
			overflw <= '0' ;
               when f   =>
                           if line1='1' or line2='1' then
                                          stato:=g;
                           else
                                          stato:=c;
                           end if;
			outp <= not(line1 xor line2);
			overflw <= '0' ;
               when c  =>
                           if line1='1' and line2='1' then 
                                          stato:=wf1;
                           else
                                          stato:=wf0;
                           end if;
			outp <= line1 xor line2;
			overflw <= '0' ;
               when g  =>
                           if line1='1' or line2='1' then 
                                          stato:=wf1;
                           else
                                          stato:=wf0;
                           end if;
			outp <= not(line1 xor line2);
			overflw <= '0' ;
               when wf0 => 
                           if line1='1' and line2='1' then 
                                          stato:=e;
                           else
                                          stato:=a;
                           end if;
			outp <= line1 xor line2;
			overflw <= '0' ;
               when wf1 => 
                           if line1='1' or line2='1' then 
                                          stato:=e;
                           else             
                                          stato:=a;
                           end if;
			outp <= not(line1 xor line2);
			overflw <= '0' ;
              end case;
        end if;

	end process;
end BEHAV;








