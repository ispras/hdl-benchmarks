//****************************************************************
// File " regfile.v " : No modifications done.
// The register file has 32 32bit registers

// Call Register Module in misc.v
//In vis we cannot pass 32 arguments so I have broken down the RegMux to 
// into 2 part and then added another module Reg_Mux_4


//****************************************************************


`include "alu.h"
`include "sdlx.h"


module RegFile (
        RdReg1,
        RdReg2,
        WrtReg,
        WrtData,
        R1Out,
        R2Out,
        RegWrite,
        Clk 
		 );

//wire Clk;
//Clock Clock(Clk);
input   [`RDDR] RdReg1, RdReg2, WrtReg;  
// **length `REGWIDTH - 1 = 2
// **RdReg1 RdReg2 are the register no to be read in
// **WrtReg is the Reg no to be written into 

input   [`DATA] WrtData; 
// ** data has to be written into regfile

output  [`DATA] R1Out; 
//** output if data has to read out 
output  [`DATA]  R2Out; 
//** output if data has to read out

input           RegWrite; 
// **high if u write into a reg file
input           Clk;

wire    [`DATA] R1Out;
wire    [`DATA] R2Out;



   wire [`DATA] r0, r1, r2, r3, r4, r5, r6, r7;

wire    rw0  = WrtReg ==  0 && RegWrite,
        rw1  = WrtReg ==  1 && RegWrite,
        rw2  = WrtReg ==  2 && RegWrite,
        rw3  = WrtReg ==  3 && RegWrite,
        rw4  = WrtReg ==  4 && RegWrite,
        rw5  = WrtReg ==  5 && RegWrite,
        rw6  = WrtReg ==  6 && RegWrite,
	rw7  = WrtReg ==  7 && RegWrite;
   

 Register R0  ( r0, 4'b0000, rw0, Clk),
        R1  ( r1, WrtData, rw1, Clk),
         R2  ( r2, WrtData, rw2, Clk),
         R3  ( r3, WrtData, rw3, Clk),
         R4  ( r4, WrtData, rw4, Clk),
         R5  ( r5, WrtData, rw5, Clk),
         R6  ( r6, WrtData, rw6, Clk),
         R7  ( r7, WrtData, rw7, Clk);
   

RegMux R1_1Mux(RdReg1, R1Out,
        r0, r1, r2, r3, r4, r5, r6, r7);


RegMux R2_1Mux(RdReg2, R2Out,
        r0, r1, r2, r3, r4, r5, r6, r7);

endmodule /* RegFile */


module RegMux (S, RegOut,
        r0, r1, r2, r3,r4,r5,r6,r7);
input   [`RDDR] S;
output  [`DATA] RegOut;
input   [`DATA] r0, r1, r2, r3, r4, r5, r6, r7;
// ** if the S is equal to i, then assign ri to RegOut
assign  RegOut = 
		 S == 0  ? r0 :
                 S == 1  ? r1 :
                 S == 2  ? r2 :
                 S == 3  ? r3 :
                 S == 4  ? r4 :
                 S == 5  ? r5 :
                 S == 6  ? r6 :r7;
                 
                
endmodule /* RegMux */

// ***************************************************************************
//                     END RegMux
// **********************************************************************module





