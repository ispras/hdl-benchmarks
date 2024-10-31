-------------------------------------------------------------------------------
-- Title      :  Zero Insertion
-- Project    :  HDLC controller
-------------------------------------------------------------------------------
-- File        : zero_ins.vhd
-- Author      : Jamil Khatib  (khatib@ieee.org)
-- Organization: OpenIPCore Project
-- Created     : 2001/01/12
-- Last update: 2001/05/27
-- Platform    : 
-- Simulators  : Modelsim 5.3XE/Windows98
-- Synthesizers: 
-- Target      : 
-- Dependency  : ieee.std_logic_1164
--
-------------------------------------------------------------------------------
-- Description:  Zero Insertion
-------------------------------------------------------------------------------
-- Copyright (c) 2000 Jamil Khatib
-- 
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-- You can check the draft license at
-- http://www.opencores.org/OIPC/license.shtml

-------------------------------------------------------------------------------
-- Revisions  :
-- Revision Number :   1
-- Version         :   0.1
-- Date            :   12 Jan 2001
-- Modifier        :   Jamil Khatib (khatib@ieee.org)
-- Desccription    :   Created
-------------------------------------------------------------------------------
-- Revisions  :
-- Revision Number :   2
-- Version         :   0.2
-- Date            :   27 May 2001
-- Modifier        :   Jamil Khatib (khatib@ieee.org)
-- Desccription    :   Tx zero insertion bug fixed
--                     Zero is inserted after 5 sequence of 1's insted of 6 1's
-------------------------------------------------------------------------------
-- $Log:   /pvcs/designs/hdl/oc_hdlc/zero_ins.vh_  $
-- 
--    Rev 1.0   22 Sep 2004 19:09:10   kbrunham
-- initial version 
-- TO, Wed Sep 22 03:08:42 2004
-- 
--    Rev 1.0   09 Sep 2003 15:10:24   kbrunham
-- initial version
-- TO, Mon Sep 08 23:10:14 2003
-- Revision 1.2  2001/05/28 19:14:22  khatib
-- TX zero insertion bug fixed
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ZeroIns_ent is

  port (
    TxClk         : in  std_logic;      -- Tx clock
    rst_n         : in  std_logic;      -- system reset
    enable        : in  std_logic;      -- enable (Driven by controller)
    inProgress    : out std_logic;      -- Data in progress
    BackendEnable : in  std_logic;      -- Backend Enable
    -- backend interface
    abortedTrans  : out std_logic;      -- aborted Transmission
    ValidFrame    : in  std_logic;      -- Valid Frame signal
    Writebyte     : in  std_logic;      -- Back end write byte
    rdy           : out std_logic;      -- data ready
    TXD           : out std_logic;      -- TX serial data
    Data          : in  std_logic_vector(7 downto 0));  -- TX data bus

end ZeroIns_ent;
-------------------------------------------------------------------------------
architecture zero_ins_beh of ZeroIns_ent is

  signal data_reg : std_logic_vector(7 downto 0);  -- Data register (used as
                                        -- internal buffer)
  signal flag     : std_logic;          -- control signal between processes
  signal delay_TX : std_logic;          -- Delayed output

begin  -- zero_ins_beh


  -- purpose: Parallel to Serial
  -- type   : sequential
  -- inputs : TxClk, rst_n
  -- outputs: 
  P2S_proc                : process (TxClk, rst_n)
    variable tmp_reg      : std_logic_vector(15 downto 0);  -- Temp Shift register
    variable counter      : integer range 0 to 8;  -- Counter
    variable OnesDetected : std_logic;  -- 6 ones detected

  begin  -- process P2S_proc
    if rst_n = '0' then                 -- asynchronous reset (active low)

      tmp_reg      := (others => '0');
      Counter      := 0;
      flag         <= '1';
      OnesDetected := '0';
      TXD          <= '1';
      delay_TX     <= '1';
      inProgress   <= '0';

    elsif TxClk'event and TxClk = '1' then  -- rising clock edge
      if enable = '1' then

        OnesDetected := tmp_reg(0) and tmp_reg(1) and tmp_reg(2) and tmp_reg(3) and tmp_reg(4);

        delay_TX <= tmp_reg(0);
        TXD      <= delay_TX;

        if OnesDetected = '1' then
          -- Zero insertion 
          tmp_reg(4 downto 0) := '0' & tmp_reg(4 downto 1);

        else
          -- Total Shift
          tmp_reg(15 downto 0) := '0' & tmp_reg(15 downto 1);

          Counter := Counter +1;

        end if;  -- ones detected

        if counter = 8 then

          counter    := 0;
          flag       <= '1';
          inProgress <= '0';

          tmp_reg(15 downto 8) := data_reg;
        else
          inProgress           <= '1';
          flag                 <= '0';
        end if;  -- counter
      end if;  -- enable
    end if;  -- clk
  end process P2S_proc;
-------------------------------------------------------------------------------

  -- purpose: Baclend Interface
  -- type   : sequential
  -- inputs : TxClk, rst_n
  -- outputs:   
  Backend_proc     : process (TxClk, rst_n)
    variable state : std_logic;         -- Backend state

  begin  -- process Backend_proc
    if rst_n = '0' then                     -- asynchronous reset (active low)
      state        := '0';
      data_reg     <= (others => '0');
      rdy          <= '0';
      abortedTrans <= '0';
    elsif TxClk'event and TxClk = '1' then  -- rising clock edge
      if enable = '1' then
        if BackendEnable = '1' then
          if ValidFrame = '1' then

            case state is
              when '0' =>                  -- wait for reading the register
                if flag = '1' then         -- Register has been read
                  state    := '1';
                  rdy      <= '1';
                  data_reg <= "00000000";  -- set register to known pattern to
                                           -- avoid invalid read (upon valid
                                           -- read this value will be overwritten)
                end if;

              when '1' =>
                if WriteByte = '1' then
                  state    := '0';
                  rdy      <= '0';
                  data_reg <= Data;
                elsif flag = '1' then   -- Another flag but without read
                  state        := '0';
                  rdy          <= '0';
                  data_reg     <= "00000000";
                  abortedTrans <= '1';
                end if;

              when others           => null;
            end case;
          else
            abortedTrans <= '0';
          end if;  -- ValidFrame
        else
          data_reg       <= (others => '0');
        end if;  -- Backend enable
      end if;  -- enable
    end if;  -- Txclk
  end process Backend_proc;

  
end zero_ins_beh;
