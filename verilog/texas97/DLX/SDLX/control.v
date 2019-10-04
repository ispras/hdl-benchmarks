`include "sdlx.h"
`include "alu.h"

module Control(
	      IR,
	       
	       IRRW,
	       PCRW,
	       NPCRW,
	       ARW,
	       BRW,
	       IRW,
	       ALUoutRW,
	       MDRW,
	       BCRW,
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
	       Clk );

   input   [`DATA1] IR;
  // reg  [`DATA1] IR;
  
     
   // Internal Registers
   output 	   IRRW;
   output 	   PCRW;
   output 	   NPCRW;
   output 	   ARW;
   output 	   BRW;
   output 	   IRW;
   output 	   ALUoutRW;
   output 	   MDRW;
   output 	   BCRW;
   
   // MUXs
   output 	   ZSel;
   output 	   BraE;
   output 	   JmpE;
   output 	   RegDst;
   output 	   ALUInA;
   output 	   ALUInB;
   output 	   WBSel;
   
   // Sign Extension
   output 	SESel;
   
   // ALU
   output [`ALUO] ALUOp;
   
   // Register File
   output 	  RegRW;
   
   // Data memory
   output 	  MemRW;
   
   input 	  Reset, Clk;
   
   wire [5:0] 	  OPcode;
   reg 		  IRRW, PCRW, NPCRW, ARW, BRW, IRW, ALUoutRW, MDRW, BCRW;
   reg 		  ZSel, BraE, JmpE, RegDst, ALUInA, ALUInB, SESel, WBSel, RegRW, MemRW;
   reg [`ALUO] 	  ALUOp;
   
   reg [2:0] 	  State, NextState;

   reg 		  monitor_reset ;
   
   reg monitor_j ;
   reg monitor_sw;
   reg monitor_lw;
   reg monitor_nop;
   reg monitor_beqz;
   reg monitor_bnez;
   reg monitor_fsel;
   
   
   initial begin
      State     = `IDLE;
      NextState = `IDLE;
      ALUOp    = 2'b00;
      IRRW     = 0;
      PCRW     = 0;
      NPCRW    = 0;
      ARW      = 0;
      BRW      = 0;
      IRW      = 0;
      ALUoutRW = 0;
      MDRW     = 0;
      BCRW     = 0;
      ZSel     = 0;
      BraE     = 0;
      JmpE     = 0;
      RegDst   = 0;
      ALUInA   = 0;
      ALUInB   = 0;
      SESel    = 0;
      WBSel    = 0;
      RegRW    = 0;
      MemRW    = 0;
      monitor_reset = 0;
      monitor_j =0;
      monitor_sw=0;
      monitor_lw=0;
      monitor_nop=0;
      monitor_beqz=0;
      monitor_bnez=0;
      monitor_fsel=0;
      
      
    //  IR = 00100000000000010000000000000110;
      
   
   end
   
   
   always @(posedge Clk) begin
      monitor_reset=Reset;

      
      
      if(`OPCODE == `NOP)
	 monitor_nop=1;
      else
	 monitor_nop=0;
      
      if(`OPCODE == `LW)
	 monitor_lw =1;
      else
	 monitor_lw =0;
      
      if(`OPCODE == `SW)
	 monitor_sw = 1;
      else
	 monitor_sw = 0;
      
      
      if(`OPCODE == `J)
	 monitor_j = 1;
      else
	 monitor_j = 0;
      
     if(`OPCODE == `BEQZ)
	monitor_beqz = 1;
     else
	monitor_beqz = 0;

  
      if(`OPCODE == `BNEZ)
	 monitor_bnez = 1;
      else
	 monitor_bnez = 0;
      
      
      if(`OPCODE == `FSEL)
	 monitor_fsel = 1;
      else
	 monitor_fsel=0;
      
     State = NextState;


      
      case (State)
	`IDLE: begin
	   //             Outputvec(21'b000000000000000000000);
	   ALUOp    = 2'b00;
	   IRRW     = 0;
	   PCRW     = 0;
	   NPCRW    = 0;
	   ARW      = 0;
	   BRW      = 0;
	   IRW      = 0;
	   ALUoutRW = 0;
	   MDRW     = 0;
	   BCRW     = 0;
	   ZSel     = 0;
	   BraE     = 0;
	   JmpE     = 0;
	   RegDst   = 0;
	   ALUInA   = 0;
	   ALUInB   = 0;
	   SESel    = 0;
	   WBSel    = 0;
	   RegRW    = 0;
	   MemRW    = 0;
	   NextState = Reset ? `IDLE : `IF;
	end // case: `IDLE
	
	`IF:   begin
	   // IR  <- IMEM[PC]
	   // NPC <- [PC] + 4
	   //           OutputVec(21'b001010000000000000000);
	   ALUOp    = 2'b00;
	   IRRW     = 1;
	   PCRW     = 0;
	   NPCRW    = 1;
	   ARW      = 0;
	   BRW      = 0;
	   IRW      = 0;
	   ALUoutRW = 0;
	   MDRW     = 0;
	   BCRW     = 0;
	   ZSel     = 0;
	   BraE     = 0;
	   JmpE     = 0;
	   RegDst   = 0;
	   ALUInA   = 0;
	   ALUInB   = 0;
	   SESel    = 0;
	   WBSel    = 0;
	   RegRW    = 0;
	   MemRW    = 0;
	   NextState = Reset ? `IDLE : `ID;
	end
	`ID:   begin
        
       
	   // A  <- Reg[IRS]
	   // B  <- Reg[IRD]
	   // I  <- signext ## IMM
	   // PC <- NPC
	   if (`OPCODE == `J)  // I <- signext ## IR[25:0]
	      begin
                // OutputVec(21'b000101110000000001000);
		 ALUOp    = 2'b00;
		 IRRW     = 0;
		 PCRW     = 1;
		 NPCRW    = 0;
		 ARW      = 1;
		 BRW      = 1;
		 IRW      = 1;
		 ALUoutRW = 0;
		 MDRW     = 0;
		 BCRW     = 0;
		 ZSel     = 0;
		 BraE     = 0;
		 JmpE     = 0;
		 RegDst   = 0;
		 ALUInA   = 0;
		 ALUInB   = 0;
		 SESel    = 1;
		 WBSel    = 0;
		 RegRW    = 0;
		 MemRW    = 0;
	      end
	   else                   // I <- signext ## IR[15:0]
	      //   OutputVec(21'b000101110000000000000);
	      
	      begin
		 ALUOp    = 2'b00;
		 IRRW     = 0;
		 PCRW     = 1;
		 NPCRW    = 0;
		 ARW      = 1;
		 BRW      = 1;
		 IRW      = 1;
		 ALUoutRW = 0;
		 MDRW     = 0;
		 BCRW     = 0;
		 ZSel     = 0;
		 BraE     = 0;
		 JmpE     = 0;
		 RegDst   = 0;
		 ALUInA   = 0;
		 ALUInB   = 0;
		 SESel    = 0;
		 WBSel    = 0;
		 RegRW    = 0;
		 MemRW    = 0;
	      end
	   NextState = Reset ? `IDLE : `EX;
	end
	`EX:   begin
	   
	   if (IR == `NOP) 
	      
	      //   OutputVec(21'b000000000000000000000);
	      begin
		 ALUOp    = 2'b00;
		 IRRW     = 0;
		 PCRW     = 0;
		 NPCRW    = 0;
		 ARW      = 0;
		 BRW      = 0;
		 IRW      = 0;
		 ALUoutRW = 0;
		 MDRW     = 0;
		 BCRW     = 0;
		 ZSel     = 0;
		 BraE     = 0;
		 JmpE     = 0;
		 RegDst   = 0;
		 ALUInA   = 0;
		 ALUInB   = 0;
		 SESel    = 0;
		 WBSel    = 0;
		 RegRW    = 0;
		 MemRW    = 0;  	
		 NextState = Reset ? `IDLE : `IF;
	      end
	   else begin
	      case (`OPCODE)
		`FSEL: begin
		   
		   // ALUout <- [A] op [B]
		   case (`FUNC)
		     `SLL: 
			//OutputVec({`RTYPE,19'b0000001000000110000});
			begin
			   ALUOp    = 2'b10;
			   IRRW     = 0;
			   PCRW     = 0;
			   NPCRW    = 0;
			   ARW      = 0;
			   BRW      = 0;
			   IRW      = 0;
			   ALUoutRW = 1;
			   MDRW     = 0;
			   BCRW     = 0;
			   ZSel     = 0;
			   BraE     = 0;
			   JmpE     = 0;
			   RegDst   = 0;
			   ALUInA   = 1;
			   ALUInB   = 1;
			   SESel    = 0;
			   WBSel    = 0;
			   RegRW    = 0;
			   MemRW    = 0;
			end
		     `SRL: 
			//OutputVec({`RTYPE,19'b0000001000000110000});
			begin
			   ALUOp    = 2'b10;
			   IRRW     = 0;
			   PCRW     = 0;
			   NPCRW    = 0;
			   ARW      = 0;
			   BRW      = 0;
			   IRW      = 0;
			   ALUoutRW = 1;
			   MDRW     = 0;
			   BCRW     = 0;
			   ZSel     = 0;
			   BraE     = 0;
			   JmpE     = 0;
			   RegDst   = 0;
			   ALUInA   = 1;
			   ALUInB   = 1;
			   SESel    = 0;
			   WBSel    = 0;
			   RegRW    = 0;
			   MemRW    = 0;
			end
		     default:
			//OutputVec({`RTYPE,19'b0000001000000100000});
			begin
			   ALUOp    = 2'b10;
			   IRRW     = 0;
			   PCRW     = 0;
			   NPCRW    = 0;
			   ARW      = 0;
			   BRW      = 0;
			   IRW      = 0;
			   ALUoutRW = 1;
			   MDRW     = 0;
			   BCRW     = 0;
			   ZSel     = 0;
			   BraE     = 0;
			   JmpE     = 0;
			   RegDst   = 0;
			   ALUInA   = 1;
			   ALUInB   = 0;
			   SESel    = 0;
			   WBSel    = 0;
			   RegRW    = 0;
			   MemRW    = 0;
			end
		   endcase
		   NextState = Reset ? `IDLE : `WB;
		end
		`J: begin
	
	   
		   // ALUout <- [NPC] + [Imm]
		   // OutputVec({`BRANCH,19'b0000001000000010000});
		   ALUOp    = 2'b01;
		   IRRW     = 0;
		   PCRW     = 0;
		   NPCRW    = 0;
		   ARW      = 0;
		   BRW      = 0;
		   IRW      = 0;
		   ALUoutRW = 1;
		   MDRW     = 0;
		   BCRW     = 0;
		   ZSel     = 0;
		   BraE     = 0;
		   JmpE     = 0;
		   RegDst   = 0;
		   ALUInA   = 0;
		   ALUInB   = 1;
		   SESel    = 0;
		   WBSel    = 0;
		   RegRW    = 0;
		   MemRW    = 0;
		   NextState = Reset ? `IDLE : `WB;
		end
		`BEQZ: begin
		   
		   // ALUout <- ([A] == 0) ? [NPC] + [Imm] : [NPC]
		   //putVec({`BRANCH,19'b0000001010000010000});
		   ALUOp    = 2'b01;
		   IRRW     = 0;
		   PCRW     = 0;
		   NPCRW    = 0;
		   ARW      = 0;
		   BRW      = 0;
		   IRW      = 0;
		   ALUoutRW = 1;
		   MDRW     = 0;
		   BCRW     = 1;
		   ZSel     = 0;
		   BraE     = 0;
		   JmpE     = 0;
		   RegDst   = 0;
		   ALUInA   = 0;
		   ALUInB   = 1;
		   SESel    = 0;
		   WBSel    = 0;
		   RegRW    = 0;
		   MemRW    = 0;
		   NextState = Reset ? `IDLE : `WB;
		end
		`BNEZ: begin
		
   
		   // ALUout <- ([A] != 0) ? [NPC] + [Imm] : [NPC]
		   //  OutputVec({`BRANCH,19'b0000001011000010000});
		   ALUOp    = 2'b01;
		   IRRW     = 0;
		   PCRW     = 0;
		   NPCRW    = 0;
		   ARW      = 0;
		   BRW      = 0;
		   IRW      = 0;
		   ALUoutRW = 1;
		   MDRW     = 0;
		   BCRW     = 1;
		   ZSel     = 1;
		   BraE     = 0;
		   JmpE     = 0;
		   RegDst   = 0;
		   ALUInA   = 0;
		   ALUInB   = 1;
		   SESel    = 0;
		   WBSel    = 0;
		   RegRW    = 0;
		   MemRW    = 0;
		   NextState = Reset ? `IDLE : `WB;
		end
		`ADDI: begin
		
   
		   // ALUout <- [RS] + [Imm]
		   // OutputVec({`ITYPE,19'b0000001000000110000});
		   ALUOp    = 2'b11;
		   IRRW     = 0;
		   PCRW     = 0;
		   NPCRW    = 0;
		   ARW      = 0;
		   BRW      = 0;
		   IRW      = 0;
		   ALUoutRW = 1;
		   MDRW     = 0;
		   BCRW     = 0;
		   ZSel     = 0;
		   BraE     = 0;
		   JmpE     = 0;
		   RegDst   = 0;
		   ALUInA   = 1;
		   ALUInB   = 1;
		   SESel    = 0;
		   WBSel    = 0;
		   RegRW    = 0;
		   MemRW    = 0;
		   NextState = Reset ? `IDLE : `WB;
		end
		`LW: begin
		
   
		   // ALUout <- [RS]+[Imm]
		   //   OutputVec({`MEMACC,19'b0000001000000110000});
		   ALUOp    = 2'b00;
		   IRRW     = 0;
		   PCRW     = 0;
		   NPCRW    = 0;
		   ARW      = 0;
		   BRW      = 0;
		   IRW      = 0;
		   ALUoutRW = 1;
		   MDRW     = 0;
		   BCRW     = 0;
		   ZSel     = 0;
		   BraE     = 0;
		   JmpE     = 0;
		   RegDst   = 0;
		   ALUInA   = 1;
		   ALUInB   = 1;
		   SESel    = 0;
		   WBSel    = 0;
		   RegRW    = 0;
		   MemRW    = 0;
		   
		   NextState = Reset ? `IDLE : `MEM;
		end
		`SW: begin
		   
		   // ALUout <- [RS]+[Imm]
		   //   OutputVec({`MEMACC,19'b0000001000000110000});
		   
		   ALUOp    = 2'b00;
		   IRRW     = 0;
		   PCRW     = 0;
		   NPCRW    = 0;
		   ARW      = 0;
		   BRW      = 0;
		   IRW      = 0;
		   ALUoutRW = 1;
		   MDRW     = 0;
		   BCRW     = 0;
		   ZSel     = 0;
		   BraE     = 0;
		   JmpE     = 0;
		   RegDst   = 0;
		   ALUInA   = 1;
		   ALUInB   = 1;
		   SESel    = 0;
		   WBSel    = 0;
		   RegRW    = 0;
		   MemRW    = 0;
		   
		   NextState = Reset ? `IDLE : `MEM;
		end
		`HLT: begin
		   
		end
		default: begin
		   
		end
	      endcase
	   end
	end
	`MEM:  begin
	   
	   case (`OPCODE)
	     `LW: begin
		//  OutputVec(21'b000000000100000000000);
		// MD <- DMEM[ALUout]
		ALUOp    = 2'b00;
		IRRW     = 0;
		PCRW     = 0;
		NPCRW    = 0;
		ARW      = 0;
		BRW      = 0;
		IRW      = 0;
 		ALUoutRW = 0;
		MDRW     = 1;
		BCRW     = 0;
		ZSel     = 0;
		BraE     = 0;
		JmpE     = 0;
		RegDst   = 0;
		ALUInA   = 0;
		ALUInB   = 0;
		SESel    = 0;
		WBSel    = 0;
		RegRW    = 0;
		MemRW    = 0;
		NextState = Reset ? `IDLE : `WB;
	     end // case: `LW
	     
	     `SW: begin
		// OutputVec(21'b000000000000000000001);
		ALUOp    = 2'b00;
		IRRW     = 0;
		PCRW     = 0;
		NPCRW    = 0;
		ARW      = 0;
		BRW      = 0;
		IRW      = 0;
		ALUoutRW = 0;
		MDRW     = 0;
		BCRW     = 0;
		ZSel     = 0;
		BraE     = 0;
		JmpE     = 0;
		RegDst   = 0;
		ALUInA   = 0;
		ALUInB   = 0;
   		SESel    = 0;
		WBSel    = 0;
		RegRW    = 0;
   		MemRW    = 1;
                          // DMEM[ALUout] <- [RD]
		NextState = Reset ? `IDLE : `IF;
	     end
	   endcase
	end
	`WB:   begin
	   case (`OPCODE)
	     `FSEL: begin
		
		// RD <- [ALUout]
		//OutputVec(21'b000000000000001000110);
		ALUOp    = 2'b00;
		IRRW     = 0;
   		PCRW     = 0;
   		NPCRW    = 0;
   		ARW      = 0;
   		BRW      = 0;
   		IRW      = 0;
   		ALUoutRW = 0;
   		MDRW     = 0;
   		BCRW     = 0;
   		ZSel     = 0;
   		BraE     = 0;
   		JmpE     = 0;
   		RegDst   = 1;
   		ALUInA   = 0;
   		ALUInB   = 0;
   		SESel    = 0;
   		WBSel    = 1;
   		RegRW    = 1;
   		MemRW    = 0;
		
	     end
	     `J: begin
		
		// Jump completion: could be in MEM too
		// PC <- [ALUout]
		//  OutputVec(21'b000100000000010000000);
		ALUOp    = 2'b00;
		IRRW     = 0;
   		PCRW     = 1;
   		NPCRW    = 0;
   		ARW      = 0;
   		BRW      = 0;
   		IRW      = 0;
   		ALUoutRW = 0;
   		MDRW     = 0;
   		BCRW     = 0;
   		ZSel     = 0;
   		BraE     = 0;
   		JmpE     = 1;
   		RegDst   = 0;
   		ALUInA   = 0;
   		ALUInB   = 0;
   		SESel    = 0;
   		WBSel    = 0;
   		RegRW    = 0;
		MemRW    = 0;
	     end
	     `BEQZ: begin
		
		// Branch completion: could be in MEM too
		// PC <- [ALUout]
		//  OutputVec(21'b000100000000100000000);
		ALUOp    = 2'b00;
		IRRW     = 0;
		PCRW     = 1;
		NPCRW    = 0;
		ARW      = 0;
   		BRW      = 0;
   		IRW      = 0;
   		ALUoutRW = 0;
   		MDRW     = 0;
   		BCRW     = 0;
   		ZSel     = 0;
   		BraE     = 1;
   		JmpE     = 0;
   		RegDst   = 0;
   		ALUInA   = 0;
   		ALUInB   = 0;
   		SESel    = 0;
   		WBSel    = 0;
   		RegRW    = 0;
   		MemRW    = 0;
	     end
	     `BNEZ: begin
		
		// Branch completion: could be in MEM too
		// PC <- [ALUout]
		//  OutputVec(21'b000100000000100000000);
		ALUOp    = 2'b00;
		IRRW     = 0;
		PCRW     = 1;
		NPCRW    = 0;
		ARW      = 0;
		BRW      = 0;
		IRW      = 0;
   		ALUoutRW = 0;
   		MDRW     = 0;
   		BCRW     = 0;
   		ZSel     = 0;
   		BraE     = 1;
   		JmpE     = 0;
   		RegDst   = 0;
   		ALUInA   = 0;
   		ALUInB   = 0;
   		SESel    = 0;
   		WBSel    = 0;
   		RegRW    = 0;
   		MemRW    = 0;
	     end
	     `ADDI: begin
		
		// RD <- [ALUout]
		// OutputVec(21'b000000000000000000110);
		ALUOp    = 2'b00;
		IRRW     = 0;
   		PCRW     = 0;
   		NPCRW    = 0;
   		ARW      = 0;
   		BRW      = 0;
   		IRW      = 0;
   		ALUoutRW = 0;
   		MDRW     = 0;
   		BCRW     = 0;
   		ZSel     = 0;
   		BraE     = 0;
   		JmpE     = 0;
   		RegDst   = 0;
   		ALUInA   = 0;
   		ALUInB   = 0;
   		SESel    = 0;
   		WBSel    = 1;
   		RegRW    = 1;
   		MemRW    = 0;
	     end
	     `LW: begin
		
		// RD <- [MD]
		// OutputVec(21'b000000000000000000010);
		ALUOp    = 2'b00;
		IRRW     = 0;
		PCRW     = 0;
   		NPCRW    = 0;
   		ARW      = 0;
   		BRW      = 0;
   		IRW      = 0;
   		ALUoutRW = 0;
   		MDRW     = 0;
   		BCRW     = 0;
   		ZSel     = 0;
   		BraE     = 0;
   		JmpE     = 0;
   		RegDst   = 0;
   		ALUInA   = 0;
   		ALUInB   = 0;
   		SESel    = 0;
   		WBSel    = 0;
   		RegRW    = 1;
   		MemRW    = 0;
	     end
	   endcase
	   NextState = Reset ? `IDLE : `IF;
	end
	default: begin
	   
	end
      endcase
   end
   
endmodule /* Control */
