





















































































module  pcont_cop0

  (SYSCLK, TMODE, RESET_D1_R_N,
  INST_I, CP0_INSTM32_I_R_N, CP0_M16IADDRB1_I,
  CLMI_RHOLD,
  INST_S_R,
  CLMI_SELINST_S_P
  );






`include "lxr_symbols.vh"
`include "core_symbols.vh"



  input         SYSCLK;                 // clock
  input         TMODE;                  // test mode
  input         RESET_D1_R_N;    	// reset
  input [31:0]  INST_I;                 // instruction
  input		CP0_INSTM32_I_R_N;	// isa mode
  input		CP0_M16IADDRB1_I;	// bit 1 of registered inst addr.
  input         CLMI_RHOLD;      	// hold register contents

  input  [`CLMI_SEL_INST_HI:0] CLMI_SELINST_S_P;  // select control for next InstSF

  output [31:0] INST_S_R;   // instruction in SF stage


  // regs and wires

  // outputs

  reg    [31:0] INST_S_R;   // instruction in SF stage

  // New Icache interface

  reg     [31:0] InstSF_P;


  reg            RESET_D2_R_N;


  reg 		 INSTMODE, Select;








// BEGIN DESIGN

  // verilint 528 OFF // Variable set but not used
  wire           NC_FOO = TMODE;
  // verilint 528 ON // Variable set but not used



  always @(CLMI_SELINST_S_P or INST_I or INST_S_R or Select or CP0_M16IADDRB1_I ) begin

    case (1'b1)		// synopsys full_case parallel_case

     // INSTRUCTION REGISTER RESET
     CLMI_SELINST_S_P[`CLMI_SEL_INST_ZERO_POS]:
	InstSF_P = (Select == `M32) ? `M32_NOP : `M16_NOP;	// load no-op


     // INSTRUCTION REGISTER LOAD
     CLMI_SELINST_S_P[`CLMI_SEL_INST_LOAD_POS]:
	InstSF_P = (Select == `M32) ? INST_I: 								// load 32-bit inst.
	(CP0_M16IADDRB1_I)  ?   {INST_I[15], 1'b0, INST_I[14:11], 10'b00_0000_0000, INST_I[15:0]}:	// 16-bit isa from lower half
	                        {INST_I[31], 1'b0, INST_I[30:27], 10'b00_0000_0000, INST_I[31:16]};	// 16-bit isa from upper half



     // INSTRUCTION REGISTER HOLD
     CLMI_SELINST_S_P[`CLMI_SEL_INST_HOLD_POS]:  InstSF_P = INST_S_R;

    endcase
  end

  // synopsys translate_off
  // verilint translate off
  always @(posedge SYSCLK) begin

    case (1'b1)		// synopsys full_case parallel_case

     // INSTRUCTION REGISTER RESET
    CLMI_SELINST_S_P[`CLMI_SEL_INST_ZERO_POS]:  ;
     // INSTRUCTION REGISTER LOAD
    CLMI_SELINST_S_P[`CLMI_SEL_INST_LOAD_POS]:  ;
     // INSTRUCTION REGISTER HOLD
    CLMI_SELINST_S_P[`CLMI_SEL_INST_HOLD_POS]: ;

     default:
       begin
       if (`RESET_D2_R_N_)
         begin
         $display ("ERROR %t %m: At posedge SYSCLK: invalid INSTIF selection code %b", $time, CLMI_SELINST_S_P);
         $stop;
         end
       end
    endcase
  end
  // verilint translate on
  // synopsys translate_on

  always @(INSTMODE or CP0_INSTM32_I_R_N or CLMI_RHOLD) begin

	if (CLMI_RHOLD)
	   Select = INSTMODE;
	else
	   Select = CP0_INSTM32_I_R_N;

  end


  always @(posedge SYSCLK)
    RESET_D2_R_N  <= RESET_D1_R_N;    // Generate reset at level 2




  always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

    if (!`RESET_D2_R_N_)
	INST_S_R <= `M32_NOP;
    else
	INST_S_R <= InstSF_P;  	// INSTRUCTION REGISTER

  end
  always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

    if (!`RESET_D2_R_N_)
	INSTMODE   <= `M32;
    else if (!CLMI_RHOLD)
	INSTMODE   <= CP0_INSTM32_I_R_N;

  end




  // synopsys translate_off
  // verilint translate off

  // Test signals

  reg    [31:0] tInstEX_R;
  reg    [31:0] tInstM_R;
  reg    [31:0] tInstWB_R;


  always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

    if (!`RESET_D2_R_N_) begin
      tInstEX_R <= 32'h0000_0000;
      tInstM_R  <= 32'h0000_0000;
      tInstWB_R <= 32'h0000_0000;
    end
    else if (!CLMI_RHOLD) begin
      tInstEX_R <= INST_S_R;
      tInstM_R  <= tInstEX_R;
      tInstWB_R <= tInstM_R;
    end

  end
    // ASSERTION CHECK - ILLEGAL OP CODES


  always @(posedge SYSCLK)  begin


    case (tInstEX_R[`M32_OPCODE])

	  `M32_REGIMM:	if (    (tInstEX_R[20:16] != `M32_BLTZ) &&
				(tInstEX_R[20:16] != `M32_BGEZ) &&
				(tInstEX_R[20:16] != `M32_BLTZAL) &&
				(tInstEX_R[20:16] != `M32_BGEZAL) &&
			 	`RESET_D2_R_N_ &&
				(CP0_INSTM32_I_R_N == `M32))  begin

			        	$display ("ERROR %t %m: Illegal REGIMM opcode", $time);
					$stop;
				end

	  `M32_COP0,
	  `M32_COP1,
	  `M32_COP2,
	  `M32_COP3:	begin

			  if (  (tInstEX_R[25:21] != `M32_MF) &&
				(tInstEX_R[25:21] != `M32_CF) &&
				(tInstEX_R[25:21] != `M32_MT) &&
				(tInstEX_R[25:21] != `M32_CT) &&
				(tInstEX_R[25:21] != `M32_BC) &&
				(tInstEX_R[25] == 1'b0) &&
			 	`RESET_D2_R_N_ &&
				(CP0_INSTM32_I_R_N == `M32)) begin

			        	$display ("ERROR %t %m: Illegal COP opcode", $time);
					$stop;
				end

			  if (  (tInstEX_R[25:21] == `M32_BC) &&
				(tInstEX_R[20:16] != `M32_BCF) &&
				(tInstEX_R[20:16] != `M32_BCT) &&
				(tInstEX_R[25] == 1'b0) &&
			 	`RESET_D2_R_N_ &&
				(CP0_INSTM32_I_R_N == `M32)) begin

			        	$display ("ERROR %t %m: Illegal COP BRANCH opcode", $time);
					$stop;
				end


			  if (  (tInstEX_R[31:26] == `M32_COP0) &&
				(tInstEX_R[25] == 1'b1) &&
				(tInstEX_R[5:0] != `M32_RFE) && (tInstEX_R[5:0] != `M32_DRET) &&
				(tInstEX_R[5:0] != `M32_SLEEP) &&
			 	`RESET_D2_R_N_ &&
				(CP0_INSTM32_I_R_N == `M32)) begin

			        	$display ("ERROR %t %m: Illegal COP0 opcode", $time);
					$stop;
				end


			 end

    endcase
  end
  // verilint translate on
  // synopsys translate_on


endmodule


