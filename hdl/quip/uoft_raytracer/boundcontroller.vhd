library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity boundcontroller is 
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
    -- debugging interface
    statepeek : out std_logic_vector(4 downto 0);
    debugsubcount  : out std_logic_vector(1 downto 0);
    debugcount     : out std_logic_vector(13 downto 0));
end;

architecture rtl of boundcontroller is
  type state_type is (S_IDLE,S_WAITCTS,S_ACTIVE,S_SEND,S_WAIT1,S_WAIT2,S_WAITCOMPLETE,
      S_WAITCTS2,S_GETCTS,S_NODECOMPLETE,S_LEAFINDIRECT,S_LEAFACTIVE,
      S_LEAFSEND,S_LEAFWAIT1,S_LEAFWAIT2,S_LEAFCOMPLETE,S_LEAFGIVECTS,S_LEAFGIVEDONE,
      S_LEAFPROCESS,S_LEAFGETCTS);

  signal state : state_type;
  signal next_state : state_type;
  signal cts : std_logic;
  signal addr,startAddr : std_logic_vector(11 downto 0);
  signal resetcount : std_logic_vector(2 downto 0);
  signal raygroupoutl : std_logic_vector(1 downto 0);
  -- Leaf Node Signals
  signal count : std_logic_vector(13 downto 0);
  signal triDatalatch : std_logic_vector(63 downto 0);
  signal subcount : std_logic_vector(1 downto 0);
  signal maskcount : std_logic_vector(1 downto 0);
  signal lBoundNodeID_1  : std_logic_vector(9 downto 0);
  signal addr_1 :  std_logic_vector(11 downto 0); 
  signal startaddr_1  : std_logic_vector(11 downto 0);

begin
  debugsubcount <= subcount;
  debugcount <= count;
  process (state)
  begin
    case state is
      when S_IDLE => statepeek <= "00001";
      when S_WAITCTS => statepeek <= "00010";
      when S_ACTIVE => statepeek <= "00011";
      when S_SEND => statepeek <= "00100";
      when S_WAIT1 => statepeek <= "00101";
      when S_WAIT2 => statepeek <= "00110";
      when S_WAITCOMPLETE => statepeek <= "00111";
      when S_WAITCTS2 => statepeek <= "01001";
      when S_GETCTS => statepeek <= "01010";  -- 10
      when S_NODECOMPLETE => statepeek <= "01011";
      when S_LEAFINDIRECT => statepeek <= "01100";
      when S_LEAFACTIVE => statepeek <= "01101";
      when S_LEAFSEND => statepeek <= "01110";
      when S_LEAFWAIT1 => statepeek <= "01111";
      when S_LEAFWAIT2 => statepeek <= "10000";
      when S_LEAFCOMPLETE => statepeek <= "10001";
      when S_LEAFGIVECTS => statepeek <= "10010";
      when S_LEAFGIVEDONE => statepeek <= "10011";
      when S_LEAFPROCESS => statepeek <= "10100";
      when S_LEAFGETCTS => statepeek <= "10101";
      when others => statepeek <= "11111";
    end case;
  end process;

  raygroupout <= raygroupoutl when (cts = '1' and state /= S_GETCTS and state /= S_LEAFGETCTS and state /= S_WAITCTS) else "00";

  Process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      raygroupoutl <= (others => '0');
      cts <= master;
      passCTSout <= '0';
      addr <= (others => '0');
      startAddr <= (others => '0');
      boundNodeIDout <= (others => '0');
      resetcount <= (others => '0');
      hitmask <= (others => '1');
      lack <= '0';
      baseAddress <= (others => '0');
      l0reset <= '0';
      resetcnt <= '0';
      triIDvalid <= '0';
      triID <= (others => '0');
      addrind <= (others => '0');
      addrindvalid <= '0';
      tladdrvalid <= '0';
      tladdr <= (others => '0');
      tridatalatch <= (others => '0');
      maskcount <= (others => '0');
      subcount <= (others => '0');
      count <= (others => '0');
      hit1 <= '0'; hit2 <= '0'; hit3 <= '0';
      t1 <= (others => '0'); t2 <= (others => '0'); t3 <= (others => '0');
      u1 <= (others => '0'); u2 <= (others => '0'); u3 <= (others => '0');
      v1 <= (others => '0'); v2 <= (others => '0'); v3 <= (others => '0');
      id1 <= (others => '0'); id2 <= (others => '0'); id3 <= (others => '0');
      busy <= '0';
    elsif (rising_edge(clk)) then
      if (next_state = S_IDLE) or (next_state = S_WAITCTS) then
        busy <= '0';
      else
        busy <= '1';
      end if;

      state <= next_state;
      addrind <= (others => '0');
      l0reset <= '0';
      lack <= '0';
      triIDvalid <= '0';
      triID <= (others => '0');
      if newdata = '1' and resultID = unitID then
        boundNodeIDout <= boundNodeIDout + 1;
      end if;
      if (done = unitID) or (state = S_LEAFCOMPLETE and newdata = '1' and resultID = unitID) then
        resetcnt <= '1';
      else
        resetcnt <= '0';
      end if;
      case state is
        when S_IDLE =>
          raygroupoutl <= raygroup;
          if validraygroup = '1' and cts = '0' then
            cts <= '1';
            passCTSout <= '1';
          elsif validraygroup = '0' and cts = '1' and passCTSin = '1' then
            cts <= '0';
            passCTSout <= '1';
          end if;
        when S_WAITCTS =>
          if passCTSin = cts then
            passCTSout <= '0';
          end if;
        when S_ACTIVE =>
          resetcount <= "100";
          l0reset <= '1';
          addr <= (others => '0');
          startAddr <= (others => '0');
          boundNodeIDout <= (others => '0');
          baseAddress <= (others => '0');
          hitMask <= (others => '1');
          hit1 <= '0'; hit2 <= '0'; hit3 <= '0';
        when S_SEND =>
          if (addr-startaddr /= 48) and (addr-startaddr /= 49) then
            triIDvalid <= '1';
          end if;
          triID <= "0000" & addr;
        when S_WAIT2 =>
          addr <= addr+1;
          if resetcount = 5 then
            resetcount <= "000";
          else
            resetcount <= resetcount+1;
          end if;
        when S_WAITCOMPLETE =>
          if passCTSin = '1' and cts = '1' then
            cts <= '0';
            passCTSout <= '1';
          elsif done = unitID and cts = '0' then
            cts <= '1';
            passCTSout <= '1';
          end if;
        when S_WAITCTS2 =>
          if passCTSin = '0' then
            passCTSout <= '0';
          end if;
        when S_GETCTS =>
          if passCTSin = '1' then
            passCTSout <= '0';
          end if;
        when S_NODECOMPLETE =>
          resetcount <= "100";
          baseAddress <= llevel+1;
          
		  lBoundNodeID_1 <= lBoundNodeID+1;
		  boundNodeIDout <= lBoundNodeID_1(6 downto 0) & "000";
          
		  addr_1 <= (lBoundNodeID_1(7 downto 0) & "0000")+
                   (lBoundNodeID_1(6 downto 0) & "00000") ;
          addr <= addr_1 (11 downto 0);
		  
		  
		  startaddr_1 <= (lBoundNodeID_1(7 downto 0) & "0000")+
                        (lBoundNodeID_1(6 downto 0) & "00000");
          startaddr <= startaddr_1 (11 downto 0);
		  
		  if ldataready = '1' and (wantTriID = '1' or llevel = "10") then
            lack <= '1';
            l0reset <= '1'; 
          end if;
          if ldataready = '1' and llevel = "10" then
            addrind <= lboundNodeID-72;
            addrindvalid <= '1';
          end if;
        when S_LEAFINDIRECT =>
          tlAddr <= dataind(17 downto 0);
          count <= dataind(31 downto 18);
          if dataindvalid = '1' then
            addrindvalid <= '0';
            tladdrvalid <= '1';
          end if;
        when S_LEAFACTIVE =>
          tridatalatch <= tldata;
          subcount <= "10";
          maskcount <= "00";
          if (wanttriID = '1' and tldatavalid = '1') or (count = 0 or count = 1) then
            tladdr <= tladdr+1;
            tladdrvalid <= '0';
          end if;
        when S_LEAFSEND =>
          if maskcount = "11" then
            triID <= triDataLatch(15 downto 0);
          elsif maskcount = "10" then
            triID <= triDataLatch(31 downto 16);
          elsif maskcount = "01" then
            triID <= triDataLatch(47 downto 32);
          else
            triID <= triDataLatch(63 downto 48);
          end if;
          if count /= 0 then
            count <= count - 1;
            if count /= 1 then
              triIDvalid <= '1';
            end if;
            if maskcount = "01" then
              tladdrvalid <= '1';
            end if;
          end if;
        when S_LEAFWAIT2 =>
          if subcount /= 0 then
            subcount <= subcount - 1;
          end if;
          if maskcount = "11" then
            tlAddr <= tlAddr+1;
            tladdrvalid <= '0';
            triDataLatch <= tldata;
          end if;
          maskcount <= maskcount + 1;
        when S_LEAFCOMPLETE =>
          tladdr <= (others => '0');  -- THEORY!!
          tladdrvalid <= '0'; -- THEORY!!
          if (newdata = '0' or resultID /= unitID) and CTS = '1' and passCTSin = '1' then
            cts <= '0';
            passCTSout <= '1';
          end if;
        when S_LEAFGIVECTS =>
          if passCTSin = '0' and (newdata = '0' or resultID /= unitID) then
            passCTSout <= '0';
          end if;
        when S_LEAFGIVEDONE =>
          if passCTSin = '0' then
            passCTSout <= '0';
          end if;
        when S_LEAFPROCESS =>
          -- latch new hits
          if hit1in = '1' and hitmask(0) = '1' then
            t1 <= t1in; u1 <= u1in; v1 <= v1in; id1 <= id1in; hit1 <= '1'; hitmask(0) <= '0';
          end if;
          if hit2in = '1' and hitmask(1) = '1' then
            t2 <= t2in; u2 <= u2in; v2 <= v2in; id2 <= id2in; hit2 <= '1'; hitmask(1) <= '0';
          end if;
          if hit3in = '1' and hitmask(2) = '1' then
            t3 <= t3in; u3 <= u3in; v3 <= v3in; id3 <= id3in; hit3 <= '1'; hitmask(2) <= '0';
          end if;
          if cts = '0' and ((hitmask(0) = '1' and hit1in = '0') or (hitmask(1) = '1' and hit2in = '0') or
                            (hitmask(2) = '1' and hit3in = '0')) then
            passCTSout <= '1';
            cts <= '1';
          end if;
        when S_LEAFGETCTS => 
          if passCTSin = '1' then
            passCTSout <= '0';
          end if;
        when others =>
      end case;
    end if;
  end process;

  process (state,validraygroup,cts,passCTSin,wantTriID,addr,startAddr,done,ldataready,
           lempty,llevel,resetcount,dataindvalid,tldatavalid,
           hit1in,hit2in,hit3in,hitmask,resultId,newdata,subcount,count)
  Begin
    raygroupID <= (others => '0');
    enablenear <= '0';
    raygroupwe <= '0';
    bcvalid <= '0';
    lhreset <= '0';
    case state IS
      when S_IDLE =>
        lhreset <= '1';
        if validraygroup = '1' and cts = '1' then
          next_state <= S_ACTIVE;
        elsif validraygroup = '1' and cts = '0' then
          next_state <= S_WAITCTS;
        elsif validraygroup = '0' and passCTSin = '1' and cts = '1' then
          next_state <= S_WAITCTS;
        else
          next_state <= S_IDLE;
        end if;
      when S_WAITCTS =>
        if (passCTSin = cts) and (cts = '1') then
          next_state <= S_ACTIVE;
        elsif passCTSin = cts then
          next_state <= S_IDLE;
        else
          next_state <= S_WAITCTS;
        end if;
      when S_ACTIVE =>
        if wantTriID = '1' then
          next_state <= S_SEND;
        else
          next_state <= S_ACTIVE;
        end if;
      when S_SEND =>
        if (addr-startAddr >= 1) and (addr-startAddr /= 49) then
          raygroupID <= unitID;
        end if;
        next_State <= S_WAIT1;
        if resetcount = 5 then
          raygroupwe <= '1';
        end if;
        enablenear <= '1';
      when S_WAIT1 =>
        if addr-startaddr=49 then
          next_state <= S_WAITCOMPLETE;
        else
          next_state <= S_WAIT2;
        end if;
      when S_WAIT2 =>
        next_state <= S_SEND;
      when S_WAITCOMPLETE =>
        if passCTSin = '1' and cts = '1' then
          next_state <= S_WAITCTS2;
        elsif done = unitID and cts = '0' then
          next_state <= S_GETCTS;
        elsif done = unitID and cts = '1' then
          next_state <= S_NODECOMPLETE;
        else
          next_state <= S_WAITCOMPLETE;
        end if;
      when S_WAITCTS2 =>
        if passCTSin = '0' then
          next_state <= S_WAITCOMPLETE;
        else 
          next_state <= S_WAITCTS2;
        end if;
      when S_GETCTS =>
        if passCTSin = '1' then
          next_state <= S_NODECOMPLETE;
        else
          next_state <= S_GETCTS;
        end if;
      when S_NODECOMPLETE =>
        if lempty = '1'  then
          next_state <= S_IDLE;
          bcvalid <= '1';
        elsif ldataready = '1' and llevel = "10" then
          next_state <= S_LEAFINDIRECT;
        elsif ldataready = '1' and wantTriID = '1' then
          next_state <= S_SEND;
        else
          next_state <= S_NODECOMPLETE;
        end if;
      when S_LEAFINDIRECT =>
        if dataindvalid = '1' then 
          next_state <= S_LEAFACTIVE;
        else
          next_state <= S_LEAFINDIRECT;
        end if;
      when S_LEAFACTIVE =>
        if count = 0 or count = 1 then
          next_state <= S_NODECOMPLETE;
        elsif wanttriID = '1' and tldatavalid = '1' then
          next_state <= S_LEAFSEND;
        else
          next_state <= S_LEAFACTIVE;
        end if;
      when S_LEAFSEND =>
        if count /= 0 then
          next_state <= S_LEAFWAIT1;
        else
          next_state <= S_LEAFCOMPLETE;
        end if;
        if (subcount = "01") then
          raygroupID <= unitID;
        else
          raygroupID <= "00";
        end if;
        enablenear <= '0';
        if subcount = "01" or count = 0 then
          raygroupwe <= '1';
        end if;
      when S_LEAFWAIT1 =>
        next_state <= S_LEAFWAIT2;
      when S_LEAFWAIT2 =>
        next_state <= S_LEAFSEND;
      when S_LEAFCOMPLETE =>
        if (newdata = '0' or resultID /= unitID) and CTS = '1' and passCTSin = '1' then
          next_state <= S_LEAFGIVECTS;
        elsif newdata = '1' and resultID = unitID then
          next_state <= S_LEAFPROCESS;
        else
          next_state <= S_LEAFCOMPLETE;
        end if;
      when S_LEAFGIVECTS =>
        if newdata = '1' and resultID = unitID then
          next_state <= S_LEAFGIVEDONE;
        elsif passCTSin = '0' then
          next_state <= S_LEAFCOMPLETE;
        else
          next_state <= S_LEAFGIVECTS;
        end if;
      when S_LEAFGIVEDONE =>
        if passCTSin = '0' then
          next_state <= S_LEAFPROCESS;
        else
          next_state <= S_LEAFGIVEDONE;
        end if;
      when S_LEAFPROCESS =>
        if cts = '0' and ((hitmask(0) = '1' and hit1in = '0') or (hitmask(1) = '1' and hit2in = '0') or
                          (hitmask(2) = '1' and hit3in = '0')) then
          next_state <= S_LEAFGETCTS;
        elsif cts = '1' and ((hitmask(0) = '1' and hit1in = '0') or (hitmask(1) = '1' and hit2in = '0') or
                             (hitmask(2) = '1' and hit3in = '0')) then
          next_state <= S_NODECOMPLETE;
        else
          next_state <= S_IDLE;
          bcvalid <= '1';
        end if;
      when S_LEAFGETCTS =>
        if passCTSin = '0' then
          next_state <= S_LEAFGETCTS;
        else
          next_state <= S_NODECOMPLETE;
        end if;
    end case;
  end process;

end rtl;

