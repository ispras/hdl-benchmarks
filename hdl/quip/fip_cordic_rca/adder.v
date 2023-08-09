
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//--  The Free IP Project
//--  Verilog Free-CORDIC Core
//--  (c) 2000, The Free IP Project and Rohit Sharma (srohit@free-ip.com)
//--
//--
//--  FREE IP GENERAL PUBLIC LICENSE
//--  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION
//--
//--  1.  You may copy and distribute verbatim copies of this core, as long
//--      as this file, and the other associated files, remain intact and
//--      unmodified.  Modifications are outlined below.
//--  2.  You may use this core in any way, be it academic, commercial, or
//--      military.  Modified or not.
//--  3.  Distribution of this core must be free of charge.  Charging is
//--      allowed only for value added services.  Value added services
//--      would include copying fees, modifications, customizations, and
//--      inclusion in other products.
//--  4.  If a modified source code is distributed, the original unmodified
//--      source code must also be included (or a link to the Free IP web
//--      site).  In the modified source code there must be clear
//--      identification of the modified version.
//--  5.  Visit the Free IP web site for additional information.
//--      http://www.free-ip.com
//--
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------

`include "header.v"

module Adder (S, sign, Asign, A, B, AS);
        output [`REG_SIZE:0] S;
        output sign;
        input [`REG_SIZE:0] A,B;
        input Asign,AS;

        wire [`REG_SIZE:0] Atemp,Btemp,Btemp1,Stemp;
        reg [`REG_SIZE:0] CIN;
        wire Y_1,Y_2,Y_3,Y_4;

        assign Y_1 = (~AS) & Asign;

        BusMux2_1 MUX_0 (Atemp,A,B,Y_1); // xchange A & B
        BusMux2_1 MUX_1 (Btemp,B,A,Y_1);

        assign Y_2 = Asign ^ AS;

        integer i;
always @ (Y_2)
        begin
                for(i=0;i<`REG_SIZE+1;i=i+1)
                CIN[i] <= Y_2;
        end
        assign Btemp1 = Btemp ^ CIN;

        RCA Add (Stemp,Y_3,Atemp,Btemp1,Y_2); // Addition

        assign Y_4 = (~Y_3) & (Asign ^ AS);

        complement Compl (S,Stemp,Y_4);  // 2's Complement if result neg.
        assign sign = (~Y_3 & AS) | (~Y_3 & Asign) | (AS & Asign);

endmodule // Adder

