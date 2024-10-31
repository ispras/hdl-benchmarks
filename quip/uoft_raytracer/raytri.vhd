library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity raytri is 
  port(
    clk : in std_logic;

    tout : out std_logic_vector(31 downto 0);
    uout : out std_logic_vector(15 downto 0);
    vout : out std_logic_vector(15 downto 0);
    triIDout : out std_logic_vector(15 downto 0);
    hitout : out std_logic;

    vert0x,vert0y,vert0z : in std_logic_vector(27 downto 0);
    origx,origy,origz    : in std_logic_vector(27 downto 0);
    dirx,diry,dirz       : in std_logic_vector(15 downto 0);
    edge1x,edge1y, edge1z : in std_logic_vector(15 downto 0);
    edge1size : in std_logic_vector(1 downto 0);
    edge2x,edge2y, edge2z : in std_logic_vector(15 downto 0);
    edge2size : in std_logic_vector(1 downto 0);
    config : in std_logic_vector(0 downto 0);
    exchangeEdges : in std_logic;
    triID : in std_logic_vector(15 downto 0));
end;

architecture rtl of raytri is

  -- Latch Connected Signals
  signal tvecxl,tvecyl,tveczl : std_logic_vector(28 downto 0);
  signal edge1xr,edge1yr,edge1zr : std_logic_vector(15 downto 0);
  signal edge1xla,edge1yla,edge1zla : std_logic_vector(15 downto 0);
  signal edge1xlb,edge1ylb,edge1zlb : std_logic_vector(15 downto 0);
  signal edge2xr,edge2yr,edge2zr : std_logic_vector(15 downto 0);
  signal edge2xla,edge2yla,edge2zla : std_logic_vector(15 downto 0);
  signal edge2xlb,edge2ylb,edge2zlb : std_logic_vector(15 downto 0);
  signal dirxla,diryla,dirzla : std_logic_vector(15 downto 0);
  signal dirxlb,dirylb,dirzlb : std_logic_vector(15 downto 0);
  signal detl : std_logic_vector(50 downto 0);
  signal hitl : std_logic_vector(0 downto 0);
  signal configl : std_logic_vector(0 downto 0);
  signal edge1sizer, edge2sizer : std_logic_vector(1 downto 0);
  signal edge1sizel, edge2sizel : std_logic_vector(1 downto 0);

-- Intermediate Signals
  signal pvecx,pvecy,pvecz : std_logic_vector(32 downto 0);
  signal det : std_logic_vector(50 downto 0);
  signal tvecx,tvecy,tvecz : std_logic_vector(28 downto 0);
  signal qvecx,qvecy,qvecz : std_logic_vector(45 downto 0);
  signal u,su : std_logic_vector(63 downto 0);
  signal v,usv : std_logic_vector(63 downto 0);
  signal t : std_logic_vector(63 downto 0);
  signal uv : std_logic_vector(64 downto 0);
  signal hitinter : std_logic;

-- Output Signals
  signal hit : std_logic_vector(0 downto 0);
  signal ru : std_logic_vector(15 downto 0);
  signal rv : std_logic_vector(15 downto 0);

begin
  -- Level 1 Math
  pvec : crossproduct 
    generic map (16,16)
    port map (dirxla,diryla,dirzla,edge2xla,edge2yla,edge2zla,pvecx,pvecy,pvecz,clk);

  tvec : vectsub 
    generic map (28)
    port map (origx,origy,origz,vert0x,vert0y,vert0z,tvecx,tvecy,tvecz,clk);

  tvecdelay : vectdelay
    generic map (29,2)
    port map (tvecx,tvecy,tvecz,tvecxl,tvecyl,tveczl,clk);

  edge1exchange : vectexchange
    generic map (16) 
    port map (edge2x, edge2y, edge2z, edge1x, edge1y, edge1z, 
              edge1xr,edge1yr,edge1zr,exchangeEdges);

  edge2exchange : vectexchange
    generic map (16) 
    port map (edge1x, edge1y, edge1z, edge2x, edge2y, edge2z, 
              edge2xr,edge2yr,edge2zr,exchangeEdges);

-- changed to delay 1
  edge1adelay : vectdelay
    generic map (16,1)
    port map (edge1xr,edge1yr,edge1zr,edge1xla,edge1yla,edge1zla,clk);
-- changed to delay 2
  edge1bdelay : vectdelay
    generic map (16,2)
    port map (edge1xla,edge1yla,edge1zla,edge1xlb,edge1ylb,edge1zlb,clk);

  qvec : crossproduct
    generic map (29,16)
    port map (tvecx,tvecy,tvecz,edge1xla,edge1yla,edge1zla,qvecx,qvecy,qvecz,clk);

  det_1 : dotproduct 
    generic map (16,33)
    port map(edge1xlb,edge1ylb,edge1zlb,pvecx,pvecy,pvecz,det,clk);

  ui : dotproduct
    generic map (29,33)
    port map (tvecxl,tvecyl,tveczl,pvecx,pvecy,pvecz,u,clk);

  dirdelaya : vectdelay
    generic map(16,1)
    port map(dirx,diry,dirz,dirxla,diryla,dirzla,clk);

  dirdelayb : vectdelay
    generic map(16,2)
    port map(dirxla,diryla,dirzla,dirxlb,dirylb,dirzlb,clk);

  vi : dotproduct
    generic map (16,46)
    port map (dirxlb,dirylb,dirzlb,qvecx,qvecy,qvecz,usv,clk);

  edge2delaya : vectdelay
    generic map(16,1)
    port map (edge2xr,edge2yr,edge2zr,edge2xla,edge2yla,edge2zla,clk);

  edge2delayb : vectdelay
    generic map(16,2)
    port map (edge2xla,edge2yla,edge2zla,edge2xlb,edge2ylb,edge2zlb,clk);

  ti : dotproduct
    generic map (16,46)
    port map (edge2xlb,edge2ylb,edge2zlb,qvecx,qvecy,qvecz,t,clk);

  configdelay : delay
    generic map (1,6)
    port map(config,configl,clk);

  detdelay : delay
    generic map (51,1)
    port map(det,detl,clk);
 
  divt : divide
    generic map(64,32,51,18)
    port map(t,det,tout,clk);

  divu : divide
    generic map(64,16,51,16)   -- Changed fraction part to 16
    port map(su,det,ru,clk);

  divv : divide
    generic map(64,16,51,16)   -- Changed fraction part to 16
    port map(v,det,rv,clk);

  rudelay : delay
    generic map (16,16)
    port map(ru,uout,clk);

  rvdelay : delay
    generic map (16,16)
    port map (rv, vout,clk);

  triIDdelay : delay
    generic map (16,37)
    port map (triID,triIDout,clk);

  -- Shifter section
  edge1sizeexchange : exchange
    generic map(2)
    port map (edge2size, edge1size, edge1sizer, exchangeEdges);

  edge2sizeexchange : exchange
    generic map(2)
    port map (edge1size, edge2size, edge2sizer, exchangeEdges);

  edge1sizeDelay : delay
    generic map (2,5)
    port map(edge1sizer,edge1sizel,clk);
  
  edge2sizeDelay : delay
    generic map (2,5)
    port map(edge2sizer,edge2sizel,clk);

  shifter1 : shifter
    generic map (64)
    port map(usv,v,edge1sizel);

  shifter2 : shifter
    generic map (64)
    port map(u,su,edge2sizel);

  -- Sun interface (address mapped input registers)

  hitdelay : delay
    generic map (1,30)
    port map (hit,hitl,clk);

  hitout <= hitl(0);

  process(clk) 
  begin
    if (rising_edge(clk)) then
      -- Hit detection Logic (2 cycles)
      uv <= (su(63) & su)+(v(63) & v);
      if ((det < 0) or (su < 0) or (v < 0) or (su > det) or (v > det) or (t <= 0)) then
        hitinter <= '0';
      else
        hitinter <= '1';
      end if;

      if ((hitinter = '0') or ((configl(0) = '0') and (uv > detl))) then
        hit(0) <= '0';
      else 
        hit(0) <= '1';
      end if;
      -- Hit Detection Logic Ends

    end if;
  end process;

end rtl;

