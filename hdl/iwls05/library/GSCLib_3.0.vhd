-- 
-- 180 nm Generic Library
-- Download from http://crete.cadence.com
-- 
-- Export of the technology contained therein is governed by US Export
-- Regulations. Diversion contrary to U.S. law is prohibited. Permission to make
-- copies, either paper or electronic, of this work for personal or classroom use
-- is granted without fee provided that the copies are not made or distributed for
-- profit or commercial advantage. Users are free to use or modify content as
-- appropriate as long as this notice appears in it. Information is provided 'as
-- is' without warranty of any kind. No statement is made and no attempt has been
-- made to examine the information, either with respect to operability, origin,
-- authorship, or otherwise. Please use this information at your own risk. We
-- recommend using it on a copy of your data to be sure you understand what it
-- does under your conditions. Keep your master intact until you are satisfied
-- with the use of this information within your environment. Please report any
-- problems or enhancement requests to crete@cadence.com.
-- 
-- Copyright 2003, Cadence Design Systems - All Rights Reserved
-- 
-- 

LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
LIBRARY IEEE;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;

package prim is

CONSTANT DefCombSpikeMsgOn : BOOLEAN := true;
CONSTANT DefCombSpikeXOn   : BOOLEAN := true;
CONSTANT DefSeqMsgOn       : BOOLEAN := true;
CONSTANT DefSeqXOn         : BOOLEAN := true;

CONSTANT DefDummyDelay    : VitalDelayType := 1.00 ns;
CONSTANT DefDummySetup    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyHold     : VitalDelayType := 1.00 ns;
CONSTANT DefDummyWidth    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRecovery : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRemoval  : VitalDelayType := 1.00 ns;
CONSTANT DefDummyIpd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIsd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIcd      : VitalDelayType := 0.00 ns;

CONSTANT udp_dff : VitalStateTableType (1 TO 21, 1 TO 7) := (
--    NOTIFIER   D      CLK     RN       S      Q(t)   Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '/',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '/',    '0',    '-',    '-',    '1'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '\',   '-',    '-',    '-',    'S'  ),
     (  '-',    '*',    'B',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'B',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    'X',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    'B',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    'X',    '*',    '0',    '0',    '0'  ),
     (  '-',    'B',    'r',    '-',    '-',    '-',    'X'  ),
     (  '-',    '/',    'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    'f',    '-',    '-',    '-',    'X'  ),
     (  '-',    '\',   'X',    '0',    '-',    '-',    'X'  ),
     (  '-',    'B',    'X',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ));

CONSTANT udp_tlat : VitalStateTableType (1 TO 20, 1 TO 7) := (
--      NOT      D       G       R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '1',    '1',    '0',    '-',    '-',    '1'  ),
     (  '-',    '0',    '1',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '*',    '0',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    '0',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    '0',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '1',    '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    'B',    'r',    '0',    '0',    '-',    'X'  ),
     (  '-',    'B',    'X',    '0',    '0',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ) );

CONSTANT udp_rslat : VitalStateTableType (1 TO 12, 1 TO 5) := (
--      NOT      R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '-',    '-',    'S'  ),
     (  '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '*',    '-',    'X'  ) );


end prim;

package body prim is

end prim;
LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity ADDHX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_CO : VitalDelayType01 := (0.0539637 ns, 0.0685433 ns);
             tpd_A_S : VitalDelayType01 := (0.0794668 ns, 0.0413501 ns);
             tpd_B_CO : VitalDelayType01 := (0.0512987 ns, 0.0584112 ns);
             tpd_B_S : VitalDelayType01 := (0.0497091 ns, 0.0359803 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         CO : out std_ulogic ;
         S : out std_ulogic);

   attribute VITAL_LEVEL0 of ADDHX1 : entity is TRUE;
end ADDHX1;

architecture behavioral of ADDHX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE CO_zd : std_ulogic;
      VARIABLE S_zd : std_ulogic;

      -- path delay section variables
      VARIABLE CO_GlitchData : VitalGlitchDataType;
      VARIABLE S_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          CO_zd := VitalAND2(A_ipd, B_ipd);

          S_zd := VitalXOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => CO,
               OutSignalName => "CO",
               OutTemp => CO_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_CO,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_CO,
                             TRUE)),
               GlitchData => CO_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => S,
               OutSignalName => "S",
               OutTemp => S_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_S,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_S,
                             TRUE)),
               GlitchData => S_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity ADDFX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_CI : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_CO : VitalDelayType01 := (0.0943058 ns, 0.107328 ns);
             tpd_A_S : VitalDelayType01 := (0.133591 ns, 0.140845 ns);
             tpd_B_CO : VitalDelayType01 := (0.0986609 ns, 0.112911 ns);
             tpd_B_S : VitalDelayType01 := (0.14592 ns, 0.139063 ns);
             tpd_CI_CO : VitalDelayType01 := (0.0895919 ns, 0.100006 ns);
             tpd_CI_S : VitalDelayType01 := (0.143305 ns, 0.13833 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         CI : in std_ulogic := 'U' ;
         CO : out std_ulogic ;
         S : out std_ulogic);

   attribute VITAL_LEVEL0 of ADDFX1 : entity is TRUE;
end ADDFX1;

architecture behavioral of ADDFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL CI_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( CI_ipd, CI, tipd_CI );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, CI_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE CO_zd : std_ulogic;
      VARIABLE n4_var : std_ulogic;
      VARIABLE S_zd : std_ulogic;

      -- path delay section variables
      VARIABLE CO_GlitchData : VitalGlitchDataType;
      VARIABLE S_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(B_ipd, CI_ipd);
          n2_var := VitalOR2(n0_var, n1_var);
          n3_var := VitalAND2(CI_ipd, A_ipd);
          CO_zd := VitalOR2(n2_var, n3_var);

          n4_var := VitalXOR2(A_ipd, B_ipd);
          S_zd := VitalXOR2(n4_var, CI_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => CO,
               OutSignalName => "CO",
               OutTemp => CO_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_CO,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_CO,
                             TRUE),
                      2 => ( CI_ipd'LAST_EVENT,
                             tpd_CI_CO,
                             TRUE)),
               GlitchData => CO_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => S,
               OutSignalName => "S",
               OutTemp => S_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_S,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_S,
                             TRUE),
                      2 => ( CI_ipd'LAST_EVENT,
                             tpd_CI_S,
                             TRUE)),
               GlitchData => S_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AND2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0547567 ns, 0.0459254 ns);
             tpd_B_Y : VitalDelayType01 := (0.057016 ns, 0.0506273 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AND2X1 : entity is TRUE;
end AND2X1;

architecture behavioral of AND2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalAND2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AOI21X1 is
   generic (
             tipd_A0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_A1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A0_Y : VitalDelayType01 := (0.0401837 ns, 0.0514145 ns);
             tpd_A1_Y : VitalDelayType01 := (0.0467784 ns, 0.05405 ns);
             tpd_B0_Y : VitalDelayType01 := (0.0288276 ns, 0.0248121 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A0 : in std_ulogic := 'U' ;
         A1 : in std_ulogic := 'U' ;
         B0 : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AOI21X1 : entity is TRUE;
end AOI21X1;

architecture behavioral of AOI21X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A0_ipd : std_ulogic := 'X';
   SIGNAL A1_ipd : std_ulogic := 'X';
   SIGNAL B0_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A0_ipd, A0, tipd_A0 );
   VitalWireDelay( A1_ipd, A1, tipd_A1 );
   VitalWireDelay( B0_ipd, B0, tipd_B0 );
END BLOCK;

VITALBehavior : PROCESS (A0_ipd, A1_ipd, B0_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A0_ipd, A1_ipd);
          n1_var := VitalOR2(n0_var, B0_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A0_ipd'LAST_EVENT,
                             tpd_A0_Y,
                             TRUE),
                      1 => ( A1_ipd'LAST_EVENT,
                             tpd_A1_Y,
                             TRUE),
                      2 => ( B0_ipd'LAST_EVENT,
                             tpd_B0_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AOI22X1 is
   generic (
             tipd_A0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_A1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A0_Y : VitalDelayType01 := (0.0309015 ns, 0.0420057 ns);
             tpd_A1_Y : VitalDelayType01 := (0.0351345 ns, 0.0442402 ns);
             tpd_B0_Y : VitalDelayType01 := (0.0467965 ns, 0.0757643 ns);
             tpd_B1_Y : VitalDelayType01 := (0.0518661 ns, 0.0784841 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A0 : in std_ulogic := 'U' ;
         A1 : in std_ulogic := 'U' ;
         B0 : in std_ulogic := 'U' ;
         B1 : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AOI22X1 : entity is TRUE;
end AOI22X1;

architecture behavioral of AOI22X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A0_ipd : std_ulogic := 'X';
   SIGNAL A1_ipd : std_ulogic := 'X';
   SIGNAL B0_ipd : std_ulogic := 'X';
   SIGNAL B1_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A0_ipd, A0, tipd_A0 );
   VitalWireDelay( A1_ipd, A1, tipd_A1 );
   VitalWireDelay( B0_ipd, B0, tipd_B0 );
   VitalWireDelay( B1_ipd, B1, tipd_B1 );
END BLOCK;

VITALBehavior : PROCESS (A0_ipd, A1_ipd, B0_ipd, B1_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(B0_ipd, B1_ipd);
          n1_var := VitalAND2(A0_ipd, A1_ipd);
          n2_var := VitalOR2(n0_var, n1_var);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A0_ipd'LAST_EVENT,
                             tpd_A0_Y,
                             TRUE),
                      1 => ( A1_ipd'LAST_EVENT,
                             tpd_A1_Y,
                             TRUE),
                      2 => ( B0_ipd'LAST_EVENT,
                             tpd_B0_Y,
                             TRUE),
                      3 => ( B1_ipd'LAST_EVENT,
                             tpd_B1_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity BUFX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0443039 ns, 0.0479706 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of BUFX1 : entity is TRUE;
end BUFX1;

architecture behavioral of BUFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity BUFX3 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.052149 ns, 0.0562777 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of BUFX3 : entity is TRUE;
end BUFX3;

architecture behavioral of BUFX3 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUFX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0402213 ns, 0.0428618 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUFX1 : entity is TRUE;
end CLKBUFX1;

architecture behavioral of CLKBUFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUFX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0386065 ns, 0.0420966 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUFX2 : entity is TRUE;
end CLKBUFX2;

architecture behavioral of CLKBUFX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUFX3 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0405664 ns, 0.0440876 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUFX3 : entity is TRUE;
end CLKBUFX3;

architecture behavioral of CLKBUFX3 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFSRX1 is
   generic (
             tipd_CK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CK : VitalDelayType := DefDummyIsd;
             tipd_RN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_RN_CK : VitalDelayType := DefDummyIsd;
             tipd_SN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_SN_CK : VitalDelayType := DefDummyIsd;
             trecovery_SN_RN_posedge_posedge : VitalDelayType := 0.0625002 ns;
             trecovery_SN_CK_posedge_posedge : VitalDelayType := 0 ns;
             tremoval_SN_CK_posedge_posedge : VitalDelayType := 0.0625002 ns;
             trecovery_RN_SN_posedge_posedge : VitalDelayType := 0.0312501 ns;
             trecovery_RN_CK_posedge_posedge : VitalDelayType := 0.125 ns;
             tremoval_RN_CK_posedge_posedge : VitalDelayType := 0 ns;
             tsetup_D_CK_posedge_posedge : VitalDelayType := 0.125 ns;
             tsetup_D_CK_negedge_posedge : VitalDelayType := 0.0624998 ns;
             thold_D_CK_posedge_posedge : VitalDelayType := 0 ns;
             thold_D_CK_negedge_posedge : VitalDelayType := 0 ns;
             tpw_CK_posedge : VitalDelayType := 0.111601 ns;
             tpw_CK_negedge : VitalDelayType := 0.0853519 ns;
             tpw_RN_negedge : VitalDelayType := 0.0917031 ns;
             tpw_SN_negedge : VitalDelayType := 0.112779 ns;
             tremoval_SN_RN_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tremoval_RN_SN_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tpd_CK_Q_posedge : VitalDelayType01 := (0.0789972 ns, 0.0848356 ns);
             tpd_CK_QN_posedge : VitalDelayType01 := (0.144205 ns, 0.117028 ns);
             tpd_RN_Q_negedge : VitalDelayType01 := (0 ns, 0.092626 ns);
             tpd_RN_Q_posedge : VitalDelayType01 := (0.115799 ns, 0 ns);
             tpd_RN_QN_negedge : VitalDelayType01 := (0.151496 ns, 0 ns);
             tpd_SN_Q_negedge : VitalDelayType01 := (0.181364 ns, 0 ns);
             tpd_SN_QN_negedge : VitalDelayType01 := (0 ns, 0.0602777 ns);
             tpd_SN_QN_posedge : VitalDelayType01 := (0.0712068 ns, 0 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         RN : in std_ulogic := 'U' ;
         SN : in std_ulogic := 'U' ;
         Q : out std_ulogic ;
         QN : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFSRX1 : entity is TRUE;
end DFFSRX1;

architecture behavioral of DFFSRX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CK_dly : std_ulogic := 'X';
   SIGNAL CK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';
   SIGNAL RN_dly : std_ulogic := 'X';
   SIGNAL RN_ipd : std_ulogic := 'X';
   SIGNAL SN_dly : std_ulogic := 'X';
   SIGNAL SN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CK_ipd, CK, tipd_CK );
   VitalWireDelay( D_ipd, D, tipd_D );
   VitalWireDelay( RN_ipd, RN, tipd_RN );
   VitalWireDelay( SN_ipd, SN, tipd_SN );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CK_dly, CK_ipd, ticd_CK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CK );
   VitalSignalDelay( RN_dly, RN_ipd, tisd_RN_CK );
   VitalSignalDelay( SN_dly, SN_ipd, tisd_SN_CK );
END BLOCK;

VITALBehavior : PROCESS (CK_dly, D_dly, RN_dly, SN_dly)

      --timing checks section variables
      VARIABLE Tviol_rec_RN_SN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_RN_SN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CK_SN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CK_SN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_SN_RN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_SN_RN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CK_RN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CK_RN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_D_CK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_SN_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_SN_negedge : VitalPeriodDataType;
      VARIABLE PWviol_RN_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_RN_negedge : VitalPeriodDataType;
      VARIABLE PWviol_CK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_CLEAR : std_ulogic;
      VARIABLE n0_SET : std_ulogic;
      VARIABLE NET0131 : std_ulogic;
      VARIABLE P0001 : std_ulogic;
      VARIABLE D_dly_t : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE n1_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n1 : std_logic_vector( 0 TO 4 );
      VARIABLE NET0131_t : std_ulogic;
      VARIABLE P0001_t : std_ulogic;
      VARIABLE Q_zd : std_ulogic;
      VARIABLE QN_zd : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE D_EQ_0_AN_RN_EQ_1 : std_ulogic;
      VARIABLE D_EQ_1_AN_SN_EQ_1 : std_ulogic;
      VARIABLE RN_EQ_1_AN_SN_EQ_1 : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;
      VARIABLE QN_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalRecoveryRemovalCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    RefSignal      => RN_dly,
                    RefSignalName  => "RN",
                    Recovery       => trecovery_SN_RN_posedge_posedge,
                    Removal        => tremoval_SN_RN_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    TimingData     => TimeMarker_rec_RN_SN_posedge,
                    Violation      => Tviol_rec_RN_SN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    Recovery       => trecovery_SN_CK_posedge_posedge,
                    Removal        => tremoval_SN_CK_posedge_posedge,
                    CheckEnabled   => To_X01(D_EQ_0_AN_RN_EQ_1) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    TimingData     => TimeMarker_rec_CK_SN_posedge,
                    Violation      => Tviol_rec_CK_SN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    RefSignal      => SN_dly,
                    RefSignalName  => "SN",
                    Recovery       => trecovery_RN_SN_posedge_posedge,
                    Removal        => tremoval_RN_SN_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    TimingData     => TimeMarker_rec_SN_RN_posedge,
                    Violation      => Tviol_rec_SN_RN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    Recovery       => trecovery_RN_CK_posedge_posedge,
                    Removal        => tremoval_RN_CK_posedge_posedge,
                    CheckEnabled   => To_X01(D_EQ_1_AN_SN_EQ_1) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    TimingData     => TimeMarker_rec_CK_RN_posedge,
                    Violation      => Tviol_rec_CK_RN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    SetupHigh      => tsetup_D_CK_posedge_posedge,
                    SetupLow       => tsetup_D_CK_negedge_posedge,
                    HoldHigh       => thold_D_CK_negedge_posedge,
                    HoldLow        => thold_D_CK_posedge_posedge,
                    CheckEnabled   => To_X01(RN_EQ_1_AN_SN_EQ_1) /= '0',
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    TimingData     => TimeMarker_D_CK,
                    Violation      => Tviol_D_CK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_SN_negedge,
                    PeriodData     => PeriodCheckInfo_SN_negedge,
                    Violation      => PWviol_SN_negedge,
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_RN_negedge,
                    PeriodData     => PeriodCheckInfo_RN_negedge,
                    Violation      => PWviol_RN_negedge,
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CK_dly,
                    TestSignalName => "CK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CK_posedge,
                    PulseWidthLow  => tpw_CK_negedge,
                    PeriodData     => PeriodCheckInfo_CK,
                    Violation      => PWviol_CK,
                    HeaderMsg      => InstancePath & "/DFFSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_rec_RN_SN_posedge OR
                        Tviol_rec_CK_SN_posedge OR
                        Tviol_rec_SN_RN_posedge OR
                        Tviol_rec_CK_RN_posedge OR
                        Tviol_D_CK OR
                        PWviol_SN_negedge OR
                        PWviol_RN_negedge OR
                        PWviol_CK );

          intclk := VitalBUF(CK_dly);

          n0_CLEAR := VitalINV(RN_dly);

          n0_SET := VitalINV(SN_dly);

          D_dly_t := VitalINV(D_dly);

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly_t, intclk, n0_SET, n0_CLEAR),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          NET0131_t := n0_vec(1);

          NET0131 := VitalINV(NET0131_t);

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly, intclk, n0_CLEAR, n0_SET),
                             NumStates => 1,
                                Result => n1_vec,
                        PreviousDataIn => PrevData_udp_dff_n1 );

          P0001_t := n1_vec(1);

          P0001 := VitalINV(P0001_t);

          Q_zd := VitalBUF(NET0131);

          QN_zd := VitalBUF(P0001);

          n2_var := VitalINV(D_dly);
          D_EQ_0_AN_RN_EQ_1 := VitalAND2(n2_var, RN_dly);

          D_EQ_1_AN_SN_EQ_1 := VitalAND2(D_dly, SN_dly);

          RN_EQ_1_AN_SN_EQ_1 := VitalAND2(RN_dly, SN_dly);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CK_dly'LAST_EVENT,
                             tpd_CK_Q_posedge,
                             To_X01(CK_dly) /= '0'),
                      1 => ( RN_dly'LAST_EVENT,
                             tpd_RN_Q_negedge,
                             To_X01(RN_dly) /= '1'),
                      2 => ( RN_dly'LAST_EVENT,
                             tpd_RN_Q_posedge,
                             To_X01(RN_dly) /= '0'),
                      3 => ( SN_dly'LAST_EVENT,
                             tpd_SN_Q_negedge,
                             To_X01(SN_dly) /= '1')),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => QN,
               OutSignalName => "QN",
               OutTemp => QN_zd,
               Paths => (
                      0 => ( CK_dly'LAST_EVENT,
                             tpd_CK_QN_posedge,
                             To_X01(CK_dly) /= '0'),
                      1 => ( RN_dly'LAST_EVENT,
                             tpd_RN_QN_negedge,
                             To_X01(RN_dly) /= '1'),
                      2 => ( SN_dly'LAST_EVENT,
                             tpd_SN_QN_negedge,
                             To_X01(SN_dly) /= '1'),
                      3 => ( SN_dly'LAST_EVENT,
                             tpd_SN_QN_posedge,
                             To_X01(SN_dly) /= '0')),
               GlitchData => QN_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFX1 is
   generic (
             tipd_CK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CK : VitalDelayType := DefDummyIsd;
             tsetup_D_CK_posedge_posedge : VitalDelayType := 0.125 ns;
             tsetup_D_CK_negedge_posedge : VitalDelayType := 0.125 ns;
             thold_D_CK_posedge_posedge : VitalDelayType := 0 ns;
             thold_D_CK_negedge_posedge : VitalDelayType := 0 ns;
             tpw_CK_posedge : VitalDelayType := 0.103071 ns;
             tpw_CK_negedge : VitalDelayType := 0.0817679 ns;
             tpd_CK_Q_posedge : VitalDelayType01 := (0.114979 ns, 0.130798 ns);
             tpd_CK_QN_posedge : VitalDelayType01 := (0.150568 ns, 0.13471 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic ;
         QN : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFX1 : entity is TRUE;
end DFFX1;

architecture behavioral of DFFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CK_dly : std_ulogic := 'X';
   SIGNAL CK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CK_ipd, CK, tipd_CK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CK_dly, CK_ipd, ticd_CK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CK );
END BLOCK;

VITALBehavior : PROCESS (CK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE P0001 : std_ulogic;
      VARIABLE P0000 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE QN_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;
      VARIABLE QN_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    SetupHigh      => tsetup_D_CK_posedge_posedge,
                    SetupLow       => tsetup_D_CK_negedge_posedge,
                    HoldHigh       => thold_D_CK_negedge_posedge,
                    HoldLow        => thold_D_CK_posedge_posedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFX1",
                    TimingData     => TimeMarker_D_CK,
                    Violation      => Tviol_D_CK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CK_dly,
                    TestSignalName => "CK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CK_posedge,
                    PulseWidthLow  => tpw_CK_negedge,
                    PeriodData     => PeriodCheckInfo_CK,
                    Violation      => PWviol_CK,
                    HeaderMsg      => InstancePath & "/DFFX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CK OR
                        PWviol_CK );

          intclk := VitalBUF(CK_dly);

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly, intclk, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          P0001 := n0_vec(1);

          P0000 := VitalINV(P0001);

          Q_zd := VitalINV(P0000);

          QN_zd := VitalBUF(P0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CK_dly'LAST_EVENT,
                             tpd_CK_Q_posedge,
                             To_X01(CK_dly) /= '0')),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => QN,
               OutSignalName => "QN",
               OutTemp => QN_zd,
               Paths => (
                      0 => ( CK_dly'LAST_EVENT,
                             tpd_CK_QN_posedge,
                             To_X01(CK_dly) /= '0')),
               GlitchData => QN_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0207836 ns, 0.0205073 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX1 : entity is TRUE;
end INVX1;

architecture behavioral of INVX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.016638 ns, 0.0170656 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX2 : entity is TRUE;
end INVX2;

architecture behavioral of INVX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX4 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0147473 ns, 0.0149492 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX4 : entity is TRUE;
end INVX4;

architecture behavioral of INVX4 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX8 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0152308 ns, 0.0148973 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX8 : entity is TRUE;
end INVX8;

architecture behavioral of INVX8 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity MX2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_S0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0721089 ns, 0.0710678 ns);
             tpd_B_Y : VitalDelayType01 := (0.0716829 ns, 0.0717737 ns);
             tpd_S0_Y : VitalDelayType01 := (0.0600489 ns, 0.0631233 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         S0 : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of MX2X1 : entity is TRUE;
end MX2X1;

architecture behavioral of MX2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL S0_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( S0_ipd, S0, tipd_S0 );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, S0_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalMUX2(B_ipd, A_ipd, S0_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( S0_ipd'LAST_EVENT,
                             tpd_S0_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0237755 ns, 0.031353 ns);
             tpd_B_Y : VitalDelayType01 := (0.0277085 ns, 0.033656 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND2X1 : entity is TRUE;
end NAND2X1;

architecture behavioral of NAND2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND2X2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0199149 ns, 0.0270584 ns);
             tpd_B_Y : VitalDelayType01 := (0.0237786 ns, 0.0292762 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND2X2 : entity is TRUE;
end NAND2X2;

architecture behavioral of NAND2X2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND3X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.029719 ns, 0.026221 ns);
             tpd_B_Y : VitalDelayType01 := (0.0384501 ns, 0.0314269 ns);
             tpd_C_Y : VitalDelayType01 := (0.0449571 ns, 0.0347364 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND3X1 : entity is TRUE;
end NAND3X1;

architecture behavioral of NAND3X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND4X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.034004 ns, 0.0285699 ns);
             tpd_B_Y : VitalDelayType01 := (0.0444408 ns, 0.0366755 ns);
             tpd_C_Y : VitalDelayType01 := (0.053286 ns, 0.042525 ns);
             tpd_D_Y : VitalDelayType01 := (0.0596885 ns, 0.0465341 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND4X1 : entity is TRUE;
end NAND4X1;

architecture behavioral of NAND4X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(n0_var, C_ipd);
          n2_var := VitalAND2(n1_var, D_ipd);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0362341 ns, 0.035574 ns);
             tpd_B_Y : VitalDelayType01 := (0.0278885 ns, 0.0254448 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR2X1 : entity is TRUE;
end NOR2X1;

architecture behavioral of NOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR3X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0525122 ns, 0.0768018 ns);
             tpd_B_Y : VitalDelayType01 := (0.0428718 ns, 0.0621757 ns);
             tpd_C_Y : VitalDelayType01 := (0.0243344 ns, 0.0362213 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR3X1 : entity is TRUE;
end NOR3X1;

architecture behavioral of NOR3X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR4X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.145975 ns, 0.137056 ns);
             tpd_B_Y : VitalDelayType01 := (0.136215 ns, 0.127287 ns);
             tpd_C_Y : VitalDelayType01 := (0.114118 ns, 0.108923 ns);
             tpd_D_Y : VitalDelayType01 := (0.0839271 ns, 0.081891 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR4X1 : entity is TRUE;
end NOR4X1;

architecture behavioral of NOR4X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          n2_var := VitalOR2(n1_var, D_ipd);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI21X1 is
   generic (
             tipd_A0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_A1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A0_Y : VitalDelayType01 := (0.0364342 ns, 0.0428514 ns);
             tpd_A1_Y : VitalDelayType01 := (0.0454854 ns, 0.0611439 ns);
             tpd_B0_Y : VitalDelayType01 := (0.0206196 ns, 0.044662 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A0 : in std_ulogic := 'U' ;
         A1 : in std_ulogic := 'U' ;
         B0 : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI21X1 : entity is TRUE;
end OAI21X1;

architecture behavioral of OAI21X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A0_ipd : std_ulogic := 'X';
   SIGNAL A1_ipd : std_ulogic := 'X';
   SIGNAL B0_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A0_ipd, A0, tipd_A0 );
   VitalWireDelay( A1_ipd, A1, tipd_A1 );
   VitalWireDelay( B0_ipd, B0, tipd_B0 );
END BLOCK;

VITALBehavior : PROCESS (A0_ipd, A1_ipd, B0_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A0_ipd, A1_ipd);
          n1_var := VitalAND2(n0_var, B0_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A0_ipd'LAST_EVENT,
                             tpd_A0_Y,
                             TRUE),
                      1 => ( A1_ipd'LAST_EVENT,
                             tpd_A1_Y,
                             TRUE),
                      2 => ( B0_ipd'LAST_EVENT,
                             tpd_B0_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI22X1 is
   generic (
             tipd_A0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_A1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A0_Y : VitalDelayType01 := (0.0965754 ns, 0.0882718 ns);
             tpd_A1_Y : VitalDelayType01 := (0.104953 ns, 0.101386 ns);
             tpd_B0_Y : VitalDelayType01 := (0.111783 ns, 0.0947025 ns);
             tpd_B1_Y : VitalDelayType01 := (0.120687 ns, 0.107866 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A0 : in std_ulogic := 'U' ;
         A1 : in std_ulogic := 'U' ;
         B0 : in std_ulogic := 'U' ;
         B1 : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI22X1 : entity is TRUE;
end OAI22X1;

architecture behavioral of OAI22X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A0_ipd : std_ulogic := 'X';
   SIGNAL A1_ipd : std_ulogic := 'X';
   SIGNAL B0_ipd : std_ulogic := 'X';
   SIGNAL B1_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A0_ipd, A0, tipd_A0 );
   VitalWireDelay( A1_ipd, A1, tipd_A1 );
   VitalWireDelay( B0_ipd, B0, tipd_B0 );
   VitalWireDelay( B1_ipd, B1, tipd_B1 );
END BLOCK;

VITALBehavior : PROCESS (A0_ipd, A1_ipd, B0_ipd, B1_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(B0_ipd, B1_ipd);
          n1_var := VitalOR2(A0_ipd, A1_ipd);
          n2_var := VitalAND2(n0_var, n1_var);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A0_ipd'LAST_EVENT,
                             tpd_A0_Y,
                             TRUE),
                      1 => ( A1_ipd'LAST_EVENT,
                             tpd_A1_Y,
                             TRUE),
                      2 => ( B0_ipd'LAST_EVENT,
                             tpd_B0_Y,
                             TRUE),
                      3 => ( B1_ipd'LAST_EVENT,
                             tpd_B1_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI33X1 is
   generic (
             tipd_A0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_A1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_A2 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B0 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B1 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B2 : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A0_Y : VitalDelayType01 := (0.108902 ns, 0.107911 ns);
             tpd_A1_Y : VitalDelayType01 := (0.130303 ns, 0.128446 ns);
             tpd_A2_Y : VitalDelayType01 := (0.139933 ns, 0.141591 ns);
             tpd_B0_Y : VitalDelayType01 := (0.130823 ns, 0.118212 ns);
             tpd_B1_Y : VitalDelayType01 := (0.153193 ns, 0.138995 ns);
             tpd_B2_Y : VitalDelayType01 := (0.163267 ns, 0.15225 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A0 : in std_ulogic := 'U' ;
         A1 : in std_ulogic := 'U' ;
         A2 : in std_ulogic := 'U' ;
         B0 : in std_ulogic := 'U' ;
         B1 : in std_ulogic := 'U' ;
         B2 : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI33X1 : entity is TRUE;
end OAI33X1;

architecture behavioral of OAI33X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A0_ipd : std_ulogic := 'X';
   SIGNAL A1_ipd : std_ulogic := 'X';
   SIGNAL A2_ipd : std_ulogic := 'X';
   SIGNAL B0_ipd : std_ulogic := 'X';
   SIGNAL B1_ipd : std_ulogic := 'X';
   SIGNAL B2_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A0_ipd, A0, tipd_A0 );
   VitalWireDelay( A1_ipd, A1, tipd_A1 );
   VitalWireDelay( A2_ipd, A2, tipd_A2 );
   VitalWireDelay( B0_ipd, B0, tipd_B0 );
   VitalWireDelay( B1_ipd, B1, tipd_B1 );
   VitalWireDelay( B2_ipd, B2, tipd_B2 );
END BLOCK;

VITALBehavior : PROCESS (A0_ipd, A1_ipd, A2_ipd, B0_ipd, B1_ipd, B2_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE n4_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(B0_ipd, B1_ipd);
          n1_var := VitalOR2(n0_var, B2_ipd);
          n2_var := VitalOR2(A0_ipd, A1_ipd);
          n3_var := VitalOR2(n2_var, A2_ipd);
          n4_var := VitalAND2(n1_var, n3_var);
          Y_zd := VitalINV(n4_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A0_ipd'LAST_EVENT,
                             tpd_A0_Y,
                             TRUE),
                      1 => ( A1_ipd'LAST_EVENT,
                             tpd_A1_Y,
                             TRUE),
                      2 => ( A2_ipd'LAST_EVENT,
                             tpd_A2_Y,
                             TRUE),
                      3 => ( B0_ipd'LAST_EVENT,
                             tpd_B0_Y,
                             TRUE),
                      4 => ( B1_ipd'LAST_EVENT,
                             tpd_B1_Y,
                             TRUE),
                      5 => ( B2_ipd'LAST_EVENT,
                             tpd_B2_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0510814 ns, 0.0681118 ns);
             tpd_B_Y : VitalDelayType01 := (0.0424717 ns, 0.0599574 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OR2X1 : entity is TRUE;
end OR2X1;

architecture behavioral of OR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OR4X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.103974 ns, 0.121396 ns);
             tpd_B_Y : VitalDelayType01 := (0.0963422 ns, 0.112701 ns);
             tpd_C_Y : VitalDelayType01 := (0.0807767 ns, 0.09046 ns);
             tpd_D_Y : VitalDelayType01 := (0.0566331 ns, 0.0598735 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OR4X1 : entity is TRUE;
end OR4X1;

architecture behavioral of OR4X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          Y_zd := VitalOR2(n1_var, D_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity SDFFSRX1 is
   generic (
             tipd_CK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CK : VitalDelayType := DefDummyIsd;
             tipd_RN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_RN_CK : VitalDelayType := DefDummyIsd;
             tipd_SE : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_SE_CK : VitalDelayType := DefDummyIsd;
             tipd_SI : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_SI_CK : VitalDelayType := DefDummyIsd;
             tipd_SN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_SN_CK : VitalDelayType := DefDummyIsd;
             trecovery_SN_CK_posedge_posedge : VitalDelayType := 0.0624998 ns;
             tremoval_SN_CK_posedge_posedge : VitalDelayType := 0.0625002 ns;
             tsetup_SI_CK_posedge_posedge : VitalDelayType := 0.125 ns;
             tsetup_SI_CK_negedge_posedge : VitalDelayType := 0.25 ns;
             thold_SI_CK_posedge_posedge : VitalDelayType := 0 ns;
             thold_SI_CK_negedge_posedge : VitalDelayType := -0.125 ns;
             tsetup_SE_CK_posedge_posedge : VitalDelayType := 0.1875 ns;
             tsetup_SE_CK_negedge_posedge : VitalDelayType := 0.15625 ns;
             thold_SE_CK_posedge_posedge : VitalDelayType := -0.0625 ns;
             thold_SE_CK_negedge_posedge : VitalDelayType := -0.0937499 ns;
             trecovery_RN_SN_posedge_posedge : VitalDelayType := 0.0937501 ns;
             trecovery_RN_CK_posedge_posedge : VitalDelayType := 0.0624998 ns;
             tremoval_RN_CK_posedge_posedge : VitalDelayType := 0 ns;
             tsetup_D_CK_posedge_posedge : VitalDelayType := 0.0624998 ns;
             tsetup_D_CK_negedge_posedge : VitalDelayType := 0.1875 ns;
             thold_D_CK_posedge_posedge : VitalDelayType := 0 ns;
             thold_D_CK_negedge_posedge : VitalDelayType := -0.125 ns;
             tpw_CK_posedge : VitalDelayType := 0.186437 ns;
             tpw_CK_negedge : VitalDelayType := 0.147284 ns;
             tpw_RN_negedge : VitalDelayType := 0.113946 ns;
             tpw_SN_negedge : VitalDelayType := 0.0894044 ns;
             tremoval_RN_SN_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tpd_CK_Q_posedge : VitalDelayType01 := (0.29121 ns, 0.212937 ns);
             tpd_CK_QN_posedge : VitalDelayType01 := (0.183989 ns, 0.256269 ns);
             tpd_RN_Q_negedge : VitalDelayType01 := (0 ns, 0.136759 ns);
             tpd_RN_QN_negedge : VitalDelayType01 := (0.108131 ns, 0 ns);
             tpd_SN_Q_negedge : VitalDelayType01 := (0.121724 ns, 0 ns);
             tpd_SN_Q_posedge : VitalDelayType01 := (0 ns, 0.120999 ns);
             tpd_SN_QN_negedge : VitalDelayType01 := (0 ns, 0.0944537 ns);
             tpd_SN_QN_posedge : VitalDelayType01 := (0.0923808 ns, 0 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         RN : in std_ulogic := 'U' ;
         SE : in std_ulogic := 'U' ;
         SI : in std_ulogic := 'U' ;
         SN : in std_ulogic := 'U' ;
         Q : out std_ulogic ;
         QN : out std_ulogic);

   attribute VITAL_LEVEL0 of SDFFSRX1 : entity is TRUE;
end SDFFSRX1;

architecture behavioral of SDFFSRX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CK_dly : std_ulogic := 'X';
   SIGNAL CK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';
   SIGNAL RN_dly : std_ulogic := 'X';
   SIGNAL RN_ipd : std_ulogic := 'X';
   SIGNAL SE_dly : std_ulogic := 'X';
   SIGNAL SE_ipd : std_ulogic := 'X';
   SIGNAL SI_dly : std_ulogic := 'X';
   SIGNAL SI_ipd : std_ulogic := 'X';
   SIGNAL SN_dly : std_ulogic := 'X';
   SIGNAL SN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CK_ipd, CK, tipd_CK );
   VitalWireDelay( D_ipd, D, tipd_D );
   VitalWireDelay( RN_ipd, RN, tipd_RN );
   VitalWireDelay( SE_ipd, SE, tipd_SE );
   VitalWireDelay( SI_ipd, SI, tipd_SI );
   VitalWireDelay( SN_ipd, SN, tipd_SN );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CK_dly, CK_ipd, ticd_CK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CK );
   VitalSignalDelay( RN_dly, RN_ipd, tisd_RN_CK );
   VitalSignalDelay( SE_dly, SE_ipd, tisd_SE_CK );
   VitalSignalDelay( SI_dly, SI_ipd, tisd_SI_CK );
   VitalSignalDelay( SN_dly, SN_ipd, tisd_SN_CK );
END BLOCK;

VITALBehavior : PROCESS (CK_dly, D_dly, RN_dly, SE_dly, SI_dly, SN_dly)

      --timing checks section variables
      VARIABLE Tviol_rec_CK_RN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CK_RN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_SN_RN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_SN_RN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CK_SN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CK_SN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_D_CK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_SE_CK : std_ulogic := '0';
      VARIABLE TimeMarker_SE_CK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_SI_CK : std_ulogic := '0';
      VARIABLE TimeMarker_SI_CK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CK : VitalPeriodDataType;
      VARIABLE PWviol_RN_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_RN_negedge : VitalPeriodDataType;
      VARIABLE PWviol_SN_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_SN_negedge : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE n0_D : std_ulogic;
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_CLEAR : std_ulogic;
      VARIABLE n0_SET : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE P0000 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE QN_zd : std_ulogic;
      VARIABLE RN_EQ_1 : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 : std_ulogic;
      VARIABLE RN_EQ_1_AN_SN_EQ_1 : std_ulogic;
      VARIABLE SN_EQ_1 : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;
      VARIABLE QN_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalRecoveryRemovalCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    Recovery       => trecovery_RN_CK_posedge_posedge,
                    Removal        => tremoval_RN_CK_posedge_posedge,
                    CheckEnabled   => To_X01(SN_EQ_1) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    TimingData     => TimeMarker_rec_CK_RN_posedge,
                    Violation      => Tviol_rec_CK_RN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    RefSignal      => SN_dly,
                    RefSignalName  => "SN",
                    Recovery       => trecovery_RN_SN_posedge_posedge,
                    Removal        => tremoval_RN_SN_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    TimingData     => TimeMarker_rec_SN_RN_posedge,
                    Violation      => Tviol_rec_SN_RN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    Recovery       => trecovery_SN_CK_posedge_posedge,
                    Removal        => tremoval_SN_CK_posedge_posedge,
                    CheckEnabled   => To_X01(RN_EQ_1) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    TimingData     => TimeMarker_rec_CK_SN_posedge,
                    Violation      => Tviol_rec_CK_SN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    SetupHigh      => tsetup_D_CK_posedge_posedge,
                    SetupLow       => tsetup_D_CK_negedge_posedge,
                    HoldHigh       => thold_D_CK_negedge_posedge,
                    HoldLow        => thold_D_CK_posedge_posedge,
                    CheckEnabled   => To_X01(RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1) /= '0',
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    TimingData     => TimeMarker_D_CK,
                    Violation      => Tviol_D_CK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => SE_dly,
                    TestSignalName => "SE",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    SetupHigh      => tsetup_SE_CK_posedge_posedge,
                    SetupLow       => tsetup_SE_CK_negedge_posedge,
                    HoldHigh       => thold_SE_CK_negedge_posedge,
                    HoldLow        => thold_SE_CK_posedge_posedge,
                    CheckEnabled   => To_X01(RN_EQ_1_AN_SN_EQ_1) /= '0',
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    TimingData     => TimeMarker_SE_CK,
                    Violation      => Tviol_SE_CK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => SI_dly,
                    TestSignalName => "SI",
                    RefSignal      => CK_dly,
                    RefSignalName  => "CK",
                    SetupHigh      => tsetup_SI_CK_posedge_posedge,
                    SetupLow       => tsetup_SI_CK_negedge_posedge,
                    HoldHigh       => thold_SI_CK_negedge_posedge,
                    HoldLow        => thold_SI_CK_posedge_posedge,
                    CheckEnabled   => To_X01(RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1) /= '0',
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    TimingData     => TimeMarker_SI_CK,
                    Violation      => Tviol_SI_CK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CK_dly,
                    TestSignalName => "CK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CK_posedge,
                    PulseWidthLow  => tpw_CK_negedge,
                    PeriodData     => PeriodCheckInfo_CK,
                    Violation      => PWviol_CK,
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_RN_negedge,
                    PeriodData     => PeriodCheckInfo_RN_negedge,
                    Violation      => PWviol_RN_negedge,
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_SN_negedge,
                    PeriodData     => PeriodCheckInfo_SN_negedge,
                    Violation      => PWviol_SN_negedge,
                    HeaderMsg      => InstancePath & "/SDFFSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_rec_CK_RN_posedge OR
                        Tviol_rec_SN_RN_posedge OR
                        Tviol_rec_CK_SN_posedge OR
                        Tviol_D_CK OR
                        Tviol_SE_CK OR
                        Tviol_SI_CK OR
                        PWviol_CK OR
                        PWviol_RN_negedge OR
                        PWviol_SN_negedge );

          n0_D := VitalMUX2(SI_dly, D_dly, SE_dly);

          intclk := VitalBUF(CK_dly);

          n0_CLEAR := VitalINV(RN_dly);

          n0_SET := VitalINV(SN_dly);

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, n0_D, intclk, n0_CLEAR, n0_SET),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          P0002 := n0_vec(1);

          P0000 := VitalINV(P0002);

          Q_zd := VitalINV(P0000);

          QN_zd := VitalBUF(P0000);

          RN_EQ_1 := VitalBUF(RN_dly);

          n1_var := VitalAND2(RN_dly, SE_dly);
          RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 := VitalAND2(n1_var, SN_dly);

          RN_EQ_1_AN_SN_EQ_1 := VitalAND2(RN_dly, SN_dly);

          SN_EQ_1 := VitalBUF(SN_dly);

          n2_var := VitalINV(SE_dly);
          n3_var := VitalAND2(RN_dly, n2_var);
          RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 := VitalAND2(n3_var, SN_dly);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CK_dly'LAST_EVENT,
                             tpd_CK_Q_posedge,
                             To_X01(CK_dly) /= '0'),
                      1 => ( RN_dly'LAST_EVENT,
                             tpd_RN_Q_negedge,
                             To_X01(RN_dly) /= '1'),
                      2 => ( SN_dly'LAST_EVENT,
                             tpd_SN_Q_negedge,
                             To_X01(SN_dly) /= '1'),
                      3 => ( SN_dly'LAST_EVENT,
                             tpd_SN_Q_posedge,
                             To_X01(SN_dly) /= '0')),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => QN,
               OutSignalName => "QN",
               OutTemp => QN_zd,
               Paths => (
                      0 => ( CK_dly'LAST_EVENT,
                             tpd_CK_QN_posedge,
                             To_X01(CK_dly) /= '0'),
                      1 => ( RN_dly'LAST_EVENT,
                             tpd_RN_QN_negedge,
                             To_X01(RN_dly) /= '1'),
                      2 => ( SN_dly'LAST_EVENT,
                             tpd_SN_QN_negedge,
                             To_X01(SN_dly) /= '1'),
                      3 => ( SN_dly'LAST_EVENT,
                             tpd_SN_QN_posedge,
                             To_X01(SN_dly) /= '0')),
               GlitchData => QN_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OE : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0593803 ns, 0.0561091 ns);
             tpd_OE_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0408 ns, 0.0618784 ns, 0.0532661 ns, 0.0239817 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OE : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX1 : entity is TRUE;
end TBUFX1;

architecture behavioral of TBUFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OE_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OE_ipd, OE, tipd_OE );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OE_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUFIF1(A_ipd, OE_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( OE_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OE_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OE : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0721651 ns, 0.0643642 ns);
             tpd_OE_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0408 ns, 0.0746287 ns, 0.0720909 ns, 0.0189139 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OE : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX2 : entity is TRUE;
end TBUFX2;

architecture behavioral of TBUFX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OE_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OE_ipd, OE, tipd_OE );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OE_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUFIF1(A_ipd, OE_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( OE_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OE_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX4 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OE : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0719682 ns, 0.064062 ns);
             tpd_OE_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0408 ns, 0.074135 ns, 0.0713899 ns, 0.0197949 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OE : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX4 : entity is TRUE;
end TBUFX4;

architecture behavioral of TBUFX4 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OE_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OE_ipd, OE, tipd_OE );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OE_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUFIF1(A_ipd, OE_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( OE_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OE_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX8 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OE : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0711948 ns, 0.0620767 ns);
             tpd_OE_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.045424 ns, 0.0883171 ns, 0.0619756 ns, 0.0290207 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OE : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX8 : entity is TRUE;
end TBUFX8;

architecture behavioral of TBUFX8 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OE_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OE_ipd, OE, tipd_OE );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OE_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUFIF1(A_ipd, OE_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( OE_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OE_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TINVX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OE : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0440777 ns, 0.033875 ns);
             tpd_OE_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0408 ns, 0.0487456 ns, 0.0663309 ns, 0.014577 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OE : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TINVX1 : entity is TRUE;
end TINVX1;

architecture behavioral of TINVX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OE_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OE_ipd, OE, tipd_OE );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OE_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalINV(A_ipd);
          Y_zd := VitalBUFIF1(n0_var, OE_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( OE_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OE_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TLATSRX1 is
   generic (
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_G : VitalDelayType := DefDummyIsd;
             tipd_G : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_G : VitalDelayType := DefDummyIcd;
             tipd_RN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_RN_G : VitalDelayType := DefDummyIsd;
             tipd_SN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_SN_G : VitalDelayType := DefDummyIsd;
             trecovery_SN_G_posedge_negedge : VitalDelayType := 0.1875 ns;
             tremoval_SN_G_posedge_negedge : VitalDelayType := -0.125 ns;
             trecovery_RN_SN_posedge_posedge : VitalDelayType := 0.1875 ns;
             trecovery_RN_G_posedge_negedge : VitalDelayType := 0.125 ns;
             tremoval_RN_G_posedge_negedge : VitalDelayType := 0 ns;
             tsetup_D_G_posedge_negedge : VitalDelayType := 0.125 ns;
             tsetup_D_G_negedge_negedge : VitalDelayType := 0.1875 ns;
             thold_D_G_posedge_negedge : VitalDelayType := 0 ns;
             thold_D_G_negedge_negedge : VitalDelayType := -0.0624998 ns;
             tpw_G_posedge : VitalDelayType := 0.174032 ns;
             tpw_RN_negedge : VitalDelayType := 0.125959 ns;
             tpw_SN_negedge : VitalDelayType := 0.197236 ns;
             tremoval_RN_SN_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tpd_D_Q : VitalDelayType01 := (0.134616 ns, 0.162866 ns);
             tpd_D_QN : VitalDelayType01 := (0.205307 ns, 0.196799 ns);
             tpd_G_Q_posedge : VitalDelayType01 := (0.177964 ns, 0.141834 ns);
             tpd_G_QN_posedge : VitalDelayType01 := (0.185136 ns, 0.241183 ns);
             tpd_RN_Q_negedge : VitalDelayType01 := (0 ns, 0.121645 ns);
             tpd_RN_Q_posedge : VitalDelayType01 := (0.133264 ns, 0 ns);
             tpd_RN_QN_negedge : VitalDelayType01 := (0.166751 ns, 0 ns);
             tpd_RN_QN_posedge : VitalDelayType01 := (0 ns, 0.19587 ns);
             tpd_SN_Q_negedge : VitalDelayType01 := (0.187938 ns, 0 ns);
             tpd_SN_Q_posedge : VitalDelayType01 := (0 ns, 0.154878 ns);
             tpd_SN_QN_negedge : VitalDelayType01 := (0 ns, 0.244602 ns);
             tpd_SN_QN_posedge : VitalDelayType01 := (0.198221 ns, 0 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         D : in std_ulogic := 'U' ;
         G : in std_ulogic := 'U' ;
         RN : in std_ulogic := 'U' ;
         SN : in std_ulogic := 'U' ;
         Q : out std_ulogic ;
         QN : out std_ulogic);

   attribute VITAL_LEVEL0 of TLATSRX1 : entity is TRUE;
end TLATSRX1;

architecture behavioral of TLATSRX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';
   SIGNAL G_dly : std_ulogic := 'X';
   SIGNAL G_ipd : std_ulogic := 'X';
   SIGNAL RN_dly : std_ulogic := 'X';
   SIGNAL RN_ipd : std_ulogic := 'X';
   SIGNAL SN_dly : std_ulogic := 'X';
   SIGNAL SN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( D_ipd, D, tipd_D );
   VitalWireDelay( G_ipd, G, tipd_G );
   VitalWireDelay( RN_ipd, RN, tipd_RN );
   VitalWireDelay( SN_ipd, SN, tipd_SN );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( D_dly, D_ipd, tisd_D_G );
   VitalSignalDelay( G_dly, G_ipd, ticd_G );
   VitalSignalDelay( RN_dly, RN_ipd, tisd_RN_G );
   VitalSignalDelay( SN_dly, SN_ipd, tisd_SN_G );
END BLOCK;

VITALBehavior : PROCESS (D_dly, G_dly, RN_dly, SN_dly)

      --timing checks section variables
      VARIABLE Tviol_rec_G_SN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_G_SN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_G_RN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_G_RN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_SN_RN_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_SN_RN_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_D_G : std_ulogic := '0';
      VARIABLE TimeMarker_D_G : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_G_posedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_G_posedge : VitalPeriodDataType;
      VARIABLE PWviol_SN_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_SN_negedge : VitalPeriodDataType;
      VARIABLE PWviol_RN_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_RN_negedge : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE n0_CLEAR : std_ulogic;
      VARIABLE n0_SET : std_ulogic;
      VARIABLE P0001 : std_ulogic;
      VARIABLE P0000 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_tlat_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE QN_zd : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE D_EQ_0_AN_RN_EQ_1 : std_ulogic;
      VARIABLE D_EQ_1_AN_SN_EQ_1 : std_ulogic;
      VARIABLE RN_EQ_1_AN_SN_EQ_1 : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;
      VARIABLE QN_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalRecoveryRemovalCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    RefSignal      => G_dly,
                    RefSignalName  => "G",
                    Recovery       => trecovery_SN_G_posedge_negedge,
                    Removal        => tremoval_SN_G_posedge_negedge,
                    CheckEnabled   => To_X01(D_EQ_0_AN_RN_EQ_1) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    TimingData     => TimeMarker_rec_G_SN_posedge,
                    Violation      => Tviol_rec_G_SN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    RefSignal      => G_dly,
                    RefSignalName  => "G",
                    Recovery       => trecovery_RN_G_posedge_negedge,
                    Removal        => tremoval_RN_G_posedge_negedge,
                    CheckEnabled   => To_X01(D_EQ_1_AN_SN_EQ_1) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    TimingData     => TimeMarker_rec_G_RN_posedge,
                    Violation      => Tviol_rec_G_RN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    RefSignal      => SN_dly,
                    RefSignalName  => "SN",
                    Recovery       => trecovery_RN_SN_posedge_posedge,
                    Removal        => tremoval_RN_SN_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    TimingData     => TimeMarker_rec_SN_RN_posedge,
                    Violation      => Tviol_rec_SN_RN_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => G_dly,
                    RefSignalName  => "G",
                    SetupHigh      => tsetup_D_G_posedge_negedge,
                    SetupLow       => tsetup_D_G_negedge_negedge,
                    HoldHigh       => thold_D_G_negedge_negedge,
                    HoldLow        => thold_D_G_posedge_negedge,
                    CheckEnabled   => To_X01(RN_EQ_1_AN_SN_EQ_1) /= '0',
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    TimingData     => TimeMarker_D_G,
                    Violation      => Tviol_D_G,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => G_dly,
                    TestSignalName => "G",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_G_posedge,
                    PulseWidthLow  => 0 ns,
                    PeriodData     => PeriodCheckInfo_G_posedge,
                    Violation      => PWviol_G_posedge,
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => SN_dly,
                    TestSignalName => "SN",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_SN_negedge,
                    PeriodData     => PeriodCheckInfo_SN_negedge,
                    Violation      => PWviol_SN_negedge,
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => RN_dly,
                    TestSignalName => "RN",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_RN_negedge,
                    PeriodData     => PeriodCheckInfo_RN_negedge,
                    Violation      => PWviol_RN_negedge,
                    HeaderMsg      => InstancePath & "/TLATSRX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_rec_G_SN_posedge OR
                        Tviol_rec_G_RN_posedge OR
                        Tviol_rec_SN_RN_posedge OR
                        Tviol_D_G OR
                        PWviol_G_posedge OR
                        PWviol_SN_negedge OR
                        PWviol_RN_negedge );

          n0_CLEAR := VitalINV(RN_dly);

          n0_SET := VitalINV(SN_dly);

          VitalStateTable ( StateTable => udp_tlat,
                                DataIn => (NOTIFIER, D_dly, G_dly, n0_CLEAR, n0_SET),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_tlat_n0 );

          P0001 := n0_vec(1);

          P0000 := VitalINV(P0001);

          Q_zd := VitalINV(P0000);

          QN_zd := VitalBUF(P0000);

          n1_var := VitalINV(D_dly);
          D_EQ_0_AN_RN_EQ_1 := VitalAND2(n1_var, RN_dly);

          D_EQ_1_AN_SN_EQ_1 := VitalAND2(D_dly, SN_dly);

          RN_EQ_1_AN_SN_EQ_1 := VitalAND2(RN_dly, SN_dly);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( D_dly'LAST_EVENT,
                             tpd_D_Q,
                             TRUE),
                      1 => ( G_dly'LAST_EVENT,
                             tpd_G_Q_posedge,
                             To_X01(G_dly) /= '0'),
                      2 => ( RN_dly'LAST_EVENT,
                             tpd_RN_Q_negedge,
                             To_X01(RN_dly) /= '1'),
                      3 => ( RN_dly'LAST_EVENT,
                             tpd_RN_Q_posedge,
                             To_X01(RN_dly) /= '0'),
                      4 => ( SN_dly'LAST_EVENT,
                             tpd_SN_Q_negedge,
                             To_X01(SN_dly) /= '1'),
                      5 => ( SN_dly'LAST_EVENT,
                             tpd_SN_Q_posedge,
                             To_X01(SN_dly) /= '0')),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => QN,
               OutSignalName => "QN",
               OutTemp => QN_zd,
               Paths => (
                      0 => ( D_dly'LAST_EVENT,
                             tpd_D_QN,
                             TRUE),
                      1 => ( G_dly'LAST_EVENT,
                             tpd_G_QN_posedge,
                             To_X01(G_dly) /= '0'),
                      2 => ( RN_dly'LAST_EVENT,
                             tpd_RN_QN_negedge,
                             To_X01(RN_dly) /= '1'),
                      3 => ( RN_dly'LAST_EVENT,
                             tpd_RN_QN_posedge,
                             To_X01(RN_dly) /= '0'),
                      4 => ( SN_dly'LAST_EVENT,
                             tpd_SN_QN_negedge,
                             To_X01(SN_dly) /= '1'),
                      5 => ( SN_dly'LAST_EVENT,
                             tpd_SN_QN_posedge,
                             To_X01(SN_dly) /= '0')),
               GlitchData => QN_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TLATX1 is
   generic (
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_C : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_C : VitalDelayType := DefDummyIsd;
             tsetup_D_C_posedge_negedge : VitalDelayType := 0.0624998 ns;
             tsetup_D_C_negedge_negedge : VitalDelayType := 0.125 ns;
             thold_D_C_posedge_negedge : VitalDelayType := 0 ns;
             thold_D_C_negedge_negedge : VitalDelayType := -0.0624998 ns;
             tpw_C_posedge : VitalDelayType := 0.124268 ns;
             tpd_C_Q_posedge : VitalDelayType01 := (0.126955 ns, 0.119178 ns);
             tpd_C_QN_posedge : VitalDelayType01 := (0.157908 ns, 0.1607 ns);
             tpd_D_Q : VitalDelayType01 := (0.0872345 ns, 0.114907 ns);
             tpd_D_QN : VitalDelayType01 := (0.153377 ns, 0.120409 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic ;
         QN : out std_ulogic);

   attribute VITAL_LEVEL0 of TLATX1 : entity is TRUE;
end TLATX1;

architecture behavioral of TLATX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL C_dly : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( C_dly, C_ipd, ticd_C );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_C );
END BLOCK;

VITALBehavior : PROCESS (C_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_C : std_ulogic := '0';
      VARIABLE TimeMarker_D_C : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_C_posedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_C_posedge : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE P0000 : std_ulogic;
      VARIABLE NET166 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_tlat_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE QN_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;
      VARIABLE QN_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => C_dly,
                    RefSignalName  => "C",
                    SetupHigh      => tsetup_D_C_posedge_negedge,
                    SetupLow       => tsetup_D_C_negedge_negedge,
                    HoldHigh       => thold_D_C_negedge_negedge,
                    HoldLow        => thold_D_C_posedge_negedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/TLATX1",
                    TimingData     => TimeMarker_D_C,
                    Violation      => Tviol_D_C,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => C_dly,
                    TestSignalName => "C",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_C_posedge,
                    PulseWidthLow  => 0 ns,
                    PeriodData     => PeriodCheckInfo_C_posedge,
                    Violation      => PWviol_C_posedge,
                    HeaderMsg      => InstancePath & "/TLATX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_C OR
                        PWviol_C_posedge );

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_tlat,
                                DataIn => (NOTIFIER, D_dly, C_dly, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_tlat_n0 );

          P0000 := n0_vec(1);

          NET166 := VitalINV(P0000);

          Q_zd := VitalBUF(P0000);

          QN_zd := VitalINV(P0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( C_dly'LAST_EVENT,
                             tpd_C_Q_posedge,
                             To_X01(C_dly) /= '0'),
                      1 => ( D_dly'LAST_EVENT,
                             tpd_D_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => QN,
               OutSignalName => "QN",
               OutTemp => QN_zd,
               Paths => (
                      0 => ( C_dly'LAST_EVENT,
                             tpd_C_QN_posedge,
                             To_X01(C_dly) /= '0'),
                      1 => ( D_dly'LAST_EVENT,
                             tpd_D_QN,
                             TRUE)),
               GlitchData => QN_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity XOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0598908 ns, 0.0717833 ns);
             tpd_B_Y : VitalDelayType01 := (0.0528908 ns, 0.0674712 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of XOR2X1 : entity is TRUE;
end XOR2X1;

architecture behavioral of XOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalXOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


