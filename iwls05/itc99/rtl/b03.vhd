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
entity b03 is

  port (
        clock     : in bit;
        reset     : in bit;
        request1  : in bit;
        request2  : in bit;
        request3  : in bit;
        request4  : in bit;
        grant_o   : out bit_vector(3 downto 0)
      );

end b03;

architecture BEHAV of b03 is

	constant INIT        : integer := 0;
	constant ANALISI_REQ : integer := 1;
	constant ASSIGN      : integer := 2;

	constant U1        : bit_vector(2 downto 0) :="100";
	constant U2        : bit_vector(2 downto 0) :="010";
	constant U3        : bit_vector(2 downto 0) :="001";
	constant U4        : bit_vector(2 downto 0) :="111";

begin

process(clock,reset)

   variable coda0           : bit_vector(2 downto 0);
   variable coda1           : bit_vector(2 downto 0);
   variable coda2           : bit_vector(2 downto 0);
   variable coda3           : bit_vector(2 downto 0);
   variable stato           : integer range 2 downto 0;
   variable ru1,ru2,ru3,ru4 : bit;
   variable fu1,fu2,fu3,fu4 : bit;
   variable grant           : bit_vector(3 downto 0);
  
      begin
	if reset='1' then   
			stato:=INIT;
			coda0:="000";
			coda1:="000";
			coda2:="000";
			coda3:="000";
			ru1:='0';
			fu1:='0';
			ru2:='0';
			fu2:='0';
			ru3:='0';
			fu3:='0';
			ru4:='0';
			fu4:='0';
			grant:="0000";
			grant_o<="0000";
	elsif clock'event and clock='1' then

	case stato is
		when INIT =>
                              ru1  := request1;
                              ru2  := request2;
                              ru3  := request3;
                              ru4  := request4;
                              stato:= ANALISI_REQ;
		when ANALISI_REQ =>
			grant_o<=grant;

                        if (ru1='1')  then 
				if (fu1='0') then 
					coda3 := coda2;
					coda2 := coda1;
					coda1 := coda0;
					coda0 := U1;
				end if;
                        elsif (ru2='1')  then 
				if (fu2='0') then 
					coda3 := coda2;
					coda2 := coda1;
					coda1 := coda0;
					coda0 := U2;
				end if;
                        elsif (ru3='1')  then 
				if (fu3='0') then 
					coda3 := coda2;
					coda2 := coda1;
					coda1 := coda0;
					coda0 := U3;
				end if;
                        elsif (ru4='1')  then 
				if (fu4='0') then 
					coda3 := coda2;
					coda2 := coda1;
					coda1 := coda0;
					coda0 := U4;
				end if;
                        end if;

			fu1:=ru1;
			fu2:=ru2;
			fu3:=ru3;
			fu4:=ru4;

                        stato:=ASSIGN;

		when ASSIGN =>
                        if ((fu1 or fu2 or fu3 or fu4)='1') then 
				case coda0 is
					when U1 =>
						grant:="1000";
					when U2 =>
						grant:="0100";
					when U3 =>
						grant:="0010";
					when U4 =>
						grant:="0001";
					when others =>
						grant:="0000";
				end case;
 				coda0:=coda1;
				coda1:=coda2;
				coda2:=coda3;
				coda3:="000";
			end if;
			ru1  := request1;
			ru2  := request2;
			ru3  := request3;
			ru4  := request4;
			stato:= ANALISI_REQ;

	end case;
	end if;
end process;

end BEHAV;
                          
                                         
                         



 
