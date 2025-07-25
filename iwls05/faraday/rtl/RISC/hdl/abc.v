module c0cont

(

CP0_INULL_I, CP0_CDBUSOE_R, STCOP0_E_R, LDCOP0_M_R, IMUXNOXB_I_P,
IMUXBKUPNOX_I_P, IMUXBKUPIFXZ00_I_P, IMUXBKUPIFXZ01_I_P,
IMUXXCPN_I_P, LDEPC_M, SELPC_S, EXTEND_E_R, EXTEND_M_R, EXTEND_W_R,
JAL16_M_R, JAL16_WP1_R, BD_M_R, CE_M_R, EXCCODEIN_M, CP0_NXCPN_M,
POP_E_R, LDLINK_S, MODE2LINK_S, CP0_SLEEP_M_R, SDBBP_E_R,
CP0_XCPN_M_C0, CP0_XCPN_M_C1, CP0_XCPN_M_C2, CEI_XCPN_M_C0,
CEI_XCPN_M_C1, CP0_JPINDJ_E_R, CP0_JPTYPE_M_R, INULL_E_R,

SYSCLK, TMODE, RESET_D1_R_N, CFG_INSTM16EN, INSTM32_S_R_N,
INST_S_R, CLMI_RHOLD, RALU_V_E, RALU_N_E_R, RALU_Z_E, ADELINST_M_R,
ADELDATA_M, ADES_M, ADESLDATA_M_R, DSS_M_R, CI1_COND, CI2_COND,
CI3_COND, INT, IEC_W_R, CU_W_R, KUC_W_R, CE0_SEL_E_R, CE1_SEL_E_R,
CP0_JCTRLDM_M_R, CP0_JXCPN_M_R
);

`include "lxr_symbols.vh"
`include "core_symbols.vh"

input SYSCLK;
input TMODE;
input RESET_D1_R_N;
input CFG_INSTM16EN;
input INSTM32_S_R_N;

input [31:0] INST_S_R;
input CLMI_RHOLD;

input RALU_V_E;
input RALU_N_E_R;
input RALU_Z_E;
input ADELINST_M_R;
input ADELDATA_M;
input ADES_M;
input ADESLDATA_M_R;
input DSS_M_R;

input CI1_COND;
input CI2_COND;
input CI3_COND;

input INT;
input IEC_W_R;
input [3:0] CU_W_R;
input KUC_W_R;

input CE0_SEL_E_R;
input CE1_SEL_E_R;

input CP0_JCTRLDM_M_R;
input CP0_JXCPN_M_R;



output CP0_INULL_I;

output CP0_CDBUSOE_R;
output [`CP0_WSELST:0] STCOP0_E_R;
output [`CP0_WLDCOP0:0] LDCOP0_M_R;
output [`CP0_WIMUX:0] IMUXNOXB_I_P;
output IMUXBKUPNOX_I_P;
output IMUXBKUPIFXZ00_I_P;
output IMUXBKUPIFXZ01_I_P;
output IMUXXCPN_I_P;
output [`CP0_WEPCSEL:0] LDEPC_M;
output [`CP0_WPCSEL:0] SELPC_S;

output EXTEND_E_R;
output EXTEND_M_R;
output EXTEND_W_R;
output JAL16_M_R;
output JAL16_WP1_R;
output BD_M_R;
output [1:0] CE_M_R;
output [4:0] EXCCODEIN_M;

output CP0_NXCPN_M;
output POP_E_R;
output LDLINK_S;
output MODE2LINK_S;
output CP0_SLEEP_M_R;

output SDBBP_E_R;
output CP0_XCPN_M_C0;
output CP0_XCPN_M_C1;
output CP0_XCPN_M_C2;
output CEI_XCPN_M_C0;
output CEI_XCPN_M_C1;
output CP0_JPINDJ_E_R;
output [1:0] CP0_JPTYPE_M_R;
output INULL_E_R;




wire NC_FOO = TMODE;







reg CP0_CDBUSOE_R;
reg [`CP0_WSELST:0] STCOP0_E_R;
reg [`CP0_WIMUX:0] IMUXNOXB_I_P;
reg [`CP0_WLDCOP0:0] LDCOP0_M_R;
reg [`CP0_WPCSEL:0] SELPC_S;
reg [`CP0_WEPCSEL:0] LDEPC_M;

reg EXTEND_E_R;
reg EXTEND_M_R;
reg EXTEND_W_R;
reg JAL16_M_R;
reg JAL16_WP1_R;
reg [4:0] EXCCODEIN_M;

reg POP_E_R;
reg CP0_SLEEP_M_R;




reg [3:1] CpCond_D1_R;

reg EnEQ_E_R;
reg EnNE_E_R;
reg EnLE_E_R;
reg EnLT_E_R;
reg EnGE_E_R;
reg EnGT_E_R;
reg EnJR_E_R;
reg [1:0] EnJAL_E_R;

reg [`CP0_WLDCOP0:0] LDCOP0_E_R;



reg RiCop0_E_R;
reg Sys_E_R;
reg Bp_E_R;
reg [3:0] CpUen_E_R;

reg [1:0] CE_E_R;
reg [1:0] CE_M_R;
reg BD_E_R;
reg BD_M_R;
reg BD_W_R;
reg OvEn_E_R;
reg Ovtrap_M_R;

reg [4:0] IExcCode_M_R;
reg Interrupt_S_R;
reg Interrupt_E_R;
reg Iexcept_M_R;

reg NXCPN_W_R;



reg JRm16_E_R;
reg JALm16_E_R;
reg JALm16_M_R;
reg JALm16_W_R;
reg JALm16_WP1_R;
reg Extm16_E_R;
reg Extm16_M_R;
reg Extm16_W_R;

reg SDBBP_E_R;

reg CP0_JPINDJ_E_R;
reg [1:0] CP0_JPTYPE_M_R;

reg [`CP0_WIMUX:0] IMUX_I_R;
reg INULL_E_R;
reg INULL_S_R;

reg Sleep_E_R;

reg INSTM32_E_R;

reg CP0_XCPN_W_R;


wire RESET_D2_R_N;

reg INIT_D3_R_N;
reg INIT_D4_R_N;
reg INIT_D5_R_N;



wire INSTM32_S_R;
wire INSTM16_S_R;
reg [`CP0_WIMUX:0] IMUX_I_P;
reg [`CP0_WIMUX:0] Imux32_I_P;
reg [`CP0_WIMUX:0] Imux16_I_P;
wire ImuxBkupNflag_I_P;
wire CP0_XCPN_M;

reg [`CP0_WSELST:0] Selst32_S;
reg [`CP0_WSELST:0] Selst_S;

wire BCzT;
wire BCzF;
wire [3:1] Copbren;

wire EnEQ_S;
wire EnNE_S;
wire EnLE_S;
wire EnLT_S;
wire EnGE_S;
wire EnGT_S;
wire EnJR_S;
wire[1:0] EnJAL_S;

reg EnEQ32_S;
reg EnNE32_S;
reg EnJR32_S;
reg EnLE32_S;
reg EnLT32_S;
reg EnGE32_S;
reg EnGT32_S;
reg EnEQ16_S;
reg EnNE16_S;
reg EnJR16_S;
reg [1:0] EnJAL16_S;

wire EnEQ_E_P;
wire EnNE_E_P;
wire EnLE_E_P;
wire EnLT_E_P;
wire EnGE_E_P;
wire EnGT_E_P;
wire EnJR_E_P;
wire[1:0] EnJAL_E_P;

reg LdLink32_S;
wire LdLink16_S;
reg Mode2Link32_S;

reg [`CP0_WLDCOP0:0] LDCOP032_S;
reg [`CP0_WLDCOP0:0] LDCOP0_S;
wire[`CP0_WLDCOP0:0] LDCOP0_E_P;
wire[`CP0_WLDCOP0:0] LDCOP0_M_P;
wire[`CP0_WSELST:0] STCOP0_E_P;
wire CP0_CDBUSOE_P;

wire Ri_S;
reg Ri32_S;
reg Ri16_S;
wire Sys_S;
wire Bp_S;
reg [3:0] CpUen32_S;
wire[3:0] CpUen_S;
wire[3:0] CpUen_E_P;
wire[1:0] CE_S;
reg CpU_E;

wire RiCop0_E_P;
wire Sys_E_P;
wire Bp_E_P;
wire OvEn_E_P;

wire Bbd_S;
reg Bbd32_S;
wire OvEn_S;
reg OvEn32_S;
wire Ovtrap_M_P;

reg [4:0] IExcCode_E;
wire Interrupt_I;
wire Interrupt_S_P;
wire Interrupt_E_P;
wire Iexcept_E;
wire Iexcept_M_P;

wire InullBntkn_S_P;
wire InullJR_S_P;
wire InullSlot16_S_P;
wire Inull_S_P;
wire Pop_S;
wire POP_E_P;
wire ResInst_E;

wire Jmpr_E_P;
reg Jmpr32_E_P;

wire JRm16_S ;
wire JRm16_E_P;
wire JALm16_S ;
wire JALm16_E_P;
wire JALm16_M_P;
wire JALm16_W_P;
wire JALm16_WP1_P;
wire Extm16_S ;
wire Extm16_E_P;
wire Extm16_M_P;
wire Extm16_W_P;
wire SPCrel_S;

wire SDBBP_S ;
wire SDBBP_E_P;

reg CP0_JPINDJ_E_P;
reg [1:0] JPTYPE_M_P;

wire Sleep_S;
wire Sleep_E_P;
wire Sleep_M_P;
wire M16val_S;




reg Flag_INDJ;
reg Flag_DIRJ1;
reg Flag_DIRJ2;
reg Flag_NUL;








assign INSTM32_S_R = ~INSTM32_S_R_N;
assign INSTM16_S_R = INSTM32_S_R_N;



















assign BCzF = (INST_S_R[25:21] == `M32_BC) & (INST_S_R[20:16] == `M32_BCF);
assign BCzT = (INST_S_R[25:21] == `M32_BC) & (INST_S_R[20:16] == `M32_BCT);

assign Copbren[3] = CpCond_D1_R[3] ? BCzT : BCzF;
assign Copbren[2] = CpCond_D1_R[2] ? BCzT : BCzF;
assign Copbren[1] = CpCond_D1_R[1] ? BCzT : BCzF;

always @(CFG_INSTM16EN or Copbren or INST_S_R) begin


Imux32_I_P = 0;
EnJR32_S = 1'b0;
EnEQ32_S = 1'b0;
EnNE32_S = 1'b0;
EnLE32_S = 1'b0;
EnLT32_S = 1'b0;
EnGE32_S = 1'b0;
EnGT32_S = 1'b0;

case (INST_S_R[`M32_OPCODE])

`M32_SPECIAL: case (INST_S_R[`M32_SUB_SPECIAL])
`M32_JR,
`M32_JALR: begin
Imux32_I_P[`CP0_SINCR_PC] = 1; EnJR32_S = 1'b1;
end
default: Imux32_I_P[`CP0_SINCR_PC] = 1;
endcase

`M32_REGIMM:

case (INST_S_R[20:16])
`M32_BLTZ,
`M32_BLTZAL: begin Imux32_I_P[`CP0_SBRANCH_PC] = 1; EnLT32_S = 1'b1; end
`M32_BGEZ,
`M32_BGEZAL: begin Imux32_I_P[`CP0_SBRANCH_PC] = 1; EnGE32_S = 1'b1; end
default: Imux32_I_P[`CP0_SINCR_PC] = 1;
endcase


`M32_J,
`M32_JAL: Imux32_I_P[`CP0_SJUMP_PC] = 1;

`M32_JALX:
if (CFG_INSTM16EN)
Imux32_I_P[`CP0_SJUMPX_PC] = 1;
else
Imux32_I_P[`CP0_SINCR_PC] = 1;

`M32_BEQ: begin Imux32_I_P[`CP0_SBRANCH_PC] = 1; EnEQ32_S = 1'b1; end
`M32_BNE: begin Imux32_I_P[`CP0_SBRANCH_PC] = 1; EnNE32_S = 1'b1; end
`M32_BLEZ: begin Imux32_I_P[`CP0_SBRANCH_PC] = 1; EnLE32_S = 1'b1; end
`M32_BGTZ: begin Imux32_I_P[`CP0_SBRANCH_PC] = 1; EnGT32_S = 1'b1; end




`M32_COP0:
if ((INST_S_R[25:24] == 2'b10) &&
(INST_S_R[`M32_SUB_SPECIAL] == `M32_DRET))
Imux32_I_P[`CP0_DRET] = 1;
else
Imux32_I_P[`CP0_SINCR_PC] = 1;

`M32_COP1: if(Copbren[1]) Imux32_I_P[`CP0_SBRANCH_PC] = 1; else Imux32_I_P[`CP0_SINCR_PC] = 1;
`M32_COP2: if(Copbren[2]) Imux32_I_P[`CP0_SBRANCH_PC] = 1; else Imux32_I_P[`CP0_SINCR_PC] = 1;
`M32_COP3: if(Copbren[3]) Imux32_I_P[`CP0_SBRANCH_PC] = 1; else Imux32_I_P[`CP0_SINCR_PC] = 1;

default: Imux32_I_P[`CP0_SINCR_PC] = 1;

endcase

end

always @(EnJAL_E_R or INST_S_R) begin



Imux16_I_P = 0;
EnJR16_S = 1'b0;
EnEQ16_S = 1'b0;
EnNE16_S = 1'b0;
EnJAL16_S = 2'b00;





case (INST_S_R[`M16_OPCODE])

`M16_LB,
`M16_LBU,
`M16_LH,
`M16_LHU,
`M16_LW,
`M16_LWPC,
`M16_LWSP: Imux16_I_P[`CP0_SIADDR_PC] = ~EnJAL_E_R[1];

`M16_BEQZ: begin
Imux16_I_P[`CP0_SBRANCH_PC] = ~EnJAL_E_R[1];
EnEQ16_S = ~EnJAL_E_R[1];
end

`M16_BNEZ: begin
Imux16_I_P[`CP0_SBRANCH_PC] = ~EnJAL_E_R[1];
EnNE16_S = ~EnJAL_E_R[1];
end

`M16_B: Imux16_I_P[`CP0_SBRANCH_PC] = ~EnJAL_E_R[1];

`M16_JAL: begin
Imux16_I_P[`CP0_SINCR_PC] = 1;

EnJAL16_S = EnJAL_E_R[1] ? 2'b00 : {1'b1, INST_S_R[10] };
end

`M16_RR:
case (INST_S_R[`M16_SUB_RR])
`M16_JREG: begin
Imux16_I_P[`CP0_SINCR_PC] = ~EnJAL_E_R[1];
EnJR16_S = ~EnJAL_E_R[1];
end
default: Imux16_I_P[`CP0_SINCR_PC] = 1;
endcase

`M16_I8: case (INST_S_R[`M16_SUB_I8])
`M16_BTEQZ: begin
Imux16_I_P[`CP0_SBRANCH_PC] = ~EnJAL_E_R[1];
EnEQ16_S = ~EnJAL_E_R[1];
end
`M16_BTNEZ: begin
Imux16_I_P[`CP0_SBRANCH_PC] = ~EnJAL_E_R[1];
EnNE16_S = ~EnJAL_E_R[1];
end
default: Imux16_I_P[`CP0_SINCR_PC] = 1;
endcase

default: Imux16_I_P[`CP0_SINCR_PC] = 1;

endcase

end
always @(EnJAL_E_R or EnJR_E_R or INIT_D5_R_N
or INSTM32_S_R or Imux16_I_P or Imux32_I_P) begin



IMUXNOXB_I_P = INSTM32_S_R ? Imux32_I_P : Imux16_I_P;






if (EnJR_E_R) begin
IMUXNOXB_I_P = 0; IMUXNOXB_I_P[`CP0_SJUMPREG] = 1;
end


if (EnJAL_E_R[1]) begin

IMUXNOXB_I_P = 0;
IMUXNOXB_I_P[`CP0_SJUMP_PC] = ~EnJAL_E_R[0];
IMUXNOXB_I_P[`CP0_SJUMPX_PC] = EnJAL_E_R[0];

end



if (!INIT_D5_R_N) begin
IMUXNOXB_I_P = 0;
IMUXNOXB_I_P[`CP0_SRESET_PC] = 1;
end

end









assign ImuxBkupNflag_I_P = ((EnLT_E_R & ~RALU_N_E_R) | (EnGE_E_R & RALU_N_E_R) | (EnGT_E_R & RALU_N_E_R));


assign IMUXBKUPIFXZ00_I_P = INIT_D5_R_N & (EnEQ_E_R | (EnLE_E_R & ~RALU_N_E_R) | ImuxBkupNflag_I_P ) ;


assign IMUXBKUPIFXZ01_I_P = INIT_D5_R_N & (EnNE_E_R | EnGT_E_R | ImuxBkupNflag_I_P) ;


assign IMUXBKUPNOX_I_P = RALU_Z_E ? IMUXBKUPIFXZ01_I_P : IMUXBKUPIFXZ00_I_P ;


assign IMUXXCPN_I_P = INIT_D5_R_N & CP0_XCPN_M;


always @(IMUXBKUPNOX_I_P or IMUXNOXB_I_P
or IMUXXCPN_I_P) begin
IMUX_I_P = 0;
casex ({IMUXXCPN_I_P,IMUXBKUPNOX_I_P})
2'b00: IMUX_I_P = IMUXNOXB_I_P;
2'b01: IMUX_I_P[`CP0_SBACKUP] = 1'b1;
2'b1x: IMUX_I_P[`CP0_STRAP] = 1'b1;
endcase

end









assign InullSlot16_S_P = ((Imux16_I_P[`CP0_SBRANCH_PC] | Imux16_I_P[`CP0_SIADDR_PC]) & INSTM16_S_R);

assign InullJR_S_P = (EnJR_E_R);

assign InullBntkn_S_P = IMUXBKUPNOX_I_P;

assign EnEQ_S = INSTM32_S_R ? EnEQ32_S : EnEQ16_S;
assign EnNE_S = INSTM32_S_R ? EnNE32_S : EnNE16_S;
assign EnJR_S = INSTM32_S_R ? EnJR32_S : EnJR16_S;
assign EnLE_S = INSTM32_S_R ? EnLE32_S : 1'b0;
assign EnLT_S = INSTM32_S_R ? EnLT32_S : 1'b0;
assign EnGE_S = INSTM32_S_R ? EnGE32_S : 1'b0;
assign EnGT_S = INSTM32_S_R ? EnGT32_S : 1'b0;

assign EnJAL_S = INSTM32_S_R ? 2'b00 : EnJAL16_S;


































always @(INST_S_R) begin

Selst32_S = 0;
LDCOP032_S = 0;

case (INST_S_R[`M32_OPCODE])

`M32_COP0: case (INST_S_R[25:21])

`M32_MF:

case (INST_S_R[15:11])
`CP0_STATUS_ADDR: Selst32_S[`CP0_STATUS] = 1;
`CP0_CAUSE_ADDR: Selst32_S[`CP0_CAUSE] = 1;
`CP0_BADVA_ADDR: Selst32_S[`CP0_BADVADDR] = 1;
`CP0_EPC_ADDR: Selst32_S[`CP0_EPC] = 1;
`CP0_PRID_ADDR: Selst32_S[`CP0_PRID] = 1;
`CP0_CCNTL_ADDR: Selst32_S[`CP0_CCNTL] = 1;
`CP0_CVSTAG_ADDR: Selst32_S[`CP0_CVSTAG] = 1;
`CP0_DREG_ADDR: Selst32_S[`CP0_DREG] = 1;
`CP0_DEPC_ADDR: Selst32_S[`CP0_DEPC] = 1;
`CP0_DSAVE_ADDR: Selst32_S[`CP0_DSAVE] = 1;
default: Selst32_S[`CP0_RESREG] = 1;
endcase



`M32_MT:

case (INST_S_R[15:11])
`CP0_STATUS_ADDR: LDCOP032_S[`CP0_STATUS] = 1;
`CP0_CAUSE_ADDR: LDCOP032_S[`CP0_CAUSE] = 1;
`CP0_CCNTL_ADDR: LDCOP032_S[`CP0_CCNTL] = 1;
`CP0_DREG_ADDR: LDCOP032_S[`CP0_DREG] = 1;
`CP0_DEPC_ADDR: LDCOP032_S[`CP0_DEPC] = 1;
`CP0_DSAVE_ADDR: LDCOP032_S[`CP0_DSAVE] = 1;
default: LDCOP032_S = 0;
endcase

default: begin
Selst32_S = 0;
LDCOP032_S = 0;
end

endcase

default: begin
Selst32_S = 0;
LDCOP032_S = 0;
end

endcase

end

always @(INSTM32_S_R or LDCOP032_S or Selst32_S) begin

Selst_S = INSTM32_S_R ? Selst32_S : 0;
LDCOP0_S = INSTM32_S_R ? LDCOP032_S: 0;

end



















always @(INST_S_R) begin




case (INST_S_R[`M32_OPCODE])

`M32_SPECIAL: case (INST_S_R[`M32_SUB_SPECIAL])
`M32_JALR: LdLink32_S = 1'b1;
default: LdLink32_S = 1'b0;
endcase

`M32_REGIMM : case (INST_S_R[20:16])
`M32_BLTZAL,
`M32_BGEZAL: LdLink32_S = 1'b1;
default: LdLink32_S = 1'b0;
endcase

`M32_JALX,
`M32_JAL: LdLink32_S = 1'b1;

default: LdLink32_S = 1'b0;

endcase



case (INST_S_R[`M32_OPCODE])

`M32_SPECIAL: case (INST_S_R[`M32_SUB_SPECIAL])
`M32_JALR: Mode2Link32_S = 1'b1;
default: Mode2Link32_S = 1'b0;
endcase

`M32_JAL: Mode2Link32_S = 1'b1;
`M32_JALX: Mode2Link32_S = 1'b1;
default: Mode2Link32_S = 1'b0;

endcase

end




assign LdLink16_S = (INST_S_R[`M16_OPCODE] == `M16_RR) &
(INST_S_R[`M16_SUB_RR] == `M16_JREG) &
(INST_S_R[`M16_RY] == `M16_JALR);

assign LDLINK_S = INSTM32_S_R ? LdLink32_S :
(EnJAL_E_R[1]) ? 1'b1 :
LdLink16_S;






assign MODE2LINK_S = CFG_INSTM16EN &
(INSTM16_S_R | Mode2Link32_S);






assign M16val_S = INSTM16_S_R & ~EnJAL_E_R[1];

assign JALm16_S = M16val_S & (INST_S_R[`M16_OPCODE] == `M16_JAL);

assign Extm16_S = M16val_S & (INST_S_R[`M16_OPCODE] == `M16_EXTEND);

assign JRm16_S = M16val_S & (INST_S_R[`M16_OPCODE] == `M16_RR) &
(INST_S_R[`M16_SUB_RR] == `M16_JREG);


assign SPCrel_S = M16val_S &
((INST_S_R[`M16_OPCODE] == `M16_LWPC) |
(INST_S_R[`M16_OPCODE] == `M16_ADDIUPC));


always @(Extm16_E_R or JALm16_M_R or JRm16_E_R
or SPCrel_S) begin

SELPC_S = 0;

case ({SPCrel_S, JRm16_E_R, JALm16_M_R, Extm16_E_R} )

4'b1000: SELPC_S[`CP0_SEL_PC_S] = 1'b1;
4'b1100: SELPC_S[`CP0_SEL_PC_E] = 1'b1;
4'b1010: SELPC_S[`CP0_SEL_PC_M] = 1'b1;
4'b1001: SELPC_S[`CP0_SEL_PC_E] = 1'b1;
default: SELPC_S[`CP0_SEL_ZERO] = 1'b1;

endcase


end













assign Pop_S = INSTM32_S_R &
(INST_S_R == `CP0_RFE_INST);
















always @(CFG_INSTM16EN or INST_S_R) begin



Ri32_S = 1'b0;
OvEn32_S = 1'b0;
Bbd32_S = 1'b0;
Jmpr32_E_P = 1'b0;




casex (INST_S_R[`M32_OPCODE])

`M32_SPECIAL: casex (INST_S_R[`M32_SUB_SPECIAL])
6'b000_001: Ri32_S = 1'b1;
6'b000_101: Ri32_S = 1'b1;
6'b001_01x: Ri32_S = 1'b1;
6'b001_11x: Ri32_S = 1'b1;

6'b01x_xxx: Ri32_S = 1'b1;
`M32_ADD,
`M32_OPSUB: OvEn32_S = 1'b1;
6'b101_00x: Ri32_S = 1'b1;
6'b101_1xx: Ri32_S = 1'b1;
6'b11x_xxx: Ri32_S = 1'b1;
`M32_JR,
`M32_JALR: Jmpr32_E_P = 1'b1;
endcase

`M32_REGIMM : case (INST_S_R[20:16])
`M32_BLTZ,
`M32_BGEZ,
`M32_BLTZAL,
`M32_BGEZAL: Bbd32_S = 1'b1;
endcase

`M32_J,
`M32_JAL: Jmpr32_E_P = 1'b1;

`M32_BEQ,
`M32_BNE,
`M32_BLEZ,
`M32_BGTZ: Bbd32_S = 1'b1;

`M32_ADDI: OvEn32_S = 1'b1;

`M32_COP0: Ri32_S = (INST_S_R[`M32_SUB_SPECIAL] == `M32_ERET);

`M32_COP1,
`M32_COP2,
`M32_COP3: Bbd32_S = (INST_S_R[25:17] == 9'b010000000);


6'b010_1xx: Ri32_S = 1'b1;
6'b011_0xx: Ri32_S = 1'b1;


`M32_SPECIAL2: casex (INST_S_R[`M32_SUB_SPECIAL])

`M32_SDBBP: Ri32_S = 1'b0;


default: Ri32_S = 1'b1;
endcase





`M32_JALX: begin
Jmpr32_E_P = CFG_INSTM16EN;
Ri32_S = ~CFG_INSTM16EN;
end

6'b011_11x: Ri32_S = 1'b1;

6'b100_010: Ri32_S = 1'b1;
6'b100_11x: Ri32_S = 1'b1;
6'b101_010: Ri32_S = 1'b1;
6'b101_1xx: Ri32_S = 1'b1;
6'b110_000: Ri32_S = 1'b1;
6'b110_1xx: Ri32_S = 1'b1;
6'b111_000: Ri32_S = 1'b1;
6'b111_100: Ri32_S = 1'b1;
6'b111_101: Ri32_S = 1'b1;
6'b111_11x: Ri32_S = 1'b1;

endcase



end



always @(INST_S_R) begin



Ri16_S = 1'b0;

case (INST_S_R[`M16_OPCODE])

`M16_LD : Ri16_S = 1'b1;

`M16_SD : Ri16_S = 1'b1;

`M16_LWU : Ri16_S = 1'b1;

`M16_I64 : Ri16_S = 1'b1;

`M16_RR:
case (INST_S_R[`M16_SUB_RR])













`M16_DSRL : Ri16_S = 1'b1;
`M16_RR01001 : Ri16_S = 1'b1;











`M16_MFHI : Ri16_S = 1'b1;
`M16_RR10001 : Ri16_S = 1'b1;
`M16_MFLO : Ri16_S = 1'b1;
`M16_DSRA : Ri16_S = 1'b1;

`M16_DSLLV : Ri16_S = 1'b1;
`M16_RR10101 : Ri16_S = 1'b1;
`M16_DSRLV : Ri16_S = 1'b1;
`M16_DSRAV : Ri16_S = 1'b1;

`M16_MULT : Ri16_S = 1'b1;
`M16_MULTU : Ri16_S = 1'b1;
`M16_DIV : Ri16_S = 1'b1;
`M16_DIVU : Ri16_S = 1'b1;

`M16_DMULT : Ri16_S = 1'b1;
`M16_DMULTU : Ri16_S = 1'b1;
`M16_DDIV : Ri16_S = 1'b1;
`M16_DDIVU : Ri16_S = 1'b1;

default: ;

endcase

`M16_RRR:
case (INST_S_R[`M16_SUB_RRR])
`M16_DADDU : Ri16_S = 1'b1;

`M16_DSUBU : Ri16_S = 1'b1;


default: ;

endcase

`M16_RRI_A:
case (INST_S_R[`M16_SUB_RRI_A])

`M16_DADDIU : Ri16_S = 1'b1;

default: ;

endcase

`M16_SHIFT:
case (INST_S_R[`M16_SUB_SHIFT])

`M16_DSLL : Ri16_S = 1'b1;



default: ;

endcase

`M16_I8:
case (INST_S_R[`M16_SUB_I8])





`M16_I8100 : Ri16_S = 1'b1;

`M16_I8110 : Ri16_S = 1'b1;


default: ;

endcase

default: ;

endcase

end


assign Ri_S = INSTM32_S_R ? Ri32_S : Ri16_S;
assign OvEn_S = INSTM32_S_R ? OvEn32_S : 1'b0;
assign Bbd_S = INSTM32_S_R ? Bbd32_S : 1'b0;



assign Jmpr_E_P = INSTM32_S_R ? Jmpr32_E_P :
(EnJAL_E_R[1]) ? 1'b1 :

((INST_S_R[`M16_OPCODE] == `M16_RR) &
(INST_S_R[`M16_SUB_RR] == `M16_JREG));






assign Bp_S = INSTM32_S_R ?

(INST_S_R[`M32_OPCODE] == `M32_SPECIAL) &
(INST_S_R[`M32_SUB_SPECIAL] == `M32_BREAK):

(INST_S_R[`M16_OPCODE] == `M16_RR) &
(INST_S_R[`M16_SUB_RR] == `M16_BREAK);


assign Sys_S = INSTM32_S_R &
(INST_S_R[`M32_OPCODE] == `M32_SPECIAL) &
(INST_S_R[`M32_SUB_SPECIAL] == `M32_SYSCALL);








always @(INST_S_R) begin


CpUen32_S = 4'b0000;

case (INST_S_R[`M32_OPCODE])

`M32_COP0: CpUen32_S[0] = 1'b1;

`M32_COP1,
`M32_SWC1,
`M32_LWC1: CpUen32_S[1] = 1'b1;

`M32_COP2,
`M32_SWC2,
`M32_LWC2: CpUen32_S[2] = 1'b1;

`M32_COP3,
`M32_SWC3,
`M32_LWC3: CpUen32_S[3] = 1'b1;

default: ;

endcase

end


assign CpUen_S = INSTM32_S_R ? CpUen32_S : 4'b0000;
assign CE_S = INSTM32_S_R ? INST_S_R[27:26] : 2'b00;

always @(CU_W_R or CpUen_E_R or KUC_W_R) begin

case (1'b1)
CpUen_E_R[0] : CpU_E = ~CU_W_R[0] & (KUC_W_R == `CP0_UMODE);
CpUen_E_R[1] : CpU_E = ~CU_W_R[1];
CpUen_E_R[2] : CpU_E = ~CU_W_R[2];
CpUen_E_R[3] : CpU_E = ~CU_W_R[3];
default: CpU_E = 1'b0;
endcase

end



assign SDBBP_S = INSTM32_S_R ?

((INST_S_R[`M32_OPCODE] == `M32_SPECIAL2) &
(INST_S_R[`M32_SUB_SPECIAL] == `M32_SDBBP)):

~EnJAL_E_R[1] &
((INST_S_R[`M16_OPCODE] == `M16_RR) &
(INST_S_R[`M16_SUB_RR] == `M16_SDBBP));







assign Interrupt_I = INT &
IEC_W_R &
~BD_M_R &
~CP0_INULL_I;












assign ResInst_E = RiCop0_E_R & ~CE0_SEL_E_R & ~CE1_SEL_E_R;

assign Iexcept_E = (Sys_E_R | ResInst_E | Bp_E_R | CpU_E | Interrupt_E_R);

always @(Bp_E_R or CpU_E or ResInst_E or Sys_E_R) begin

case ({Sys_E_R, Bp_E_R, ResInst_E, CpU_E })

4'b0001: IExcCode_E = 5'b01011;
4'b0010: IExcCode_E = 5'b01010;
4'b0100: IExcCode_E = 5'b01001;
4'b1000: IExcCode_E = 5'b01000;
default: IExcCode_E = 5'b00000;

endcase

end







assign Ovtrap_M_P = ~CP0_XCPN_M & OvEn_E_R & RALU_V_E;

assign CP0_NXCPN_M =


~NXCPN_W_R &





~CP0_JCTRLDM_M_R &


~(CP0_JXCPN_M_R & DSS_M_R) &


~JALm16_W_R &


(ADESLDATA_M_R | ADELINST_M_R | Ovtrap_M_R | Iexcept_M_R );




always @(ADELDATA_M or ADELINST_M_R or ADES_M or BD_W_R
or CP0_NXCPN_M or Extm16_W_R or IExcCode_M_R or Iexcept_M_R
or JALm16_WP1_R or Ovtrap_M_R) begin

EXCCODEIN_M = 5'b00000;
if (ADES_M) EXCCODEIN_M = 5'b00101;
if (ADELDATA_M) EXCCODEIN_M = 5'b00100;
if (Ovtrap_M_R) EXCCODEIN_M = 5'b01100;
if (Iexcept_M_R) EXCCODEIN_M = IExcCode_M_R;
if (ADELINST_M_R) EXCCODEIN_M = 5'b00100;


LDEPC_M = 0;
LDEPC_M[`CP0_EPC_M] = CP0_NXCPN_M & ~(BD_W_R | Extm16_W_R) & ~JALm16_WP1_R;
LDEPC_M[`CP0_EPC_W] = CP0_NXCPN_M & (BD_W_R | Extm16_W_R) & ~JALm16_WP1_R;
LDEPC_M[`CP0_EPC_WP1] = CP0_NXCPN_M & JALm16_WP1_R;
end




























assign Inull_S_P = InullBntkn_S_P | InullJR_S_P | InullSlot16_S_P |
CP0_XCPN_M |
(~INIT_D5_R_N) ;


assign CP0_INULL_I = Inull_S_P;





assign Sleep_S = INSTM32_S_R &
(INST_S_R[`M32_OPCODE] == `M32_COP0) &
(INST_S_R[25] == 1'b1 ) &
(INST_S_R[`M32_SUB_SPECIAL] == `M32_SLEEP);











assign CP0_XCPN_M = CP0_NXCPN_M | CP0_JXCPN_M_R;

assign CP0_XCPN_M_C0 = CP0_XCPN_M;
assign CP0_XCPN_M_C1 = CP0_XCPN_M;
assign CP0_XCPN_M_C2 = CP0_XCPN_M;
assign CEI_XCPN_M_C0 = CP0_XCPN_M;
assign CEI_XCPN_M_C1 = CP0_XCPN_M;




always @(CP0_XCPN_M or CP0_XCPN_W_R or EnJR_E_P
or Extm16_E_R or IMUX_I_P or IMUX_I_R or INSTM32_E_R
or INULL_E_R or JALm16_E_R or JALm16_M_R) begin





CP0_JPINDJ_E_P = EnJR_E_P;




Flag_INDJ = 1'b0;
Flag_DIRJ1 = 1'b0;
Flag_DIRJ2 = 1'b0;
Flag_NUL = 1'b0;



JPTYPE_M_P = `PTYP_PSEQ;

if (IMUX_I_P[`CP0_SJUMPREG]) begin

JPTYPE_M_P = `PTYP_INDJ;



Flag_INDJ = 1'b1;



end

if ( JALm16_M_R ||
( INSTM32_E_R &&
(IMUX_I_R[`CP0_SJUMP_PC] || IMUX_I_R[`CP0_SJUMPX_PC]))) begin

JPTYPE_M_P = `PTYP_DIRJ;



Flag_DIRJ1 = 1'b1;



end


if (IMUX_I_R[`CP0_SBRANCH_PC] & ~IMUX_I_P[`CP0_SBACKUP]) begin

JPTYPE_M_P = `PTYP_DIRJ;



Flag_DIRJ2 = 1'b1;



end

if ( INULL_E_R ||
Extm16_E_R ||
JALm16_E_R ||
CP0_XCPN_M ||
CP0_XCPN_W_R ) begin

JPTYPE_M_P = `PTYP_PNUL;



Flag_NUL = 1'b1;



end

end



assign SDBBP_E_P = ~CP0_XCPN_M & SDBBP_S;

assign POP_E_P = ~CP0_XCPN_M & Pop_S;
assign CP0_CDBUSOE_P= ~CP0_XCPN_M & (| STCOP0_E_R);

assign LDCOP0_E_P = {(`CP0_WLDCOP0+1){~CP0_XCPN_M}} & LDCOP0_S;
assign LDCOP0_M_P = {(`CP0_WLDCOP0+1){~CP0_XCPN_M}} & LDCOP0_E_R;
assign STCOP0_E_P = {(`CP0_WSELST +1){~CP0_XCPN_M}} & Selst_S;

assign Sleep_E_P = ~CP0_XCPN_M & Sleep_S;
assign Sleep_M_P = ~CP0_XCPN_M & Sleep_E_R;

assign RiCop0_E_P = ~CP0_XCPN_M & Ri_S;
assign Sys_E_P = ~CP0_XCPN_M & Sys_S;
assign Bp_E_P = ~CP0_XCPN_M & Bp_S;
assign OvEn_E_P = ~CP0_XCPN_M & OvEn_S;
assign CpUen_E_P = {4{~CP0_XCPN_M}} & CpUen_S;

assign Iexcept_M_P = ~CP0_XCPN_M & Iexcept_E;
assign Interrupt_S_P= ~CP0_XCPN_M & Interrupt_I;
assign Interrupt_E_P= ~CP0_XCPN_M & Interrupt_S_R;

assign EnJR_E_P = ~CP0_XCPN_M & EnJR_S;
assign EnEQ_E_P = ~CP0_XCPN_M & EnEQ_S;
assign EnNE_E_P = ~CP0_XCPN_M & EnNE_S;
assign EnLE_E_P = ~CP0_XCPN_M & EnLE_S;
assign EnLT_E_P = ~CP0_XCPN_M & EnLT_S;
assign EnGE_E_P = ~CP0_XCPN_M & EnGE_S;
assign EnGT_E_P = ~CP0_XCPN_M & EnGT_S;

assign EnJAL_E_P = {2{~CP0_XCPN_M}} & EnJAL_S;

assign JRm16_E_P = ~CP0_XCPN_M & JRm16_S ;

assign JALm16_E_P = ~CP0_XCPN_M & JALm16_S ;
assign JALm16_M_P = ~CP0_XCPN_M & JALm16_E_R;
assign JALm16_W_P = ~CP0_XCPN_M & JALm16_M_R;
assign JALm16_WP1_P = JALm16_W_R;

assign Extm16_E_P = ~CP0_XCPN_M & Extm16_S ;
assign Extm16_M_P = ~CP0_XCPN_M & Extm16_E_R;
assign Extm16_W_P = ~CP0_XCPN_M & Extm16_M_R;


  // synopsys translate_off
  // verilint translate off



always @(posedge SYSCLK) begin

if (`RESET_D2_R_N_ && Flag_INDJ && Flag_DIRJ1) begin
$display ("ERROR %t %m: Simultaneous JPTYPE: indirect jump and direct jump1", $time);
$stop;
end

if (`RESET_D2_R_N_ && Flag_INDJ && Flag_DIRJ2) begin
$display ("ERROR %t %m: Simultaneous JPTYPE: indirect jump and direct jump2", $time);
$stop;
end

if (`RESET_D2_R_N_ && Flag_DIRJ1 && Flag_DIRJ2) begin
$display ("ERROR %t %m: Simultaneous JPTYPE: direct jump1 and direct jump2", $time);
$stop;
end

if (`RESET_D2_R_N_ && (ADESLDATA_M_R != (ADELDATA_M | ADES_M))) begin
$display ("ERROR %t %m: Predicted M-stage value of ADESorL not equal to OR of ADES,ADEL.", $time);
$stop;
end

end



  // verilint translate on
  // synopsys translate_on














reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;








always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
INIT_D3_R_N <= 1'b0;
INIT_D4_R_N <= 1'b0;
INIT_D5_R_N <= 1'b0;
end
else begin
INIT_D3_R_N <= 1'b1;
INIT_D4_R_N <= INIT_D3_R_N;
INIT_D5_R_N <= INIT_D4_R_N;
end
end





always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin





if (!`RESET_D2_R_N_) begin

EnJR_E_R <= 1'b0;
EnEQ_E_R <= 1'b0;
EnNE_E_R <= 1'b0;
EnLE_E_R <= 1'b0;
EnLT_E_R <= 1'b0;
EnGE_E_R <= 1'b0;
EnGT_E_R <= 1'b0;

EnJAL_E_R <= 2'b00;

end

else if (!CLMI_RHOLD) begin

EnJR_E_R <= EnJR_E_P;
EnEQ_E_R <= EnEQ_E_P;
EnNE_E_R <= EnNE_E_P;
EnLE_E_R <= EnLE_E_P;
EnLT_E_R <= EnLT_E_P;
EnGE_E_R <= EnGE_E_P;
EnGT_E_R <= EnGT_E_P;

EnJAL_E_R <= EnJAL_E_P;

end

end
always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin


if (!`RESET_D2_R_N_)
CpCond_D1_R <= 3'b000;
else
CpCond_D1_R <= {CI3_COND,CI2_COND,CI1_COND};

end




always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin




if (!`RESET_D2_R_N_) begin

RiCop0_E_R <= 1'b0;
Sys_E_R <= 1'b0;
Bp_E_R <= 1'b0;
CpUen_E_R <= 4'b0000;

OvEn_E_R <= 1'b0;

Ovtrap_M_R <= 1'b0;

Iexcept_M_R <= 1'b0;

Interrupt_E_R <= 1'b0;
Interrupt_S_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin

RiCop0_E_R <= RiCop0_E_P;
Sys_E_R <= Sys_E_P;
Bp_E_R <= Bp_E_P;
CpUen_E_R <= CpUen_E_P;


OvEn_E_R <= OvEn_E_P;

Ovtrap_M_R <= Ovtrap_M_P;


Iexcept_M_R <= Iexcept_M_P;






Interrupt_S_R <= Interrupt_S_P;
Interrupt_E_R <= Interrupt_E_P;

end

end
always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

CE_E_R <= 2'b00;
CE_M_R <= 2'b00;



IExcCode_M_R <= 5'b00000;


BD_E_R <= 1'b0;
BD_M_R <= 1'b0;
BD_W_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin


CE_E_R <= CE_S;
CE_M_R <= CE_E_R;



IExcCode_M_R <= IExcCode_E;


BD_E_R <= Bbd_S | Jmpr_E_P;
BD_M_R <= BD_E_R;
BD_W_R <= BD_M_R;

end

end




always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

JRm16_E_R <= 1'b0;

JALm16_E_R <= 1'b0;
JALm16_M_R <= 1'b0;
JAL16_M_R <= 1'b0;
JALm16_W_R <= 1'b0;
JALm16_WP1_R <= 1'b0;
JAL16_WP1_R <= 1'b0;

EXTEND_E_R <= 1'b0;
Extm16_E_R <= 1'b0;
Extm16_M_R <= 1'b0;
EXTEND_M_R <= 1'b0;
Extm16_W_R <= 1'b0;
EXTEND_W_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin



JRm16_E_R <= JRm16_E_P;

JALm16_E_R <= JALm16_E_P;
JALm16_M_R <= JALm16_M_P;
JAL16_M_R <= JALm16_M_P;
JALm16_W_R <= JALm16_W_P;
JALm16_WP1_R <= JALm16_WP1_P;
JAL16_WP1_R <= JALm16_WP1_P;

EXTEND_E_R <= Extm16_E_P;
Extm16_E_R <= Extm16_E_P;
Extm16_M_R <= Extm16_M_P;
EXTEND_M_R <= Extm16_M_P;
Extm16_W_R <= Extm16_W_P;
EXTEND_W_R <= Extm16_W_P;

end

end



always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

Sleep_E_R <= 1'b0;
CP0_SLEEP_M_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin

Sleep_E_R <= Sleep_E_P;
CP0_SLEEP_M_R <= Sleep_M_P;

end
end






always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

CP0_CDBUSOE_R <= 1'b0;

LDCOP0_E_R <= 0;
LDCOP0_M_R <= 0;

STCOP0_E_R <= 0;

end

else if (!CLMI_RHOLD) begin



CP0_CDBUSOE_R <= CP0_CDBUSOE_P;

LDCOP0_E_R <= LDCOP0_E_P;
LDCOP0_M_R <= LDCOP0_M_P;

STCOP0_E_R <= STCOP0_E_P;

end
end




always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

NXCPN_W_R <= 1'b0;
POP_E_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin

NXCPN_W_R <= CP0_NXCPN_M;
POP_E_R <= POP_E_P;

end
end




always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

SDBBP_E_R <= 1'b0;
CP0_JPTYPE_M_R <= 2'b00;
CP0_JPINDJ_E_R <= 1'b0;

IMUX_I_R <= {(`CP0_WIMUX +1){1'b0}};
INSTM32_E_R <= 1'b0;

CP0_XCPN_W_R <= 1'b0;


INULL_S_R <= 1'b1;
INULL_E_R <= 1'b1;

end
else if (!CLMI_RHOLD) begin

SDBBP_E_R <= SDBBP_E_P;
CP0_JPTYPE_M_R <= JPTYPE_M_P;
CP0_JPINDJ_E_R <= CP0_JPINDJ_E_P;

IMUX_I_R <= IMUX_I_P;
INSTM32_E_R <= ~INSTM32_S_R_N;

CP0_XCPN_W_R <= CP0_XCPN_M;

INULL_S_R <= Inull_S_P;
INULL_E_R <= INULL_S_R;

end
end




endmodule

