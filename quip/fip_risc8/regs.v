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

`define DEBUG_SHOWREADS
`define DEBUG_SHOWWRITES

// Memory Map:
//
// PIC Data Memory addressing is complicated.  See the Data Book for full explanation..
//
// Basically, each BANK contains 32 locations.  The lowest 16 locations in ALL Banks
// are really all mapped to the same bank (bank #0).  The first 8 locations are the Special
// registers like the STATUS and PC registers.  The upper 16 words in each bank, really are
// unique to each bank.  The smallest PIC (16C54) only has the one bank #0.
//
// So, as a programmer, what you get is this.  No matter what bank you are in (FSR[6:5])
// you always have access to your special registers and also to registers 8-15.  You can
// change to a 1 of 4 banks by setting FSR[6:5] and get 4 different sets of registers
// 16-31.
//
//
//   bank location 
//     XX 00rrr  -  The special registers are not implemented in this register file.
//     XX 01rrr  -  The 8 common words, just above the Special Regs, same for all Banks
//     00 1rrrr  -  The 16 words unique to Bank #0
//     01 1rrrr  -  The 16 words unique to Bank #1
//     10 1rrrr  -  The 16 words unique to Bank #2
//     11 1rrrr  -  The 16 words unique to Bank #3
//
//  So, 
//     Special Regs are location[4:3] == 00
//     Common Regs are  location[4:3] == 01
//     Words in banks   location[4]   == 1
// 
//  Remap to a new single memory space.  Remap in chunks of 8 words.  The PIC words
//  will get remapped to the RAM in a contiguous manner.  The Common registers are
//  mapped to the first 8 words of our RAM.  Next, each bank's words in the upper
//  half of the bank are mapped to the RAM in a contiguous manner:
//
//      PIC View        Our RAM
//   bank location      Address
//     00 01rrr  =>     0  -   7   (common words)
//     00 10rrr  =>     8  -  15
//     00 11rrr  =>    16  -  23
//     01 01rrr  =>     0  -   7   (common words)
//     01 10rrr  =>    24  -  31
//     01 11rrr  =>    32  -  39
//     10 01rrr  =>     0  -   7   (common words)
//     10 10rrr  =>    40  -  47
//     10 11rrr  =>    48  -  55
//     11 01rrr  =>     0  -   7   (common words)
//     11 10rrr  =>    56  -  63
//     11 11rrr  =>    64  -  71 <-- last four locations are not implemented
//
// 
//
module regs (clk, reset, we, re, bank, location, din, dout);

input		clk;
input		reset;
input		we;
input		re;
input  [1:0]	bank;		// Bank 0,1,2,3
input  [4:0]	location;	// Location
input  [7:0]	din;		// Input 
output [7:0]	dout;		// Output 

// The top-level modulke, piccpu, is supposed to garuntee that re and we
// are asserted for only valid locations.  So, we don't need to worry about
// safely mapping invalid addresses.
//

reg [6:0]	final_address;

// Instatiate the final memory model.
//
dram dram (
   .clk		(clk),
   .address	(final_address),
   .we		(we),
   .din		(din),
   .dout	(dout)
);

// The final_address is our remapped address.  This combinational logic
// is performed immediate on the input address signals, before any latching.
// This is because a WRITE doesn't use the latched values whereas the READ does.
//
always @(bank or location) begin
   casex ({bank, location})
      // First, let's handle the locations that all get mirrored back
      // into the bank #0 words from 8-15.
      //
      7'b00_01XXX: final_address = {4'b0000, location[2:0]};
      7'b01_01XXX: final_address = {4'b0000, location[2:0]};
      7'b10_01XXX: final_address = {4'b0000, location[2:0]};
      7'b11_01XXX: final_address = {4'b0000, location[2:0]};
      
      // Now, handle words in the upper halves of each bank.
      //
      // Bank #0
      7'b00_10XXX: final_address = {4'b0001, location[2:0]};
      7'b00_11XXX: final_address = {4'b0010, location[2:0]};

      // Bank #1
      7'b01_10XXX: final_address = {4'b0011, location[2:0]};
      7'b01_11XXX: final_address = {4'b0100, location[2:0]};
      
      // Bank #2
      7'b10_10XXX: final_address = {4'b0101, location[2:0]};
      7'b10_11XXX: final_address = {4'b0110, location[2:0]};
      
      // Bank #3
      7'b11_10XXX: final_address = {4'b0111, location[2:0]};
      7'b11_11XXX: final_address = {4'b1000, location[2:0]};
      
      default:     final_address = {4'b0000, location[2:0]};
   endcase
end

endmodule
