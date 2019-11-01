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
entity b11 is
	port(
		signal x_in:    in integer range 63 downto 0;
		signal stbi:    in bit;
		signal clock:   in bit;
		signal reset:   in bit;
		signal x_out:   out integer range 63 downto 0
	);
end b11;

architecture BEHAV of b11 is

constant s_reset:integer:=0;
constant s_datain:integer:=1;
constant s_spazio:integer:=2;
constant s_mul:integer:=3;
constant s_somma:integer:=4;
constant s_rsum:integer:=5;
constant s_rsot:integer:=6;
constant s_compl:integer:=7;
constant s_dataout:integer:=8;

	begin
	process(clock,reset)
		variable r_in:  integer range 63 downto 0;
		variable stato: integer range 8 downto 0;
		variable cont:  integer range 63 downto 0;
		variable cont1: integer range 255 downto -255;
		begin
		if reset='1' then
			stato:=s_reset;
			r_in:=0;
			cont:=0;
			cont1:=0;
			x_out<=0;
		elsif clock'event and clock='1' then
			case stato is
				when s_reset=>
					cont:=0;
					r_in:=x_in;
					x_out<=0;
					stato:=s_datain;
				when s_datain=>
					r_in:=x_in;
					if stbi='1' then
						stato:=s_datain;
					else
						stato:=s_spazio;        
					end if;
				when s_spazio=>
					if r_in=0 or r_in=63 then
						if cont<25 then
							cont:=cont+1;
						else
							cont:=0;
						end if;
						cont1:=r_in;
						stato:=s_dataout;
					elsif r_in<=26 then 
						stato:=s_mul;
					   else
						stato:=s_datain;
					end if;
				when s_mul=>                
					if (r_in mod 2)=1 then
						cont1:=cont * 2;
					else 
						cont1:=cont;
					end if;
					stato:=s_somma;
				when s_somma=>
					if ((r_in mod 4)/2)=1 then
						cont1:=r_in+cont1;                                               
						stato:=s_rsum;
					else
						cont1:=r_in-cont1;
						stato:=s_rsot;
					end if;
				when s_rsum=>
					if cont1>26 then
						cont1:=cont1-26;
						stato:=s_rsum;
					else
						stato:=s_compl;
					end if;
				when s_rsot=>
					if cont1>63 then
						cont1:=cont1+26;
						stato:=s_rsot;
					else
						stato:=s_compl;
					end if;
				when s_compl=>
					if ((r_in/4) mod 4)=0 then
						cont1:=cont1 - 21;
					elsif ((r_in/4) mod 4)=1 then
						cont1:=cont1 - 42;
					elsif ((r_in/4) mod 4)=2 then
						cont1:=cont1 + 7;
					else
						cont1:=cont1 + 28;
					end if;
					stato:=s_dataout;
				when s_dataout=>
					if cont1 < 0 then
					     -- 	x_out<= -cont1;
					     -- fs 062299
					  x_out<= (-cont1) mod 64;
					else
					     -- 	x_out<=cont1;
                                             -- fs 062299
					  x_out<= (cont1) mod 64;
					end if;
					stato:=s_datain;
				end case;
			end if;
		end process;
end BEHAV;
