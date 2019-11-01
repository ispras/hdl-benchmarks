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
entity b06 is
 port (cc_mux : out bit_vector(2 downto 1);
	   eql: in bit;
	   uscite: out bit_vector(2 downto 1);
	   clock: in bit;
	   enable_count: out bit;
	   ackout: out bit;
	   reset: in bit; 
	   cont_eql: in bit);

end b06;

architecture BEHAV of b06 is

constant s_init:integer:=0;
constant s_wait:integer:=1;
constant s_enin:integer:=2;
constant s_enin_w:integer:=3;
constant s_intr:integer:=4;
constant s_intr_1:integer:=5;
constant s_intr_w:integer:=6;

 begin
   process(reset, clock)
	variable state: integer range 6 downto 0;
	
	constant cc_nop: bit_vector(2 downto 1) := "01";
	constant cc_enin: bit_vector(2 downto 1) :="01";
	constant cc_intr: bit_vector(2 downto 1) :="10";
	constant cc_ackin: bit_vector(2 downto 1) :="11";
	constant out_norm: bit_vector(2 downto 1) :="01"; 

 begin
   if reset = '1' then
	state := s_init;
	cc_mux <= "00";
	enable_count <= '0';
	ackout <= '0';
	uscite <= "00";
   elsif clock'event and clock='1' then	
	if cont_eql = '1' then
	 ackout <= '0';
	 enable_count <= '0';
	else
	 ackout <= '1';
	 enable_count <= '1';
	end if;
	
	case state is
   
	 when s_init =>
		cc_mux <= cc_enin;
		uscite <= out_norm;
		state := s_wait;
	 
	 when s_wait =>
	 if eql = '1' then
		uscite <= "00";
		cc_mux <= cc_ackin;
		state := s_enin;
	 else
		uscite <= out_norm;
		cc_mux <= cc_intr;
		state := s_intr_1;
	 end if;

	 when s_intr_1 =>
	 if eql = '1'then
		uscite <="00";
		cc_mux <= cc_ackin;
		state := s_intr;
	 else
		uscite <= out_norm;
		cc_mux <= cc_enin;
		state := s_wait;
	 end if;

	 when s_enin =>
	 if eql = '1' then
		uscite <= "00";
		cc_mux <= cc_ackin;
		state := s_enin;
	 else
		uscite <= "01";
		ackout <= '1';
		enable_count <= '1';
		cc_mux <= cc_enin;
		state := s_enin_w;
	 end if;

	 when s_enin_w =>
	 if eql = '1' then
		uscite <= "01";
		cc_mux <= cc_enin;
		state := s_enin_w;
	 else
		uscite <= out_norm;
		cc_mux <= cc_enin;
		state := s_wait;
	 end if;

	 when s_intr =>
	 if eql = '1' then
		uscite <= "00";
		cc_mux <= cc_ackin;
		state := s_intr;
	 else
		uscite <= "11";
		cc_mux <= cc_intr;
		state := s_intr_w;
	 end if;

	 when s_intr_w =>
	 if eql = '1' then
		uscite <= "11";
		cc_mux <= cc_intr;
		state := s_intr_w;
	 else
		uscite <= out_norm;
		cc_mux <= cc_enin;
		state := s_wait;
	 end if;

	end case;
   end if;
 end process;
end BEHAV;

