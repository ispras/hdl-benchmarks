
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

// MH:
`include "header.v"

module MEM (iteration, tanangle ) ;


    output [`REG_SIZE:0] tanangle ;
    input [3:0] iteration ;

reg [`REG_SIZE:0] tanangle ;

always @ (iteration)

  case (iteration)

                      //tanInverseX            |X             |tanInverseX
                      //=======================|==============|===========
    4'b0000: tanangle <= 16'b00101101_00000000 ; //  1.000000 |45.000000
    4'b0001: tanangle <= 16'b00011010_11111111 ; //  0.500000 |26.565051
    4'b0010: tanangle <= 16'b00001110_00001111 ; //  0.250000 |14.036243
    4'b0011: tanangle <= 16'b00000111_00111111 ; //  0.125000 |7.125016
    4'b0100: tanangle <= 16'b00000011_11111111 ; //  0.062500 |3.576334
    4'b0101: tanangle <= 16'b00000001_11111111 ; //  0.031250 |1.789911
    4'b0110: tanangle <= 16'b00000000_11111111 ; //  0.015625 |0.895174
    4'b0111: tanangle <= 16'b00000000_01111111 ; //  0.007812 |0.447614
    4'b1000: tanangle <= 16'b00000000_00111111 ; //  0.003906 |0.223811
    4'b1001: tanangle <= 16'b00000000_00011111 ; //  0.001953 |0.111906
    4'b1010: tanangle <= 16'b00000000_00001111 ; //  0.000977 |0.055953
    4'b1011: tanangle <= 16'b00000000_00000111 ; //  0.000488 |0.027976
    4'b1100: tanangle <= 16'b00000000_00000011 ; //  0.000244 |0.013988
    4'b1101: tanangle <= 16'b00000000_00000001 ; //  0.000122 |0.006994
    4'b1110: tanangle <= 16'b00000000_00000000 ; //  0.000061 |0.003497
    4'b1111: tanangle <= 16'b00000000_00000000 ; //  0.000031 |0.001749

   endcase

endmodule 
