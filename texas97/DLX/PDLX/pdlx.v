`include "pdlx.h"
`include "alu.h"

//`include "test.v"
`include "dbgflags.h"
//module main;    // top module
module pdlx;    // top module   
   reg[5:0]         icnt;

   reg 		     Reset;
   wire 	     Clk;
   
   
   wire [`DATA]      updpc, npcin,PC;
   wire [`DATA]      aluain, alubin, aluout;
   wire [`ALUC]      ALUCtrl;
   wire [`DATA]      wb2rf, rf2a, rf2b;
   wire [`RDDR]      rd;
   wire [`DATA]      iin;
   wire [`DATA1]     imemout;
   wire [`DATA]      dmemout;
   wire [`DATA1]     IF_ID_IR, ID_EX_IR, EX_MEM_IR, MEM_WB_IR;
   wire [`DATA]      IF_ID_NPC, ID_EX_NPC,
		     ID_EX_A, ID_EX_B, EX_MEM_B, ID_EX_I, EX_MEM_ALUOut, MEM_WB_ALUOut;
   wire [`DATA]      MEM_WB_MD;
   wire 	     EX_MEM_BC, bcin;
   wire [4:0] 	     ID_EX_EXCTRL, EXCtrl;
   wire [2:0] 	     ID_EX_MEMCTRL, EX_MEM_MEMCTRL, MEMCtrl;
   wire [2:0] 	     ID_EX_WBCTRL, EX_MEM_WBCTRL, MEM_WB_WBCTRL, WBCtrl;
   
   Clock           Clock           (Clk);
   
   initial
      begin
	 Reset =0;
	 icnt =0;
	 end
	 
	 
   // WB/IF
   Register  // #(0) 
      PCReg           (PC, npcin, 1'b1, Clk);


   // Pipe stage: IF
   Add4            Add4            (PC, updpc);
   Mux             PCMux           ((EX_MEM_BC & `MEM_BraE) | `MEM_JmpE, updpc, EX_MEM_ALUOut, npcin);
   InstMem         InstMem         (PC, imemout, Reset, Clk);

   // IF/ID
   Register   //#(0) 
      IF_ID_NPCReg    (IF_ID_NPC, npcin, 1'b1, Clk);
   Register32  // #(0) 
      IF_ID_IRReg     (IF_ID_IR, imemout, 1'b1, Clk);


   // Pipe stage: ID
   RegFile         RegFile         (`RRS1, `RRS2, rd, wb2rf, rf2a, rf2b, `WB_RegRW, Clk);
   RddrMux         RDMux           (`WB_RegDst, `IRD, `RRD, rd);
   SignExt         SignExt         (SESel, `OFFSET, iin);


   // ID/EX
   Register  // #(0) 
      ID_EX_NPCReg    (ID_EX_NPC, IF_ID_NPC, 1'b1, Clk);
   Register   //#(0)
      ID_EX_AReg      (ID_EX_A, rf2a, 1'b1, Clk);
   Register   //#(0) 
      ID_EX_BReg      (ID_EX_B, rf2b, 1'b1, Clk);
   Register   //#(0) 
      ID_EX_IReg      (ID_EX_I, iin, 1'b1, Clk);
   Register32   //#(0) 
      ID_EX_IRReg     (ID_EX_IR, IF_ID_IR, 1'b1, Clk);

   ThreeBitReg //#(0) 
      ID_EX_WBCTRLReg (ID_EX_WBCTRL, WBCtrl, 1'b1, Clk);
   ThreeBitReg //#(0) 
      ID_EX_MEMCTRLReg(ID_EX_MEMCTRL, MEMCtrl, 1'b1, Clk);
   FiveBitReg  //#(0)
      ID_EX_EXCTRLReg (ID_EX_EXCTRL, EXCtrl, 1'b1, Clk);


   // Pipe stage: EX
   ALU             ALU             (aluain, alubin, aluout, ALUCtrl);
   ALUControl      ALUControl      (`EX_ALUOp, `EX_OPCODE, `EX_FUNC, ALUCtrl);
   ZTest           ZTest           (`EX_ZSel, ID_EX_A, bcin);
   Mux             ALUAInMux       (`EX_ALUInA, ID_EX_NPC, ID_EX_A, aluain);
   Mux             ALUBInMux       (`EX_ALUInB, ID_EX_B, ID_EX_I, alubin);


   // EX/MEM
   OneBitReg  //#(0)
      EX_MEM_BCReg    (EX_MEM_BC, bcin, 1'b1, Clk);
   Register  // #(0) 
      EX_MEM_ALUOutReg(EX_MEM_ALUOut, aluout, 1'b1, Clk);
   Register  // #(0)
      EX_MEM_BReg     (EX_MEM_B, ID_EX_B, 1'b1, Clk);
   Register32   //#(0)
      EX_MEM_IRReg    (EX_MEM_IR, ID_EX_IR, 1'b1, Clk);

   ThreeBitReg //#(0)
      EX_MEM_WBCTRLReg(EX_MEM_WBCTRL, ID_EX_WBCTRL, 1'b1, Clk);
   ThreeBitReg //#(0)
      EX_MEM_MEMCTRLReg(EX_MEM_MEMCTRL, ID_EX_MEMCTRL, 1'b1, Clk);


   // Pipe stage: MEM
   DataMem         DataMem         (EX_MEM_ALUOut, EX_MEM_B, dmemout, `MEM_MemRW, Clk);


   // MEM/WB
   Register  // #(0)
      MEM_WB_ALUOutReg(MEM_WB_ALUOut, EX_MEM_ALUOut, 1'b1, Clk);
   Register   //#(0)
      MEM_WB_MDReg    (MEM_WB_MD, dmemout, 1'b1, Clk);
   Register32   //#(0) 
      MEM_WB_IRReg    (MEM_WB_IR, EX_MEM_IR, 1'b1, Clk);

   ThreeBitReg //#(0)
      MEM_WB_WBCTRLReg(MEM_WB_WBCTRL, EX_MEM_WBCTRL, 1'b1, Clk);


   // Pipe stage: WB
   Mux             WBMux           (`WB_WBSel, MEM_WB_MD, MEM_WB_ALUOut, wb2rf);




   Control         Control (
			    IF_ID_IR,
			    EXCtrl,
			    MEMCtrl,
			    WBCtrl,
			    SESel,
			    Reset,
			    Clk
			    );
   
   
   // Reset machine
/*
 task apply_reset;
 begin
 $display (" ");
 $display (" >>>>>>>>>>   Reset Machine   <<<<<<<<<< ");
 $display (" ");
 Reset = 1;
 #(`CLOCKPERIOD/2)
 PCReg.RegBuf       = -4;
 IF_ID_IRReg.RegBuf = `NOP;
 
 // Reset pipe control registers
 ID_EX_WBCTRLReg.RegBuf       = 3'b000;
 ID_EX_MEMCTRLReg.RegBuf      = 3'b000;
	 ID_EX_EXCTRLReg.RegBuf       = 5'b00000;
 EX_MEM_WBCTRLReg.RegBuf      = 3'b000;
 EX_MEM_MEMCTRLReg.RegBuf     = 3'b000;
 MEM_WB_WBCTRLReg.RegBuf      = 3'b000;
 # (`CLOCKPERIOD/2)
 $display (" ");
 $display  (" >>>>>>>>>>    Run program    <<<<<<<<<<");
 $display ( " ");
 Reset                        = 0;
 PCReg.RegBuf                 =  -4;
 IF_ID_NPCReg.RegBuf          = 0;
 IF_ID_IRReg.RegBuf           = `NOP;
 
 EX_MEM_BCReg.RegBuf          = 0;
 icnt = 5'b00000;
 
      end 
   endtask
 */
   //  task showdmem;
   //   integer i;
   // begin
   
   //	 $display(" Data memory:");
   //	 for(i=0; i<24; i=i+4)
   //	    $display(" %d> %h", i,
   //	     {pdlx.DataMem.DMEM[i],pdlx.DataMem.DMEM[i+1],
   //	      pdlx.DataMem.DMEM[i+2],pdlx.DataMem.DMEM[i+3]});
   // end
   //endtask
   
   /*
    initial begin : load_prog
    integer i;
      
    // test code
    $readmemb("addi.s", pdlx.InstMem.IMEM);
    
    if (`dbg) begin
	 $display(" Loaded program:");
    for(i=0; i<4; i=i+1)
    $display(" %d> %b", i, pdlx.InstMem.IMEM[i]);
      end
    
    apply_reset;
   end
    
    
    initial begin
    if (`dbg)
    $monitor("\n%d:%b> instruction %d   PC %h\n  IF/ID: %h %h\n  ID/EX: %h %h %h %h %h   %b %b %b\n EX/MEM: %h %h %h %h  %b %b\n MEM/WB: %h %h %h  %b\n  R1-R6: %h %h %h %h %h %h",
    $time, Clk, icnt, PC,
    IF_ID_NPC, IF_ID_IR,
		  ID_EX_NPC, ID_EX_A, ID_EX_B, ID_EX_I, ID_EX_IR, ID_EX_WBCTRL, ID_EX_MEMCTRL, ID_EX_EXCTRL,
    EX_MEM_BC, EX_MEM_ALUOut, EX_MEM_B, EX_MEM_IR, EX_MEM_WBCTRL, EX_MEM_MEMCTRL,
    MEM_WB_MD, MEM_WB_ALUOut, MEM_WB_IR, MEM_WB_WBCTRL,
    RegFile.R1.RegBuf, RegFile.R2.RegBuf, RegFile.R3.RegBuf,
    RegFile.R4.RegBuf, RegFile.R5.RegBuf, RegFile.R6.RegBuf);
    else if (`vbs)
	 $monitor($time, "> %h %h : R1-R6: %h %h %h %h %h %h",
    PC, IF_ID_IR,
    RegFile.R1.RegBuf, RegFile.R2.RegBuf, RegFile.R3.RegBuf,
    RegFile.R4.RegBuf, RegFile.R5.RegBuf, RegFile.R6.RegBuf);
   end
    
    initial
    #1000 $stop;
    
*/
endmodule /* pdlx */			 


   
`include "alu.v"
`include "control.v"
`include "misc.v"
`include "regfile.v"











