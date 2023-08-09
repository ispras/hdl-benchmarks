-----------------------------------------------
-- General Purpose Component Library Package --
--   work.complib.all                        --
-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package complib is
  component spramblock is
    generic(
      width : natural := 16;
      depth : natural := 8);
    port(
      we : in std_logic;  
      addr : in std_logic_vector(depth-1 downto 0);
      datain  : in std_logic_vector(width-1 downto 0);
      dataout  : out std_logic_vector(width-1 downto 0);
      clk : in std_logic);
  end component;

  component spram is
    generic(
      width : natural := 16;
      depth : natural := 4);
    port(
      we : in std_logic;
      addr : in std_logic_vector(depth-1 downto 0);
      dataout : out std_logic_vector(width-1 downto 0);
      datain  : in  std_logic_vector(width-1 downto 0);
      clk : in std_logic);
  end component;

  component dpram is
    generic(
      width : natural := 16);
    port(
      we : in std_logic;
      raddr, waddr : in std_logic_vector(3 downto 0);
      dataout : out std_logic_vector(width-1 downto 0);
      datain  : in  std_logic_vector(width-1 downto 0);
      clk : in std_logic);
  end component;

  component shifter
    generic (
      width : natural := 32);
    port(
      A   : in std_logic_vector(width-1 downto 0);
      B   : out std_logic_vector(width-1 downto 0);
      factor : in std_logic_vector(1 downto 0));
  end component;

  component delay
    generic (
      width : natural := 32;
      depth : natural := 1);
    port(
      datain  : in std_logic_vector(width-1 downto 0);
      dataout : out std_logic_vector(width-1 downto 0);
      clk     : in std_logic);
  end component;

  component vectdelay
    generic (
      width : natural := 32;
      depth : natural := 1);
    port(
      xin,yin,zin : in std_logic_vector(width-1 downto 0);
      xout,yout,zout : out std_logic_vector(width-1 downto 0);
      clk      : in std_logic);
  end component;

  component exchange
    generic (
      width : natural := 32);
    port(
      A : in std_logic_vector(width-1 downto 0);
      B : in std_logic_vector(width-1 downto 0);
      C : out std_logic_vector(width-1 downto 0);
      ABn : in std_logic);
  end component;

  component vectexchange
    generic (
      width : natural := 32);
    port(
      Ax,Ay,Az : in std_logic_vector(width-1 downto 0);
      Bx,By,Bz : in std_logic_vector(width-1 downto 0);
      Cx,Cy,Cz : out std_logic_vector(width-1 downto 0);
      ABn : in std_logic);
  end component;

  component vectsub
    generic (
      width : natural := 32);
    port(
      Ax,Ay,Az : in std_logic_vector(width-1 downto 0);
      Bx,By,Bz : in std_logic_vector(width-1 downto 0);
      Cx,Cy,Cz : out std_logic_vector(width downto 0);
      clk      : in std_logic);
  end component;

  component dotproduct
    generic (
      widthA : natural := 32;
      widthB : natural := 32);  
    port(
      Ax,Ay,Az : in std_logic_vector(widthA-1 downto 0);
      Bx,By,Bz : in std_logic_vector(widthB-1 downto 0);
      C        : out std_logic_vector(widthA+widthB+1 downto 0);
      clk      : in std_logic);
  end component;

  component crossproduct
    generic (
      widthA : natural := 32;
      widthB : natural := 32);
    port(
      Ax,Ay,Az : in std_logic_vector(widthA-1 downto 0);
      Bx,By,Bz : in std_logic_vector(widthB-1 downto 0);
      Cx,Cy,Cz : out std_logic_vector(widthA+widthB downto 0);
      clk      : in std_logic);
  end component;

  component divide
    generic (
      widthA    : natural := 64;
      widthOut  : natural := 32;
      widthB    : natural := 64;
      widthFrac : natural := 15);
    port(
      A : in std_logic_vector(widthA-1 downto 0);   
      B : in std_logic_vector(widthB-1 downto 0);   
      Qout : out std_logic_vector(widthOut-1 downto 0);
      clk : in std_logic);
  end component;

  component nearcmp
    port(
      tin     : in std_logic_vector(31 downto 0);
      uin,vin : in std_logic_vector(15 downto 0);
      triIDin : in std_logic_vector(15 downto 0);
      hit     : in std_logic;

      t      : buffer std_logic_vector(31 downto 0);
      u,v    : out std_logic_vector(15 downto 0);
      triID  : out std_logic_vector(15 downto 0);
      anyhit : out std_logic;

      enable : in std_logic;
      reset  : in std_logic;
    
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component nearcmpspec
    port(
      tin     : in std_logic_vector(31 downto 0);
      uin,vin : in std_logic_vector(15 downto 0);
      triIDin : in std_logic_vector(15 downto 0);
      hit     : in std_logic;

      t      : buffer std_logic_vector(31 downto 0);
      u,v    : out std_logic_vector(15 downto 0);
      triID  : out std_logic_vector(15 downto 0);
      anyhit : out std_logic;

      enable : in std_logic;
      enablenear : in std_logic;
      reset  : in std_logic;
    
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component memoryinterface
    port(
      want_addr : out std_logic;
      addr_ready : in std_logic;
      addrin : in std_logic_vector(17 downto 0);
      want_data : out std_logic;
      data_ready : in std_logic;
      datain : in std_logic_vector(63 downto 0);

      dataout       : out std_logic_vector(191 downto 0);
      triIDout      : out std_logic_vector(15 downto 0);
      datavalid     : out std_logic;
      triIDvalid    : in std_logic;
      triID         : in std_logic_vector(15 downto 0);
      wanttriID     : out std_logic;
      cyclenum      : out std_logic_vector(1 downto 0);

      tm3_sram_data : inout std_logic_vector(63 downto 0);
      tm3_sram_addr : out std_logic_vector(18 downto 0); 
      tm3_sram_we   : out std_logic_vector(7 downto 0);
      tm3_sram_oe   : out std_logic_vector(1 downto 0);
      tm3_sram_adsp : out std_logic;
      globalreset : in std_logic;   
      clk : in std_logic);
  end component;

  component raybuffer
    port(
      origx, origy, origz : out std_logic_vector(27 downto 0);
      dirx, diry, dirz : out std_logic_vector(15 downto 0);
      raygroupID : out std_logic_vector(1 downto 0);
      swap : out std_logic;
      resetout : out std_logic;
      enablenear : out std_logic;

      raydata : in std_logic_vector(31 downto 0);
      rayaddr : in std_logic_vector(3 downto 0);
      raywe   : in std_logic_vector(2 downto 0);

      subraynum : in std_logic_vector(1 downto 0);
 
      clk : in std_logic);
  end component;

  component raytri
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
  end component;

  component resultstate
    port(
      commit : in std_logic;

      t1,t2,t3 : in std_logic_vector(31 downto 0);
      u1,u2,u3,v1,v2,v3 : in std_logic_vector(15 downto 0);
      id1,id2,id3 : in std_logic_vector(15 downto 0);
      hit1,hit2,hit3 : in std_logic;
      resultID : in std_logic_vector(1 downto 0);

      resultready : out std_logic;
      resultdata  : out std_logic_vector(31 downto 0);
      globalreset : in std_logic;
      clk : in std_logic);
  end component;
  
  component resultinterface
    port(
      t1b,t2b,t3b : out std_logic_vector(31 downto 0);
      u1b,u2b,u3b,v1b,v2b,v3b : out std_logic_vector(15 downto 0);
      id1b,id2b,id3b : out std_logic_vector(15 downto 0);
      hit1b,hit2b,hit3b : out std_logic;
      resultID : out std_logic_vector(1 downto 0);
      newdata : out std_logic;
      resultready : in std_logic;
      resultdata  : in std_logic_vector(31 downto 0);
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component sortedstack
    generic (
      keywidth  : natural := 32;
      datawidth : natural := 32+16;
      depth : natural := 8);
    port(
      keyin : in std_logic_vector(keywidth-1 downto 0);
      datain : in std_logic_vector(datawidth-1 downto 0);
      write : in std_logic;
      reset : in std_logic; 
      peekdata : out std_logic_vector(datawidth*depth-1 downto 0);
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component rayinterface
    port(
      raygroup : in std_logic_vector(1 downto 0);
      raygroupwe : in std_logic;
      raygroupid : in std_logic_vector(1 downto 0);
      enablenear : in std_logic;

      -- Interchip Bus Signals (Ray Generation Chip)
      rgData      : in std_logic_vector(31 downto 0);
      rgAddr      : in std_logic_vector(3 downto 0);
      rgWE        : in std_logic_vector(2 downto 0);
      rgAddrValid : in std_logic;
      rgDone      : buffer std_logic;
    
      -- Interchip Bus Signals (Ray Tri Chip)
      raydata : out std_logic_vector(31 downto 0);
      rayaddr : out std_logic_vector(3 downto 0);
      raywe   : out std_logic_vector(2 downto 0);
      globalreset : in std_logic;  
      clk : in std_logic);
  end component;

  component boundcontroller
    generic(
      master : std_logic := '0';
      unitID : std_logic_vector(1 downto 0) := "00");
    port(
      raygroupout : out std_logic_vector(1 downto 0);
      raygroupwe : out std_logic;
      raygroupid : out std_logic_vector(1 downto 0);   
      enablenear : out std_logic;
      -- Bus Signals (to Ray Generation Unit)
      raygroup      : in std_logic_vector(1 downto 0);
      validraygroup : in std_logic;
      busy          : out std_logic;
      -- Bus Signals (to RayTri Unit)

      triIDvalid    : out std_logic;
      triID         : out std_logic_vector(15 downto 0);
      wanttriID     : in std_logic;
      --  Sorted stack & list buffer signals
      l0reset       : out std_logic;
      baseaddress   : out std_logic_vector(1 downto 0);
      newdata       : in std_logic;
      boundNodeIDout: buffer std_logic_vector(9 downto 0);
      resultID      : in std_logic_vector(1 downto 0);
      -- List Handler Signals
      hitmask       : buffer std_logic_vector(2 downto 0);
      ldataready,lempty : in std_logic;
      llevel        : in std_logic_vector(1 downto 0);  
      lboundNodeID  : in std_logic_vector(9 downto 0);
      lack          : out std_logic;
      lhreset       : out std_logic;
      -- Leaf Indirection Memory Interface
      addrind      : out std_logic_vector(9 downto 0);
      addrindvalid : out std_logic;
      dataind      : in std_logic_vector(31 downto 0);
      dataindvalid : in std_logic;
      -- Triangle List Memory Interface
      tladdr      : buffer std_logic_vector(17 downto 0);
      tladdrvalid : out std_logic;
      tldata      : in std_logic_vector(63 downto 0);
      tldatavalid : in std_logic;
      -- Result Inputs
      t1in,t2in,t3in : in std_logic_vector(31 downto 0);
      u1in,u2in,u3in,v1in,v2in,v3in : in std_logic_vector(15 downto 0);
      id1in,id2in,id3in : in std_logic_vector(15 downto 0);
      hit1in,hit2in,hit3in : in std_logic; 
      -- Result Outputs
      t1,t2,t3 : out std_logic_vector(31 downto 0);
      u1,u2,u3,v1,v2,v3 : out std_logic_vector(15 downto 0);
      id1,id2,id3 : out std_logic_vector(15 downto 0);
      hit1,hit2,hit3 : out std_logic;
      bcvalid : out std_logic;
      -- Counter interface Signals
      done : in std_logic_vector(1 downto 0);
      resetcnt : out std_logic;
      -- Handshake signals
      passCTSout : out std_logic;
      passCTSin  : in std_logic;   
    
      globalreset : in std_logic;
      clk : in std_logic;
      statepeek : out std_logic_vector(4 downto 0);
      debugsubcount : out std_logic_vector(1 downto 0);
      debugcount : out std_logic_vector(13 downto 0) );
  end component;

  component onlyonecycle
    generic(
      pulselength : natural := 1);
    port(
      trigger : in std_logic;
      output  : out std_logic;
      globalreset : in std_logic;  
      clk : in std_logic);
  end component;

  component listhandler
    port(
      dataarrayin : in std_logic_vector(8*13-1 downto 0);
      commit : in std_logic;

      hitmask : in std_logic_vector(2 downto 0);
      ack     : in std_logic;
      boundnodeID     : out std_logic_vector(9 downto 0);
      level           : out std_logic_vector(1 downto 0);
      empty,dataready : buffer std_logic;

      reset : in std_logic;
      globalreset : in std_logic;
      clk : in std_logic;
      peekoffset0,peekoffset1,peekoffset2 : out std_logic_vector(2 downto 0);
      peekhit : out std_logic;
      peekstate : out std_logic_vector(1 downto 0) );
  end component;

  component resultcounter
    port(
      resultID : in std_logic_vector(1 downto 0);
      newresult : in std_logic;
      done : out std_logic_vector(1 downto 0);
      reset : in std_logic;
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component sramcontroller
    port(
      want_addr : out std_logic;
      addr_ready : in std_logic;
      addrin : in std_logic_vector(17 downto 0);
      want_data : out std_logic;
      data_ready : in std_logic;
      datain : in std_logic_vector(63 downto 0);

      addr : in std_logic_vector(17 downto 0);
      addrvalid : in std_logic;
      data : out std_logic_vector(63 downto 0);
      datavalid : buffer std_logic;

      tm3_sram_data : inout std_logic_vector(63 downto 0);
      tm3_sram_addr : out std_logic_vector(18 downto 0);
      tm3_sram_we   : out std_logic_vector(7 downto 0);
      tm3_sram_oe   : out std_logic_vector(1 downto 0);
      tm3_sram_adsp : out std_logic;
      globalreset : in std_logic;
      clk : in std_logic;
      statepeek : out std_logic_vector(2 downto 0));
  end component;

  component vblockramcontroller
    generic(
    width : natural := 32;   
    depth : natural := 10);
  port(
    want_addr : out std_logic;
    addr_ready : in std_logic; 
    addrin : in std_logic_vector(depth-1 downto 0);
    want_data : out std_logic;
    data_ready : in std_logic;
    datain : in std_logic_vector(width-1 downto 0);

    addr : in std_logic_vector(depth-1 downto 0);
    addrvalid : in std_logic; 
    data : out std_logic_vector(width-1 downto 0);
    datavalid : buffer std_logic;

    globalreset : in std_logic;
    clk : in std_logic);
  end component;

  component resulttransmit
    port(
      valid01,valid10 : in std_logic;
      id01a,id01b,id01c : in std_logic_vector(15 downto 0);
      id10a,id10b,id10c : in std_logic_vector(15 downto 0);
      hit01a,hit01b,hit01c : in std_logic;
      hit10a,hit10b,hit10c : in std_logic;
      u01a,u01b,u01c,v01a,v01b,v01c : in std_logic_vector(15 downto 0);
      u10a,u10b,u10c,v10a,v10b,v10c : in std_logic_vector(15 downto 0);
      -- Interchip Bus Signals
      rgResultData   : out std_logic_vector(31 downto 0);
      rgResultReady  : out std_logic;
      rgResultSource : out std_logic_vector(1 downto 0);
    
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component resultrecieve
    port(
      valid01,valid10 : out std_logic;
      id01a,id01b,id01c : out std_logic_vector(15 downto 0);
      id10a,id10b,id10c : out std_logic_vector(15 downto 0);
      hit01a,hit01b,hit01c : out std_logic;
      hit10a,hit10b,hit10c : out std_logic;

      u01a,u01b,u01c,v01a,v01b,v01c : out std_logic_vector(7 downto 0);
      u10a,u10b,u10c,v10a,v10b,v10c : out std_logic_vector(7 downto 0);

      rgResultData   : in std_logic_vector(31 downto 0);
      rgResultReady  : in std_logic;
      rgResultSource : in std_logic_vector(1 downto 0);
              
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component rgsramcontroller
    port(
      want_addr : out std_logic;
      addr_ready : in std_logic;
      addrin : in std_logic_vector(17 downto 0);
      want_data : out std_logic;
      data_ready : in std_logic;  
      datain : in std_logic_vector(63 downto 0);
      want_read : in std_logic;
      read_ready : out std_logic;
      dataout : out std_logic_vector(63 downto 0);
  
      dirReady : out std_logic;
      wantDir  : in std_logic;
      sramdatal  : out std_logic_vector(47 downto 0);
      addr : out std_logic_vector(14 downto 0); 

      wantwriteback : in std_logic;
      writebackack  : out std_logic;
      writebackdata : in std_logic_vector(63 downto 0);
      writebackaddr : in std_logic_vector(17 downto 0);

      fbdata : out std_logic_vector(63 downto 0);
      fbnextscanline : in std_logic;
      fbdatavalid : out std_logic;
      fbpage : in std_logic;

      shadedata : out std_logic_vector(63 downto 0);
      triID : in std_logic_vector(15 downto 0);
      wantshadedata : in std_logic;
      shadedataready : out std_logic;

      texeladdr : in std_logic_vector(17 downto 0);
      texel : out std_logic_vector(63 downto 0);
      wanttexel : in std_logic;
      texelready : out std_logic;
   
      tm3_sram_data : inout std_logic_vector(63 downto 0);
      tm3_sram_addr : out std_logic_vector(18 downto 0);
      tm3_sram_we   : out std_logic_vector(7 downto 0);
      tm3_sram_oe   : out std_logic_vector(1 downto 0);
      tm3_sram_adsp : out std_logic;
      globalreset : in std_logic;
      clk : in std_logic);
  end component;
  component raysend
    port(
      as : in std_logic;
      ack : buffer std_logic;
      addr : in std_logic_vector(3 downto 0);
      dir : in std_logic_vector(47 downto 0);
      origx,origy,origz : in std_logic_vector(27 downto 0);
      
      rgData      : out std_logic_vector(31 downto 0);
      rgAddr      : out std_logic_vector(3 downto 0);
      rgWE        : out std_logic_vector(2 downto 0);
      rgAddrValid : out std_logic;
     rgDone      : in std_logic;
      
      globalreset : in std_logic;
      clk : in std_logic;
      statepeek : out std_logic_vector(2 downto 0));
  end component;
  component raygencont
    generic(
      id : std_logic);
    port(
      go : in std_logic;
      initcount : in std_logic_vector(14 downto 0);
      busyout : out std_logic;
      cycles : buffer std_logic_vector(30 downto 0);
      nextaddr : out std_logic_vector(17 downto 0);
      nas0,nas1 : out std_logic;
      page : in std_logic;

      dirReady : in std_logic;
      wantDir  : out std_logic;
      dirIn    : in std_logic_vector(47 downto 0);
      addrIn   : in std_logic_vector(14 downto 0);

      as : out std_logic;
      addr : buffer std_logic_vector(3 downto 0);
      ack : in std_logic;
      dir : out std_logic_vector(47 downto 0);
      raygroup0 : buffer std_logic_vector(1 downto 0);   
      raygroupvalid0 : out std_logic;
      busy0 : in std_logic;
      raygroup1 : buffer std_logic_vector(1 downto 0);   
      raygroupvalid1 : out std_logic;
      busy1 : in std_logic;

      globalreset : in std_logic;
      clk : in std_logic;
      statepeek : out std_logic_vector(2 downto 0));
  end component;

  component resultwriter
    port(
      valid01,valid10 : in std_logic;
      id01a,id01b,id01c : in std_logic_vector(15 downto 0);
      id10a,id10b,id10c : in std_logic_vector(15 downto 0);
      hit01a,hit01b,hit01c : in std_logic;
      hit10a,hit10b,hit10c : in std_logic;
      u01a,u01b,u01c,v01a,v01b,v01c : in std_logic_vector(7 downto 0);
      u10a,u10b,u10c,v10a,v10b,v10c : in std_logic_vector(7 downto 0);
      addr : in std_logic_vector(17 downto 0);
      as01,as10 : in std_logic;
      -- Shade Data Interface
      bkcolour : in std_logic_vector(20 downto 0);
      shadedata : in std_logic_vector(63 downto 0);
      triID : out std_logic_vector(15 downto 0);
      wantshadedata : out std_logic;
      shadedataready : in std_logic;
      -- Texture Info Interface
      texinfo : in std_logic_vector(20 downto 0);
      texaddr : out std_logic_vector(3 downto 0);
      -- Texture Data Interface
      texeladdr : out std_logic_vector(17 downto 0);
      texel : in std_logic_vector(63 downto 0);
      wanttexel : out std_logic;
      texelready : in std_logic;      

      dataout : out std_logic_vector(63 downto 0);
      addrout : out std_logic_vector(17 downto 0);
      write : out std_logic;
      ack   : in std_logic;
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component fifo3
    generic (
      datawidth : natural := 18);
    port(
      datain  : in std_logic_vector(datawidth-1 downto 0);
      writeen : in std_logic;
      dataout : out std_logic_vector(datawidth-1 downto 0);
      shiften  : in std_logic;
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component bilinearintrp
    port(
      u01a,u01b,u01c,v01a,v01b,v01c : in std_logic_vector(7 downto 0);
      u10a,u10b,u10c,v10a,v10b,v10c : in std_logic_vector(7 downto 0);
      selectuv : in std_logic_vector(2 downto 0);
      ru,rv,rw,gu,gv,gw,bu,bv,bw : in std_logic_vector(6 downto 0);
      r,g,b : out std_logic_vector(6 downto 0);
      clk      : in std_logic);
  end component;

  component rgconfigmemory
    port(
      CfgAddr : in std_logic_vector(3 downto 0);
      CfgData : in std_logic_vector(27 downto 0);
      CfgData_Ready : in std_logic;
      want_CfgData : out std_logic;
      -- Latched Data Signals 
      origx,origy,origz : out std_logic_vector(27 downto 0);
      m11,m12,m13,m21,m22,m23,m31,m32,m33 : out std_logic_vector(15 downto 0);
      bkcolour : out std_logic_vector(20 downto 0);
      -- Texture Info Interface
      texinfo : out std_logic_vector(20 downto 0);
      texaddr : in std_logic_vector(3 downto 0);

      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component linearmap
    port(
      u,v : in std_logic_vector(6 downto 0);
      start : in std_logic_vector(17 downto 0);
      addr : out std_logic_vector(17 downto 0);
      texelselect : out std_logic_vector(1 downto 0);
      factor : in std_logic_vector(2 downto 0);
      enable : in std_logic;
      clk : in std_logic);
  end component;
  component col16to21
    port(
      dataline : in std_logic_vector(63 downto 0);
      texelselect : in std_logic_vector(1 downto 0);
      r,g,b    : out std_logic_vector(6 downto 0));
  end component;
  component matmult
    generic(
      widthA : natural := 16;
      widthB : natural := 16);
    port(
      Ax,Ay,Az : in std_logic_vector(widthA-1 downto 0);
      m11,m12,m13 : in std_logic_vector(widthB-1 downto 0);
      m21,m22,m23 : in std_logic_vector(widthB-1 downto 0);
      m31,m32,m33 : in std_logic_vector(widthB-1 downto 0);
      Cx,Cy,Cz : out std_logic_vector(widthA-1 downto 0);
      clk      : in std_logic);
  end component;
  component scanline
    port(
      nextpixel : in std_logic;

      we : in std_logic;
      datain : in std_logic_vector(62 downto 0);
      pixeldata : out std_logic_vector(20 downto 0);
      globalreset : in std_logic;
      clk : in std_logic);
  end component;

  component vidout
    port(
      pixeldataA,pixeldataB,pixeldataC : in std_logic_vector(20 downto 0);
      nextpixelA,nextpixelB,nextpixelC : out std_logic;
      startframe,nextscanline : out std_logic;
      globalreset : in std_logic;
      tm3_clk_v0: in std_logic;
      tm3_vidout_red,tm3_vidout_green,tm3_vidout_blue : out std_logic_vector( 9 downto 0);
      tm3_vidout_clock : out std_logic;
      tm3_vidout_hsync : buffer std_logic;
      tm3_vidout_vsync,tm3_vidout_blank : out std_logic);
  end component;

  component scanlinebuffer
    port(
      pixeldataA,pixeldataB,pixeldataC : out std_logic_vector(20 downto 0);
      nextpixelA,nextpixelB,nextpixelC : in std_logic;
      startframe, nextscanline : in std_logic;

      fbdata : in std_logic_vector(63 downto 0); 
      fbnextscanline : out std_logic;
      fbdatavalid : in std_logic;

      globalreset : in std_logic;
      clk : in std_logic);
  end component;
end complib;
