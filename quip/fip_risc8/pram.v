/* ***********************************************************************
  The Free IP Project
  Free-RISC8 -- Verilog 8-bit Microcontroller
  (c) 1999, The Free IP Project and Thomas Coonan


  FREE IP GENERAL PUBLIC LICENSE
  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION

  1.  You may copy and distribute verbatim copies of this core, as long
      as this file, and the other associated files, remain intact and
      unmodified.  Modifications are outlined below.  
  2.  You may use this core in any way, be it academic, commercial, or
      military.  Modified or not.  
  3.  Distribution of this core must be free of charge.  Charging is
      allowed only for value added services.  Value added services
      would include copying fees, modifications, customizations, and
      inclusion in other products.
  4.  If a modified source code is distributed, the original unmodified
      source code must also be included (or a link to the Free IP web
      site).  In the modified source code there must be clear
      identification of the modified version.
  5.  Visit the Free IP web site for additional information.
      http://www.free-ip.com

*********************************************************************** */

//
// Synchornous Data RAM, 12x2048
//
// Replace with your actual memory model..
//
module pram (
   clk,
   address,
   we,
   din,
   dout
);

input		clk;
input [10:0]	address;
input		we;
input [11:0]	din;
output [11:0]	dout;

// synopsys translate_off
//parameter word_depth = 2048;
//
//reg [10:0]	address_latched;
//
//// Instantiate the memory array itself.
//reg [11:0]	mem[0:word_depth-1];
//
//// Latch address
//always @(posedge clk)
//   address_latched <= address;
//   
//// READ
//assign dout = mem[address_latched];
//
//// WRITE
//always @(posedge clk)
//   if (we) mem[address] <= din;
//
// synopsys translate_on

endmodule
