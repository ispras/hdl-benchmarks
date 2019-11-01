//
// misc.v: DataMem, InstMem, Register, OneBitReg, ThreeBitReg, FiveBitReg,
//         Mux, Add4, SignExt, ZTest, Clock
//
`include "pdlx.h"

module DataMem (Addr, DataIn, DataOut, MemRW, Clk);
   input   [`DATA] Addr;
   input [`DATA]   DataIn;
   output [`DATA]  DataOut;
   input 	   MemRW;
   input 	   Clk;
   
   reg [`DATA] 	   DataOut;
   reg [`BYTE] 	   DMEM[0:`MEMSIZE-1];
   integer 	   i;
   
   initial
      begin
	 for(i=0;i<`MEMSIZE;i=i+1)
	    DMEM[i]=0;
	 DataOut=0;
	 
      end
   
   always @(negedge Clk) begin
      if (MemRW) begin
	 DMEM[Addr] = DataIn;
      end
      else
	 DataOut = DMEM[Addr];
   end

endmodule /* DataMem */


module InstMem (Addr, DataOut, Reset, Clk);
   input   [`DATA] Addr;
   output [`DATA1] DataOut;
   input 	   Reset;
   input 	   Clk;

   reg [31:0] 	   DataOut;
   reg [31:0] 	   IMEM[0:`MEMSIZE-1];
   integer 	   i;
   
   initial
      begin
	 for(i=0;i<`MEMSIZE;i=i+1)
	    // begin
	    IMEM[i]=32'b0000000000000000000000;
	 DataOut=0;
	 
      end // for (i=0;i<`MEMSIZE;i=i+1)
   
   

   always @(negedge Clk) begin
      
      if (Reset)
	 begin
	    IMEM[Addr]=IMEM[Addr];
	    DataOut = 0;
	 end
      else
	 DataOut = IMEM[Addr];
   end

endmodule /* InstMem */


module Register (RegOut, RegIn, RegRW, Clk);
   output  [`DATA] RegOut;
   input [`DATA]   RegIn;
   input 	   RegRW;
   input 	   Clk;

   // delay = 2;

   reg [`DATA] 	   RegBuf;
   initial 
      RegBuf=0;
   wire [`DATA]    RegOut = RegBuf;
   
   
   always @(posedge Clk) 
      if (RegRW) #2 RegBuf = RegIn;
   
endmodule /* Register */

module Register32 (RegOut, RegIn, RegRW, Clk);
   output  [`DATA1] RegOut;
   input [`DATA1]   RegIn;
   input 	    RegRW;
   input 	    Clk;
   
   // delay = 2;
   
   reg [`DATA1]     RegBuf;
   initial 
      RegBuf = 0;
   wire [`DATA1]    RegOut = RegBuf;
   
   
   always @(posedge Clk) 
      if (RegRW) #2 RegBuf = RegIn;
   
endmodule /* Register32 */


module OneBitReg (RegOut, RegIn, RegRW, Clk);
   output  RegOut;
   input   RegIn;
   input   RegRW;
   input   Clk;
   
   //parameter delay = 2;
   
   reg 	   RegBuf;
    initial 
       RegBuf =0;
   wire    RegOut = RegBuf;
   
   
   always @(posedge Clk) 
      if (RegRW) #2 RegBuf = RegIn;
   
endmodule /* OneBitReg */


module ThreeBitReg (RegOut, RegIn, RegRW, Clk);
   output  [2:0]   RegOut;
   input [2:0] 	   RegIn;
   input 	   RegRW;
   input 	   Clk;
   
   // parameter delay = 2;
   
   reg [2:0] 	   RegBuf;
   initial RegBuf =0;
   wire [2:0] 	   RegOut = RegBuf;
  
   
   always @(posedge Clk) 
      if (RegRW) #2 RegBuf = RegIn;

endmodule /* ThreeBitReg */
module FiveBitReg (RegOut, RegIn, RegRW, Clk);
   output  [4:0]   RegOut;
   input [4:0] 	   RegIn;
   input 	   RegRW;
   input 	   Clk;

   // parameter delay = 2;

   reg [4:0] 	   RegBuf;
    initial RegBuf =0;
   wire [4:0] 	   RegOut = RegBuf;
  
   
   always @(posedge Clk) 
      if (RegRW) #2 RegBuf = RegIn;

endmodule /* FiveBitReg */


module Mux (S, A, B, Z);

   input           S;      // Select line
   input [`DATA]   A;      // input A
   input [`DATA]   B;      // input B
   output [`DATA]  Z;      // output

   wire [`DATA]    Z = S ? B : A;

endmodule /* Mux */


module RddrMux (S, A, B, Z);

   input           S;      // Select line
   input [`RDDR]   A;      // input A
   input [`RDDR]   B;      // input B
   output [`RDDR]  Z;      // output

   wire [`RDDR]    Z = S ? B : A;

endmodule /* RddrMux */


module Add4 (I, O);

   input   [`DATA] I;      // input
   output [`DATA]  O;      // output

   wire [`DATA]    O = I + 1;

endmodule /* Add4 */


module SignExt (S, I, O);

   input           S;
   input [1:0] 	   I;      // input
   output [`DATA]  O;      // output

   wire [`DATA]    O = S ? {2'b00, I} : {2'b00,I };

endmodule /* SignExt */


module ZTest (S, I, Out);

   input           S;      // S ? nez : eqz
   input [`DATA]   I;      // input
   output 	   Out;    // output

   wire 	   Out = S ? ((I !== 0) ? 1 : 0) : ((I === 0) ? 1 : 0);

endmodule /* ZTest */


module Clock (clk);
   output clk;
   reg 	  clk;

   initial
      clk = 1;

   always
      #(`CLOCKPERIOD / 2)     clk = ~clk;

endmodule /* Clock */










