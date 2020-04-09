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

// This is an expansion module containing a Direct Digital Synthesizer (DDS).
// Simply put, it is a programmable sinewave generator.  It is used in a little
// example suggesting how a FSK modulator might be done.
//
// Address  Direction   Description
//   7E       R/W         Control:
//                           0  -  Enable.  Must set to '1' to get output.
//   7F       W           DDS Value
//
//    
//
module exp (
   clk,
   reset,

   dds_out,
   
   expdin,
   expdout,
   expaddr,
   expread,
   expwrite
);

input		clk;
input		reset;

output [7:0]	dds_out;	// DDS output

// Expansion Interface
output [7:0]	expdin;		// TO the PIC core.
input [7:0]	expdout;	// FROM the PIC core.
input [6:0]	expaddr;	// Address
input		expread;	// Asserted (high) when PIC is reading FROM us.
input		expwrite;	// Asserted (high) when PIC is writing TO us.

// Outputs used as registers
reg [7:0]	expdin;
reg [7:0]	dds_out;

// Programmable registers
reg [7:0]	ddsstep;
reg [0:0]	ctl;

// *** DDS ***

reg [9:0]	accum;
reg [7:0]	sinout;
reg [7:0]	sin_rom [0:1023];

// Look up the SIN value.  This is usually implemented as a memory, either
// a RAM or a ROM.  It is therefore highly dependent on the particular
// technology and is not really explored in this simple example.  We will
// simply declare a big register array, and read the SIN data from a file
// at the start of the simulation.
//
initial begin
   $display ("Reading in SIN data for example DDS in EXP.V from sindata.hex");
   $readmemh ("sindata.hex", sin_rom);
end

always @(posedge clk) begin
   if (reset) begin
      accum <= 0;
   end
   else begin
      accum <= accum + ddsstep;
   end
end

always @(posedge clk) begin
   if (reset) begin
      sinout <= 0;
   end
   else begin
      sinout <= sin_rom[accum];
   end
end

always @(posedge clk) begin
   if (reset) begin
      dds_out <= 0;
   end
   else begin
      if (ctl[0]) begin
         dds_out <= sinout;
      end
      else begin
         dds_out <= 0;
      end
   end
end





// Drive the expdin bus back to the PIC.  This should just be a MUX.
// For several different expansion submodules, this would be our gateway
// MUX back to the PIC core.
//
always @(expread or expaddr) begin
   if (expread) begin
      case (expaddr)
         7'h7F:    expdin <= ddsstep;
         default:  expdin <= 0;
      endcase
   end
   else begin
      expdin <= 0;
   end
end

// 
always @(posedge clk) begin
   if (reset) begin
      ctl      <= 0;
      ddsstep  <= 0;
   end
   else begin
      if (expwrite) begin
         case (expaddr) // synopsys parallel_case
            7'h7E: ctl     <= expdout[7:0];
            7'h7F: ddsstep <= expdout[7:0];
         endcase
      end
   end
end
endmodule
