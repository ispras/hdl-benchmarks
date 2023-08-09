library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_k is
  port (
    clock               : in  STD_LOGIC;
    ev              : in  STD_LOGIC;
    sp               : in  STD_LOGIC;
    X0                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X1                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X2                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X3                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X4                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X5                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X6                  : in  STD_LOGIC_VECTOR(15 downto 0);
    X7                  : in  STD_LOGIC_VECTOR(15 downto 0);
    bc1             : out STD_LOGIC;
    Y0                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y1                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y2                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y3                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y4                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y5                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y6                  : out STD_LOGIC_VECTOR(31 downto 0);
    Y7                  : out STD_LOGIC_VECTOR(31 downto 0));
end obj_k;
architecture behavior of obj_k is
  type outarray is array (7 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
  signal ot : outarray;
  type inarray is array (7 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
  signal int : inarray;
  signal intz1 : STD_LOGIC;
begin  
  int(0)<=X0;
  int(1)<=X1;
  int(2)<=X2;
  int(3)<=X3;
  int(4)<=X4;
  int(5)<=X5;
  int(6)<=X6;
  int(7)<=X7;
  Y0<=ot(0);
  Y1<=ot(1);
  Y2<=ot(2);
  Y3<=ot(3);
  Y4<=ot(4);
  Y5<=ot(5);
  Y6<=ot(6);
  Y7<=ot(7);
  proc_a: process (clock)
	variable i,q,xlm : inarray;
	variable splm,evlm : STD_LOGIC;
        variable bc0002 : STD_LOGIC;
        variable intz2 : unsigned(15 downto 0);
        variable pevlm : STD_LOGIC;
  begin  
    if clock'event and clock= '1' then  
      if evlm='1' and pevlm='0' then
        if splm='1' then
          i:=xlm;
        else
          q:=xlm;
          bc0002:='1';
          bc1<='1';
          for k in 0 to 7 loop
            ot(k)(31 downto 16)<=i(k);
            ot(k)(15 downto 0)<=q(k);
          end loop;
          intz2:=intz2+1;
        end if;
      else
        bc1<=bc0002;
        bc0002:='0';
      end if;
      xlm:=int;
      splm:=sp;
      pevlm:=evlm;
      evlm:=ev;
    end if;
  end process proc_a;
end behavior;
