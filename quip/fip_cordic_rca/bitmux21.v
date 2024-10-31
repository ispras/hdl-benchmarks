
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
module BitMux2_1 (out,a,b,select);
        output out;
        input a,b,select;
reg out;

always @ (select or a or b)
	case (select)
		1'b0:  out <= a;
		1'b1:  out <= b;
		default:  out <= b;
	endcase
endmodule //BitMux2_1

