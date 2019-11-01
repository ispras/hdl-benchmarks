-- Copyright (C) 1988-2004 Altera Corporation
-- Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
-- support information,  device programming or simulation file,  and any other
-- associated  documentation or information  provided by  Altera  or a partner
-- under  Altera's   Megafunction   Partnership   Program  may  be  used  only
-- to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
-- other  use  of such  megafunction  design,  netlist,  support  information,
-- device programming or simulation file,  or any other  related documentation
-- or information  is prohibited  for  any  other purpose,  including, but not
-- limited to  modification,  reverse engineering,  de-compiling, or use  with
-- any other  silicon devices,  unless such use is  explicitly  licensed under
-- a separate agreement with  Altera  or a megafunction partner.  Title to the
-- intellectual property,  including patents,  copyrights,  trademarks,  trade
-- secrets,  or maskworks,  embodied in any such megafunction design, netlist,
-- support  information,  device programming or simulation file,  or any other
-- related documentation or information provided by  Altera  or a megafunction
-- partner, remains with Altera, the megafunction partner, or their respective
-- licensors. No other licenses, including any licenses needed under any third
-- party's intellectual property, are provided herein.


-- Quartus II 4.0 Build 214 1/28/2004

---START_PACKAGE_HEADER-----------------------------------------------------
--
-- Package Name    :  ALTERA_DEVICE_FAMILIES
--
-- Description     :  Common Altera device families comparison
--
---END_PACKAGE_HEADER--------------------------------------------------------

-- BEGINING OF PRIMITIVES

Library ieee;
use ieee.std_logic_1164.all;
entity LCELL is
   port(
      a_in                           :  in    std_logic;
      a_out                          :  out   std_logic);
end LCELL;
architecture BEHAVIOR of LCELL is
begin
        a_out <= a_in;
end BEHAVIOR;

Library ieee;
use ieee.std_logic_1164.all;
entity GLOBAL is
   port(
      a_in                           :  in    std_logic;
      a_out                          :  out   std_logic);
end GLOBAL;
architecture BEHAVIOR of GLOBAL is
begin
        a_out <= a_in;
end BEHAVIOR;

Library ieee;
use ieee.std_logic_1164.all;
entity CARRY is
   port(
      a_in                           :  in    std_logic;
      a_out                          :  out   std_logic);
end CARRY;
architecture BEHAVIOR of CARRY is
begin
        a_out <= a_in;
end BEHAVIOR;

Library ieee;
use ieee.std_logic_1164.all;
entity CASCADE is
   port(
      a_in                           :  in    std_logic;
      a_out                          :  out   std_logic);
end CASCADE;
architecture BEHAVIOR of CASCADE is
begin
        a_out <= a_in;
end BEHAVIOR;

Library ieee;
use ieee.std_logic_1164.all;
entity CARRY_SUM is
   port(
      sin                           :  in    std_logic;
      cin                           :  in    std_logic;
      sout                          :  out   std_logic;
      cout                          :  out   std_logic);
end CARRY_SUM;
architecture BEHAVIOR of CARRY_SUM is
begin
        sout <= sin;
        cout <= cin;
end BEHAVIOR;

Library ieee;
use ieee.std_logic_1164.all;
entity EXP is
   port(
      a_in                           :  in    std_logic;
      a_out                          :  out   std_logic);
end EXP;
architecture BEHAVIOR of EXP is
begin
        a_out <= not a_in;
end BEHAVIOR;

-- BEGINING OF PACKAGES
Library ieee;
use ieee.std_logic_1164.all;

-- PACKAGE DECLARATION
package ALTERA_DEVICE_FAMILIES is
-- FUNCTION DECLARATION
    function IS_VALID_FAMILY (device: in string) return boolean;
    function IS_FAMILY_APEX20K (device : in string) return boolean;
    function IS_FAMILY_APEX20KE (device : in string) return boolean;
    function IS_FAMILY_APEXII (device : in string) return boolean;
    function IS_FAMILY_ACEX2K (device : in string) return boolean;
    function IS_FAMILY_STRATIXGX (device : in string) return boolean;
    function IS_FAMILY_STRATIX (device : in string) return boolean;
    function IS_FAMILY_STRATIXHC (device : in string) return boolean;
    function IS_FAMILY_MERCURY (device : in string) return boolean;
    function IS_FAMILY_FLEX10KE (device : in string) return boolean;
    function IS_FAMILY_FLEX10K (device : in string) return boolean;
    function IS_FAMILY_FLEX10KA (device : in string) return boolean;
    function IS_FAMILY_FLEX6000 (device : in string) return boolean;
    function IS_FAMILY_MAX7000B (device : in string) return boolean;
    function IS_FAMILY_MAX7000AE (device : in string) return boolean;
    function IS_FAMILY_MAX3000A (device : in string) return boolean;
    function IS_FAMILY_MAX7000S (device : in string) return boolean;
    function IS_FAMILY_MAX7000A (device : in string) return boolean;
    function IS_FAMILY_STRATIXII (device : in string) return boolean;
    function IS_FAMILY_MAXII (device : in string) return boolean;
end ALTERA_DEVICE_FAMILIES;

package body ALTERA_DEVICE_FAMILIES is
function IS_VALID_FAMILY (device : in string) return boolean is
variable is_valid : boolean := false;
begin
    if (IS_FAMILY_APEX20K(device) or IS_FAMILY_APEX20KE(device) or IS_FAMILY_APEXII(
    device) or IS_FAMILY_ACEX2K(device) or IS_FAMILY_STRATIXGX(device) or
    IS_FAMILY_STRATIX(device) or IS_FAMILY_MERCURY(device) or
    IS_FAMILY_FLEX10KE(device) or IS_FAMILY_FLEX10K(device) or
    IS_FAMILY_FLEX10KA(device) or IS_FAMILY_FLEX6000(device) or
    IS_FAMILY_MAX7000B(device) or IS_FAMILY_MAX7000AE(device) or
    IS_FAMILY_MAX3000A(device) or IS_FAMILY_MAX7000S(device) or
    IS_FAMILY_MAX7000A(device) or IS_FAMILY_STRATIXII(device) or
    IS_FAMILY_STRATIXHC(device) or IS_FAMILY_MAXII(device))
    then
        is_valid := true;
    end if;
    return is_valid;
end IS_VALID_FAMILY;

function IS_FAMILY_APEX20K (device : in string) return boolean is
variable is_20k : boolean := false;
begin
    if (device = "APEX20K")
    then
        is_20k := true;
    end if;
    return is_20k;
end IS_FAMILY_APEX20K;

function IS_FAMILY_APEX20KE (device : in string) return boolean is
variable is_20ke : boolean := false;
begin
    if ((device = "APEX20KE") or (device = "APEX20KC") or (device = "EXCALIBUR_ARM") or
    (device = "EXCALIBUR_MIPS"))
    then
        is_20ke := true;
    end if;
    return is_20ke;
end IS_FAMILY_APEX20KE;

function IS_FAMILY_APEXII (device : in string) return boolean is
variable is_apexii : boolean := false;
begin
    if ((device = "APEX II") or (device = "APEXII"))
    then
        is_apexii := true;
    end if;
    return is_apexii;
end IS_FAMILY_APEXII;

function IS_FAMILY_ACEX2K (device : in string) return boolean is
variable is_acex2k : boolean := false;
begin
    if ((device = "CYCLONE") or (device = "Cyclone"))
    then
        is_acex2k := true;
    end if;
    return is_acex2k;
end IS_FAMILY_ACEX2K;

function IS_FAMILY_STRATIXGX (device : in string) return boolean is
variable is_stratixgx : boolean := false;
begin
    if ((device = "STRATIX-GX") or (device = "STRATIX GX") or (device = "Stratix GX"))
    then
        is_stratixgx := true;
    end if;
    return is_stratixgx;
end IS_FAMILY_STRATIXGX;

function IS_FAMILY_STRATIX (device : in string) return boolean is
variable is_stratix : boolean := false;
begin
    if ((device = "STRATIX") or (device = "Stratix"))
    then
        is_stratix := true;
    end if;
    return is_stratix;
end IS_FAMILY_STRATIX;

function IS_FAMILY_STRATIXHC (device : in string) return boolean is
variable is_stratixhc : boolean := false;
begin

    if ((device = "STRATIXHC")  or (device = "StratixHC") or
        (device = "STRATIX HC") or (device = "Stratix HC") or
        (device = "HardCopy Stratix") or (device = "HARDCOPY STRATIX"))
    then
        is_stratixhc := true;
    end if;
    return is_stratixhc;
end IS_FAMILY_STRATIXHC;

function IS_FAMILY_MERCURY (device : in string) return boolean is
variable is_mercury : boolean := false;
begin
    if ((device = "MERCURY") or (device = "Mercury"))
    then
        is_mercury := true;
    end if;
    return is_mercury;
end IS_FAMILY_MERCURY;

function IS_FAMILY_FLEX10KE (device : in string) return boolean is
variable is_flex10ke : boolean := false;
begin
    if ((device = "FLEX10KE") or (device = "FLEX 10KE") or
        (device = "ACEX1K") or (device = "ACEX 1K"))
    then
        is_flex10ke := true;
    end if;
    return is_flex10ke;
end IS_FAMILY_FLEX10KE;

function IS_FAMILY_FLEX10K (device : in string) return boolean is
variable is_flex10k : boolean := false;
begin
    if ((device = "FLEX10K") or (device = "flex10k") or (device = "FLEX 10K") or (device = "flex 10k"))
    then
        is_flex10k := true;
    end if;
    return is_flex10k;
end IS_FAMILY_FLEX10K;

function IS_FAMILY_FLEX10KA (device : in string) return boolean is
variable is_flex10ka : boolean := false;
begin
    if ((device = "FLEX10KA") or (device = "flex10ka") or (device = "FLEX 10KA") or (device = "flex 10ka"))
    then
        is_flex10ka := true;
    end if;
    return is_flex10ka;
end IS_FAMILY_FLEX10KA;

function IS_FAMILY_FLEX6000 (device : in string) return boolean is
variable is_flex6000 : boolean := false;
begin
    if ((device = "FLEX6000") or (device = "flex6000") or (device = "FLEX 6000") or (device = "flex 6000") or (device = "FLEX6K") or (device = "flex6k"))
    then
        is_flex6000 := true;
    end if;
    return is_flex6000;
end IS_FAMILY_FLEX6000;

function IS_FAMILY_MAX7000B (device : in string) return boolean is
variable is_max7000b : boolean := false;
begin
    if ((device = "MAX7000B") or (device = "max7000b") or (device = "MAX 7000B") or (device = "max 7000b"))
    then
        is_max7000b := true;
    end if;
    return is_max7000b;
end IS_FAMILY_MAX7000B;

function IS_FAMILY_MAX7000AE (device : in string) return boolean is
variable is_max7000ae : boolean := false;
begin
    if ((device = "MAX7000AE") or (device = "max7000ae") or (device = "MAX 7000AE") or (device = "max 7000ae"))
    then
        is_max7000ae := true;
    end if;
    return is_max7000ae;
end IS_FAMILY_MAX7000AE;

function IS_FAMILY_MAX3000A (device : in string) return boolean is
variable is_max3000a : boolean := false;
begin
    if ((device = "MAX3000A") or (device = "max3000a") or (device = "MAX 3000A") or (device = "max 3000a"))
    then
        is_max3000a := true;
    end if;
    return is_max3000a;
end IS_FAMILY_MAX3000A;

function IS_FAMILY_MAX7000S (device : in string) return boolean is
variable is_max7000s : boolean := false;
begin
    if ((device = "MAX7000S") or (device = "max7000s") or (device = "MAX 7000S") or (device = "max 7000s"))
    then
        is_max7000s := true;
    end if;
    return is_max7000s;
end IS_FAMILY_MAX7000S;

function IS_FAMILY_MAX7000A (device : in string) return boolean is
variable is_max7000a : boolean := false;
begin
    if ((device = "MAX7000A") or (device = "max7000a") or (device = "MAX 7000A") or (device = "max 7000a"))
    then
        is_max7000a := true;
    end if;
    return is_max7000a;
end IS_FAMILY_MAX7000A;

function IS_FAMILY_STRATIXII (device : in string) return boolean is
variable is_stratixii : boolean := false;
begin
    if ((device = "Stratix II") or (device = "StratixII"))
    then
        is_stratixii := true;
    end if;
    return is_stratixii;
end IS_FAMILY_STRATIXII;

function IS_FAMILY_MAXII (device : in string) return boolean is
variable is_maxii : boolean := false;
begin
    if ((device = "MAX II") or (device = "max ii") or
        (device = "MAXII") or (device = "maxii"))
    then
        is_maxii := true;
    end if;
    return is_maxii;
end IS_FAMILY_MAXII;

end ALTERA_DEVICE_FAMILIES;
-- END OF PACKAGE

---START_PACKAGE_HEADER-----------------------------------------------------
--
-- Package Name    :  ALTERA_COMMON_CONVERSION
--
-- Description     :  Common conversion functions
--
---END_PACKAGE_HEADER--------------------------------------------------------

-- BEGINING OF PACKAGE
Library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

-- PACKAGE DECLARATION
package ALTERA_COMMON_CONVERSION is
-- FUNCTION DECLARATION
    function INT_TO_STR_RAM (value : in integer) return string;
    function INT_TO_STR_ARITH (value : in integer) return string;
    function HEX_STR_TO_INT (str : in string) return integer;
    procedure SHRINK_LINE (str_line : inout line; pos : in integer);
end ALTERA_COMMON_CONVERSION;

package body ALTERA_COMMON_CONVERSION is
-- This function converts an integer to a string
function INT_TO_STR_RAM (value : in integer) return string is
variable ivalue : integer := 0;
variable index  : integer := 0;
variable digit : integer := 0;
variable line_no: string(8 downto 1) := "        ";
begin
    ivalue := value;
    index := 1;

    while (ivalue > 0) loop
        digit := ivalue MOD 10;
        ivalue := ivalue/10;
        case digit is
            when 0 => line_no(index) := '0';
            when 1 => line_no(index) := '1';
            when 2 => line_no(index) := '2';
            when 3 => line_no(index) := '3';
            when 4 => line_no(index) := '4';
            when 5 => line_no(index) := '5';
            when 6 => line_no(index) := '6';
            when 7 => line_no(index) := '7';
            when 8 => line_no(index) := '8';
            when 9 => line_no(index) := '9';
            when others =>
                ASSERT FALSE
                REPORT "Illegal number!"
                SEVERITY ERROR;
        end case;
        index := index + 1;
    end loop;

    return line_no;
end INT_TO_STR_RAM;

function INT_TO_STR_ARITH (value : in integer) return string is
    variable ivalue : integer := 0;
    variable index : integer := 0;
    variable digit : integer := 0;
    variable temp: string(10 downto 1) := "0000000000";
begin
    ivalue := value;
    index := 1;

    while (ivalue > 0) loop
        digit := ivalue mod 10;
        ivalue := ivalue/10;

        case digit is
            when 0 => temp(index) := '0';
            when 1 => temp(index) := '1';
            when 2 => temp(index) := '2';
            when 3 => temp(index) := '3';
            when 4 => temp(index) := '4';
            when 5 => temp(index) := '5';
            when 6 => temp(index) := '6';
            when 7 => temp(index) := '7';
            when 8 => temp(index) := '8';
            when 9 => temp(index) := '9';
            when others =>
                ASSERT FALSE
                REPORT "Illegal number!"
                SEVERITY ERROR;
        end case;
        index := index + 1;
    end loop;

    if value < 0 then
        return '-'& temp(index downto 1);
    else
        return temp(index downto 1);
    end if;
end INT_TO_STR_ARITH;

-- This function converts a hexadecimal number to an integer
function HEX_STR_TO_INT (str : in string) return integer is
variable len : integer := str'length;
variable ivalue : integer := 0;
variable digit : integer := 0;
begin
    for i in len downto 1 loop
        case str(i) is
            when '0' => digit := 0;
            when '1' => digit := 1;
            when '2' => digit := 2;
            when '3' => digit := 3;
            when '4' => digit := 4;
            when '5' => digit := 5;
            when '6' => digit := 6;
            when '7' => digit := 7;
            when '8' => digit := 8;
            when '9' => digit := 9;
            when 'A' => digit := 10;
            when 'a' => digit := 10;
            when 'B' => digit := 11;
            when 'b' => digit := 11;
            when 'C' => digit := 12;
            when 'c' => digit := 12;
            when 'D' => digit := 13;
            when 'd' => digit := 13;
            when 'E' => digit := 14;
            when 'e' => digit := 14;
            when 'F' => digit := 15;
            when 'f' => digit := 15;
            when others =>
                ASSERT FALSE
                REPORT "Illegal character "&  str(i) & "in Intel Hex File! "
                SEVERITY ERROR;
        end case;
        ivalue := ivalue * 16 + digit;
    end loop;
    return ivalue;
end HEX_STR_TO_INT;

-- This procedure "cuts" the str_line into desired length
procedure SHRINK_LINE (str_line : inout line; pos : in integer) is
subtype nstring is string(1 to pos);
variable str : nstring;
begin
    if (pos >= 1) then
        read(str_line, str);
    end if;
end;
end ALTERA_COMMON_CONVERSION;
-- END OF PACKAGE

Library ieee;
use ieee.std_logic_1164.all;

-- START PACKAGE HEADER --------------------------------------------------------
--
-- Package Name : pllpack
--
-- Description  : Used by altpll model to calculate required advanced parameters
--                for PLL simulation. Also has functions to do string->integer,
--                integer->string conversions.
--
-- END PACKAGE HEADER ----------------------------------------------------------

-- PACKAGE DECLARATION
package pllpack is

-- FUNCTION DECLARATION
    function alt_conv_integer(arg : in std_logic_vector)
             return integer;

    function gcd (X: integer; Y: integer)
             return integer;

    function lcm (A1: integer; A2: integer; A3: integer; A4: integer;
                  A5: integer; A6: integer; A7: integer;
                  A8: integer; A9: integer; A10: integer; P: integer)
             return integer;

    function output_counter_value (clk_divide: integer; clk_mult : integer;
                                   M: integer; N: integer )
             return integer;

    function counter_mode (duty_cycle: integer; output_counter_value: integer)
             return string;

    function counter_high (output_counter_value: integer := 1; duty_cycle: integer)
             return integer;

    function counter_low (output_counter_value: integer; duty_cycle: integer)
             return integer;

    function mintimedelay (t1: integer; t2: integer; t3: integer; t4: integer;
                           t5: integer; t6: integer; t7: integer; t8: integer;
                           t9: integer; t10: integer)
             return integer;

    function maxnegabs (t1: integer; t2: integer; t3: integer; t4: integer;
                        t5: integer; t6: integer; t7: integer; t8: integer;
                        t9: integer; t10: integer)
             return integer;

    function counter_time_delay (clk_time_delay: integer;
                                 m_time_delay: integer; n_time_delay: integer)
             return integer;

    function get_phase_degree (phase_shift: integer; clk_period: integer)
             return integer;

    function counter_initial (tap_phase: integer; m: integer; n: integer)
             return integer;

    function counter_ph (tap_phase: integer; m : integer; n: integer)
             return integer;

    function ph_adjust (tap_phase: integer; ph_base : integer)
             return integer;

    function translate_string (mode : string)
             return string;

    function str2int (s : string)
             return integer;

    function int2str (value : integer)
             return string;

end pllpack;

-- BEGINNING OF PACKAGE
package body pllpack is

-- convert std_logic_vector to integer
function alt_conv_integer(arg : in std_logic_vector) return integer is
variable result : integer := 0;
begin
    result := 0;
    for i in arg'range loop
        if arg(i) = '1' then
            result := result + 2**i;
        end if;
    end loop;
    return result;
end alt_conv_integer;

-- find the greatest common denominator of X and Y
function gcd (X: integer; Y: integer) return integer is
variable L, S, R, G : integer := 1;
begin
    if (X < Y) then -- find which is smaller.
        S := X;
        L := Y;
    else
        S := Y;
        L := X;
    end if;

    R := S;
    while ( R > 1) loop
        S := L;
        L := R;
        R := S rem L; -- divide bigger number by smaller.
                      -- remainder becomes smaller number.
    end loop;
    if (R = 0) then  -- if evenly divisible then L is gcd else it is 1.
        G := L;
    else
        G := R;
    end if;

    return G;
end gcd;

-- find the least common multiple of A1 to A10
function lcm (A1: integer; A2: integer; A3: integer; A4: integer;
              A5: integer; A6: integer; A7: integer;
              A8: integer; A9: integer; A10: integer; P: integer)
         return integer is
variable M1, M2, M3, M4, M5 , M6, M7, M8, M9, R: integer := 1;
begin
    M1 := (A1 * A2)/gcd(A1, A2);
    M2 := (M1 * A3)/gcd(M1, A3);
    M3 := (M2 * A4)/gcd(M2, A4);
    M4 := (M3 * A5)/gcd(M3, A5);
    M5 := (M4 * A6)/gcd(M4, A6);
    M6 := (M5 * A7)/gcd(M5, A7);
    M7 := (M6 * A8)/gcd(M6, A8);
    M8 := (M7 * A9)/gcd(M7, A9);
    M9 := (M8 * A10)/gcd(M8, A10);
    if (M9 < 3) then
        R := 10;
    elsif ((M9 < 10) and (M9 >= 3)) then
        R := 4 * M9;
    else
        R := M9 ;
    end if;

    return R;
end lcm;

-- find the factor of division of the output clock frequency compared to the VCO
function output_counter_value (clk_divide: integer; clk_mult: integer ;
                               M: integer; N: integer ) return integer is
variable R: integer := 1;
begin
    R := (clk_divide * M)/(clk_mult * N);

    return R;
end output_counter_value;

-- find the mode of each PLL counter - bypass, even or odd
function counter_mode (duty_cycle: integer; output_counter_value: integer)
         return string is
variable R: string (1 to 6) := "      ";
variable counter_value: integer := 1;
begin
    counter_value := (2*duty_cycle*output_counter_value)/100;
    if output_counter_value = 1 then
        R := "bypass";
    elsif (counter_value REM 2) = 0 then
        R := "  even";
    else
        R := "   odd";
    end if;

    return R;
end counter_mode;

-- find the number of VCO clock cycles to hold the output clock high
function counter_high (output_counter_value: integer := 1; duty_cycle: integer)
         return integer is
variable R: integer := 1;
variable half_cycle_high : integer := 1;
begin
    half_cycle_high := (duty_cycle * output_counter_value *2)/100 ;
    if (half_cycle_high REM 2 = 0) then
        R := half_cycle_high/2 ;
    else
        R := (half_cycle_high/2) + 1;
    end if;

    return R;
end;

-- find the number of VCO clock cycles to hold the output clock low
function counter_low (output_counter_value: integer; duty_cycle: integer)
         return integer is
variable R, R1: integer := 1;
variable half_cycle_high : integer := 1;
begin
    half_cycle_high := (duty_cycle * output_counter_value*2)/100 ;
    if (half_cycle_high REM 2 = 0) then
        R1 := half_cycle_high/2 ;
    else
        R1 := (half_cycle_high/2) + 1;
    end if;

    R := output_counter_value - R1;

    return R;
end;

-- find the smallest time delay amongst t1 to t10
function mintimedelay (t1: integer; t2: integer; t3: integer; t4: integer;
                       t5: integer; t6: integer; t7: integer; t8: integer;
                       t9: integer; t10: integer) return integer is
variable m1,m2,m3,m4,m5,m6,m7,m8,m9 : integer := 0;
begin
    if (t1 < t2) then m1 := t1; else m1 := t2; end if;
    if (m1 < t3) then m2 := m1; else m2 := t3; end if;
    if (m2 < t4) then m3 := m2; else m3 := t4; end if;
    if (m3 < t5) then m4 := m3; else m4 := t5; end if;
    if (m4 < t6) then m5 := m4; else m5 := t6; end if;
    if (m5 < t7) then m6 := m5; else m6 := t7; end if;
    if (m6 < t8) then m7 := m6; else m7 := t8; end if;
    if (m7 < t9) then m8 := m7; else m8 := t9; end if;
    if (m8 < t10) then m9 := m8; else m9 := t10; end if;
    if (m9 > 0) then return m9; else return 0; end if;
end;

-- find the numerically largest negative number, and return its absolute value
function maxnegabs (t1: integer; t2: integer; t3: integer; t4: integer;
                    t5: integer; t6: integer; t7: integer; t8: integer;
                    t9: integer; t10: integer) return integer is
variable m1,m2,m3,m4,m5,m6,m7,m8,m9 : integer := 0;
begin
    if (t1 < t2) then m1 := t1; else m1 := t2; end if;
    if (m1 < t3) then m2 := m1; else m2 := t3; end if;
    if (m2 < t4) then m3 := m2; else m3 := t4; end if;
    if (m3 < t5) then m4 := m3; else m4 := t5; end if;
    if (m4 < t6) then m5 := m4; else m5 := t6; end if;
    if (m5 < t7) then m6 := m5; else m6 := t7; end if;
    if (m6 < t8) then m7 := m6; else m7 := t8; end if;
    if (m7 < t9) then m8 := m7; else m8 := t9; end if;
    if (m8 < t10) then m9 := m8; else m9 := t10; end if;
    if (m9 < 0) then return (0 - m9); else return 0; end if;
end;

-- adjust the phase (tap_phase) with the largest negative number (ph_base)
function ph_adjust (tap_phase: integer; ph_base : integer) return integer is
begin
    return (tap_phase + ph_base);
end;

-- find the time delay for each PLL counter
function counter_time_delay (clk_time_delay: integer;
                             m_time_delay: integer; n_time_delay: integer)
         return integer is
variable R: integer := 0;
begin
    R := clk_time_delay + m_time_delay - n_time_delay;

    return R;
end;

-- calculate the given phase shift (in ps) in terms of degrees
function get_phase_degree (phase_shift: integer; clk_period: integer)
         return integer is
variable result: integer := 0;
begin
    result := ( phase_shift * 360 ) / clk_period;
    -- to round up the calculation result
    if (result > 0) then
        result := result + 1;
    elsif (result < 0) then
        result := result - 1;
    else
        result := 0;
    end if;

    return result;
end;

-- find the number of VCO clock cycles to wait initially before the first rising
-- edge of the output clock
function counter_initial (tap_phase: integer; m: integer; n: integer)
                         return integer is
variable R: integer;
variable R1: real;
begin
        R1 := (real(abs(tap_phase)) * real(m))/(360.0 * real(n)) + 0.5;
        -- Note NCSim VHDL had problem in rounding up for 0.5 - 0.99. 
        -- This checking will ensure that the rounding up is done.
        if (R1 >= 0.5) and (R1 <= 1.0) then
           R1 := 1.0;
        end if;

        R := integer(R1);

        return R;
end;

-- find which VCO phase tap (0 to 7) to align the rising edge of the output clock to
function counter_ph (tap_phase: integer; m: integer; n: integer) return integer is
variable R: integer := 0;
begin
    -- 0.5 is added for proper rounding of the tap_phase.
    R := (integer(real(tap_phase * m / n)+ 0.5) REM 360)/45;

    return R;
end;

-- convert given string to length 6 by padding with spaces
function translate_string (mode : string) return string is
variable new_mode : string (1 to 6) := "      ";
begin
    if (mode = "bypass") then
        new_mode := "bypass";
    elsif (mode = "even") then
        new_mode := "  even";
    elsif (mode = "odd") then
        new_mode := "   odd";
    end if;

    return new_mode;
end;

-- convert integer to string
function int2str( value : integer ) return string is
variable ivalue : integer := 0;
variable index : integer := 1;
variable digit : integer := 0;
variable temp: string(10 downto 1) := "0000000000";

begin
    ivalue := value;
    index := 1;

    while (ivalue > 0) loop
        digit := ivalue mod 10;
        ivalue := ivalue/10;

        case digit is
            when 0 =>    temp(index) := '0';
            when 1 =>    temp(index) := '1';
            when 2 =>    temp(index) := '2';
            when 3 =>    temp(index) := '3';
            when 4 =>    temp(index) := '4';
            when 5 =>    temp(index) := '5';
            when 6 =>    temp(index) := '6';
            when 7 =>    temp(index) := '7';
            when 8 =>    temp(index) := '8';
            when 9 =>    temp(index) := '9';
            when others => ASSERT FALSE
                           REPORT "Illegal number!"
                           SEVERITY ERROR;
        end case;

        index := index + 1;
    end loop;

    if (value < 0) then
        return ('-'& temp(index downto 1));
    else
        return temp(index downto 1);
    end if;

end int2str;

-- convert string to integer
function str2int (s : string) return integer is
variable len : integer := s'length;
variable newdigit : integer := 0;
variable sign : integer := 1;
variable digit : integer := 0;
begin
    for i in 1 to len loop
        case s(i) is
            when '-' =>
                if i = 1 then
                    sign := -1;
                else
                    ASSERT FALSE
                    REPORT "Illegal Character "&  s(i) & "i n string parameter! "
                    SEVERITY ERROR;
                end if;
             when '0' => digit := 0;
             when '1' => digit := 1;
             when '2' => digit := 2;
             when '3' => digit := 3;
             when '4' => digit := 4;
             when '5' => digit := 5;
             when '6' => digit := 6;
             when '7' => digit := 7;
             when '8' => digit := 8;
             when '9' => digit := 9;
             when others =>
                 ASSERT FALSE
                 REPORT "Illegal Character "&  s(i) & "in string parameter! "
                 SEVERITY ERROR;
        end case;
        newdigit := newdigit * 10 + digit;
    end loop;

    return (sign*newdigit);
end;

end pllpack;
-- END OF PACKAGE pllpack

library ieee;
use ieee.std_logic_1164.all;

-- DFFP
entity DFFP is
port(
    CLK : in std_logic;
    ENA : in std_logic := '1';
    D : in std_logic;
    CLRN : in std_logic := '1';
    PRN : in std_logic := '1';
    Q : out std_logic
);
end DFFP;
architecture behave of DFFP is
begin
process (CLK, PRN, CLRN)
    begin
        if (PRN = '0') then Q <= '1';
        elsif (CLRN = '0') then Q <= '0';
        elsif (CLK'event and (ENA = '1')) then Q <= D;
        end if;
    end process;
end behave;

--///////////////////////////////////////////////////////////////////////////
--
-- Entity Name : MF_mn_cntr
--
-- Description : Simulation model for the M and N counter. This is a
--               common model for the input counter and the loop feedback
--               counter of the Stratix PLL and Stratix II PLL.
--
--///////////////////////////////////////////////////////////////////////////
library ieee;
use IEEE.std_logic_1164.all;

entity MF_mn_cntr is
port (
    clk           : IN std_logic;
    reset         : IN std_logic := '0';
    cout          : OUT std_logic;
    initial_value : IN integer := 1;
    modulus       : IN integer := 1;
    time_delay    : IN integer := 0;
    ph            : IN integer := 0

);
end MF_mn_cntr;

architecture behave of MF_mn_cntr is
begin
    process (clk, reset)
    variable count : integer := 1;
    variable first_rising_edge : boolean := true;
    variable tmp_cout : std_logic;
    begin
        if (reset = '1') then
            count := 1;
            tmp_cout := '0';
            first_rising_edge := true;
        elsif (clk'event and clk = '1' and first_rising_edge) then
            first_rising_edge := false;
            tmp_cout := clk;
        elsif (not first_rising_edge) then
            if (count < modulus) then
                count := count + 1;
            else
                count := 1;
                tmp_cout := not tmp_cout;
            end if;
        end if;
        cout <= transport tmp_cout after time_delay * 1 ps;
    end process;
end behave;

--/////////////////////////////////////////////////////////////////////////////
--
-- Entity Name : stx_scale_cntr
--
-- Description : Simulation model for the output scale-down counters.
--               This is a common model for the L0, L1, G0, G1, G2, G3, E0,
--               E1, E2 and E3 output counters of the Stratix PLL.
--
--/////////////////////////////////////////////////////////////////////////////
library ieee;
use IEEE.std_logic_1164.all;

entity stx_scale_cntr is
port (
    clk            : IN std_logic;
    reset          : IN std_logic := '0';
    initial        : IN integer := 1;
    high           : IN integer := 1;
    low            : IN integer := 1;
    mode           : IN string := "bypass";
    time_delay     : IN integer := 0;
    ph_tap         : IN natural := 0;
    cout           : OUT std_logic
);
end stx_scale_cntr;

architecture behave of stx_scale_cntr is
begin
    process (clk, reset)
    variable tmp_cout : std_logic := '0';
    variable count : integer := 1;
    variable output_shift_count : integer := 0;
    variable first_rising_edge : boolean := false;
    variable high_reg : integer := 0;
    variable low_reg : integer := 0;
    variable init : boolean := true;
    begin
        if (reset = '1') then
            count := 1;
            output_shift_count := 0;
            tmp_cout := '0';
            first_rising_edge := false;
        elsif (clk'event) then
            if (init) then
                init := false;
                high_reg := high;
                low_reg := low;
            end if;
            if (mode = "   off") then
                tmp_cout := '0';
            elsif (mode = "bypass") then
                tmp_cout := clk;
            elsif (not first_rising_edge) then
                if (clk = '1') then
                    output_shift_count := output_shift_count + 1;
                    if (output_shift_count = initial) then
                        tmp_cout := clk;
                        first_rising_edge := true;
                    end if;
                end if;
            elsif (output_shift_count < initial) then
                if (clk = '1') then
                    output_shift_count := output_shift_count + 1;
                end if;
            else
                count := count + 1;
                if (mode = "  even" and (count = (high_reg*2) + 1)) then
                    tmp_cout := '0';
                    low_reg := low;
                elsif (mode = "   odd" and (count = high_reg*2)) then
                    tmp_cout := '0';
                    low_reg := low;
                elsif (count = (high_reg + low_reg)*2 + 1) then
                    tmp_cout := '1';
                    count := 1;  -- reset count
                    high_reg := high;
                end if;
            end if;
        end if;
        cout <= transport tmp_cout after time_delay * 1 ps;
    end process;

end behave;

--/////////////////////////////////////////////////////////////////////////////
--
-- Entity Name : arm_scale_cntr
--
-- Description : Simulation model for the output scale-down counters.
--               This is a common model for the C0, C1, C2, C3, C4 and C5
--               output counters of the Stratix II PLL.
--
--/////////////////////////////////////////////////////////////////////////////

library ieee;
use IEEE.std_logic_1164.all;

entity arm_scale_cntr is
    port ( clk            : IN std_logic;
           reset          : IN std_logic := '0';
           initial        : IN integer := 1;
           high           : IN integer := 1;
           low            : IN integer := 1;
           mode           : IN string := "bypass";
           ph_tap         : IN integer := 0;
           cout           : OUT std_logic
         );
end arm_scale_cntr;

architecture behave of arm_scale_cntr is
begin
    process (clk, reset)
    variable tmp_cout : std_logic := '0';
    variable count : integer := 1;
    variable output_shift_count : integer := 1;
    variable first_rising_edge : boolean := false;
    begin
        if (reset = '1') then
            count := 1;
            output_shift_count := 1;
            tmp_cout := '0';
            first_rising_edge := false;
        elsif (clk'event) then
            if (mode = "   off") then
                tmp_cout := '0';
            elsif (mode = "bypass") then
                tmp_cout := clk;
                first_rising_edge := true;
            elsif (not first_rising_edge) then
                if (clk = '1') then
                    if (output_shift_count = initial) then
                        tmp_cout := clk;
                        first_rising_edge := true;
                    else
                        output_shift_count := output_shift_count + 1;
                    end if;
                end if;
            elsif (output_shift_count < initial) then
                if (clk = '1') then
                    output_shift_count := output_shift_count + 1;
                end if;
            else
                count := count + 1;
                if (mode = "  even" and (count = (high*2) + 1)) then
                    tmp_cout := '0';
                elsif (mode = "   odd" and (count = high*2)) then
                    tmp_cout := '0';
                elsif (count = (high + low)*2 + 1) then
                    tmp_cout := '1';
                    count := 1;  -- reset count
                end if;
            end if;
        end if;
        cout <= transport tmp_cout;
    end process;

end behave;

--/////////////////////////////////////////////////////////////////////////////
--
-- Entity Name : MF_pll_reg
--
-- Description : Simulation model for a simple DFF.
--               This is required for the generation of the bit slip-signals.
--               No timing, powers upto 0.
--
--/////////////////////////////////////////////////////////////////////////////

LIBRARY ieee;
USE IEEE.std_logic_1164.all;

ENTITY MF_pll_reg is
    PORT    ( clk : in std_logic;
              ena : in std_logic := '1';
              d : in std_logic;
              clrn : in std_logic := '1';
              prn : in std_logic := '1';
              q : out std_logic
            );
end MF_pll_reg;

ARCHITECTURE behave of MF_pll_reg is
begin
    process (clk, prn, clrn)
    variable q_reg : std_logic := '0';
    begin
        if (prn = '0') then
            q_reg := '1';
        elsif (clrn = '0') then
            q_reg := '0';
        elsif (clk'event and clk = '1' and (ena = '1')) then
            q_reg := D;
        end if;

        Q <= q_reg;
    end process;

end behave;

--///////////////////////////////////////////////////////////////////////////
--
-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name      : MF_STRATIX_PLL
--
-- Description      : The behavioral model for Stratix PLL
--
-- Limitations      : Applies to the Stratix and Stratix GX device families
--                    No support for spread spectrum feature in the model
--
-- Expected results : Up to 10 output clocks, each defined by its own set of
--                    parameters. Locked output (active high) indicates when the
--                    PLL locks. clkbad, clkloss and activeclock are used for
--                    clock switchover to inidicate which input clock has gone
--                    bad, when the clock switchover initiates and which input
--                    clock is being used as the reference, respectively.
--                    scandataout is the data output of the serial scan chain.
--
-- END ENTITY HEADER -----------------------------------------------------------

library ieee;
library altera;
use IEEE.std_logic_1164.all;
use altera.pllpack.all;
use altera.altera_mf_components.all;

entity MF_stratix_pll is
generic (
        operation_mode              : string := "normal";
        qualify_conf_done           : string := "off";
        compensate_clock            : string := "clk0";
        pll_type                    : string := "auto";  -- EGPP/FAST/AUTO
        scan_chain                  : string := "long";

        clk0_multiply_by            : integer := 1;
        clk0_divide_by              : integer := 1;
        clk0_phase_shift            : string := "0";
        clk0_time_delay             : string := "0";
        clk0_duty_cycle             : integer := 50;

        clk1_multiply_by            : integer := 1;
        clk1_divide_by              : integer := 1;
        clk1_phase_shift            : string := "0";
        clk1_time_delay             : string := "0";
        clk1_duty_cycle             : integer := 50;

        clk2_multiply_by            : integer := 1;
        clk2_divide_by              : integer := 1;
        clk2_phase_shift            : string := "0";
        clk2_time_delay             : string := "0";
        clk2_duty_cycle             : integer := 50;

        clk3_multiply_by            : integer := 1;
        clk3_divide_by              : integer := 1;
        clk3_phase_shift            : string := "0";
        clk3_time_delay             : string := "0";
        clk3_duty_cycle             : integer := 50;

        clk4_multiply_by            : integer := 1;
        clk4_divide_by              : integer := 1;
        clk4_phase_shift            : string := "0";
        clk4_time_delay             : string := "0";
        clk4_duty_cycle             : integer := 50;

        clk5_multiply_by            : integer := 1;
        clk5_divide_by              : integer := 1;
        clk5_phase_shift            : string := "0";
        clk5_time_delay             : string := "0";
        clk5_duty_cycle             : integer := 50;

        extclk0_multiply_by         : integer := 1;
        extclk0_divide_by           : integer := 1;
        extclk0_phase_shift         : string := "0";
        extclk0_time_delay          : string := "0";
        extclk0_duty_cycle          : integer := 50;

        extclk1_multiply_by         : integer := 1;
        extclk1_divide_by           : integer := 1;
        extclk1_phase_shift         : string := "0";
        extclk1_time_delay          : string := "0";
        extclk1_duty_cycle          : integer := 50;

        extclk2_multiply_by         : integer := 1;
        extclk2_divide_by           : integer := 1;
        extclk2_phase_shift         : string := "0";
        extclk2_time_delay          : string := "0";
        extclk2_duty_cycle          : integer := 50;

        extclk3_multiply_by         : integer := 1;
        extclk3_divide_by           : integer := 1;
        extclk3_phase_shift         : string := "0";
        extclk3_time_delay          : string := "0";
        extclk3_duty_cycle          : integer := 50;

        primary_clock               : string := "inclk0";
        inclk0_input_frequency      : integer := 10000;
        inclk1_input_frequency      : integer := 10000;
        gate_lock_signal            : string := "no";
        gate_lock_counter           : integer := 1;
        valid_lock_multiplier       : integer := 5;
        invalid_lock_multiplier     : integer := 5;

        switch_over_on_lossclk      : string := "off";
        switch_over_on_gated_lock   : string := "off";
        switch_over_counter         : integer := 1;
        enable_switch_over_counter  : string := "off";
        feedback_source             : string := "extclk0";
        bandwidth_type              : string := "auto";
        bandwidth                   : integer := 0;
        spread_frequency            : integer := 0;
        down_spread                 : string := "0.0";

        pfd_min                     : integer := 0;
        pfd_max                     : integer := 0;
        vco_min                     : integer := 0;
        vco_max                     : integer := 0;
        vco_center                  : integer := 0;

        -- ADVANCED USER PARAMETERS
        m_initial                   : integer := 1;
        m                           : integer := 1;
        n                           : integer := 1;
        m2                          : integer := 1;
        n2                          : integer := 1;
        ss                          : integer := 0;

        l0_high                     : integer := 1;
        l0_low                      : integer := 1;
        l0_initial                  : integer := 1;
        l0_mode                     : string := "bypass";
        l0_ph                       : integer := 0;
        l0_time_delay               : integer := 0;

        l1_high                     : integer := 1;
        l1_low                      : integer := 1;
        l1_initial                  : integer := 1;
        l1_mode                     : string := "bypass";
        l1_ph                       : integer := 0;
        l1_time_delay               : integer := 0;

        g0_high                     : integer := 1;
        g0_low                      : integer := 1;
        g0_initial                  : integer := 1;
        g0_mode                     : string := "bypass";
        g0_ph                       : integer := 0;
        g0_time_delay               : integer := 0;

        g1_high                     : integer := 1;
        g1_low                      : integer := 1;
        g1_initial                  : integer := 1;
        g1_mode                     : string := "bypass";
        g1_ph                       : integer := 0;
        g1_time_delay               : integer := 0;

        g2_high                     : integer := 1;
        g2_low                      : integer := 1;
        g2_initial                  : integer := 1;
        g2_mode                     : string := "bypass";
        g2_ph                       : integer := 0;
        g2_time_delay               : integer := 0;

        g3_high                     : integer := 1;
        g3_low                      : integer := 1;
        g3_initial                  : integer := 1;
        g3_mode                     : string := "bypass";
        g3_ph                       : integer := 0;
        g3_time_delay               : integer := 0;

        e0_high                     : integer := 1;
        e0_low                      : integer := 1;
        e0_initial                  : integer := 1;
        e0_mode                     : string := "bypass";
        e0_ph                       : integer := 0;
        e0_time_delay               : integer := 0;

        e1_high                     : integer := 1;
        e1_low                      : integer := 1;
        e1_initial                  : integer := 1;
        e1_mode                     : string := "bypass";
        e1_ph                       : integer := 0;
        e1_time_delay               : integer := 0;

        e2_high                     : integer := 1;
        e2_low                      : integer := 1;
        e2_initial                  : integer := 1;
        e2_mode                     : string := "bypass";
        e2_ph                       : integer := 0;
        e2_time_delay               : integer := 0;

        e3_high                     : integer := 1;
        e3_low                      : integer := 1;
        e3_initial                  : integer := 1;
        e3_mode                     : string := "bypass";
        e3_ph                       : integer := 0;
        e3_time_delay               : integer := 0;

        m_ph                        : integer := 0;
        m_time_delay                : integer := 0;
        n_time_delay                : integer := 0;

        extclk0_counter             : string := "e0";
        extclk1_counter             : string := "e1";
        extclk2_counter             : string := "e2";
        extclk3_counter             : string := "e3";

        clk0_counter                : string := "g0";
        clk1_counter                : string := "g1";
        clk2_counter                : string := "g2";
        clk3_counter                : string := "g3";
        clk4_counter                : string := "l0";
        clk5_counter                : string := "l1";

        -- LVDS mode parameters
        enable0_counter             : string := "l0";
        enable1_counter             : string := "l0";

        charge_pump_current         : integer := 0;
        loop_filter_r               : string := "1.0";
        loop_filter_c               : integer := 1;
        common_rx_tx                : string := "off";
        rx_outclock_resource        : string := "auto";
        use_vco_bypass              : string := "false";
        use_dc_coupling             : string := "false";

        pll_compensation_delay      : integer := 0;
        simulation_type             : string := "timing";
        skip_vco                    : string := "off"

);
port (
      inclk                       : in std_logic_vector(1 downto 0);
      fbin                        : in std_logic;
      ena                         : in std_logic;
      clkswitch                   : in std_logic;
      areset                      : in std_logic;
      pfdena                      : in std_logic;
      clkena                      : in std_logic_vector(5 downto 0);
      extclkena                   : in std_logic_vector(3 downto 0);
      scanaclr                    : in std_logic;
      scandata                    : in std_logic;
      scanclk                     : in std_logic;
      clk                         : out std_logic_vector(5 downto 0);
      extclk                      : out std_logic_vector(3 downto 0);
      clkbad                      : out std_logic_vector(1 downto 0);
      activeclock                 : out std_logic;
      locked                      : out std_logic;
      clkloss                     : out std_logic;
      scandataout                 : out std_logic;
      -- lvds specific ports
      comparator                  : in std_logic := '0';
      enable0                     : out std_logic;
      enable1                     : out std_logic
);
END MF_stratix_pll;

ARCHITECTURE vital_pll of MF_stratix_pll is

-- internal advanced parameter signals
signal   i_vco_min      : natural;
signal   i_vco_max      : natural;
signal   i_vco_center   : natural;
signal   i_pfd_min      : natural;
signal   i_pfd_max      : natural;
signal   l0_ph_val      : natural;
signal   l1_ph_val      : natural;
signal   g0_ph_val      : natural;
signal   g1_ph_val      : natural;
signal   g2_ph_val      : natural;
signal   g3_ph_val      : natural;
signal   e0_ph_val      : natural;
signal   e1_ph_val      : natural;
signal   e2_ph_val      : natural;
signal   e3_ph_val      : natural;
signal   i_extclk3_counter      : string(1 to 2) := "e3";
signal   i_extclk2_counter      : string(1 to 2) := "e2";
signal   i_extclk1_counter      : string(1 to 2) := "e1";
signal   i_extclk0_counter      : string(1 to 2) := "e0";
signal   i_clk5_counter         : string(1 to 2) := "l1";
signal   i_clk4_counter         : string(1 to 2) := "l0";
signal   i_clk3_counter         : string(1 to 2) := "g3";
signal   i_clk2_counter         : string(1 to 2) := "g2";
signal   i_clk1_counter         : string(1 to 2) := "g1";
signal   i_clk0_counter         : string(1 to 2) := "g0";
signal   i_charge_pump_current  : natural;
signal   i_loop_filter_r        : natural;

-- end internal advanced parameter signals

-- CONSTANTS
CONSTANT EGPP_SCAN_CHAIN : integer := 289;
CONSTANT GPP_SCAN_CHAIN : integer := 193;
CONSTANT TRST : time := 5000 ps;
CONSTANT TRSTCLK : time := 5000 ps;

-- signals

signal vcc : std_logic := '1';

signal fbclk       : std_logic;
signal refclk      : std_logic;

signal l0_clk : std_logic;
signal l1_clk : std_logic;
signal g0_clk : std_logic;
signal g1_clk : std_logic;
signal g2_clk : std_logic;
signal g3_clk : std_logic;
signal e0_clk : std_logic;
signal e1_clk : std_logic;
signal e2_clk : std_logic;
signal e3_clk : std_logic;

signal vco_out : std_logic_vector(7 downto 0) := (OTHERS => '0');

-- signals to assign values to counter params
signal m_val : integer := 1;
signal m2_val : integer := 1;
signal n_val : integer := 1;
signal n2_val : integer := 1;
signal m_time_delay_val, n_time_delay_val : integer := 0;
signal m_ph_val : integer := 0;
signal m_initial_val : integer := m_initial;

signal l0_initial_val : integer := l0_initial;
signal l1_initial_val : integer := l1_initial;
signal l0_high_val : integer := l0_high;
signal l1_high_val : integer := l1_high;
signal l0_low_val : integer := l0_low;
signal l1_low_val : integer := l1_low;
signal l0_mode_val : string(1 to 6) := "bypass";
signal l1_mode_val : string(1 to 6) := "bypass";
signal l0_time_delay_val : integer := l0_time_delay;
signal l1_time_delay_val : integer := l1_time_delay;

signal g0_initial_val : integer := g0_initial;
signal g1_initial_val : integer := g1_initial;
signal g2_initial_val : integer := g2_initial;
signal g3_initial_val : integer := g3_initial;
signal g0_high_val : integer := g0_high;
signal g1_high_val : integer := g1_high;
signal g2_high_val : integer := g2_high;
signal g3_high_val : integer := g3_high;
signal g0_mode_val : string(1 to 6) := "bypass";
signal g1_mode_val : string(1 to 6) := "bypass";
signal g2_mode_val : string(1 to 6) := "bypass";
signal g3_mode_val : string(1 to 6) := "bypass";
signal g0_low_val : integer := g0_low;
signal g1_low_val : integer := g1_low;
signal g2_low_val : integer := g2_low;
signal g3_low_val : integer := g3_low;
signal g0_time_delay_val : integer := g0_time_delay;
signal g1_time_delay_val : integer := g1_time_delay;
signal g2_time_delay_val : integer := g2_time_delay;
signal g3_time_delay_val : integer := g3_time_delay;

signal e0_initial_val : integer := e0_initial;
signal e1_initial_val : integer := e1_initial;
signal e2_initial_val : integer := e2_initial;
signal e3_initial_val : integer := e3_initial;
signal e0_high_val : integer := e0_high;
signal e1_high_val : integer := e1_high;
signal e2_high_val : integer := e2_high;
signal e3_high_val : integer := e3_high;
signal e0_low_val : integer := e0_low;
signal e1_low_val : integer := e1_low;
signal e2_low_val : integer := e2_low;
signal e3_low_val : integer := e3_low;
signal e0_time_delay_val : integer := e0_time_delay;
signal e1_time_delay_val : integer := e1_time_delay;
signal e2_time_delay_val : integer := e2_time_delay;
signal e3_time_delay_val : integer := e3_time_delay;
signal e0_mode_val : string(1 to 6) := "bypass";
signal e1_mode_val : string(1 to 6) := "bypass";
signal e2_mode_val : string(1 to 6) := "bypass";
signal e3_mode_val : string(1 to 6) := "bypass";

signal m_mode_val : string(1 to 6) := "      ";
signal m2_mode_val : string(1 to 6) := "      ";
signal n_mode_val : string(1 to 6) := "      ";
signal n2_mode_val : string(1 to 6) := "      ";

signal cntr_e0_initial : integer := 1;
signal cntr_e1_initial : integer := 1;
signal cntr_e2_initial : integer := 1;
signal cntr_e3_initial : integer := 1;
signal ext_fbk_delay : integer := 0;
signal cntr_e0_delay : integer := 0;
signal cntr_e1_delay : integer := 0;
signal cntr_e2_delay : integer := 0;
signal cntr_e3_delay : integer := 0;

signal transfer : std_logic := '0';

signal scan_data : std_logic_vector(288 downto 0) := (OTHERS => '0');
signal ena0 : std_logic;
signal ena1 : std_logic;
signal ena2 : std_logic;
signal ena3 : std_logic;
signal ena4 : std_logic;
signal ena5 : std_logic;
signal extena0 : std_logic;
signal extena1 : std_logic;
signal extena2 : std_logic;
signal extena3 : std_logic;

signal clk0_tmp : std_logic;
signal clk1_tmp : std_logic;
signal clk2_tmp : std_logic;
signal clk3_tmp : std_logic;
signal clk4_tmp : std_logic;
signal clk5_tmp : std_logic;
signal extclk0_tmp : std_logic;
signal extclk1_tmp : std_logic;
signal extclk2_tmp : std_logic;
signal extclk3_tmp : std_logic;

signal not_clk0_tmp : std_logic;
signal not_clk1_tmp : std_logic;
signal not_clk2_tmp : std_logic;
signal not_clk3_tmp : std_logic;
signal not_clk4_tmp : std_logic;
signal not_clk5_tmp : std_logic;

signal not_extclk0_tmp : std_logic;
signal not_extclk1_tmp : std_logic;
signal not_extclk2_tmp : std_logic;
signal not_extclk3_tmp : std_logic;

signal clkin : std_logic := '0';
signal gate_locked : std_logic := '0';
signal lock : std_logic := '0';
signal about_to_lock : boolean := false;
signal quiet_period_violation : boolean := false;
signal reconfig_err : boolean := false;
signal scanclr_violation : boolean := false;
signal scanclr_clk_violation : boolean := false;

signal inclk_l0 : std_logic;
signal inclk_l1 : std_logic;
signal inclk_g0 : std_logic;
signal inclk_g1 : std_logic;
signal inclk_g2 : std_logic;
signal inclk_g3 : std_logic;
signal inclk_e0 : std_logic;
signal inclk_e1 : std_logic;
signal inclk_e2 : std_logic;
signal inclk_e3 : std_logic;
signal inclk_m : std_logic;
signal devpor : std_logic;
signal devclrn : std_logic;

signal inclk0_ipd : std_logic;
signal inclk1_ipd : std_logic;
signal ena_ipd : std_logic;
signal pfdena_ipd : std_logic;
signal comparator_ipd : std_logic;
signal areset_ipd : std_logic;
signal fbin_ipd : std_logic;
signal clkena0_ipd : std_logic;
signal clkena1_ipd : std_logic;
signal clkena2_ipd : std_logic;
signal clkena3_ipd : std_logic;
signal clkena4_ipd : std_logic;
signal clkena5_ipd : std_logic;
signal extclkena0_ipd : std_logic;
signal extclkena1_ipd : std_logic;
signal extclkena2_ipd : std_logic;
signal extclkena3_ipd : std_logic;
signal scanclk_ipd : std_logic;
signal scanaclr_ipd : std_logic;
signal scandata_ipd : std_logic;
signal clkswitch_ipd : std_logic;

signal lvds_dffa_clk : std_logic;
signal lvds_dffb_clk : std_logic;
signal lvds_dffc_clk : std_logic;
signal lvds_dffd_clk : std_logic;
signal dffa_out : std_logic := '0';
signal dffb_out : std_logic := '0';
signal dffc_out : std_logic := '0';
signal dffd_out : std_logic := '0';
signal nce_temp : std_logic := '0';
signal nce_l0 : std_logic := '0';
signal nce_l1 : std_logic := '0';

signal inclk_l0_dly1 : std_logic := '0';
signal inclk_l0_dly2 : std_logic := '0';
signal inclk_l0_dly3 : std_logic := '0';
signal inclk_l0_dly4 : std_logic := '0';
signal inclk_l0_dly5 : std_logic := '0';
signal inclk_l0_dly6 : std_logic := '0';
signal inclk_l1_dly1 : std_logic := '0';
signal inclk_l1_dly2 : std_logic := '0';
signal inclk_l1_dly3 : std_logic := '0';
signal inclk_l1_dly4 : std_logic := '0';
signal inclk_l1_dly5 : std_logic := '0';
signal inclk_l1_dly6 : std_logic := '0';


signal sig_offset : time := 0 ps;
signal sig_refclk_time : time := 0 ps;
signal sig_fbclk_period : time := 0 ps;
signal sig_vco_period_was_phase_adjusted : boolean := false;
signal sig_phase_adjust_was_scheduled : boolean := false;
signal sig_stop_vco : std_logic := '0';
signal sig_m_times_vco_period : time := 0 ps;
signal sig_new_m_times_vco_period : time := 0 ps;
signal sig_got_refclk_posedge : boolean := false;
signal sig_got_fbclk_posedge : boolean := false;
signal sig_got_second_refclk : boolean := false;

signal m_delay : integer := 0;
signal n_delay : integer := 0;

signal sig_curr_clock : string(1 to 6) := primary_clock;
signal inclk1_tmp : std_logic := '0';
signal scan_chain_length : integer := GPP_SCAN_CHAIN;

signal ext_fbk_cntr_high : integer := 0;
signal ext_fbk_cntr_low : integer := 0;
signal ext_fbk_cntr_delay : integer := 0;
signal ext_fbk_cntr_ph : integer := 0;
signal ext_fbk_cntr_initial : integer := 1;
signal ext_fbk_cntr     : string(1 to 2) := "e0";
signal ext_fbk_cntr_mode : string(1 to 6) := "bypass";

signal enable0_tmp : std_logic := '0';
signal enable1_tmp : std_logic := '0';
signal reset_low : std_logic := '0';

signal scandataout_tmp : std_logic := '0';

signal sig_refclk_period : time := (inclk0_input_frequency * 1 ps) * n;

signal schedule_vco : std_logic := '0';

signal areset_ena_sig : std_logic := '0';

COMPONENT MF_mn_cntr
    PORT ( clk           : IN std_logic;
           reset         : IN std_logic;
           cout          : OUT std_logic;
           initial_value : IN integer := 1;
           modulus       : IN integer;
           time_delay    : IN integer;
           ph            : IN integer := 0
         );
END COMPONENT;

COMPONENT stx_scale_cntr
    PORT ( clk            : IN std_logic;
           reset          : IN std_logic;
           cout           : OUT std_logic;
           initial        : IN integer := 1;
           high           : IN integer := 1;
           low            : IN integer := 1;
           mode           : IN string := "bypass";
           time_delay     : IN integer := 0;
           ph_tap         : IN natural
         );
END COMPONENT;

component DFFP
port(
    Q                              :  out   STD_LOGIC := '0';
    D                              :  in    STD_LOGIC := '1';
    CLRN                           :  in    STD_LOGIC := '1';
    PRN                            :  in    STD_LOGIC := '1';
    CLK                            :  in    STD_LOGIC := '0';
    ENA                            :  in    STD_LOGIC := '1'
);
end component;

COMPONENT MF_PLL_REG
   PORT(
      Q                              :  out   STD_LOGIC := '0';
      D                              :  in    STD_LOGIC := '1';
      CLRN                           :  in    STD_LOGIC := '1';
      PRN                            :  in    STD_LOGIC := '1';
      CLK                            :  in    STD_LOGIC := '0';
      ENA                            :  in    STD_LOGIC := '1');
END COMPONENT;

begin

    ----------------------
    --  INPUT PATH DELAYs
    ----------------------
    WireDelay : block
    begin
        inclk0_ipd <= inclk(0);
        inclk1_ipd <= inclk(1);
        areset_ipd <= areset;
        ena_ipd <= ena;
        fbin_ipd <= fbin;
        pfdena_ipd <= pfdena;
        clkena0_ipd <= clkena(0);
        clkena1_ipd <= clkena(1);
        clkena2_ipd <= clkena(2);
        clkena3_ipd <= clkena(3);
        clkena4_ipd <= clkena(4);
        clkena5_ipd <= clkena(5);
        extclkena0_ipd <= extclkena(0);
        extclkena1_ipd <= extclkena(1);
        extclkena2_ipd <= extclkena(2);
        extclkena3_ipd <= extclkena(3);
        scanclk_ipd <= scanclk;
        scanaclr_ipd <= scanaclr;
        scandata_ipd <= scandata;
        comparator_ipd <= comparator;
        clkswitch_ipd <= clkswitch;
    end block;

-- User to Advanced parameter conversion

    i_extclk3_counter       <= "e3" when m=0 else extclk3_counter;
    i_extclk2_counter       <= "e2" when m=0 else extclk2_counter;
    i_extclk1_counter       <= "e1" when m=0 else extclk1_counter;
    i_extclk0_counter       <= "e0" when m=0 else extclk0_counter;
    i_clk5_counter          <= "l1" when m=0 else clk5_counter;
    i_clk4_counter          <= "l0" when m=0 else clk4_counter;
    i_clk3_counter          <= "g3" when m=0 else clk3_counter;
    i_clk2_counter          <= "g2" when m=0 else clk2_counter;
    i_clk1_counter          <= "g1" when m=0 else clk1_counter;
    i_clk0_counter          <= "l0" when m=0 and pll_type = "lvds" else
                               "g0" when m=0 else clk0_counter;

-- end parameter conversion

    inclk_m <= extclk0_tmp when operation_mode = "external_feedback" and feedback_source = "extclk0" else
               extclk1_tmp when operation_mode = "external_feedback" and feedback_source = "extclk1" else
               extclk2_tmp when operation_mode = "external_feedback" and feedback_source = "extclk2" else
               extclk3_tmp when operation_mode = "external_feedback" and feedback_source = "extclk3" else
               vco_out(m_ph_val);

    ext_fbk_cntr <= "e0" when (feedback_source = "extclk0" and extclk0_counter = "e0") or (feedback_source = "extclk1" and extclk1_counter = "e0") or (feedback_source = "extclk2" and extclk2_counter = "e0") or (feedback_source = "extclk3" and extclk3_counter = "e0") else
                    "e1" when (feedback_source = "extclk0" and extclk0_counter = "e1") or (feedback_source = "extclk1" and extclk1_counter = "e1") or (feedback_source = "extclk2" and extclk2_counter = "e1") or (feedback_source = "extclk3" and extclk3_counter = "e1") else
                    "e2" when (feedback_source = "extclk0" and extclk0_counter = "e2") or (feedback_source = "extclk1" and extclk1_counter = "e2") or (feedback_source = "extclk2" and extclk2_counter = "e2") or (feedback_source = "extclk3" and extclk3_counter = "e2") else
                    "e3" when (feedback_source = "extclk0" and extclk0_counter = "e3") or (feedback_source = "extclk1" and extclk1_counter = "e3") or (feedback_source = "extclk2" and extclk2_counter = "e3") or (feedback_source = "extclk3" and extclk3_counter = "e3") else
                    "e0";

    ext_fbk_cntr_high <= e0_high_val when ext_fbk_cntr = "e0" else
                         e1_high_val when ext_fbk_cntr = "e1" else
                         e2_high_val when ext_fbk_cntr = "e2" else
                         e3_high_val when ext_fbk_cntr = "e3" else
                         1;
    ext_fbk_cntr_low <= e0_low_val when ext_fbk_cntr = "e0" else
                        e1_low_val when ext_fbk_cntr = "e1" else
                        e2_low_val when ext_fbk_cntr = "e2" else
                        e3_low_val when ext_fbk_cntr = "e3" else
                        1;
    ext_fbk_cntr_delay <= e0_time_delay_val when ext_fbk_cntr = "e0" else
                          e1_time_delay_val when ext_fbk_cntr = "e1" else
                          e2_time_delay_val when ext_fbk_cntr = "e2" else
                          e3_time_delay_val when ext_fbk_cntr = "e3" else
                          0;

    ext_fbk_cntr_ph <= e0_ph_val when ext_fbk_cntr = "e0" else
                       e1_ph_val when ext_fbk_cntr = "e1" else
                       e2_ph_val when ext_fbk_cntr = "e2" else
                       e3_ph_val when ext_fbk_cntr = "e3" else
                       0;

    ext_fbk_cntr_initial <= e0_initial_val when ext_fbk_cntr = "e0" else
                            e1_initial_val when ext_fbk_cntr = "e1" else
                            e2_initial_val when ext_fbk_cntr = "e2" else
                            e3_initial_val when ext_fbk_cntr = "e3" else
                            0;
    ext_fbk_cntr_mode <= e0_mode_val when ext_fbk_cntr = "e0" else
                         e1_mode_val when ext_fbk_cntr = "e1" else
                         e2_mode_val when ext_fbk_cntr = "e2" else
                         e3_mode_val when ext_fbk_cntr = "e3" else
                         e0_mode_val;

    areset_ena_sig <= areset_ipd or (not ena_ipd) or sig_stop_vco;

    m1 : MF_mn_cntr
         port map (clk           => inclk_m,
                   reset         => areset_ena_sig,
                   cout          => fbclk,
                   initial_value => m_initial_val,
                   modulus       => m_val,
                   time_delay    => m_delay,
                   ph            => m_ph_val
                  );

    -- add delta delay to inclk1 to ensure inclk0 and inclk1 are processed
    -- in different simulation deltas.
    inclk1_tmp <= inclk1_ipd;

    process (inclk0_ipd, inclk1_tmp, clkswitch_ipd)
    variable input_value : std_logic := '0';
    variable current_clock : string(1 to 6) := primary_clock;
    variable clk0_count, clk1_count : integer := 0;
    variable clk0_is_bad, clk1_is_bad : std_logic := '0';
    variable primary_clk_is_bad : boolean := false;
    variable current_clk_is_bad : boolean := false;
    variable got_curr_clk_falling_edge_after_clkswitch : boolean := false;
    variable switch_over_count : integer := 0;
    variable active_clock : std_logic := '0';
    variable external_switch : boolean := false;
    begin
        if (now = 0 ps) then
            if (current_clock = "inclk1") then
                active_clock := '1';
            end if;
        end if;
        if (clkswitch_ipd'event and clkswitch_ipd = '1') then
            external_switch := true;
        end if;
        -- save the current inclk event value
        if (inclk0_ipd'event) then
            input_value := inclk0_ipd;
        elsif (inclk1_tmp'event) then
            input_value := inclk1_tmp;
        end if;

        -- check if either input clk is bad
        if (inclk0_ipd'event and inclk0_ipd = '1') then
            clk0_count := clk0_count + 1;
            clk0_is_bad := '0';
            clk1_count := 0;
            if (clk0_count > 2) then
                -- no event on other clk for 2 cycles
                clk1_is_bad := '1';
                if (current_clock = "inclk1") then
                    current_clk_is_bad := true;
                end if;
            end if;
        end if;
        if (inclk1_tmp'event and inclk1_tmp = '1') then
            clk1_count := clk1_count + 1;
            clk1_is_bad := '0';
            clk0_count := 0;
            if (clk1_count > 2) then
                -- no event on other clk for 2 cycles
                clk0_is_bad := '1';
                if (current_clock = "inclk0") then
                    current_clk_is_bad := true;
                end if;
            end if;
        end if;

        -- check if the bad clk is the primary clock
        if ((primary_clock = "inclk0" and clk0_is_bad = '1') or (primary_clock = "inclk1" and clk1_is_bad = '1')) then
            primary_clk_is_bad := true;
        else
            primary_clk_is_bad := false;
        end if;

        -- actual switching
        if (inclk0_ipd'event and current_clock = "inclk0") then
            if (external_switch) then
                if (not got_curr_clk_falling_edge_after_clkswitch) then
                    if (inclk0_ipd = '0') then
                        got_curr_clk_falling_edge_after_clkswitch := true;
                    end if;
                    clkin <= transport inclk0_ipd;
                end if;
            else
                clkin <= transport inclk0_ipd;
            end if;
        elsif (inclk1_tmp'event and current_clock = "inclk1") then
            if (external_switch) then
                if (not got_curr_clk_falling_edge_after_clkswitch) then
                    if (inclk1_tmp = '0') then
                        got_curr_clk_falling_edge_after_clkswitch := true;
                    end if;
                    clkin <= transport inclk1_tmp;
                end if;
            else
                clkin <= transport inclk1_tmp;
            end if;
        else
            if (input_value = '1' and switch_over_on_lossclk = "on"  and enable_switch_over_counter = "on" and primary_clk_is_bad) then
                switch_over_count := switch_over_count + 1;
            end if;
            if (input_value = '0') then
                if (external_switch and (got_curr_clk_falling_edge_after_clkswitch or current_clk_is_bad)) or (switch_over_on_lossclk = "on" and primary_clk_is_bad and (enable_switch_over_counter = "off" or switch_over_count = switch_over_counter)) then
                    got_curr_clk_falling_edge_after_clkswitch := false;
                    if (current_clock = "inclk0") then
                        current_clock := "inclk1";
                    else
                        current_clock := "inclk0";
                    end if;
                    active_clock := not active_clock;
                    switch_over_count := 0;
                    external_switch := false;
                    current_clk_is_bad := false;
                end if;
       
            end if;
        end if;

        -- schedule outputs
        clkbad(0) <= clk0_is_bad;
        clkbad(1) <= clk1_is_bad;
        if (switch_over_on_lossclk = "on" and clkswitch_ipd /= '1') then
            if (primary_clk_is_bad) then
                -- assert clkloss
                clkloss <= '1';
            else
                clkloss <= '0';
            end if;
        else
            clkloss <= clkswitch_ipd;
        end if;
        activeclock <= active_clock;

    end process;

    n1 : MF_mn_cntr
         port map (clk           => clkin,
                   reset         => areset_ipd,
                   cout          => refclk,
                   initial_value => n_val,
                   modulus       => n_val,
                   time_delay    => n_time_delay_val);

    inclk_l0 <= vco_out(l0_ph_val);
    l0 : stx_scale_cntr
         port map (clk            => inclk_l0,
                   reset          => areset_ena_sig,
                   cout           => l0_clk,
                   initial        => l0_initial_val,
                   high           => l0_high_val,
                   low            => l0_low_val,
                   mode           => l0_mode_val,
                   time_delay     => l0_time_delay_val,
                   ph_tap         => l0_ph_val);

    inclk_l1 <= vco_out(l1_ph_val);
    l1 : stx_scale_cntr
         port map (clk            => inclk_l1,
                   reset          => areset_ena_sig,
                   cout           => l1_clk,
                   initial        => l1_initial_val,
                   high           => l1_high_val,
                   low            => l1_low_val,
                   mode           => l1_mode_val,
                   time_delay     => l1_time_delay_val,
                   ph_tap         => l1_ph_val);

    inclk_g0 <= vco_out(g0_ph_val);
    g0 : stx_scale_cntr
         port map (clk            => inclk_g0,
                   reset          => areset_ena_sig,
                   cout           => g0_clk,
                   initial        => g0_initial_val,
                   high           => g0_high_val,
                   low            => g0_low_val,
                   mode           => g0_mode_val,
                   time_delay     => g0_time_delay_val,
                   ph_tap         => g0_ph_val);


    process(g0_clk, l0_clk, l1_clk)
    begin
        if (g0_clk'event and g0_clk = '1') then
            dffa_out <= comparator_ipd;
        end if;
        if (l0_clk'event and l0_clk = '1' and enable0_counter = "l0") then
            dffb_out <= dffa_out;
            dffc_out <= dffb_out;
            dffd_out <= nce_temp;
        end if;
        if (l1_clk'event and l1_clk = '1' and enable0_counter = "l1") then
            dffb_out <= dffa_out;
            dffc_out <= dffb_out;
            dffd_out <= nce_temp;
        end if;
    end process;

    nce_temp <= (not dffc_out) and dffb_out;

    nce_l0 <= dffd_out when enable0_counter = "l0" else '0';
    nce_l1 <= dffd_out when enable0_counter = "l1" else '0';

    inclk_g1 <= vco_out(g1_ph_val);
    g1 : stx_scale_cntr
         port map (clk            => inclk_g1,
                   reset          => areset_ena_sig,
                   cout           => g1_clk,
                   initial        => g1_initial_val,
                   high           => g1_high_val,
                   low            => g1_low_val,
                   mode           => g1_mode_val,
                   time_delay     => g1_time_delay_val,
                   ph_tap         => g1_ph_val);

    inclk_g2 <= vco_out(g2_ph_val);
    g2 : stx_scale_cntr
         port map (clk            => inclk_g2,
                   reset          => areset_ena_sig,
                   cout           => g2_clk,
                   initial        => g2_initial_val,
                   high           => g2_high_val,
                   low            => g2_low_val,
                   mode           => g2_mode_val,
                   time_delay     => g2_time_delay_val,
                   ph_tap         => g2_ph_val);

    inclk_g3 <= vco_out(g3_ph_val);
    g3 : stx_scale_cntr
         port map (clk            => inclk_g3,
                   reset          => areset_ena_sig,
                   cout           => g3_clk,
                   initial        => g3_initial_val,
                   high           => g3_high_val,
                   low            => g3_low_val,
                   mode           => g3_mode_val,
                   time_delay     => g3_time_delay_val,
                   ph_tap         => g3_ph_val);

    inclk_e0 <= vco_out(e0_ph_val);
    cntr_e0_initial <= 1 when operation_mode = "external_feedback" and
                              ext_fbk_cntr = "e0" else e0_initial_val;
    cntr_e0_delay <= ext_fbk_delay when operation_mode = "external_feedback" and
                            ext_fbk_cntr = "e0" else
                     e0_time_delay_val;
    e0 : stx_scale_cntr
         port map (clk            => inclk_e0,
                   reset          => areset_ena_sig,
                   cout           => e0_clk,
                   initial        => cntr_e0_initial,
                   high           => e0_high_val,
                   low            => e0_low_val,
                   mode           => e0_mode_val,
                   time_delay     => cntr_e0_delay,
                   ph_tap         => e0_ph_val);

    inclk_e1 <= vco_out(e1_ph_val);
    cntr_e1_initial <= 1 when operation_mode = "external_feedback" and
                              ext_fbk_cntr = "e1" else e1_initial_val;
    cntr_e1_delay <= ext_fbk_delay when operation_mode = "external_feedback" and
                            ext_fbk_cntr = "e1" else
                     e1_time_delay_val;
    e1 : stx_scale_cntr
         port map (clk            => inclk_e1,
                   reset          => areset_ena_sig,
                   cout           => e1_clk,
                   initial        => cntr_e1_initial,
                   high           => e1_high_val,
                   low            => e1_low_val,
                   mode           => e1_mode_val,
                   time_delay     => cntr_e1_delay,
                   ph_tap         => e1_ph_val);

    inclk_e2 <= vco_out(e2_ph_val);
    cntr_e2_initial <= 1 when operation_mode = "external_feedback" and
                              ext_fbk_cntr = "e2" else e2_initial_val;
    cntr_e2_delay <= ext_fbk_delay when operation_mode = "external_feedback" and
                            ext_fbk_cntr = "e2" else
                     e2_time_delay_val;
    e2 : stx_scale_cntr
         port map (clk            => inclk_e2,
                   reset          => areset_ena_sig,
                   cout           => e2_clk,
                   initial        => cntr_e2_initial,
                   high           => e2_high_val,
                   low            => e2_low_val,
                   mode           => e2_mode_val,
                   time_delay     => cntr_e2_delay,
                   ph_tap         => e2_ph_val);

    inclk_e3 <= vco_out(e3_ph_val);
    cntr_e3_initial <= 1 when operation_mode = "external_feedback" and
                              ext_fbk_cntr = "e3" else e3_initial_val;
    cntr_e3_delay <= ext_fbk_delay when operation_mode = "external_feedback" and
                            ext_fbk_cntr = "e3" else
                     e3_time_delay_val;
    e3 : stx_scale_cntr
         port map (clk            => inclk_e3,
                   reset          => areset_ena_sig,
                   cout           => e3_clk,
                   initial        => cntr_e3_initial,
                   high           => e3_high_val,
                   low            => e3_low_val,
                   mode           => e3_mode_val,
                   time_delay     => cntr_e3_delay,
                   ph_tap         => e3_ph_val);

    inclk_l0_dly1 <= inclk_l0;
    inclk_l0_dly2 <= inclk_l0_dly1;
    inclk_l0_dly3 <= inclk_l0_dly2;
    inclk_l0_dly4 <= inclk_l0_dly3;
    inclk_l0_dly5 <= inclk_l0_dly4;
    inclk_l0_dly6 <= inclk_l0_dly5;

    inclk_l1_dly1 <= inclk_l1;
    inclk_l1_dly2 <= inclk_l1_dly1;
    inclk_l1_dly3 <= inclk_l1_dly2;
    inclk_l1_dly4 <= inclk_l1_dly3;
    inclk_l1_dly5 <= inclk_l1_dly4;
    inclk_l1_dly6 <= inclk_l1_dly5;

    process(inclk_l0_dly6, inclk_l1_dly6, areset_ipd, ena_ipd, sig_stop_vco)
    variable l0_got_first_rising_edge : boolean := false;
    variable l0_count : integer := 1;
    variable l0_tmp, l1_tmp : std_logic := '0';
    variable l1_got_first_rising_edge : boolean := false;
    variable l1_count : integer := 1;
    begin
        if (areset_ipd = '1' or ena_ipd = '0' or sig_stop_vco = '1') then
            l0_count := 1;
            l1_count := 1;
            l0_got_first_rising_edge := false;
            l1_got_first_rising_edge := false;
        else
            if (nce_l0 = '0') then
                if (not l0_got_first_rising_edge) then
                    if (inclk_l0_dly6'event and inclk_l0_dly6 = '1') then
                        l0_got_first_rising_edge := true;
                    end if;
                elsif (inclk_l0_dly6'event) then
                    l0_count := l0_count + 1;
                    if (l0_count = (l0_high_val + l0_low_val) * 2) then
                        l0_count := 1;
                    end if;
                end if;
            end if;
            if (inclk_l0_dly6'event and inclk_l0_dly6 = '0') then
                if (l0_count = 1) then
                    l0_tmp := '1';
                    l0_got_first_rising_edge := false;
                else
                    l0_tmp := '0';
                end if;
            end if;

            if (nce_l1 = '0') then
                if (not l1_got_first_rising_edge) then
                    if (inclk_l1_dly6'event and inclk_l1_dly6 = '1') then
                        l1_got_first_rising_edge := true;
                    end if;
                elsif (inclk_l1_dly6'event) then
                    l1_count := l1_count + 1;
                    if (l1_count = (l1_high_val + l1_low_val) * 2) then
                        l1_count := 1;
                    end if;
                end if;
            end if;
            if (inclk_l1_dly6'event and inclk_l1_dly6 = '0') then
                if (l1_count = 1) then
                    l1_tmp := '1';
                    l1_got_first_rising_edge := false;
                else
                    l1_tmp := '0';
                end if;
            end if;
        end if;

        if (enable0_counter = "l0") then
            enable0_tmp <= l0_tmp;
        elsif (enable0_counter = "l1") then
            enable0_tmp <= l1_tmp;
        else
            enable0_tmp <= '0';
        end if;

        if (enable1_counter = "l0") then
            enable1_tmp <= l0_tmp;
        elsif (enable1_counter = "l1") then
            enable1_tmp <= l1_tmp;
        else
            enable1_tmp <= '0';
        end if;

    end process;

    glocked_cntr : process(clkin, ena_ipd, areset_ipd)
    variable count : integer := 0;
    variable output : std_logic := '0';
    begin
        if (areset_ipd = '1') then
            count := 0;
            output := '0';
        elsif (clkin'event and clkin = '1') then
            if (ena_ipd = '1') then
                count := count + 1;
                if (count = gate_lock_counter) then
                    output := '1';
                end if;
            end if;
        end if;
        gate_locked <= output;
    end process;

    locked <= gate_locked and lock when gate_lock_signal = "yes" else
              lock;

    process (transfer)
    variable init : boolean := true;
    variable low, high : std_logic_vector(8 downto 0);
    variable delay_chain : std_logic_vector(3 downto 0);
    variable mn_delay_chain : std_logic_vector(0 to 3);
    variable mode : string(1 to 6) := "bypass";
    variable delay_val : integer := 0;
    variable is_error : boolean := false;

    -- user to advanced variables

    variable   i_m_initial    : natural;
    variable   i_m            : integer := 1;
    variable   i_n            : natural := 1;
    variable   i_m2           : natural;
    variable   i_n2           : natural;
    variable   i_ss           : natural;
    variable   i_l0_high      : natural;
    variable   i_l1_high      : natural;
    variable   i_g0_high      : natural;
    variable   i_g1_high      : natural;
    variable   i_g2_high      : natural;
    variable   i_g3_high      : natural;
    variable   i_e0_high      : natural;
    variable   i_e1_high      : natural;
    variable   i_e2_high      : natural;
    variable   i_e3_high      : natural;
    variable   i_l0_low       : natural;
    variable   i_l1_low       : natural;
    variable   i_g0_low       : natural;
    variable   i_g1_low       : natural;
    variable   i_g2_low       : natural;
    variable   i_g3_low       : natural;
    variable   i_e0_low       : natural;
    variable   i_e1_low       : natural;
    variable   i_e2_low       : natural;
    variable   i_e3_low       : natural;
    variable   i_l0_initial   : natural;
    variable   i_l1_initial   : natural;
    variable   i_g0_initial   : natural;
    variable   i_g1_initial   : natural;
    variable   i_g2_initial   : natural;
    variable   i_g3_initial   : natural;
    variable   i_e0_initial   : natural;
    variable   i_e1_initial   : natural;
    variable   i_e2_initial   : natural;
    variable   i_e3_initial   : natural;
    variable   i_l0_mode      : string(1 to 6);
    variable   i_l1_mode      : string(1 to 6);
    variable   i_g0_mode      : string(1 to 6);
    variable   i_g1_mode      : string(1 to 6);
    variable   i_g2_mode      : string(1 to 6);
    variable   i_g3_mode      : string(1 to 6);
    variable   i_e0_mode      : string(1 to 6);
    variable   i_e1_mode      : string(1 to 6);
    variable   i_e2_mode      : string(1 to 6);
    variable   i_e3_mode      : string(1 to 6);
    variable   max_neg_abs    : integer := 0;
    variable   i_l0_time_delay        : natural;
    variable   i_l1_time_delay        : natural;
    variable   i_g0_time_delay        : natural;
    variable   i_g1_time_delay        : natural;
    variable   i_g2_time_delay        : natural;
    variable   i_g3_time_delay        : natural;
    variable   i_e0_time_delay        : natural;
    variable   i_e1_time_delay        : natural;
    variable   i_e2_time_delay        : natural;
    variable   i_e3_time_delay        : natural;
    variable   i_m_time_delay         : natural;
    variable   i_n_time_delay         : natural;
    variable   i_l0_ph        : natural;
    variable   i_l1_ph        : natural;
    variable   i_g0_ph        : natural;
    variable   i_g1_ph        : natural;
    variable   i_g2_ph        : natural;
    variable   i_g3_ph        : natural;
    variable   i_e0_ph        : natural;
    variable   i_e1_ph        : natural;
    variable   i_e2_ph        : natural;
    variable   i_e3_ph        : natural;
    variable   i_m_ph         : natural;
    variable   output_count   : natural;
    variable   new_divisor    : natural;

    begin
        if (init) then
            if (m = 0) then  -- convert user parameters to advanced
                i_n := 1;
                if (pll_type = "lvds") then
                    i_m := clk0_multiply_by;
                else
                    i_m := lcm (clk0_multiply_by, clk1_multiply_by,
                            clk2_multiply_by, clk3_multiply_by,
                            clk4_multiply_by, clk5_multiply_by,
                            extclk0_multiply_by,
                            extclk1_multiply_by, extclk2_multiply_by,
                            extclk3_multiply_by, inclk0_input_frequency);
                end if;
                i_m_time_delay  := maxnegabs(str2int(clk0_time_delay), 
                                             str2int(clk1_time_delay),
                                             str2int(clk2_time_delay), 
                                             str2int(clk3_time_delay), 
                                             str2int(clk4_time_delay),
                                             str2int(clk5_time_delay), 
                                             str2int(extclk0_time_delay),
                                             str2int(extclk1_time_delay), 
                                             str2int(extclk2_time_delay),
                                             str2int(extclk3_time_delay)); 
                i_n_time_delay  := mintimedelay(str2int(clk0_time_delay), 
                                                str2int(clk1_time_delay),
                                                str2int(clk2_time_delay), 
                                                str2int(clk3_time_delay), 
                                                str2int(clk4_time_delay),
                                                str2int(clk5_time_delay), 
                                                str2int(extclk0_time_delay),
                                                str2int(extclk1_time_delay), 
                                                str2int(extclk2_time_delay),
                                                str2int(extclk3_time_delay)); 
                if (pll_type = "lvds") then
                    i_g0_time_delay := counter_time_delay(str2int(clk2_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                else
                    i_g0_time_delay := counter_time_delay(str2int(clk0_time_delay),
                                                      i_m_time_delay,i_n_time_delay);
                end if;
                i_g1_time_delay := counter_time_delay(str2int(clk1_time_delay),
                                                      i_m_time_delay, i_n_time_delay);
                i_g2_time_delay := counter_time_delay(str2int(clk2_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                i_g3_time_delay := counter_time_delay(str2int(clk3_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                if (pll_type = "lvds") then
                    i_l0_time_delay := i_g0_time_delay;
                    i_l1_time_delay := i_g0_time_delay;
                else
                    i_l0_time_delay := counter_time_delay(str2int(clk4_time_delay),
                                              i_m_time_delay, i_n_time_delay);
                    i_l1_time_delay := counter_time_delay(str2int(clk5_time_delay),
                                                      i_m_time_delay, i_n_time_delay);
                end if;
                i_e0_time_delay := counter_time_delay(str2int(extclk0_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                i_e1_time_delay := counter_time_delay(str2int(extclk1_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                i_e2_time_delay := counter_time_delay(str2int(extclk2_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                i_e3_time_delay := counter_time_delay(str2int(extclk3_time_delay), 
                                                      i_m_time_delay, i_n_time_delay);
                max_neg_abs := maxnegabs(str2int(clk0_phase_shift), 
                                         str2int(clk1_phase_shift),
                                         str2int(clk2_phase_shift),
                                         str2int(clk3_phase_shift),
                                         str2int(clk4_phase_shift),
                                         str2int(clk5_phase_shift),
                                         str2int(extclk0_phase_shift),
                                         str2int(extclk1_phase_shift),
                                         str2int(extclk2_phase_shift),
                                         str2int(extclk3_phase_shift));
                i_m_ph  := counter_ph(get_phase_degree(max_neg_abs,inclk0_input_frequency), i_m, i_n);
                if (pll_type = "lvds") then
                    i_g0_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk2_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                else
                    i_g0_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk0_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                end if;
                i_g1_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk1_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_g2_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk2_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_g3_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk3_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                if (pll_type = "lvds") then
                    i_l0_ph := i_g0_ph;
                    i_l1_ph := i_g0_ph;
                else
                    i_l0_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk4_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                    i_l1_ph := counter_ph(get_phase_degree(ph_adjust(str2int(clk5_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                end if;
                i_e0_ph := counter_ph(get_phase_degree(ph_adjust(str2int(extclk0_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_e1_ph := counter_ph(get_phase_degree(ph_adjust(str2int(extclk1_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_e2_ph := counter_ph(get_phase_degree(ph_adjust(str2int(extclk2_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_e3_ph := counter_ph(get_phase_degree(ph_adjust(str2int(extclk3_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                if (pll_type = "lvds") then
                    i_g0_high := counter_high(output_counter_value(clk2_divide_by,
                                 clk2_multiply_by, i_m, i_n), clk2_duty_cycle);
                else
                    i_g0_high := counter_high(output_counter_value(clk0_divide_by,
                                 clk0_multiply_by, i_m, i_n), clk0_duty_cycle);
                end if;
                i_g1_high := counter_high(output_counter_value(clk1_divide_by,
                             clk1_multiply_by, i_m, i_n), clk1_duty_cycle);
                i_g2_high := counter_high(output_counter_value(clk2_divide_by,
                             clk2_multiply_by, i_m, i_n), clk2_duty_cycle);
                i_g3_high := counter_high(output_counter_value(clk3_divide_by,
                             clk3_multiply_by, i_m, i_n), clk3_duty_cycle);
                if (pll_type = "lvds") then
                    i_l0_high := i_g0_high;
                    i_l1_high := i_g0_high;
                else
                    i_l0_high := counter_high(output_counter_value(clk4_divide_by,
                                 clk4_multiply_by,  i_m, i_n), clk4_duty_cycle);
                    i_l1_high := counter_high(output_counter_value(clk5_divide_by,
                                 clk5_multiply_by,  i_m, i_n), clk5_duty_cycle);
                end if;
                i_e0_high := counter_high(output_counter_value(extclk0_divide_by,
                             extclk0_multiply_by,  i_m, i_n), extclk0_duty_cycle);
                i_e1_high := counter_high(output_counter_value(extclk1_divide_by,
                             extclk1_multiply_by,  i_m, i_n), extclk1_duty_cycle);
                i_e2_high := counter_high(output_counter_value(extclk2_divide_by,
                             extclk2_multiply_by,  i_m, i_n), extclk2_duty_cycle);
                i_e3_high := counter_high(output_counter_value(extclk3_divide_by,
                             extclk3_multiply_by,  i_m, i_n), extclk3_duty_cycle);
                if (pll_type = "lvds") then
                    i_g0_low  := counter_low(output_counter_value(clk2_divide_by,
                                 clk2_multiply_by,  i_m, i_n), clk2_duty_cycle);
                else
                    i_g0_low  := counter_low(output_counter_value(clk0_divide_by,
                                 clk0_multiply_by,  i_m, i_n), clk0_duty_cycle);
                end if;
                i_g1_low  := counter_low(output_counter_value(clk1_divide_by,
                             clk1_multiply_by,  i_m, i_n), clk1_duty_cycle);
                i_g2_low  := counter_low(output_counter_value(clk2_divide_by,
                             clk2_multiply_by,  i_m, i_n), clk2_duty_cycle);
                i_g3_low  := counter_low(output_counter_value(clk3_divide_by,
                             clk3_multiply_by,  i_m, i_n), clk3_duty_cycle);
                if (pll_type = "lvds") then
                    i_l0_low  := i_g0_low;
                    i_l1_low  := i_g0_low;
                else
                    i_l0_low  := counter_low(output_counter_value(clk4_divide_by,
                                 clk4_multiply_by,  i_m, i_n), clk4_duty_cycle);
                    i_l1_low  := counter_low(output_counter_value(clk5_divide_by,
                                 clk5_multiply_by,  i_m, i_n), clk5_duty_cycle);
                end if;
                i_e0_low  := counter_low(output_counter_value(extclk0_divide_by,
                             extclk0_multiply_by,  i_m, i_n), extclk0_duty_cycle);
                i_e1_low  := counter_low(output_counter_value(extclk1_divide_by,
                             extclk1_multiply_by,  i_m, i_n), extclk1_duty_cycle);
                i_e2_low  := counter_low(output_counter_value(extclk2_divide_by,
                             extclk2_multiply_by,  i_m, i_n), extclk2_duty_cycle);
                i_e3_low  := counter_low(output_counter_value(extclk3_divide_by,
                             extclk3_multiply_by,  i_m, i_n), extclk3_duty_cycle);
                i_m_initial  := counter_initial(get_phase_degree(max_neg_abs, inclk0_input_frequency), i_m,i_n);
                if (pll_type = "lvds") then
                    i_g0_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk2_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                else
                    i_g0_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk0_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                end if;
                i_g1_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk1_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_g2_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk2_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_g3_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk3_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                if (pll_type = "lvds") then
                    i_l0_initial := i_g0_initial;
                    i_l1_initial := i_g0_initial;
                else
                    i_l0_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk4_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                    i_l1_initial := counter_initial(get_phase_degree(ph_adjust(str2int(clk5_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                end if;
                i_e0_initial := counter_initial(get_phase_degree(ph_adjust(str2int(extclk0_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_e1_initial := counter_initial(get_phase_degree(ph_adjust(str2int(extclk1_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_e2_initial := counter_initial(get_phase_degree(ph_adjust(str2int(extclk2_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_e3_initial := counter_initial(get_phase_degree(ph_adjust(str2int(extclk3_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                if (pll_type = "lvds") then
                    i_g0_mode := counter_mode(clk2_duty_cycle, output_counter_value(clk2_divide_by, clk2_multiply_by,  i_m, i_n));
                else
                    i_g0_mode := counter_mode(clk0_duty_cycle, output_counter_value(clk0_divide_by, clk0_multiply_by,  i_m, i_n));
                end if;
                i_g1_mode := counter_mode(clk1_duty_cycle, output_counter_value(clk1_divide_by, clk1_multiply_by,  i_m, i_n));
                i_g2_mode := counter_mode(clk2_duty_cycle, output_counter_value(clk2_divide_by, clk2_multiply_by,  i_m, i_n));
                i_g3_mode := counter_mode(clk3_duty_cycle, output_counter_value(clk3_divide_by, clk3_multiply_by,  i_m, i_n));
                if (pll_type = "lvds") then
                    i_l0_mode := "bypass";
                    i_l1_mode := "bypass";
                else
                    i_l0_mode := counter_mode(clk4_duty_cycle, output_counter_value(clk4_divide_by, clk4_multiply_by,  i_m, i_n));
                    i_l1_mode := counter_mode(clk5_duty_cycle, output_counter_value(clk5_divide_by, clk5_multiply_by,  i_m, i_n));
                end if;
                i_e0_mode := counter_mode(extclk0_duty_cycle, output_counter_value(extclk0_divide_by, extclk0_multiply_by,  i_m, i_n));
                i_e1_mode := counter_mode(extclk1_duty_cycle, output_counter_value(extclk1_divide_by, extclk1_multiply_by,  i_m, i_n));
                i_e2_mode := counter_mode(extclk2_duty_cycle, output_counter_value(extclk2_divide_by, extclk2_multiply_by,  i_m, i_n));
                i_e3_mode := counter_mode(extclk3_duty_cycle, output_counter_value(extclk3_divide_by, extclk3_multiply_by,  i_m, i_n));

                -- in external feedback mode, need to adjust M value to take
                -- into consideration the external feedback counter value
                if(operation_mode = "external_feedback") then
                    -- if there is a negative phase shift, m_initial can
                    -- only be 1
                    if (max_neg_abs > 0) then
                        i_m_initial := 1;
                    end if;

                    -- calculate the feedback counter multiplier
                    if (feedback_source = "extclk0") then
                        if (i_e0_mode = "bypass") then
                            output_count := 1;
                        else
                            output_count := i_e0_high + i_e0_low;
                        end if;
                    elsif (feedback_source = "extclk1") then
                        if (i_e1_mode = "bypass") then
                            output_count := 1;
                        else
                            output_count := i_e1_high + i_e1_low;
                        end if;
                    elsif (feedback_source = "extclk2") then
                        if (i_e2_mode = "bypass") then
                            output_count := 1;
                        else
                            output_count := i_e2_high + i_e2_low;
                        end if;
                    elsif (feedback_source = "extclk3") then
                        if (i_e3_mode = "bypass") then
                            output_count := 1;
                        else
                            output_count := i_e3_high + i_e3_low;
                        end if;
                    else -- default to e0
                        if (i_e0_mode = "bypass") then
                            output_count := 1;
                        else
                            output_count := i_e0_high + i_e0_low;
                        end if;
                    end if;

                    if (i_m > output_count) then
                        i_m := i_m / output_count;
                    else
                        new_divisor := gcd(i_m, output_count);
                        i_m := i_m / new_divisor;
                        i_n := output_count / new_divisor;
                    end if;

                end if;
 
            else -- m /= 0

                i_n             := n;
                i_m             := m;
                i_m_initial     := m_initial;
                i_m_time_delay  := m_time_delay;
                i_n_time_delay  := n_time_delay;
                i_l0_time_delay := l0_time_delay;
                i_l1_time_delay := l1_time_delay;
                i_g0_time_delay := g0_time_delay;
                i_g1_time_delay := g1_time_delay;
                i_g2_time_delay := g2_time_delay;
                i_g3_time_delay := g3_time_delay;
                i_e0_time_delay := e0_time_delay;
                i_e1_time_delay := e1_time_delay;
                i_e2_time_delay := e2_time_delay;
                i_e3_time_delay := e3_time_delay;
                i_m_ph          := m_ph;
                i_l0_ph         := l0_ph;
                i_l1_ph         := l1_ph;
                i_g0_ph         := g0_ph;
                i_g1_ph         := g1_ph;
                i_g2_ph         := g2_ph;
                i_g3_ph         := g3_ph;
                i_e0_ph         := e0_ph;
                i_e1_ph         := e1_ph;
                i_e2_ph         := e2_ph;
                i_e3_ph         := e3_ph;
                i_l0_high       := l0_high;
                i_l1_high       := l1_high;
                i_g0_high       := g0_high;
                i_g1_high       := g1_high;
                i_g2_high       := g2_high;
                i_g3_high       := g3_high;
                i_e0_high       := e0_high;
                i_e1_high       := e1_high;
                i_e2_high       := e2_high;
                i_e3_high       := e3_high;
                i_l0_low        := l0_low;
                i_l1_low        := l1_low;
                i_g0_low        := g0_low;
                i_g1_low        := g1_low;
                i_g2_low        := g2_low;
                i_g3_low        := g3_low;
                i_e0_low        := e0_low;
                i_e1_low        := e1_low;
                i_e2_low        := e2_low;
                i_e3_low        := e3_low;
                i_l0_initial    := l0_initial;
                i_l1_initial    := l1_initial;
                i_g0_initial    := g0_initial;
                i_g1_initial    := g1_initial;
                i_g2_initial    := g2_initial;
                i_g3_initial    := g3_initial;
                i_e0_initial    := e0_initial;
                i_e1_initial    := e1_initial;
                i_e2_initial    := e2_initial;
                i_e3_initial    := e3_initial;
                i_l0_mode       := translate_string(l0_mode);
                i_l1_mode       := translate_string(l1_mode);
                i_g0_mode       := translate_string(g0_mode);
                i_g1_mode       := translate_string(g1_mode);
                i_g2_mode       := translate_string(g2_mode);
                i_g3_mode       := translate_string(g3_mode);
                i_e0_mode       := translate_string(e0_mode);
                i_e1_mode       := translate_string(e1_mode);
                i_e2_mode       := translate_string(e2_mode);
                i_e3_mode       := translate_string(e3_mode);

            end if; -- user to advanced conversion.

            m_initial_val <= i_m_initial;
            n_val <= i_n;
            m_val <= i_m;

            if (i_m = 1) then
                m_mode_val <= "bypass";
            end if;
            if (i_n = 1) then
                n_mode_val <= "bypass";
            end if;

            -- NOTE: m_time_delay (vco time delay) not supported for external
            --       feedback mode
            --       in feedback mode, m_time_delay = delay of feedback loop tap

            m_time_delay_val <= i_m_time_delay; 
            n_time_delay_val <= i_n_time_delay;

            m_ph_val  <= i_m_ph;

            m2_val <= m2;
            n2_val <= n2;
            if (m2 = 1) then
                m2_mode_val <= "bypass";
            end if;
            if (n2 = 1) then
                n2_mode_val <= "bypass";
            end if;

            if (skip_vco = "on") then
                m_val <= 1;
                m_initial_val <= 1;
                m_time_delay_val <= 0;
                m_ph_val <= 0;
            end if;

            l0_ph_val <= i_l0_ph;
            l1_ph_val <= i_l1_ph;
            g0_ph_val <= i_g0_ph;
            g1_ph_val <= i_g1_ph;
            g2_ph_val <= i_g2_ph;
            g3_ph_val <= i_g3_ph;
            e0_ph_val <= i_e0_ph;
            e1_ph_val <= i_e1_ph;
            e2_ph_val <= i_e2_ph;
            e3_ph_val <= i_e3_ph;

            l0_initial_val    <= i_l0_initial;
            l0_high_val       <= i_l0_high;
            l0_low_val        <= i_l0_low;
            l0_mode_val       <= i_l0_mode;
            l0_time_delay_val <= i_l0_time_delay;

            l1_initial_val    <= i_l1_initial;
            l1_high_val       <= i_l1_high;
            l1_low_val        <= i_l1_low;
            l1_mode_val       <= i_l1_mode;
            l1_time_delay_val <= i_l1_time_delay;

            g0_initial_val    <= i_g0_initial;
            g0_high_val       <= i_g0_high;
            g0_low_val        <= i_g0_low;
            g0_mode_val       <= i_g0_mode;
            g0_time_delay_val <= i_g0_time_delay;

            g1_initial_val    <= i_g1_initial;
            g1_high_val       <= i_g1_high;
            g1_low_val        <= i_g1_low;
            g1_mode_val       <= i_g1_mode;
            g1_time_delay_val <= i_g1_time_delay;

            g2_initial_val    <= i_g2_initial;
            g2_high_val       <= i_g2_high;
            g2_low_val        <= i_g2_low;
            g2_mode_val       <= i_g2_mode;
            g2_time_delay_val <= i_g2_time_delay;

            g3_initial_val    <= i_g3_initial;
            g3_high_val       <= i_g3_high;
            g3_low_val        <= i_g3_low;
            g3_mode_val       <= i_g3_mode;
            g3_time_delay_val <= i_g3_time_delay;

            if (scan_chain = "long") then
                e0_initial_val    <= i_e0_initial;
                e0_high_val       <= i_e0_high;
                e0_low_val        <= i_e0_low;
                e0_mode_val       <= i_e0_mode;
                e0_time_delay_val <= i_e0_time_delay;

                e1_initial_val    <= i_e1_initial;
                e1_high_val       <= i_e1_high;
                e1_low_val        <= i_e1_low;
                e1_mode_val       <= i_e1_mode;
                e1_time_delay_val <= i_e1_time_delay;

                e2_initial_val    <= i_e2_initial;
                e2_high_val       <= i_e2_high;
                e2_low_val        <= i_e2_low;
                e2_mode_val       <= i_e2_mode;
                e2_time_delay_val <= i_e2_time_delay;

                e3_initial_val    <= i_e3_initial;
                e3_high_val       <= i_e3_high;
                e3_low_val        <= i_e3_low;
                e3_mode_val       <= i_e3_mode;
                e3_time_delay_val <= i_e3_time_delay;

                scan_chain_length <= EGPP_SCAN_CHAIN;
            end if;
            init := false;
        elsif (transfer'event and transfer = '1') then
            reconfig_err <= false;
            ASSERT false REPORT "Reconfiguring PLL" severity note;
            if (scan_chain = "long") then
                -- cntr e3
                delay_chain := scan_data(287 downto 284);
                if (scan_data(273) = '1') then
                    e3_mode_val <= "bypass";
                    if (scan_data(283) = '1') then
                        e3_mode_val <= "   off";
                        ASSERT false REPORT "The specified bit settings will turn OFF the E3 counter. It cannot be turned on unless the part is re-initialized." severity warning;
                    end if;
                elsif (scan_data(283) = '1') then
                    e3_mode_val <= "   odd";
                else 
                    e3_mode_val <= "  even";
                end if;
                high := scan_data(272 downto 264);
                low := scan_data(282 downto 274);
                e3_low_val <= alt_conv_integer(low);
                e3_high_val <= alt_conv_integer(high);
                -- count value of 0 is actually 512
                if (alt_conv_integer(high) = 0) then
                    e3_high_val <= 512;
                end if;
                if (alt_conv_integer(low) = 0) then
                    e3_low_val <= 512;
                end if;
                delay_val := alt_conv_integer(delay_chain);
                delay_val := delay_val * 250;
                if (delay_val > 3000) then
                    delay_val := 3000;
                end if;
                e3_time_delay_val <= delay_val;
  
                -- cntr e2
                delay_chain := scan_data(263 downto 260);
                if (scan_data(249) = '1') then
                    e2_mode_val <= "bypass";
                    if (scan_data(259) = '1') then
                        e2_mode_val <= "   off";
                        ASSERT false REPORT "The specified bit settings will turn OFF the E2 counter. It cannot be turned on unless the part is re-initialized." severity warning;
                    end if;
                elsif (scan_data(259) = '1') then
                    e2_mode_val <= "   odd";
                else 
                    e2_mode_val <= "  even";
                end if;
                high := scan_data(248 downto 240);
                low := scan_data(258 downto 250);
                e2_low_val <= alt_conv_integer(low);
                e2_high_val <= alt_conv_integer(high);
                if (alt_conv_integer(high) = 0) then
                    e2_high_val <= 512;
                end if;
                if (alt_conv_integer(low) = 0) then
                    e2_low_val <= 512;
                end if;
                delay_val := alt_conv_integer(delay_chain);
                delay_val := delay_val * 250;
                if (delay_val > 3000) then
                    delay_val := 3000;
                end if;
                e2_time_delay_val <= delay_val;

                -- cntr e1
                delay_chain := scan_data(239 downto 236);
                if (scan_data(225) = '1') then
                    e1_mode_val <= "bypass";
                    if (scan_data(235) = '1') then
                        e1_mode_val <= "   off";
                        ASSERT false REPORT "The specified bit settings will turn OFF the E1 counter. It cannot be turned on unless the part is re-initialized." severity warning;
                    end if;
                elsif (scan_data(235) = '1') then
                    e1_mode_val <= "   odd";
                else 
                    e1_mode_val <= "  even";
                end if;
                high := scan_data(224 downto 216);
                low := scan_data(234 downto 226);
                e1_low_val <= alt_conv_integer(low);
                e1_high_val <= alt_conv_integer(high);
                if (alt_conv_integer(high) = 0) then
                    e1_high_val <= 512;
                end if;
                if (alt_conv_integer(low) = 0) then
                    e1_low_val <= 512;
                end if;
                delay_val := alt_conv_integer(delay_chain);
                delay_val := delay_val * 250;
                if (delay_val > 3000) then
                    delay_val := 3000;
                 end if;
                 e1_time_delay_val <= delay_val;

                 -- cntr e0
                 delay_chain := scan_data(215 downto 212);
                 if (scan_data(201) = '1') then
                     e0_mode_val <= "bypass";
                     if (scan_data(211) = '1') then
                         e0_mode_val <= "   off";
                        ASSERT false REPORT "The specified bit settings will turn OFF the E0 counter. It cannot be turned on unless the part is re-initialized." severity warning;
                     end if;
                 elsif (scan_data(211) = '1') then
                     e0_mode_val <= "   odd";
                 else 
                     e0_mode_val <= "  even";
                 end if;
                 high := scan_data(200 downto 192);
                 low := scan_data(210 downto 202);
                 e0_low_val <= alt_conv_integer(low);
                 e0_high_val <= alt_conv_integer(high);
                if (alt_conv_integer(high) = 0) then
                    e0_high_val <= 512;
                end if;
                if (alt_conv_integer(low) = 0) then
                    e0_low_val <= 512;
                end if;
                 delay_val := alt_conv_integer(delay_chain);
                 delay_val := delay_val * 250;
                 if (delay_val > 3000) then
                     delay_val := 3000;
                 end if;
            e0_time_delay_val <= delay_val;
 
         end if;
            -- cntr l1
            delay_chain := scan_data(191 downto 188);
            if (scan_data(177) = '1') then
               l1_mode_val <= "bypass";
               if (scan_data(187) = '1') then
                  l1_mode_val <= "   off";
                  ASSERT false REPORT "The specified bit settings will turn OFF the L1 counter. It cannot be turned on unless the part is re-initialized." severity warning;
               end if;
            elsif (scan_data(187) = '1') then
               l1_mode_val <= "   odd";
            else 
               l1_mode_val <= "  even";
            end if;
            high := scan_data(176 downto 168);
            low := scan_data(186 downto 178);
            l1_low_val <= alt_conv_integer(low);
            l1_high_val <= alt_conv_integer(high);
            if (alt_conv_integer(high) = 0) then
                l1_high_val <= 512;
            end if;
            if (alt_conv_integer(low) = 0) then
                l1_low_val <= 512;
            end if;
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            l1_time_delay_val <= delay_val;

            -- cntr l0
            delay_chain := scan_data(167 downto 164);
            if (scan_data(153) = '1') then
               l0_mode_val <= "bypass";
               if (scan_data(163) = '1') then
                  l0_mode_val <= "   off";
                  ASSERT false REPORT "The specified bit settings will turn OFF the L0 counter. It cannot be turned on unless the part is re-initialized." severity warning;
               end if;
            elsif (scan_data(163) = '1') then
               l0_mode_val <= "   odd";
            else 
               l0_mode_val <= "  even";
            end if;
            high := scan_data(152 downto 144);
            low := scan_data(162 downto 154);
            l0_low_val <= alt_conv_integer(low);
            l0_high_val <= alt_conv_integer(high);
            if (alt_conv_integer(high) = 0) then
                l0_high_val <= 512;
            end if;
            if (alt_conv_integer(low) = 0) then
                l0_low_val <= 512;
            end if;
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            l0_time_delay_val <= delay_val;

            -- cntr g3
            delay_chain := scan_data(143 downto 140);
            if (scan_data(129) = '1') then
               g3_mode_val <= "bypass";
               if (scan_data(139) = '1') then
                  g3_mode_val <= "   off";
                  ASSERT false REPORT "The specified bit settings will turn OFF the G3 counter. It cannot be turned on unless the part is re-initialized." severity warning;
               end if;
            elsif (scan_data(139) = '1') then
               g3_mode_val <= "   odd";
            else 
               g3_mode_val <= "  even";
            end if;
            high := scan_data(128 downto 120);
            low := scan_data(138 downto 130);
            g3_low_val <= alt_conv_integer(low);
            g3_high_val <= alt_conv_integer(high);
            if (alt_conv_integer(high) = 0) then
                g3_high_val <= 512;
            end if;
            if (alt_conv_integer(low) = 0) then
                g3_low_val <= 512;
            end if;
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            g3_time_delay_val <= delay_val;

            -- cntr g2
            delay_chain := scan_data(119 downto 116);
            if (scan_data(105) = '1') then
               g2_mode_val <= "bypass";
               if (scan_data(115) = '1') then
                  g2_mode_val <= "   off";
                  ASSERT false REPORT "The specified bit settings will turn OFF the G2 counter. It cannot be turned on unless the part is re-initialized." severity warning;
               end if;
            elsif (scan_data(115) = '1') then
               g2_mode_val <= "   odd";
            else 
               g2_mode_val <= "  even";
            end if;
            high := scan_data(104 downto 96);
            low := scan_data(114 downto 106);
            g2_low_val <= alt_conv_integer(low);
            g2_high_val <= alt_conv_integer(high);
            if (alt_conv_integer(high) = 0) then
                g2_high_val <= 512;
            end if;
            if (alt_conv_integer(low) = 0) then
                g2_low_val <= 512;
            end if;
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            g2_time_delay_val <= delay_val;

            -- cntr g1
            delay_chain := scan_data(95 downto 92);
            if (scan_data(81) = '1') then
               g1_mode_val <= "bypass";
               if (scan_data(91) = '1') then
                  g1_mode_val <= "   off";
                  ASSERT false REPORT "The specified bit settings will turn OFF the G1 counter. It cannot be turned on unless the part is re-initialized." severity warning;
               end if;
            elsif (scan_data(91) = '1') then
               g1_mode_val <= "   odd";
            else 
               g1_mode_val <= "  even";
            end if;
            high := scan_data(80 downto 72);
            low := scan_data(90 downto 82);
            g1_low_val <= alt_conv_integer(low);
            g1_high_val <= alt_conv_integer(high);
            if (alt_conv_integer(high) = 0) then
                g1_high_val <= 512;
            end if;
            if (alt_conv_integer(low) = 0) then
                g1_low_val <= 512;
            end if;
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            g1_time_delay_val <= delay_val;

            -- cntr g0
            delay_chain := scan_data(71 downto 68);
            if (scan_data(57) = '1') then
               g0_mode_val <= "bypass";
               if (scan_data(67) = '1') then
                  g0_mode_val <= "   off";
                  ASSERT false REPORT "The specified bit settings will turn OFF the G0 counter. It cannot be turned on unless the part is re-initialized." severity warning;
               end if;
            elsif (scan_data(67) = '1') then
               g0_mode_val <= "   odd";
            else 
               g0_mode_val <= "  even";
            end if;
            high := scan_data(56 downto 48);
            low := scan_data(66 downto 58);
            g0_low_val <= alt_conv_integer(low);
            g0_high_val <= alt_conv_integer(high);
            if (alt_conv_integer(high) = 0) then
                g0_high_val <= 512;
            end if;
            if (alt_conv_integer(low) = 0) then
                g0_low_val <= 512;
            end if;
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            g0_time_delay_val <= delay_val;

            -- cntr M
            is_error := false;
            -- 'low' contains modulus for m_cntr(spread_spectrum disabled)
            low := scan_data(32 downto 24);
            m_val <= alt_conv_integer(low);
            if (scan_data(33) /= '1') then
                if (alt_conv_integer(low) = 1) then
                    is_error := true;
                    reconfig_err <= true;
                    ASSERT false REPORT "Illegal 1 value for M counter. Instead, M counter should be BYPASSED. Reconfiguration may not work." severity warning;
                elsif (alt_conv_integer(low) = 0) then
                    m_val <= 512;
                end if;
                if (not is_error) then
                    if (m_mode_val = "bypass") then
                        ASSERT false REPORT "M counter switched from BYPASS mode to enabled (M modulus = " &int2str(alt_conv_integer(low))& "). PLL may lose lock." severity warning;
                    else
                        ASSERT FALSE REPORT "M modulus = " &int2str(alt_conv_integer(low))& " "severity note;
                    end if;
                    m_mode_val <= "      ";
                end if;
            elsif (scan_data(33) = '1') then
                if (scan_data(24) /= '0') then
                    is_error := true;
                    reconfig_err <= true;
                    ASSERT false REPORT "Illegal value for M counter in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work." severity warning;
                else
                    if (m_mode_val /= "bypass") then
                        ASSERT false REPORT "M counter switched from enabled to BYPASS mode. PLL may lose lock." severity warning;
                    end if;
                    ASSERT FALSE REPORT "M modulus = " &int2str(1)& " "severity note;
                    m_val <= 1;
                    m_mode_val <= "bypass";
                end if;
            end if;

            if (skip_vco = "on") then
                m_val <= 1;
                ASSERT FALSE REPORT "VCO is bypassed, setting M modulus = 1, M time delay = 0" severity note;
            end if;

            -- cntr M2
            if (ss > 0) then
                is_error := false;
                low := scan_data(42 downto 34);
                m2_val <= alt_conv_integer(low);
                if (scan_data(43) /= '1') then
                    if (alt_conv_integer(low) = 1) then
                        is_error := true;
                        reconfig_err <= true;
                        ASSERT false REPORT "Illegal 1 value for M2 counter. Instead, M counter should be BYPASSED. Reconfiguration may not work." severity warning;
                    elsif (alt_conv_integer(low) = 0) then
                        m2_val <= 512;
                    end if;
                    if (not is_error) then
                        if (m2_mode_val = "bypass") then
                            ASSERT false REPORT "M2 counter switched from BYPASS mode to enabled (M2 modulus = " &int2str(alt_conv_integer(low))& "). PLL may lose lock." severity warning;
                        else
                            ASSERT FALSE REPORT "M2 modulus = " &int2str(alt_conv_integer(low))& " "severity note;
                        end if;
                        m2_mode_val <= "      ";
                    end if;
                elsif (scan_data(43) = '1') then
                    if (scan_data(34) /= '0') then
                        is_error := true;
                        reconfig_err <= true;
                        ASSERT false REPORT "Illegal value for M2 counter in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work." severity warning;
                    else
                        if (m2_mode_val /= "bypass") then
                            ASSERT false REPORT "M2 counter switched from enabled to BYPASS mode. PLL may lose lock." severity warning;
                        end if;
                        ASSERT FALSE REPORT "M2 modulus = " &int2str(1)& " "severity note;
                        m2_val <= 1;
                        m2_mode_val <= "bypass";
                    end if;
                end if;
                if (m_mode_val /= m2_mode_val) then
                    is_error := true;
                    reconfig_err <= true;
                    ASSERT false REPORT "Incompatible modes for M1/M2 counters. Either both should be BYPASSED or both NON-BYPASSED. Reconfiguration may not work." severity warning;
                end if;
            end if;

            delay_chain := scan_data(47 downto 44);
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            m_time_delay_val <= delay_val;
            if (skip_vco = "on") then
                m_time_delay_val <= 0;
                delay_val := 0;
            end if;
            ASSERT FALSE REPORT " M time delay = " &int2str(delay_val)& " "severity note;

            -- cntr N
            is_error := false;
            -- 'low' contains modulus for n_cntr(spread_spectrum disabled)
            low := scan_data(8 downto 0);
            n_val <= alt_conv_integer(low);
            if (scan_data(9) /= '1') then
                if (alt_conv_integer(low) = 1) then
                    is_error := true;
                    reconfig_err <= true;
                    ASSERT false REPORT "Illegal 1 value for N counter. Instead, N counter should be BYPASSED. Reconfiguration may not work." severity warning;
                elsif (alt_conv_integer(low) = 0) then
                    n_val <= 512;
                    ASSERT FALSE REPORT "N modulus = " &int2str(512)& " "severity note;
                else
                    ASSERT FALSE REPORT "N modulus = " &int2str(alt_conv_integer(low))& " "severity note;
                end if;
                if (not is_error) then
                    if (n_mode_val = "bypass") then
                        ASSERT false REPORT "N Counter switched from BYPASS mode to enabled (N modulus = " &int2str(alt_conv_integer(low))& "). PLL may lose lock." severity warning;
                    else
                        ASSERT FALSE REPORT "N modulus = " &int2str(alt_conv_integer(low))& " "severity note;
                    end if;
                    n_mode_val <= "      ";
                end if;
            elsif (scan_data(9) = '1') then
                if (scan_data(0) /= '0') then
                    is_error := true;
                    reconfig_err <= true;
                    ASSERT false REPORT "Illegal value for N counter in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work." severity warning;
                else
                    if (n_mode_val /= "bypass") then
                        ASSERT false REPORT "N counter switched from enabled to BYPASS mode. PLL may lose lock." severity warning;
                    end if;
                    ASSERT FALSE REPORT "N modulus = " &int2str(1)& " "severity note;
                    n_val <= 1;
                    n_mode_val <= "bypass";
                end if;
            end if;

            -- cntr N2
            if (ss > 0) then
                is_error := false;
                low := scan_data(18 downto 10);
                n2_val <= alt_conv_integer(low);
                if (scan_data(19) /= '1') then
                    if (alt_conv_integer(low) = 1) then
                        is_error := true;
                        reconfig_err <= true;
                        ASSERT false REPORT "Illegal 1 value for N2 counter. Instead, N counter should be BYPASSED. Reconfiguration may not work." severity warning;
                    elsif (alt_conv_integer(low) = 0) then
                        n2_val <= 512;
                    end if;
                    if (not is_error) then
                        if (n2_mode_val = "bypass") then
                            ASSERT false REPORT "N2 counter switched from BYPASS mode to enabled (N2 modulus = " &int2str(alt_conv_integer(low))& "). PLL may lose lock." severity warning;
                        else
                            ASSERT FALSE REPORT "N2 modulus = " &int2str(alt_conv_integer(low))& " "severity note;
                        end if;
                        n2_mode_val <= "      ";
                    end if;
                elsif (scan_data(19) = '1') then
                    if (scan_data(10) /= '0') then
                        is_error := true;
                        reconfig_err <= true;
                        ASSERT false REPORT "Illegal value for N2 counter in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work." severity warning;
                    else
                        if (n2_mode_val /= "bypass") then
                            ASSERT false REPORT "N2 counter switched from enabled to BYPASS mode. PLL may lose lock." severity warning;
                        end if;
                        ASSERT FALSE REPORT "N2 modulus = " &int2str(1)& " "severity note;
                        n2_val <= 1;
                        n2_mode_val <= "bypass";
                    end if;
                end if;
                if (n_mode_val /= n2_mode_val) then
                    is_error := true;
                    reconfig_err <= true;
                    ASSERT false REPORT "Incompatible modes for N1/N2 counters. Either both should be BYPASSED or both NON-BYPASSED. Reconfiguration may not work." severity warning;
                end if;
            end if;

            delay_chain := scan_data(23 downto 20);
            delay_val := alt_conv_integer(delay_chain);
            delay_val := delay_val * 250;
            if (delay_val > 3000) then
               delay_val := 3000;
            end if;
            n_time_delay_val <= delay_val;
            ASSERT FALSE REPORT " N time delay = " &int2str(delay_val)& " "severity note;

      else

         if (scan_chain = "long") then
            ASSERT false REPORT "E3 high = "& int2str(e3_high_val) & 
                                ", E3 low = "& int2str(e3_low_val) & 
                                ", E3 mode = "& e3_mode_val & 
                                ",  E3 time delay = "& int2str(e3_time_delay_val) & 
                                " "severity note;
            ASSERT false REPORT "E2 high = "& int2str(e2_high_val) & 
                                ", E2 low = "& int2str(e2_low_val) & 
                                ", E2 mode = "& e2_mode_val & 
                                ",  E2 time delay = "& int2str(e2_time_delay_val) & 
                                " "severity note;
            ASSERT false REPORT "E1 high = "& int2str(e1_high_val) & 
                                ", E1 low = "& int2str(e1_low_val) & 
                                ", E1 mode = "& e1_mode_val & 
                                ",  E1 time delay = "& int2str(e1_time_delay_val) & 
                                " "severity note;
            ASSERT false REPORT "E0 high = "& int2str(e0_high_val) & 
                                ", E0 low = "& int2str(e0_low_val) & 
                                ", E0 mode = "& e0_mode_val & 
                                ",  E0 time delay = "& int2str(e0_time_delay_val) & 
                                " "severity note;
         end if;

         ASSERT false REPORT "L1 high = "& int2str(l1_high_val) & 
                             ", L1 low = "& int2str(l1_low_val) & 
                             ", l1 mode = "& l1_mode_val & 
                             ",  l1 time delay = "& int2str(l1_time_delay_val) & 
                             " "severity note;
         ASSERT false REPORT "L0 high = "& int2str(l0_high_val) & 
                             ", L0 low = "& int2str(l0_low_val) & 
                             ", l0 mode = "& l0_mode_val & 
                             ",  l0 time delay = "& int2str(l0_time_delay_val) & 
                             " "severity note;
         ASSERT false REPORT "G3 high = "& int2str(g3_high_val) & 
                             ", G3 low = "& int2str(g3_low_val) & 
                             ", G3 mode = "& g3_mode_val & 
                             ",  G3 time delay = "& int2str(g3_time_delay_val) & 
                             " "severity note;
         ASSERT false REPORT "G2 high = "& int2str(g2_high_val) & 
                             ", G2 low = "& int2str(g2_low_val) & 
                             ", G2 mode = "& g2_mode_val & 
                             ",  G2 time delay = "& int2str(g2_time_delay_val) & 
                             " "severity note;
         ASSERT false REPORT "G1 high = "& int2str(g1_high_val) & 
                             ", G1 low = "& int2str(g1_low_val) & 
                             ", G1 mode = "& g1_mode_val & 
                             ",  G1 time delay = "& int2str(g1_time_delay_val) & 
                             " "severity note;
         ASSERT false REPORT "G0 high = "& int2str(g0_high_val) & 
                             ", G0 low = "& int2str(g0_low_val) & 
                             ", G0 mode = "& g0_mode_val & 
                             ",  G0 time delay = "& int2str(g0_time_delay_val) & 
                             " "severity note;
      end if;
   end process;

    process (schedule_vco, areset_ipd, ena_ipd, pfdena_ipd, refclk, fbclk)
    variable sched_time : time := 0 ps;

    TYPE time_array is ARRAY (0 to 7) of time;
    variable init : boolean := true;
    variable refclk_period : time;
    variable primary_clock_frequency : time;
    variable m_times_vco_period : time;
    variable new_m_times_vco_period : time;

    variable phase_shift : time_array := (OTHERS => 0 ps);
    variable last_phase_shift : time_array := (OTHERS => 0 ps);

    variable l_index : integer := 1;
    variable cycle_to_adjust : integer := 0;

    variable stop_vco : boolean := false;

    variable locked_tmp : std_logic := '0';
    variable pll_is_locked : boolean := false;
    variable pll_about_to_lock : boolean := false;
    variable cycles_to_lock : integer := 0;
    variable cycles_to_unlock : integer := 0;

    variable got_first_refclk : boolean := false;
    variable got_second_refclk : boolean := false;
    variable got_first_fbclk : boolean := false;

    variable refclk_time : time := 0 ps;
    variable fbclk_time : time := 0 ps;
    variable first_fbclk_time : time := 0 ps;

    variable fbclk_period : time := 0 ps;

    variable first_schedule : boolean := true;
    variable schedule_offset : boolean := true;

    variable vco_val : std_logic := '0';
    variable vco_period_was_phase_adjusted : boolean := false;
    variable phase_adjust_was_scheduled : boolean := false;

    variable loop_xplier : integer;
    variable loop_initial : integer := 0;
    variable loop_ph : integer := 0;
    variable loop_time_delay : integer := 0;

    variable initial_delay : time := 0 ps;
    variable vco_per : time;
    variable tmp_rem : integer;
    variable my_rem : integer;
    variable fbk_phase : integer := 0;

    variable pull_back_ext_fbk_cntr : integer := 0;
    variable pull_back_M : integer := 0;
    variable total_pull_back : integer := 0;
    variable fbk_delay : integer := 0;

    variable offset : time := 0 ps;

    variable tmp_vco_per : integer := 0;
    variable high_time : time;
    variable low_time : time;

    variable got_refclk_posedge : boolean := false;
    variable got_fbclk_posedge : boolean := false;
    variable inclk_out_of_range : boolean := false;
    variable no_warn : boolean := false;
    variable init_clks : boolean := true;
    variable ext_fbk_cntr_modulus : integer := 1;
    begin
        if (init) then
            if (pll_type = "fast") then
                locked_tmp := '1';
            end if;

            -- jump-start the VCO
            -- add 1 ps delay to ensure all signals are updated to initial
            -- values
            schedule_vco <= transport not schedule_vco after 1 ps;

            init := false;
        end if;

        if (schedule_vco'event) then
            if (init_clks) then
                if (primary_clock = "inclk0") then
                    refclk_period := inclk0_input_frequency * n_val * 1 ps;
                    primary_clock_frequency := inclk0_input_frequency * 1 ps;
                elsif (primary_clock = "inclk1") then
                    refclk_period := inclk1_input_frequency * n_val * 1 ps;
                    primary_clock_frequency := inclk1_input_frequency * 1 ps;
                end if;

                m_times_vco_period := refclk_period;
                new_m_times_vco_period := refclk_period;
                init_clks := false;
            end if;
            sched_time := 0 ps;
            for i in 0 to 7 loop
                last_phase_shift(i) := phase_shift(i);
            end loop;
            cycle_to_adjust := 0;
            l_index := 1;
            m_times_vco_period := new_m_times_vco_period;
        end if;

        -- areset was asserted
        if (areset_ipd'event and areset_ipd = '1') then
            assert false report "Stratix PLL was reset" severity note;
        end if;

        -- ena was deasserted
        if (ena_ipd'event and ena_ipd = '0') then
            assert false report "Stratix PLL was disabled" severity note;
        end if;

        if (schedule_vco'event and (areset_ipd = '1' or ena_ipd = '0' or stop_vco)) then

            -- drop VCO taps to 0
            for i in 0 to 7 loop
                vco_out(i) <= transport '0' after last_phase_shift(i);
                phase_shift(i) := 0 ps;
                last_phase_shift(i) := 0 ps;
            end loop;

            -- reset lock parameters
            locked_tmp := '0';
            if (pll_type = "fast") then
                locked_tmp := '1';
            end if;
            pll_is_locked := false;
            pll_about_to_lock := false;
            cycles_to_lock := 0;
            cycles_to_unlock := 0;

            got_first_refclk := false;
            got_second_refclk := false;
            refclk_time := 0 ps;
            got_first_fbclk := false;
            fbclk_time := 0 ps;
            first_fbclk_time := 0 ps;
            fbclk_period := 0 ps;

            first_schedule := true;
            schedule_offset := true;
            vco_val := '0';
            vco_period_was_phase_adjusted := false;
            phase_adjust_was_scheduled := false;

        elsif ((schedule_vco'event or ena_ipd'event or areset_ipd'event) and areset_ipd = '0' and ena_ipd = '1' and (not stop_vco) and (now > 0 ps)) then

            -- note areset deassert time
            -- note it as refclk_time to prevent false triggering
            -- of stop_vco after areset
            if (areset_ipd'event and areset_ipd = '0') then
                refclk_time := now;
            end if;


            -- calculate loop_xplier : this will be different from m_val
            -- in external_feedback_mode
            loop_xplier := m_val;
            loop_initial := m_initial_val - 1;
            loop_ph := m_ph_val;
            loop_time_delay := m_time_delay_val;

            if (operation_mode = "external_feedback") then
                if (ext_fbk_cntr_mode = "bypass") then
                    ext_fbk_cntr_modulus := 1;
                else
                    ext_fbk_cntr_modulus := ext_fbk_cntr_high + ext_fbk_cntr_low;
                end if;

                loop_xplier := m_val * (ext_fbk_cntr_modulus);
                loop_ph := ext_fbk_cntr_ph;
                loop_initial := ext_fbk_cntr_initial - 1 + ((m_initial_val - 1) * (ext_fbk_cntr_modulus));
                loop_time_delay := m_time_delay_val + ext_fbk_cntr_delay;
            end if;

            -- convert initial value to delay
            initial_delay := (loop_initial * m_times_vco_period)/loop_xplier;

            -- convert loop ph_tap to delay
            my_rem := (m_times_vco_period/1 ps) rem loop_xplier;
            tmp_vco_per := (m_times_vco_period/1 ps) / loop_xplier;
            if (my_rem /= 0) then
                tmp_vco_per := tmp_vco_per + 1;
            end if;
            fbk_phase := (loop_ph * tmp_vco_per)/8;

            if (operation_mode = "external_feedback") then
                pull_back_ext_fbk_cntr :=  ext_fbk_cntr_delay + (ext_fbk_cntr_initial - 1) * (m_times_vco_period/loop_xplier)/1 ps + fbk_phase;
                while (pull_back_ext_fbk_cntr > refclk_period/1 ps) loop
                    pull_back_ext_fbk_cntr := pull_back_ext_fbk_cntr - refclk_period/ 1 ps;
                end loop;
                pull_back_M :=  m_time_delay_val + (m_initial_val - 1) * (ext_fbk_cntr_modulus) * ((refclk_period/loop_xplier)/1 ps);
                while (pull_back_M > refclk_period/1 ps) loop
                    pull_back_M := pull_back_M - refclk_period/ 1 ps;
                end loop;
            else
                pull_back_ext_fbk_cntr := 0;
                pull_back_M := initial_delay/1 ps + m_time_delay_val + fbk_phase;
            end if;

            total_pull_back := pull_back_M + pull_back_ext_fbk_cntr;

            if (simulation_type = "timing") then
                total_pull_back := total_pull_back + pll_compensation_delay;
            end if;
            while (total_pull_back > refclk_period/1 ps) loop
                total_pull_back := total_pull_back - refclk_period/1 ps;
            end loop;

            if (total_pull_back > 0) then
                offset := refclk_period - (total_pull_back * 1 ps);
            end if;
            if (operation_mode = "external_feedback") then
                fbk_delay := pull_back_M;
                if (simulation_type = "timing") then
                    fbk_delay := fbk_delay + pll_compensation_delay;
                end if;
                ext_fbk_delay <= transport (pull_back_ext_fbk_cntr - fbk_phase) after 1 ps;
            else
                fbk_delay := total_pull_back - fbk_phase;
                if (fbk_delay < 0) then
                    offset := offset - (fbk_phase * 1 ps);
                    fbk_delay := total_pull_back;
                end if;
            end if;

            -- assign m_delay
            m_delay <= transport fbk_delay after 1 ps;

            my_rem := (m_times_vco_period/1 ps) rem loop_xplier;
            for i in 1 to loop_xplier loop
                -- adjust cycles
                tmp_vco_per := (m_times_vco_period/1 ps)/loop_xplier;
                if (my_rem /= 0 and l_index <= my_rem) then
                   tmp_rem := (loop_xplier * l_index) rem my_rem;
                   cycle_to_adjust := (loop_xplier * l_index) / my_rem;
                   if (tmp_rem /= 0) then
                      cycle_to_adjust := cycle_to_adjust + 1;
                   end if;
                end if;
                if (cycle_to_adjust = i) then
                    tmp_vco_per := tmp_vco_per + 1;
                    l_index := l_index + 1;
                end if;

                -- calculate high and low periods
                vco_per := tmp_vco_per * 1 ps;
                high_time := (tmp_vco_per/2) * 1 ps;
                if (tmp_vco_per rem 2 /= 0) then
                   high_time := high_time + 1 ps;
                end if;
                low_time := vco_per - high_time;

                -- schedule the rising and falling edges
                for j in 1 to 2 loop
                   vco_val := not vco_val;
                   if (vco_val = '0') then
                      sched_time := sched_time + high_time;
                   elsif (vco_val = '1') then
                      sched_time := sched_time + low_time;
                   end if;

                   -- add offset
                   if (schedule_offset) then
                       sched_time := sched_time + offset;
                       schedule_offset := false;
                   end if;

                   -- schedule the phase taps
                   for k in 0 to 7 loop
                       phase_shift(k) := (k * vco_per)/8;
                       if (first_schedule) then
                          vco_out(k) <= transport vco_val after (sched_time + phase_shift(k));
                       else
                          vco_out(k) <= transport vco_val after (sched_time + last_phase_shift(k));
                       end if;
                   end loop;
                end loop;
            end loop;

            -- schedule once more
            if (first_schedule) then
                vco_val := not vco_val;
                if (vco_val = '0') then
                   sched_time := sched_time + high_time;
                elsif (vco_val = '1') then
                   sched_time := sched_time + low_time;
                end if;
                -- schedule the phase taps
                for k in 0 to 7 loop
                    phase_shift(k) := (k * vco_per)/8;
                    vco_out(k) <= transport vco_val after (sched_time + phase_shift(k));
                end loop;
                first_schedule := false;
            end if;

            schedule_vco <= transport not schedule_vco after sched_time;

            if (vco_period_was_phase_adjusted) then
                m_times_vco_period := refclk_period;
                new_m_times_vco_period := refclk_period;
                vco_period_was_phase_adjusted := false;
                phase_adjust_was_scheduled := true;

                vco_per := m_times_vco_period/loop_xplier;
                for k in 0 to 7 loop
                    phase_shift(k) := (k * vco_per)/8;
                end loop;
            end if;
        end if;

        if (refclk'event and refclk = '1' and areset_ipd = '0') then
            got_refclk_posedge := true;
            if (not got_first_refclk) then
                got_first_refclk := true;
            else
                got_second_refclk := true;
                refclk_period := now - refclk_time;

                -- check if incoming freq. will cause VCO range to be
                -- exceeded
                if ( (vco_max /= 0 and vco_min /= 0 and skip_vco = "off" and pfdena_ipd = '1') and
                     (((refclk_period/1 ps)/loop_xplier > vco_max) or
                      ((refclk_period/1 ps)/loop_xplier < vco_min)) ) then
                    if (pll_is_locked) then
                        assert false report " Input clock freq. is not within VCO range : PLL may lose lock" severity warning;
                    else
                        assert false report " Input clock freq. is not within VCO range : PLL may not lock. Please use the correct frequency." severity warning;
                    end if;
                    inclk_out_of_range := true;
                elsif (vco_min = 0 and vco_max = 0 and pll_type = "cdr") then
                    if (refclk_period /= primary_clock_frequency) then
                        if (not no_warn) then
                            assert false report "Incoming clock period " & int2str(refclk_period/1 ps) & " ps for PLL does not match the specified inclock period " & int2str(primary_clock_frequency/1 ps) & " ps. ALTGXB simulation may not function correctly. " severity warning;
                            no_warn := true;
                        end if;
                    end if;
                else
                    inclk_out_of_range := false;
                end if;
            end if;

            if (stop_vco) then
                stop_vco := false;
                schedule_vco <= not schedule_vco;
            end if;

            refclk_time := now;
        else
            got_refclk_posedge := false;
        end if;

        if (fbclk'event and fbclk = '1') then
            got_fbclk_posedge := true;
            if (not got_first_fbclk) then
                got_first_fbclk := true;
            else
                fbclk_period := now - fbclk_time;
            end if;

            -- need refclk_period here, so initialized to proper value above
            if ( (now - refclk_time > 1.5 * refclk_period) and pfdena_ipd = '1') then
                stop_vco := true;
                -- reset
                got_first_refclk := false;
                got_first_fbclk := false;
                got_second_refclk := false;
                if (pll_is_locked) then
                    pll_is_locked := false;
                    locked_tmp := '0';
                    if (pll_type = "fast") then
                        locked_tmp := '1';
                    end if;
                    assert false report "Stratix PLL lost lock due to loss of input clock" severity note;
                end if;
                pll_about_to_lock := false;
                cycles_to_lock := 0;
                cycles_to_unlock := 0;
                first_schedule := true;
            end if;
            fbclk_time := now;
        else
            got_fbclk_posedge := false;
        end if;

        if ((got_refclk_posedge or got_fbclk_posedge) and got_second_refclk and pfdena_ipd = '1' and (not inclk_out_of_range)) then

            -- now we know actual incoming period
            if ( abs(fbclk_time - refclk_time) <= 5 ps or
                 (got_first_fbclk and abs(refclk_period - abs(fbclk_time - refclk_time)) <= 5 ps)) then
                -- considered in phase
                if (cycles_to_lock = valid_lock_multiplier - 1) then
                    pll_about_to_lock := true;
                end if;
                if (cycles_to_lock = valid_lock_multiplier) then
                    if (not pll_is_locked) then
                        assert (quiet_period_violation) report "Stratix PLL locked to incoming clock" severity note;
                    end if;
                    pll_is_locked := true;
                    locked_tmp := '1';
                    if (pll_type = "fast") then
                        locked_tmp := '0';
                    end if;
                end if;
                -- increment lock counter only if second part of above
                -- time check is NOT true
                if (not(abs(refclk_period - abs(fbclk_time - refclk_time)) <= 5 ps)) then
                    cycles_to_lock := cycles_to_lock + 1;
                end if;

                -- adjust m_times_vco_period
                new_m_times_vco_period := refclk_period;
            else
                -- if locked, begin unlock
                if (pll_is_locked) then
                    cycles_to_unlock := cycles_to_unlock + 1;
                    if (cycles_to_unlock = invalid_lock_multiplier) then
                        pll_is_locked := false;
                        locked_tmp := '0';
                        if (pll_type = "fast") then
                            locked_tmp := '1';
                        end if;
                        pll_about_to_lock := false;
                        cycles_to_lock := 0;
                        assert (quiet_period_violation) report "Stratix PLL lost lock" severity note;
                        first_schedule := true;
                        schedule_offset := true;
                        vco_period_was_phase_adjusted := false;
                        phase_adjust_was_scheduled := false;
                    end if;
                end if;
                if ( abs(refclk_period - fbclk_period) <= 2 ps ) then
                    -- frequency is still good
                    if (now = fbclk_time and (not phase_adjust_was_scheduled)) then
                        if ( abs(fbclk_time - refclk_time) > refclk_period/2) then
                            new_m_times_vco_period := m_times_vco_period + (refclk_period - abs(fbclk_time - refclk_time));
                            vco_period_was_phase_adjusted := true;
                        else
                            new_m_times_vco_period := m_times_vco_period - abs(fbclk_time - refclk_time);
                            vco_period_was_phase_adjusted := true;
                        end if;

                    end if;
                else
                    phase_adjust_was_scheduled := false;
                    new_m_times_vco_period := refclk_period;
                end if;
            end if;
        end if;

        if (pfdena_ipd = '0') then
            locked_tmp := 'X';
            pll_is_locked := false;
            cycles_to_lock := 0;
        end if;

        -- give message only at time of deassertion
        if (pfdena_ipd'event and pfdena_ipd = '0') then
            assert false report "PFDENA deasserted." severity note;
        elsif (pfdena_ipd'event and pfdena_ipd = '1') then
            got_first_refclk := false;
            got_second_refclk := false;
            refclk_time := now;
        end if;

        if (quiet_period_violation or reconfig_err or scanclr_violation or scanclr_clk_violation) then
            lock <= '0';
            if (pll_type = "fast") then
                lock <= '1';
            end if;
        else
            lock <= locked_tmp;
        end if;
        about_to_lock <= pll_about_to_lock after 1 ps;

        -- signal to calculate quiet_time
        sig_refclk_period <= refclk_period;

        -- signals for debugging
        sig_offset <= offset;
        sig_refclk_time <= refclk_time;
        sig_fbclk_period <= fbclk_period;
        sig_vco_period_was_phase_adjusted <= vco_period_was_phase_adjusted;
        sig_phase_adjust_was_scheduled <= phase_adjust_was_scheduled;
        if (stop_vco = true) then
            sig_stop_vco <= '1';
        else
            sig_stop_vco <= '0';
        end if;
        sig_m_times_vco_period <= m_times_vco_period;
        sig_new_m_times_vco_period <= new_m_times_vco_period;
        sig_got_refclk_posedge <= got_refclk_posedge;
        sig_got_fbclk_posedge <= got_fbclk_posedge;
        sig_got_second_refclk <= got_second_refclk;
    end process;

    process (scanclk_ipd, scanaclr_ipd, scan_data, transfer)
      variable j : integer := 0;
      variable pll_in_quiet_period : boolean := false;
      variable start_quiet_time : time := 0 ps;
      variable quiet_time : time := 0 ps;
      variable scanclr_rising_time : time := 0 ps;
      variable scanclr_falling_time : time := 0 ps;
      variable got_first_scanclk_after_scanclr_inactive_edge : boolean := false;
      variable scan_chain_being_reset : boolean := false;

      function slowest_clk(L0 : integer; L1 : integer; G0 : integer;
                           G1 : integer; G2 : integer; G3 : integer;
                           E0 : integer; E1 : integer; E2 : integer;
                           E3 : integer; scan_chain : string; 
                           refclk : time; m_mod : integer) return time is
      variable max_modulus : integer := 0;
      variable q_period : time := 0 ps;
      variable refclk_int : integer := 0;
      begin
          if (L0 > L1) then max_modulus := L0; else max_modulus := L1; end if;
          if (G0 > max_modulus) then max_modulus := G0; end if;
          if (G1 > max_modulus) then max_modulus := G1; end if;
          if (G2 > max_modulus) then max_modulus := G2; end if;
          if (G3 > max_modulus) then max_modulus := G3; end if;
          if (scan_chain = "long") then
              if (E0 > max_modulus) then max_modulus := E0; end if;
              if (E1 > max_modulus) then max_modulus := E1; end if;
              if (E2 > max_modulus) then max_modulus := E2; end if;
              if (E3 > max_modulus) then max_modulus := E3; end if;
          end if;
          refclk_int := refclk / 1 ps;
          if (m_mod /= 0) then
              q_period := ((refclk_int/m_mod) * max_modulus) * 1 ps;
          end if;
          return (2*q_period);
      end slowest_clk;

    begin
        if (transfer'event) then
            if (transfer = '0') then
                -- clear the chain
                for i in scan_data'range loop
                    scan_data(i) <= '0';
                end loop;
            end if;
        elsif (scanaclr_ipd'event and scanaclr_ipd = '1') then
            -- scanaclr rising
            scanclr_rising_time := now;
            scan_chain_being_reset := true;
        elsif (scanaclr_ipd'event and scanaclr_ipd = '0' and (now > 0 ps)) then
            -- scanaclr falling
            scanclr_falling_time := now;
            if (scan_chain_being_reset and (now - scanclr_rising_time < TRST)) then
                scanclr_violation <= true;
                ASSERT false REPORT "Detected SCANACLR ACTIVE pulse width violation. Required is 5000 ps, actual is "& int2str((now - scanclr_rising_time) / 1 ps) &". The PLL may not function correctly." severity warning;
            else
                scanclr_violation <= false;
                for i in scan_data'range loop
                    scan_data(i) <= '0';
                end loop;
            end if;
            scan_chain_being_reset := false;
            got_first_scanclk_after_scanclr_inactive_edge := false;
        elsif (scanclk_ipd'event and scanclk_ipd = '1' and not got_first_scanclk_after_scanclr_inactive_edge and (now - scanclr_falling_time < TRSTCLK)) then
            scanclr_clk_violation <= true;
            got_first_scanclk_after_scanclr_inactive_edge := true;

            ASSERT false REPORT "Detected SCANACLR INACTIVE time violation before rising edge of SCANCLK. Required is 5000 ps, actual is "& int2str((now - scanclr_falling_time) / 1 ps) &". Reconfiguration may not work." severity warning;
        elsif (scanclk_ipd'event and scanclk_ipd = '1' and scanaclr_ipd = '0') then
            if (pll_in_quiet_period and (now - start_quiet_time < quiet_time)) then
                ASSERT false REPORT "Detected transition on SCANCLK during quiet period. The PLL may not function correctly." severity warning;
                quiet_period_violation <= true;
            else
                pll_in_quiet_period := false;
                for j in scan_chain_length-1 downto 1 loop
                    scan_data(j) <= scan_data(j-1);
                end loop;
                scan_data(0) <= scandata_ipd;
            end if;
            if (not got_first_scanclk_after_scanclr_inactive_edge) then
                got_first_scanclk_after_scanclr_inactive_edge := true;
                scanclr_clk_violation <= false;
            end if;
        elsif (scanclk_ipd'event and scanclk_ipd = '0' and scanaclr_ipd = '0') then
            if (pll_in_quiet_period and (now - start_quiet_time < quiet_time)) then
                ASSERT false REPORT "Detected transition on SCANCLK during quiet period. The PLL may not function correctly." severity warning;
                quiet_period_violation <= true;
            elsif (scan_data(scan_chain_length-1) = '1') then
                -- reset violation flag only after another reconfig seq.
                quiet_period_violation <= false;

                -- initiate transfer
                transfer <= '1';
                transfer <= transport '0' after 1 ps;
                scandataout_tmp <= '1';
                pll_in_quiet_period := true;
                start_quiet_time := now;
                quiet_time := slowest_clk(l0_high_val+l0_low_val,
                                          l1_high_val+l1_low_val,
                                          g0_high_val+g0_low_val,
                                          g1_high_val+g1_low_val,
                                          g2_high_val+g2_low_val,
                                          g3_high_val+g3_low_val,
                                          e0_high_val+e0_low_val,
                                          e1_high_val+e1_low_val,
                                          e2_high_val+e2_low_val,
                                          e3_high_val+e3_low_val,
                                          scan_chain, sig_refclk_period, m_val);
                scandataout_tmp <= transport '0' after quiet_time;
            end if;
        end if;
    end process;

    clk0_tmp <= l0_clk when i_clk0_counter = "l0" else
                l1_clk when i_clk0_counter = "l1" else
                g0_clk when i_clk0_counter = "g0" else
                g1_clk when i_clk0_counter = "g1" else
                g2_clk when i_clk0_counter = "g2" else
                g3_clk when i_clk0_counter = "g3" else
                '0';
    not_clk0_tmp <= not clk0_tmp;
    ena0_reg : dffp
              port map (D    => clkena(0),
                        CLRN => vcc,
                        PRN  => vcc,
                        ENA  => vcc,
                        CLK  => not_clk0_tmp,
                        Q    => ena0
                       );
    clk(0) <= ena0 and clk0_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
              ena0 and 'X';

    clk1_tmp <= l0_clk when i_clk1_counter = "l0" else
                l1_clk when i_clk1_counter = "l1" else
                g0_clk when i_clk1_counter = "g0" else
                g1_clk when i_clk1_counter = "g1" else
                g2_clk when i_clk1_counter = "g2" else
                g3_clk when i_clk1_counter = "g3" else
                '0';
    not_clk1_tmp <= not clk1_tmp;
   ena1_reg : dffp
              port map (D => clkena(1),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_clk1_tmp,
                        Q => ena1
                       );
    clk(1) <= ena1 and clk1_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
              ena1 and 'X';

    clk2_tmp <= l0_clk when i_clk2_counter = "l0" else
                l1_clk when i_clk2_counter = "l1" else
                g0_clk when i_clk2_counter = "g0" else
                g1_clk when i_clk2_counter = "g1" else
                g2_clk when i_clk2_counter = "g2" else
                g3_clk when i_clk2_counter = "g3" else
                '0';
    not_clk2_tmp <= not clk2_tmp;
    ena2_reg : dffp
              port map (D => clkena(2),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_clk2_tmp,
                        Q => ena2
                       );
    clk(2) <= ena2 and clk2_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
              ena2 and 'X';

    clk3_tmp <= l0_clk when i_clk3_counter = "l0" else
                l1_clk when i_clk3_counter = "l1" else
                g0_clk when i_clk3_counter = "g0" else
                g1_clk when i_clk3_counter = "g1" else
                g2_clk when i_clk3_counter = "g2" else
                g3_clk when i_clk3_counter = "g3" else
                '0';
    not_clk3_tmp <= not clk3_tmp;
    ena3_reg : dffp
              port map (D => clkena(3),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_clk3_tmp,
                        Q => ena3
                       );
    clk(3) <= ena3 and clk3_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
              ena3 and 'X';

    clk4_tmp <= l0_clk when i_clk4_counter = "l0" else
                l1_clk when i_clk4_counter = "l1" else
                g0_clk when i_clk4_counter = "g0" else
                g1_clk when i_clk4_counter = "g1" else
                g2_clk when i_clk4_counter = "g2" else
                g3_clk when i_clk4_counter = "g3" else
                '0';
    not_clk4_tmp <= not clk4_tmp;
    ena4_reg : dffp
              port map (D => clkena(4),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_clk4_tmp,
                        Q => ena4
                       );
    clk(4) <= ena4 and clk4_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
              ena4 and 'X';

    clk5_tmp <= l0_clk when i_clk5_counter = "l0" else
                l1_clk when i_clk5_counter = "l1" else
                g0_clk when i_clk5_counter = "g0" else
                g1_clk when i_clk5_counter = "g1" else
                g2_clk when i_clk5_counter = "g2" else
                g3_clk when i_clk5_counter = "g3" else
                '0';
    not_clk5_tmp <= not clk5_tmp;
    ena5_reg : dffp
              port map (D => clkena(5),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_clk5_tmp,
                        Q => ena5
                       );
    clk(5) <= ena5 and clk5_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
              ena5 and 'X';

    extclk0_tmp <= e0_clk when i_extclk0_counter = "e0" else
                   e1_clk when i_extclk0_counter = "e1" else
                   e2_clk when i_extclk0_counter = "e2" else
                   e3_clk when i_extclk0_counter = "e3" else
                   '0';
    not_extclk0_tmp <= not extclk0_tmp;
    extena0_reg : dffp
              port map (D => extclkena(0),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_extclk0_tmp,
                        Q => extena0
                       );
    extclk(0) <= extena0 and extclk0_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
                 extena0 and 'X';

    extclk1_tmp <= e0_clk when i_extclk1_counter = "e0" else
                   e1_clk when i_extclk1_counter = "e1" else
                   e2_clk when i_extclk1_counter = "e2" else
                   e3_clk when i_extclk1_counter = "e3" else
                   '0';
    not_extclk1_tmp <= not extclk1_tmp;
    extena1_reg : dffp
              port map (D => extclkena(1),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_extclk1_tmp,
                        Q => extena1
                       );
    extclk(1) <= extena1 and extclk1_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
                 extena1 and 'X';

    extclk2_tmp <= e0_clk when i_extclk2_counter = "e0" else
                   e1_clk when i_extclk2_counter = "e1" else
                   e2_clk when i_extclk2_counter = "e2" else
                   e3_clk when i_extclk2_counter = "e3" else
                   '0';
    not_extclk2_tmp <= not extclk2_tmp;
    extena2_reg : dffp
              port map (D => extclkena(2),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_extclk2_tmp,
                        Q => extena2
                       );
    extclk(2) <= extena2 and extclk2_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
                 extena2 and 'X';

    extclk3_tmp <= e0_clk when i_extclk3_counter = "e0" else
                   e1_clk when i_extclk3_counter = "e1" else
                   e2_clk when i_extclk3_counter = "e2" else
                   e3_clk when i_extclk3_counter = "e3" else
                   '0';
    not_extclk3_tmp <= not extclk3_tmp;
    extena3_reg : dffp
              port map (D => extclkena(3),
                        CLRN => vcc,
                        PRN => vcc,
                        ENA => vcc,
                        CLK => not_extclk3_tmp,
                        Q => extena3
                       );
    extclk(3) <= extena3 and extclk3_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
                 extena3 and 'X';

    enable0 <= enable0_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
               'X';
    enable1 <= enable1_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not quiet_period_violation) and (not reconfig_err) and (not scanclr_violation) and (not scanclr_clk_violation)) else
               'X';

    scandataout <= scandataout_tmp;

end vital_pll;
-- END ARCHITECTURE VITAL_PLL


--///////////////////////////////////////////////////////////////////////////
--
-- Entity Name : MF_stratixii_pll
--
-- Description : Simulation model for the Stratix II PLL.
--               In the functional mode, it is also the model for the altpll
--               megafunction.
--
-- Limitations : Does not support Spread Spectrum and Bandwidth.
--
-- Outputs     : Up to 6 output clocks, each defined by its own set of
--               parameters. Locked output (active high) indicates when the
--               PLL locks. clkbad, clkloss and activeclock are used for
--               clock switchover to inidicate which input clock has gone
--               bad, when the clock switchover initiates and which input
--               clock is being used as the reference, respectively.
--               scandataout is the data output of the serial scan chain.
--
--///////////////////////////////////////////////////////////////////////////

library ieee, std, altera;
use IEEE.std_logic_1164.all;
use STD.textio.all;
use altera.pllpack.all;
use altera.altera_mf_components.all;


ENTITY MF_stratixii_pll is
    GENERIC ( operation_mode              : string := "normal";
              pll_type                    : string := "auto";  -- EGPP/FAST/AUTO
              compensate_clock            : string := "clk0";
              feedback_source             : string := "clk0";
              qualify_conf_done           : string := "off";

              test_input_comp_delay       : integer := 0;
              test_feedback_comp_delay    : integer := 0;

              inclk0_input_frequency      : integer := 10000;
              inclk1_input_frequency      : integer := 10000;

              gate_lock_signal            : string := "no";
              gate_lock_counter           : integer := 1;
              valid_lock_multiplier       : integer := 1;
              invalid_lock_multiplier     : integer := 5;

              switch_over_type            : string := "auto";
              switch_over_on_lossclk      : string := "off";
              switch_over_on_gated_lock   : string := "off";
              switch_over_counter         : integer := 1;
              enable_switch_over_counter  : string := "on";

              bandwidth                   : integer := 0;
              bandwidth_type              : string := "auto";
              down_spread                 : string := "0.0";
              spread_frequency            : integer := 0;

              clk0_output_frequency       : integer := 0;
              clk0_multiply_by            : integer := 1;
              clk0_divide_by              : integer := 1;
              clk0_phase_shift            : string := "0";
              clk0_duty_cycle             : integer := 50;

              clk1_output_frequency       : integer := 0;
              clk1_multiply_by            : integer := 1;
              clk1_divide_by              : integer := 1;
              clk1_phase_shift            : string := "0";
              clk1_duty_cycle             : integer := 50;

              clk2_output_frequency       : integer := 0;
              clk2_multiply_by            : integer := 1;
              clk2_divide_by              : integer := 1;
              clk2_phase_shift            : string := "0";
              clk2_duty_cycle             : integer := 50;

              clk3_output_frequency       : integer := 0;
              clk3_multiply_by            : integer := 1;
              clk3_divide_by              : integer := 1;
              clk3_phase_shift            : string := "0";
              clk3_duty_cycle             : integer := 50;

              clk4_output_frequency       : integer := 0;
              clk4_multiply_by            : integer := 1;
              clk4_divide_by              : integer := 1;
              clk4_phase_shift            : string := "0";
              clk4_duty_cycle             : integer := 50;

              clk5_output_frequency       : integer := 0;
              clk5_multiply_by            : integer := 1;
              clk5_divide_by              : integer := 1;
              clk5_phase_shift            : string := "0";
              clk5_duty_cycle             : integer := 50;

              pfd_min                     : integer := 0;
              pfd_max                     : integer := 0;
              vco_min                     : integer := 0;
              vco_max                     : integer := 0;
              vco_center                  : integer := 0;

              -- ADVANCED USER PARAMETERS
              m_initial                   : integer := 1;
              m                           : integer := 1;
              n                           : integer := 1;
              m2                          : integer := 1;
              n2                          : integer := 1;
              ss                          : integer := 0;

              c0_high                     : integer := 1;
              c0_low                      : integer := 1;
              c0_initial                  : integer := 1; 
              c0_mode                     : string := "bypass";
              c0_ph                       : integer := 0;

              c1_high                     : integer := 1;
              c1_low                      : integer := 1;
              c1_initial                  : integer := 1;
              c1_mode                     : string := "bypass";
              c1_ph                       : integer := 0;

              c2_high                     : integer := 1;
              c2_low                      : integer := 1;
              c2_initial                  : integer := 1;
              c2_mode                     : string := "bypass";
              c2_ph                       : integer := 0;

              c3_high                     : integer := 1;
              c3_low                      : integer := 1;
              c3_initial                  : integer := 1;
              c3_mode                     : string := "bypass";
              c3_ph                       : integer := 0;

              c4_high                     : integer := 1;
              c4_low                      : integer := 1;
              c4_initial                  : integer := 1;
              c4_mode                     : string := "bypass";
              c4_ph                       : integer := 0;

              c5_high                     : integer := 1;
              c5_low                      : integer := 1;
              c5_initial                  : integer := 1;
              c5_mode                     : string := "bypass";
              c5_ph                       : integer := 0;

              m_ph                        : integer := 0;

              clk0_counter                : string := "c0";
              clk1_counter                : string := "c1";
              clk2_counter                : string := "c2";
              clk3_counter                : string := "c3";
              clk4_counter                : string := "c4";
              clk5_counter                : string := "c5";

              c1_use_casc_in              : string := "off";
              c2_use_casc_in              : string := "off";
              c3_use_casc_in              : string := "off";
              c4_use_casc_in              : string := "off";
              c5_use_casc_in              : string := "off";

              m_test_source               : integer := 5;
              c0_test_source              : integer := 5;
              c1_test_source              : integer := 5;
              c2_test_source              : integer := 5;
              c3_test_source              : integer := 5;
              c4_test_source              : integer := 5;
              c5_test_source              : integer := 5;

              -- LVDS mode parameters
              enable0_counter             : string := "c0";
              enable1_counter             : string := "c1";
              sclkout0_phase_shift        : string := "0";
              sclkout1_phase_shift        : string := "0";

              charge_pump_current         : integer := 0;
              loop_filter_r               : string := "1.0";
              loop_filter_c               : integer := 1;
              common_rx_tx                : string := "off";
              rx_outclock_resource        : string := "auto";
              use_vco_bypass              : string := "false";
              use_dc_coupling             : string := "false";

              pll_compensation_delay      : integer := 0;
              simulation_type             : string := "functional";

              vco_multiply_by             : integer := 0;
              vco_divide_by               : integer := 0             
            );

    PORT    ( inclk                       : in std_logic_vector(1 downto 0);
              fbin                        : in std_logic;
              ena                         : in std_logic := '1';
              clkswitch                   : in std_logic;
              areset                      : in std_logic;
              pfdena                      : in std_logic;
              scanread                    : in std_logic;
              scanwrite                   : in std_logic;
              scandata                    : in std_logic;
              scanclk                     : in std_logic;
              clk                         : out std_logic_vector(5 downto 0);
              clkbad                      : out std_logic_vector(1 downto 0);
              activeclock                 : out std_logic;
              locked                      : out std_logic;
              clkloss                     : out std_logic;
              scandataout                 : out std_logic;
              scandone                    : out std_logic;
              testupout                   : out std_logic;
              testdownout                 : out std_logic;
              -- lvds specific ports
              enable0                     : out std_logic;
              enable1                     : out std_logic;
              sclkout                     : out std_logic_vector(1 downto 0)
            );
END MF_stratixii_pll;

ARCHITECTURE vital_pll of MF_stratixii_pll is

TYPE int_array is ARRAY(NATURAL RANGE <>) of integer;
TYPE str_array is ARRAY(NATURAL RANGE <>) of string(1 to 6);

-- internal advanced parameter signals
signal   i_vco_min      : integer;
signal   i_vco_max      : integer;
signal   i_vco_center   : integer;
signal   i_pfd_min      : integer;
signal   i_pfd_max      : integer;
signal   c_ph_val       : int_array(0 to 5) := (OTHERS => 0);
signal   c_high_val     : int_array(0 to 5) := (OTHERS => 1);
signal   c_low_val      : int_array(0 to 5) := (OTHERS => 1);
signal   c_initial_val  : int_array(0 to 5) := (OTHERS => 1);
signal   c_mode_val     : str_array(0 to 5);

-- old values
signal   c_high_val_old : int_array(0 to 5) := (OTHERS => 1);
signal   c_low_val_old  : int_array(0 to 5) := (OTHERS => 1);
signal   c_ph_val_old   : int_array(0 to 5) := (OTHERS => 0);
signal   c_mode_val_old : str_array(0 to 5);

-- hold registers
signal   c_high_val_hold : int_array(0 to 5) := (OTHERS => 1);
signal   c_low_val_hold  : int_array(0 to 5) := (OTHERS => 1);
signal   c_ph_val_hold   : int_array(0 to 5) := (OTHERS => 0);
signal   c_mode_val_hold : str_array(0 to 5);

-- temp registers
signal   sig_c_ph_val_tmp   : int_array(0 to 5) := (OTHERS => 0);
signal   sig_c_low_val_tmp  : int_array(0 to 5) := (OTHERS => 1);
signal   c_ph_val_orig  : int_array(0 to 5) := (OTHERS => 0);

signal   i_clk5_counter         : string(1 to 2) := "c5";
signal   i_clk4_counter         : string(1 to 2) := "c4";
signal   i_clk3_counter         : string(1 to 2) := "c3";
signal   i_clk2_counter         : string(1 to 2) := "c2";
signal   i_clk1_counter         : string(1 to 2) := "c1";
signal   i_clk0_counter         : string(1 to 2) := "c0";
signal   i_charge_pump_current  : integer;
signal   i_loop_filter_r        : integer;

-- end internal advanced parameter signals

-- CONSTANTS
CONSTANT SCAN_CHAIN : integer := 174;
CONSTANT cntrs : str_array(5 downto 0) := ("    C5", "    C4", "    C3", "    C2", "    C1", "    C0");
CONSTANT ss_cntrs : str_array(0 to 3) := ("     M", "    M2", "     N", "    N2");

-- signals

signal vcc : std_logic := '1';

signal fbclk       : std_logic;
signal refclk      : std_logic;

signal c0_clk : std_logic;
signal c1_clk : std_logic;
signal c2_clk : std_logic;
signal c3_clk : std_logic;
signal c4_clk : std_logic;
signal c5_clk : std_logic;

signal vco_out : std_logic_vector(7 downto 0) := (OTHERS => '0');

-- signals to assign values to counter params
signal m_val : int_array(0 to 1) := (OTHERS => 1);
signal n_val : int_array(0 to 1) := (OTHERS => 1);
signal m_ph_val : integer := 0;
signal m_initial_val : integer := m_initial;

signal m_mode_val : str_array(0 to 1) := (OTHERS => "      ");
signal n_mode_val : str_array(0 to 1) := (OTHERS => "      ");

-- old values
signal m_val_old : int_array(0 to 1) := (OTHERS => 1);
--signal m_val_tmp : int_array(0 to 1) := (OTHERS => 1);
signal n_val_old : int_array(0 to 1) := (OTHERS => 1);
signal m_mode_val_old : str_array(0 to 1) := (OTHERS => "      ");
signal n_mode_val_old : str_array(0 to 1) := (OTHERS => "      ");
signal m_ph_val_old : integer := 0;

signal scan_data : std_logic_vector(173 downto 0) := (OTHERS => '0');

signal clk0_tmp : std_logic;
signal clk1_tmp : std_logic;
signal clk2_tmp : std_logic;
signal clk3_tmp : std_logic;
signal clk4_tmp : std_logic;
signal clk5_tmp : std_logic;
signal sclkout0_tmp : std_logic;
signal sclkout1_tmp : std_logic;

signal clkin : std_logic := '0';
signal gate_locked : std_logic := '0';
signal lock : std_logic := '0';
signal about_to_lock : boolean := false;
signal reconfig_err : boolean := false;

signal inclk_c0 : std_logic;
signal inclk_c1 : std_logic;
signal inclk_c2 : std_logic;
signal inclk_c3 : std_logic;
signal inclk_c4 : std_logic;
signal inclk_c5 : std_logic;
signal inclk_m : std_logic;
signal devpor : std_logic;
signal devclrn : std_logic;

signal inclk0_ipd : std_logic;
signal inclk1_ipd : std_logic;
signal ena_ipd : std_logic;
signal pfdena_ipd : std_logic;
signal areset_ipd : std_logic;
signal fbin_ipd : std_logic;
signal scanclk_ipd : std_logic;
signal scanread_ipd : std_logic;
signal scanwrite_ipd : std_logic;
signal scandata_ipd : std_logic;
signal clkswitch_ipd : std_logic;
-- registered signals
signal scanread_reg : std_logic := '0';
signal scanwrite_reg : std_logic := '0';

signal inclk_c0_dly1 : std_logic := '0';
signal inclk_c0_dly2 : std_logic := '0';
signal inclk_c0_dly3 : std_logic := '0';
signal inclk_c0_dly4 : std_logic := '0';
signal inclk_c0_dly5 : std_logic := '0';
signal inclk_c0_dly6 : std_logic := '0';
signal inclk_c1_dly1 : std_logic := '0';
signal inclk_c1_dly2 : std_logic := '0';
signal inclk_c1_dly3 : std_logic := '0';
signal inclk_c1_dly4 : std_logic := '0';
signal inclk_c1_dly5 : std_logic := '0';
signal inclk_c1_dly6 : std_logic := '0';


signal sig_offset : time := 0 ps;
signal sig_refclk_time : time := 0 ps;
signal sig_fbclk_period : time := 0 ps;
signal sig_vco_period_was_phase_adjusted : boolean := false;
signal sig_phase_adjust_was_scheduled : boolean := false;
signal sig_stop_vco : std_logic := '0';
signal sig_m_times_vco_period : time := 0 ps;
signal sig_new_m_times_vco_period : time := 0 ps;
signal sig_got_refclk_posedge : boolean := false;
signal sig_got_fbclk_posedge : boolean := false;
signal sig_got_second_refclk : boolean := false;

signal m_delay : integer := 0;
signal n_delay : integer := 0;

signal sig_curr_clock : string(1 to 6) := "inclk0";
signal inclk1_tmp : std_logic := '0';
signal scan_chain_length : integer := SCAN_CHAIN;

signal ext_fbk_cntr_high : integer := 0;
signal ext_fbk_cntr_low : integer := 0;
signal ext_fbk_cntr_ph : integer := 0;
signal ext_fbk_cntr_initial : integer := 1;
signal ext_fbk_cntr     : string(1 to 2) := "c0";
signal ext_fbk_cntr_mode : string(1 to 6) := "bypass";
signal ext_fbk_cntr_index : integer := 0;

signal enable0_tmp : std_logic := '0';
signal enable1_tmp : std_logic := '0';
signal reset_low : std_logic := '0';

signal scandataout_tmp : std_logic := '0';
signal scandone_tmp : std_logic := '0';

signal sig_refclk_period : time := (inclk0_input_frequency * 1 ps) * n;

signal schedule_vco : std_logic := '0';

signal areset_ena_sig : std_logic := '0';

signal inclk_c0_from_vco : std_logic;
signal inclk_c1_from_vco : std_logic;
signal inclk_c2_from_vco : std_logic;
signal inclk_c3_from_vco : std_logic;
signal inclk_c4_from_vco : std_logic;
signal inclk_c5_from_vco : std_logic;
signal inclk_m_from_vco : std_logic;
signal inclk_sclkout0_from_vco : std_logic;
signal inclk_sclkout1_from_vco : std_logic;

COMPONENT MF_mn_cntr
    PORT ( clk           : IN std_logic;
           reset         : IN std_logic := '0';
           cout          : OUT std_logic;
           initial_value : IN integer := 1;
           modulus       : IN integer := 1;
           time_delay    : IN integer := 0
         );
END COMPONENT;

COMPONENT arm_scale_cntr
    PORT ( clk            : IN std_logic;
           reset          : IN std_logic := '0';
           cout           : OUT std_logic;
           initial        : IN integer := 1;
           high           : IN integer := 1;
           low            : IN integer := 1;
           mode           : IN string := "bypass";
           ph_tap         : IN integer := 0
         );
END COMPONENT;

COMPONENT DFFP
   PORT(
      Q                              :  out   STD_LOGIC := '0';
      D                              :  in    STD_LOGIC := '1';
      CLRN                           :  in    STD_LOGIC := '1';
      PRN                            :  in    STD_LOGIC := '1';
      CLK                            :  in    STD_LOGIC := '0';
      ENA                            :  in    STD_LOGIC := '1');
END COMPONENT;

COMPONENT MF_PLL_REG
   PORT(
      Q                              :  out   STD_LOGIC := '0';
      D                              :  in    STD_LOGIC := '1';
      CLRN                           :  in    STD_LOGIC := '1';
      PRN                            :  in    STD_LOGIC := '1';
      CLK                            :  in    STD_LOGIC := '0';
      ENA                            :  in    STD_LOGIC := '1');
END COMPONENT;

begin

    ----------------------
    --  INPUT PATH DELAYs
    ----------------------
    WireDelay : block
    begin
        inclk0_ipd    <= inclk(0);
        inclk1_ipd    <= inclk(1);
        areset_ipd    <= areset;
        ena_ipd       <= ena;
        fbin_ipd      <= fbin;
        pfdena_ipd    <= pfdena;
        scanclk_ipd   <= scanclk;
        scanread_ipd  <= scanread;
        scandata_ipd  <= scandata;
        scanwrite_ipd <= scanwrite;
        clkswitch_ipd <= clkswitch;
    end block;

    inclk_m <= clkin when m_test_source = 0 else
               clk0_tmp when operation_mode = "external_feedback" and feedback_source = "clk0" else
               clk1_tmp when operation_mode = "external_feedback" and feedback_source = "clk1" else
               clk2_tmp when operation_mode = "external_feedback" and feedback_source = "clk2" else
               clk3_tmp when operation_mode = "external_feedback" and feedback_source = "clk3" else
               clk4_tmp when operation_mode = "external_feedback" and feedback_source = "clk4" else
               clk5_tmp when operation_mode = "external_feedback" and feedback_source = "clk5" else
               inclk_m_from_vco;

    ext_fbk_cntr_high <= c_high_val(ext_fbk_cntr_index);
    ext_fbk_cntr_low  <= c_low_val(ext_fbk_cntr_index);
    ext_fbk_cntr_ph   <= c_ph_val(ext_fbk_cntr_index);
    ext_fbk_cntr_initial <= c_initial_val(ext_fbk_cntr_index);
    ext_fbk_cntr_mode <= c_mode_val(ext_fbk_cntr_index);

    areset_ena_sig <= areset_ipd or (not ena_ipd) or sig_stop_vco;

    m1 : MF_mn_cntr
         port map (clk           => inclk_m,
                   reset         => areset_ena_sig,
                   cout          => fbclk,
                   initial_value => m_initial_val,
                   modulus       => m_val(0),
                   time_delay    => m_delay
                  );

    -- add delta delay to inclk1 to ensure inclk0 and inclk1 are processed
    -- in different simulation deltas.
    inclk1_tmp <= inclk1_ipd;

    process (inclk0_ipd, inclk1_tmp, clkswitch_ipd)
    variable input_value : std_logic := '0';
    variable current_clock : string(1 to 6) := "inclk0";
    variable clk0_count, clk1_count : integer := 0;
    variable clk0_is_bad, clk1_is_bad : std_logic := '0';
    variable primary_clk_is_bad : boolean := false;
    variable current_clk_is_bad : boolean := false;
    variable got_curr_clk_falling_edge_after_clkswitch : boolean := false;
    variable switch_over_count : integer := 0;
    variable active_clock : std_logic := '0';
    variable external_switch : boolean := false;
    begin
        if (now = 0 ps) then
            if (switch_over_type = "manual" and clkswitch_ipd = '1') then
                current_clock := "inclk1";
                active_clock := '1';
            end if;
        end if;
        if (clkswitch_ipd'event and clkswitch_ipd = '1' and switch_over_type = "auto") then
            external_switch := true;
        elsif (switch_over_type = "manual") then
            if (clkswitch_ipd'event and clkswitch_ipd = '1') then
                current_clock := "inclk1";
                active_clock := '1';
            elsif (clkswitch_ipd'event and clkswitch_ipd = '0') then
                current_clock := "inclk0";
                active_clock := '0';
            end if;
        end if;
        -- save the current inclk event value
        if (inclk0_ipd'event) then
            input_value := inclk0_ipd;
        elsif (inclk1_tmp'event) then
            input_value := inclk1_tmp;
        end if;

        -- check if either input clk is bad
        if (inclk0_ipd'event and inclk0_ipd = '1') then
            clk0_count := clk0_count + 1;
            clk0_is_bad := '0';
            clk1_count := 0;
            if (clk0_count > 2) then
                -- no event on other clk for 2 cycles
                clk1_is_bad := '1';
                if (current_clock = "inclk1") then
                    current_clk_is_bad := true;
                end if;
            end if;
        end if;
        if (inclk1_tmp'event and inclk1_tmp = '1') then
            clk1_count := clk1_count + 1;
            clk1_is_bad := '0';
            clk0_count := 0;
            if (clk1_count > 2) then
                -- no event on other clk for 2 cycles
                clk0_is_bad := '1';
                if (current_clock = "inclk0") then
                    current_clk_is_bad := true;
                end if;
            end if;
        end if;

        -- check if the bad clk is the primary clock
        if (clk0_is_bad = '1') then
            primary_clk_is_bad := true;
        else
            primary_clk_is_bad := false;
        end if;

        -- actual switching
        if (inclk0_ipd'event and current_clock = "inclk0") then
            if (external_switch) then
                if (not got_curr_clk_falling_edge_after_clkswitch) then
                    if (inclk0_ipd = '0') then
                        got_curr_clk_falling_edge_after_clkswitch := true;
                    end if;
                    clkin <= transport inclk0_ipd;
                end if;
            else
                clkin <= transport inclk0_ipd;
            end if;
        elsif (inclk1_tmp'event and current_clock = "inclk1") then
            if (external_switch) then
                if (not got_curr_clk_falling_edge_after_clkswitch) then
                    if (inclk1_tmp = '0') then
                        got_curr_clk_falling_edge_after_clkswitch := true;
                    end if;
                    clkin <= transport inclk1_tmp;
                end if;
            else
                clkin <= transport inclk1_tmp;
            end if;
        else
            if (input_value = '1' and switch_over_on_lossclk = "on"  and enable_switch_over_counter = "on" and primary_clk_is_bad) then
                switch_over_count := switch_over_count + 1;
            end if;
            if (input_value = '0') then
                if (external_switch and (got_curr_clk_falling_edge_after_clkswitch or current_clk_is_bad)) or (switch_over_on_lossclk = "on" and primary_clk_is_bad and (enable_switch_over_counter = "off" or switch_over_count = switch_over_counter)) then
                    got_curr_clk_falling_edge_after_clkswitch := false;
                    if (current_clock = "inclk0") then
                        current_clock := "inclk1";
                    else
                        current_clock := "inclk0";
                    end if;
                    active_clock := not active_clock;
                    switch_over_count := 0;
                    external_switch := false;
                    current_clk_is_bad := false;
                end if;
       
            end if;
        end if;

        -- schedule outputs
        clkbad(0) <= clk0_is_bad;
        clkbad(1) <= clk1_is_bad;
        if (switch_over_on_lossclk = "on" and clkswitch_ipd /= '1') then
            if (primary_clk_is_bad) then
                -- assert clkloss
                clkloss <= '1';
            else
                clkloss <= '0';
            end if;
        else
            clkloss <= clkswitch_ipd;
        end if;
        activeclock <= active_clock;

        -- for debugging only
--      sig_curr_clock <= current_clock;
    end process;

    process (inclk_sclkout0_from_vco)
    begin
        sclkout0_tmp <= inclk_sclkout0_from_vco;
    end process;

    process (inclk_sclkout1_from_vco)
    begin
        sclkout1_tmp <= inclk_sclkout1_from_vco;
    end process;

    n1 : MF_mn_cntr
         port map (clk           => clkin,
                   reset         => areset_ipd,
                   cout          => refclk,
                   initial_value => n_val(0),
                   modulus       => n_val(0));

    inclk_c0 <= clkin when c0_test_source = 0 else
                refclk when c0_test_source = 1 else
                inclk_c0_from_vco;
    c0 : arm_scale_cntr
         port map (clk            => inclk_c0,
                   reset          => areset_ena_sig,
                   cout           => c0_clk,
                   initial        => c_initial_val(0),
                   high           => c_high_val(0),
                   low            => c_low_val(0),
                   mode           => c_mode_val(0),
                   ph_tap         => c_ph_val(0));

    inclk_c1 <= clkin when c1_test_source = 0 else
                fbclk when c1_test_source = 2 else
                c0_clk when c1_use_casc_in = "on" else
                inclk_c1_from_vco;
    c1 : arm_scale_cntr
         port map (clk            => inclk_c1,
                   reset          => areset_ena_sig,
                   cout           => c1_clk,
                   initial        => c_initial_val(1),
                   high           => c_high_val(1),
                   low            => c_low_val(1),
                   mode           => c_mode_val(1),
                   ph_tap         => c_ph_val(1));

    inclk_c2 <= clkin when c2_test_source = 0 else
                c1_clk when c2_use_casc_in = "on" else
                inclk_c2_from_vco;
    c2 : arm_scale_cntr
         port map (clk            => inclk_c2,
                   reset          => areset_ena_sig,
                   cout           => c2_clk,
                   initial        => c_initial_val(2),
                   high           => c_high_val(2),
                   low            => c_low_val(2),
                   mode           => c_mode_val(2),
                   ph_tap         => c_ph_val(2));


    inclk_c3 <= clkin when c3_test_source = 0 else
                c2_clk when c3_use_casc_in = "on" else
                inclk_c3_from_vco;
    c3 : arm_scale_cntr
         port map (clk            => inclk_c3,
                   reset          => areset_ena_sig,
                   cout           => c3_clk,
                   initial        => c_initial_val(3),
                   high           => c_high_val(3),
                   low            => c_low_val(3),
                   mode           => c_mode_val(3),
                   ph_tap         => c_ph_val(3));

    inclk_c4 <= clkin when c4_test_source = 0 else
                c3_clk when c4_use_casc_in = "on" else
                inclk_c4_from_vco;
    c4 : arm_scale_cntr
         port map (clk            => inclk_c4,
                   reset          => areset_ena_sig,
                   cout           => c4_clk,
                   initial        => c_initial_val(4),
                   high           => c_high_val(4),
                   low            => c_low_val(4),
                   mode           => c_mode_val(4),
                   ph_tap         => c_ph_val(4));

    inclk_c5 <= clkin when c5_test_source = 0 else
                c4_clk when c5_use_casc_in = "on" else
                inclk_c5_from_vco;
    c5 : arm_scale_cntr
         port map (clk            => inclk_c5,
                   reset          => areset_ena_sig,
                   cout           => c5_clk,
                   initial        => c_initial_val(5),
                   high           => c_high_val(5),
                   low            => c_low_val(5),
                   mode           => c_mode_val(5),
                   ph_tap         => c_ph_val(5));

    inclk_c0_dly1 <= inclk_c0;
    inclk_c0_dly2 <= inclk_c0_dly1;
    inclk_c0_dly3 <= inclk_c0_dly2;
    inclk_c0_dly4 <= inclk_c0_dly3;
    inclk_c0_dly5 <= inclk_c0_dly4;
    inclk_c0_dly6 <= inclk_c0_dly5;

    inclk_c1_dly1 <= inclk_c1;
    inclk_c1_dly2 <= inclk_c1_dly1;
    inclk_c1_dly3 <= inclk_c1_dly2;
    inclk_c1_dly4 <= inclk_c1_dly3;
    inclk_c1_dly5 <= inclk_c1_dly4;
    inclk_c1_dly6 <= inclk_c1_dly5;

    process(inclk_c0_dly6, inclk_c1_dly6, areset_ipd, ena_ipd, sig_stop_vco)
    variable c0_got_first_rising_edge : boolean := false;
    variable c0_count : integer := 2;
    variable c0_tmp, c1_tmp : std_logic := '0';
    variable c1_got_first_rising_edge : boolean := false;
    variable c1_count : integer := 2;
    begin
        if (areset_ipd = '1' or ena_ipd = '0' or sig_stop_vco = '1') then
            c0_count := 2;
            c1_count := 2;
            c0_got_first_rising_edge := false;
            c1_got_first_rising_edge := false;
        else
                if (not c0_got_first_rising_edge) then
                    if (inclk_c0_dly6'event and inclk_c0_dly6 = '1') then
                        c0_got_first_rising_edge := true;
                    end if;
                elsif (inclk_c0_dly6'event) then
                    c0_count := c0_count + 1;
                    if (c0_count = (c_high_val(0) + c_low_val(0)) * 2) then
                        c0_count := 1;
                    end if;
                end if;
            if (inclk_c0_dly6'event and inclk_c0_dly6 = '0') then
                if (c0_count = 1) then
                    c0_tmp := '1';
                    c0_got_first_rising_edge := false;
                else
                    c0_tmp := '0';
                end if;
            end if;

                if (not c1_got_first_rising_edge) then
                    if (inclk_c1_dly6'event and inclk_c1_dly6 = '1') then
                        c1_got_first_rising_edge := true;
                    end if;
                elsif (inclk_c1_dly6'event) then
                    c1_count := c1_count + 1;
                    if (c1_count = (c_high_val(1) + c_low_val(1)) * 2) then
                        c1_count := 1;
                    end if;
                end if;
            if (inclk_c1_dly6'event and inclk_c1_dly6 = '0') then
                if (c1_count = 1) then
                    c1_tmp := '1';
                    c1_got_first_rising_edge := false;
                else
                    c1_tmp := '0';
                end if;
            end if;
        end if;

        if (enable0_counter = "c0") then
            enable0_tmp <= c0_tmp;
        elsif (enable0_counter = "c1") then
            enable0_tmp <= c1_tmp;
        else
            enable0_tmp <= '0';
        end if;

        if (enable1_counter = "c0") then
            enable1_tmp <= c0_tmp;
        elsif (enable1_counter = "c1") then
            enable1_tmp <= c1_tmp;
        else
            enable1_tmp <= '0';
        end if;

    end process;

    glocked_cntr : process(clkin, ena_ipd, areset_ipd)
    variable count : integer := 0;
    variable output : std_logic := '0';
    begin
        if (areset_ipd = '1') then
            count := 0;
            output := '0';
        elsif (clkin'event and clkin = '1') then
            if (ena_ipd = '1') then
                count := count + 1;
                if (count = gate_lock_counter) then
                    output := '1';
                end if;
            end if;
        end if;
        gate_locked <= output;
    end process;

    locked <= gate_locked and lock when gate_lock_signal = "yes" else
              lock;


    process (scandone_tmp)
    variable buf : line;
    begin
        if (scandone_tmp'event and scandone_tmp = '0') then
            if (reconfig_err = false) then
                ASSERT false REPORT "PLL Reprogramming completed with the following values (Values in parantheses indicate values before reprogramming) :" severity note;
                ASSERT false REPORT "N modulus = " &int2str(n_val(0))& " (" &int2str(n_val_old(0))& ") "severity note;
                ASSERT false REPORT "M modulus = " &int2str(m_val(0))& " (" &int2str(m_val_old(0))& ") "severity note;
                ASSERT false REPORT "M ph_tap  = " &int2str(m_ph_val)& " (" &int2str(m_ph_val_old)& ") "severity note;
                if (ss > 0) then
                    ASSERT false REPORT "M2 modulus = " &int2str(m_val(1))& " (" &int2str(m_val_old(1))& ") "severity note;
                    ASSERT false REPORT "N2 modulus = " &int2str(n_val(1))& " (" &int2str(n_val_old(1))& ") "severity note;
                end if;
                for i in 0 to 5 loop
                    write (buf, cntrs(i));
                    write (buf, string'(" :   high = "));
                    write (buf, c_high_val(i));
                    write (buf, string'(" ("));
                    write (buf, c_high_val_old(i));
                    write (buf, string'(") "));
                    write (buf, string'(" ,   low = "));
                    write (buf, sig_c_low_val_tmp(i));
                    write (buf, string'(" ("));
                    write (buf, c_low_val_old(i));
                    write (buf, string'(") "));
                    write (buf, string'(" ,   mode = "));
                    write (buf, c_mode_val(i));
                    write (buf, string'(" ("));
                    write (buf, c_mode_val_old(i));
                    write (buf, string'(") "));
                    write (buf, string'(" ,   phase tap = "));
                    write (buf, c_ph_val(i));
                    write (buf, string'(" ("));
                    write (buf, c_ph_val_old(i));
                    write (buf, string'(") "));
                    writeline(output, buf);
                end loop;

            else ASSERT false REPORT "Errors were encountered during PLL reprogramming. Please refer to error/warning messages above." severity warning;
            end if;
        end if;
    end process;

    process (scanwrite_reg, c0_clk, c1_clk, c2_clk, c3_clk, c4_clk, c5_clk, vco_out, fbclk)
    variable init : boolean := true;
    variable low, high : std_logic_vector(7 downto 0);
    variable mode : string(1 to 6) := "bypass";
    variable is_error : boolean := false;
    variable m_tmp, n_tmp : std_logic_vector(8 downto 0);
    variable c_high_val_tmp : int_array(0 to 5) := (OTHERS => 1);
    variable c_low_val_tmp  : int_array(0 to 5) := (OTHERS => 1);
    variable c_ph_val_tmp   : int_array(0 to 5) := (OTHERS => 0);
    variable c_mode_val_tmp : str_array(0 to 5);
    variable m_ph_val_tmp   : integer := 0;
    variable m_val_tmp      : int_array(0 to 1) := (OTHERS => 1);
    variable c0_rising_edge_transfer_done : boolean := false;
    variable c1_rising_edge_transfer_done : boolean := false;
    variable c2_rising_edge_transfer_done : boolean := false;
    variable c3_rising_edge_transfer_done : boolean := false;
    variable c4_rising_edge_transfer_done : boolean := false;
    variable c5_rising_edge_transfer_done : boolean := false;

    -- user to advanced variables

    variable   max_neg_abs    : integer := 0;
    variable   i_m_initial    : integer;
    variable   i_m            : integer := 1;
    variable   i_n            : integer := 1;
    variable   i_m2           : integer;
    variable   i_n2           : integer;
    variable   i_ss           : integer;
    variable   i_c_high       : int_array(0 to 5);
    variable   i_c_low        : int_array(0 to 5);
    variable   i_c_initial    : int_array(0 to 5);
    variable   i_c_ph         : int_array(0 to 5);
    variable   i_c_mode       : str_array(0 to 5);
    variable   i_m_ph         : integer;
    variable   output_count   : integer;
    variable   new_divisor    : integer;

    variable clk0_cntr : string(1 to 2) := "c0";
    variable clk1_cntr : string(1 to 2) := "c1";
    variable clk2_cntr : string(1 to 2) := "c2";
    variable clk3_cntr : string(1 to 2) := "c3";
    variable clk4_cntr : string(1 to 2) := "c4";
    variable clk5_cntr : string(1 to 2) := "c5";

    variable fbk_cntr : string(1 to 2);
    variable fbk_cntr_index : integer;
    variable start_bit : integer;
    variable quiet_time : time := 0 ps;
    variable tmp_scan_data : std_logic_vector(173 downto 0) := (OTHERS => '0');

    function slowest_clk(C0 : integer; C1 : integer; C2 : integer;
                         C3 : integer; C4 : integer; C5 : integer;
                           refclk : time; m_mod : integer) return time is
    variable max_modulus : integer := 0;
    variable q_period : time := 0 ps;
    variable refclk_int : integer := 0;
    begin
        if (C0 > C1) then
            max_modulus := C0;
        else
            max_modulus := C1;
        end if;
        if (C2 > max_modulus) then max_modulus := C2; end if;
        if (C3 > max_modulus) then max_modulus := C3; end if;
        if (C4 > max_modulus) then max_modulus := C4; end if;
        if (C5 > max_modulus) then max_modulus := C5; end if;
        refclk_int := refclk / 1 ps;
        if (m_mod /= 0) then
            q_period := (refclk_int * max_modulus / m_mod) * 1 ps;
        end if;
        return (2*q_period);
    end slowest_clk;

    begin
        if (init) then
            if (m = 0) then
                clk5_cntr  := "c5";
                clk4_cntr  := "c4";
                clk3_cntr  := "c3";
                clk2_cntr  := "c2";
                clk1_cntr  := "c1";
                clk0_cntr  := "c0";
            else
                clk5_cntr  := clk5_counter;
                clk4_cntr  := clk4_counter;
                clk3_cntr  := clk3_counter;
                clk2_cntr  := clk2_counter;
                clk1_cntr  := clk1_counter;
                clk0_cntr  := clk0_counter;
            end if;

            if (operation_mode = "external_feedback") then
                if (feedback_source = "clk0") then
                    fbk_cntr := clk0_cntr;
                elsif (feedback_source = "clk1") then
                    fbk_cntr := clk1_cntr;
                elsif (feedback_source = "clk2") then
                    fbk_cntr := clk2_cntr;
                elsif (feedback_source = "clk3") then
                    fbk_cntr := clk3_cntr;
                elsif (feedback_source = "clk4") then
                    fbk_cntr := clk4_cntr;
                elsif (feedback_source = "clk5") then
                    fbk_cntr := clk5_cntr;
                else
                    fbk_cntr := "c0";
                end if;

                if (fbk_cntr = "c0") then
                    fbk_cntr_index := 0;
                elsif (fbk_cntr = "c1") then
                    fbk_cntr_index := 1;
                elsif (fbk_cntr = "c2") then
                    fbk_cntr_index := 2;
                elsif (fbk_cntr = "c3") then
                    fbk_cntr_index := 3;
                elsif (fbk_cntr = "c4") then
                    fbk_cntr_index := 4;
                elsif (fbk_cntr = "c5") then
                    fbk_cntr_index := 5;
                end if;

                ext_fbk_cntr <= fbk_cntr;
                ext_fbk_cntr_index <= fbk_cntr_index;
            end if;
            i_clk0_counter <= clk0_cntr;
            i_clk1_counter <= clk1_cntr;
            i_clk2_counter <= clk2_cntr;
            i_clk3_counter <= clk3_cntr;
            i_clk4_counter <= clk4_cntr;
            i_clk5_counter <= clk5_cntr;


            if (m = 0) then  -- convert user parameters to advanced
                if (((pll_type = "fast") or (pll_type = "lvds")) and ((vco_multiply_by /= 0) and (vco_divide_by /= 0))) then
                    i_n := vco_divide_by;
                    i_m := vco_multiply_by;
                else
                    i_n := 1;
                    i_m := lcm (clk0_multiply_by, clk1_multiply_by,
                                clk2_multiply_by, clk3_multiply_by,
                                clk4_multiply_by, clk5_multiply_by,
                                1, 1, 1, 1, inclk0_input_frequency);
                end if;

                max_neg_abs := maxnegabs(str2int(clk0_phase_shift), 
                                         str2int(clk1_phase_shift),
                                         str2int(clk2_phase_shift),
                                         str2int(clk3_phase_shift),
                                         str2int(clk4_phase_shift),
                                         str2int(clk5_phase_shift),
                                         0, 0, 0, 0);
                i_m_ph  := counter_ph(get_phase_degree(max_neg_abs,inclk0_input_frequency), i_m, i_n); 
                i_c_ph(0) := counter_ph(get_phase_degree(ph_adjust(str2int(clk0_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_c_ph(1) := counter_ph(get_phase_degree(ph_adjust(str2int(clk1_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_c_ph(2) := counter_ph(get_phase_degree(ph_adjust(str2int(clk2_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_c_ph(3) := counter_ph(get_phase_degree(ph_adjust(str2int(clk3_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_c_ph(4) := counter_ph(get_phase_degree(ph_adjust(str2int(clk4_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_c_ph(5) := counter_ph(get_phase_degree(ph_adjust(str2int(clk5_phase_shift),max_neg_abs),inclk0_input_frequency), i_m, i_n);
                i_c_high(0) := counter_high(output_counter_value(clk0_divide_by,
                             clk0_multiply_by, i_m, i_n), clk0_duty_cycle);
                i_c_high(1) := counter_high(output_counter_value(clk1_divide_by,
                              clk1_multiply_by, i_m, i_n), clk1_duty_cycle);
                i_c_high(2) := counter_high(output_counter_value(clk2_divide_by,
                             clk2_multiply_by, i_m, i_n), clk2_duty_cycle);
                i_c_high(3) := counter_high(output_counter_value(clk3_divide_by,
                             clk3_multiply_by, i_m, i_n), clk3_duty_cycle);
                i_c_high(4) := counter_high(output_counter_value(clk4_divide_by,
                             clk4_multiply_by,  i_m, i_n), clk4_duty_cycle);
                i_c_high(5) := counter_high(output_counter_value(clk5_divide_by,
                             clk5_multiply_by,  i_m, i_n), clk5_duty_cycle);
                i_c_low(0)  := counter_low(output_counter_value(clk0_divide_by,
                             clk0_multiply_by,  i_m, i_n), clk0_duty_cycle);
                i_c_low(1)  := counter_low(output_counter_value(clk1_divide_by,
                             clk1_multiply_by,  i_m, i_n), clk1_duty_cycle);
                i_c_low(2)  := counter_low(output_counter_value(clk2_divide_by,
                             clk2_multiply_by,  i_m, i_n), clk2_duty_cycle);
                i_c_low(3)  := counter_low(output_counter_value(clk3_divide_by,
                             clk3_multiply_by,  i_m, i_n), clk3_duty_cycle);
                i_c_low(4)  := counter_low(output_counter_value(clk4_divide_by,
                             clk4_multiply_by,  i_m, i_n), clk4_duty_cycle);
                i_c_low(5)  := counter_low(output_counter_value(clk5_divide_by,
                             clk5_multiply_by,  i_m, i_n), clk5_duty_cycle);
                i_m_initial  := counter_initial(get_phase_degree(max_neg_abs, inclk0_input_frequency), i_m,i_n);
                i_c_initial(0) := counter_initial(get_phase_degree(ph_adjust(str2int(clk0_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_c_initial(1) := counter_initial(get_phase_degree(ph_adjust(str2int(clk1_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_c_initial(2) := counter_initial(get_phase_degree(ph_adjust(str2int(clk2_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_c_initial(3) := counter_initial(get_phase_degree(ph_adjust(str2int(clk3_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_c_initial(4) := counter_initial(get_phase_degree(ph_adjust(str2int(clk4_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_c_initial(5) := counter_initial(get_phase_degree(ph_adjust(str2int(clk5_phase_shift), max_neg_abs), inclk0_input_frequency), i_m, i_n);
                i_c_mode(0) := counter_mode(clk0_duty_cycle, output_counter_value(clk0_divide_by, clk0_multiply_by,  i_m, i_n));
                i_c_mode(1) := counter_mode(clk1_duty_cycle, output_counter_value(clk1_divide_by, clk1_multiply_by,  i_m, i_n));
                i_c_mode(2) := counter_mode(clk2_duty_cycle, output_counter_value(clk2_divide_by, clk2_multiply_by,  i_m, i_n));
                i_c_mode(3) := counter_mode(clk3_duty_cycle, output_counter_value(clk3_divide_by, clk3_multiply_by,  i_m, i_n));
                i_c_mode(4) := counter_mode(clk4_duty_cycle, output_counter_value(clk4_divide_by, clk4_multiply_by,  i_m, i_n));
                i_c_mode(5) := counter_mode(clk5_duty_cycle, output_counter_value(clk5_divide_by, clk5_multiply_by,  i_m, i_n));

                -- in external feedback mode, need to adjust M value to take
                -- into consideration the external feedback counter value
                if(operation_mode = "external_feedback") then
                    -- if there is a negative phase shift, m_initial can
                    -- only be 1
                    if (max_neg_abs > 0) then
                        i_m_initial := 1;
                    end if;

                    -- calculate the feedback counter multiplier
                    if (i_c_mode(fbk_cntr_index) = "bypass") then
                        output_count := 1;
                    else
                        output_count := i_c_high(fbk_cntr_index) + i_c_low(fbk_cntr_index);
                    end if;

                    if (i_m > output_count) then
                        i_m := i_m / output_count;
                    else
                        new_divisor := gcd(i_m, output_count);
                        i_m := i_m / new_divisor;
                        i_n := output_count / new_divisor;
                    end if;
                end if;
 
            else -- m /= 0

                i_n             := n;
                i_m             := m;
                i_m_initial     := m_initial;
                i_m_ph          := m_ph;
                i_c_ph(0)         := c0_ph;
                i_c_ph(1)         := c1_ph;
                i_c_ph(2)         := c2_ph;
                i_c_ph(3)         := c3_ph;
                i_c_ph(4)         := c4_ph;
                i_c_ph(5)         := c5_ph;
                i_c_high(0)       := c0_high;
                i_c_high(1)       := c1_high;
                i_c_high(2)       := c2_high;
                i_c_high(3)       := c3_high;
                i_c_high(4)       := c4_high;
                i_c_high(5)       := c5_high;
                i_c_low(0)        := c0_low;
                i_c_low(1)        := c1_low;
                i_c_low(2)        := c2_low;
                i_c_low(3)        := c3_low;
                i_c_low(4)        := c4_low;
                i_c_low(5)        := c5_low;
                i_c_initial(0)    := c0_initial;
                i_c_initial(1)    := c1_initial;
                i_c_initial(2)    := c2_initial;
                i_c_initial(3)    := c3_initial;
                i_c_initial(4)    := c4_initial;
                i_c_initial(5)    := c5_initial;
                i_c_mode(0)       := translate_string(c0_mode);
                i_c_mode(1)       := translate_string(c1_mode);
                i_c_mode(2)       := translate_string(c2_mode);
                i_c_mode(3)       := translate_string(c3_mode);
                i_c_mode(4)       := translate_string(c4_mode);
                i_c_mode(5)       := translate_string(c5_mode);

            end if; -- user to advanced conversion.

            m_initial_val <= i_m_initial;
            n_val(0) <= i_n;
            m_val(0) <= i_m;
            m_val(1) <= m2;
            n_val(1) <= n2;

            if (i_m = 1) then
                m_mode_val(0) <= "bypass";
            else
                m_mode_val(0) <= "      ";
            end if;
            if (m2 = 1) then
                m_mode_val(1) <= "bypass";
            end if;
            if (i_n = 1) then
                n_mode_val(0) <= "bypass";
            end if;
            if (n2 = 1) then
                n_mode_val(1) <= "bypass";
            end if;

            m_ph_val  <= i_m_ph;
            m_ph_val_tmp := i_m_ph;
            m_val_tmp := m_val;

            for i in 0 to 5 loop
                c_ph_val(i)         <= i_c_ph(i);
                c_initial_val(i)    <= i_c_initial(i);
                c_high_val(i)       <= i_c_high(i);
                c_low_val(i)        <= i_c_low(i);
                c_mode_val(i)       <= i_c_mode(i);
                c_high_val_tmp(i)   := i_c_high(i);
                c_low_val_tmp(i)    := i_c_low(i);
                c_mode_val_tmp(i)   := i_c_mode(i);
                c_ph_val_tmp(i)     := i_c_ph(i);
                c_ph_val_orig(i)    <= i_c_ph(i);
                c_high_val_hold(i)  <= i_c_high(i);
                c_low_val_hold(i)   <= i_c_low(i);
                c_mode_val_hold(i)  <= i_c_mode(i);
            end loop;

            init := false;
        elsif (scanwrite_reg'event and scanwrite_reg = '1') then
            ASSERT false REPORT "PLL Reprogramming Initiated" severity note;
            reconfig_err <= false;
            scandone_tmp <= transport '1';
            quiet_time := slowest_clk(c_high_val(0)+c_low_val(0),
                                      c_high_val(1)+c_low_val(1),
                                      c_high_val(2)+c_low_val(2),
                                      c_high_val(3)+c_low_val(3),
                                      c_high_val(4)+c_low_val(4),
                                      c_high_val(5)+c_low_val(5),
                                      sig_refclk_period, m_val(0));
            scandone_tmp <= transport '0' after quiet_time;

            -- LF
            -- CP

            -- cntrs c0-c5
            -- make temporary copy of scan_data for processing
            tmp_scan_data := scan_data;
            -- save old values for display info.
            m_val_old <= m_val;
            n_val_old <= n_val;
            m_mode_val_old <= m_mode_val;
            n_mode_val_old <= n_mode_val;
            m_ph_val_old <= m_ph_val;
            c_high_val_old <= c_high_val;
            c_low_val_old <= c_low_val;
            c_ph_val_old <= c_ph_val;
            c_mode_val_old <= c_mode_val;

            for i in 0 to 5 loop
                start_bit := 42 + (i*20);
                if (tmp_scan_data(start_bit + 8) = '1') then
                    c_mode_val_tmp(i) := "bypass";
                    if (tmp_scan_data(start_bit + 17) = '1') then
                        c_mode_val_tmp(i) := "   off";
                        ASSERT false REPORT "The specified bit settings will turn OFF the " &cntrs(i)& "counter. It cannot be turned on unless the part is re-initialized." severity warning;
                    end if;
                elsif (tmp_scan_data(start_bit + 17) = '1') then
                    c_mode_val_tmp(i) := "   odd";
                else
                    c_mode_val_tmp(i) := "  even";
                end if;
                if (tmp_scan_data(start_bit + 18) = '0') then
                    -- do nothing
                elsif (tmp_scan_data(start_bit + 18) = '1') then
                     if (tmp_scan_data(start_bit + 19) = '1') then
                         c_ph_val_tmp(i) := c_ph_val(i) + 1;
                         if (c_ph_val_tmp(i) > 7) then
                             c_ph_val_tmp(i) := 0;
                         end if;
                     elsif (tmp_scan_data(start_bit + 19) = '0') then
                         c_ph_val_tmp(i) := c_ph_val_tmp(i) - 1;
                         if (c_ph_val_tmp(i) < 0) then
                             c_ph_val_tmp(i) := 7;
                         end if;
                     end if;
                end if;
                high := tmp_scan_data(start_bit + 7 downto start_bit);
                low := tmp_scan_data(start_bit+16 downto start_bit+9);
                if (tmp_scan_data(start_bit+7 downto start_bit) = "00000000") then
                    c_high_val_tmp(i) := 512;
                else
                    c_high_val_tmp(i) := alt_conv_integer(high);
                end if;
                if (tmp_scan_data(start_bit+16 downto start_bit+9) = "00000000") then
                    c_low_val_tmp(i) := 512;
                else
                    c_low_val_tmp(i) := alt_conv_integer(low);
                end if;
            end loop;
            sig_c_ph_val_tmp <= c_ph_val_tmp;
            sig_c_low_val_tmp <= c_low_val_tmp;

            -- cntrs M/M2
            for i in 0 to 1 loop
                start_bit := 20 + (i*10);
                if ( i = 0 or (i = 1 and ss > 0) ) then
                    is_error := false;
                    m_tmp := tmp_scan_data(start_bit+8 downto start_bit);
                    m_val_tmp(i) := alt_conv_integer(m_tmp);
                    if (tmp_scan_data(start_bit+9) /= '1') then
                        if (m_mode_val(i) = "bypass") then
                            is_error := true;
                            reconfig_err <= true;
                            ASSERT false REPORT "Illegal mode for " &ss_cntrs(i)& "  counter. Cannot switch between BYPASS/NON-BYPASS modes. Reconfiguration may not work." severity warning;
                            -- Mode is illegal : give warning
                        elsif (tmp_scan_data(start_bit+8 downto start_bit) = "000000001") then
                            is_error := true;
                            reconfig_err <= true;
                            -- cntr value is illegal : give warning
                            ASSERT false REPORT "Illegal 1 value for " &ss_cntrs(i)& "counter. Instead " &ss_cntrs(i)& "should be BYPASSED. Reconfiguration may not work." severity warning;
                        elsif (tmp_scan_data(start_bit+8 downto start_bit) = "000000000") then
                            m_val_tmp(i) := 512;
                        end if;
                        m_mode_val(i) <= "      ";
                    elsif (tmp_scan_data(start_bit+9) = '1') then
                        if (m_mode_val(i) /= "bypass") then
                            is_error := true;
                            reconfig_err <= true;
                            ASSERT false REPORT "Illegal mode for the " &ss_cntrs(i)& "counter. Cannot switch between BYPASS/NON-BYPASS modes. Reconfiguration may not work." severity warning;
                        elsif (tmp_scan_data(start_bit) /= '0') then
                            is_error := true;
                            reconfig_err <= true;
                            ASSERT false report "Illegal value for counter " &ss_cntrs(i)& "in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work." severity warning;
                        else
                            m_val_tmp(i) := 1;
                        end if;
                        m_mode_val(i) <= "bypass";
                    end if;
                end if;
            end loop;
            if (ss > 0) then
                if (m_mode_val(0) /= m_mode_val(1)) then
                    reconfig_err <= true;
                    is_error := true;
                    ASSERT false REPORT "Incompatible modes for M/M2 counters. Either both should be BYPASSED or both NON-BYPASSED. Reconfiguration may not work." severity warning;
                end if;
            end if;
            if (scan_data(40) = '0') then
                -- do nothing
            elsif (scan_data(40) = '1' and scan_data(41) = '1') then
                m_ph_val_tmp := m_ph_val_tmp + 1;
                if (m_ph_val_tmp > 7) then
                    m_ph_val_tmp := 0;
                end if;
            elsif (scan_data(40) = '1' and scan_data(41) = '0') then
                m_ph_val_tmp := m_ph_val_tmp - 1;
                if (m_ph_val_tmp < 0) then
                    m_ph_val_tmp := 7;
                end if;
            else
                reconfig_err <= true;
                ASSERT false REPORT "Illegal values for M counter phase tap. Reconfiguration may not work." severity warning;
            end if;
          
            -- cntrs N/N2
            for i in 0 to 1 loop
                start_bit := i*10;
                if ( i = 0 or (i = 1 and ss > 0) ) then
                    is_error := false;
                    n_tmp := tmp_scan_data(start_bit+8 downto start_bit);
                    n_val(i) <= alt_conv_integer(n_tmp);
                    if (tmp_scan_data(start_bit+9) /= '1') then
                        if (n_mode_val(i) = "bypass") then
                            is_error := true;
                            reconfig_err <= true;
                            ASSERT false REPORT "Illegal mode for " &ss_cntrs(2+i)& "  counter. Cannot switch between BYPASS/NON-BYPASS modes. Reconfiguration may not work." severity warning;
                        elsif (tmp_scan_data(start_bit+8 downto start_bit) = "000000001") then
                            is_error := true;
                            reconfig_err <= true;
                            -- cntr value is illegal : give warning
                            ASSERT false REPORT "Illegal 1 value for " &ss_cntrs(2+i)& "counter. Instead " &ss_cntrs(2+i)& "should be BYPASSED. Reconfiguration may not work." severity warning;

                        elsif (tmp_scan_data(start_bit+8 downto start_bit) = "000000000") then
                            n_val(i) <= 512;
                        end if;
                        n_mode_val(i) <= "      ";
                    elsif (tmp_scan_data(start_bit+9) = '1') then
                        if (n_mode_val(i) /= "bypass") then
                            is_error := true;
                            reconfig_err <= true;
                            ASSERT false REPORT "Illegal mode for the " &ss_cntrs(2+i)& "counter. Cannot switch between BYPASS/NON-BYPASS modes. Reconfiguration may not work." severity warning;
                        elsif (tmp_scan_data(start_bit) /= '0') then
                            is_error := true;
                            reconfig_err <= true;
                            ASSERT false report "Illegal value for counter " &ss_cntrs(2+i)& "in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work." severity warning;
                        else
                            n_val(i) <= 1;
                        end if;
                        n_mode_val(i) <= "bypass";
                    end if;
                end if;
            end loop;
            if (ss > 0) then
                if (n_mode_val(0) /= n_mode_val(1)) then
                    reconfig_err <= true;
                    is_error := true;
                    ASSERT false REPORT "Incompatible modes for N/N2 counters. Either both should be BYPASSED or both NON-BYPASSED. Reconfiguration may not work." severity warning;
                end if;
            end if;
      end if;

      if (scandone_tmp = '1') then
          if (fbclk'event and fbclk = '1') then
              m_val <= m_val_tmp;
          end if;

          if (c0_clk'event and c0_clk = '1') then
              c_high_val_hold(0) <= c_high_val_tmp(0);
              c_mode_val_hold(0) <= c_mode_val_tmp(0);
              c0_rising_edge_transfer_done := true;
              c_high_val(0) <= c_high_val_hold(0);
              c_mode_val(0) <= c_mode_val_hold(0);
          end if;
          if (c1_clk'event and c1_clk = '1') then
              c_high_val_hold(1) <= c_high_val_tmp(1);
              c_mode_val_hold(1) <= c_mode_val_tmp(1);
              c1_rising_edge_transfer_done := true;
              c_high_val(1) <= c_high_val_hold(1);
              c_mode_val(1) <= c_mode_val_hold(1);
          end if;
          if (c2_clk'event and c2_clk = '1') then
              c_high_val_hold(2) <= c_high_val_tmp(2);
              c_mode_val_hold(2) <= c_mode_val_tmp(2);
              c2_rising_edge_transfer_done := true;
              c_high_val(2) <= c_high_val_hold(2);
              c_mode_val(2) <= c_mode_val_hold(2);
          end if;
          if (c3_clk'event and c3_clk = '1') then
              c_high_val_hold(3) <= c_high_val_tmp(3);
              c_mode_val_hold(3) <= c_mode_val_tmp(3);
              c_high_val(3) <= c_high_val_hold(3);
              c_mode_val(3) <= c_mode_val_hold(3);
              c3_rising_edge_transfer_done := true;
          end if;
          if (c4_clk'event and c4_clk = '1') then
              c_high_val_hold(4) <= c_high_val_tmp(4);
              c_mode_val_hold(4) <= c_mode_val_tmp(4);
              c_high_val(4) <= c_high_val_hold(4);
              c_mode_val(4) <= c_mode_val_hold(4);
              c4_rising_edge_transfer_done := true;
          end if;
          if (c5_clk'event and c5_clk = '1') then
              c_high_val_hold(5) <= c_high_val_tmp(5);
              c_mode_val_hold(5) <= c_mode_val_tmp(5);
              c_high_val(5) <= c_high_val_hold(5);
              c_mode_val(5) <= c_mode_val_hold(5);
              c5_rising_edge_transfer_done := true;
          end if;
      end if;

      if (c0_clk'event and c0_clk = '0' and c0_rising_edge_transfer_done) then
          c_low_val_hold(0) <= c_low_val_tmp(0);
          c_low_val(0) <= c_low_val_hold(0);
      end if;
      if (c1_clk'event and c1_clk = '0' and c1_rising_edge_transfer_done) then
          c_low_val_hold(1) <= c_low_val_tmp(1);
          c_low_val(1) <= c_low_val_hold(1);
      end if;
      if (c2_clk'event and c2_clk = '0' and c2_rising_edge_transfer_done) then
          c_low_val_hold(2) <= c_low_val_tmp(2);
          c_low_val(2) <= c_low_val_hold(2);
      end if;
      if (c3_clk'event and c3_clk = '0' and c3_rising_edge_transfer_done) then
          c_low_val_hold(3) <= c_low_val_tmp(3);
          c_low_val(3) <= c_low_val_hold(3);
      end if;
      if (c4_clk'event and c4_clk = '0' and c4_rising_edge_transfer_done) then
          c_low_val_hold(4) <= c_low_val_tmp(4);
          c_low_val(4) <= c_low_val_hold(4);
      end if;
      if (c5_clk'event and c5_clk = '0' and c5_rising_edge_transfer_done) then
          c_low_val_hold(5) <= c_low_val_tmp(5);
          c_low_val(5) <= c_low_val_hold(5);
      end if;

      if (scandone_tmp = '1') then
          if (vco_out(0)'event and vco_out(0) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 0) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 0) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(1)'event and vco_out(1) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 1) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 1) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(2)'event and vco_out(2) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 2) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 2) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(3)'event and vco_out(3) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 3) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 3) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(4)'event and vco_out(4) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 4) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 4) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(5)'event and vco_out(5) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 5) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 5) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(6)'event and vco_out(6) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 6) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 6) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
          if (vco_out(7)'event and vco_out(7) = '0') then
              for i in 0 to 5 loop
                  if (c_ph_val(i) = 7) then
                      c_ph_val(i) <= c_ph_val_tmp(i);
                  end if;
              end loop;
              if (m_ph_val = 7) then
                  m_ph_val <= m_ph_val_tmp;
              end if;
          end if;
      end if;

      if (vco_out'event) then
          inclk_c0_from_vco <= vco_out(c_ph_val(0));
          inclk_c1_from_vco <= vco_out(c_ph_val(1));
          inclk_c2_from_vco <= vco_out(c_ph_val(2));
          inclk_c3_from_vco <= vco_out(c_ph_val(3));
          inclk_c4_from_vco <= vco_out(c_ph_val(4));
          inclk_c5_from_vco <= vco_out(c_ph_val(5));

          if (enable0_counter = "c0") then
              inclk_sclkout0_from_vco <= vco_out(c_ph_val(0));
          elsif (enable0_counter = "c1") then
              inclk_sclkout0_from_vco <= vco_out(c_ph_val(1));
          end if;

          if (enable1_counter = "c0") then
              inclk_sclkout1_from_vco <= vco_out(c_ph_val(0));
          elsif (enable1_counter = "c1") then
              inclk_sclkout1_from_vco <= vco_out(c_ph_val(1));
          end if;

          inclk_m_from_vco <= vco_out(m_ph_val);
      end if;

   end process;

    process (schedule_vco, areset_ipd, ena_ipd, pfdena_ipd, refclk, fbclk)
    variable sched_time : time := 0 ps;

    TYPE time_array is ARRAY (0 to 7) of time;
    variable init : boolean := true;
    variable refclk_period : time;
    variable m_times_vco_period : time;
    variable new_m_times_vco_period : time;

    variable phase_shift : time_array := (OTHERS => 0 ps);
    variable last_phase_shift : time_array := (OTHERS => 0 ps);

    variable l_index : integer := 1;
    variable cycle_to_adjust : integer := 0;

    variable stop_vco : boolean := false;

    variable locked_tmp : std_logic := '0';
    variable pll_is_locked : boolean := false;
    variable pll_about_to_lock : boolean := false;
    variable cycles_to_lock : integer := 0;
    variable cycles_to_unlock : integer := 0;

    variable got_first_refclk : boolean := false;
    variable got_second_refclk : boolean := false;
    variable got_first_fbclk : boolean := false;

    variable refclk_time : time := 0 ps;
    variable fbclk_time : time := 0 ps;
    variable first_fbclk_time : time := 0 ps;

    variable fbclk_period : time := 0 ps;

    variable first_schedule : boolean := true;

    variable vco_val : std_logic := '0';
    variable vco_period_was_phase_adjusted : boolean := false;
    variable phase_adjust_was_scheduled : boolean := false;

    variable loop_xplier : integer;
    variable loop_initial : integer := 0;
    variable loop_ph : integer := 0;
    variable loop_time_delay : integer := 0;

    variable initial_delay : time := 0 ps;
    variable vco_per : time;
    variable tmp_rem : integer;
    variable my_rem : integer;
    variable fbk_phase : integer := 0;

    variable pull_back_M : integer := 0;
    variable total_pull_back : integer := 0;
    variable fbk_delay : integer := 0;

    variable offset : time := 0 ps;

    variable tmp_vco_per : integer := 0;
    variable high_time : time;
    variable low_time : time;

    variable got_refclk_posedge : boolean := false;
    variable got_fbclk_posedge : boolean := false;
    variable inclk_out_of_range : boolean := false;

    variable ext_fbk_cntr_modulus : integer := 1;
    variable init_clks : boolean := true;
    begin
        if (init) then
            -- jump-start the VCO
            -- add 1 ps delay to ensure all signals are updated to initial
            -- values
            schedule_vco <= transport not schedule_vco after 1 ps;

            init := false;
        end if;

        if (schedule_vco'event) then
            if (init_clks) then
                refclk_period := inclk0_input_frequency * n_val(0) * 1 ps;

                m_times_vco_period := refclk_period;
                new_m_times_vco_period := refclk_period;
                init_clks := false;
            end if;
            sched_time := 0 ps;
            for i in 0 to 7 loop
                last_phase_shift(i) := phase_shift(i);
            end loop;
            cycle_to_adjust := 0;
            l_index := 1;
            m_times_vco_period := new_m_times_vco_period;
        end if;

        -- areset was asserted
        if (areset_ipd'event and areset_ipd = '1') then
            assert false report "PLL was reset" severity note;
        end if;

        -- ena was deasserted
        if (ena_ipd'event and ena_ipd = '0') then
            assert false report "PLL was disabled" severity note;
        end if;

        if (schedule_vco'event and (areset_ipd = '1' or ena_ipd = '0' or stop_vco)) then

            -- drop VCO taps to 0
            for i in 0 to 7 loop
                vco_out(i) <= transport '0' after last_phase_shift(i);
                phase_shift(i) := 0 ps;
                last_phase_shift(i) := 0 ps;
            end loop;

            -- reset lock parameters
            locked_tmp := '0';
            pll_is_locked := false;
            pll_about_to_lock := false;
            cycles_to_lock := 0;
            cycles_to_unlock := 0;

            got_first_refclk := false;
            got_second_refclk := false;
            refclk_time := 0 ps;
            got_first_fbclk := false;
            fbclk_time := 0 ps;
            first_fbclk_time := 0 ps;
            fbclk_period := 0 ps;

            first_schedule := true;
            vco_val := '0';
            vco_period_was_phase_adjusted := false;
            phase_adjust_was_scheduled := false;

        elsif ((schedule_vco'event or ena_ipd'event or areset_ipd'event) and areset_ipd = '0' and ena_ipd = '1' and (not stop_vco) and now > 0 ps) then

            -- note areset deassert time
            -- note it as refclk_time to prevent false triggering
            -- of stop_vco after areset
            if (areset_ipd'event and areset_ipd = '0') then
                refclk_time := now;
            end if;

            -- calculate loop_xplier : this will be different from m_val
            -- in external_feedback_mode
            loop_xplier := m_val(0);
            loop_initial := m_initial_val - 1;
            loop_ph := m_ph_val;

            if (operation_mode = "external_feedback") then
                if (ext_fbk_cntr_mode = "bypass") then
                    ext_fbk_cntr_modulus := 1;
                else
                    ext_fbk_cntr_modulus := ext_fbk_cntr_high + ext_fbk_cntr_low;
                end if;
                loop_xplier := m_val(0) * (ext_fbk_cntr_modulus);
                loop_ph := ext_fbk_cntr_ph;
                loop_initial := ext_fbk_cntr_initial - 1 + ((m_initial_val - 1) * ext_fbk_cntr_modulus);
            end if;

            -- convert initial value to delay
            initial_delay := (loop_initial * m_times_vco_period)/loop_xplier;

            -- convert loop ph_tap to delay
            my_rem := (m_times_vco_period/1 ps) rem loop_xplier;
            tmp_vco_per := (m_times_vco_period/1 ps) / loop_xplier;
            if (my_rem /= 0) then
                tmp_vco_per := tmp_vco_per + 1;
            end if;
            fbk_phase := (loop_ph * tmp_vco_per)/8;

            if (operation_mode = "external_feedback") then
                pull_back_M :=  (m_initial_val - 1) * ext_fbk_cntr_modulus * ((refclk_period/loop_xplier)/1 ps);
                while (pull_back_M > refclk_period/1 ps) loop
                    pull_back_M := pull_back_M - refclk_period/ 1 ps;
                end loop;
            else
                pull_back_M := initial_delay/1 ps + fbk_phase;
            end if;

            total_pull_back := pull_back_M;

            if (simulation_type = "timing") then
                total_pull_back := total_pull_back + pll_compensation_delay;
            end if;
            while (total_pull_back > refclk_period/1 ps) loop
                total_pull_back := total_pull_back - refclk_period/1 ps;
            end loop;

            if (total_pull_back > 0) then
                offset := refclk_period - (total_pull_back * 1 ps);
            end if;
            if (operation_mode = "external_feedback") then
                fbk_delay := pull_back_M;
                if (simulation_type = "timing") then
                    fbk_delay := fbk_delay + pll_compensation_delay;
                end if;
            else
                fbk_delay := total_pull_back - fbk_phase;
                if (fbk_delay < 0) then
                    offset := offset - (fbk_phase * 1 ps);
                    fbk_delay := total_pull_back;
                end if;
            end if;

            -- assign m_delay
            m_delay <= transport fbk_delay after 1 ps;

            my_rem := (m_times_vco_period/1 ps) rem loop_xplier;
            for i in 1 to loop_xplier loop
                -- adjust cycles
                tmp_vco_per := (m_times_vco_period/1 ps)/loop_xplier;
                if (my_rem /= 0 and l_index <= my_rem) then
                   tmp_rem := (loop_xplier * l_index) rem my_rem;
                   cycle_to_adjust := (loop_xplier * l_index) / my_rem;
                   if (tmp_rem /= 0) then
                      cycle_to_adjust := cycle_to_adjust + 1;
                   end if;
                end if;
                if (cycle_to_adjust = i) then
                    tmp_vco_per := tmp_vco_per + 1;
                    l_index := l_index + 1;
                end if;

                -- calculate high and low periods
                vco_per := tmp_vco_per * 1 ps;
                high_time := (tmp_vco_per/2) * 1 ps;
                if (tmp_vco_per rem 2 /= 0) then
                   high_time := high_time + 1 ps;
                end if;
                low_time := vco_per - high_time;

                -- schedule the rising and falling edges
                for j in 1 to 2 loop
                   vco_val := not vco_val;
                   if (vco_val = '0') then
                      sched_time := sched_time + high_time;
                   elsif (vco_val = '1') then
                      sched_time := sched_time + low_time;
                   end if;

                   -- schedule the phase taps
                   for k in 0 to 7 loop
                       phase_shift(k) := (k * vco_per)/8;
                       if (first_schedule) then
                          vco_out(k) <= transport vco_val after (sched_time + phase_shift(k));
                       else
                          vco_out(k) <= transport vco_val after (sched_time + last_phase_shift(k));
                       end if;
                   end loop;
                end loop;
            end loop;

            -- schedule once more
            if (first_schedule) then
                vco_val := not vco_val;
                if (vco_val = '0') then
                   sched_time := sched_time + high_time;
                elsif (vco_val = '1') then
                   sched_time := sched_time + low_time;
                end if;
                -- schedule the phase taps
                for k in 0 to 7 loop
                    phase_shift(k) := (k * vco_per)/8;
                    vco_out(k) <= transport vco_val after (sched_time + phase_shift(k));
                end loop;
                first_schedule := false;
            end if;

            schedule_vco <= transport not schedule_vco after sched_time;

            if (vco_period_was_phase_adjusted) then
                m_times_vco_period := refclk_period;
                new_m_times_vco_period := refclk_period;
                vco_period_was_phase_adjusted := false;
                phase_adjust_was_scheduled := true;

                vco_per := m_times_vco_period/loop_xplier;
                for k in 0 to 7 loop
                    phase_shift(k) := (k * vco_per)/8;
                end loop;
            end if;
        end if;

        if (refclk'event and refclk = '1' and areset_ipd = '0') then
            got_refclk_posedge := true;
            if (not got_first_refclk) then
                got_first_refclk := true;
            else
                got_second_refclk := true;
                refclk_period := now - refclk_time;

                -- check if incoming freq. will cause VCO range to be
                -- exceeded
                if ( (vco_max /= 0 and vco_min /= 0 and pfdena_ipd = '1') and
                     (((refclk_period/1 ps)/loop_xplier > vco_max) or
                      ((refclk_period/1 ps)/loop_xplier < vco_min)) ) then
                    if (pll_is_locked) then
                        assert false report " Input clock freq. is not within VCO range : PLL may lose lock" severity warning;
                       if (inclk_out_of_range) then
                           pll_is_locked := false;
                           locked_tmp := '0';
                           pll_about_to_lock := false;
                           cycles_to_lock := 0;
                           vco_period_was_phase_adjusted := false;
                           phase_adjust_was_scheduled := false;
                           assert false report "PLL lost lock." severity note;
                       end if;
                    else
                        assert false report " Input clock freq. is not within VCO range : PLL may not lock. Please use the correct frequency." severity warning;
                    end if;
                    inclk_out_of_range := true;
                else
                    inclk_out_of_range := false;
                end if;
            end if;

            if (stop_vco) then
                stop_vco := false;
                schedule_vco <= not schedule_vco;
            end if;

            refclk_time := now;
        else
            got_refclk_posedge := false;
        end if;

        if (fbclk'event and fbclk = '1') then
            got_fbclk_posedge := true;
            if (not got_first_fbclk) then
                got_first_fbclk := true;
            else
                fbclk_period := now - fbclk_time;
            end if;

            -- need refclk_period here, so initialized to proper value above
            if ( (now - refclk_time > 1.5 * refclk_period) and pfdena_ipd = '1') then
                stop_vco := true;
                -- reset
                got_first_refclk := false;
                got_first_fbclk := false;
                got_second_refclk := false;
                if (pll_is_locked) then
                    pll_is_locked := false;
                    locked_tmp := '0';
                    assert false report "PLL lost lock due to loss of input clock" severity note;
                end if;
                pll_about_to_lock := false;
                cycles_to_lock := 0;
                cycles_to_unlock := 0;
                first_schedule := true;
            end if;
            fbclk_time := now;
        else
            got_fbclk_posedge := false;
        end if;

        if ((got_refclk_posedge or got_fbclk_posedge) and got_second_refclk and pfdena_ipd = '1' and (not inclk_out_of_range)) then

            -- now we know actual incoming period
            if ( abs(fbclk_time - refclk_time) <= 5 ps or
                 (got_first_fbclk and abs(refclk_period - abs(fbclk_time - refclk_time)) <= 5 ps)) then
                -- considered in phase
                if (cycles_to_lock = valid_lock_multiplier - 1) then
                    pll_about_to_lock := true;
                end if;
                if (cycles_to_lock = valid_lock_multiplier) then
                    if (not pll_is_locked) then
                        assert false report "Stratix II PLL locked to incoming clock" severity note;
                    end if;
                    pll_is_locked := true;
                    locked_tmp := '1';
                    cycles_to_unlock := 0;
                end if;
                -- increment lock counter only if second part of above
                -- time check is NOT true
                if (not(abs(refclk_period - abs(fbclk_time - refclk_time)) <= 5 ps)) then
                    cycles_to_lock := cycles_to_lock + 1;
                end if;

                -- adjust m_times_vco_period
                new_m_times_vco_period := refclk_period;
            else
                -- if locked, begin unlock
                if (pll_is_locked) then
                    cycles_to_unlock := cycles_to_unlock + 1;
                    if (cycles_to_unlock = invalid_lock_multiplier) then
                        pll_is_locked := false;
                        locked_tmp := '0';
                        pll_about_to_lock := false;
                        cycles_to_lock := 0;
                        vco_period_was_phase_adjusted := false;
                        phase_adjust_was_scheduled := false;
                        assert false report "PLL lost lock." severity note;
                    end if;
                end if;
                if ( abs(refclk_period - fbclk_period) <= 2 ps ) then
                    -- frequency is still good
                    if (now = fbclk_time and (not phase_adjust_was_scheduled)) then
                        if ( abs(fbclk_time - refclk_time) > refclk_period/2) then
                            new_m_times_vco_period := m_times_vco_period + (refclk_period - abs(fbclk_time - refclk_time));
                            vco_period_was_phase_adjusted := true;
                        else
                            new_m_times_vco_period := m_times_vco_period - abs(fbclk_time - refclk_time);
                            vco_period_was_phase_adjusted := true;
                        end if;

                    end if;
                else
                    phase_adjust_was_scheduled := false;
                    new_m_times_vco_period := refclk_period;
                end if;
            end if;
        end if;

        if (pfdena_ipd = '0') then
            if (pll_is_locked) then
                locked_tmp := 'X';
            end if;
            pll_is_locked := false;
            cycles_to_lock := 0;
        end if;

        -- give message only at time of deassertion
        if (pfdena_ipd'event and pfdena_ipd = '0') then
            assert false report "PFDENA deasserted." severity note;
        elsif (pfdena_ipd'event and pfdena_ipd = '1') then
            got_first_refclk := false;
            got_second_refclk := false;
            refclk_time := now;
        end if;

        if (reconfig_err) then
            lock <= '0';
        else
            lock <= locked_tmp;
        end if;
        about_to_lock <= pll_about_to_lock after 1 ps;

        -- signal to calculate quiet_time
        sig_refclk_period <= refclk_period;

        -- signals for debugging
        sig_offset <= offset;
        sig_refclk_time <= refclk_time;
        sig_fbclk_period <= fbclk_period;
        sig_vco_period_was_phase_adjusted <= vco_period_was_phase_adjusted;
        sig_phase_adjust_was_scheduled <= phase_adjust_was_scheduled;
        if (stop_vco = true) then
            sig_stop_vco <= '1';
        else
            sig_stop_vco <= '0';
        end if;
        sig_m_times_vco_period <= m_times_vco_period;
        sig_new_m_times_vco_period <= new_m_times_vco_period;
        sig_got_refclk_posedge <= got_refclk_posedge;
        sig_got_fbclk_posedge <= got_fbclk_posedge;
        sig_got_second_refclk <= got_second_refclk;
    end process;

    process (scanclk_ipd)
      variable j : integer := 0;
      variable scanread_active_edge : time := 0 ps;
      variable got_first_scanclk : boolean := false;
      variable scanclk_last_rising_edge : time := 0 ps;
      variable scanclk_period : time := 0 ps;
    begin
        if (scanclk_ipd'event and scanclk_ipd = '1') then
            -- register scanread
            scanread_reg <= scanread_ipd;
            if (scanread_ipd = '1' and scanread_reg = '0') then
                scanread_active_edge := now;
            end if;

            -- register scanwrite
            scanwrite_reg <= scanwrite_ipd;

            if (got_first_scanclk) then
                scanclk_period := now - scanclk_last_rising_edge;
            else
                got_first_scanclk := true;
            end if;
            if (scanclk_period > 0 ps and scanread_reg = '1' and scanwrite_reg = '0') then
                if (now - scanread_active_edge >= scanclk_period) then
                    for j in scan_chain_length - 1 downto 1 loop
                         scan_data(j) <= scan_data(j-1);
                    end loop;
                    scan_data(0) <= scandata_ipd;
                else
                    ASSERT FALSE REPORT "SCANREAD must go high at least one cycle before SCANDATA is read in." severity warning;
                end if;
            end if;
            scanclk_last_rising_edge := now;
        end if;
    end process;

    clk0_tmp <= c0_clk when i_clk0_counter = "c0" else
                c1_clk when i_clk0_counter = "c1" else
                c2_clk when i_clk0_counter = "c2" else
                c3_clk when i_clk0_counter = "c3" else
                c4_clk when i_clk0_counter = "c4" else
                c5_clk when i_clk0_counter = "c5" else
                '0';
    clk(0) <= clk0_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
              'X';

    clk1_tmp <= c0_clk when i_clk1_counter = "c0" else
                c1_clk when i_clk1_counter = "c1" else
                c2_clk when i_clk1_counter = "c2" else
                c3_clk when i_clk1_counter = "c3" else
                c4_clk when i_clk1_counter = "c4" else
                c5_clk when i_clk1_counter = "c5" else
                '0';
    clk(1) <= clk1_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
              'X';

    clk2_tmp <= c0_clk when i_clk2_counter = "c0" else
                c1_clk when i_clk2_counter = "c1" else
                c2_clk when i_clk2_counter = "c2" else
                c3_clk when i_clk2_counter = "c3" else
                c4_clk when i_clk2_counter = "c4" else
                c5_clk when i_clk2_counter = "c5" else
                '0';
    clk(2) <= clk2_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
              'X';

    clk3_tmp <= c0_clk when i_clk3_counter = "c0" else
                c1_clk when i_clk3_counter = "c1" else
                c2_clk when i_clk3_counter = "c2" else
                c3_clk when i_clk3_counter = "c3" else
                c4_clk when i_clk3_counter = "c4" else
                c5_clk when i_clk3_counter = "c5" else
                '0';
    clk(3) <= clk3_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
              'X';

    clk4_tmp <= c0_clk when i_clk4_counter = "c0" else
                c1_clk when i_clk4_counter = "c1" else
                c2_clk when i_clk4_counter = "c2" else
                c3_clk when i_clk4_counter = "c3" else
                c4_clk when i_clk4_counter = "c4" else
                c5_clk when i_clk4_counter = "c5" else
                '0';
    clk(4) <= clk4_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
              'X';

    clk5_tmp <= c0_clk when i_clk5_counter = "c0" else
                c1_clk when i_clk5_counter = "c1" else
                c2_clk when i_clk5_counter = "c2" else
                c3_clk when i_clk5_counter = "c3" else
                c4_clk when i_clk5_counter = "c4" else
                c5_clk when i_clk5_counter = "c5" else
                '0';
    clk(5) <= clk5_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
              'X';

    sclkout(0) <= sclkout0_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
               'X';

    sclkout(1) <= sclkout1_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
               'X';

    enable0 <= enable0_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
               'X';
    enable1 <= enable1_tmp when (areset_ipd = '1' or ena_ipd = '0') or (about_to_lock and (not reconfig_err)) else
               'X';

    scandataout <= scandataout_tmp;
    scandone <= scandone_tmp;

end vital_pll;
-- END ARCHITECTURE VITAL_PLL


-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name      : ALTPLL
--
-- Description      : Phase-Locked Loop (PLL) behavioral model. Model supports
--                    basic PLL features such as clock division and
--                    multiplication, programmable duty cycle and phase shifts,
--                    various feedback modes and clock delays. Also supports
--                    real-time reconfiguration of PLL "parameters" and clock
--                    switchover between the 2 input reference clocks.
--                    Up to 10 clock outputs may be used.
--
-- Limitations      : Applicable to Stratix, Stratix-GX and Stratix II device
--                    families only. There is no support in the model for
--                    spread-spectrum feature.
--
-- Expected results : Up to 10 different output clocks, each defined by its own
--                    parameters. Locked output (active high) indicates when
--                    the PLL locks. clkbad, clkloss and activeclock highlights
--                    which clock has gone bad, when clock switchover initiates,
--                    and which input clock (0 or 1) is the reference clock,
--                    respectively. scandataout is the data output of the serial
--                    scan chain.
--
-- END ENTITY HEADER -----------------------------------------------------------

library ieee, altera;
use ieee.std_logic_1164.all;
use altera.ALTERA_DEVICE_FAMILIES.all;
use altera.altera_mf_components.all;

-- ENTITY DECLARATION
entity altpll is
generic (
        intended_device_family     : string := "Stratix" ;
        operation_mode             : string := "NORMAL" ;
        pll_type                   : string := "AUTO" ;
        qualify_conf_done          : string := "OFF" ;
        compensate_clock           : string := "CLK0" ;
        scan_chain                 : string := "LONG";
        primary_clock              : string := "inclk0" ;
        inclk0_input_frequency     : positive;   -- required parameter
        inclk1_input_frequency     : natural := 0;
        gate_lock_signal           : string := "NO";
        gate_lock_counter          : integer := 0;
        lock_high                  : natural := 1;
        lock_low                   : natural := 5;
        valid_lock_multiplier      : natural := 1;
        invalid_lock_multiplier    : natural := 5;
        switch_over_type           : string := "AUTO" ;
        switch_over_on_lossclk     : string := "OFF" ;
        switch_over_on_gated_lock  : string := "OFF" ;
        enable_switch_over_counter : string := "OFF";
        switch_over_counter        : natural := 0;
        feedback_source            : string := "EXTCLK0" ;
        bandwidth                  : natural := 0;
        bandwidth_type             : string := "UNUSED";
        spread_frequency           : natural := 0;
        down_spread                : string := "0.0";
        -- simulation-only parameters
        simulation_type            : string := "functional";
        source_is_pll              : string := "off";
        skip_vco                   : string := "off";
        -- internal clock (i.e. clock that feeds the core) specifications
        clk5_multiply_by           : positive := 1;
        clk4_multiply_by           : positive := 1;
        clk3_multiply_by           : positive := 1;
        clk2_multiply_by           : positive := 1;
        clk1_multiply_by           : positive := 1;
        clk0_multiply_by           : positive := 1;
        clk5_divide_by             : positive := 1;
        clk4_divide_by             : positive := 1;
        clk3_divide_by             : positive := 1;
        clk2_divide_by             : positive := 1;
        clk1_divide_by             : positive := 1;
        clk0_divide_by             : positive := 1;
        clk5_phase_shift           : string := "0";
        clk4_phase_shift           : string := "0";
        clk3_phase_shift           : string := "0";
        clk2_phase_shift           : string := "0";
        clk1_phase_shift           : string := "0";
        clk0_phase_shift           : string := "0";
        clk5_time_delay            : string := "0";
        clk4_time_delay            : string := "0";
        clk3_time_delay            : string := "0";
        clk2_time_delay            : string := "0";
        clk1_time_delay            : string := "0";
        clk0_time_delay            : string := "0";
        clk5_duty_cycle            : natural := 50;
        clk4_duty_cycle            : natural := 50;
        clk3_duty_cycle            : natural := 50;
        clk2_duty_cycle            : natural := 50;
        clk1_duty_cycle            : natural := 50;
        clk0_duty_cycle            : natural := 50;
        -- external clock (i.e. clock that feeds pins) specifications
        extclk3_multiply_by        : positive := 1;
        extclk2_multiply_by        : positive := 1;
        extclk1_multiply_by        : positive := 1;
        extclk0_multiply_by        : positive := 1;
        extclk3_divide_by          : positive := 1;
        extclk2_divide_by          : positive := 1;
        extclk1_divide_by          : positive := 1;
        extclk0_divide_by          : positive := 1;
        extclk3_phase_shift        : string := "0";
        extclk2_phase_shift        : string := "0";
        extclk1_phase_shift        : string := "0";
        extclk0_phase_shift        : string := "0";
        extclk3_time_delay         : string := "0";
        extclk2_time_delay         : string := "0";
        extclk1_time_delay         : string := "0";
        extclk0_time_delay         : string := "0";
        extclk3_duty_cycle         : natural := 50;
        extclk2_duty_cycle         : natural := 50;
        extclk1_duty_cycle         : natural := 50;
        extclk0_duty_cycle         : natural := 50;

        -- The following 4 parameters are for Stratix II pll in lvds mode only 
        vco_multiply_by            : integer := 1;
        vco_divide_by              : integer := 1;
        sclkout0_phase_shift       : string := "0";
        sclkout1_phase_shift       : string := "0";

        -- advanced user parameters
        vco_min                    : natural := 0;
        vco_max                    : natural := 0;
        vco_center                 : natural := 0;
        pfd_min                    : natural := 0;
        pfd_max                    : natural := 0;
        m_initial                  : natural := 1;
        m                          : natural := 0; -- m must default to 0 to force altpll to calculate the internal parameters for itself
        n                          : natural := 1;
        m2                         : natural := 1;
        n2                         : natural := 1;
        ss                         : natural := 0;
        c0_high                    : natural := 1;
        c1_high                    : natural := 1;
        c2_high                    : natural := 1;
        c3_high                    : natural := 1;
        c4_high                    : natural := 1;
        c5_high                    : natural := 1;
        l0_high                    : natural := 1;
        l1_high                    : natural := 1;
        g0_high                    : natural := 1;
        g1_high                    : natural := 1;
        g2_high                    : natural := 1;
        g3_high                    : natural := 1;
        e0_high                    : natural := 1;
        e1_high                    : natural := 1;
        e2_high                    : natural := 1;
        e3_high                    : natural := 1;
        c0_low                     : natural := 1;
        c1_low                     : natural := 1;
        c2_low                     : natural := 1;
        c3_low                     : natural := 1;
        c4_low                     : natural := 1;
        c5_low                     : natural := 1;
        l0_low                     : natural := 1;
        l1_low                     : natural := 1;
        g0_low                     : natural := 1;
        g1_low                     : natural := 1;
        g2_low                     : natural := 1;
        g3_low                     : natural := 1;
        e0_low                     : natural := 1;
        e1_low                     : natural := 1;
        e2_low                     : natural := 1;
        e3_low                     : natural := 1;
        c0_initial                 : natural := 1;
        c1_initial                 : natural := 1;
        c2_initial                 : natural := 1;
        c3_initial                 : natural := 1;
        c4_initial                 : natural := 1;
        c5_initial                 : natural := 1;
        l0_initial                 : natural := 1;
        l1_initial                 : natural := 1;
        g0_initial                 : natural := 1;
        g1_initial                 : natural := 1;
        g2_initial                 : natural := 1;
        g3_initial                 : natural := 1;
        e0_initial                 : natural := 1;
        e1_initial                 : natural := 1;
        e2_initial                 : natural := 1;
        e3_initial                 : natural := 1;
        c0_mode                    : string := "bypass" ;
        c1_mode                    : string := "bypass" ;
        c2_mode                    : string := "bypass" ;
        c3_mode                    : string := "bypass" ;
        c4_mode                    : string := "bypass" ;
        c5_mode                    : string := "bypass" ;
        l0_mode                    : string := "bypass" ;
        l1_mode                    : string := "bypass" ;
        g0_mode                    : string := "bypass" ;
        g1_mode                    : string := "bypass" ;
        g2_mode                    : string := "bypass" ;
        g3_mode                    : string := "bypass" ;
        e0_mode                    : string := "bypass" ;
        e1_mode                    : string := "bypass" ;
        e2_mode                    : string := "bypass" ;
        e3_mode                    : string := "bypass" ;
        c0_ph                      : natural := 0;
        c1_ph                      : natural := 0;
        c2_ph                      : natural := 0;
        c3_ph                      : natural := 0;
        c4_ph                      : natural := 0;
        c5_ph                      : natural := 0;
        l0_ph                      : natural := 0;
        l1_ph                      : natural := 0;
        g0_ph                      : natural := 0;
        g1_ph                      : natural := 0;
        g2_ph                      : natural := 0;
        g3_ph                      : natural := 0;
        e0_ph                      : natural := 0;
        e1_ph                      : natural := 0;
        e2_ph                      : natural := 0;
        e3_ph                      : natural := 0;
        m_ph                       : natural := 0;
        l0_time_delay              : natural := 0;
        l1_time_delay              : natural := 0;
        g0_time_delay              : natural := 0;
        g1_time_delay              : natural := 0;
        g2_time_delay              : natural := 0;
        g3_time_delay              : natural := 0;
        e0_time_delay              : natural := 0;
        e1_time_delay              : natural := 0;
        e2_time_delay              : natural := 0;
        e3_time_delay              : natural := 0;
        m_time_delay               : natural := 0;
        n_time_delay               : natural := 0;
        c1_use_casc_in             : string := "off";
        c2_use_casc_in             : string := "off";
        c3_use_casc_in             : string := "off";
        c4_use_casc_in             : string := "off";
        c5_use_casc_in             : string := "off";
        extclk3_counter            : string := "e3" ;
        extclk2_counter            : string := "e2" ;
        extclk1_counter            : string := "e1" ;
        extclk0_counter            : string := "e0" ;
        clk5_counter               : string := "l1" ;
        clk4_counter               : string := "l0" ;
        clk3_counter               : string := "g3" ;
        clk2_counter               : string := "g2" ;
        clk1_counter               : string := "g1" ;
        clk0_counter               : string := "g0" ;
        enable0_counter            : string := "l0";
        enable1_counter            : string := "l0";
        charge_pump_current        : natural := 2;
        loop_filter_r              : string := "1.0";
        loop_filter_c              : natural := 5;
        vco_post_scale             : natural := 0;
        lpm_type                   : string := "altpll"
);
port (
        inclk       : in std_logic_vector(1 downto 0) := (others => '0'); -- input clocks, up to 2 can be used
        fbin        : in std_logic := '1';  -- external feedback port
        pllena      : in std_logic := '1';  -- PLL enable signal
        clkswitch   : in std_logic := '0';  -- switch between inclk0 and inclk1
        areset      : in std_logic := '0';  -- asynchronous reset
        pfdena      : in std_logic := '1';  -- enable Phase Frequency Detector (PFD)
        clkena      : in std_logic_vector(5 downto 0) := (others => '1');  -- enable clk0-clk5 outputs
        extclkena   : in std_logic_vector(3 downto 0) := (others => '1');  -- enable extclk0-extclk3 outputs
        scanclk     : in std_logic := '0';  -- clock for scan chain
        scanaclr    : in std_logic := '0';  -- asynchronous clear for the scan chain
        scanread    : in std_logic := '0';  -- determines when the scan chain can read in data from the scandata port
        scanwrite   : in std_logic := '0';  -- determines when the scan chain can write out data into pll
        scandata    : in std_logic := '0';  -- data for the scan chain
        comparator  : in std_logic := '0';  -- control the enable0 pulse generation to achieve data realignment in lvds.

        clk         : out std_logic_vector(5 downto 0); -- internal clock outputs (feeds the core)
        extclk      : out std_logic_vector(3 downto 0); -- external clock outputs (feeds pins)
        clkbad      : out std_logic_vector(1 downto 0); -- indicates if inclk0/inclk1 has gone bad
        enable0     : out std_logic;                    -- load enable pulse 0 for lvds
        enable1     : out std_logic;                    -- load enable pulse 1 for lvds
        activeclock : out std_logic;                    -- indicates which input clock is being used
        clkloss     : out std_logic;                    -- indicates when clock switchover initiates
        locked      : out std_logic;                    -- indicates when the PLL locks
        scandataout : out std_logic;                    -- data output from the scan chain
        scandone    : out std_logic;                    -- indicates when pll reconfiguration is complete
        sclkout0    : out std_logic;                    -- serial clock output 0 for lvds
        sclkout1    : out std_logic                     -- serial clock output 1 for lvds
);
end altpll;

-- BEGINNING OF ARCHITECURE BEHAVIOR
architecture behavior of altpll is

-- converts uppercase parameter values (e.g. "AUTO") to lowercase ("auto")
-- as expected by stratix_pll model
function alpha_tolower (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";

begin
    for i in 1 to string_length loop
        case given_string(i) is
            when 'A' => result_string(i) := 'a';
            when 'B' => result_string(i) := 'b';
            when 'C' => result_string(i) := 'c';
            when 'D' => result_string(i) := 'd';
            when 'E' => result_string(i) := 'e';
            when 'F' => result_string(i) := 'f';
            when 'G' => result_string(i) := 'g';
            when 'H' => result_string(i) := 'h';
            when 'I' => result_string(i) := 'i';
            when 'J' => result_string(i) := 'j';
            when 'K' => result_string(i) := 'k';
            when 'L' => result_string(i) := 'l';
            when 'M' => result_string(i) := 'm';
            when 'N' => result_string(i) := 'n';
            when 'O' => result_string(i) := 'o';
            when 'P' => result_string(i) := 'p';
            when 'Q' => result_string(i) := 'q';
            when 'R' => result_string(i) := 'r';
            when 'S' => result_string(i) := 's';
            when 'T' => result_string(i) := 't';
            when 'U' => result_string(i) := 'u';
            when 'V' => result_string(i) := 'v';
            when 'W' => result_string(i) := 'w';
            when 'X' => result_string(i) := 'x';
            when 'Y' => result_string(i) := 'y';
            when 'Z' => result_string(i) := 'z';
            when others => result_string(i) := given_string(i);
        end case;
    end loop;

    return (result_string(1 to string_length));
end;

-- The following functions are used to set the default parameters' values for
-- Stratix II if user do not specify these parameters' values.

function get_clk0_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "g0") then
        return "c0";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

-- get feedback source for stratixii
function get_clk1_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "g1") then
        return "c1";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;


function get_clk2_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "g2") then
        return "c2";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

function get_clk3_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "g3") then
        return "c3";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

function get_clk4_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "l0") then
        return "c4";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

function get_clk5_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "l1") then
        return "c5";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

function get_enable0_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "l0") then
        return "c0";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

function get_enable1_counter (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "l0") then
        return "c1";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

-- get feedback source for stratixii
function get_feedback_source (given_string : string) return string is
    -- VARIABLE DECLARATION
    variable string_length : integer := given_string'length;
    variable result_string : string(1 to 20) := "                    ";
begin
    if (given_string = "extclk0") then
        return "clk0";
    else
        result_string(1 to string_length) := alpha_tolower(given_string);
        return (result_string(1 to string_length));
    end if;
end;

-- COMPONENT DECLARATION
component MF_stratix_pll
generic (
    operation_mode            : string := "normal";
    pll_type                  : string := "auto";
    qualify_conf_done         : string := "off";
    compensate_clock          : string := "clk0";
    scan_chain                : string := "long";
    primary_clock             : string := "inclk0";
    inclk0_input_frequency    : integer := 1000;
    inclk1_input_frequency    : integer := 1000;
    gate_lock_signal          : string := "no";
    gate_lock_counter         : integer := 0;
    valid_lock_multiplier     : integer := 1;
    invalid_lock_multiplier   : integer := 5;
    switch_over_on_lossclk    : string := "off";
    switch_over_on_gated_lock : string := "off";
    enable_switch_over_counter : string := "off";
    switch_over_counter       : integer := 0;
    feedback_source           : string := "extclk0";
    bandwidth                 : integer := 0;
    bandwidth_type            : string := "auto";
    spread_frequency          : integer := 0;
    down_spread               : string := "0.0";
    simulation_type           : string := "functional";
    skip_vco                  : string := "off";
    
    clk0_multiply_by : integer := 1;
    clk0_divide_by   : integer := 1;
    clk0_phase_shift : string := "0";
    clk0_time_delay  : string := "0";
    clk0_duty_cycle  : integer := 50;

    clk1_multiply_by : integer := 1;
    clk1_divide_by   : integer := 1;
    clk1_phase_shift : string := "0";
    clk1_time_delay  : string := "0";
    clk1_duty_cycle  : integer := 50;

    clk2_multiply_by : integer := 1;
    clk2_divide_by   : integer := 1;
    clk2_phase_shift : string := "0";
    clk2_time_delay  : string := "0";
    clk2_duty_cycle  : integer := 50;

    clk3_multiply_by : integer := 1;
    clk3_divide_by   : integer := 1;
    clk3_phase_shift : string := "0";
    clk3_time_delay  : string := "0";
    clk3_duty_cycle  : integer := 50;

    clk4_multiply_by : integer := 1;
    clk4_divide_by   : integer := 1;
    clk4_phase_shift : string := "0";
    clk4_time_delay  : string := "0";
    clk4_duty_cycle  : integer := 50;

    clk5_multiply_by : integer := 1;
    clk5_divide_by   : integer := 1;
    clk5_phase_shift : string := "0";
    clk5_time_delay  : string := "0";
    clk5_duty_cycle  : integer := 50;

    extclk0_multiply_by : integer := 1;
    extclk0_divide_by   : integer := 1;
    extclk0_phase_shift : string := "0";
    extclk0_time_delay  : string := "0";
    extclk0_duty_cycle  : integer := 50;

    extclk1_multiply_by : integer := 1;
    extclk1_divide_by   : integer := 1;
    extclk1_phase_shift : string := "0";
    extclk1_time_delay  : string := "0";
    extclk1_duty_cycle  : integer := 50;

    extclk2_multiply_by : integer := 1;
    extclk2_divide_by   : integer := 1;
    extclk2_phase_shift : string := "0";
    extclk2_time_delay  : string := "0";
    extclk2_duty_cycle  : integer := 50;

    extclk3_multiply_by : integer := 1;
    extclk3_divide_by   : integer := 1;
    extclk3_phase_shift : string := "0";
    extclk3_time_delay  : string := "0";
    extclk3_duty_cycle  : integer := 50;

    vco_min    : integer := 0;
    vco_max    : integer := 0;
    vco_center : integer := 0;
    pfd_min    : integer := 0;
    pfd_max    : integer := 0;

-- ADVANCED USER PARAMETERS
    m_initial : integer := 1;     -- 1-1024
    m         : integer := 1;     -- 1-1024
    n         : integer := 1;     -- 1-1024
    m2        : integer := 1;     -- 1-1024
    n2        : integer := 1;     -- 1-1024
    ss        : integer := 0;

    l0_high       : integer := 1;    -- 1-512
    l0_low        : integer := 1;    -- 1-512
    l0_initial    : integer := 1;    -- 1-512
    l0_mode       : string := "bypass";       -- bypass,odd,even
    l0_ph         : integer := 0;
    l0_time_delay : integer := 0;

    l1_high       : integer := 1;
    l1_low        : integer := 1;
    l1_initial    : integer := 1;
    l1_mode       : string := "bypass";
    l1_ph         : integer := 0;
    l1_time_delay : integer := 0;

    g0_high       : integer := 1;
    g0_low        : integer := 1;
    g0_initial    : integer := 1;
    g0_mode       : string := "bypass";
    g0_ph         : integer := 0;
    g0_time_delay : integer := 0;

    g1_high       : integer := 1;
    g1_low        : integer := 1;
    g1_initial    : integer := 1;
    g1_mode       : string := "bypass";
    g1_ph         : integer := 0;
    g1_time_delay : integer := 0;

    g2_high       : integer := 1;
    g2_low        : integer := 1;
    g2_initial    : integer := 1; 
    g2_mode       : string := "bypass";
    g2_ph         : integer := 0;
    g2_time_delay : integer := 0;

    g3_high       : integer := 1;
    g3_low        : integer := 1;
    g3_initial    : integer := 1;
    g3_mode       : string := "bypass";
    g3_ph         : integer := 0;
    g3_time_delay : integer := 0;

    e0_high       : integer := 1;
    e0_low        : integer := 1;
    e0_initial    : integer := 1;
    e0_mode       : string := "bypass";
    e0_ph         : integer := 0;
    e0_time_delay : integer := 0;

    e1_high       : integer := 1;
    e1_low        : integer := 1;
    e1_initial    : integer := 1;
    e1_mode       : string := "bypass";
    e1_ph         : integer := 0;
    e1_time_delay : integer := 0;

    e2_high       : integer := 1;
    e2_low        : integer := 1;
    e2_initial    : integer := 1;
    e2_mode       : string := "bypass";
    e2_ph         : integer := 0;
    e2_time_delay : integer := 0;

    e3_high       : integer := 1;
    e3_low        : integer := 1;
    e3_initial    : integer := 1;
    e3_mode       : string := "bypass";
    e3_ph         : integer := 0;
    e3_time_delay : integer := 0;

    m_ph : integer := 0;
    m_time_delay : integer := 0;
    n_time_delay : integer := 0;

    extclk0_counter : string := "e0";
    extclk1_counter : string := "e1";
    extclk2_counter : string := "e2";
    extclk3_counter : string := "e3";

    clk0_counter : string := "g0";
    clk1_counter : string := "g1";
    clk2_counter : string := "g2";
    clk3_counter : string := "g3";
    clk4_counter : string := "l0";
    clk5_counter : string := "l1";

    enable0_counter : string := "l0";
    enable1_counter : string := "l0";

    charge_pump_current : integer := 2;

    loop_filter_r : string := "1.0";
    loop_filter_c : natural := 5
);
port (
    inclk       : in std_logic_vector(1 downto 0) := (OTHERS=>'0');
    fbin        : in std_logic := '1';
    ena         : in std_logic := '1';
    clkswitch   : in std_logic := '0';
    areset      : in std_logic := '0';
    pfdena      : in std_logic := '1';
    clkena      : in std_logic_vector(5 downto 0) := (OTHERS=>'1');
    extclkena   : in std_logic_vector(3 downto 0) := (OTHERS=>'1');
    scanclk     : in std_logic := '0';
    scanaclr    : in std_logic := '0';
    scandata    : in std_logic := '0';
    clk         : out std_logic_vector(5 downto 0);
    extclk      : out std_logic_vector(3 downto 0);
    clkbad      : out std_logic_vector(1 downto 0);
    activeclock : out std_logic;
    clkloss     : out std_logic;
    locked      : out std_logic;
    scandataout : out std_logic;

    -- lvds specific ports
    comparator  : in std_logic := '0';
    enable0     : out std_logic;
    enable1     : out std_logic
);
end component;


component MF_stratixii_pll
generic (
    operation_mode            : string := "normal";
    pll_type                  : string := "auto";
    qualify_conf_done         : string := "off";
    compensate_clock          : string := "clk0";
    inclk0_input_frequency    : integer := 1000;
    inclk1_input_frequency    : integer := 1000;
    gate_lock_signal          : string := "no";
    gate_lock_counter         : integer := 0;
    valid_lock_multiplier     : integer := 1;
    invalid_lock_multiplier   : integer := 5;
    switch_over_type          : string  := "auto";
    switch_over_on_lossclk    : string := "off";
    switch_over_on_gated_lock : string := "off";
    enable_switch_over_counter : string := "off";
    switch_over_counter       : integer := 0;
    feedback_source           : string := "extclk0";
    bandwidth                 : integer := 0;
    bandwidth_type            : string := "auto";
    spread_frequency          : integer := 0;
    down_spread               : string := "0.0";
    simulation_type           : string := "functional";

    clk0_multiply_by      : integer := 1;
    clk0_divide_by        : integer := 1;
    clk0_phase_shift      : string := "0";
    clk0_duty_cycle       : integer := 50;

    clk1_multiply_by      : integer := 1;
    clk1_divide_by        : integer := 1;
    clk1_phase_shift      : string := "0";
    clk1_duty_cycle       : integer := 50;

    clk2_multiply_by      : integer := 1;
    clk2_divide_by        : integer := 1;
    clk2_phase_shift      : string := "0";
    clk2_duty_cycle       : integer := 50;

    clk3_multiply_by      : integer := 1;
    clk3_divide_by        : integer := 1;
    clk3_phase_shift      : string := "0";
    clk3_duty_cycle       : integer := 50;

    clk4_multiply_by      : integer := 1;
    clk4_divide_by        : integer := 1;
    clk4_phase_shift      : string := "0";
    clk4_duty_cycle       : integer := 50;

    clk5_multiply_by      : integer := 1;
    clk5_divide_by        : integer := 1;
    clk5_phase_shift      : string := "0";
    clk5_duty_cycle       : integer := 50;

    vco_min    : integer := 0;
    vco_max    : integer := 0;
    vco_center : integer := 0;
    pfd_min    : integer := 0;
    pfd_max    : integer := 0;

-- ADVANCED USER PARAMETERS
    m_initial : integer := 1;     -- 1-1024
    m         : integer := 1;     -- 1-1024
    n         : integer := 1;     -- 1-1024
    m2        : integer := 1;     -- 1-1024
    n2        : integer := 1;     -- 1-1024
    ss        : integer := 0;

    c0_high       : integer := 1;    -- 1-512
    c0_low        : integer := 1;    -- 1-512
    c0_initial    : integer := 1;    -- 1-512
    c0_mode       : string := "bypass";       -- bypass,odd,even
    c0_ph         : integer := 0;

    c1_high       : integer := 1;
    c1_low        : integer := 1;
    c1_initial    : integer := 1;
    c1_mode       : string := "bypass";
    c1_ph         : integer := 0;

    c2_high       : integer := 1;
    c2_low        : integer := 1;
    c2_initial    : integer := 1;
    c2_mode       : string := "bypass";
    c2_ph         : integer := 0;

    c3_high       : integer := 1;
    c3_low        : integer := 1;
    c3_initial    : integer := 1;
    c3_mode       : string := "bypass";
    c3_ph         : integer := 0;

    c4_high       : integer := 1;
    c4_low        : integer := 1;
    c4_initial    : integer := 1; 
    c4_mode       : string := "bypass";
    c4_ph         : integer := 0;

    c5_high       : integer := 1;
    c5_low        : integer := 1;
    c5_initial    : integer := 1;
    c5_mode       : string := "bypass";
    c5_ph         : integer := 0;

    m_ph : integer := 0;

    c1_use_casc_in   : string := "off";
    c2_use_casc_in   : string := "off";
    c3_use_casc_in   : string := "off";
    c4_use_casc_in   : string := "off";
    c5_use_casc_in   : string := "off";

    clk0_counter     : string := "c0";
    clk1_counter     : string := "c1";
    clk2_counter     : string := "c2";
    clk3_counter     : string := "c3";
    clk4_counter     : string := "c4";
    clk5_counter     : string := "c5";

    enable0_counter : string := "c0";
    enable1_counter : string := "c0";
    sclkout0_phase_shift : string := "0";
    sclkout1_phase_shift : string := "0";
    vco_multiply_by : integer := 1;
    vco_divide_by   : integer := 1;
    
    charge_pump_current : integer := 2;

    loop_filter_r : string := "1.0";
    loop_filter_c : natural := 5
);
port (
    inclk       : in std_logic_vector(1 downto 0) := (OTHERS=>'0');
    fbin        : in std_logic := '1';
    ena         : in std_logic := '1';
    clkswitch   : in std_logic := '0';
    areset      : in std_logic := '0';
    pfdena      : in std_logic := '1';
    scanclk     : in std_logic := '1';
    scanread    : in std_logic := '1';
    scanwrite   : in std_logic := '1';
    scandata    : in std_logic := '1';
    clk         : out std_logic_vector(5 downto 0);
    clkbad      : out std_logic_vector(1 downto 0);
    activeclock : out std_logic;
    clkloss     : out std_logic;
    locked      : out std_logic;
    scandataout : out std_logic;
    scandone    : out std_logic;

    -- lvds specific ports
    enable0     : out std_logic;
    enable1     : out std_logic;
    sclkout     : out std_logic_vector(1 downto 0)
);
end component;

signal locked_tmp : std_logic;

begin

-- checking for invalid parameters
MSG: process
begin

    if (clk5_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The clk5_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk4_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The clk4_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk3_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The clk3_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk2_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The clk2_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk1_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The clk1_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk0_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The clk0_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk5_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The clk5_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk4_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The clk4_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk3_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The clk3_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk2_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The clk2_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk1_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The clk1_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (clk0_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The clk0_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;


    if (extclk3_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk3_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (extclk2_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk2_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (extclk1_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk1_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (extclk0_multiply_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk0_multiply_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;


    if (extclk3_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk3_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (extclk2_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk2_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (extclk1_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk1_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (extclk0_divide_by <= 0) then
        ASSERT FALSE
        REPORT "The extclk0_divide_by parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if not ((primary_clock = "inclk0") or (primary_clock = "inclk1")) then
        ASSERT FALSE
        REPORT "The primary clock is set to an illegal value"
        SEVERITY ERROR;
    end if;

    wait;
end process MSG;

-- For fast mode, the stratix pll atom model will give active low signal on locked output.
-- Therefore, need to invert the lock signal for fast mode as in user view, locked signal is
-- always active high.
locked <= (not locked_tmp) when ((IS_FAMILY_STRATIXII(intended_device_family) = false) and
                                  alpha_tolower(pll_type) = "fast") else locked_tmp;

-- Instantiate stratix_pll
STRATIX_ALTPLL:
if (IS_FAMILY_STRATIXII(intended_device_family) = false) generate
    M0: MF_stratix_pll
    generic map(
        operation_mode          => alpha_tolower(operation_mode),
        pll_type                => alpha_tolower(pll_type),
        qualify_conf_done       => alpha_tolower(qualify_conf_done),
        compensate_clock        => alpha_tolower(compensate_clock),
        scan_chain              => alpha_tolower(scan_chain),
        primary_clock           => alpha_tolower(primary_clock),
        inclk0_input_frequency  => inclk0_input_frequency,
        inclk1_input_frequency  => inclk1_input_frequency,
        gate_lock_signal        => alpha_tolower(gate_lock_signal),
        gate_lock_counter       => gate_lock_counter,
        valid_lock_multiplier   => valid_lock_multiplier,
        invalid_lock_multiplier => invalid_lock_multiplier,
        switch_over_on_lossclk  => alpha_tolower(switch_over_on_lossclk),
        switch_over_on_gated_lock => alpha_tolower(switch_over_on_gated_lock),
        enable_switch_over_counter => alpha_tolower(enable_switch_over_counter),
        switch_over_counter     => switch_over_counter,
        feedback_source         => alpha_tolower(feedback_source),
        bandwidth               => bandwidth,
        bandwidth_type          => alpha_tolower(bandwidth_type),
        spread_frequency        => spread_frequency,
        down_spread             => down_spread,
        simulation_type         => alpha_tolower(simulation_type),
        skip_vco                => alpha_tolower(skip_vco),
        
        -- internal clock specifications
        clk5_multiply_by    => clk5_multiply_by,
        clk4_multiply_by    => clk4_multiply_by,
        clk3_multiply_by    => clk3_multiply_by,
        clk2_multiply_by    => clk2_multiply_by,
        clk1_multiply_by    => clk1_multiply_by,
        clk0_multiply_by    => clk0_multiply_by,
        clk5_divide_by      => clk5_divide_by,
        clk4_divide_by      => clk4_divide_by,
        clk3_divide_by      => clk3_divide_by,
        clk2_divide_by      => clk2_divide_by,
        clk1_divide_by      => clk1_divide_by,
        clk0_divide_by      => clk0_divide_by,
        clk5_phase_shift    => clk5_phase_shift,
        clk4_phase_shift    => clk4_phase_shift,
        clk3_phase_shift    => clk3_phase_shift,
        clk2_phase_shift    => clk2_phase_shift,
        clk1_phase_shift    => clk1_phase_shift,
        clk0_phase_shift    => clk0_phase_shift,
        clk5_time_delay     => clk5_time_delay,
        clk4_time_delay     => clk4_time_delay,
        clk3_time_delay     => clk3_time_delay,
        clk2_time_delay     => clk2_time_delay,
        clk1_time_delay     => clk1_time_delay,
        clk0_time_delay     => clk0_time_delay,
        clk5_duty_cycle     => clk5_duty_cycle,
        clk4_duty_cycle     => clk4_duty_cycle,
        clk3_duty_cycle     => clk3_duty_cycle,
        clk2_duty_cycle     => clk2_duty_cycle,
        clk1_duty_cycle     => clk1_duty_cycle,
        clk0_duty_cycle     => clk0_duty_cycle,

        -- external clock specifications
        extclk3_multiply_by     => extclk3_multiply_by,
        extclk2_multiply_by     => extclk2_multiply_by,
        extclk1_multiply_by     => extclk1_multiply_by,
        extclk0_multiply_by     => extclk0_multiply_by,
        extclk3_divide_by       => extclk3_divide_by,
        extclk2_divide_by       => extclk2_divide_by,
        extclk1_divide_by       => extclk1_divide_by,
        extclk0_divide_by       => extclk0_divide_by,
        extclk3_phase_shift     => extclk3_phase_shift,
        extclk2_phase_shift     => extclk2_phase_shift,
        extclk1_phase_shift     => extclk1_phase_shift,
        extclk0_phase_shift     => extclk0_phase_shift,
        extclk3_time_delay      => extclk3_time_delay,
        extclk2_time_delay      => extclk2_time_delay,
        extclk1_time_delay      => extclk1_time_delay,
        extclk0_time_delay      => extclk0_time_delay,
        extclk3_duty_cycle      => extclk3_duty_cycle,
        extclk2_duty_cycle      => extclk2_duty_cycle,
        extclk1_duty_cycle      => extclk1_duty_cycle,
        extclk0_duty_cycle      => extclk0_duty_cycle,

        -- advanced user parameters
        vco_min         => vco_min,
        vco_max         => vco_max,
        vco_center      => vco_center,
        pfd_min         => pfd_min,
        pfd_max         => pfd_max,
        m_initial       => m_initial,
        m               => m,
        n               => n,
        m2              => m2,
        n2              => n2,
        ss              => ss,
        l0_high         => l0_high,
        l1_high         => l1_high,
        g0_high         => g0_high,
        g1_high         => g1_high,
        g2_high         => g2_high,
        g3_high         => g3_high,
        e0_high         => e0_high,
        e1_high         => e1_high,
        e2_high         => e2_high,
        e3_high         => e3_high,
        l0_low          => l0_low,
        l1_low          => l1_low,
        g0_low          => g0_low,
        g1_low          => g1_low,
        g2_low          => g2_low,
        g3_low          => g3_low,
        e0_low          => e0_low,
        e1_low          => e1_low,
        e2_low          => e2_low,
        e3_low          => e3_low,
        l0_initial      => l0_initial,
        l1_initial      => l1_initial,
        g0_initial      => g0_initial,
        g1_initial      => g1_initial,
        g2_initial      => g2_initial,
        g3_initial      => g3_initial,
        e0_initial      => e0_initial,
        e1_initial      => e1_initial,
        e2_initial      => e2_initial,
        e3_initial      => e3_initial,
        l0_mode         => alpha_tolower(l0_mode),
        l1_mode         => alpha_tolower(l1_mode),
        g0_mode         => alpha_tolower(g0_mode),
        g1_mode         => alpha_tolower(g1_mode),
        g2_mode         => alpha_tolower(g2_mode),
        g3_mode         => alpha_tolower(g3_mode),
        e0_mode         => alpha_tolower(e0_mode),
        e1_mode         => alpha_tolower(e1_mode),
        e2_mode         => alpha_tolower(e2_mode),
        e3_mode         => alpha_tolower(e3_mode),
        l0_ph           => l0_ph,
        l1_ph           => l1_ph,
        g0_ph           => g0_ph,
        g1_ph           => g1_ph,
        g2_ph           => g2_ph,
        g3_ph           => g3_ph,
        e0_ph           => e0_ph,
        e1_ph           => e1_ph,
        e2_ph           => e2_ph,
        e3_ph           => e3_ph,
        m_ph            => m_ph,
        l0_time_delay   => l0_time_delay,
        l1_time_delay   => l1_time_delay,
        g0_time_delay   => g0_time_delay,
        g1_time_delay   => g1_time_delay,
        g2_time_delay   => g2_time_delay,
        g3_time_delay   => g3_time_delay,
        e0_time_delay   => e0_time_delay,
        e1_time_delay   => e1_time_delay,
        e2_time_delay   => e2_time_delay,
        e3_time_delay   => e3_time_delay,
        m_time_delay    => m_time_delay,
        n_time_delay    => n_time_delay,

        extclk3_counter => alpha_tolower(extclk3_counter),
        extclk2_counter => alpha_tolower(extclk2_counter),
        extclk1_counter => alpha_tolower(extclk1_counter),
        extclk0_counter => alpha_tolower(extclk0_counter),
        clk5_counter    => alpha_tolower(clk5_counter),
        clk4_counter    => alpha_tolower(clk4_counter),
        clk3_counter    => alpha_tolower(clk3_counter),
        clk2_counter    => alpha_tolower(clk2_counter),
        clk1_counter    => alpha_tolower(clk1_counter),
        clk0_counter    => alpha_tolower(clk0_counter),
        enable0_counter => alpha_tolower(enable0_counter),
        enable1_counter => alpha_tolower(enable1_counter),

        charge_pump_current => charge_pump_current,
        loop_filter_r       => loop_filter_r,
        loop_filter_c       => loop_filter_c
    )
    port map (
        inclk       => inclk,
        fbin        => fbin,
        ena         => pllena,
        clkswitch   => clkswitch,
        areset      => areset,
        pfdena      => pfdena,
        clkena      => clkena,
        extclkena   => extclkena,
        scanclk     => scanclk,
        scanaclr    => scanaclr,
        scandata    => scandata,
        comparator  => comparator,
        clk         => clk,
        extclk      => extclk,
        clkbad      => clkbad,
        enable0     => enable0,
        enable1     => enable1,
        activeclock => activeclock,
        clkloss     => clkloss,
        locked      => locked_tmp,
        scandataout => scandataout
    );
end generate STRATIX_ALTPLL;

-- Instantiate stratixii_pll
STRATIXII_ALTPLL:
if (IS_FAMILY_STRATIXII(intended_device_family) = true) generate
    M1 : MF_stratixii_pll
    generic map(
        operation_mode          => alpha_tolower(operation_mode),
        pll_type                => alpha_tolower(pll_type),
        qualify_conf_done       => alpha_tolower(qualify_conf_done),
        compensate_clock        => alpha_tolower(compensate_clock),
        inclk0_input_frequency  => inclk0_input_frequency,
        inclk1_input_frequency  => inclk1_input_frequency,
        gate_lock_signal        => alpha_tolower(gate_lock_signal),
        gate_lock_counter       => gate_lock_counter,
        valid_lock_multiplier   => valid_lock_multiplier,
        invalid_lock_multiplier => invalid_lock_multiplier,
        switch_over_type        => alpha_tolower(switch_over_type),
        switch_over_on_lossclk  => alpha_tolower(switch_over_on_lossclk),
        switch_over_on_gated_lock => alpha_tolower(switch_over_on_gated_lock),
        enable_switch_over_counter => alpha_tolower(enable_switch_over_counter),
        switch_over_counter     => switch_over_counter,
        feedback_source         => get_feedback_source(feedback_source),
        bandwidth               => bandwidth,
        bandwidth_type          => alpha_tolower(bandwidth_type),
        spread_frequency        => spread_frequency,
        down_spread             => down_spread,
        simulation_type         => alpha_tolower(simulation_type),
        
        -- internal clock specifications
        clk5_multiply_by    => clk5_multiply_by,
        clk4_multiply_by    => clk4_multiply_by,
        clk3_multiply_by    => clk3_multiply_by,
        clk2_multiply_by    => clk2_multiply_by,
        clk1_multiply_by    => clk1_multiply_by,
        clk0_multiply_by    => clk0_multiply_by,
        clk5_divide_by      => clk5_divide_by,
        clk4_divide_by      => clk4_divide_by,
        clk3_divide_by      => clk3_divide_by,
        clk2_divide_by      => clk2_divide_by,
        clk1_divide_by      => clk1_divide_by,
        clk0_divide_by      => clk0_divide_by,
        clk5_phase_shift    => clk5_phase_shift,
        clk4_phase_shift    => clk4_phase_shift,
        clk3_phase_shift    => clk3_phase_shift,
        clk2_phase_shift    => clk2_phase_shift,
        clk1_phase_shift    => clk1_phase_shift,
        clk0_phase_shift    => clk0_phase_shift,
        clk5_duty_cycle     => clk5_duty_cycle,
        clk4_duty_cycle     => clk4_duty_cycle,
        clk3_duty_cycle     => clk3_duty_cycle,
        clk2_duty_cycle     => clk2_duty_cycle,
        clk1_duty_cycle     => clk1_duty_cycle,
        clk0_duty_cycle     => clk0_duty_cycle,

        -- advanced user parameters
        vco_min         => vco_min,
        vco_max         => vco_max,
        vco_center      => vco_center,
        pfd_min         => pfd_min,
        pfd_max         => pfd_max,
        m_initial       => m_initial,
        m               => m,
        n               => n,
        m2              => m2,
        n2              => n2,
        ss              => ss,
        c0_high         => c0_high,
        c1_high         => c1_high,
        c2_high         => c2_high,
        c3_high         => c3_high,
        c4_high         => c4_high,
        c5_high         => c5_high,
        c0_low          => c0_low,
        c1_low          => c1_low,
        c2_low          => c2_low,
        c3_low          => c3_low,
        c4_low          => c4_low,
        c5_low          => c5_low,
        c0_initial      => c0_initial,
        c1_initial      => c1_initial,
        c2_initial      => c2_initial,
        c3_initial      => c3_initial,
        c4_initial      => c4_initial,
        c5_initial      => c5_initial,
        c0_mode         => alpha_tolower(c0_mode),
        c1_mode         => alpha_tolower(c1_mode),
        c2_mode         => alpha_tolower(c2_mode),
        c3_mode         => alpha_tolower(c3_mode),
        c4_mode         => alpha_tolower(c4_mode),
        c5_mode         => alpha_tolower(c5_mode),
        c0_ph           => c0_ph,
        c1_ph           => c1_ph,
        c2_ph           => c2_ph,
        c3_ph           => c3_ph,
        c4_ph           => c4_ph,
        c5_ph           => c5_ph,
        m_ph            => m_ph,
        c1_use_casc_in  => c1_use_casc_in,
        c2_use_casc_in  => c2_use_casc_in,
        c3_use_casc_in  => c3_use_casc_in,
        c4_use_casc_in  => c4_use_casc_in,
        c5_use_casc_in  => c5_use_casc_in,
        clk5_counter    => get_clk5_counter(clk5_counter),
        clk4_counter    => get_clk4_counter(clk4_counter),
        clk3_counter    => get_clk3_counter(clk3_counter),
        clk2_counter    => get_clk2_counter(clk2_counter),
        clk1_counter    => get_clk1_counter(clk1_counter),
        clk0_counter    => get_clk0_counter(clk0_counter),
        enable0_counter => get_enable0_counter(enable0_counter),
        enable1_counter => get_enable1_counter(enable1_counter),
        sclkout0_phase_shift => sclkout0_phase_shift,
        sclkout1_phase_shift => sclkout1_phase_shift,
        vco_multiply_by => vco_multiply_by,
        vco_divide_by   => vco_divide_by,
        charge_pump_current => charge_pump_current,
        loop_filter_r       => loop_filter_r,
        loop_filter_c       => loop_filter_c
    )
    port map (
        inclk       => inclk,
        fbin        => fbin,
        ena         => pllena,
        clkswitch   => clkswitch,
        areset      => areset,
        pfdena      => pfdena,
        scanclk     => scanclk,
        scanread    => scanread,
        scanwrite   => scanwrite,
        scandata    => scandata,
        clk         => clk,
        clkbad      => clkbad,
        enable0     => enable0,
        enable1     => enable1,
        activeclock => activeclock,
        clkloss     => clkloss,
        locked      => locked_tmp,
        scandataout => scandataout,
        scandone    => scandone,
        sclkout(0)  => sclkout0,
        sclkout(1)  => sclkout1
    );
end generate STRATIXII_ALTPLL;
end behavior;
-- END ARCHITECTURE BEHAVIOR


-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name      : HSSI_PLL
--                                                                             
-- Description      : This is the Phase Locked Loop (PLL) model used by altcdr_rx 
--                    and altcdr_tx. Simple PLL model with 1 clock input (clk) 
--                    and 2 clock outputs (clk0 & clk1).
--                        
-- Limitations      : Only capable of multiplying and dividing the input clock
--                    frequency. There is no support for phase shifts, uneven duty
--                    cycles or other fancy PLL features, since the Mercury CDR 
--                    does not need these features.
--
-- Expected results : 2 output clocks - clk0 and clk1. Locked output indicates
--                    when the PLL locks.
--
-- END ENTITY HEADER -----------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- ENTITY DECLARATION
entity hssi_pll is
generic
(
    clk0_multiply_by        : integer := 1;
    clk1_divide_by          : integer := 1;
    input_frequency         : integer := 1000  -- period in ps
);
port
(
    clk    : in std_logic; -- required port, input clock
    areset : in std_logic := '0'; -- asynchronous reset
    
    clk0   : out std_logic;  -- output clock0
    clk1   : out std_logic;  -- output clock1
    locked : out std_logic   -- PLL lock signal
);
end hssi_pll;

-- BEGINNING OF ARCHITECTURE BEHAVIOR
architecture behavior of hssi_pll is

    -- SIGNAL DECLARATION
    SIGNAL clk0_tmp     : std_logic := 'X';
    SIGNAL clk1_tmp     : std_logic := 'X';
    SIGNAL clk0_period  : time := 0 ps;
    SIGNAL clk1_period  : time := 0 ps;
    SIGNAL half_inclk   : time := 0 ps;
    SIGNAL pll_lock     : std_logic := '0';
    SIGNAL clk_check    : std_logic := '0';
    SIGNAL lock_on_rise : integer := 0;
    SIGNAL lock_on_fall : integer := 0;

begin

-- monitor the input clock to determine when the pll locks
-- or when it loses lock due to input frequency or duty cycle violation
-- also performs the reset logic and the generation of 2 output clocks
process (clk, pll_lock, clk_check, areset)

    -- VARIABLE DECLARATION
    variable start_lock_count       : integer := 0;
    variable stop_lock_count        : integer := 0;
    variable pll_rising_edge_count  : integer := 0;
    variable lock_low               : integer := 2;
    variable lock_high              : integer := 2;
    variable inclk_ps               : time := 0 ps;
    variable pll_last_rising_edge   : time := 0 ps;
    variable pll_last_falling_edge  : time := 0 ps;
    variable pll_cycle              : time := 0 ps;
    variable pll_duty_cycle         : time := 0 ps;
    variable clk_per_tolerance      : time := 0 ps;
    variable expected_next_clk_edge : time := 0 ps;
    variable violation              : boolean := false;
    variable pll_lock_tmp           : std_logic := '0';

    variable last_synchronizing_rising_edge_for_clk0 : time := 0 ps;
    variable last_synchronizing_rising_edge_for_clk1 : time := 0 ps;
    variable clk0_synchronizing_period               : time := 0 ps;
    variable clk1_synchronizing_period               : time := 0 ps;
    variable input_cycles_per_clk0                   : integer := 0;
    variable input_cycles_per_clk1                   : integer := 0;
    variable input_cycle_count_to_sync0              : integer := 0;
    variable input_cycle_count_to_sync1              : integer := 0;
    variable clk0_cycles_per_sync_period             : integer := clk0_multiply_by;
    variable clk1_cycles_per_sync_period             : integer := 1;
    variable vco_per         : time := 0 ps;
    variable high_time       : time := 0 ps;
    variable low_time        : time := 0 ps;
    variable sched_time      : time := 0 ps;
    variable tmp_per         : integer := 0;
    variable temp            : integer := 0;
    variable tmp_rem         : integer := 0;
    variable my_rem          : integer := 0;
    variable l               : integer := 1;
    variable cycle_to_adjust : integer := 0;
    variable schedule_clk0   : boolean := false;
    variable schedule_clk1   : boolean := false;
    variable init            : boolean := true;
    variable output_value    : std_logic := '0';

begin
    -- initialize variables
    if (init) then
       clk0_cycles_per_sync_period := clk0_multiply_by;
       clk1_cycles_per_sync_period := clk0_multiply_by;
       input_cycles_per_clk0 := 1;
       input_cycles_per_clk1 := clk1_divide_by;
       init := false;
    end if;
    
    -- reset logic
    if (areset = '1') then
        pll_rising_edge_count := 0;
        violation := false;
        pll_lock_tmp := '0';
        pll_lock <= '0';
        start_lock_count := 1;
        stop_lock_count := 0;
        clk0_tmp <= 'X';
        clk1_tmp <= 'X';
    else
        -- calculate the required periods
        if (pll_rising_edge_count = 0) then 
            inclk_ps := (input_frequency / 1 ) * 1 ps;
            half_inclk <= inclk_ps/2;
            clk_per_tolerance := 0.025 * inclk_ps;  -- allow input clock period to deviate by 2.5%
            clk0_period <= inclk_ps / clk0_multiply_by;
            clk1_period <= (inclk_ps / clk0_multiply_by) * clk1_divide_by;
            pll_duty_cycle := inclk_ps/2;
        end if;
        
        -- rising edge of input clock
        if (clk'event and (clk = '1')) then
            if (pll_lock_tmp = '1') then
                clk_check <= not clk_check after (inclk_ps+clk_per_tolerance)/2.0;
            end if;
            if (pll_rising_edge_count = 0) then 
                pll_last_rising_edge := NOW;
            -- at 2nd rising edge
            elsif (pll_rising_edge_count = 1) then
                pll_cycle := now - pll_last_rising_edge;    -- calculate period
                -- input clock period violation check
                if ((NOW - pll_last_rising_edge) < (inclk_ps - clk_per_tolerance)  or
                    (NOW - pll_last_rising_edge) > (inclk_ps + clk_per_tolerance)) then
                    ASSERT FALSE
                    REPORT " Inclock Period Violation "
                    SEVERITY WARNING;
                    violation := true;
                    if (pll_lock = '1') then
                        stop_lock_count := stop_lock_count + 1;
                        if (stop_lock_count = lock_low) then
                            pll_lock_tmp := '0';
                        end if;
                    else
                      start_lock_count := 1;
                    end if;
                else
                    violation := false;
                end if;
                
                -- duty cycle violation check
                if ((now - pll_last_falling_edge) < (pll_duty_cycle - clk_per_tolerance/2) or
                    (now - pll_last_falling_edge) > (pll_duty_cycle + clk_per_tolerance/2)) then
                    ASSERT FALSE
                    REPORT "Duty Cycle Violation"
                    SEVERITY WARNING;
                    violation := true;
                else
                    violation := false;
                end if;
            else -- not 2nd rising edge
                pll_cycle := now - pll_last_rising_edge;    -- calculate period
                if ((now - pll_last_rising_edge) < (inclk_ps - clk_per_tolerance) or
                    (now - pll_last_rising_edge) > (inclk_ps + clk_per_tolerance)) then
                    ASSERT FALSE
                    REPORT "Cycle Violation"
                    SEVERITY WARNING;
                    violation := true;
                    if (pll_lock = '1') then
                        stop_lock_count := stop_lock_count + 1;
                        if (stop_lock_count = lock_low) then
                            pll_lock_tmp := '0';
                        end if;
                    else
                      start_lock_count := 1;
                    end if;
                else
                    violation := false;
                end if;
            end if;
            pll_last_rising_edge := now;
            pll_rising_edge_count := pll_rising_edge_count +1;
            
            -- if there is no input clock violation detected, schedule clk0 and clk1 events
            if (not violation) then
               if (pll_lock_tmp = '1') then
                  input_cycle_count_to_sync0 := input_cycle_count_to_sync0 + 1;
                  if (input_cycle_count_to_sync0 = input_cycles_per_clk0) then
                     clk0_synchronizing_period := now - last_synchronizing_rising_edge_for_clk0;
                     last_synchronizing_rising_edge_for_clk0 := now;
                     schedule_clk0 := true;
                     input_cycle_count_to_sync0 := 0;
                  end if;
                  
                  input_cycle_count_to_sync1 := input_cycle_count_to_sync1 + 1;
                  if (input_cycle_count_to_sync1 = input_cycles_per_clk1) then
                     clk1_synchronizing_period := now - last_synchronizing_rising_edge_for_clk1;
                     last_synchronizing_rising_edge_for_clk1 := now;
                     schedule_clk1 := true;
                     input_cycle_count_to_sync1 := 0;
                  end if;
               else
                  start_lock_count := start_lock_count + 1;
                 if (start_lock_count >= lock_high) then
                    pll_lock_tmp := '1';
                    lock_on_rise <= 1;
                    input_cycle_count_to_sync0 := 0;
                    input_cycle_count_to_sync1 := 0;
                    if (last_synchronizing_rising_edge_for_clk0 = 0 ps) then
                       clk0_synchronizing_period := pll_cycle;
                    else
                       clk0_synchronizing_period := now - last_synchronizing_rising_edge_for_clk0;
                    end if;
                    
                    if (last_synchronizing_rising_edge_for_clk1 = 0 ps) then
                       clk1_synchronizing_period := ((pll_cycle/1 ps) * clk1_divide_by) * 1 ps;
                    else
                       clk1_synchronizing_period := now - last_synchronizing_rising_edge_for_clk1;
                    end if;
                    
                    last_synchronizing_rising_edge_for_clk0 := now;
                    last_synchronizing_rising_edge_for_clk1 := now;
                    schedule_clk0 := true;
                    schedule_clk1 := true;
                 end if;
               end if;
            else
               start_lock_count := 0;
            end if;
            
        -- falling edge of input clock
        elsif (clk'event and (clk = '0')) then
            if (pll_lock_tmp = '1') then
                clk_check <= not clk_check after (inclk_ps+clk_per_tolerance)/2.0;
                
                -- check for duty cycle violation
                if (now > 0 ns and ((now - pll_last_rising_edge) < (pll_duty_cycle - clk_per_tolerance/2) or
                   (now - pll_last_rising_edge) > (pll_duty_cycle + clk_per_tolerance/2))) then
                    ASSERT FALSE
                    REPORT "Duty Cycle Violation"
                    SEVERITY WARNING;
                    violation := true;
                    if (pll_lock = '1') then
                        stop_lock_count := stop_lock_count + 1;
                        if (stop_lock_count = lock_low) then
                            pll_lock_tmp := '0';
                        end if;
                    end if;
                else
                    violation := false;
                end if;
            elsif (pll_rising_edge_count > 0) then
                start_lock_count := start_lock_count + 1;
            end if;
            pll_last_falling_edge := now;
            
        else -- not rising edge or falling edge of input clock, perform clock check
            if (pll_lock_tmp = '1') then
                if (clk = '1') then
                    expected_next_clk_edge := pll_last_rising_edge + (inclk_ps+clk_per_tolerance)/2.0;
                else
                    expected_next_clk_edge := pll_last_falling_edge + (inclk_ps+clk_per_tolerance)/2.0;
                end if;
                
                violation := false;
                if (now < expected_next_clk_edge) then
                    clk_check <= not clk_check after (expected_next_clk_edge - now);
                elsif (now = expected_next_clk_edge) then
                    clk_check <= not clk_check after (inclk_ps+clk_per_tolerance)/2.0;
                else
                    ASSERT FALSE
                    REPORT "Inclock Period Violation"
                    SEVERITY WARNING;
                    violation := true;
                    if (pll_lock = '1') then
                        stop_lock_count := stop_lock_count + 1;
                        if (stop_lock_count = lock_low) then
                            pll_lock_tmp := '0';
                        else
                            clk_check <= not clk_check after (inclk_ps/2.0);
                        end if;
                    end if;
                end if;
            end if;
        end if;
        pll_lock <= pll_lock_tmp;
        -- on lost of pll lock, reset variables
        if (pll_lock'event and (pll_lock = '0')) then
            start_lock_count := 1;
            stop_lock_count := 0;
            lock_on_rise <= 0;
            lock_on_fall <= 0;
            clk0_tmp <= 'X';
            clk1_tmp <= 'X';
        end if;
    end if;  -- if not areset

    -- schedule clk0 output
    if (schedule_clk0) then
       sched_time := 0 ps;
       cycle_to_adjust := 0;
       l := 1;
       output_value := '1';
       temp := clk0_synchronizing_period/1 ps;
       my_rem := temp rem clk0_cycles_per_sync_period;
       for i in 1 to clk0_cycles_per_sync_period loop
           tmp_per := temp/clk0_cycles_per_sync_period;
           if (my_rem /= 0 and l <= my_rem) then
              tmp_rem := (clk0_cycles_per_sync_period * l) rem my_rem;
              cycle_to_adjust := (clk0_cycles_per_sync_period * l) / my_rem;
              if (tmp_rem /= 0) then
                 cycle_to_adjust := cycle_to_adjust + 1;
              end if;
           end if;
           if (cycle_to_adjust = i) then
               tmp_per := tmp_per + 1;
               l := l + 1;
           end if;
           vco_per := tmp_per * 1 ps;
           high_time := (tmp_per/2) * 1 ps;
           if (tmp_per rem 2 /= 0) then
              high_time := high_time + 1 ps;
           end if;
           low_time := vco_per - high_time;
           for j in 1 to 2 loop
              clk0_tmp <= transport output_value after sched_time;
              output_value := not output_value;
              if (output_value = '0') then
                 sched_time := sched_time + high_time;
              elsif (output_value = '1') then
                 sched_time := sched_time + low_time;
              end if;
           end loop;
       end loop;
       schedule_clk0 := false;
    end if;

    -- schedule clk1 output
    if (schedule_clk1) then
       sched_time := 0 ps;
       cycle_to_adjust := 0;
       l := 1;
       output_value := '1';
       temp := clk1_synchronizing_period/1 ps;
       my_rem := temp rem clk1_cycles_per_sync_period;
       for i in 1 to clk1_cycles_per_sync_period loop
           tmp_per := temp/clk1_cycles_per_sync_period;
           if (my_rem /= 0 and l <= my_rem) then
              tmp_rem := (clk1_cycles_per_sync_period * l) rem my_rem;
              cycle_to_adjust := (clk1_cycles_per_sync_period * l) / my_rem;
              if (tmp_rem /= 0) then
                 cycle_to_adjust := cycle_to_adjust + 1;
              end if;
           end if;
           if (cycle_to_adjust = i) then
               tmp_per := tmp_per + 1;
               l := l + 1;
           end if;
           vco_per := tmp_per * 1 ps;
           high_time := (tmp_per/2) * 1 ps;
           if (tmp_per rem 2 /= 0) then
              high_time := high_time + 1 ps;
           end if;
           low_time := vco_per - high_time;
           for j in 1 to 2 loop
              clk1_tmp <= transport output_value after sched_time;
              output_value := not output_value;
              if (output_value = '0') then
                 sched_time := sched_time + high_time;
              elsif (output_value = '1') then
                 sched_time := sched_time + low_time;
              end if;
           end loop;
       end loop;
       schedule_clk1 := false;
    end if;

end process;

-- assign signals to output ports
clk0 <= clk0_tmp;
clk1 <= clk1_tmp;
locked <= pll_lock;

end behavior;
-- END ARCHITECTURE BEHAVIOR


-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name : MF_RAM7X20_SYN
--                                                                             
-- Description : This is the RAM model used by HSSI_FIFO for writing and reading
--               into the FIFO
--                        
-- Limitations : Reading from the RAM is address-triggered,
--               writing is clock-triggered
--               RAM depth is fixed to 7, maximum width is 20
--
-- Expected results : data output from the RAM
--
-- END ENTITY HEADER -----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY DECLARATION
entity MF_ram7x20_syn is
generic (
    ram_width : integer := 20
);  
port (
    wclk     : in std_logic;  -- the write clock
    rst_l    : in std_logic := '1';  -- active low, asynchronous reset
    addr_wr  : in std_logic_vector(2 downto 0); -- write address
    addr_rd  : in std_logic_vector(2 downto 0); -- read address
    datain   : in std_logic_vector(ram_width-1 downto 0); -- data input to the RAM
    we       : in std_logic := '0';  -- write enable
    re       : in std_logic := '0';  -- read enable
    
    data_out : out std_logic_vector(ram_width-1 downto 0) -- data output of the RAM
);
end MF_ram7x20_syn;

-- BEGINNING OF ARCHITECTURE HSSI_RAM7X20_SYN
architecture hssi_ram7x20_syn of MF_ram7x20_syn is

    -- SIGNAL DECLARATION
    signal ram_array_d_0 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_d_1 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_d_2 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_d_3 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_d_4 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_d_5 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_d_6 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_0 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_1 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_2 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_3 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_4 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_5 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal ram_array_q_6 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_0 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_1 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_2 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_3 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_4 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_5 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_reg_6 : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');
    signal data_out_i : std_logic_vector(ram_width-1 downto 0) := (OTHERS => '0');

begin

-- assignment
data_reg_0 <= datain when addr_wr = "000" else
              ram_array_q_0;
data_reg_1 <= datain when addr_wr = "001" else
              ram_array_q_1;
data_reg_2 <= datain when addr_wr = "010" else
              ram_array_q_2;
data_reg_3 <= datain when addr_wr = "011" else
              ram_array_q_3;
data_reg_4 <= datain when addr_wr = "100" else
              ram_array_q_4;
data_reg_5 <= datain when addr_wr = "101" else
              ram_array_q_5;
data_reg_6 <= datain when addr_wr = "110" else
              ram_array_q_6;

data_out <= data_out_i when re = '1' else
            (OTHERS => '0');

-- PROCESS DECLARATION
process (wclk, rst_l, addr_wr, addr_rd, datain, 
         ram_array_q_0, ram_array_q_1, ram_array_q_2, ram_array_q_3, 
         ram_array_q_4, ram_array_q_5, ram_array_q_6, 
         data_reg_0, data_reg_1, data_reg_2, data_reg_3,
         data_reg_4, data_reg_5, data_reg_6)
    
    -- VARIABLE DECLARATION
    variable dataout_tmp : std_logic_vector(ram_width-1 downto 0);
    
begin
    -- Modelling the read port 
    -- Assuming address triggered operation only 
    case addr_rd is  
        when "000" => data_out_i <= ram_array_q_0;
        when "001" => data_out_i <= ram_array_q_1;
        when "010" => data_out_i <= ram_array_q_2;
        when "011" => data_out_i <= ram_array_q_3;
        when "100" => data_out_i <= ram_array_q_4;
        when "101" => data_out_i <= ram_array_q_5;
        when "110" => data_out_i <= ram_array_q_6;
        when others => data_out_i <= data_out_i;
    end case;

    if (re = '1') then
        dataout_tmp := data_out_i;
    else
        dataout_tmp := (OTHERS => '0');
    end if;
    
    -- reset
    if (rst_l = '0') then
        ram_array_q_0 <= (OTHERS => '0');
        ram_array_q_1 <= (OTHERS => '0');
        ram_array_q_2 <= (OTHERS => '0'); 
        ram_array_q_3 <= (OTHERS => '0'); 
        ram_array_q_4 <= (OTHERS => '0'); 
        ram_array_q_5 <= (OTHERS => '0'); 
        ram_array_q_6 <= (OTHERS => '0'); 
    else -- Modelling the write port
        if (wclk'event and wclk = '1') then
            ram_array_q_0 <= ram_array_d_0;
            ram_array_q_1 <= ram_array_d_1;
            ram_array_q_2 <= ram_array_d_2;
            ram_array_q_3 <= ram_array_d_3;
            ram_array_q_4 <= ram_array_d_4;
            ram_array_q_5 <= ram_array_d_5;
            ram_array_q_6 <= ram_array_d_6;
        end if;
        if (we = '1') then  -- write enabled
            ram_array_d_0 <= data_reg_0;
            ram_array_d_1 <= data_reg_1;
            ram_array_d_2 <= data_reg_2;
            ram_array_d_3 <= data_reg_3;
            ram_array_d_4 <= data_reg_4;
            ram_array_d_5 <= data_reg_5;
            ram_array_d_6 <= data_reg_6;
        else 
            ram_array_d_0 <= ram_array_q_0;
            ram_array_d_1 <= ram_array_q_1;
            ram_array_d_2 <= ram_array_q_2;
            ram_array_d_3 <= ram_array_q_3;
            ram_array_d_4 <= ram_array_q_4;
            ram_array_d_5 <= ram_array_q_5;
            ram_array_d_6 <= ram_array_q_6;
        end if;
    end if;

end process;

end hssi_ram7x20_syn;
-- END ARCHITECTURE HSSI_RAM7X20_SYN

-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name : HSSI_FIFO
--                                                                             
-- Description : The FIFO model used by altcdr_rx and altcdr_tx to synchronize
--               data between 2 clock domains
--                        
-- Limitations : FIFO depth is limited to 7 words only,
--               the overflow and empty signals are active low in this model
--
-- Expected results : data read from the FIFO, empty and overflow signals
--                    (active low) to indicate when FIFO is empty or full
--
-- END ENTITY HEADER -----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY DECLARATION
entity hssi_fifo is
generic (
    channel_width : integer := 1
);
port (
    datain   : in std_logic_vector(channel_width-1 downto 0); -- data input to the FIFO
    clk0     : in std_logic;   -- FIFO write clock
    clk1     : in std_logic;   -- FIFO read clock
    we       : in std_logic := '1';  -- write enable
    re       : in std_logic := '1';  -- read enable
    reset    : in std_logic := '0';  -- asynchronous reset
    
    dataout  : out std_logic_vector(channel_width-1 downto 0); -- data output of the FIFO
    empty    : out std_logic;   -- active low, to indicate FIFO is empty
    overflow : out std_logic    -- active low, to indicate FIFO is full
);
end hssi_fifo;

-- BEGINNING OF ARCHITECTURE SYNCHRONIZER
architecture synchronizer of hssi_fifo is

    -- SIGNAL DECLARATION
    signal ram_we            : std_logic := '0';
    signal ram_reset         : std_logic := '1';
    signal ram_re            : std_logic := '0';
    signal ram_datain        : std_logic_vector (channel_width-1 downto 0) := (OTHERS=>'0');
    signal ram_dataout       : std_logic_vector (channel_width-1 downto 0) := (OTHERS=>'0');
    signal wrPtr0            : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal wrPtr1            : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal wrPtr2            : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal wrPtr             : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal rdPtr             : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal preRdPtr          : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal preRdPtr1         : std_logic_vector (2 downto 0) := "110";
    signal preRdPtr2         : std_logic_vector (2 downto 0) := "110";
    signal wrAddr            : std_logic_vector (2 downto 0) := (OTHERS=>'0');
    signal dataout_tmp       : std_logic_vector (channel_width-1 downto 0) := (OTHERS=>'0');
    signal empty_tmp         : std_logic := '1';
    signal need_init         : boolean := true;

-- COMPONENT DECLARATION
component MF_ram7x20_syn
generic (
    ram_width : integer := 20
);
port (
    wclk     : in std_logic;
    rst_l    : in std_logic := '1'; 
    addr_wr  : in std_logic_vector(2 downto 0);
    addr_rd  : in std_logic_vector(2 downto 0);
    datain   : in std_logic_vector(ram_width-1 downto 0);
    we       : in std_logic := '0';
    re       : in std_logic := '0';
    data_out : out std_logic_vector(ram_width-1 downto 0)
);
end component;

begin
    
    -- reset is active low on MF_ram7x20_syn
    ram_reset <= not reset;
    ram_re <= (re and empty_tmp);

    -- instantiate MF_ram7x20_syn for reading and writing data
    FIFO_RAM: MF_ram7x20_syn
    generic map (
        ram_width => channel_width
    )
    port map (
        wclk => clk0,
        rst_l => ram_reset,
        addr_wr => wrAddr,
        addr_rd => rdPtr,
        datain => ram_datain,
        we => ram_we,
        re => ram_re,
        data_out => ram_dataout
    );

process (clk0, clk1, reset, we, re, datain, wrPtr, wrPtr0, wrPtr1, wrPtr2, 
         rdPtr, preRdPtr, preRdPtr1, preRdPtr2)  
    -- VARIABLE DECLARATION
    variable overflow_tmp_b  : std_logic := '1'; -- active low
    variable empty_tmp_var_b : std_logic := '1'; -- active low

begin
    -- initialize variables and signals
    if ((now = 0 ns) or (need_init = true)) then
        dataout_tmp <= (OTHERS => '0');
        ram_datain <= (OTHERS => '0');
        overflow_tmp_b :=  '1';
        empty_tmp <=  '1';
        empty_tmp_var_b :=  '1';
        wrAddr <=  (OTHERS=>'0');
        rdPtr <=  (OTHERS=>'0');
        wrPtr <=  (OTHERS=>'0');
        wrPtr0 <=  (OTHERS=>'0');
        wrPtr1 <=  (OTHERS=>'0');
        wrPtr2 <=  (OTHERS=>'0');
        preRdPtr <=  (OTHERS=>'0');
        preRdPtr1 <=  "110";
        preRdPtr2 <=  "110";
        ram_we <= '0';
        need_init <= false;
    end if;
    
    -- reset logic
    if (reset = '1') then
        dataout_tmp <= (OTHERS => '0');
        ram_datain <= (OTHERS => '0');
        overflow_tmp_b :=  '0';
        empty_tmp <=  '0';
        empty_tmp_var_b :=  '0';
        wrAddr <=  (OTHERS=>'0');
        rdPtr <=  (OTHERS=>'0');
        wrPtr <=  (OTHERS=>'0');
        wrPtr0 <=  (OTHERS=>'0');
        wrPtr1 <=  (OTHERS=>'0');
        wrPtr2 <=  (OTHERS=>'0');
        preRdPtr <=  (OTHERS=>'0');
        preRdPtr1 <=  "110";
        preRdPtr2 <=  "110";
        ram_we <= '0';
    else
        -- on read clock's rising edge, increment the read pointer and output data
        if (clk1'event and (clk1 = '1')) then
            if ((re = '1') and (empty_tmp_var_b = '1')) then
                dataout_tmp <= ram_dataout;
                case rdPtr is
                    when "000" => rdPtr <= "001";
                    when "001" => rdPtr <= "010";
                    when "010" => rdPtr <= "011";
                    when "011" => rdPtr <= "100";
                    when "100" => rdPtr <= "101";
                    when "101" => rdPtr <= "110";
                    when "110" => rdPtr <= "000";
                    when others => rdPtr <= "000";
                end case;
                preRdPtr <= rdPtr;
            else
                dataout_tmp <= dataout_tmp;
            end if;
            --synchronize write pointers.
            wrPtr1 <= wrPtr;
            wrPtr2 <= wrPtr1;
        end if;
        
        -- on write clock's rising edge, increment the write pointer and send data to the ram
        if (clk0'event and (clk0 = '1')) then
            wrPtr <= wrPtr0;
            if ((we = '1') and (overflow_tmp_b = '1')) then
                ram_we <= '1';
                ram_datain <= datain;
                wrAddr <= wrPtr0;
                case wrPtr0 is
                    when "000" => wrPtr0 <= "001";
                    when "001" => wrPtr0 <= "010";
                    when "010" => wrPtr0 <= "011";
                    when "011" => wrPtr0 <= "100";
                    when "100" => wrPtr0 <= "101";
                    when "101" => wrPtr0 <= "110";
                    when "110" => wrPtr0 <= "000";
                    when others => wrPtr0 <= "000";
                end case;
            else
                ram_we <= '0';
                wrAddr <= wrAddr;
                ram_datain <= ram_datain;
                wrPtr0 <= wrPtr0;
            end if;
            --synchronize read pointers.
            preRdPtr1 <= preRdPtr;
            preRdPtr2 <= preRdPtr1;
        end if;
        
        -- determine if the RAM/FIFO is full/empty
        if (wrPtr0 = preRdPtr2) then
            overflow_tmp_b := '0';
        else
            overflow_tmp_b := '1';
        end if;
        if ((rdPtr = wrPtr2) and (overflow_tmp_b = '1')) then
            empty_tmp_var_b := '0';
        else
            empty_tmp_var_b := '1';
        end if;
    end if;
    
    empty_tmp <= empty_tmp_var_b;
    overflow <= overflow_tmp_b;
    
end process;

-- assignments
empty <= empty_tmp;
dataout <= dataout_tmp;

end synchronizer;
-- END ARCHITECTURE SYNCHRONIZER


-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name : HSSI_RX
--                                                                             
-- Description : This is the receiver model used by altcdr_rx. Performs
--               deserialization of input data. 
--                        
-- Limitations : Assumes that the clock is already perfectly synchronized to the
--               incoming data
--
-- Expected results: data output from the deserializer, slow clock (clkout) 
--                   generated by the RX, run length violation flag (rlv), and
--                   locked output to indicate when the RX has failed to lock
--                   onto the input data signal (not simulated)
--
-- END ENTITY HEADER -----------------------------------------------------------

library IEEE, std;
use IEEE.std_logic_1164.all;

-- ENTITY DECLARATION
entity hssi_rx is
generic (
    channel_width  : integer := 20;
    operation_mode : string  := "CDR";
    run_length     : integer := 1
);
port (
    clk      : in std_logic; -- fast clock
    coreclk  : in std_logic; -- core clock (slow)
    datain   : in std_logic; -- data input to the receiver
    areset   : in std_logic := '0'; -- asynchronous reset
    feedback : in std_logic := '0'; -- data feedback port
    fbkcntl  : in std_logic := '0'; -- feedback control port

    dataout  : out std_logic_vector(channel_width-1 downto 0); -- data output of the RX
    clkout   : out std_logic;  -- slow clock generated by the RX
    rlv      : out std_logic;  -- data run length violation flag
    locked   : out std_logic   -- RX lost of lock indicator
);
end hssi_rx;

-- BEGINNING OF ARCHITECTURE HSSI_RECEIVER
architecture hssi_receiver of hssi_rx is

begin

process (clk, coreclk, areset, fbkcntl)

    -- VARIABLE DECLARATION
    variable clk_count         : integer := channel_width; --follow the 1st edge
    variable rlv_count         : integer := 0; 
    variable deser_data_arr    : std_logic_vector(channel_width-1 downto 0) := (OTHERS=>'0');
    variable dataout_tmp       : std_logic_vector(channel_width-1 downto 0) := (OTHERS=>'0');
    variable clkout_tmp        : std_logic := '0';
    variable rlv_tmp           : std_logic := '0';
    variable locked_tmp        : std_logic := '0';
    variable clkout_last_value : std_logic := '0';
    variable datain_int        : std_logic := '0';
    variable last_datain       : std_logic := '0';
    variable data_changed      : std_logic := '0';
    variable rlv_flag          : std_logic := '0';
    variable rlv_set           : std_logic := '0';
    variable need_init         : boolean := true;

begin
    -- initialize variables
    if ((now = 0 ns) or (need_init = true)) then
        dataout_tmp := (OTHERS => '0');
        clkout_last_value := '0';
        rlv_tmp := '0';
        clkout_tmp := '0';
        data_changed := '0';
        clk_count := channel_width;
        need_init := false;
    end if;
    
    -- reset logic
    if (areset = '1') then
        dataout_tmp := (OTHERS => '0');
        clkout_tmp :=  '0';
        clk_count := channel_width;
        rlv_tmp := '0';
        locked_tmp := '0';
        clkout_last_value := clk;
        for i in channel_width-1 downto 0 loop
            deser_data_arr(i) := '0';
        end loop;
        rlv_count := 0;
        rlv_flag := '0';
        rlv_set := '0';
        last_datain := 'X';
        data_changed := '0';
        
    -- deserialization and run length violation (rlv) checking  
    else
        -- data comes either from the feedback port or the datain port
        if (fbkcntl = '1') then
            datain_int := feedback;
        else
            datain_int := datain;
        end if;
        -- fast clock
        if (clk'event and (clk = '1')) then
            -- generation of clkout
            if ((clkout_last_value /= '1') and (clkout_last_value /= '0')) then
                clkout_last_value := clk;
                clkout_tmp := clk;
            end if;
            if (clk_count = channel_width) then
                clk_count :=0;
                clkout_tmp := not (clkout_last_value);
            elsif (clk_count = (channel_width+1)/2) then
                clkout_tmp := not (clkout_last_value);
            elsif (clk_count < channel_width) then
                clkout_tmp := clkout_last_value;
            end if;
            clk_count := clk_count + 1;
            
            -- run length violation checking
            if (operation_mode = "CDR") then
                if (last_datain /= datain_int) then
                    data_changed := '1';
                    last_datain := datain_int;
                else  -- datain has not changed
                    rlv_count := rlv_count + 1;
                    data_changed := '0';
                end if;
                if (rlv_count > run_length) then
                    rlv_set := '1';
                    rlv_flag := '1';
                else
                    rlv_set := '0';
                end if;
                if (data_changed = '1') then
                    rlv_count := 1;
                end if;
            end if;
        end if;
        if (coreclk'event and (coreclk = '1')) then
            -- output the rlv status with the rising edge of the slow clock
            if (operation_mode = "CDR") then
                if (rlv_flag = '1') then
                    rlv_tmp := '1';
                    if (rlv_set = '0') then
                        rlv_flag := '0';
                    end if;
                else
                    rlv_tmp := '0';
                end if;
            end if;
        end if;
        
        -- deserialization
        if (clk'event and (clk = '0')) then
            if ((clkout_last_value /= '1') and (clkout_last_value /= '0')) then
                clkout_last_value := clk;
                clkout_tmp := clk;
            end if;
            if (clk_count = 3) then
                dataout_tmp(channel_width-1 downto 0) := deser_data_arr;
            end if;
            for i in channel_width-1 downto 1 loop
                deser_data_arr(i) := deser_data_arr(i-1);
            end loop;
            deser_data_arr(0) := datain_int;
        end if;

        if (clkout_tmp /= 'U') then
            clkout_last_value := clkout_tmp;
        end if;
    end if;
    
    -- assign signals to the output ports
    clkout <= clkout_tmp;
    dataout <= dataout_tmp;
    rlv <= rlv_tmp;
    locked <= locked_tmp;

end process;

end hssi_receiver;
-- END ARCHITECTURE HSSI_RECEIVER

-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name      : HSSI_TX
--
-- Description      : The transmitter module used by altcdr_tx. Performs
--                    serialization of output data.
--
-- Limitations      : 
--
-- Expected results : Serial data output (dataout) and generated slow clock 
--                    (clkout)
--
-- END ENTITY HEADER -----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY DECLARATION
entity hssi_tx is
generic (
    channel_width : integer := 1
);
port (
    clk           : in std_logic;  -- required port, fast clock
    datain        : in std_logic_vector(channel_width-1 downto 0); -- required port, parallel input data
    areset        : in std_logic := '0';  -- asynchronous reset
    dataout       : out std_logic;        -- serial data output
    clkout        : out std_logic         -- generated output clock
);
end hssi_tx;

-- BEGINNING OF ARCHITECTURE TRANSMITTER
architecture transmitter of hssi_tx is
begin

process (clk, areset)  -- need to generate clkout here
    -- VARIABLE DECLARATION
    variable i : integer := 0;
    variable fast_clk_count    : integer := channel_width; -- always follow the first edge
    variable indata            : std_logic_vector(channel_width-1 downto 0) := (OTHERS=>'0');
    variable regdata           : std_logic_vector(channel_width-1 downto 0) := (OTHERS=>'0');
    variable dataout_tmp       : std_logic := '0';
    variable clkout_tmp        : std_logic := '0';
    variable clkout_last_value : std_logic := 'X';

begin
    -- reset logic
    if (areset = '1') then
        dataout_tmp := '0';
        clkout_tmp := '0';
        fast_clk_count := channel_width;
        for i in channel_width-1 downto 0 loop -- reset register
            indata(i) := '0';
            regdata(i) := '0';
        end loop;
    else
        -- rising edge of the fast clock
        if (clk'event and (clk = '1')) then
            if ((clkout_last_value /= '1') and (clkout_last_value /= '0')) then --for initial value
                clkout_last_value := clk;
                clkout_tmp := clk;
            end if;
            
            -- generate clkout
            if (fast_clk_count = channel_width) then
                fast_clk_count := 0;
                clkout_tmp := not (clkout_last_value);
            elsif (fast_clk_count = (channel_width+1)/2) then
                clkout_tmp := not (clkout_last_value);
            elsif (fast_clk_count < channel_width) then
                clkout_tmp := clkout_last_value;
            end if;
            
            fast_clk_count := fast_clk_count + 1;
            
            -- serialize data
            -- on 3rd rising edge, start to shift data out
            if (fast_clk_count = 3) then 
                for i in channel_width-1 downto 0 loop
                    regdata(i) := indata(i);
                end loop;
            end if;
            
            -- send the MSB of regdata out
            dataout_tmp := regdata(channel_width - 1);
            -- shift data up
            for i in channel_width-1 downto 1 loop
                regdata(i) := regdata(i-1);
            end loop;
        end if;
        -- on the falling edge of the fast clock
        if (clk'event and (clk = '0')) then
            if ((clkout_last_value /= '1') and (clkout_last_value /= '0')) then --for initial value
                clkout_last_value := clk;
                clkout_tmp := clk;
            end if;
            
            -- load data from datain port on 3rd falling edge of the fast clock
            if (fast_clk_count = 3) then  
                indata := datain(channel_width-1 downto 0);
            end if;
        end if;
    end if;

    if (clkout_tmp /= 'U') then
        clkout_last_value := clkout_tmp;
    end if;

    dataout <= dataout_tmp;
    clkout <= clkout_tmp;
        
end process;

end transmitter;
-- END ARCHITECTURE TRANSMITTER

-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name : ALTCDR_RX
--                                                                             
-- Description : Clock Data Recovery (CDR) Receiver behavioral model. Consists
--               of CDR receiver for deserialization, a Phase Locked Loop (PLL)
--               and FIFO. 
--                        
-- Limitations : Available for the Mercury device family only
--
-- Expected results : Deserialized data output (rx_out), recovered global data 
--                    clock (rx_outclock), PLL lock signal, RX lost of lock signal,
--                    RX run length violation signal, RX FIFO full and empty
--                    signals (active high), recovered clock per channel
--                    (rx_rec_clk)
--
-- END ENTITY HEADER -----------------------------------------------------------

library ieee, altera;
use ieee.std_logic_1164.all;
use altera.pllpack.all;

-- ENTITY DECLARATION
entity altcdr_rx is
generic (
    number_of_channels     : positive := 1;
    deserialization_factor : positive := 1;
    inclock_period         : positive;        -- required parameter
    inclock_boost          : positive := 1;
    run_length             : integer := 62;   -- default based on SONET requirements
    bypass_fifo            : string := "OFF";
    intended_device_family : string := "MERCURY";
    lpm_type               : string := "altcdr_rx"
);
port (
    rx_in         : in std_logic_vector(number_of_channels-1 downto 0); -- required port, data input
    rx_inclock    : in std_logic; -- required port, reference input clock
    rx_coreclock  : in std_logic; -- required port, core clock
    rx_aclr       : in std_logic := '0'; -- asynchronous clear for the RX and FIFO logic
    rx_pll_aclr   : in std_logic := '0'; -- asynchronous clear for the PLL
    rx_fifo_rden  : in std_logic_vector(number_of_channels-1 downto 0) := (OTHERS => '1'); -- FIFO read enable

    rx_out        : out std_logic_vector(deserialization_factor*number_of_channels-1 downto 0); -- data output
    rx_outclock   : out std_logic;  -- global core clock recovered from channel 0
    rx_pll_locked : out std_logic;  -- PLL lock
    rx_locklost   : out std_logic_vector(number_of_channels-1 downto 0); -- RX lost of lock wrt data input
    rx_rlv        : out std_logic_vector(number_of_channels-1 downto 0); -- RX data run length violation
    rx_full       : out std_logic_vector(number_of_channels-1 downto 0); -- RX FIFO full
    rx_empty      : out std_logic_vector(number_of_channels-1 downto 0); -- RX FIFO empty
    rx_rec_clk    : out std_logic_vector(number_of_channels-1 downto 0)  -- recovered clock from each channel
);
end altcdr_rx;    

-- BEGINNING OF ARCHITECTURE STRUCT
architecture struct of altcdr_rx is

    -- VARIABLE AND TYPE DECLARATION
    type cdrword is array (number_of_channels downto 0) of std_logic_vector(deserialization_factor-1 downto 0);
    signal w_rx_inclock0 : std_logic := '0';
    signal w_rx_clkout   : std_logic_vector(number_of_channels-1 downto 0) := (OTHERS=>'0');
    signal w_rx_out      : cdrword;
    signal fifo_rx_out   : std_logic_vector(deserialization_factor*number_of_channels-1 downto 0) := (OTHERS=>'0');
    signal i_rx_out      : std_logic_vector(deserialization_factor*number_of_channels-1 downto 0) := (OTHERS=>'0');
    signal fifo_empty    : std_logic_vector(number_of_channels-1 downto 0) := (OTHERS=>'0');
    signal fifo_full     : std_logic_vector(number_of_channels-1 downto 0) := (OTHERS=>'0');

-- COMPONENT DECLARATION
-- HSSI_PLL    
component hssi_pll
generic
(
    clk0_multiply_by        : integer := 1;
    input_frequency         : integer := 1000  -- period in ps
);
port
(
    clk    : in std_logic := '0';
    areset : in std_logic := '0';
    clk0   : out std_logic;
    locked : out std_logic
);
end component; -- hssi _pll

-- HSSI_RX
component hssi_rx
generic (
    channel_width   : integer := 20;
    operation_mode  : string := "CDR";
    run_length      : integer := 1
);
port (
    clk             : in std_logic;
    coreclk         : in std_logic;
    datain          : in std_logic;
    areset          : in std_logic := '0';
    dataout         : out std_logic_vector(channel_width-1 downto 0);
    clkout          : out std_logic;
    rlv             : out std_logic;
    locked          : out std_logic
);
end component; -- hssi_rx

-- HSSI_FIFO
component hssi_fifo
generic (
    channel_width   : integer := 20
);
port (
    datain   : in std_logic_vector(channel_width-1 downto 0);
    clk0     : in std_logic;
    clk1     : in std_logic;
    re       : in std_logic := '0';
    reset    : in std_logic := '0';
    dataout  : out std_logic_vector(channel_width-1 downto 0);
    empty    : out std_logic;
    overflow : out std_logic
);
end component; -- hssi_fifo

constant RUN_LENGTH_MAX : integer := 62;

begin

-- checking for invalid parameters
MSG: process
begin

    if (number_of_channels <= 0) then
        ASSERT FALSE
        REPORT "The number_of_channels parameter must be greater than 0"
        SEVERITY ERROR;
    end if;

    if (run_length > RUN_LENGTH_MAX) then
        ASSERT FALSE
        REPORT "The run_length parameter must be greater than " & int2str(RUN_LENGTH_MAX)
        SEVERITY ERROR;
    end if;

    if not (((deserialization_factor >= 3) and (deserialization_factor <= 12)) or
             (deserialization_factor = 14)  or (deserialization_factor = 16)  or
             (deserialization_factor = 18)  or (deserialization_factor = 20)) then
        ASSERT FALSE
        REPORT "Illegal value for deserialization_factor parameter " &
                int2str(deserialization_factor) & " -- value " &
               "must be in the range 3 to 12, inclusive, or must be one of 14, 16, 18, or 20"
        SEVERITY ERROR;
    end if;
    wait;
end process MSG;



-- Generate the required numbers of PLL, FIFO and receiver modules
-- PLL
PLL: hssi_pll
generic map (
    clk0_multiply_by => inclock_boost,
    input_frequency => inclock_period
)
port map (
    clk => rx_inclock, 
    areset => rx_pll_aclr, 
    clk0 => w_rx_inclock0, 
    locked => rx_pll_locked
);

-- Receiver
RX_GEN: for i in 0 to number_of_channels-1 generate
    RX: hssi_rx 
    generic map (
        channel_width => deserialization_factor,
        operation_mode => "CDR",
        run_length => run_length
    )
    port map (
        clk => w_rx_inclock0, 
        coreclk => rx_coreclock,
        datain => rx_in(i),
        areset => rx_aclr, 
        dataout => w_rx_out(i),
        clkout => w_rx_clkout(i),
        rlv => rx_rlv(i),
        locked => rx_locklost(i) 
    );
end generate;

-- FIFO
FIFO_GEN: for i in 0 to number_of_channels-1 generate
    FIFO: hssi_fifo
    generic map (
        channel_width => deserialization_factor
    )
    port map (
        datain => w_rx_out(i),
        clk0 => w_rx_clkout(i),
        clk1 => rx_coreclock, 
        re => rx_fifo_rden(i),
        reset => rx_aclr, 
        dataout => fifo_rx_out((i+1)*deserialization_factor-1 downto i*deserialization_factor),
        overflow => fifo_full(i), 
        empty => fifo_empty(i)
    );
end generate;

-- data output from the receiver part, for use as rx_out when FIFO is bypassed
IRX: for i in 0 to number_of_channels-1 generate
    i_rx_out((i+1)*deserialization_factor-1 downto i* deserialization_factor) <= w_rx_out(i);
end generate;

-- Assign the correct signals to the correct output ports
rx_outclock <= w_rx_clkout(0);
rx_rec_clk <= w_rx_clkout;
rx_out <= fifo_rx_out when bypass_fifo = "OFF" else i_rx_out;
rx_empty <= not fifo_empty when bypass_fifo = "OFF" else (others => 'X');
rx_full <= not fifo_full when bypass_fifo = "OFF" else (others => 'X');

end struct;
-- END ARCHITECTURE STRUCT

-- START ENTITY HEADER ---------------------------------------------------------
--
-- Entity Name      : ALTCDR_TX
--
-- Description      : The Clock Data Recovery (CDR) transmitter behavioral
--                    model. Consists of CDR transmitter for serialization,
--                    a PLL and FIFO.
--
-- Limitations      : Available for the Mercury device family only.
--
-- Expected results : Serial data output (tx_out), generated slow clock 
--                    (tx_clkout), FIFO full signal (tx_full), FIFO empty signal
--                    (tx_empty), PLL lock signal (tx_pll_locked)
--
-- END ENTITY HEADER -----------------------------------------------------------

library ieee, altera;
use ieee.std_logic_1164.all;
use altera.pllpack.all;

-- ENTITY DECLARATION
entity altcdr_tx is
generic (
    number_of_channels     : positive := 1;
    deserialization_factor : positive := 1;
    inclock_period         : positive; -- required parameter
    inclock_boost          : positive := 1;
    bypass_fifo            : string := "OFF";
    intended_device_family : string := "MERCURY";
    lpm_type               : string := "altcdr_tx"
);
port (
    tx_in         : in std_logic_vector(deserialization_factor*number_of_channels-1 downto 0); -- required port, parallel data input
    tx_inclock    : in std_logic;         -- required port, input reference clock
    tx_coreclock  : in std_logic;         -- required port, input core clock
    tx_aclr       : in std_logic := '0';  -- asynchronous clear for TX and FIFO
    tx_pll_aclr   : in std_logic := '0';  -- asynchronous clear for PLL
    tx_fifo_wren  : in std_logic_vector(number_of_channels-1 downto 0) := (OTHERS => '1'); -- FIFO write enable

    tx_out        : out std_logic_vector(number_of_channels-1 downto 0); -- serial data output
    tx_outclock   : out std_logic;  -- generated slow clock
    tx_pll_locked : out std_logic;  -- PLL lock signal 
    tx_empty      : out std_logic_vector(number_of_channels-1 downto 0); -- FIFO empty signal
    tx_full       : out std_logic_vector(number_of_channels-1 downto 0)  -- FIFO full signal
);
end altcdr_tx;    

-- BEGINNING OF ARCHITECTURE STRUCT
architecture struct of altcdr_tx is

-- SIGNAL AND TYPE DECLARATION
type cdrword is array (number_of_channels downto 0) of std_logic_vector(deserialization_factor-1 downto 0);
signal fifo_out      : cdrword;
signal tx_data_in    : cdrword;
signal i_tx_in       : cdrword;
signal w_tx_inclock0 : std_logic := '0';
signal w_tx_clkout   : std_logic_vector(number_of_channels-1 downto 0) := (OTHERS=>'0');
signal i_tx_out      : std_logic_vector(deserialization_factor*number_of_channels-1 downto 0) := (OTHERS=>'0');
signal fifo_empty    : std_logic_vector(number_of_channels-1 downto 0) := (OTHERS=>'0');
signal fifo_full     : std_logic_vector(number_of_channels-1 downto 0) := (OTHERS=>'1');

-- COMPONENT DECLARATION
-- HSSI_PLL
component hssi_pll
generic (
    clk0_multiply_by   : integer := 1;
    input_frequency    : integer := 1000
);
port ( 
    clk    : in std_logic := '0';
    areset : in std_logic := '0';
    clk0   : out std_logic;
    locked : out std_logic 
);
end component; -- hssi_pll

-- HSSI_TX
component hssi_tx
generic (
    channel_width   : integer := 20
);
port (
    clk     : in std_logic;
    datain  : in std_logic_vector(channel_width-1 downto 0);
    areset  : in std_logic := '0';
    clkout  : out std_logic;
    dataout : out std_logic
);
end component; -- hssi_tx

-- HSSI_FIFO
component hssi_fifo
generic (
    channel_width   : integer := 20
);
port (
    datain   : in std_logic_vector(channel_width-1 downto 0);
    clk0     : in std_logic;
    clk1     : in std_logic;
    we       : in std_logic := '0';
    reset    : in std_logic := '0';
    dataout  : out std_logic_vector(channel_width-1 downto 0);
    empty    : out std_logic;
    overflow : out std_logic
);
end component; -- hssi_fifo

begin

-- checking for invalid parameters
MSG: process
begin

    if (number_of_channels <= 0) then
        ASSERT FALSE
        REPORT "The number_of_channels parameter must be greater than 0"
        SEVERITY ERROR;
    end if;


    if not (((deserialization_factor >= 3) and (deserialization_factor <= 12)) or
             (deserialization_factor = 14)  or (deserialization_factor = 16)  or
             (deserialization_factor = 18)  or (deserialization_factor = 20)) then
        ASSERT FALSE
        REPORT "Illegal value for deserialization_factor parameter " &
                int2str(deserialization_factor) & " -- value " &
               "must be in the range 3 to 12, inclusive, or must be one of 14, 16, 18, or 20"
        SEVERITY ERROR;
    end if;
    wait;
end process MSG;



-- COMPONENT INSTANTIATION
PLL_GEN: hssi_pll
    generic map (
        clk0_multiply_by => inclock_boost,
        input_frequency => inclock_period
    )
    port map (
        clk    => tx_inclock,
        areset => tx_pll_aclr,
        clk0   => w_tx_inclock0, 
        locked => tx_pll_locked
    );

FIFO_GEN: for i in 0 to number_of_channels-1 generate
    FIFO: hssi_fifo
        generic map (
            channel_width => deserialization_factor
        )
        port map (
            clk0     => tx_coreclock, 
            clk1     => w_tx_clkout(i),
            we       => tx_fifo_wren(i),
            reset    => tx_aclr, 
            datain   => tx_in(((i+1)*deserialization_factor-1) downto (i*deserialization_factor)),
            overflow => fifo_full(i), 
            empty    => fifo_empty(i),
            dataout  => fifo_out(i)
        );
end generate FIFO_GEN;

TX_GEN: for i in 0 to number_of_channels-1 generate
    TX: hssi_tx
        generic map (
            channel_width => deserialization_factor
        )
        port map    (
            clk     => w_tx_inclock0, 
            datain  => tx_data_in(i),
            areset  => tx_aclr, 
            clkout  => w_tx_clkout(i),
            dataout => tx_out(i)
        );
end generate TX_GEN;

-- break input data to an array of signals
IRX: for i in 0 to number_of_channels-1 generate
    i_tx_in(i) <= tx_in(((i+1)*deserialization_factor-1) downto (i*deserialization_factor));
end generate IRX;

-- signal assignments
tx_data_in  <= fifo_out when bypass_fifo = "OFF" else i_tx_in;
tx_empty    <= not fifo_empty when bypass_fifo = "OFF" else (OTHERS => 'X');
tx_full     <= not fifo_full when bypass_fifo = "OFF" else (OTHERS => 'X');
tx_outclock <= w_tx_clkout(0);

end struct;
-- END ARCHITECTURE STRUCT

----------------------------------------------------------------------------
-- Module Name      : altdpram
--
-- Description      : Parameterized Dual Port RAM megafunction
--
-- Limitation       : This megafunction is provided only for backward
--                    compatibility in Cyclone, Stratix, and Stratix GX
--                    designs.
--
-- Results expected : RAM having dual ports behaviour
--
----------------------------------------------------------------------------
    
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
library grlib;
use grlib.stdlib.all;
use std.textio.all;
library altera;
use altera.ALTERA_DEVICE_FAMILIES.all;
use altera.ALTERA_COMMON_CONVERSION.all;

-- ENTITY DECLARATION
entity altdpram is
    generic
      ( width                  : natural;
        widthad                : natural;
        numwords               : natural := 0;
        lpm_file               : string := "UNUSED";
        lpm_hint               : string := "USE_EAB=ON";
        use_eab                : string := "ON";
        indata_reg             : string := "INCLOCK";
        indata_aclr            : string := "ON";
        wraddress_reg          : string := "INCLOCK";
        wraddress_aclr         : string := "ON";
        wrcontrol_reg          : string := "INCLOCK";
        wrcontrol_aclr         : string := "ON";
        rdaddress_reg          : string := "OUTCLOCK";
        rdaddress_aclr         : string := "ON";
        rdcontrol_reg          : string := "OUTCLOCK";
        rdcontrol_aclr         : string := "ON";
        outdata_reg            : string := "UNREGISTERED";
        outdata_aclr           : string := "ON";
        maximum_depth          : natural := 2048;
        intended_device_family : string := "APEX20KE";
        lpm_type               : string := "altdpram");
    port
      ( wren       : in std_logic := '0';
        data       : in std_logic_vector(width-1 downto 0);
        wraddress  : in std_logic_vector(widthad-1 downto 0);
        inclock    : in std_logic := '0';
        inclocken  : in std_logic := '1';
        rden       : in std_logic := '1';
        rdaddress  : in std_logic_vector(widthad-1 downto 0);
        outclock   : in std_logic := '0';
        outclocken : in std_logic := '1';
        aclr       : in std_logic := '0';
        q          : out std_logic_vector(width-1 downto 0) );

end altdpram;

-- ARCHITECTURE DECLARATION
architecture behavior of altdpram is

-- TYPE DECLARATION
type alt_memory is array((2**WIDTHAD)-1 downto 0) of std_logic_vector(WIDTH-1 downto 0);

-- SIGNAL DECLARATION
signal idata_tmp: std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
signal idata_reg: std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
signal idata_hi : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
signal idata_lo : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
signal iq_tmp   : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
signal iq_reg   : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
signal irdaddress_tmp : std_logic_vector(WIDTHAD-1 downto 0) := (OTHERS => '0');
signal irdaddress_reg : std_logic_vector(WIDTHAD-1 downto 0) := (OTHERS => '0');
signal iwraddress_tmp : std_logic_vector(WIDTHAD-1 downto 0) := (OTHERS => '0');
signal iwraddress_reg : std_logic_vector(WIDTHAD-1 downto 0) := (OTHERS => '0');
signal iwraddress_hi  : std_logic_vector(WIDTHAD-1 downto 0) := (OTHERS => '0');
signal iwraddress_lo  : std_logic_vector(WIDTHAD-1 downto 0) := (OTHERS => '0');
signal iwren_tmp    : std_logic := '0';
signal iwren_reg    : std_logic := '0';
signal iwren_hi     : std_logic := '0';
signal iwren_lo     : std_logic := '0';
signal irden_tmp    : std_logic := '0';
signal irden_reg    : std_logic := '0';
signal write_at_low_clock : boolean := false;
signal rden_low_output_0 : boolean := false;

begin

-- PROCESS BLOCKS
    INITIAL: process (inclock, outclock)
    variable init : boolean := false;
    begin
        if (not init) then
            if ((lpm_hint = "USE_EAB=ON") and (use_eab = "ON")) then
                if (wrcontrol_reg = "INCLOCK") then
                    write_at_low_clock <= true;
                end if;
                if (IS_FAMILY_APEX20K(intended_device_family)) then
                    rden_low_output_0 <= true;
                end if;
            end if;
            init := true;
        end if;
    end process; -- initial

    SYNC: process(data, idata_reg, rden, irden_reg, rdaddress, irdaddress_reg,
                  wren, iwren_reg, wraddress, iwraddress_reg, iq_tmp, iq_reg,
                  aclr)
    begin
        if ((rdaddress_reg = "INCLOCK") or (rdaddress_reg = "OUTCLOCK")) then
            irdaddress_tmp <= irdaddress_reg;
        else
            irdaddress_tmp <= rdaddress;
        end if;

        if ((rdcontrol_reg = "INCLOCK") or (rdcontrol_reg = "OUTCLOCK")) then
            irden_tmp <= irden_reg;
        else
            irden_tmp <= rden;
        end if;

        if (wraddress_reg = "INCLOCK") then
            iwraddress_tmp <= iwraddress_reg;
        else
            iwraddress_tmp <= wraddress;
        end if;

        if (wrcontrol_reg = "INCLOCK") then
            iwren_tmp <= iwren_reg; 
        else
            iwren_tmp <= wren;
        end if;

        if (indata_reg = "INCLOCK") then
            idata_tmp <= idata_reg;
        else
            idata_tmp <= data;
        end if;

        if (outdata_reg = "OUTCLOCK") then
            q <= iq_reg;
        else
            q <= iq_tmp;
        end if;

        if (aclr = '1') then
            if( (indata_aclr = "ON") and ( indata_reg /= "UNREGISTERED") ) then
                idata_tmp <= (OTHERS => '0');
            end if;

            if( (wraddress_aclr = "ON") and ( wraddress_reg /= "UNREGISTERED") )then
                iwraddress_tmp <= (OTHERS => '0');
            end if;

            if( (wrcontrol_aclr = "ON") and ( wrcontrol_reg /= "UNREGISTERED") )then
                iwren_tmp <= '0';
            end if;

            if( (rdaddress_aclr = "ON") and ( rdaddress_reg /= "UNREGISTERED") )then
                irdaddress_tmp <= (OTHERS => '0');
            end if;

            if( (rdcontrol_aclr = "ON") and ( rdcontrol_reg /= "UNREGISTERED") )then
                irden_tmp <= '0';
            end if;

            if( (outdata_aclr = "ON") and (outdata_reg /= "UNREGISTERED") ) then
                q <= (OTHERS => '0');
            end if;
        end if;
    end process; -- sync

    SYNC2: process(idata_hi, idata_lo, iwraddress_hi, iwraddress_lo,
                   iwren_hi, iwren_lo)
    begin
        if (write_at_low_clock) then
            idata_reg <= idata_lo;
            iwren_reg <= iwren_lo;
            iwraddress_reg <= iwraddress_lo;
        else
            idata_reg <= idata_hi;
            iwren_reg <= iwren_hi;
            iwraddress_reg <= iwraddress_hi;
        end if;
    end process; -- sync2

    REGISTERS: process (inclock, outclock)
    begin

        -- WRITE REGS --
        if ((aclr = '1') and (indata_aclr = "ON") and (indata_reg /= "UNREGISTERED") ) then
            idata_hi <= (OTHERS => '0');
            idata_lo <= (OTHERS => '0');
        elsif ((inclock'event) and (inclock = '1') and (inclocken = '1')) then
            idata_hi <= data;
        elsif ((inclock'event) and (inclock = '0')) then
            idata_lo <= idata_hi;
        end if;

        if ((aclr = '1') and (wraddress_aclr = "ON") and (wraddress_reg /= "UNREGISTERED") ) then
            iwraddress_hi <= (OTHERS => '0');
            iwraddress_lo <= (OTHERS => '0');
        elsif ((inclock'event) and (inclock = '1') and (inclocken = '1')) then
            iwraddress_hi <= wraddress;
        elsif ((inclock'event) and (inclock = '0')) then
            iwraddress_lo <= iwraddress_hi;
        end if;

        if ((aclr = '1') and (wrcontrol_aclr = "ON") and (wrcontrol_reg /= "UNREGISTERED") ) then
            iwren_hi <= '0';
            iwren_lo <= '0';
        elsif ((inclock'event) and (inclock = '1') and (inclocken = '1')) then
            iwren_hi <= wren;
        elsif ((inclock'event) and (inclock = '0')) then
            iwren_lo <= iwren_hi;
        end if;

        -- READ REGS --
        if ((aclr = '1') and (outdata_aclr = "ON") and ( outdata_reg /= "UNREGISTERED") ) then
            iq_reg <= (OTHERS => '0');
        elsif ((outclock'event) and (outclock = '1') and (outclocken = '1')) then
            iq_reg <= iq_tmp;
        end if;

        if (rdaddress_reg = "INCLOCK") then
            if ((aclr = '1') and (rdaddress_aclr = "ON") and (rdaddress_reg /= "UNREGISTERED") ) then
                irdaddress_reg <= (OTHERS => '0');
            elsif ((inclock'event) and (inclock = '1') and (inclocken = '1')) then
                irdaddress_reg <= rdaddress;
            end if;
        end if;

        if (rdcontrol_reg = "INCLOCK") then
            if ((aclr = '1') and (rdcontrol_aclr = "ON") and (rdcontrol_reg /= "UNREGISTERED") ) then
                irden_reg <= '0';
            elsif ((inclock'event) and (inclock = '1') and (inclocken = '1')) then
                irden_reg <= rden; 
            end if;
        end if;

        if (rdaddress_reg = "OUTCLOCK") then
            if ((aclr = '1') and (rdaddress_aclr = "ON") and (rdaddress_reg /= "UNREGISTERED") ) then
                irdaddress_reg <= (OTHERS => '0');
            elsif ((outclock'event) and (outclock = '1') and (outclocken = '1')) then
                irdaddress_reg <= rdaddress;
            end if;
        end if;

        if (rdcontrol_reg = "OUTCLOCK") then
            if ((aclr = '1') and (rdcontrol_aclr = "ON") and (rdcontrol_reg /= "UNREGISTERED") ) then
                irden_reg <= '0';
            elsif ((outclock'event) and (outclock = '1') and (outclocken = '1')) then
                irden_reg <= rden; 
            end if;
        end if;
    end process; -- registers

    MEMORY: process(idata_tmp, iwren_tmp, irden_tmp, irdaddress_tmp, iwraddress_tmp)
    variable mem_data : alt_memory;
    variable mem_data_word : std_logic_vector(width-1 downto 0);
    variable mem_init : boolean := false;
        variable i      : integer := 0;
        variable j      : integer := 0;
        variable k      : integer := 0;
        variable n      : integer := 0;
        variable m      : integer := 0;
        variable lineno : integer := 0;
    variable buf : line;
    variable booval : boolean;
    FILE mem_data_file : TEXT;
        variable base       : string(2 downto 1);
        variable byte       : string(2 downto 1);
        variable rec_type   : string(2 downto 1);
        variable datain     : string(2 downto 1);
        variable addr       : string(2 downto 1);
        variable checksum   : string(2 downto 1);
    variable startadd: string(4 downto 1);
    variable ibase : integer := 0;
    variable ibyte : integer := 0;
    variable istartadd : integer := 0;
        variable check_sum_vec      : std_logic_vector(7 downto 0);
        variable check_sum_vec_tmp  : std_logic_vector(7 downto 0);


    begin
        -- INITIALIZE --
        if NOT(mem_init) then
            -- INITIALIZE TO 0 --
            for i in mem_data'LOW to mem_data'HIGH loop
                mem_data(i) := (OTHERS => '0');
            end loop;

            if (lpm_file /= "UNUSED") then
         FILE_OPEN(mem_data_file, LPM_FILE, READ_MODE);          
                WHILE NOT ENDFILE(mem_data_file) loop
                    booval := true;
                    READLINE(mem_data_file, buf);
                    lineno := lineno + 1;
                    check_sum_vec := (OTHERS => '0');

                    if (buf(buf'LOW) = ':') then
                        i := 1;
                        SHRINK_LINE(buf, i);
                        READ(L=>buf, VALUE=>byte, good=>booval);
                        if (not booval) then
                            ASSERT FALSE
                            REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format!"
                            SEVERITY ERROR;
                        end if;
                        ibyte := HEX_STR_TO_INT(byte);
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(ibyte, 8));
                        check_sum_vec := check_sum_vec + ibyte;
                        READ(L=>buf, VALUE=>startadd, good=>booval);
                        if (not booval) then
                            ASSERT FALSE
                            REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                            SEVERITY ERROR;
                        end if;
                        istartadd := HEX_STR_TO_INT(startadd);
                        addr(2) := startadd(4);
                        addr(1) := startadd(3);
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(addr), 8));
                        check_sum_vec := check_sum_vec + HEX_STR_TO_INT(addr);
                        addr(2) := startadd(2);
                        addr(1) := startadd(1);
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(addr), 8));
                        check_sum_vec := check_sum_vec + HEX_STR_TO_INT(addr);
                        READ(L=>buf, VALUE=>rec_type, good=>booval);
                        if not (booval) then
                            ASSERT FALSE
                            REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                            SEVERITY ERROR;
                        end if;
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(rec_type), 8));
                        check_sum_vec := check_sum_vec + HEX_STR_TO_INT(rec_type);
                    else
                        ASSERT FALSE
                        REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                        SEVERITY ERROR;
                    end if;

                    case rec_type is
                        when "00"=>     -- Data record
                            i := 0;
                                                        k := (WIDTH + 7) / 8;  -- # of bytes per entry
                            while (i < ibyte) loop
                                                                mem_data_word := (others => '0');
                                                                n := (k - 1)*8;
                                                                m := width - 1;
                                for j in 1 to k loop
                                    READ(L=>buf, VALUE=>datain,good=>booval); -- read in data a byte (2 hex chars) at a time.
                                    if not (booval) then
                                        ASSERT FALSE
                                        REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                                        SEVERITY ERROR;
                                    end if;
--                                    check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(datain), 8));
                                    check_sum_vec := check_sum_vec + HEX_STR_TO_INT(datain);
                                    mem_data_word(m downto n) := CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(datain), m-n+1);
                                                                        m := n - 1;
                                                                        n := n - 8;
                                end loop;
                                i := i + k;
                                                                mem_data(ibase + istartadd) := mem_data_word;
                                istartadd := istartadd + 1;
                            end loop;
                        when "01"=>
                            exit;
                        when "02"=>
                            ibase := 0;
                            if (ibyte /= 2) then
                                ASSERT FALSE
                                REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format for record type 02! "
                                SEVERITY ERROR;
                            end if;
                            for i in 0 to (ibyte-1) loop
                                READ(L=>buf, VALUE=>base,good=>booval);
                                ibase := (ibase * 256) + HEX_STR_TO_INT(base);
                                if not (booval) then
                                    ASSERT FALSE
                                    REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                                    SEVERITY ERROR;
                                end if;
--                                check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(base), 8));
                                check_sum_vec := check_sum_vec + HEX_STR_TO_INT(base);
                            end loop;
                            ibase := ibase * 16;
                        when OTHERS =>
                            ASSERT FALSE
                            REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal record type in Intel Hex File! "
                            SEVERITY ERROR;
                    end case;

                    READ(L=>buf, VALUE=>checksum,good=>booval);

                    if (not booval) then
                        ASSERT FALSE
                        REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Checksum is missing! "
                        SEVERITY ERROR;
                    end if;

--                    check_sum_vec := unsigned(not (check_sum_vec)) + 1 ;
                    check_sum_vec := (not (check_sum_vec)) + 1 ;
                    check_sum_vec_tmp := CONV_STD_LOGIC_VECTOR(HEX_STR_TO_INT(checksum),8);

--                    if (unsigned(check_sum_vec) /= unsigned(check_sum_vec_tmp)) then
                    if (check_sum_vec /= check_sum_vec_tmp) then
                        ASSERT FALSE
                        REPORT "[Line "& INT_TO_STR_RAM(lineno) & "]:Incorrect checksum!"
                        SEVERITY ERROR;
                    end if;

                end loop;
          FILE_CLOSE(mem_data_file);          
            end if;
            mem_init := TRUE;

        else -- already initialized

            -- MEMORY FUNCTION --
            -- Write and read data to and from the memory.
            -- If write and read are at the same address, whatever wrote into
            -- the memory will immediately reflected at the read results.
            if (iwren_tmp = '1') then
                mem_data (conv_integer(iwraddress_tmp)) := idata_tmp;
            end if;

            if (irden_tmp = '1') then
                iq_tmp <= mem_data(conv_integer(irdaddress_tmp));
            elsif (rden_low_output_0) then
                iq_tmp <= (OTHERS => '0');
            end if;

        end if; -- if NOT(mem_init)

    end process; -- memory

end behavior; -- altdpram

---START_ENTITY_HEADER----------------------------------------------------------
--
-- Entity Name      : ALTSYNCRAM
--
-- Description      : Synchronous ram model for Stratix series family
--
-- Limitation       :
--
---END_ENTITY_HEADER------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
library grlib;
library altera;
use grlib.stdlib.all;
use std.textio.all;
use altera.ALTERA_COMMON_CONVERSION.all;
use altera.ALTERA_DEVICE_FAMILIES.all;

-- BEGINNING OF ENTITY

-- ENTITY DECLARATION

entity altsyncram is
-- GENERIC DECLARATION
    generic (
        -- PORT A PARAMETERS
        width_a                            :  integer := 1;
        widthad_a                          :  integer := 1;
        numwords_a                         :  integer := 0;
        outdata_reg_a                      :  string  := "UNREGISTERED";    
        address_aclr_a                     :  string  := "NONE";    
        outdata_aclr_a                     :  string  := "NONE";    
        indata_aclr_a                      :  string  := "NONE";    
        wrcontrol_aclr_a                   :  string  := "NONE";    
        byteena_aclr_a                     :  string  := "NONE";    
        width_byteena_a                    :  integer := 1;
        clock_enable_input_a               :  string  := "NORMAL";
        clock_enable_output_a              :  string  := "NORMAL";

        -- PORT B PARAMETERS
        width_b                            :  integer := 1;
        widthad_b                          :  integer := 1;
        numwords_b                         :  integer := 0;
        rdcontrol_reg_b                    :  string  := "CLOCK1";
        address_reg_b                      :  string  := "CLOCK1";
        outdata_reg_b                      :  string  := "UNREGISTERED";    
        outdata_aclr_b                     :  string  := "NONE";    
        rdcontrol_aclr_b                   :  string  := "NONE";    
        indata_reg_b                       :  string  := "CLOCK1";
        wrcontrol_wraddress_reg_b          :  string  := "CLOCK1";
        byteena_reg_b                      :  string  := "CLOCK1";
        indata_aclr_b                      :  string  := "NONE";    
        wrcontrol_aclr_b                   :  string  := "NONE";    
        address_aclr_b                     :  string  := "NONE";    
        byteena_aclr_b                     :  string  := "NONE";    
        width_byteena_b                    :  integer := 1;    
        clock_enable_input_b               :  string  := "NORMAL";
        clock_enable_output_b              :  string  := "NORMAL";

        -- GLOBAL PARAMETERS
        operation_mode                     :  string  := "BIDIR_DUAL_PORT";
        byte_size                          :  integer := 8;  
        read_during_write_mode_mixed_ports :  string  := "DONT_CARE";    
        ram_block_type                     :  string  := "AUTO";    
        init_file                          :  string  := "UNUSED";    
        init_file_layout                   :  string  := "UNUSED";    
        maximum_depth                      :  integer := 0;    
        intended_device_family             :  string  := "Stratix";

        lpm_hint                           :  string  := "UNUSED";
        lpm_type                           :  string  := "altsyncram" 
        );
    
-- PORT DECLARATION
    port (
        -- INPUT PORT DECLARATION
        wren_a    : in std_logic := '0'; -- Port A write/read enable input
        wren_b    : in std_logic := '0'; -- Port B write enable input
        rden_b    : in std_logic := 'Z'; -- Port B read enable input
        data_a    : in std_logic_vector(width_a - 1 downto 0) := (others => '0');
                        -- Port A data input
        data_b    : in std_logic_vector(width_b - 1 downto 0) := (others => '0');
                        -- Port B data input
        address_a : in std_logic_vector(widthad_a - 1 downto 0) := (others => '0');
                        -- Port A address input
        address_b : in std_logic_vector(widthad_b - 1 downto 0) := (others => '0');
                        -- Port B address input

        -- clock inputs on both ports and here are their usages:
        -- Port A 
        -- 1. all input registers must be clocked by clock0.
        -- 2. output register can be clocked by  either by clock0, clock1 or none. 
        -- Port B 
        -- 1. all input registers must be clocked by either clock0 or clock1.
        -- 2. output register can be clocked by either clock0, clock1 or none. 
        clock0    : in std_logic := '1';   
        clock1    : in std_logic := '1';   

        -- clock enable inputs and here are their usages:
        -- clocken0 -- can only be used for enabling clock0.
        -- clocken1 -- can only be used for enabling clock1.
        clocken0  : in std_logic := '1';   
        clocken1  : in std_logic := '1';   

        -- clear inputs on both ports and here are their usages:
        -- Port A 
        -- 1. all input registers can only be cleared by clear0 or none.
        -- 2. output register can be cleared by either clear0, clear1 or none. 
        -- Port B 
        -- 1. all input registers can be cleared by either clear0, clear1 or none.
        -- 2. output register can be cleared by either clear0, clear1  or none. 
        aclr0     : in std_logic := '0';   
        aclr1     : in std_logic := '0';     

        addressstall_a  : in std_logic := '0';
        addressstall_b  : in std_logic := '0';

        byteena_a : in std_logic_vector( (width_byteena_a) - 1 downto 0) := (others => 'Z'); 
                        -- Port A byte enable input
        byteena_b : in std_logic_vector( (width_byteena_b) - 1 downto 0) := (others => 'Z');   
                        -- Port B byte enable input

        -- OUTPUT PORT DECLARATION
        q_a       : out std_logic_vector(width_a - 1 downto 0); -- Port A output
        q_b       : out std_logic_vector(width_b - 1 downto 0)  -- Port B output
        );

-- TYPE DECLARATION

    type width_a_array is array (2 ** widthad_a - 1 downto 0) of std_logic_vector(width_a - 1 downto 0);
    type width_b_array is array (2 ** widthad_b - 1 downto 0) of std_logic_vector(width_b - 1 downto 0);


-- FUNCTION DEFINITION

    -- This procedure read the hex file into the memory content
    procedure read_my_memory (
            constant use_a : in boolean;
            variable mem_data_a : out width_a_array;
            variable mem_data_b : out width_b_array 
            ) is 

        variable m_mem_data_word_a : std_logic_vector(width_a-1 downto 0);
        variable m_mem_data_word_b : std_logic_vector(width_b-1 downto 0);
        variable i : integer := 0;
        variable n : integer := 0;
        variable m : integer := 0;
        variable m_num_of_bytes : integer := 0;
        variable m_line_no : integer := 0;
        variable m_line_buf : line ;
        variable m_err_check : boolean := true;
        variable m_base : string(2 downto 1);
        variable m_ibase : integer := 0;
        variable m_byte_str : string(2 downto 1);
        variable m_rec_type : string(2 downto 1);
        variable m_datain : string(2 downto 1);
        variable m_addr : string(2 downto 1);
        variable m_checksum : string(2 downto 1);
        variable m_startadd : string(4 downto 1);
        variable m_istartadd : integer := 0;
        variable m_byte_int : integer := 0;
        variable m_check_sum_vec : std_logic_vector(7 downto 0);
        variable m_check_sum_vec_tmp : std_logic_vector(7 downto 0);
        file m_mem_data_file : text;

        begin

        -- Initialize memory content
        if (use_a) then     
            for i in mem_data_a'low to mem_data_a'high loop
                mem_data_a(i) := (others => '0');
            end loop;
        else
            for i in mem_data_b'low to mem_data_b'high loop
                mem_data_b(i) := (others => '0');
            end loop;
        end if;

        file_open(m_mem_data_file, init_file, read_mode);

        while not endfile(m_mem_data_file) loop
            m_err_check := true;
            readline(m_mem_data_file, m_line_buf);
            m_line_no := m_line_no + 1;
            m_check_sum_vec := (others=> '0');

            if (m_line_buf(m_line_buf'low) = ':') then
                i := 1;
                SHRINK_LINE(m_line_buf, i);
                read(l=>m_line_buf, value=>m_byte_str, good=>m_err_check);

                if not (m_err_check) then
                    assert false
                    report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format!"
                    severity error;
                end if;

                m_byte_int := HEX_STR_TO_INT(m_byte_str);
--                m_check_sum_vec := unsigned(m_check_sum_vec) + unsigned(conv_std_logic_vector(m_byte_int, 8));
                m_check_sum_vec := m_check_sum_vec + m_byte_int;
                read(l=>m_line_buf, value=>m_startadd, good=>m_err_check);

                if not (m_err_check) then
                    assert false
                    report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format! "
                    severity error;
                end if;

                m_istartadd := HEX_STR_TO_INT(m_startadd);
                m_addr(2) := m_startadd(4);
                m_addr(1) := m_startadd(3);
--                m_check_sum_vec := unsigned(m_check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(m_addr), 8));
                m_check_sum_vec := m_check_sum_vec + HEX_STR_TO_INT(m_addr);
                m_addr(2) := m_startadd(2);
                m_addr(1) := m_startadd(1);
--                m_check_sum_vec := unsigned(m_check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(m_addr), 8));
                m_check_sum_vec := m_check_sum_vec + HEX_STR_TO_INT(m_addr);
                read(l=>m_line_buf, value=>m_rec_type, good=>m_err_check);

                if not (m_err_check) then
                    assert false
                    report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format! "
                    severity error;
                end if;

--                m_check_sum_vec := unsigned(m_check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(m_rec_type), 8));
                m_check_sum_vec := m_check_sum_vec + HEX_STR_TO_INT(m_rec_type);

            else
                assert false
                report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format! "
                severity error;
            end if;

            case m_rec_type is
                when "00"=>     -- Data record
                    i := 0;
                    if (use_a) then
                        m_num_of_bytes := (width_a + 7) / 8;
                    else
                        m_num_of_bytes := (width_b + 7) / 8;
                    end if;

                    while (i < m_byte_int) loop
                        n := (m_num_of_bytes - 1)*8;

                        if (use_a) then
                            m_mem_data_word_a := (others => '0');
                            m := width_a - 1;
                        else
                            m_mem_data_word_b := (others => '0');
                            m := width_b - 1;        
                        end if;

                        for j in 1 to m_num_of_bytes loop
                            read(l => m_line_buf, value => m_datain, good => m_err_check);
                            if not (m_err_check) then
                                assert false
                                report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format! "
                                severity error;
                            end if;

--                            m_check_sum_vec := unsigned(m_check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(m_datain), 8));
                            m_check_sum_vec := m_check_sum_vec + HEX_STR_TO_INT(m_datain);

                            if (use_a) then 
                                m_mem_data_word_a(m downto n) := 
                                      conv_std_logic_vector(HEX_STR_TO_INT(m_datain), m-n+1);
                            else                     
                                m_mem_data_word_b(m downto n) := 
                                      conv_std_logic_vector(HEX_STR_TO_INT(m_datain), m-n+1);
                            end if;

                            m := n - 1;
                            n := n - 8;
                        end loop;

                        i := i + m_num_of_bytes;

                        if (use_a) then
                            mem_data_a(m_ibase + m_istartadd) := m_mem_data_word_a;
                        else
                            mem_data_b(m_ibase + m_istartadd) := m_mem_data_word_b;
                        end if;

                        m_istartadd := m_istartadd + 1;
                    end loop;

                when "01"=>
                    exit;

                when "02"=>
                    m_ibase := 0;
                    if (m_byte_int /= 2) then
                        assert false
                        report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format for record type 02! "
                        severity error;
                    end if;

                    for i in 0 to (m_byte_int-1) loop
                        read(l=>m_line_buf, value=>m_base,good=>m_err_check);
                        m_ibase := m_ibase * 256 + HEX_STR_TO_INT(m_base);

                        if not (m_err_check) then
                            assert false
                            report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal Intel Hex Format! "
                            severity error;
                        end if;

--                        m_check_sum_vec := unsigned(m_check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(m_base), 8));
                        m_check_sum_vec := m_check_sum_vec + HEX_STR_TO_INT(m_base);
                    end loop;

                    m_ibase := m_ibase * 16;

                when others=>
                    assert false
                    report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Illegal record type in Intel Hex File! "
                    severity error;

            end case;

            read(l=>m_line_buf, value=>m_checksum, good=>m_err_check);

            if not (m_err_check) then
                assert false
                report"[Line "& INT_TO_STR_RAM(m_line_no) & "]:Checksum is missing! "
                severity error;
            end if;

--            m_check_sum_vec := unsigned(not (m_check_sum_vec)) + 1;
            m_check_sum_vec := (not (m_check_sum_vec)) + 1;
            m_check_sum_vec_tmp := conv_std_logic_vector(HEX_STR_TO_INT(m_checksum),8);

--            if (unsigned(m_check_sum_vec) /= unsigned(m_check_sum_vec_tmp)) then
            if ((m_check_sum_vec) /= (m_check_sum_vec_tmp)) then
                assert false
                report "[Line "& INT_TO_STR_RAM(m_line_no) & "]:Incorrect checksum!"
                severity error;
            end if;
        end loop;
            file_close(m_mem_data_file);
    end read_my_memory;
  
end altsyncram;

-- END OF ENTITY

-- BEGINNING OF ARCHITECTURE

architecture translated of altsyncram is

    function get_write_mode(read_during_write_mode_mixed_ports : string) return string is 
    begin
        if (read_during_write_mode_mixed_ports = "UNUSED") or 
           (read_during_write_mode_mixed_ports = "DONT_CARE") then
            return "DONT_CARE";
        end if;
        return read_during_write_mode_mixed_ports;
    end get_write_mode;


-- CONSTANT DECLARATION
   constant cread_during_write_mode_mixed_ports :  string  := get_write_mode(read_during_write_mode_mixed_ports);



-- SIGNAL DECLARATION

    signal i_data_reg_a             : std_logic_vector(width_a - 1 downto 0) := (others => '1');   
    signal i_data_reg_b             : std_logic_vector(width_b - 1 downto 0) := (others => '1');   

    signal i_q_reg_a                : std_logic_vector(width_a - 1 downto 0) := (others => '0');   
    signal i_q_tmp_a                : std_logic_vector(width_a - 1 downto 0) := (others => '0');   
    signal i_q_tmp2_a               : std_logic_vector(width_a - 1 downto 0) := (others => '0'); 
    signal i_q_tmp_wren_a           : std_logic_vector(width_a - 1 downto 0) := (others => '0');
    signal i_q_tmp2_wren_a          : std_logic_vector(width_a - 1 downto 0) := (others => '0');
    signal i_q_tmp_wren_b           : std_logic_vector(width_b - 1 downto 0) := (others => '0');
    signal i_q_reg_b                : std_logic_vector(width_b - 1 downto 0) := (others => '0');   
    signal i_q_tmp_b                : std_logic_vector(width_b - 1 downto 0) := (others => '0');   
    signal i_q_tmp2_b               : std_logic_vector(width_b - 1 downto 0) := (others => '0');

    signal i_byteena_mask_reg_a     : std_logic_vector(width_a - 1 downto 0) := (others => '1');   
    signal i_byteena_mask_reg_b     : std_logic_vector(width_b - 1 downto 0) := (others => '1');   

    signal i_address_reg_a          : std_logic_vector(widthad_a - 1 downto 0) := (others => '0');   
    signal i_address_reg_b          : std_logic_vector(widthad_b - 1 downto 0) := (others => '0');   




    signal i_wren_reg_a             : std_logic:= '0';   
    signal i_wren_reg_b             : std_logic:= '0';   
    signal i_rden_reg_b             : std_logic:= '1';
    signal i_read_flag_a            : std_logic:= '0';
    signal i_read_flag_b            : std_logic:= '0';   
    signal i_write_flag_a           : std_logic:= '0';   
    signal i_write_flag_b           : std_logic:= '0';
    signal i_nmram_write_a          : std_logic:= '0';
    signal i_nmram_write_b          : std_logic:= '0';

    signal i_indata_aclr_a          : std_logic:= '0';   
    signal i_address_aclr_a         : std_logic:= '0';   
    signal i_wrcontrol_aclr_a       : std_logic:= '0';   
    signal i_indata_aclr_b          : std_logic:= '0';   
    signal i_address_aclr_b         : std_logic:= '0';   
    signal i_wrcontrol_aclr_b       : std_logic:= '0';   
    signal i_outdata_aclr_a         : std_logic:= '0';   
    signal i_rdcontrol_aclr_b       : std_logic:= '0';   
    signal i_byteena_aclr_a         : std_logic:= '0';   
    signal i_byteena_aclr_b         : std_logic:= '0';   

    signal write_by_a_reg_b         : integer := 0;   
    signal write_by_b_reg_a         : integer := 0;   
    signal good_to_go_a             : std_logic:= '0';   
    signal good_to_go_b             : std_logic:= '0';   

    signal i_indata_clken_b         : std_logic:= '0';   
    signal i_outdata_clken_b        : std_logic:= '0';   
    signal i_outdata_clken_a        : std_logic:= '0';   
    signal i_wrcontrol_wraddress_clken_b   : std_logic:= '0';   
    signal i_rdcontrol_clken_b      : std_logic:= '0';   
    signal i_address_clken_b        : std_logic:= '0';   


    signal byteena_a_unconnected    : std_logic:= '0';   
    signal byteena_b_unconnected    : std_logic:= '0';   

    signal need_init                : boolean := true;
    signal default_val              : std_logic := '0';

    signal i_numwords_a              : integer := numwords_a;
    signal i_numwords_b              : integer := numwords_b;

    signal i_data_zero_a : std_logic_vector (width_a - 1 downto 0) := (others => '0');
    signal i_data_zero_b : std_logic_vector (width_b - 1 downto 0) := (others => '0');
    signal i_data_ones_a : std_logic_vector (width_a - 1 downto 0) := (others => '1');
    signal i_data_ones_b : std_logic_vector (width_b - 1 downto 0) := (others => '1');

begin

            
    -- Parameter Checking
    process 
    begin
        if ((operation_mode /= "BIDIR_DUAL_PORT") and (operation_mode /= "SINGLE_PORT") and 
            (operation_mode /= "DUAL_PORT") and (operation_mode /= "ROM")) then
            assert false
            report "Error: Not a valid operation mode."
            severity error;
        end if;

        if ((ram_block_type /= "M4K") and (ram_block_type /= "M512") and 
            (ram_block_type /= "LARGE") and (ram_block_type /= "MEGARAM") and
            (ram_block_type /= "M-RAM") and (ram_block_type /= "AUTO")) then
            assert false
            report "Error: RAM_BLOCK_TYPE HAS AN INVALID VALUE. IT CAN ONLY BE M512, M4K, M-RAM OR AUTO"
            severity error;
        end if;        

        if ((cread_during_write_mode_mixed_ports /= "DONT_CARE") and 
            (cread_during_write_mode_mixed_ports /= "OLD_DATA")) then
            assert false
            report "Error: INVALID VALUE FOR READ_DURING_WRITE_MODE_MIXED_PORTS PARAMETER. IT HAS TO BE OLD_DATA OR DONT_CARE"
            severity error;
        end if;		

        if (((ram_block_type = "M-RAM") or (ram_block_type = "MEGARAM")) and 
            (init_file /= "UNUSED")) then
            assert false
            report "Error: M-RAM block type doesn't support the use of an initialization file"
            severity error;
        end if;

        if ((byte_size /= 8) and (byte_size /= 9) and 
            (not IS_FAMILY_STRATIXII(intended_device_family))) then
            assert false
            report "Error: BYTE SIZE HAS TO BE EITHER 8 or 9"
            severity error;
        end if;

        if ((byte_size /= 8) and (byte_size /= 9) and (byte_size /= 1) and
            (byte_size /= 2) and (byte_size /= 4) and 
            (IS_FAMILY_STRATIXII(intended_device_family))) then
             assert false
            report "Error: BYTE SIZE HAS TO BE EITHER 1, 2, 4, 8 or 9"
            severity error;
        end if;

        if (width_a <= 0) then
            assert false
            report "Error: Invalid value for WIDTH_A parameter"
            severity error;
        end if;

        if ((width_b <= 0) and
            ((operation_mode /= "SINGLE_PORT") or (operation_mode /= "ROM"))) then
            assert false
            report "Error: Invalid value for WIDTH_B parameter"
            severity error;
        end if;

        if (widthad_a <= 0) then
            assert false
            report "Error: Invalid value for WIDTHAD_A parameter"
            severity error;
        end if;

        if ((width_b <= 0) and
            ((operation_mode /= "SINGLE_PORT") or (operation_mode /= "ROM"))) then
            assert false
            report "Error: Invalid value for WIDTHAD_B parameter"
            severity error;
        end if;

        if ((operation_mode = "ROM") and 
            ((ram_block_type = "M-RAM") or (ram_block_type = "MEGARAM"))) then
            assert false
            report "Error: ROM mode does not support ram_block_type = M-RAM"
            severity error;
        end if;

        if (((wrcontrol_aclr_a /= "NONE") and (wrcontrol_aclr_a /= "UNUSED")) and (ram_block_type = "M512") and (operation_mode = "SINGLE_PORT")) then
            assert false
            report "Error: Wren_a cannot have clear in single port mode for M512 block"
            severity error;
        end if;

        if ((operation_mode = "DUAL_PORT") and (i_numwords_a * width_a /= i_numwords_b * width_b)) then
            assert false
            report "Error: Total number of bits of port A and port B should be the same for dual port mode"
            severity error;
        end if;

        if (((rdcontrol_aclr_b /= "NONE") and (rdcontrol_aclr_b /= "UNUSED")) and (ram_block_type = "M512") and (operation_mode = "DUAL_PORT")) then
            assert false
            report "Error: rden_b cannot have clear in simple dual port mode for M512 block"
            severity error;
        end if;

        if ((operation_mode = "BIDIR_DUAL_PORT") and (i_numwords_a * width_a /= i_numwords_b * width_b)) then
            assert false
            report "Error: Total number of bits of port A and port B should be the same for bidir dual port mode"
            severity error;
        end if;

        if ((operation_mode = "BIDIR_DUAL_PORT") and (ram_block_type = "M512")) then
            assert false
            report "Error: M512 block type doesn't support bidir dual mode"
            severity error;
        end if;

        if (((ram_block_type = "M-RAM") or (ram_block_type = "MEGARAM")) and 
            (cread_during_write_mode_mixed_ports = "OLD_DATA")) then
            assert false
            report "Error: M-RAM doesn't support OLD_DATA value for READ_DURING_WRITE_MODE_MIXED_PORTS parameter"
            severity error;
        end if;		

        if ((not IS_FAMILY_STRATIXII(intended_device_family)) and 
            (clock_enable_input_a = "BYPASS")) then
            assert false
            report "Error: Non Stratix II family does not support BYPASS value for CLOCK_ENABLE_INPUT_A"
            severity error;
        end if;
        if ((not IS_FAMILY_STRATIXII(intended_device_family)) and 
            (clock_enable_output_a = "BYPASS")) then
            assert false
            report "Error: Non Stratix II family does not support BYPASS value for CLOCK_ENABLE_OUTPUT_A"
            severity error;
        end if;
        if ((not IS_FAMILY_STRATIXII(intended_device_family)) and 
            (clock_enable_input_b = "BYPASS")) then
            assert false
            report "Error: Non Stratix II family does not support BYPASS value for CLOCK_ENABLE_INPUT_B"
            severity error;
        end if;

        if ((not IS_FAMILY_STRATIXII(intended_device_family)) and 
            (clock_enable_output_b = "BYPASS")) then
            assert false
            report "Error: Non Stratix II family does not support BYPASS value for CLOCK_ENABLE_OUTPUT_B"
            severity error;
        end if;

        wait;

    end process;
    
    
-- SIGNAL ASSIGNMENTS

    -- Checking ram_block_type and setting default_val
    IFG01: if ((((ram_block_type = "AUTO") and 
                (cread_during_write_mode_mixed_ports = "DONT_CARE")) or
               (ram_block_type = "MEGARAM") or
               (ram_block_type = "M-RAM")) and
               (operation_mode /= "ROM")) generate
        default_val <= 'X';
    end generate IFG01;
    
    IFG02: if (((ram_block_type /= "AUTO") or 
                (cread_during_write_mode_mixed_ports /= "DONT_CARE")) and 
               (ram_block_type /= "MEGARAM") and
               (ram_block_type /= "M-RAM")) generate
        default_val <= '0';
    end generate IFG02;


    -- Assigning the correct clock enable signals based on the input clock

    -- for data in b
    IFG05: if ((indata_reg_b = "CLOCK0") and (clock_enable_input_b = "NORMAL")) generate
        i_indata_clken_b <= clocken0;
    end generate IFG05;
    IFG05a: if (clock_enable_input_b = "BYPASS") generate
        i_indata_clken_b <= '1';
    end generate IFG05a;
    IFG06: if ((indata_reg_b = "CLOCK1") and (clock_enable_input_b = "NORMAL")) generate
        i_indata_clken_b <= clocken1;
    end generate IFG06;

    IFG07: if ((indata_reg_b /= "CLOCK0") and (indata_reg_b /= "CLOCK1") and
               (clock_enable_input_b = "NORMAL")) generate
        i_indata_clken_b <= '0';
    end generate IFG07;

    -- for wren b and address b in bidir_dual_port mode
    IFG08: if ((wrcontrol_wraddress_reg_b = "CLOCK0") and (clock_enable_input_b = "NORMAL")) generate
        i_wrcontrol_wraddress_clken_b <= clocken0;
    end generate IFG08;
    IFG08a: if (clock_enable_input_b = "BYPASS") generate
        i_wrcontrol_wraddress_clken_b <= '1';
    end generate IFG08a;
    IFG09: if ((wrcontrol_wraddress_reg_b = "CLOCK1") and (clock_enable_input_b = "NORMAL")) generate
        i_wrcontrol_wraddress_clken_b <= clocken1;
    end generate IFG09;

    IFG10: if ((wrcontrol_wraddress_reg_b /= "CLOCK0") and 
               (wrcontrol_wraddress_reg_b /= "CLOCK1") and 
               (clock_enable_input_b = "NORMAL")) generate
        i_wrcontrol_wraddress_clken_b <= '0';
    end generate IFG10;

    -- for rden b
    IFG11: if ((rdcontrol_reg_b = "CLOCK0") and (clock_enable_input_b = "NORMAL")) generate
        i_rdcontrol_clken_b <= clocken0;
    end generate IFG11;
    IFG11a: if (clock_enable_input_b = "BYPASS") generate
        i_rdcontrol_clken_b <= '1';
    end generate IFG11a;
    IFG12: if ((rdcontrol_reg_b = "CLOCK1") and (clock_enable_input_b = "NORMAL")) generate
        i_rdcontrol_clken_b <= clocken1;
    end generate IFG12;



 
    IFG13: if ((rdcontrol_reg_b /= "CLOCK0") and 
               (rdcontrol_reg_b /= "CLOCK1") and 
               (clock_enable_input_b = "NORMAL")) generate
        i_rdcontrol_clken_b <= '0';
    end generate IFG13;

    -- for address b for dual_port mode
    IFG14: if ((address_reg_b = "CLOCK0") and (clock_enable_input_b = "NORMAL")) generate
        i_address_clken_b <= clocken0;
    end generate IFG14;
    IFG14a: if (clock_enable_input_b = "BYPASS") generate
        i_address_clken_b <= '1';
    end generate IFG14a;
    IFG15: if ((address_reg_b = "CLOCK1") and (clock_enable_input_b = "NORMAL")) generate
        i_address_clken_b <= clocken1;
    end generate IFG15;

    IFG16: if ((address_reg_b /= "CLOCK0") and (address_reg_b /= "CLOCK1") and
               (clock_enable_input_b = "NORMAL")) generate
        i_address_clken_b <= '0';
    end generate IFG16;

    -- for data out b
    IFG17: if ((outdata_reg_b = "CLOCK0") and (clock_enable_output_b = "NORMAL")) generate 
        i_outdata_clken_b <= clocken0;
    end generate IFG17;
    IFG17a: if  (clock_enable_output_b = "BYPASS") generate 
        i_outdata_clken_b <= '1';
    end generate IFG17a;
    IFG18 : if ((outdata_reg_b = "CLOCK1") and (clock_enable_output_b = "NORMAL")) generate 
        i_outdata_clken_b <= clocken1;
    end generate IFG18;
 
    IFG19 : if ((outdata_reg_b /= "CLOCK0") and 
                (outdata_reg_b /= "CLOCK1") and 
                (clock_enable_output_b = "NORMAL")) generate 
        i_outdata_clken_b <= '0';
    end generate IFG19;


    -- for data out a
    IFG171: if ((outdata_reg_a = "CLOCK0") and (clock_enable_output_a = "NORMAL")) generate 
        i_outdata_clken_a <= clocken0;
    end generate IFG171;
    IFG172: if  (clock_enable_output_a = "BYPASS") generate 
        i_outdata_clken_a <= '1';
    end generate IFG172;
    IFG173 : if ((outdata_reg_a = "CLOCK1") and (clock_enable_output_a = "NORMAL")) generate 
        i_outdata_clken_a <= clocken1;
    end generate IFG173;
 
    IFG174 : if ((outdata_reg_a /= "CLOCK0") and 
                (outdata_reg_a /= "CLOCK1") and 
                (clock_enable_output_a = "NORMAL")) generate 
        i_outdata_clken_a <= '0';
    end generate IFG174;



    -- Assigning the correct clear signals

    -- for data in a
    IFG20: if (indata_aclr_a = "CLEAR0") generate
        i_indata_aclr_a <= aclr0;
    end generate IFG20;
    IFG21: if (indata_aclr_a /= "CLEAR0") generate
        i_indata_aclr_a <= '0';
    end generate IFG21;

    -- for address a
    IFG22: if (address_aclr_a = "CLEAR0") generate
        i_address_aclr_a <= aclr0;
    end generate IFG22;
    IFG23: if (address_aclr_a /= "CLEAR0") generate
        i_address_aclr_a <= '0';
    end generate IFG23;

    -- for wren a
    IFG24: if (wrcontrol_aclr_a = "CLEAR0") generate
        i_wrcontrol_aclr_a <= aclr0;
    end generate IFG24;
    IFG25: if (wrcontrol_aclr_a /= "CLEAR0") generate
        i_wrcontrol_aclr_a <= '0';
    end generate IFG25;

    -- for byteena a
    IFG26: if (byteena_aclr_a = "CLEAR0") generate
        i_byteena_aclr_a <= aclr0;
    end generate IFG26;
    IFG27: if (byteena_aclr_a = "CLEAR1") generate
        i_byteena_aclr_a <= aclr1;
    end generate IFG27;
    IFG28: if ((byteena_aclr_a /= "CLEAR0") and (byteena_aclr_a /= "CLEAR1")) generate
        i_byteena_aclr_a <= '0';
    end generate IFG28;

    -- for data out a
    IFG29: if (outdata_aclr_a = "CLEAR0") generate
        i_outdata_aclr_a <= aclr0;
    end generate IFG29;
    IFG30: if (outdata_aclr_a = "CLEAR1") generate
        i_outdata_aclr_a <= aclr1;
    end generate IFG30;
    IFG31: if ((outdata_aclr_a /= "CLEAR0") and (outdata_aclr_a /= "CLEAR1")) generate
        i_outdata_aclr_a <= '0';
    end generate IFG31;

    -- for data in b
    IFG32: if (indata_aclr_b = "CLEAR0") generate
        i_indata_aclr_b <= aclr0;
    end generate IFG32;
    IFG33: if (indata_aclr_b = "CLEAR1") generate
        i_indata_aclr_b <= aclr1;
    end generate IFG33;
    IFG34: if ((indata_aclr_b /= "CLEAR0") and (indata_aclr_b /= "CLEAR1")) generate
        i_indata_aclr_b <= '0';
    end generate IFG34;

    -- for address b
    IFG35: if (address_aclr_b = "CLEAR0") generate
        i_address_aclr_b <= aclr0;
    end generate IFG35;
    IFG36: if (address_aclr_b = "CLEAR1") generate
        i_address_aclr_b <= aclr1;
    end generate IFG36;
    IFG37: if ((address_aclr_b /= "CLEAR0") and (address_aclr_b /= "CLEAR1")) generate
        i_address_aclr_b <= '0';
    end generate IFG37;

    -- for wren b
    IFG38:if (wrcontrol_aclr_b = "CLEAR0") generate
        i_wrcontrol_aclr_b <= aclr0;
    end generate IFG38;
    IFG39: if (wrcontrol_aclr_b = "CLEAR1") generate
        i_wrcontrol_aclr_b <= aclr1;
    end generate IFG39;
    IFG40: if ((wrcontrol_aclr_b /= "CLEAR0") and (wrcontrol_aclr_b /= "CLEAR1")) generate
        i_wrcontrol_aclr_b <= '0';
    end generate IFG40;

    -- for rden b
    IFG41: if (rdcontrol_aclr_b = "CLEAR0") generate
        i_rdcontrol_aclr_b <= aclr0;
    end generate IFG41;
    IFG42: if (rdcontrol_aclr_b = "CLEAR1") generate
        i_rdcontrol_aclr_b <= aclr1;
    end generate IFG42;
    IFG43: if ((rdcontrol_aclr_b /= "CLEAR0") and (rdcontrol_aclr_b /= "CLEAR1")) generate
        i_rdcontrol_aclr_b <= '0';
    end generate IFG43;

    -- for byteena b
    IFG44: if (byteena_aclr_b = "CLEAR0") generate
        i_byteena_aclr_b <= aclr0;
    end generate IFG44;
    IFG45: if (byteena_aclr_b = "CLEAR1") generate
        i_byteena_aclr_b <= aclr1;
    end generate IFG45;
    IFG46: if ((byteena_aclr_b /= "CLEAR0") and (byteena_aclr_b /= "CLEAR1")) generate
        i_byteena_aclr_b <= '0';
    end generate IFG46;


    -- These processes check for byteena connectivity
    process(byteena_a)
        variable m_byteena_a_unconnected : std_logic := '0';
        begin

            if (byteena_a(0) = 'Z') then
                m_byteena_a_unconnected := '1';
            end if;

            byteena_a_unconnected <= m_byteena_a_unconnected;
          end process;

    process(byteena_b)
        variable m_byteena_b_unconnected : std_logic := '0';
        begin

            if (byteena_b(0) = 'Z') then
                m_byteena_b_unconnected := '1';
            end if;

            byteena_b_unconnected <= m_byteena_b_unconnected;
        end process;





    -- This process initializes and updates the memory content in the RAM accordingly
    process (i_read_flag_a, i_write_flag_a,
             i_read_flag_b, i_write_flag_b)

        variable j : integer := 0;
        variable m_mem_data_a : width_a_array;
        variable m_mem_data_b : width_b_array;
        variable m_temp_wa : std_logic_vector(width_a - 1 downto 0);
        variable m_temp_wa2 : std_logic_vector(width_a - 1 downto 0) := (others => 'U');
        variable m_temp_wb : std_logic_vector(width_b - 1 downto 0);
        variable m_temp_wb2 : std_logic;
        variable m_init_file_b_port : boolean := false;

        variable m_address_a : integer := 0;
        variable m_address_b : integer := 0;
        variable m_q_tmp2_a : std_logic_vector(width_a - 1 downto 0);
        variable write_by_a      : integer := 0;
        variable prev_write_by_a : integer := 0;

        variable write_by_b      : integer := 0;
        variable prev_write_by_b : integer := 0;

        variable ctime : time := 0 ps;
        variable reread_a        : boolean := false;
        variable reread_b        : boolean := false;
        variable last_read_a_event : boolean := false;
        variable last_read_b_event : boolean := false;

    begin
        if (need_init) then
        -- Begin of initializations

            if (init_file = "UNUSED" or init_file = "") then 
            -- No memory file used
                if (operation_mode /= "ROM") then
                    for i in 0 to (2**widthad_a - 1) loop
                        if (((ram_block_type = "AUTO") and 
                             (cread_during_write_mode_mixed_ports = "DONT_CARE")) or
                             IS_FAMILY_STRATIXHC(intended_device_family) or
                            (ram_block_type = "MEGARAM") or
                            (ram_block_type = "M-RAM")) then
                             m_mem_data_a(i) := (others => 'X');    
                        else
                            m_mem_data_a(i) := (others => '0'); 
                        end if;
                    end loop;

                    for i in 0 to (2**widthad_b - 1) loop
                        m_mem_data_b(i) := (others => 'X');    
                    end loop;
                end if;
            else
            -- Using memory file to initialize memory content
                if (((ram_block_type = "AUTO") and 
                     (cread_during_write_mode_mixed_ports = "DONT_CARE")) or
                     (IS_FAMILY_STRATIXHC(intended_device_family) and
                      operation_mode /= "ROM") or
                    (ram_block_type = "MEGARAM") or
                    (ram_block_type = "M-RAM")) then
                     for i in 0 to (2 ** widthad_a - 1) loop
                         m_mem_data_a(i) := (others => 'X');
                     end loop;
                else
                     for i in 0 to (2 ** widthad_a - 1) loop
                         m_mem_data_a(i) := (others => '0');
                     end loop;
                end if;

                m_init_file_b_port := false;
                if (init_file_layout = "UNUSED") then
                    if (operation_mode = "DUAL_PORT") then
                        m_init_file_b_port := true;
                    else
                        m_init_file_b_port := false;
                    end if;
                else
                    if (init_file_layout = "PORT_A") then
                        m_init_file_b_port := false;
                    elsif (init_file_layout = "PORT_B") then
                        m_init_file_b_port := true;
                    end if;
                end if;

                if (m_init_file_b_port) then
                    read_my_memory (false, m_mem_data_a, m_mem_data_b);

                    for i in 0 to (i_numwords_b * width_b - 1) loop
                        m_temp_wb := m_mem_data_b(i / width_b);
                        m_temp_wb2 := m_temp_wb((i)mod width_b);
                        m_temp_wa := m_mem_data_a(i / width_a);
                        m_temp_wa(i mod width_a) := m_temp_wb2;
                        m_mem_data_a(i / width_a) := m_temp_wa;
                    end loop;
                else
                    read_my_memory (true, m_mem_data_a, m_mem_data_b);
                end if;
            end if;

            need_init <= FALSE;
        -- End of initializations


        else
        
        -- Write/update memory content
        
            if (i_write_flag_a'event) then
                if ((operation_mode = "DUAL_PORT") or 
                    (operation_mode = "SINGLE_PORT") or 
                    (operation_mode = "BIDIR_DUAL_PORT")) then
                    if (i_wren_reg_a = '1') then
                        if ((i_address_aclr_a = '1') and 
--                            (conv_integer(unsigned(i_address_reg_a)) /= 0)) then
                            (conv_integer((i_address_reg_a)) /= 0)) then
                            for i in 0 to (i_numwords_a - 1) loop
                                m_mem_data_a(i) := (others => 'X');
                            end loop;
                        elsif (((i_indata_aclr_a = '1') and (i_data_reg_a /= i_data_zero_a)) or 
                               ((i_byteena_aclr_a = '1') and (i_byteena_mask_reg_a /= i_data_ones_a)) or
                               ((i_wrcontrol_aclr_a = '1') and (i_wren_reg_a /= '0'))) then
--                            m_mem_data_a (conv_integer(unsigned(i_address_reg_a))) := (others => 'X');
                            m_mem_data_a (conv_integer((i_address_reg_a))) := (others => 'X');
                        else
--                            m_mem_data_a (conv_integer(unsigned(i_address_reg_a))) := 
                            m_mem_data_a (conv_integer((i_address_reg_a))) := 
                                (i_data_reg_a and i_byteena_mask_reg_a) or
--                                (m_mem_data_a(conv_integer(unsigned(i_address_reg_a))) 
                                (m_mem_data_a(conv_integer((i_address_reg_a))) 
                                 and not i_byteena_mask_reg_a);

                            write_by_a := write_by_a + 1;    
                        end if;
                    end if;
                end if;
            end if;

            if (i_write_flag_b'event) then
                if (operation_mode = "BIDIR_DUAL_PORT") then
                    if (i_wren_reg_b = '1') then
                        if ((i_wrcontrol_aclr_b = '1') and 
--                            (conv_integer(unsigned(i_address_reg_b)) /= 0)) then
                            (conv_integer((i_address_reg_b)) /= 0)) then

                            for i in 0 to (i_numwords_a - 1) loop
                                m_mem_data_a(i) := (others => 'X');
                            end loop;

                        elsif (((i_byteena_aclr_b = '1') and (i_byteena_mask_reg_b /= i_data_ones_b)) or 
                               ((i_indata_aclr_b = '1') and (i_data_reg_b /= i_data_zero_b)) or
                               ((i_wrcontrol_aclr_b = '1') and (i_wren_reg_b /= '0'))) then
--                            j := conv_integer(unsigned(i_address_reg_b)) * width_b;    
                            j := conv_integer((i_address_reg_b)) * width_b;    

                            for i in 0 to (width_b - 1) loop
                                m_temp_wa2 := m_mem_data_a((j + i) / width_a);
                                m_temp_wa2((j + i) mod width_a) := 'X';
                                m_mem_data_a((j + i) / width_a) := m_temp_wa2;    
                            end loop;
                            
                        else
--                            j := (conv_integer(unsigned(i_address_reg_b)) * width_b); 
                            j := (conv_integer((i_address_reg_b)) * width_b); 
   
                            for i in 0 to (width_b - 1) loop
                                m_temp_wa2 := m_mem_data_a((j + i) / width_a);
                                m_temp_wa2((j + i) mod width_a) :=
                                    ((i_data_reg_b(i) and i_byteena_mask_reg_b(i)) or
                                     (m_temp_wa2((j + i) mod width_a) and
                                      not i_byteena_mask_reg_b(i)));    
                                m_mem_data_a((j + i) / width_a) := m_temp_wa2;    
                            end loop;

                            write_by_b := write_by_b + 1;    
                        end if;
                    end if;
                end if; 
            end if; 
        end if;



        -- To ensure that the model will reread port if two event (read & write) event triggered 
        -- at the different time quantum
        reread_a := false;
        reread_b := false;
        if (ctime /= 0 ps) and (ctime = now) and
           ((i_write_flag_a'event) or 
            (i_write_flag_b'event)) then 
            if last_read_a_event then
                reread_a := true;
                assert false
                report "Reread the port A"
                severity note;
            end if;
            if last_read_b_event then
                reread_b := true;
                assert false
                report "Reread the port B"
                severity note;
            end if;

        end if;


        last_read_a_event := i_read_flag_a'event;
        last_read_b_event := i_read_flag_b'event;
        ctime := now;


        -- Port A reading
        if (i_read_flag_a'event) or (reread_a) then
            if (write_by_a /= prev_write_by_a) then
                prev_write_by_a :=  write_by_a;
            end if;

            if ((operation_mode = "BIDIR_DUAL_PORT") or 
                (operation_mode = "SINGLE_PORT") or 
                (operation_mode = "ROM")) then

--                m_address_a := conv_integer(unsigned(i_address_reg_a));
                m_address_a := conv_integer((i_address_reg_a));
                m_q_tmp2_a := m_mem_data_a(m_address_a);

                -- This is to output an "X" when the other ports is writing into the same location
                -- when read_during_write_mode_mixed_ports = "DONT_CARE"
                if (operation_mode = "BIDIR_DUAL_PORT") then
                    if ((ram_block_type = "MEGARAM") or (ram_block_type = "M-RAM") or 
                        ((cread_during_write_mode_mixed_ports = "DONT_CARE") and 
                         (ram_block_type = "AUTO"))) then

                        if (wrcontrol_wraddress_reg_b = "CLOCK0") then
                            if ((i_wren_reg_b = '1') and (i_wren_reg_a = '0')) then

--                                m_address_b := conv_integer(unsigned(i_address_reg_b));
                                m_address_b := conv_integer((i_address_reg_b));

                                if ((((m_address_a * width_a) > (m_address_b * width_b)) and
                                     ((m_address_a * width_a) < ((m_address_b  * width_b) + width_b - 1))) or
                                     ((((m_address_a * width_a) + width_a - 1) > (m_address_b * width_b)) and
                                     (((m_address_a * width_a) + width_a - 1) < ((m_address_b * width_b) + width_b - 1)))) then

                                     for i in (m_address_a * width_a) to ((m_address_a * width_a) + width_a - 1) loop
                                         if ((i > (m_address_b * width_b)) and (i < ((m_address_b * width_b) + width_b - 1))) then

                                             j := i - (m_address_a * width_a);
                                             m_q_tmp2_a(j) := 'X';
                                         end if;
                                     end loop;
                                end if;
                           end if;
                        end if;
                    end if;
                end if;
            end if;

            i_q_tmp2_a <= m_q_tmp2_a;
        end if; 

        -- Port B reading
        if (i_read_flag_b'event) or (reread_b) then

            if (write_by_b /= prev_write_by_b) then
                prev_write_by_b :=  write_by_b;
            end if; 

            if ((operation_mode = "DUAL_PORT") or (operation_mode = "BIDIR_DUAL_PORT")) then
                if (i_rden_reg_b = '1') then
--                    m_address_a := conv_integer(unsigned(i_address_reg_a));
                    m_address_a := conv_integer((i_address_reg_a));
--                    m_address_b := conv_integer(unsigned(i_address_reg_b));
                    m_address_b := conv_integer((i_address_reg_b));
                    j := m_address_b * width_b;    

                    for i in 0 to (width_b - 1) loop
                        m_temp_wa2 := m_mem_data_a((j + i) / width_a); 
                        m_temp_wb(i) := m_temp_wa2((j + i) mod width_a);
    
                        if ((ram_block_type = "MEGARAM") or (ram_block_type = "M-RAM") or
                             ((cread_during_write_mode_mixed_ports = "DONT_CARE") and 
                              (ram_block_type = "AUTO"))) then
                            if ((rdcontrol_reg_b = "CLOCK0") or (wrcontrol_wraddress_reg_b = "CLOCK0")) then
                                if ((i_wren_reg_a = '1') and (i_wren_reg_b = '0')) then
                                    if (((j + i) / width_a) = m_address_a) then

                                        m_temp_wb(i) := 'X';
                                    end if;
                                end if;
                            end if;
                        end if;
                    end loop;

                    i_q_tmp2_b <= m_temp_wb;    
                end if;
            end if;
        end if;

    end process;


    -- Port A inputs registered : indata, address, byeteena, wren
    process (clock0)
        variable m_byteena_mask_reg_a : std_logic_vector(width_a - 1 downto 0);
        variable m_indata_reg_aclr_a   : std_logic := '0';
        variable m_wren_reg_aclr_a    : std_logic := '0';
        variable m_byteena_reg_aclr_a : std_logic := '0';
        variable m_address_reg_aclr_a : std_logic := '0';
    begin


        if (clock0'event and (clock0 = '1')) then
            if (clocken0 = '1') or (clock_enable_input_a = "BYPASS") then

                if (i_indata_aclr_a = '1') then
                     i_data_reg_a <= (others => '0');    
                else
                    i_data_reg_a <= data_a;    
                end if;

                if (i_wrcontrol_aclr_a = '1') then
                    i_wren_reg_a <= '0';    
                else
                    i_wren_reg_a <= wren_a;
                end if;

                if (byteena_a_unconnected = '1') then
                    m_byteena_mask_reg_a := (others => '1');    
                else
                    if (i_byteena_aclr_a = '1') then
                        m_byteena_mask_reg_a := (others => '1');    
                    else

                        for k in 0 to (width_a - 1) loop
                            if (width_byteena_a = 1) then
                                m_byteena_mask_reg_a(k) := byteena_a(0);
                            else
                                m_byteena_mask_reg_a(k) := byteena_a(k / byte_size);    
                            end if;
                        end loop;

                    end if;
                end if;

                i_byteena_mask_reg_a <= m_byteena_mask_reg_a;

                if (i_address_aclr_a = '1') then
                    i_address_reg_a <= (others => '0');    
                elsif (addressstall_a /= '1') then
                    i_address_reg_a <= address_a;
                end if;

                good_to_go_a <= '1';
                write_by_b_reg_a <= write_by_b_reg_a + 1;
                i_read_flag_a <= not i_read_flag_a;

                if ((ram_block_type = "M-RAM") or (ram_block_type = "MEGARAM")) then
                    i_write_flag_a <= not i_write_flag_a;
                end if;

                if (operation_mode /= "ROM") then
                    i_nmram_write_a <= '1';
                end if;
            else
                if (operation_mode /= "ROM") then
                    i_nmram_write_a <= '0';
                end if;
            end if;
        end if;

        if (clock0'event and (clock0 = '0')) then

            if ((ram_block_type /= "M-RAM") and (ram_block_type /= "MEGARAM")) then

                if (i_nmram_write_a = '1') then
                    i_write_flag_a <= not i_write_flag_a;
                end if;
            end if;

        end if;

    end process;


    -- Port B indata input registered
    IFG47: if ((indata_reg_b = "CLOCK0") or (indata_reg_b = "CLOCK1")) generate
        process (clock0, clock1)
        begin
            if ((clock0'event and (clock0 = '1') and (indata_reg_b = "CLOCK0")) or
                (clock1'event and (clock1 = '1') and (indata_reg_b = "CLOCK1"))) then
                if (i_indata_clken_b = '1') then
                    if (i_indata_aclr_b = '1') then
                        i_data_reg_b <= (others => '0');    
                    else
                        i_data_reg_b <= data_b;  
                    end if;  
                end if;
            end if;
        end process;
    end generate IFG47;

    -- Port B address input registered (for dual_port mode)
    IFG48: if (((address_reg_b = "CLOCK0") or (address_reg_b = "CLOCK1")) and
               (operation_mode = "DUAL_PORT")) generate
        process (clock0, clock1)
        begin
            if ((clock0'event and (clock0 = '1')) and (address_reg_b = "CLOCK0")) or
                (clock1'event and (clock1 = '1') and (address_reg_b = "CLOCK1")) then
                if (i_address_clken_b = '1') then

                    i_read_flag_b <= not i_read_flag_b;

                    if (i_address_aclr_b = '1') then
                        i_address_reg_b <= (others => '0');    
                    elsif (addressstall_b /= '1') then
                        i_address_reg_b <= address_b;
                    end if;

                end if;
            end if;
        end process;
    end generate IFG48;

    IFG48a: if ((operation_mode = "DUAL_PORT") or 
                (operation_mode = "BIDIR_DUAL_PORT")) generate
        process (clock0, clock1)
        begin
            if ((clock0'event and (clock0 = '1')) and (address_reg_b = "CLOCK0")) or
                (clock1'event and (clock1 = '1') and (address_reg_b = "CLOCK1")) then
                if (i_address_clken_b = '1') then
                    good_to_go_b     <= '1';
                    write_by_a_reg_b <= write_by_a_reg_b + 1;
                end if;
            end if;
        end process;
    end generate IFG48a;
    


    -- Port B inputs registered : wren, address, byteena (for bidir_dual_port mode)
    IFG49: if (((wrcontrol_wraddress_reg_b = "CLOCK0") or 
                (wrcontrol_wraddress_reg_b = "CLOCK1")) and
               (operation_mode = "BIDIR_DUAL_PORT")) generate
        process (clock0, clock1)
            variable m_byteena_mask_reg_b  : std_logic_vector(width_b - 1 downto 0);
        begin

            if (((wrcontrol_wraddress_reg_b = "CLOCK0") and 
                 clock0'event and (clock0 = '1')) or
                ((wrcontrol_wraddress_reg_b = "CLOCK1") and 
                 clock1'event and (clock1 = '1'))) then
                if (i_wrcontrol_wraddress_clken_b = '1') then
                    i_read_flag_b <= not i_read_flag_b;

                    if (i_wrcontrol_aclr_b = '1') then
                        i_wren_reg_b <= '0';    
                    else
                        i_wren_reg_b <= wren_b;
                    end if;

                    if (i_wrcontrol_aclr_b = '1') then
                        i_address_reg_b <= (others => '0');    
                    elsif (addressstall_b /= '1') then
                        i_address_reg_b <= address_b;
                    end if;

                    if (byteena_b_unconnected = '1') then
                        m_byteena_mask_reg_b := (others => '1');    
                    else
                        if (i_byteena_aclr_b = '1') then
                            m_byteena_mask_reg_b := (others => '1');    
                        else
                            for k in 0 to (width_b - 1) loop
                                if (width_byteena_b = 1) then
                                    m_byteena_mask_reg_b(k) := byteena_b(0);
                                else
                                    m_byteena_mask_reg_b(k) := byteena_b(k / byte_size);    
                                end if;
                            end loop;
                        end if;
                    end if;

                    i_byteena_mask_reg_b <= m_byteena_mask_reg_b;

                    if ((ram_block_type = "MEGARAM") or (ram_block_type = "M-RAM")) then

                            i_write_flag_b <= not i_write_flag_b;
                    end if;

                    i_nmram_write_b <= '1';
            else

                    i_nmram_write_b <= '0';
                end if;
            end if;

            if (((wrcontrol_wraddress_reg_b = "CLOCK0") and 
                 clock0'event and (clock0 = '0')) or
                ((wrcontrol_wraddress_reg_b = "CLOCK1") and 
                 clock1'event and (clock1 = '0'))) then

                    if ((ram_block_type /= "MEGARAM") and (ram_block_type /= "M-RAM")) then

                       if (i_nmram_write_b = '1') then

                            i_write_flag_b <= not i_write_flag_b;
                       end if;
                   end if;

            end if;

        end process;
    end generate IFG49;


    -- Port B rden input registered (for dual_port mode)
    IFG50: if (((rdcontrol_reg_b = "CLOCK0") or (rdcontrol_reg_b = "CLOCK1")) and
               (operation_mode = "DUAL_PORT")) generate   
        process (clock0, clock1)
        begin
            if (rden_b /= 'Z') then
                if (((address_reg_b = "CLOCK0") and clock0'event and (clock0 = '1')) or
                    ((address_reg_b = "CLOCK1") and clock1'event and (clock1 = '1'))) then
                    if (i_rdcontrol_clken_b = '1') then

                        if (i_rdcontrol_aclr_b = '1') then
                            i_rden_reg_b <= '1';    
                        else
                            i_rden_reg_b <= rden_b;
                        end if;

                    end if;
                end if;
            end if;
        end process;
    end generate IFG50;



    -- Port A : assigning the correct output values for i_q_tmp_a (non-registered output)
    
    i_q_tmp_wren_a <= i_q_tmp2_a when (i_wren_reg_a = '0') 
        else (i_q_tmp2_wren_a);


    i_q_tmp_a <= i_q_tmp_wren_a when (good_to_go_a = '1') 
        else (others => default_val);


    process (i_q_tmp2_a, i_wren_reg_a, i_data_reg_a, i_address_reg_a, i_byteena_mask_reg_a)
    variable t_q_tmp2_wren_a  : std_logic_vector(width_a - 1 downto 0) := (others => '0');
    begin
            if (i_wren_reg_a = '1') then
                 for i in 0 to (width_a - 1) loop
                     if (i_byteena_mask_reg_a(i) = '0') then
                        t_q_tmp2_wren_a(i) := 'X';
                      else
                        t_q_tmp2_wren_a(i) := ((i_data_reg_a(i) and i_byteena_mask_reg_a(i)) or
                                               (i_q_tmp2_a(i) and not i_byteena_mask_reg_a(i))) ;
                      end if;
                 end loop;
                 i_q_tmp2_wren_a <= t_q_tmp2_wren_a;
            end if;
    end process;





    -- Port A outdata output registered
    process (clock0, clock1, aclr0, aclr1)
    begin
        if (((outdata_aclr_a = "CLEAR0") and (aclr0 = '1')) or 
            ((outdata_aclr_a = "CLEAR1") and (aclr1 = '1'))) then
            i_q_reg_a <= (others => '0');    
        elsif (((outdata_reg_a = "CLOCK0") and clock0'event and (clock0 = '1')) or 
               ((outdata_reg_a = "CLOCK1") and clock1'event and (clock1 = '1'))) then
            if (i_outdata_clken_a = '1') then
            i_q_reg_a <= i_q_tmp_a;    
        end if;
        end if;

    end process;


    -- Port A : assigning the correct output values for q_a
    
    IFG52: if (((outdata_reg_a = "CLOCK0") or (outdata_reg_a = "CLOCK1")) and 
               (operation_mode /= "DUAL_PORT"))  generate 
        q_a <= i_q_reg_a;
    end generate IFG52;

    IFG53: if (((outdata_reg_a /= "CLOCK0") and (outdata_reg_a /= "CLOCK1")) and 
               (operation_mode /= "DUAL_PORT"))  generate 
        q_a <= i_q_tmp_a;
    end generate IFG53;

    IFG54: if (operation_mode = "DUAL_PORT") generate 
        q_a <= (others => '0');
    end generate IFG54;


    -- Port B : assigning the correct output values for i_q_tmp_b (non-registered output)
    process (i_q_tmp2_b, good_to_go_b, i_rden_reg_b, i_wren_reg_b, i_data_reg_b, 
             i_byteena_mask_reg_b)
    variable t_q_tmp_b  : std_logic_vector(width_b - 1 downto 0) := (others => '0');   
    begin
        if ((operation_mode = "DUAL_PORT") or (operation_mode = "BIDIR_DUAL_PORT")) then
            if (not good_to_go_b = '1') then
                i_q_tmp_b <= (others => default_val);    
            else
                if (operation_mode = "DUAL_PORT") then
                    if (i_rden_reg_b = '1') then
                        i_q_tmp_b <= i_q_tmp2_b;    
                    end if;
                else
                    if (i_wren_reg_b = '1') then
                        for i in 0 to (width_b - 1) loop
                            if (i_byteena_mask_reg_b(i) = '0') then
                                 t_q_tmp_b(i) := 'X';
                            else
                                 t_q_tmp_b(i) := ((i_data_reg_b(i) and i_byteena_mask_reg_b(i)) or
                                                  (i_q_tmp2_b(i) and not i_byteena_mask_reg_b(i))) ;
                           end if;
                         end loop;
                         i_q_tmp_b <= t_q_tmp_b;
                        else
                        i_q_tmp_b <= i_q_tmp2_b;    
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Port B outdata output registered
    process (clock0, clock1, aclr0, aclr1)
    begin
        if (((outdata_aclr_b = "CLEAR0") and (aclr0 = '1')) or 
            ((outdata_aclr_b = "CLEAR1") and (aclr1 = '1'))) then
            i_q_reg_b <= (others => '0');    
        elsif (((outdata_reg_b = "CLOCK0") and clock0'event and (clock0 = '1')) or 
               ((outdata_reg_b = "CLOCK1") and clock1'event and (clock1 = '1'))) then
            if (i_outdata_clken_b = '1') then
                i_q_reg_b <= i_q_tmp_b;    
            end if;
        end if;
    end process;
    
    -- Port B : assigning the correct output values for q_b
    
    IFG55: if (((outdata_reg_b = "CLOCK0") or (outdata_reg_b = "CLOCK1")) and 
               (operation_mode /= "SINGLE_PORT") and (operation_mode /= "ROM")) generate 
        q_b <= i_q_reg_b;
    end generate IFG55;

    IFG56: if (((outdata_reg_b /= "CLOCK0") and (outdata_reg_b /= "CLOCK1")) and 
               (operation_mode /= "SINGLE_PORT") and (operation_mode /= "ROM"))  generate 
        q_b <= i_q_tmp_b;
    end generate IFG56;

    IFG57: if ((operation_mode = "SINGLE_PORT") or (operation_mode = "ROM")) generate 
        q_b <= (others => '0');
    end generate IFG57;

end translated; 

-- END OF ARCHITECTURE ALTSYNCRAM

-- START_ENTITY_HEADER----------------------------------------------------------
--
-- Entity Name      : ALTQPRAM
--
-- Description      : Asynchronous quad ports memory or memory with synchronous
--                    inputs and/or outputs
--
-- Limitation       :
--
-- Results expected : [Synchronous Write to Memory (all inputs registered)]
--                    inclock      inclocken      wren      Function
--                      X            L              L       No change
--                     not           H              H       No change
--                    posedge        L              X       No change
--                    posedge        H              H       Memory content updated
--
--                    [Synchronous Read from Memory]
--                    inclock      inclocken      rden      Function
--                      X            L              L       No change
--                     not           H              H       No change
--                    posedge        L              X       No change.
--                    posedge        H              H       Memory content showed
--                                                          at the output port
--
--                    [Asynchronous Memory Operations]
--                    wren      Function
--                      L       No change
--                      H       Memory content updated
--                              Memory content showed
--                              at the output port
--
---END_ENTITY_HEADER------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
library altera;
use grlib.stdlib.all;
use std.textio.all;
use altera.ALTERA_COMMON_CONVERSION.all;

-- BEGINNING OF ENTITY

-- ENTITY DECLARATION

entity altqpram is
-- GENERIC DECLARATION
    generic (
        operation_mode            : string := "QUAD_PORT";

        -- PORT A WRITE PARAMETERS
        width_write_a             : natural := 1;
        widthad_write_a           : natural := 1;
        numwords_write_a          : natural := 0;
        indata_reg_a              : string := "INCLOCK_A";
        indata_aclr_a             : string := "INACLR_A";
        wrcontrol_wraddress_reg_a : string := "INCLOCK_A";
        wrcontrol_aclr_a          : string := "INACLR_A";
        wraddress_aclr_a          : string := "INACLR_A";

        -- PORT B WRITE PARAMETERS
        width_write_b             : natural := 1;
        widthad_write_b           : natural := 1;
        numwords_write_b          : natural := 0;
        indata_reg_b              : string := "INCLOCK_B";
        indata_aclr_b             : string := "INACLR_B";
        wrcontrol_wraddress_reg_b : string := "INCLOCK_B";
        wrcontrol_aclr_b          : string := "INACLR_B";
        wraddress_aclr_b          : string := "INACLR_B";

        -- PORT A READ PARAMETERS
        width_read_a              : natural := 1;
        widthad_read_a            : natural := 1;
        numwords_read_a           : natural := 0;
        rdcontrol_reg_a           : string := "OUTCLOCK_A";
        rdcontrol_aclr_a          : string := "OUTACLR_A";
        rdaddress_reg_a           : string := "OUTCLOCK_A";
        rdaddress_aclr_a          : string := "OUTACLR_A";
        outdata_reg_a             : string := "UNREGISTERED";
        outdata_aclr_a            : string := "OUTACLR_A";

        -- PORT B READ PARAMETERS
        width_read_b              : natural := 1;
        widthad_read_b            : natural := 1;
        numwords_read_b           : natural := 0;
        rdcontrol_reg_b           : string := "OUTCLOCK_B";
        rdcontrol_aclr_b          : string := "OUTACLR_B";
        rdaddress_reg_b           : string := "OUTCLOCK_B";
        rdaddress_aclr_b          : string := "OUTACLR_B";
        outdata_reg_b             : string := "UNREGISTERED";
        outdata_aclr_b            : string := "OUTACLR_B";

        init_file                 : string := "UNUSED";
        lpm_hint                  : string := "UNUSED";
        lpm_type                  : string := "altqpram"
        );

-- PORT DECLARATION
    port (
        wren_a       : in std_logic := '0';
        wren_b       : in std_logic := '0';
        data_a       : in std_logic_vector(width_write_a-1 downto 0) := (others => '0');
        data_b       : in std_logic_vector(width_write_b-1 downto 0) := (others => '0');
        wraddress_a  : in std_logic_vector(widthad_write_a-1 downto 0) := (others => '0');
        wraddress_b  : in std_logic_vector(widthad_write_b-1 downto 0) := (others => '0');
        inclock_a    : in std_logic := '0';
        inclock_b    : in std_logic := '0';
        inclocken_a  : in std_logic := '1';
        inclocken_b  : in std_logic := '1';
        rden_a       : in std_logic := '1';
        rden_b       : in std_logic := '1';
        rdaddress_a  : in std_logic_vector(widthad_read_a-1 downto 0) := (others => '0');
        rdaddress_b  : in std_logic_vector(widthad_read_b-1 downto 0) := (others => '0');
        outclock_a   : in std_logic := '0';
        outclock_b   : in std_logic := '0';
        outclocken_a : in std_logic := '1';
        outclocken_b : in std_logic := '1';
        inaclr_a     : in std_logic := '0';
        inaclr_b     : in std_logic := '0';
        outaclr_a    : in std_logic := '0';
        outaclr_b    : in std_logic := '0';
        q_a          : out std_logic_vector(width_read_a-1 downto 0);
        q_b          : out std_logic_vector(width_read_b-1 downto 0)
        );

end altqpram;

-- END OF ENTITY

-- BEGINNING OF ARCHITECTURE

architecture behavior of altqpram is

-- TYPE DECLARATION

    type alt_mem_read is array((2**widthad_read_a)-1 downto 0) of std_logic_vector(width_read_a-1 downto 0);
    type alt_mem_write is array((2**widthad_write_a)-1 downto 0) of std_logic_vector(width_write_a-1 downto 0);

-- SIGNAL DECLARATION

    signal i_data_tmp_a : std_logic_vector(width_write_a-1 downto 0) := (others => '0');
    signal i_data_reg_a : std_logic_vector(width_write_a-1 downto 0) := (others => '0');
    signal i_data_tmp_b : std_logic_vector(width_write_b-1 downto 0) := (others => '0');
    signal i_data_reg_b : std_logic_vector(width_write_b-1 downto 0) := (others => '0');
    signal i_data_hi_a : std_logic_vector(width_write_a-1 downto 0) := (others => '0');
    signal i_data_lo_a : std_logic_vector(width_write_a-1 downto 0) := (others => '0');
    signal i_data_hi_b : std_logic_vector(width_write_b-1 downto 0) := (others => '0');
    signal i_data_lo_b : std_logic_vector(width_write_b-1 downto 0) := (others => '0');
    signal i_q_tmp_a : std_logic_vector(width_read_a-1 downto 0) := (others => '0');
    signal i_q_reg_a : std_logic_vector(width_read_a-1 downto 0) := (others => '0');
    signal i_q_tmp_b : std_logic_vector(width_read_b-1 downto 0) := (others => '0');
    signal i_q_reg_b : std_logic_vector(width_read_b-1 downto 0) := (others => '0');
    signal i_rdaddress_tmp_a : std_logic_vector(widthad_read_a-1 downto 0) := (others => '0');
    signal i_rdaddress_reg_a : std_logic_vector(widthad_read_a-1 downto 0) := (others => '0');
    signal i_rdaddress_tmp_b : std_logic_vector(widthad_read_b-1 downto 0) := (others => '0');
    signal i_rdaddress_reg_b : std_logic_vector(widthad_read_b-1 downto 0) := (others => '0');
    signal i_wraddress_tmp_a : std_logic_vector(widthad_write_a-1 downto 0) := (others => '0');
    signal i_wraddress_reg_a : std_logic_vector(widthad_write_a-1 downto 0) := (others => '0');
    signal i_wraddress_tmp_b : std_logic_vector(widthad_write_b-1 downto 0) := (others => '0');
    signal i_wraddress_reg_b : std_logic_vector(widthad_write_b-1 downto 0) := (others => '0');
    signal i_wraddress_hi_a : std_logic_vector(widthad_write_a-1 downto 0) := (others => '0');
    signal i_wraddress_lo_a : std_logic_vector(widthad_write_a-1 downto 0) := (others => '0');
    signal i_wraddress_hi_b : std_logic_vector(widthad_write_b-1 downto 0) := (others => '0');
    signal i_wraddress_lo_b : std_logic_vector(widthad_write_b-1 downto 0) := (others => '0');
    signal i_wren_tmp_a : std_logic := '0';
    signal i_wren_reg_a : std_logic := '0';
    signal i_wren_tmp_b : std_logic := '0';
    signal i_wren_reg_b : std_logic := '0';
    signal i_wren_hi_a : std_logic := '0';
    signal i_wren_lo_a : std_logic := '0';
    signal i_wren_hi_b : std_logic := '0';
    signal i_wren_lo_b : std_logic := '0';
    signal i_rden_tmp_a : std_logic := '0';
    signal i_rden_reg_a : std_logic := '0';
    signal i_rden_tmp_b : std_logic := '0';
    signal i_rden_reg_b : std_logic := '0';
    signal i_indata_aclr_a : std_logic := '0';
    signal i_outdata_aclr_a : std_logic := '0';
    signal i_wrcontrol_aclr_a : std_logic := '0';
    signal i_wraddress_aclr_a : std_logic := '0';
    signal i_rdcontrol_aclr_a : std_logic := '0';
    signal i_rdaddress_aclr_a : std_logic := '0';
    signal i_indata_aclr_b : std_logic := '0';
    signal i_outdata_aclr_b : std_logic := '0';
    signal i_wrcontrol_aclr_b : std_logic := '0';
    signal i_wraddress_aclr_b : std_logic := '0';
    signal i_rdcontrol_aclr_b : std_logic := '0';
    signal i_rdaddress_aclr_b : std_logic := '0';
    signal i_numwords_write_a : integer := numwords_write_a;
    signal i_numwords_write_b : integer := numwords_write_b;
    signal i_numwords_read_a : integer := numwords_read_a;
    signal i_numwords_read_b : integer := numwords_read_b;
    signal write_at_low_clock_a : boolean := false;
    signal write_at_low_clock_b : boolean := false;
    signal mem_init : boolean := false;
    signal aclr_updated : std_logic := '0';
    signal both_clk_trigger : std_logic := '0';
    signal op_mode : natural := 0;

    begin

    -- This process handling the aclr signals
    ACLRS : process (inaclr_a, outaclr_a, inaclr_b, outaclr_b)
    begin

        -- ACLR_A

        i_indata_aclr_a <= '0';
        i_wrcontrol_aclr_a <= '0';
        i_wraddress_aclr_a <= '0';
        i_outdata_aclr_a <= '0';
        i_rdcontrol_aclr_a <= '0';
        i_rdaddress_aclr_a <= '0';

        if (inaclr_a = '1') then

            if ((indata_aclr_a = "INACLR_A") and
                (indata_reg_a /= "UNREGISTERED")) then
                i_indata_aclr_a <= '1';
            end if;

            if ((wrcontrol_aclr_a = "INACLR_A") and
                (wrcontrol_wraddress_reg_a /= "UNREGISTERED")) then
                i_wrcontrol_aclr_a <= '1';
            end if;

            if ((wraddress_aclr_a = "INACLR_A") and
                (wrcontrol_wraddress_reg_a /= "UNREGISTERED")) then
                i_wraddress_aclr_a <= '1';
            end if;

            if ((outdata_aclr_a = "INACLR_A") and
                (outdata_reg_a /= "UNREGISTERED")) then
                i_outdata_aclr_a <= '1';
            end if;

            if ((rdcontrol_aclr_a = "INACLR_A") and
                (rdcontrol_reg_a /= "UNREGISTERED")) then
                i_rdcontrol_aclr_a <= '1';
            end if;

            if ((rdaddress_aclr_a = "INACLR_A") and
                (rdaddress_reg_a /= "UNREGISTERED")) then
                i_rdaddress_aclr_a <= '1';
            end if;

        end if;

        if (outaclr_a = '1') then

            if ((outdata_aclr_a = "OUTACLR_A") and
                (outdata_reg_a /= "UNREGISTERED")) then
                i_outdata_aclr_a <= '1';
            end if;

            if ((rdcontrol_aclr_a = "OUTACLR_A") and
                (rdcontrol_reg_a /= "UNREGISTERED")) then
                i_rdcontrol_aclr_a <= '1';
            end if;

            if ((rdaddress_aclr_a = "OUTACLR_A") and
                (rdaddress_reg_a /= "UNREGISTERED")) then
                i_rdaddress_aclr_a <= '1';
            end if;

        end if;

        -- ACLR_B --

        i_indata_aclr_b <= '0';
        i_wrcontrol_aclr_b <= '0';
        i_wraddress_aclr_b <= '0';
        i_outdata_aclr_b <= '0';
        i_rdcontrol_aclr_b <= '0';
        i_rdaddress_aclr_b <= '0';

        if (inaclr_b = '1') then

            if ((indata_aclr_b = "INACLR_B") and
                (indata_reg_b /= "UNREGISTERED")) then
                i_indata_aclr_b <= '1';
            end if;

            if ((wrcontrol_aclr_b = "INACLR_B") and
                (wrcontrol_wraddress_reg_b /= "UNREGISTERED")) then
                i_wrcontrol_aclr_b <= '1';
            end if;

            if ((wraddress_aclr_b = "INACLR_B") and
                (wrcontrol_wraddress_reg_b /= "UNREGISTERED")) then
                i_wraddress_aclr_b <= '1';
            end if;

            if ((outdata_aclr_b = "INACLR_B") and
                (outdata_reg_b /= "UNREGISTERED")) then
                i_outdata_aclr_b <= '1';
            end if;

            if ((rdcontrol_aclr_b = "INACLR_B") and
                (rdcontrol_reg_b /= "UNREGISTERED")) then
                i_rdcontrol_aclr_b <= '1';
            end if;

            if ((rdaddress_aclr_b = "INACLR_B") and
                (rdaddress_reg_b /= "UNREGISTERED")) then
                i_rdaddress_aclr_b <= '1';
            end if;

        end if;

        if (outaclr_b = '1') then

            if ((outdata_aclr_b = "OUTACLR_B") and
                (outdata_reg_b /= "UNREGISTERED")) then
                i_outdata_aclr_b <= '1';
            end if;

            if ((rdcontrol_aclr_b = "OUTACLR_B") and
                (rdcontrol_reg_b /= "UNREGISTERED")) then
                i_rdcontrol_aclr_b <= '1';
            end if;

            if ((rdaddress_aclr_b = "OUTACLR_B") and
                (rdaddress_reg_b /= "UNREGISTERED")) then
                i_rdaddress_aclr_b <= '1';
            end if;

        end if;

        aclr_updated <= not aclr_updated;

    end process ACLRS;


    -- This process synchronize input and output signals.
    -- It assigns the correct signals to temporary buffers accordingly,
    -- ie cleared, registered or not.
    SYNC: process (data_a, data_b, i_data_reg_a, i_data_reg_b,
                   rden_a, rden_b, i_rden_reg_a, i_rden_reg_b,
                   rdaddress_a, rdaddress_b, i_rdaddress_reg_a, i_rdaddress_reg_b,
                   wren_a, wren_b, i_wren_reg_a, i_wren_reg_b,
                   wraddress_a, wraddress_b, i_wraddress_reg_a, i_wraddress_reg_b,
                   i_q_tmp_a, i_q_tmp_b, i_q_reg_a, i_q_reg_b,
                   aclr_updated)
    begin

        if ((not inaclr_a'event) and (not outaclr_a'event) and
            (not inaclr_b'event) and (not outaclr_b'event))
        then

            if (i_rdaddress_aclr_a = '1') then
                i_rdaddress_tmp_a <= (others => '0');
            elsif (rdaddress_reg_a = "UNREGISTERED") then
                i_rdaddress_tmp_a <= rdaddress_a;
            else
                i_rdaddress_tmp_a <= i_rdaddress_reg_a;
            end if;

            if (i_rdaddress_aclr_b = '1') then
                i_rdaddress_tmp_b <= (others => '0');
            elsif (rdaddress_reg_b = "UNREGISTERED") then
                i_rdaddress_tmp_b <= rdaddress_b;
            else
                i_rdaddress_tmp_b <= i_rdaddress_reg_b;
            end if;

            if (i_rdcontrol_aclr_a = '1') then
                i_rden_tmp_a <= '0';
            elsif (rdcontrol_reg_a = "UNREGISTERED") then
                i_rden_tmp_a <= rden_a;
            else
                i_rden_tmp_a <= i_rden_reg_a;
            end if;

            if (i_rdcontrol_aclr_b = '1') then
                i_rden_tmp_b <= '0';
            elsif (rdcontrol_reg_b = "UNREGISTERED") then
                i_rden_tmp_b <= rden_b;
            else
                i_rden_tmp_b <= i_rden_reg_b;
            end if;

            if (i_wraddress_aclr_a = '1') then
                i_wraddress_tmp_a <= (others => '0');
            elsif (wrcontrol_wraddress_reg_a = "UNREGISTERED") then
                i_wraddress_tmp_a <= wraddress_a;
            else
                i_wraddress_tmp_a <= i_wraddress_reg_a;
            end if;

            if (i_wraddress_aclr_b = '1') then
                i_wraddress_tmp_b <= (others => '0');
            elsif (wrcontrol_wraddress_reg_b = "UNREGISTERED") then
                i_wraddress_tmp_b <= wraddress_b;
            else
                i_wraddress_tmp_b <= i_wraddress_reg_b;
            end if;

            if (i_wrcontrol_aclr_a = '1') then
                i_wren_tmp_a <= '0';
            elsif (wrcontrol_wraddress_reg_a = "UNREGISTERED") then
                i_wren_tmp_a <= wren_a;
            else
                i_wren_tmp_a <= i_wren_reg_a;
            end if;

            if (i_wrcontrol_aclr_b = '1') then
                i_wren_tmp_b <= '0';
            elsif (wrcontrol_wraddress_reg_b = "UNREGISTERED") then
                i_wren_tmp_b <= wren_b;
            else
                i_wren_tmp_b <= i_wren_reg_b;
            end if;

            if (i_indata_aclr_a = '1') then
                i_data_tmp_a <= (others => '0');
            elsif (indata_reg_a = "UNREGISTERED") then
                i_data_tmp_a <= data_a;
            else
                i_data_tmp_a <= i_data_reg_a;
            end if;

            if (i_indata_aclr_b = '1') then
                i_data_tmp_b <= (others => '0');
            elsif (indata_reg_b = "UNREGISTERED") then
                i_data_tmp_b <= data_b;
            else
                i_data_tmp_b <= i_data_reg_b;
            end if;

            if (((op_mode mod 6) = 0) or (i_outdata_aclr_a = '1')) then
                q_a <= (others => '0');
            elsif (outdata_reg_a = "UNREGISTERED") then
                q_a <= i_q_tmp_a;
            else
                q_a <= i_q_reg_a;
            end if;

            if (((op_mode mod 5) = 0) or (i_outdata_aclr_b = '1')) then
                q_b <= (others => '0');
            elsif (outdata_reg_b = "UNREGISTERED") then
                q_b <= i_q_tmp_b;
            else
                q_b <= i_q_reg_b;
            end if;

        end if;
    end process SYNC;


    -- This process synchronize the port A inputs.
    -- (For both clock edges)
    SYNC_A: process (i_data_hi_a, i_data_lo_a, i_indata_aclr_a,
                     i_wraddress_hi_a, i_wraddress_lo_a,
                     i_wren_hi_a, i_wren_lo_a,
                     i_wraddress_aclr_a, i_wrcontrol_aclr_a)
    begin

        if (i_indata_aclr_a = '1') then
            i_data_reg_a <= (others => '0');
        elsif (write_at_low_clock_a) then
            i_data_reg_a <= i_data_lo_a;
        else
            i_data_reg_a <= i_data_hi_a;
        end if;

        if (i_wrcontrol_aclr_a = '1') then
            i_wren_reg_a <= '0';
        elsif (operation_mode /= "BIDIR_DUAL_PORT") then
            if (write_at_low_clock_a) then
            i_wren_reg_a <= i_wren_lo_a;
        else
            i_wren_reg_a <= i_wren_hi_a;
        end if;
        else
            i_wren_reg_a <= i_wren_hi_a;
        end if;

        if (i_wraddress_aclr_a = '1') then
            i_wraddress_reg_a <= (others => '0');
        elsif (write_at_low_clock_a) then
            if ((operation_mode = "QUAD_PORT") or (operation_mode = "DUAL_PORT")) then
                i_wraddress_reg_a <= i_wraddress_lo_a;
            else
                i_wraddress_reg_a <= i_wraddress_hi_a;
            end if;
        else
            i_wraddress_reg_a <= i_wraddress_hi_a;
        end if;

    end process SYNC_A;


    -- This process synchronize the port B inputs.
    -- (For both clock edges)
    SYNC_B: process(i_data_hi_b, i_data_lo_b, i_wraddress_hi_b, i_wraddress_lo_b,
                    i_wren_hi_b, i_wren_lo_b,
                    i_wraddress_aclr_b, i_wrcontrol_aclr_b, i_indata_aclr_b)
    begin

        if (i_indata_aclr_b = '1') then
            i_data_reg_b <= (others => '0');
        elsif (write_at_low_clock_b) then
            i_data_reg_b <= i_data_lo_b;
        else
            i_data_reg_b <= i_data_hi_b;
        end if;

        if (i_wrcontrol_aclr_b = '1') then
            i_wren_reg_b <= '0';
        elsif (write_at_low_clock_b) then
            if ((operation_mode = "QUAD_PORT") or (operation_mode = "DUAL_PORT")) then
                i_wren_reg_b <= i_wren_lo_b;
            else
                i_wren_reg_b <= i_wren_hi_b;
            end if;
        else
            i_wren_reg_b <= i_wren_hi_b;
        end if;

        if (i_wraddress_aclr_b = '1') then
            i_wraddress_reg_b <= (others => '0');
        elsif (write_at_low_clock_b) then
            if ((operation_mode = "QUAD_PORT") or (operation_mode = "DUAL_PORT")) then
                i_wraddress_reg_b <= i_wraddress_lo_b;
            else
                i_wraddress_reg_b <= i_wraddress_hi_b;
            end if;
        else
            i_wraddress_reg_b <= i_wraddress_hi_b;
        end if;

    end process SYNC_B;


    -- This process is to check whether inclock for both ports
    -- trigger at the same time.
    SIMULTANEOUS_CLOCK: process(inclock_a, inclock_b)
    begin
        if (inclock_a'event and inclock_b'event) then
            both_clk_trigger <= '1';
        else
            both_clk_trigger <= '0';
        end if;
    end process SIMULTANEOUS_CLOCK;


    -- This process is to handling registered inputs and output for port A
    REG_A: process (inclock_a, outclock_a)
    begin

        if (inclock_a'event) then

            if (i_indata_aclr_a = '1') then
                i_data_hi_a <= (others => '0');
                i_data_lo_a <= (others => '0');
            elsif ((inclock_a = '1') and (inclocken_a = '1')) then
                i_data_hi_a <= data_a;
            elsif (inclock_a = '0') then
                i_data_lo_a <= i_data_hi_a;
            end if;

            if (i_wraddress_aclr_a = '1') then
                i_wraddress_hi_a <= (others => '0');
                i_wraddress_lo_a <= (others => '0');
            elsif ((inclock_a = '1') and (inclocken_a = '1')) then
                i_wraddress_hi_a <= wraddress_a;
            elsif (inclock_a = '0') then
                i_wraddress_lo_a <= i_wraddress_hi_a;
            end if;

            if (i_wrcontrol_aclr_a = '1') then
                i_wren_hi_a <= '0';
                i_wren_lo_a <= '0';
            elsif ((inclock_a = '1') and (inclocken_a = '1')) then
                i_wren_hi_a <= wren_a;
            elsif (inclock_a = '0') then
                i_wren_lo_a <= i_wren_hi_a;
            end if;

            if (outdata_reg_a = "INCLOCK_A") then
                if (i_outdata_aclr_a = '1') then
                    i_q_reg_a <= (others => '0');
                elsif ((inclock_a = '1') and (inclocken_a = '1')) then
                    i_q_reg_a <= i_q_tmp_a;
                end if;
            end if;

            if (rdaddress_reg_a = "INCLOCK_A") then
                if (i_rdaddress_aclr_a = '1') then
                    i_rdaddress_reg_a <= (others => '0');
                elsif ((inclock_a = '1') and (inclocken_a = '1')) then
                    i_rdaddress_reg_a <= rdaddress_a;
                end if;
            end if;

            if (rdcontrol_reg_a = "INCLOCK_A") then
                if (i_rdcontrol_aclr_a = '1') then
                    i_rden_reg_a <= '0';
                elsif ((inclock_a = '1') and (inclocken_a = '1')) then
                    i_rden_reg_a <= rden_a;
                end if;
            end if;

        end if;

        if (outclock_a'event) then

            if (outdata_reg_a = "OUTCLOCK_A") then
                if (i_outdata_aclr_a = '1') then
                    i_q_reg_a <= (others => '0');
                elsif ((outclock_a = '1') and (outclocken_a = '1')) then
                    i_q_reg_a <= i_q_tmp_a;
                end if;
            end if;

            if (rdaddress_reg_a = "OUTCLOCK_A") then
                if (i_rdaddress_aclr_a = '1') then
                    i_rdaddress_reg_a <= (others => '0');
                elsif ((outclock_a = '1') and (outclocken_a = '1')) then
                    i_rdaddress_reg_a <= rdaddress_a;
                end if;
            end if;

            if (rdcontrol_reg_a = "OUTCLOCK_A") then
                if (i_rdcontrol_aclr_a = '1') then
                    i_rden_reg_a <= '0';
                elsif ((outclock_a = '1') and (outclocken_a = '1')) then
                    i_rden_reg_a <= rden_a;
                end if;
            end if;

        end if;
    end process REG_A;


    -- This process is to handling registered inputs and output for port B
    REG_B : process (inclock_b, outclock_b)
    begin

        if (inclock_b'event) then
            if (i_indata_aclr_b = '1') then
                i_data_hi_b <= (others => '0');
                i_data_lo_b <= (others => '0');
            elsif ((inclock_b = '1') and (inclocken_b = '1')) then
                i_data_hi_b <= data_b;
            elsif (inclock_b = '0') then
                i_data_lo_b <= i_data_hi_b;
            end if;

            if (i_wraddress_aclr_b = '1') then
                i_wraddress_hi_b <= (others => '0');
                i_wraddress_lo_b <= (others => '0');
            elsif ((inclock_b = '1') and (inclocken_b = '1')) then
                i_wraddress_hi_b <= wraddress_b;
            elsif (inclock_b = '0') then
                i_wraddress_lo_b <= i_wraddress_hi_b;
            end if;

            if (i_wrcontrol_aclr_b = '1') then
                i_wren_hi_b <= '0';
                i_wren_lo_b <= '0';
            elsif ((inclock_b = '1') and (inclocken_b = '1')) then
                i_wren_hi_b <= wren_b;
            elsif (inclock_b = '0') then
                i_wren_lo_b <= i_wren_hi_b;
            end if;

            if (outdata_reg_b = "INCLOCK_B") then
                if (i_outdata_aclr_b = '1') then
                    i_q_reg_b <= (others => '0');
                elsif ((inclock_b = '1') and (inclocken_b = '1')) then
                    i_q_reg_b <= i_q_tmp_b;
                end if;
            end if;

            if (rdaddress_reg_b = "INCLOCK_B") then
                if (i_rdaddress_aclr_b = '1') then
                    i_rdaddress_reg_b <= (others => '0');
                elsif ((inclock_b = '1') and (inclocken_b = '1')) then
                    i_rdaddress_reg_b <= rdaddress_b;
                end if;
            end if;

            if (rdcontrol_reg_b = "INCLOCK_B") then
                if (i_rdcontrol_aclr_b = '1') then
                    i_rden_reg_b <= '0';
                elsif ((inclock_b = '1') and (inclocken_b = '1')) then
                    i_rden_reg_b <= rden_b;
                end if;
            end if;

        end if;

        if (outclock_b'event) then

            if (outdata_reg_b = "OUTCLOCK_B") then
                if (i_outdata_aclr_b = '1') then
                    i_q_reg_b <= (others => '0');
                elsif ((outclock_b = '1') and (outclocken_b = '1')) then
                    i_q_reg_b <= i_q_tmp_b;
                end if;
            end if;

            if (rdaddress_reg_b = "OUTCLOCK_B") then
                if (i_rdaddress_aclr_b = '1') then
                    i_rdaddress_reg_b <= (others => '0');
                elsif ((outclock_b = '1') and (outclocken_b = '1')) then
                    i_rdaddress_reg_b <= rdaddress_b;
                end if;
            end if;

            if (rdcontrol_reg_b = "OUTCLOCK_B") then
                if (i_rdcontrol_aclr_b = '1') then
                    i_rden_reg_b <= '0';
                elsif ((outclock_b = '1') and (outclocken_b = '1')) then
                    i_rden_reg_b <= rden_b;
                end if;
            end if;

        end if;
    end process REG_B;


    -- This process is to initial memory contents and signals or variables
    -- initialization, and also to update the memory contents during write cycles
    MEMORY : process (i_data_tmp_a, i_wren_tmp_a, i_wraddress_tmp_a, i_wraddress_lo_a, 
                      i_rden_tmp_a, i_rdaddress_tmp_a, i_wren_lo_a,
                      i_data_tmp_b, i_wren_tmp_b, i_wraddress_tmp_b, i_wraddress_lo_b, 
                      i_rden_tmp_b, i_rdaddress_tmp_b, i_wren_lo_b, mem_init)

        variable mem_rd_data : alt_mem_read;
        variable mem_wr_data : alt_mem_write;
        variable mem_rd_data_word : std_logic_vector(width_read_a-1 downto 0) := (others => '0');
        variable mem_wr_data_word : std_logic_vector(width_write_a-1 downto 0) := (others => '0');
        variable read_ratio : integer := 0;
        variable write_ratio : integer := 0;
        variable write_read_ratio : integer := 0;
        variable bytes_per_entry : integer := 0;
        variable i : integer := 0;
        variable j : integer := 0;
        variable k : integer := 0;
        variable l : integer := 0;
        variable n : integer := 0;
        variable m : integer := 0;
        variable p : integer := 0;
        variable lineno : integer := 0;
        variable buf : line;
        variable base : string(2 downto 1) := "  ";
        variable byte : string(2 downto 1) := "  ";
        variable rec_type : string(2 downto 1) := "  ";
        variable datain : string(2 downto 1) := "  ";
        variable addr : string(2 downto 1) := "  ";
        variable checksum : string(2 downto 1) := "  ";
        variable startadd: string(4 downto 1) := "    ";
        variable ibase: integer := 0;
        variable ibyte: integer := 0;
        variable istartadd: integer := 0;
        variable check_sum_vec : std_logic_vector(7 downto 0) := (others => '0');
        variable check_sum_vec_tmp : std_logic_vector(7 downto 0) := (others => '0');
        variable booval : boolean := true;
        variable simultaneous_write : boolean := false;
        variable m_op_mode : integer := 0;
        file mem_data_file : text;

    begin
        -- Initialization
        if (not mem_init) then

            -- CHECK FOR OPERATION_MODE --
            --
            -- This is the table for encoding of op_mode
            --       << PORT A >>      |  << PORT B >>
            --      RD  RD  WR  WR     | RD  RD  WR  WR
            --      EN ADDR EN ADDR %6 | EN ADDR EN ADDR %5
            -- QP    o   o   o   o   3 |  o   o   o   o   3
            -- BDP           o   o   2 |          o   o   2
            -- DP    o   o   o   o   3 |                  0
            -- SP            o   o   2 |                  0
            -- ROM       o           1 |                  0
            --
            if (operation_mode = "QUAD_PORT") then
                m_op_mode := 3;
            elsif (operation_mode = "BIDIR_DUAL_PORT") then
                m_op_mode := 2;
            elsif (operation_mode = "DUAL_PORT") then
                m_op_mode := 15;
            elsif (operation_mode = "SINGLE_PORT") then
                m_op_mode := 20;
            elsif (operation_mode = "ROM") then
                m_op_mode := 25;
            else
                assert false
                report "Illegal OPERATION_MODE property value for ALTQPRAM!"
                severity error;
            end if;

            op_mode <= m_op_mode;

            -- Parameters value checking

            -- Port_A

            if ((width_write_a <= 0) and
                ((m_op_mode mod 6) > 1))
            then
                assert false
                report "Illegal WIDTH_WRITE_A property value for ALTQPRAM!"
                severity error;
            end if;

            if ((widthad_write_a <= 0) and
                ((m_op_mode mod 6) > 1))
            then
                assert false
                report "Illegal WIDTHAD_WRITE_A property value for ALTQPRAM!"
                severity error;
            end if;

            if ((width_read_a <= 0) and
                ((m_op_mode mod 6) > 0) and
                ((m_op_mode mod 6) /= 2))
            then
                assert false
                report "Illegal WIDTH_READ_A property value for ALTQPRAM!"
                severity error;
            end if;

            if ((widthad_read_a <= 0) and
                ((m_op_mode mod 6) > 0) and
                ((m_op_mode mod 6) /= 2))
            then
                assert false
                report "Illegal WIDTHAD_READ_A property value for ALTQPRAM!"
                severity error;
            end if;

            if ((width_read_a /= width_write_a) and
                ((m_op_mode mod 6) = 2))
            then
                assert false
                report "WIDTH_READ_A and WIDTH_WRITE_A property values for ALTQPRAM must equal!"
                severity error;
            end if;

            -- Port_B

            if ((width_write_b <= 0) and
                ((m_op_mode mod 5) > 1))
            then
                assert false
                report "Illegal WIDTH_WRITE_B property value for ALTQPRAM!"
                severity error;
            end if;

            if ((widthad_write_b <= 0) and
                ((m_op_mode mod 5) > 1))
            then
                assert false
                report "Illegal WIDTHAD_WRITE_B property value for ALTQPRAM!"
                severity error;
            end if;

            if ((width_read_b <= 0) and
                ((m_op_mode mod 5) > 2))
            then
                assert false
                report "Illegal WIDTH_READ_B property value for ALTQPRAM!"
                severity error;
            end if;

            if ((widthad_read_b <= 0) and
                ((m_op_mode mod 5) > 2))
            then
                assert false
                report "Illegal WIDTHAD_READ_B property value for ALTQPRAM!"
                severity error;
            end if;

            if ((width_read_b /= width_write_b) and
                ((m_op_mode mod 5) = 2))
            then
                assert false
                report "width_read_b and width_write_b property values for ALTQPRAM must equal!"
                severity error;
            end if;

            -- Set default values for numwords

            if (numwords_write_a = 0) then
                i_numwords_write_a <= 2**widthad_write_a;
            end if;

            if (numwords_write_b = 0) then
                i_numwords_write_b <= 2**widthad_write_b;
            end if;

            if (numwords_read_a = 0) then
                i_numwords_read_a <= 2**widthad_read_a;
            end if;

            if (numwords_read_b = 0) then
                i_numwords_read_b <= 2**widthad_read_b;
            end if;

            -- Check RAM port size

            if (((width_read_a * i_numwords_read_a) /= (width_write_a * i_numwords_write_a)) and
                (m_op_mode mod 6 > 0) and (m_op_mode mod 6 /= 2))
            then
                assert false
                report "Inconsistant RAM size for port A of ALTQPRAM!"
                severity error;
            end if;

            if (m_op_mode mod 5 > 1) then
                if ((width_read_b * i_numwords_read_b) /= (width_write_b * i_numwords_write_b)) then
                    assert false
                    report "Inconsistant RAM size for port B of ALTQPRAM!"
                    severity error;
                end if;

                if ((width_read_a * i_numwords_read_a) /= (width_read_b * i_numwords_read_b)) then
                    assert false
                    report "Inconsistant RAM size between port A and port B of ALTQPRAM!"
                    severity error;
                end if;
            end if;

            -- Check RAM size ratio

            read_ratio := width_read_b / width_read_a;

            if (read_ratio < 1) then
                read_ratio := width_read_a / width_read_b;
            end if;

            write_ratio := width_write_b / width_write_a;

            if (write_ratio < 1) then
                write_ratio := width_write_a / width_write_b;
            end if;

            write_read_ratio := width_write_a / width_read_a;

            if (write_read_ratio < 1) then
                write_read_ratio := width_read_a / width_write_a;
            end if;

            if ((operation_mode /= "QUAD_PORT") or
                (operation_mode /= "BIDIR_DUAL_PORT")) then
                read_ratio := 1;
                write_ratio := 1;
            end if;

            if (((read_ratio /= 1) and (read_ratio /= 2) and (read_ratio /= 4) and
                 (read_ratio /= 8) and (read_ratio /= 16)) or
                ((write_ratio /= 1) and (write_ratio /= 2) and (write_ratio /= 4) and
                 (write_ratio /= 8) and (write_ratio /= 16)) or
                ((write_read_ratio /= 1) and (write_read_ratio /= 2) and
                 (write_read_ratio /= 4) and (write_read_ratio /= 8) and
                 (write_read_ratio /= 16))) then
                assert false
                report "Invalid RAM size for port A and/or port B of ALTQPRAM!"
                severity error;
            end if;

            -- Set memory writting behaviour

            if (wrcontrol_wraddress_reg_a /= "UNREGISTERED") then
                write_at_low_clock_a <= true;
            end if;

            if (wrcontrol_wraddress_reg_b /= "UNREGISTERED") then
                write_at_low_clock_b <= true;
            end if;

            -- Initialize memory contents

            if ((INIT_FILE = "UNUSED") or (INIT_FILE = "")) then

                if (m_op_mode mod 6 = 1) then         -- if ROM mode
                    assert false
                    report "Initialization file not found!"
                    severity error;
                elsif (m_op_mode mod 6 = 2) then      -- if SP or BDP mode
                    for i in mem_wr_data'low to mem_wr_data'high loop
                        mem_wr_data(i) := (others => '0');
                    end loop;
                else                                -- if QP or DP mode
                    for i in mem_rd_data'low to mem_rd_data'high loop
                        mem_rd_data(i) := (others => '0');
                    end loop;
                end if;

            else

                file_open(mem_data_file, init_file, read_mode);

                while not endfile(mem_data_file) loop
                    booval := true;
                    readline(mem_data_file, buf);
                    lineno := lineno + 1;
                    check_sum_vec := (others => '0');

                    if (buf(buf'low) = ':') then
                        i := 1;
                        SHRINK_LINE(buf, i);
                        read(l => buf, value => byte, good => booval);

                        if not (booval) then
                            assert false
                            report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format!"
                            severity error;
                        end if;

                        ibyte := HEX_STR_TO_INT(byte);
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(conv_std_logic_vector(ibyte, 8));
                        check_sum_vec := (check_sum_vec) + ibyte;
                        read(l => buf, value => startadd, good => booval);

                        if not (booval) then
                            assert false
                            report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                            severity error;
                        end if;

                        istartadd := HEX_STR_TO_INT(startadd);
                        addr(2) := startadd(4);
                        addr(1) := startadd(3);
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(addr), 8));
                        check_sum_vec := (check_sum_vec) + HEX_STR_TO_INT(addr);
                        addr(2) := startadd(2);
                        addr(1) := startadd(1);
--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(addr), 8));
                        check_sum_vec := check_sum_vec + HEX_STR_TO_INT(addr);
                        read(l=>buf, value=>rec_type, good=>booval);
                        if not (booval) then
                            assert false
                            report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                            severity error;
                        end if;

--                        check_sum_vec := unsigned(check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(rec_type), 8));
                        check_sum_vec := (check_sum_vec) + HEX_STR_TO_INT(rec_type);
                    else
                        assert false
                        report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                        severity error;
                    end if;

                    case rec_type is
                        when "00"=>     -- Data record
                            i := 0;

                            if ((m_op_mode mod 6) = 2) then -- if SP or BDP mode
                                bytes_per_entry := (width_write_a + 7) / 8;
                            else                        -- if ROM, QP or DP mode
                                bytes_per_entry := (width_read_a + 7) / 8;
                            end if;

                            while (i < ibyte) loop
                                n := (bytes_per_entry - 1) * 8;

                                if ((m_op_mode mod 6) = 2) then
                                    mem_wr_data_word := (others => '0');
                                    m := width_write_a - 1;
                                else
                                    mem_rd_data_word := (others => '0');
                                    m := width_read_a - 1;
                                end if;

                                for j in 1 to bytes_per_entry loop
                                    read(l => buf, value => datain, good => booval);

                                    if not (booval) then
                                        assert false
                                        report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                                        severity error;
                                    end if;

--                                    check_sum_vec := unsigned(check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(datain), 8));
                                    check_sum_vec := (check_sum_vec) + HEX_STR_TO_INT(datain);

                                    if ((m_op_mode mod 6) = 2) then -- if SP or BDP mode
                                        mem_wr_data_word(m downto n) :=
                                            conv_std_logic_vector(HEX_STR_TO_INT(datain), m - n + 1);
                                    else                        -- if ROM, QP or DP mode
                                        mem_rd_data_word(m downto n) :=
                                            conv_std_logic_vector(HEX_STR_TO_INT(datain), m - n + 1);
                                    end if;

                                    m := n - 1;
                                    n := n - 8;
                                end loop;

                                i := i + bytes_per_entry;

                                if ((m_op_mode mod 6) = 2) then -- if SP or BDP mode
                                    mem_wr_data(ibase + istartadd) := mem_wr_data_word;
                                else                        -- if ROM, QP or DP mode
                                    mem_rd_data(ibase + istartadd) := mem_rd_data_word;
                                end if;

                                istartadd := istartadd + 1;
                            end loop;

                        when "01"=>
                            exit;

                        when "02"=>
                            ibase := 0;

                            if (ibyte /= 2) then
                                assert false
                                report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format for record type 02! "
                                severity error;
                            end if;

                            for i in 0 to (ibyte-1) loop
                                read(l => buf, value => base, good => booval);
                                ibase := (ibase * 256) + HEX_STR_TO_INT(base);

                                if not (booval) then
                                    assert false
                                    report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal Intel Hex Format! "
                                    severity error;
                                end if;

--                                check_sum_vec := unsigned(check_sum_vec) + unsigned(conv_std_logic_vector(HEX_STR_TO_INT(base), 8));
                                check_sum_vec := (check_sum_vec) + HEX_STR_TO_INT(base);
                            end loop;

                            ibase := ibase * 16;

                        when others =>
                            assert false
                            report "[Line "& INT_TO_STR_RAM(lineno) & "]:Illegal record type in Intel Hex File! "
                            severity error;
                    end case;

                    read(l => buf, value => checksum, good => booval);

                    if not (booval) then
                        assert false
                        report "[Line "& INT_TO_STR_RAM(lineno) & "]:Checksum is missing! "
                        severity error;
                    end if;

--                    check_sum_vec := unsigned(not (check_sum_vec)) + 1;
                    check_sum_vec := (not (check_sum_vec)) + 1;
                    check_sum_vec_tmp := conv_std_logic_vector(HEX_STR_TO_INT(checksum),8);

                    if (unsigned(check_sum_vec) /= unsigned(check_sum_vec_tmp)) then
                        assert false
                        report "[Line "& INT_TO_STR_RAM(lineno) & "]:Incorrect checksum!"
                        severity error;
                    end if;
                end loop;

                file_close(mem_data_file);
            end if;

            mem_init <= true;

        -- end of initialization

        else

            if (i_wren_tmp_a'event or i_wraddress_tmp_a'event or 
                i_wraddress_lo_a'event or i_data_tmp_a'event or i_wren_lo_a'event or 
                i_wren_tmp_b'event or i_wraddress_tmp_b'event or i_wren_lo_b'event or 
                i_wraddress_lo_b'event or i_data_tmp_b'event) then

                if ((write_at_low_clock_a = true)  and
                    (write_at_low_clock_b = true)) then
                   if ((both_clk_trigger = '1') and (inclock_a = '0') and
                       (inclock_b = '0')) then
                       simultaneous_write := true;
                   else
                       simultaneous_write := false;
                   end if;
               else
                   simultaneous_write := true;
               end if;

               if ((i_wren_tmp_a = '1') and (i_wren_tmp_b = '1') and
                   (inclock_a = '0') and (inclock_b = '0') and
                   (simultaneous_write = true) and ((op_mode mod 5) > 0)) then -- QP mode or BDP mode

                   j := conv_integer(i_wraddress_tmp_a) * width_write_a;
                   k := conv_integer(i_wraddress_tmp_b) * width_write_b;
                   n := conv_integer(i_wraddress_tmp_a);

                   if ((op_mode mod 5) = 2) then -- BDP mode
                       for i in 0 to (width_write_b - 1) loop
                           l := (k + i) mod width_write_a;
                           m := (k + i) / width_write_a;

                           if ((n = m) and (l < width_write_a)) then

                               mem_wr_data(m)(l) := 'X';
                               simultaneous_write := true;
                           else
                               simultaneous_write := false;
                           end if;

                       end loop;
                   else -- QP mode
                       for i in 0 to (width_write_a - 1) loop

                           for m in 0 to (width_write_b - 1) loop
                               l := (j + i) / width_read_a;
                               p := (j + i) mod width_read_a;

                               if ((l = ((k + m) / width_read_a)) and
                                   (p = ((k + m) mod width_read_a))) then
                                    mem_rd_data(l)(p) := 'X';
                                    simultaneous_write := true;
                                else
                                    simultaneous_write := false;
                                end if;
                            end loop;

                        end loop;
                    end if;

                else
                    simultaneous_write := false;
                end if;

                if not (simultaneous_write) then

                    --write from data port a
                    if ((i_wren_tmp_a = '1') and (inclock_a = '0') and
                        (op_mode mod 6 > 1)) then                -- not ROM mode

                        if (op_mode mod 6 = 2) then              -- SP or BDP mode
                            j := conv_integer(i_wraddress_tmp_a);
                            mem_wr_data(j) := i_data_tmp_a;
                        else                                -- QP or DP mode
                            j := conv_integer(i_wraddress_tmp_a) * width_write_a;

                            for i in 0 to (width_write_a - 1) loop
                                mem_rd_data((j+i)/width_read_a)((j+i) mod width_read_a) := i_data_tmp_a(i);
                            end loop;
                        end if;
                    end if;

                    --write from data port b
                    if ((i_wren_tmp_b = '1') and (inclock_b = '0') and
                        ((op_mode mod 5) > 0)) then                -- QP or BDP mode

                        j := conv_integer(i_wraddress_tmp_b) * width_write_b;

                        if ((op_mode mod 5) = 2) then              -- BDP mode
                            for i in 0 to (width_write_b - 1) loop
                                mem_wr_data((j+i)/width_write_a)((j+i) mod width_write_a) := i_data_tmp_b(i);
                            end loop;
                        else                                -- QP mode
                            for i in 0 to (width_write_b - 1) loop
                                mem_rd_data((j+i)/width_read_a)((j+i) mod width_read_a) := i_data_tmp_b(i);
                            end loop;
                        end if;

                    end if;
                end if;
            end if;

            --read data to data port a
            if ((op_mode mod 6) = 3) then                  -- QP or DP mode
                if (i_rden_tmp_a = '1') then
                    j := conv_integer(i_rdaddress_tmp_a);
                    i_q_tmp_a <= mem_rd_data(j);
                end if;
            elsif ((op_mode mod 6) = 2) then               -- BDP or SP mode
                j := conv_integer(i_wraddress_tmp_a);
                i_q_tmp_a <= mem_wr_data(j);
            elsif ((op_mode mod 6) = 1) then               -- ROM mode
                j := conv_integer(i_rdaddress_tmp_a);
                i_q_tmp_a <= mem_rd_data(j);
            end if;

            --read data to data port b
            if ((op_mode mod 5) = 3) then                  -- QP mode
                if (i_rden_tmp_b = '1') then
                    j := conv_integer(i_rdaddress_tmp_b) * width_read_b;

                    for i in 0 to (width_read_b - 1) loop
                        i_q_tmp_b(i) <= mem_rd_data((j+i)/width_read_a)((j+i) mod width_read_a);
                    end loop;

                end if;
            elsif ((op_mode mod 5) = 2) then               -- BDP mode
                j := conv_integer(i_wraddress_tmp_b) * width_write_b;

                for i in 0 to (width_write_b - 1) loop
                    i_q_tmp_b(i) <= mem_wr_data((j+i)/width_write_a)((j+i) mod width_write_a);
                end loop;

            end if;

        end if;

    end process MEMORY;

end behavior;

-- END OF ARCHITECTURE ALTQPRAM

