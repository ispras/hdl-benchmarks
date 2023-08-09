-------------------------------------------------------------------------------
-- Title      :  TX controller
-- Project    :  HDLC controller
-------------------------------------------------------------------------------
-- File        : TxCont.vhd
-- Author      : Jamil Khatib  (khatib@ieee.org)
-- Organization: OpenIPCore Project
-- Created     :2001/01/15
-- Last update: 2001/01/26
-- Platform    : 
-- Simulators  : Modelsim 5.3XE/Windows98
-- Synthesizers: 
-- Target      : 
-- Dependency  : ieee.std_logic_1164
--
-------------------------------------------------------------------------------
-- Description:  Transmit controller
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
-- Date            :   15 Jan 2001
-- Modifier        :   Jamil Khatib (khatib@ieee.org)
-- Desccription    :   Created
-- ToOptimize      :
-- Bugs            :   
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity TxCont_ent is

  port (
    TXclk         : in  std_logic;      -- TX clock
    rst_n         : in  std_logic;      -- System Reset
    TXEN          : in  std_logic;      -- TX enable
    enable        : out std_logic;      -- Enable control
    BackendEnable : out std_logic;      -- Backend Enable
    abortedTrans  : in  std_logic;      -- No Valid data from the backend
    inProgress    : in  std_logic;      -- Data in progress
    ValidFrame    : in  std_logic;      -- Valid Frame
    Frame         : out std_logic;      -- Frame strobe
    AbortFrame    : in  std_logic;      -- AbortFrame
    AbortTrans    : out std_logic);     -- Abort data transmission

end TxCont_ent;
-------------------------------------------------------------------------------
architecture TxCont_beh of TxCont_ent is

begin  -- TxCont_beh

-- purpose: Abort Machine
-- type   : sequential
-- inputs : Txclk, rst_n
-- outputs: 
  abort_proc : process (Txclk, rst_n)

    variable counter : integer range 0 to 14;  -- Counter

    variable state : std_logic;             -- Internal State
    -- state ==> '0' No abort signal
    -- state ==> '1' Abort signal
  begin  -- process abort_proc
    if rst_n = '0' then                     -- asynchronous reset (active low)
      AbortTrans <= '0';
      Counter    := 0;
      enable     <= '1';
      state      := '0';
    elsif Txclk'event and Txclk = '1' then  -- rising clock edge
      if TXEN = '1' then

        case state is

          when '0' =>
            if abortedTrans = '1' or AbortFrame = '1' then
              state    := '1';
              Counter  := 0;
            end if;
            AbortTrans <= '0';

          when '1' =>
            if counter = 8 then
              counter := 0;
              if abortedTrans = '0' and AbortFrame = '0' then

                state      := '0';
                AbortTrans <= '0';
              else
                AbortTrans <= '1';
              end if;

            else
              counter := counter +1;
            end if;  -- counter

          when others => null;

        end case;
      end if;  -- TXEN
      enable <= TXEN;

    end if;  -- TXclk
  end process abort_proc;

  -- purpose: Flag Controller 
  -- type   : sequential
  -- inputs : Txclk, rst_n
  -- outputs: 
  Flag_proc : process (Txclk, rst_n)

    variable state   : std_logic_vector(2 downto 0);  -- Internal State machine
    variable counter : integer range 0 to 16;         -- Internal counter

  begin  -- process Flag_proc
    if rst_n = '0' then                 -- asynchronous reset (active low)
      Frame <= '0';
      state         := (others => '0');
      counter       := 0;
      BackendEnable <= '1';
    elsif Txclk'event and Txclk = '1' then  -- rising clock edge
      if TXEN = '1' then

        case state is
          when "000" =>                 -- Check Valid Frame
            Frame         <= '0';
            if ValidFrame = '1' then
              state       := "001";
              counter     := 0;
            end if;
            BackendEnable <= '1';

          when "001" =>                 -- Wait 16 clks before set internal frame
            counter := counter + 1;

            if counter = 16 then
              counter := 0;

              if inProgress = '0' then
                state     := "010";
                Frame     <= '1';
              else
                state     := "101";
                Frame     <= '0';
              end if;
            else
              Frame       <= '0';
            end if;
            BackendEnable <= '1';

          when "101" =>                 -- Wait for inProgress

            if inProgress = '0' then
              state       := "010";
              Frame       <= '1';
            else
              Frame       <= '0';
            end if;
            BackendEnable <= '1';

          when "010" =>                 -- Check ValidFrame

            Frame <= '1';

            if ValidFrame = '0' then
              state         := "011";
              counter       := 0;
              BackendEnable <= '0';
            else
              BackendEnable <= '1';
            end if;

          when "011" =>                 -- wait 16 clk before trying to unset
                                        -- internal frame
            counter   := counter + 1;
            if counter = 16 then
              counter := 0;
              if inProgress = '0' then
                state := "000";
                Frame <= '0';
              else
                state := "100";
                Frame <= '1';
              end if;
            else
              Frame <= '1';
            end if;

            BackendEnable <= '0';

          when "100" =>

            if inProgress = '0' then
              state := "000";
              Frame <= '0';
            else
              Frame <= '1';
            end if;

            BackendEnable <= '0';

          when others => null;
        end case;
      end if;  -- TXEN
    end if;
  end process Flag_proc;
-------------------------------------------------------------------------------
end TxCont_beh;
