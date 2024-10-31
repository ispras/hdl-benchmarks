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

// picdram stands for PIC "Data" RAM.
//
//
// Synchronous Data RAM, 8 bits wide, N words deep.
//
// ** Must support SYNCHRONOUS WRITEs and ASYNCHRONOUS READs **
//    This is so that we can do a Read/Modify/Write in one cycle which
//    is required to do something like this:
//
//       incf 0x20, f   // M[20] <= M[20] + 1
//       incf 0x22, f   // M[22] <= M[22] + 1
//       incf 0x18, f   // M[18] <= M[18] + 1
//
// Replace with your actual memory model..
//
module dram (
   clk,
   address,
   we,
   din,
   dout
);

input		clk;
input [6:0]	address;
input		we;
input [7:0]	din;
output [7:0]	dout;

// Number of data memory words.  This is somewhat tricky, since remember
// that lowest registers (e.g. special registers) are not really in this
// data memory at all, but are explicit registers at the top-level.  Also,
// the banking scheme has some of the other registers in each bank being
// mapped to the same physical registers.  The bottom line is that for
// the 16C57, you at most need to set this to 72.  Note we are reserving
// the last 2 words for our little "expansion circuit" so we really want
// only 70.
//

parameter word_depth = 70; // Maximum minus 2 words for expansion circuit demo
//parameter word_depth = 24;  // This would be like a 16C54 

// reg [6:0]	address_latched; <--- NO!  We need ASYNCHRONOUS READs

// Instantiate the memory array itself.
reg [7:0]	mem[0:word_depth-1];

// Latch address <--- NO! 
//always @(posedge clk)
//   address_latched <= address;
   
// READ
//assign dout = mem[address_latched];

// ASYNCHRONOUS READ
assign dout = mem[address];

// SYNCHRONOUS WRITE
always @(posedge clk)
   if (we) mem[address] <= din;

endmodule
