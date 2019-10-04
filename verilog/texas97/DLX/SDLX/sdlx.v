// sdlx.v

//
// $Id: sdlx.v,v 1.1 1997/11/24 22:09:56 ritu Exp ritu $
//

//
// $Log: sdlx.v,v $
// Revision 1.1  1997/11/24 22:09:56  ritu
// Initial revision
//

`include "sdlx.h"
`include "alu.h"

module sdlx;    // top module

   
   reg     [31:0] IMEM[0:`IMEMSIZE-1];
   reg 		  Reset;
   integer 	  i;
   
   initial
      begin
	 // for(i=0;i<`IMEMSIZE;i=i+1)
	 //  begin
	    //   IMEM[i]=i;
	 Reset = 0;
	 IMEM[0]=32'b00100000000000010000000000000110;
	 IMEM[1]=32'b00100000000000100000000000000011;
	 IMEM[2]=32'b00000000001000100000100000100000;
	 IMEM[3]=32'b10101100000000010000000000000000;
	 //end // initial begin
      end   
   wire            clk;
   
   wire [`ADDR]    pcin, npcin;
   wire [`DATA]    aluain, alubin, aluout;
   wire [`ALUO]    ALUOp;
   wire [`ALUC]    ALUCtrl;
   wire [`DATA]    wb2rf, rf2a, rf2b;
   wire [`RDDR]    rd;
   wire [`DATA]    dmemout;
   wire [`ADDR]    PC,NPC;
   wire [`DATA1]   IR;
   wire [`DATA]    I,iin;
   wire [`DATA1]    A, B, ALUOut,
		   MD;
   wire 	   BC, bcin;

   Clock           Clock           (clk);

   Register32      IRReg           (IR, IMEM[PC],IRRW,clk);
   Register        PCReg           (PC, pcin, PCRW, clk);
   Register        NPCReg          (NPC, npcin, NPCRW, clk);
   Register        AReg            (A, rf2a, ARW, clk);
   Register        BReg            (B, rf2b, BRW, clk);
   Register        IReg            (I, iin, IRW, clk);
   Register        ALUOutReg       (ALUOut, aluout, ALUoutRW, clk);
   Register        MDReg           (MD, dmemout, MDRW, clk);
   OneBitReg       BCReg           (BC, bcin, BCRW, clk);

   RegFile         RegFile         (`RRS1, `RRS2, rd, wb2rf, rf2a, rf2b, RegRW, clk);
   DataMem         DataMem         (ALUOut, B, dmemout, MemRW, clk);
   Control         Control (
			    IR,
			    // Register control
			    IRRW,
			    PCRW,
			    NPCRW,
			    ARW,
			    BRW,
			    IRW,
			    ALUoutRW,
			    MDRW,
			    BCRW,
			    // Functional Units and MUXs
			    ZSel,
			    BraE,
			    JmpE,
			    RegDst,
			    ALUInA,
			    ALUInB,
			    SESel,
			    WBSel,
			    ALUOp,
			    RegRW,
			    MemRW,
			    
			    Reset,
			    clk) ;

   ALUControl      ALUControl      (ALUOp, `OPCODE, `FUNC, ALUCtrl);
   ALU             ALU             (aluain, alubin, aluout, ALUCtrl);

   SignExt         SignExt         (SESel, `OFFSET, iin);
   Add4            Add4            (PC, npcin);
   ZTest           ZTest           (ZSel, A, bcin);

   Mux             PCMux           ((BC & BraE) | JmpE, NPC, ALUOut, pcin);
   RddrMux         RDMux           (RegDst, `IRD, `RRD, rd);
   Mux             ALUAInMux       (ALUInA, NPC, A, aluain);
   Mux             ALUBInMux       (ALUInB, B, I, alubin);
   Mux             WBMux           (WBSel, MD, ALUOut, wb2rf);


// Reset machine


/*   task apply_reset;
 begin
 Reset = 1;
 #`CLOCKPERIOD ;
 Reset = 0;
 PCReg.RegBuf = 0;
 BCReg.RegBuf = 0;
      end
   endtask
 
 initial begin : load_prog
 integer i;
 */    
   //      addition with immediate operands - COMMENT ME OUT :)
   //$readmemb("addi.s", IMEM); 

   
   
   // addition with operands from data memory
   //$readmemb("add.s", IMEM);
   //$readmemh("add.d", sdlx.DataMem.DMEM);
   
   /*
   
    if (`dbg) begin
    $display(" Loaded program:");
    for(i=0; i<4; i=i+1)
    $display(" %d> %b", i, IMEM[i]);
   end
    if (`dbg)
    $monitor($time, ":%b> %h %h %h %h %h %h",
    clk, PC, NPC, IR, RegFile.R1.RegBuf,
    RegFile.R2.RegBuf, RegFile.R3.RegBuf);
    else if (`vbs)
    $monitor($time, ":%b> %h %h %h %h %h %h %h %h %h",
    clk, PC, NPC, IR, aluain, alubin, ALUOut, RegFile.R1.RegBuf,
    RegFile.R2.RegBuf, RegFile.R3.RegBuf);
    
    */
  /*        $monitor($time, "> %h %h %h", PC, NPC, IR);

 apply_reset;
 end
 
 initial
 #1000 $stop;
 
   */
endmodule /* sdlx */


`include "misc.v"
`include "control.v"
`include "regfile.v"
`include "alu.v"
