
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
/************************Test Case *****************

module test ;

reg [`REG_SIZE:0]  datain ;
wire [`REG_SIZE:0] dataout ;
reg enable ;

initial
    begin
    enable = 1 ;
    datain = 12'b110011001100;
    $monitor ( "datain = %b \t dataout = %b", datain, dataout );
    #10 enable = 0 ;
    $display ( "datain = %b \t dataout = %b", datain, dataout );
    end

complement  testc (dataout, datain, enable);

endmodule

************************Test Case *****************/

`include "header.v"

module complement (dataout, datain, enable);
        output [`REG_SIZE:0] dataout;
        input  [`REG_SIZE:0] datain;
        input  enable;


        reg [`REG_SIZE:0] Co, dataout, Enable;
        reg Cin;
        integer i,j;

always @ (enable)
        begin
        for(j=0;j<`REG_SIZE+1;j=j+1)
                Enable[j] = enable;
        end

        wire [`REG_SIZE:0] A = datain ^ Enable;


        always @ (enable)
                begin
                case (enable)
                        1'b0:  Cin = 1'b0;
                        1'b1:  Cin = 1'b1;
                        default:  Cin = 1'b1;
                endcase
                end



always @ (A or Cin )
        begin
           dataout[0] = A[0] ^ Cin;
           Co[0] = A[0] & Cin;
                for(i = 1; i <=`REG_SIZE; i = i + 1)
                   begin
                        dataout[i] = A[i] ^ Co[i-1];
                        Co[i] = A[i] & Co[i-1];
                   end
        end

endmodule // 2compl delay : BitMux2_1 delay + 12 * HA1 dalay

