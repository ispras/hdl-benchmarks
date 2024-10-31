`include "sdlx.h"
`include "alu.h"

//
// misc.v: DataMem, Register, OneBitReg, Mux, Add4, SignExt, ZTest, Clock
//

module DataMem (Addr, DataIn, DataOut, MemRW, Clk);
   input   [`ADDR] Addr;
   input [`DATA]   DataIn;
   output [`DATA]  DataOut;
   input 	   MemRW;
   input 	   Clk;

   reg [`BYTE] 	   DMEM[0:`DMEMSIZE-1];
   wire [`DATA]    DataOut = DMEM[Addr];
   integer 	   i;
   

   initial
      begin
	 for(i=0;i<`DMEMSIZE;i=i+1)
	    begin
	       DMEM[i]=0;
	    end // for (i=0;i<`MEMSIZE;i++)
      end // initial begin
   
   always @(negedge Clk) begin
      if (MemRW)
	 DMEM[Addr] = DataIn;
   end

endmodule /* DataMem */

module Register (RegOut, RegIn, RegRW, Clk);
   output  [`DATA] RegOut;
   input [`DATA]   RegIn;
   input 	   RegRW;
   input 	   Clk;

   // parameter delay = 2;

   reg     [`DATA] RegBuf;
   initial
      begin
	 RegBuf = 0;
      end

   
   wire [`DATA]    RegOut = RegBuf;

   always @(negedge Clk) begin
      if (RegRW) #2 RegBuf = RegIn;
   end

endmodule /* Register */
module Register32 (RegOut, RegIn, RegRW, Clk);
   output  [`DATA1] RegOut;
   input [`DATA1]   RegIn;
   input 	    RegRW;
   input 	    Clk;

   // parameter delay = 2;
   reg     [`DATA1] RegBuf;
   initial
      begin
	 RegBuf = 0;
      end

   wire [`DATA1]    RegOut = RegBuf;

   always @(negedge Clk) begin
      if (RegRW)
// #2
	  RegBuf = RegIn;
   end

endmodule /* Register32 */


module OneBitReg (RegOut, RegIn, RegRW, Clk);
   output  RegOut;
   input   RegIn;
   input   RegRW;
   input   Clk;

   // parameter delay = 2;
   reg 	   RegBuf;
   initial
      RegBuf = 0;
   
   wire    RegOut = RegBuf;

   always @(negedge Clk) begin
      if (RegRW) 
//#2 
	  RegBuf = RegIn;
   end

endmodule /* OneBitReg */

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

//   wire [`DATA]    O = S ? {{6 {I[25]}}, I} : {{16 {I[15]}}, I[15:0]};
//   wire [`DATA]    O = S ? {{2 {I[1]}}, I} : {{2 {I[1]}}, I};
 //  wire [`DATA]    O = S ? {{2'b00x}, I} : {{2'b00}, I};
   wire [`DATA]    O=I;
   
endmodule  /* SignExt */

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
      clk = 0;

   always
      #(`CLOCKPERIOD / 2)     clk = ~clk;

endmodule /* Clock */













