
























































































module c0dpath

(

INT, IEC_W_R, CU_W_R, KUC_W_R, CP0_IADDR_I_P, CP0_LINK_E_R,
CP0_PCREL_S, ADELINST_M_R, ADELDATA_M, ADES_M, ADESLDATA_M_R,
DSS_M_R, CP0_CCNTL_W_R, CP0_INSTM32_S_R_N, CP0_INSTM32_S_R_C1_N,
CP0_INSTM32_S_R_C2_N, CP0_INSTM32_I_R_C1_N, CP0_INSTM32_I_R_C2_N,
CP0_M16IADDRB1_I, CP0_CDBUS_M_R, CP0_JCTRLDM_I_R_C0, CP0_JCTRLDM_I_R,
CP0_IEJORDM_I, CP0_JCTRLDM_M_R, CP0_JCTRLDM_M_R_C0, CP0_JXCPN_M_R,
CP0_IVATGT_I_R, CP0_IVATGT_S_R, CP0_JTRIG_M_R, CP0_XCPNVEC_M,
CP0_JCTRLJRST_R, CP0_IM_W_R, CP0_DBRKSETIFDMBH, CP0_DBREAKCLR,
CP0_JXCPN1STIFDMBH_M_P, CP0_JXCPN1STIFNOTDMBH_M_P,
CP0_DDBXIFDMBH_M_P, CP0_DDBXUNCOND_M_P, CP0_DIBIFNOTDMBH_M_P,

SYSCLK, TMODE, RESET_D1_R_N, CFG_INSTM16EN, INST_S_R, CLMI_RHOLD,
INTREQ_N, STCOP0_E_R, LDCOP0_M_R, IMUXNOXB_I_P, IMUXBKUPNOX_I_P,
IMUXBKUPIFXZ00_I_P, IMUXBKUPIFXZ01_I_P, IMUXXCPN_I_P, LDEPC_M,
SELPC_S, EXTEND_E_R, EXTEND_M_R, EXTEND_W_R, JAL16_M_R, JAL16_WP1_R,
INULL_E_R, BD_M_R, CE_M_R, EXCCODEIN_M, CP0_NXCPN_M, POP_E_R,
LDLINK_S, MODE2LINK_S, RALU_JRA_E_R, RALU_Z_E, RALU_DADDR_E,
RALU_DADALERR_E, RALU_DREAD_E_R, RALU_DWRITE_E_R, RALU_ADATAREG_M_R,
EJC_DINT_R, EJIM_BREAKHIT_S, EJIM_TRACEHIT_S, EJDM_BREAKHIT_W,
EJDM_TRACEHIT_W, EJPM_BREAKHIT_R, EJPM_TRACEHIT_R, EJC_ECRPROBEEN_R,
EJC_DCRMINT_R, SDBBP_E_R
);

































































































































































































































































































































`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"






























































input SYSCLK;
input TMODE;
input RESET_D1_R_N;
input CFG_INSTM16EN;

input [31:0] INST_S_R;
input CLMI_RHOLD;


input [5:0] INTREQ_N;

input [`CP0_WSELST:0] STCOP0_E_R;
input [`CP0_WLDCOP0:0] LDCOP0_M_R;
input [`CP0_WIMUX:0] IMUXNOXB_I_P;
input IMUXBKUPNOX_I_P;
input IMUXBKUPIFXZ00_I_P;
input IMUXBKUPIFXZ01_I_P;
input IMUXXCPN_I_P;
input [`CP0_WEPCSEL:0] LDEPC_M;
input [`CP0_WPCSEL:0] SELPC_S;
input EXTEND_E_R;
input EXTEND_M_R;
input EXTEND_W_R;
input JAL16_M_R;
input JAL16_WP1_R;

input INULL_E_R;
input BD_M_R;
input [1:0] CE_M_R;
input [4:0] EXCCODEIN_M;

input CP0_NXCPN_M;
input POP_E_R;
input LDLINK_S;
input MODE2LINK_S;

input [31:0] RALU_JRA_E_R;
input RALU_Z_E;

input [31:0] RALU_DADDR_E;
input RALU_DADALERR_E;
input RALU_DREAD_E_R;
input RALU_DWRITE_E_R;
input [31:0] RALU_ADATAREG_M_R;



input EJC_DINT_R;
input EJIM_BREAKHIT_S;
input EJIM_TRACEHIT_S;
input EJDM_BREAKHIT_W;
input EJDM_TRACEHIT_W;
input EJPM_BREAKHIT_R;
input EJPM_TRACEHIT_R;

input EJC_ECRPROBEEN_R;
input EJC_DCRMINT_R;

input SDBBP_E_R;






output INT;
output IEC_W_R;
output [3:0] CU_W_R;
output KUC_W_R;

output [31:0] CP0_IADDR_I_P;
output [31:0] CP0_LINK_E_R;
output [31:0] CP0_PCREL_S;

output ADELINST_M_R;
output ADELDATA_M;
output ADES_M;
output ADESLDATA_M_R;
output DSS_M_R;

output [7:0] CP0_CCNTL_W_R;

output CP0_INSTM32_S_R_N;
output CP0_INSTM32_S_R_C1_N;
output CP0_INSTM32_S_R_C2_N;
output CP0_INSTM32_I_R_C1_N;
output CP0_INSTM32_I_R_C2_N;
output CP0_M16IADDRB1_I;

output [31:0] CP0_CDBUS_M_R;




output CP0_JCTRLDM_I_R_C0;
output CP0_JCTRLDM_I_R;
output CP0_IEJORDM_I;
output CP0_JCTRLDM_M_R;
output CP0_JCTRLDM_M_R_C0;
output CP0_JXCPN_M_R;

output [31:1] CP0_IVATGT_I_R;
output [31:1] CP0_IVATGT_S_R;

output CP0_JTRIG_M_R;

output [2:0] CP0_XCPNVEC_M;

output CP0_JCTRLJRST_R;

output [7:0] CP0_IM_W_R;

output CP0_DBRKSETIFDMBH;
output CP0_DBREAKCLR;
output CP0_JXCPN1STIFDMBH_M_P;
output CP0_JXCPN1STIFNOTDMBH_M_P;
output CP0_DDBXIFDMBH_M_P;
output CP0_DDBXUNCOND_M_P;
output CP0_DIBIFNOTDMBH_M_P;








wire NC_FOO = TMODE;



wire IEC_W_R;
wire[3:0] CU_W_R;
wire KUC_W_R;
wire KUC_W_P;

reg [31:0] CP0_LINK_E_R;
reg [31:0] CP0_PCREL_S;

reg ADELINST_M_R;
reg ADESLDATA_M_R;

reg [7:0] CP0_CCNTL_W_R;

reg CP0_INSTM32_S_R_N;
reg CP0_INSTM32_S_R_C1_N;
reg CP0_INSTM32_S_R_C2_N;
reg [8:0] INSTM32_S_R_C_N;

reg CP0_INSTM32_I_R_C1_N;
reg CP0_INSTM32_I_R_C2_N;
reg INSTM32_I_R_N;

reg [31:0] CP0_CDBUS_M_R;



reg [31:0] Iaddr_I_R;

reg [5:0] IntreqT_R;
reg [5:0] Intreqs_R;
reg [31:0] Cause_W_R;
reg [31:0] Status_W_R;
reg [31:0] BadVAddr_W_R;
wire[7:0] IP_W_R;

reg [31:0] PC_S_R;
reg [31:0] PC_E_R;
reg [31:0] PC_M_R;
reg [31:0] PC_W_R;
reg [31:0] PC_WP1_R;

reg [31:0] Epc_E_R;

wire Bev_W_R;
reg [31:0] BackupPC_E_R;

wire[7:0] IM_W_R;

reg [31:0] BadVAddrInst_M_R;

reg Dadalerr_M_R;
reg [31:0] Daddr_M_R;

reg [10:0] InstLo_E_R;

reg IADDRB1_S_R;


wire RESET_D2_R_N;


reg POP_M_R;

reg BD_W_R;



reg [31:0] DREG_W_R;
reg [31:0] DEPC_W_R;
reg [31:0] DSAVE_W_R;

reg DSS_M_R;
reg DIB_M_R;
reg DBp_M_R;
reg DDBL_M_R;
reg DDBS_M_R;
reg DINT_M_R;
reg CP0_JXCPN_M_R;

reg DREAD_M_R;
reg DREAD_W_R;
reg DWRITE_M_R;
reg DWRITE_W_R;

reg ITRACEHIT_E_R;
reg IBREAKHIT_E_R;

reg DRETTGT_I_R;
reg DRETTGT_S_R;
reg DRETTGT_E_R;

reg CP0_JCTRLDM_I_R_C0;
reg CP0_JCTRLDM_I_R;
reg CP0_JCTRLDM_S_R;
reg CP0_JCTRLDM_E_R;
reg CP0_JCTRLDM_M_R;
reg CP0_JCTRLDM_M_R_C0;
reg CP0_JCTRLDM_M_R_C1;
reg CP0_JCTRLDM_W_R;

reg CP0_JTRIG_M_R;

wire SSt_W_R;

reg XCPN_W_R;

reg PBreakPend_R;
reg IBreakPend_R;
reg DBrkRdPend_R;
reg DBrkWrPend_R;
reg PTracePend_R;
reg ITracePend_R;
reg DTracePend_R;

reg IForceFF2EJT_R;





reg [31:0] IADDRifZ1_I_P;
reg [31:0] IADDRifZ0_I_P;

reg [31:0] Cause_W_P;
wire[7:0] CCNTL_W_P;
wire[31:0] Status_W_P;
reg [ 5:0] StatusIfNotLd_W_P;
reg [31:0] BadVAddr_W_P;

reg [31:0] Epc_E_P;
wire[31:0] LINK_E_P;
wire[31:0] COP0out_M_P;
reg [31:0] COP0outNotST_M_P;

wire[31:0] BackupPC_E_P;
wire[31:0] BackupPCi_E_P;
wire[31:0] JumpPC_S;
wire[31:0] Jumpm16PC_S;
wire[31:0] Jumpm32PC_S;
reg [31:0] BranchPC_S;
wire[31:0] IncrPC_I;
wire[31:0] TrapPC_M;
wire[31:0] JregPC_E;
wire[31:0] ResetPC;

wire[16:0] BranchPCoffset_S;
reg [16:0] Branchm16PCoffset_S;
wire[16:0] Branchm32PCoffset_S;
wire BranchPCsext_S;
reg Branchm16PCsext_S;
wire Branchm32PCsext_S;
reg BranchPCcarry_S;
wire[31:17] BranchPCUppr0_S;
wire[31:17] BranchPCUppr1_S;
wire[31:17] BranchPCUppr2_S;

wire AdELinstEn_M_P;
wire ADELINST_M_P;
reg AdELinstNoXB_M_P;
wire AdELinst_jmp_M_P;
wire AdELinst_inc_M_P;
wire AdELinst_bak_M_P;
reg AdELinstIfVld_M_P;
wire ADEdata_M;
wire ADESLDATA_M_P;
wire ADESLDATAifKUCU_M_P;
wire ADESLDATAifKUCK_M_P;

reg [31:0] BadVAddrInst_M_P;
reg [31:0] BadVAddrInstNoXB_M_P;

reg Instm32NoXB_I_P_N;
wire Instm32NoX_I_P_N;
wire Instm32_I_P_N;
wire INSTM32_I_R;

wire[8:0] INSTM32_S_R_C;


reg [31:0] IaddrNoXB_I_P;

wire IncrPCcarry_I;
wire[15:0] IncrPCUppr_I;

wire DRETTGT_I_P;
reg [31:0] DREG_W_P;
reg [31:0] DEPC_W_P;
wire[31:0] DSAVE_W_P;

wire DSS_E ;
wire DSS_M_P;
wire DIB_M_P;
wire DBp_M_P;
wire DDBL_M_P;
wire DDBS_M_P;
wire DINT_M_P;
wire JXCPN_M_P;

wire DIBifNotDMBH_E;
wire DBpifNotDMBH_E;
wire DDBXenable_E;
wire DDBLifDMBH_E;
wire DDBSifDMBH_E;
wire DDBLuncond_E;
wire DDBSuncond_E;
wire DINTifNotDMBH_E;
wire JXCPNifNotDMBH_M_P;
wire JXCPNifDMBH_M_P;
wire JxcpnDis_E;
wire IForceFF2EJT_P;
wire IaddrisFF2_I;


wire JTRIG_E ;
wire JTRIG_M_P;

wire CP0_JCTRLDM_I_P;

wire PBreakEff;
wire PBreakPendifDMBH_P;
wire PBreakPendifNotDMBH_P;
wire PBreakSet;
wire PBreakClrifNotDMBH;

wire PBreakPend_P;
wire IBreakPend_P;
wire DBrkRdPend_P;
wire DBrkWrPend_P;
wire PTracePend_P;
wire ITracePend_P;
wire DTracePend_P;

wire IBreakEff_S;
wire ITraceEff_S;
wire DBreakClr;
wire DBrkRdSet;
wire DBrkWrSet;

wire IBREAKHIT_E_P;
wire ITRACEHIT_E_P;

wire DREAD_M_P;
wire DREAD_W_P;
wire DWRITE_M_P;
wire DWRITE_W_P;

wire Dadalerr_M_P;
wire[31:0] Daddr_M_P;
wire POP_M_P;

wire CP0_XCPN_M;





assign INSTM32_I_R = ~INSTM32_I_R_N;
assign INSTM32_S_R_C = ~INSTM32_S_R_C_N;































assign {IncrPCcarry_I, IncrPC_I[15:0]} = Iaddr_I_R[15:0] + {12'h000, 1'b0, INSTM32_I_R, ~INSTM32_I_R, 1'b0};
assign IncrPCUppr_I[15:0] = Iaddr_I_R[31:16] + 16'h0001;

assign IncrPC_I[31:16] = IncrPCcarry_I ? IncrPCUppr_I[15:0] : Iaddr_I_R[31:16];








assign Jumpm32PC_S = {Iaddr_I_R[31:28], INST_S_R[25:0], 2'b00} ;
assign Jumpm16PC_S = {Iaddr_I_R[31:28], InstLo_E_R[4:0], InstLo_E_R[9:5], INST_S_R[15:0], 2'b00};


assign JumpPC_S = INSTM32_S_R_C[0] ? Jumpm32PC_S : Jumpm16PC_S;








assign ResetPC = EJC_ECRPROBEEN_R ? `CP0_RESET_VECTOR_EJ : `CP0_RESET_VECTOR;















assign TrapPC_M = CP0_JXCPN_M_R ?

(EJC_ECRPROBEEN_R ?
`CP0_TRAP_DPBE :
`CP0_TRAP_DNPB)

: (Bev_W_R ?
`CP0_TRAP_BEV1 :
`CP0_TRAP_BEV0);











assign Branchm32PCoffset_S = {INST_S_R[14:0], 2'b00};
assign Branchm32PCsext_S = INST_S_R[15];


always @(EXTEND_E_R or INST_S_R or InstLo_E_R) begin

casex ({EXTEND_E_R, INST_S_R[28]})

2'b00: begin
Branchm16PCoffset_S = {{5{INST_S_R[10]}}, INST_S_R[10:0], 1'b0};
Branchm16PCsext_S = INST_S_R[10];
end
2'b01: begin
Branchm16PCoffset_S = {{8{INST_S_R[7]}}, INST_S_R[7:0], 1'b0};
Branchm16PCsext_S = INST_S_R[7];
end
2'b1x: begin
Branchm16PCoffset_S = {InstLo_E_R[4:0], InstLo_E_R[10:5], INST_S_R[4:0], 1'b0};
Branchm16PCsext_S = InstLo_E_R[4];
end

endcase

end


assign BranchPCsext_S = INSTM32_S_R_C[5] ? Branchm32PCsext_S : Branchm16PCsext_S;

assign BranchPCoffset_S[ 16] = INSTM32_S_R_C[5] ? Branchm32PCoffset_S[ 16] : Branchm16PCoffset_S[ 16];
assign BranchPCoffset_S[15:12] = INSTM32_S_R_C[4] ? Branchm32PCoffset_S[15:12] : Branchm16PCoffset_S[15:12];
assign BranchPCoffset_S[11:08] = INSTM32_S_R_C[3] ? Branchm32PCoffset_S[11:08] : Branchm16PCoffset_S[11:08];
assign BranchPCoffset_S[07:04] = INSTM32_S_R_C[2] ? Branchm32PCoffset_S[07:04] : Branchm16PCoffset_S[07:04];
assign BranchPCoffset_S[03:00] = INSTM32_S_R_C[1] ? Branchm32PCoffset_S[03:00] : Branchm16PCoffset_S[03:00];





assign BranchPCUppr0_S[31:17] = Iaddr_I_R[31:17];
assign BranchPCUppr1_S[31:17] = Iaddr_I_R[31:17] + 15'b000_0000_0000_0001;
assign BranchPCUppr2_S[31:17] = Iaddr_I_R[31:17] + 15'b111_1111_1111_1111;

always @(BranchPCUppr0_S or BranchPCUppr1_S
or BranchPCUppr2_S or BranchPCoffset_S or BranchPCsext_S
or Iaddr_I_R) begin

{BranchPCcarry_S, BranchPC_S[16:0]} = Iaddr_I_R[16:0] + BranchPCoffset_S[16:0];

casex ({BranchPCsext_S, BranchPCcarry_S})
2'b00: BranchPC_S[31:17] = BranchPCUppr0_S;
2'b01: BranchPC_S[31:17] = BranchPCUppr1_S;
2'b10: BranchPC_S[31:17] = BranchPCUppr2_S;
2'b11: BranchPC_S[31:17] = BranchPCUppr0_S;
endcase
end









assign JregPC_E = {RALU_JRA_E_R[31:1], (~CFG_INSTM16EN & RALU_JRA_E_R[0])};




always @(BranchPC_S or DEPC_W_R or IMUXNOXB_I_P
or Iaddr_I_R or IncrPC_I or JregPC_E or JumpPC_S or ResetPC) begin




case (1'b1)

IMUXNOXB_I_P[`CP0_SBRANCH_PC]: IaddrNoXB_I_P = BranchPC_S;

IMUXNOXB_I_P[`CP0_SJUMP_PC],
IMUXNOXB_I_P[`CP0_SJUMPX_PC]: IaddrNoXB_I_P = JumpPC_S;

IMUXNOXB_I_P[`CP0_SINCR_PC]: IaddrNoXB_I_P = IncrPC_I;

IMUXNOXB_I_P[`CP0_SIADDR_PC]: IaddrNoXB_I_P = Iaddr_I_R;

IMUXNOXB_I_P[`CP0_SJUMPREG]: IaddrNoXB_I_P = JregPC_E;

IMUXNOXB_I_P[`CP0_DRET]: IaddrNoXB_I_P = DEPC_W_R;

IMUXNOXB_I_P[`CP0_SRESET_PC]: IaddrNoXB_I_P = ResetPC;

endcase

end




always @(BackupPC_E_R or IMUXBKUPIFXZ01_I_P
or IMUXXCPN_I_P or IaddrNoXB_I_P or TrapPC_M) begin

casex ({IMUXXCPN_I_P,IMUXBKUPIFXZ01_I_P})
2'b00: IADDRifZ1_I_P = IaddrNoXB_I_P;
2'b01: IADDRifZ1_I_P = BackupPC_E_R;
2'b1x: IADDRifZ1_I_P = TrapPC_M;
endcase

end


always @(BackupPC_E_R or IMUXBKUPIFXZ00_I_P
or IMUXXCPN_I_P or IaddrNoXB_I_P or TrapPC_M) begin

casex ({IMUXXCPN_I_P,IMUXBKUPIFXZ00_I_P})
2'b00: IADDRifZ0_I_P = IaddrNoXB_I_P;
2'b01: IADDRifZ0_I_P = BackupPC_E_R;
2'b1x: IADDRifZ0_I_P = TrapPC_M;
endcase

end

assign CP0_IADDR_I_P = RALU_Z_E ? IADDRifZ1_I_P : IADDRifZ0_I_P;

always @(DEPC_W_R or IMUXNOXB_I_P or INSTM32_I_R_N
or INSTM32_S_R_C_N or RALU_JRA_E_R) begin










case (1'b1)

IMUXNOXB_I_P[`CP0_SJUMPREG]: Instm32NoXB_I_P_N = RALU_JRA_E_R[0];

IMUXNOXB_I_P[`CP0_DRET]: Instm32NoXB_I_P_N = DEPC_W_R[0];

IMUXNOXB_I_P[`CP0_SJUMPX_PC]: Instm32NoXB_I_P_N = ~INSTM32_S_R_C_N[6];

default: Instm32NoXB_I_P_N = INSTM32_I_R_N;

endcase

end


assign Instm32NoX_I_P_N = IMUXBKUPNOX_I_P ? INSTM32_I_R_N : Instm32NoXB_I_P_N;



assign Instm32_I_P_N = CFG_INSTM16EN &
~CP0_XCPN_M &
Instm32NoX_I_P_N;




assign BackupPCi_E_P = !IMUXNOXB_I_P[`CP0_SBRANCH_PC] ? BackupPC_E_R :
INSTM32_S_R_C[7] ? IncrPC_I :
Iaddr_I_R;



assign BackupPC_E_P = IMUXBKUPNOX_I_P ? BackupPC_E_R : BackupPCi_E_P;






assign CP0_M16IADDRB1_I = CLMI_RHOLD ? IADDRB1_S_R : Iaddr_I_R[1];


assign DRETTGT_I_P = (IMUXNOXB_I_P[`CP0_DRET] & ~IMUXBKUPNOX_I_P & ~IMUXXCPN_I_P);













assign ADEdata_M = Dadalerr_M_R |
Daddr_M_R[31] &
(KUC_W_R == `CP0_UMODE) &
~CP0_JCTRLDM_M_R_C1;



assign ADES_M = DWRITE_M_R & ADEdata_M;





assign ADELDATA_M = DREAD_M_R & ADEdata_M;









assign ADESLDATAifKUCU_M_P = (DREAD_M_P | DWRITE_M_P) &
(Dadalerr_M_P |
(Daddr_M_P[31] &
~CP0_JCTRLDM_E_R));

assign ADESLDATAifKUCK_M_P = (DREAD_M_P | DWRITE_M_P) &
(Dadalerr_M_P );

assign ADESLDATA_M_P = (KUC_W_P == `CP0_UMODE) ?
ADESLDATAifKUCU_M_P :
ADESLDATAifKUCK_M_P ;





assign AdELinstEn_M_P = (KUC_W_R == `CP0_UMODE) &
~CP0_JCTRLDM_E_R &
~XCPN_W_R &
~INULL_E_R ;





assign AdELinst_bak_M_P = AdELinstEn_M_P & BackupPC_E_R[31];











assign AdELinst_jmp_M_P = CFG_INSTM16EN ?

((RALU_JRA_E_R[1] & ~RALU_JRA_E_R[0]) |
(AdELinstEn_M_P & RALU_JRA_E_R[31])):

((RALU_JRA_E_R[1] | RALU_JRA_E_R[0]) |
(AdELinstEn_M_P & RALU_JRA_E_R[31]));




assign AdELinst_inc_M_P = AdELinstEn_M_P & PC_E_R[31];


always @(AdELinst_inc_M_P or AdELinst_jmp_M_P
or IMUXNOXB_I_P or JregPC_E or PC_E_R) begin

case (1'b1)

IMUXNOXB_I_P[`CP0_SJUMPREG]:
begin
AdELinstNoXB_M_P = AdELinst_jmp_M_P;
BadVAddrInstNoXB_M_P = JregPC_E;
end

default:
begin
AdELinstNoXB_M_P = AdELinst_inc_M_P;
BadVAddrInstNoXB_M_P = PC_E_R;
end

endcase

end



always @(AdELinstNoXB_M_P or AdELinst_bak_M_P
or BackupPC_E_R or BadVAddrInstNoXB_M_P or IMUXBKUPNOX_I_P) begin
casex (IMUXBKUPNOX_I_P)
1'b0: begin
AdELinstIfVld_M_P = AdELinstNoXB_M_P;
BadVAddrInst_M_P = BadVAddrInstNoXB_M_P;
end
1'b1: begin
AdELinstIfVld_M_P = AdELinst_bak_M_P;
BadVAddrInst_M_P = BackupPC_E_R;
end
endcase
end











always @(ADELDATA_M or ADELINST_M_R or ADES_M
or BadVAddrInst_M_R or BadVAddr_W_R or CP0_NXCPN_M
or Daddr_M_R or EXCCODEIN_M) begin

casex ({CP0_NXCPN_M,
(ADELINST_M_R & (EXCCODEIN_M == 5'b00100)),
(ADELDATA_M & (EXCCODEIN_M == 5'b00100)),
(ADES_M & (EXCCODEIN_M == 5'b00101)) })

4'b1_1xx : BadVAddr_W_P = BadVAddrInst_M_R;
4'b1_01x : BadVAddr_W_P = Daddr_M_R;
4'b1_001 : BadVAddr_W_P = Daddr_M_R;
default : BadVAddr_W_P = BadVAddr_W_R;

endcase

end























always @(BD_W_R or CE_M_R or CP0_NXCPN_M or CP0_XCPN_M
or Cause_W_R or EXCCODEIN_M or Intreqs_R or LDCOP0_M_R
or RALU_ADATAREG_M_R) begin


Cause_W_P[31] = CP0_NXCPN_M ? BD_W_R : Cause_W_R[31];

Cause_W_P[30] = 1'b0;


Cause_W_P[29:28] = (CP0_NXCPN_M & (EXCCODEIN_M == 5'b01011)) ? CE_M_R : Cause_W_R[29:28];

Cause_W_P[27:16] = 12'h000;

Cause_W_P[15:10] = Intreqs_R[5:0];



Cause_W_P[9:8] = (LDCOP0_M_R[`CP0_CAUSE] & ~CP0_XCPN_M) ? RALU_ADATAREG_M_R[9:8] :
Cause_W_R[9:8];

Cause_W_P[7] = 1'b0;

Cause_W_P[6:2] = CP0_NXCPN_M ? EXCCODEIN_M : Cause_W_R[6:2];

Cause_W_P[1:0] = 2'b00;

end


assign INT = ~EJC_DCRMINT_R & (| (IM_W_R & IP_W_R));










assign CCNTL_W_P = (LDCOP0_M_R[`CP0_CCNTL] & ~CP0_XCPN_M) ? RALU_ADATAREG_M_R[7:0] : CP0_CCNTL_W_R;























assign Status_W_P[31:28] = (~CP0_XCPN_M &

LDCOP0_M_R[`CP0_STATUS] ) ? RALU_ADATAREG_M_R[31:28] :
Status_W_R[31:28] ;

assign Status_W_P[27:23] = 5'b00000;

assign Status_W_P[22] = (~CP0_XCPN_M &

LDCOP0_M_R[`CP0_STATUS] ) ? RALU_ADATAREG_M_R[22] :
Status_W_R[22] ;

assign Status_W_P[21:16] = 6'b000000;

assign Status_W_P[15:8] = (~CP0_XCPN_M &

LDCOP0_M_R[`CP0_STATUS] ) ? RALU_ADATAREG_M_R[15:8] :
Status_W_R[15:8] ;

assign Status_W_P[7:6] = 2'b00;






always @(CP0_JXCPN_M_R or CP0_NXCPN_M or POP_M_R
or Status_W_R) begin

casex ({CP0_NXCPN_M, CP0_JXCPN_M_R, POP_M_R})
3'b1xx: StatusIfNotLd_W_P[5:0] = {Status_W_R[3:0], 2'b00};
3'b01x: StatusIfNotLd_W_P[5:0] = {Status_W_R[5:0]};
3'b001: StatusIfNotLd_W_P[5:0] = {Status_W_R[5:4], Status_W_R[5:2]};
3'b000: StatusIfNotLd_W_P[5:0] = {Status_W_R[5:0]};
endcase

end


assign Status_W_P[5:0] = (~CP0_XCPN_M &

LDCOP0_M_R[`CP0_STATUS] ) ? RALU_ADATAREG_M_R[5:0] :
StatusIfNotLd_W_P[5:0] ;


assign CU_W_R = Status_W_R[31:28];
assign Bev_W_R = Status_W_R[22];
assign IM_W_R = Status_W_R[15:8];
assign KUC_W_R = Status_W_R[1];
assign KUC_W_P = Status_W_P[1];
assign IEC_W_R = Status_W_R[0];
assign IP_W_R = Cause_W_R[15:8];

assign CP0_IM_W_R = IM_W_R;







always @(PC_E_R or PC_M_R or PC_S_R or SELPC_S) begin

case (1'b1)

SELPC_S[`CP0_SEL_PC_S]: CP0_PCREL_S = {PC_S_R[31:2], 2'b00};
SELPC_S[`CP0_SEL_PC_E]: CP0_PCREL_S = {PC_E_R[31:2], 2'b00};
SELPC_S[`CP0_SEL_PC_M]: CP0_PCREL_S = {PC_M_R[31:2], 2'b00};
SELPC_S[`CP0_SEL_ZERO]: CP0_PCREL_S = 32'h0000_0000;

endcase

end










always @(Epc_E_R or LDEPC_M or PC_M_R or PC_WP1_R
or PC_W_R) begin

case (1'b1)

LDEPC_M[`CP0_EPC_WP1] : Epc_E_P = PC_WP1_R;
LDEPC_M[`CP0_EPC_W] : Epc_E_P = PC_W_R;
LDEPC_M[`CP0_EPC_M] : Epc_E_P = PC_M_R;
default: Epc_E_P = Epc_E_R;

endcase

end











assign LINK_E_P = LDLINK_S ?
{IncrPC_I[31:1], (MODE2LINK_S & INSTM32_S_R_C_N[8]) | (~MODE2LINK_S & IncrPC_I[0])} :
CP0_LINK_E_R;






always @(BadVAddr_W_R or CP0_CCNTL_W_R or Cause_W_R
or DEPC_W_R or DREG_W_R or DSAVE_W_R or Epc_E_R or STCOP0_E_R) begin




case (1'b1)

STCOP0_E_R[`CP0_PRID]: COP0outNotST_M_P = `CP0_PROCESSOR_ID;
STCOP0_E_R[`CP0_CVSTAG]: COP0outNotST_M_P = {`CP0_CVSTAG_ALPHA,
`CP0_CVSTAG_NUM};
STCOP0_E_R[`CP0_EPC]: COP0outNotST_M_P = Epc_E_R;
STCOP0_E_R[`CP0_CAUSE]: COP0outNotST_M_P = Cause_W_R;
STCOP0_E_R[`CP0_CCNTL]: COP0outNotST_M_P = {24'h00_0000, CP0_CCNTL_W_R};
STCOP0_E_R[`CP0_BADVADDR]:COP0outNotST_M_P = BadVAddr_W_R;
STCOP0_E_R[`CP0_DREG]: COP0outNotST_M_P = DREG_W_R;
STCOP0_E_R[`CP0_DEPC]: COP0outNotST_M_P = DEPC_W_R;
STCOP0_E_R[`CP0_DSAVE]: COP0outNotST_M_P = DSAVE_W_R;

default: COP0outNotST_M_P = 32'h0000_0000;

endcase
end


assign COP0out_M_P = STCOP0_E_R[`CP0_STATUS] ? {Status_W_R[31:6], Status_W_P[5:0]} :
COP0outNotST_M_P;




















assign JTRIG_E = (ITRACEHIT_E_R |
EJDM_TRACEHIT_W | DTracePend_R |
EJPM_TRACEHIT_R | PTracePend_R );


assign CP0_IVATGT_I_R = Iaddr_I_R[31:1];
assign CP0_IVATGT_S_R = PC_S_R[31:1];


assign CP0_XCPNVEC_M = {CP0_IADDR_I_P[29], CP0_IADDR_I_P[08], CP0_IADDR_I_P[07]};

assign CP0_JCTRLJRST_R = DREG_W_R[07];







assign CP0_JCTRLDM_I_P = ( CP0_JXCPN_M_R | CP0_JCTRLDM_I_R_C0) & ~DRETTGT_I_P;









assign IaddrisFF2_I = (Iaddr_I_R[31:21] == 11'b1111_1111_001);
assign IForceFF2EJT_P = IForceFF2EJT_R & ~CP0_JCTRLDM_I_R_C0 & IaddrisFF2_I;
assign CP0_IEJORDM_I = CP0_JCTRLDM_I_R_C0 | IForceFF2EJT_R;


assign SSt_W_R = DREG_W_R[08];







assign IBreakPend_P = CLMI_RHOLD & (IBreakPend_R | EJIM_BREAKHIT_S);
assign ITracePend_P = CLMI_RHOLD & (ITracePend_R | EJIM_TRACEHIT_S);

assign DTracePend_P = CLMI_RHOLD & (DTracePend_R | EJDM_TRACEHIT_W);

assign PTracePend_P = CLMI_RHOLD & (PTracePend_R | EJPM_TRACEHIT_R);


assign IBreakEff_S = IBreakPend_R | EJIM_BREAKHIT_S;
assign ITraceEff_S = ITracePend_R | EJIM_TRACEHIT_S;







assign PBreakEff = (PBreakPend_R | EJPM_BREAKHIT_R | EJC_DINT_R);





assign DBrkRdSet = EJDM_BREAKHIT_W & DREAD_W_R & ~CP0_JCTRLDM_W_R;
assign DBrkWrSet = EJDM_BREAKHIT_W & DWRITE_W_R & ~CP0_JCTRLDM_W_R;





assign PBreakSet = EJPM_BREAKHIT_R;









assign JxcpnDis_E = CP0_XCPN_M |
XCPN_W_R |
INULL_E_R |
JAL16_M_R;












assign DSS_E =
(SSt_W_R &
~CP0_JCTRLDM_E_R &
~(DRETTGT_E_R & ~DREG_W_R[12]) &

~EXTEND_M_R &
~BD_M_R) ;




assign DDBXenable_E = ~CP0_JCTRLDM_E_R &
~DSS_E ;

assign DDBLuncond_E = DDBXenable_E &
DBrkRdPend_R;

assign DDBLifDMBH_E = DDBXenable_E &
DREAD_W_R;

assign DDBSuncond_E = DDBXenable_E &
DBrkWrPend_R;

assign DDBSifDMBH_E = DDBXenable_E &
DWRITE_W_R;

assign DBreakClr = DDBXenable_E &
~JxcpnDis_E &
~CLMI_RHOLD ;


assign DBrkRdPend_P = (DBrkRdPend_R | DBrkRdSet) & ~DBreakClr;
assign DBrkWrPend_P = (DBrkWrPend_R | DBrkWrSet) & ~DBreakClr;



assign DIBifNotDMBH_E = ~CP0_JCTRLDM_E_R &
~DSS_E &
~DBrkRdPend_R &
~DBrkWrPend_R &
IBREAKHIT_E_R;

assign DBpifNotDMBH_E = ~CP0_JCTRLDM_E_R &
~DSS_E &
~DBrkRdPend_R &
~DBrkWrPend_R &
~DIBifNotDMBH_E &
SDBBP_E_R;

assign DINTifNotDMBH_E = ~CP0_JCTRLDM_E_R &
~DSS_E &
~DBrkRdPend_R &
~DBrkWrPend_R &
~DIBifNotDMBH_E &
~DBpifNotDMBH_E &
PBreakEff;

assign PBreakClrifNotDMBH = DINTifNotDMBH_E &
~JxcpnDis_E &
~CLMI_RHOLD ;


assign PBreakPendifDMBH_P = (PBreakPend_R | PBreakSet);
assign PBreakPendifNotDMBH_P = (PBreakPend_R | PBreakSet) & ~PBreakClrifNotDMBH;

assign PBreakPend_P = EJDM_BREAKHIT_W ? PBreakPendifDMBH_P : PBreakPendifNotDMBH_P;




assign DSS_M_P = DSS_E;
assign DDBL_M_P = DDBLuncond_E | (DDBLifDMBH_E & EJDM_BREAKHIT_W);
assign DDBS_M_P = DDBSuncond_E | (DDBSifDMBH_E & EJDM_BREAKHIT_W);

assign DIB_M_P = DIBifNotDMBH_E & ~EJDM_BREAKHIT_W;
assign DBp_M_P = DBpifNotDMBH_E & ~EJDM_BREAKHIT_W;

assign DINT_M_P = DINTifNotDMBH_E & ~EJDM_BREAKHIT_W;



assign JXCPNifDMBH_M_P = ~JxcpnDis_E &
(DSS_E | DDBLuncond_E | DDBSuncond_E |
DDBLifDMBH_E | DDBSifDMBH_E);

assign JXCPNifNotDMBH_M_P = ~JxcpnDis_E &
(DSS_E | DDBLuncond_E | DDBSuncond_E |
DIBifNotDMBH_E | DBpifNotDMBH_E | DINTifNotDMBH_E );

assign JXCPN_M_P = EJDM_BREAKHIT_W ? JXCPNifDMBH_M_P : JXCPNifNotDMBH_M_P;




assign CP0_DBRKSETIFDMBH = (DREAD_W_R | DWRITE_W_R) & ~CP0_JCTRLDM_W_R;

assign CP0_DBREAKCLR = DBreakClr;


assign CP0_JXCPN1STIFDMBH_M_P = ~CLMI_RHOLD & JXCPNifDMBH_M_P;
assign CP0_JXCPN1STIFNOTDMBH_M_P = ~CLMI_RHOLD & JXCPNifNotDMBH_M_P;

assign CP0_DDBXIFDMBH_M_P = ~CLMI_RHOLD & (DDBLifDMBH_E | DDBSifDMBH_E);

assign CP0_DDBXUNCOND_M_P = ~CLMI_RHOLD & (DDBLuncond_E | DDBSuncond_E);

assign CP0_DIBIFNOTDMBH_M_P = ~CLMI_RHOLD & DIBifNotDMBH_E;

always @(BD_W_R or CP0_JXCPN_M_R or CP0_NXCPN_M
or CP0_XCPN_M or DBp_M_R or DDBL_M_R or DDBS_M_R or DIB_M_R
or DINT_M_R or DREG_W_R or DRETTGT_S_R or DSS_M_R
or LDCOP0_M_R or RALU_ADATAREG_M_R) begin




DREG_W_P[31] = CP0_JXCPN_M_R ?
BD_W_R : DREG_W_R[31];


DREG_W_P[30] = CP0_JXCPN_M_R |
(~DRETTGT_S_R & DREG_W_R[30]);












DREG_W_P[29:15] = 15'b00000_00000_00000;

DREG_W_P[14] = 1'b0;
DREG_W_P[13] = 1'b0;

DREG_W_P[12] = CP0_JXCPN_M_R ?
(CP0_NXCPN_M & ~DSS_M_R) :
DREG_W_R[12];

DREG_W_P[11] = 1'b0;
DREG_W_P[10] = 1'b0;

DREG_W_P[09] = 1'b0;


DREG_W_P[08] = (LDCOP0_M_R[`CP0_DREG] & ~CP0_XCPN_M) ?
RALU_ADATAREG_M_R[08] :
DREG_W_R[08];

DREG_W_P[07] = (LDCOP0_M_R[`CP0_DREG] & ~CP0_XCPN_M) ?
RALU_ADATAREG_M_R[07] :
DREG_W_R[07];

DREG_W_P[06] = 1'b0;


DREG_W_P[05] = CP0_JXCPN_M_R ? DINT_M_R : DREG_W_R[05];
DREG_W_P[04] = CP0_JXCPN_M_R ? DIB_M_R : DREG_W_R[04];
DREG_W_P[03] = CP0_JXCPN_M_R ? DDBS_M_R : DREG_W_R[03];
DREG_W_P[02] = CP0_JXCPN_M_R ? DDBL_M_R : DREG_W_R[02];
DREG_W_P[01] = CP0_JXCPN_M_R ? DBp_M_R : DREG_W_R[01];
DREG_W_P[00] = CP0_JXCPN_M_R ? DSS_M_R : DREG_W_R[00];

end

always @(BD_W_R or CP0_JXCPN_M_R or CP0_XCPN_M
or DEPC_W_R or EXTEND_W_R or JAL16_WP1_R or LDCOP0_M_R
or PC_M_R or PC_WP1_R or PC_W_R or RALU_ADATAREG_M_R) begin








casex ({CP0_JXCPN_M_R,
JAL16_WP1_R,
(BD_W_R | EXTEND_W_R),
(LDCOP0_M_R[`CP0_DEPC] & ~CP0_XCPN_M)})

4'b0xx0: DEPC_W_P = DEPC_W_R;
4'b0xx1: DEPC_W_P = RALU_ADATAREG_M_R;
4'b100x: DEPC_W_P = PC_M_R;
4'b101x: DEPC_W_P = PC_W_R;
4'b11xx: DEPC_W_P = PC_WP1_R;

endcase

end





assign DSAVE_W_P[31:00] = (LDCOP0_M_R[`CP0_DSAVE] & ~CP0_XCPN_M) ?
RALU_ADATAREG_M_R[31:00] :
DSAVE_W_R[31:00];


assign Dadalerr_M_P = RALU_DADALERR_E;
assign Daddr_M_P = RALU_DADDR_E;


assign CP0_XCPN_M = CP0_JXCPN_M_R | CP0_NXCPN_M;

assign DREAD_M_P = ~CP0_XCPN_M & RALU_DREAD_E_R;
assign DWRITE_M_P = ~CP0_XCPN_M & RALU_DWRITE_E_R;
assign DREAD_W_P = ~CP0_XCPN_M & DREAD_M_R;
assign DWRITE_W_P = ~CP0_XCPN_M & DWRITE_M_R;
assign ADELINST_M_P = ~CP0_XCPN_M & AdELinstIfVld_M_P;
assign POP_M_P = ~CP0_XCPN_M & POP_E_R;













assign IBREAKHIT_E_P = ~CP0_XCPN_M & IBreakEff_S;
assign ITRACEHIT_E_P = ~CP0_XCPN_M & ITraceEff_S;
assign JTRIG_M_P = ~CP0_XCPN_M & JTRIG_E;










  // synopsys translate_off
  // verilint translate off



always @(posedge SYSCLK) begin
if (`RESET_D2_R_N_) begin


if (EJDM_BREAKHIT_W & ~(DREAD_W_R | DWRITE_W_R) ) begin
$display ("ERROR %t %m: DataMatch BreakHit but neither Dread nor Dwrite", $time);
$stop;
end


if ((DBrkRdSet | DBrkWrSet) & (DBrkRdPend_R | DBrkWrPend_R) ) begin
$display ("ERROR %t %m: Enabled DataMatch BreakHit before pending dbreak was handled.", $time);
$stop;
end


if (POP_M_R & LDCOP0_M_R[`CP0_STATUS] ) begin
$display ("ERROR %t %m: Decode error: Simultaneous Pop status(RFE) and Load Status(MTC0)", $time);
$stop;
end


if ( !(|IMUXNOXB_I_P | IMUXBKUPNOX_I_P | IMUXXCPN_I_P))
begin
$display ("ERROR %t %m: IMUX_I_P=0 when RESET_D2_R_N high", $time);
$stop;
end


casex (SELPC_S)
4'b0001:;
4'b0010:;
4'b0100:;
4'b1000:;
default: begin
$display("ERROR %t %m: Illegal PC-RELATIVE SELECT. SELPC_S value: %b ", $time, SELPC_S);
$stop;
end
endcase


casex (LDEPC_M)
3'b001:;
3'b010:;
3'b100:;
3'b000:;
default: begin
$display("ERROR %t %m: Illegal LDEPC SELECT. LDEPC_M value: %b ", $time, LDEPC_M);
$stop;
end
endcase


casex (STCOP0_E_R)
11'b000_0000_0000:;
11'b000_0000_0001:;
11'b000_0000_0010:;
11'b000_0000_0100:;
11'b000_0000_1000:;
11'b000_0001_0000:;
11'b000_0010_0000:;
11'b000_0100_0000:;
11'b000_1000_0000:;
11'b001_0000_0000:;
11'b010_0000_0000:;
11'b100_0000_0000:;
default: begin
$display("ERROR %t %m: Illegal Store Cop0 SELECT. STCOP0_E_R value: %b ", $time, STCOP0_E_R);
$stop;
end
endcase


casex (LDCOP0_M_R)
6'b00_0000:;
6'b00_0001:;
6'b00_0010:;
6'b00_0100:;
6'b00_1000:;
6'b01_0000:;
6'b10_0000:;
default: begin
$display("ERROR %t %m: Illegal Load Cop0 SELECT. LDCOP0_M_R value: %b ", $time, LDCOP0_M_R);
$stop;
end
endcase

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


InstLo_E_R <= 11'b000_0000_0000;
BackupPC_E_R <= 32'h0000_0000;

INSTM32_I_R_N <= 0;
CP0_INSTM32_I_R_C1_N <= 0;
CP0_INSTM32_I_R_C2_N <= 0;

INSTM32_S_R_C_N <= 9'd0;
CP0_INSTM32_S_R_N <= 0;
CP0_INSTM32_S_R_C1_N <= 0;
CP0_INSTM32_S_R_C2_N <= 0;

end
else if (!CLMI_RHOLD) begin

InstLo_E_R <= INST_S_R[10:0];
BackupPC_E_R <= BackupPC_E_P;

INSTM32_I_R_N <= Instm32_I_P_N;
CP0_INSTM32_I_R_C1_N <= Instm32_I_P_N;
CP0_INSTM32_I_R_C2_N <= Instm32_I_P_N;

INSTM32_S_R_C_N <= {9{INSTM32_I_R_N}};
CP0_INSTM32_S_R_N <= INSTM32_I_R_N;
CP0_INSTM32_S_R_C1_N <= INSTM32_I_R_N;
CP0_INSTM32_S_R_C2_N <= INSTM32_I_R_N;

end

end













always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
Iaddr_I_R <= 32'h0000_0000;
end
else if (!CLMI_RHOLD | IMUXNOXB_I_P[`CP0_SRESET_PC]) begin
Iaddr_I_R <= CP0_IADDR_I_P;
end
end


always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

Cause_W_R <= 32'h0000_0000;
CP0_CCNTL_W_R <= 8'h00;
Status_W_R <= `CP0_INIT_STATUS;
Epc_E_R <= 32'h0000_0000;
CP0_LINK_E_R <= 32'h0000_0000;
BadVAddr_W_R <= 32'h0000_0000;
BadVAddrInst_M_R <= 32'h0000_0000;

PC_S_R <= 32'h0000_0000;
PC_E_R <= 32'h0000_0000;
PC_M_R <= 32'h0000_0000;
PC_W_R <= 32'h0000_0000;
PC_WP1_R <= 32'h0000_0000;

CP0_CDBUS_M_R <= 32'h0000_0000;

BD_W_R <= 1'b0;

DREG_W_R <= 32'h0000_0000;
DEPC_W_R <= 32'h0000_0000;
DSAVE_W_R <= 32'h0000_0000;

DSS_M_R <= 1'b0;
DIB_M_R <= 1'b0;
DBp_M_R <= 1'b0;
DDBL_M_R <= 1'b0;
DDBS_M_R <= 1'b0;
DINT_M_R <= 1'b0;

DREAD_M_R <= 1'b0;
DREAD_W_R <= 1'b0;
DWRITE_M_R <= 1'b0;
DWRITE_W_R <= 1'b0;

CP0_JTRIG_M_R <= 1'b0;
CP0_JXCPN_M_R <= 1'b0;
IBREAKHIT_E_R <= 1'b0;
ITRACEHIT_E_R <= 1'b0;

DRETTGT_I_R <= 1'b0;
DRETTGT_S_R <= 1'b0;
DRETTGT_E_R <= 1'b0;

CP0_JCTRLDM_I_R <= 1'b0;
CP0_JCTRLDM_I_R_C0 <= 1'b0;
CP0_JCTRLDM_S_R <= 1'b0;
CP0_JCTRLDM_E_R <= 1'b0;
CP0_JCTRLDM_M_R <= 1'b0;
CP0_JCTRLDM_M_R_C0 <= 1'b0;
CP0_JCTRLDM_M_R_C1 <= 1'b0;
CP0_JCTRLDM_W_R <= 1'b0;

XCPN_W_R <= 1'b0;

IForceFF2EJT_R <= 1'b1;

end
else if (!CLMI_RHOLD) begin

Cause_W_R <= Cause_W_P;
CP0_CCNTL_W_R <= CCNTL_W_P;
Status_W_R <= Status_W_P;
Epc_E_R <= Epc_E_P;
CP0_LINK_E_R <= LINK_E_P;
BadVAddr_W_R <= BadVAddr_W_P;
BadVAddrInst_M_R <= BadVAddrInst_M_P;





PC_S_R <= {Iaddr_I_R[31:1], INSTM32_I_R_N};
PC_E_R <= PC_S_R;
PC_M_R <= PC_E_R;
PC_W_R <= PC_M_R;
PC_WP1_R <= PC_W_R;

CP0_CDBUS_M_R <= COP0out_M_P;

BD_W_R <= BD_M_R;

DREG_W_R <= DREG_W_P;
DEPC_W_R <= DEPC_W_P;
DSAVE_W_R <= DSAVE_W_P;

DSS_M_R <= DSS_M_P;
DIB_M_R <= DIB_M_P;
DBp_M_R <= DBp_M_P;
DDBL_M_R <= DDBL_M_P;
DDBS_M_R <= DDBS_M_P;
DINT_M_R <= DINT_M_P;

DREAD_M_R <= DREAD_M_P;
DREAD_W_R <= DREAD_W_P;
DWRITE_M_R <= DWRITE_M_P;
DWRITE_W_R <= DWRITE_W_P;

CP0_JTRIG_M_R <= JTRIG_M_P;
CP0_JXCPN_M_R <= JXCPN_M_P;
IBREAKHIT_E_R <= IBREAKHIT_E_P;
ITRACEHIT_E_R <= ITRACEHIT_E_P;

DRETTGT_I_R <= DRETTGT_I_P;
DRETTGT_S_R <= DRETTGT_I_R;
DRETTGT_E_R <= DRETTGT_S_R;

CP0_JCTRLDM_I_R <= CP0_JCTRLDM_I_P;
CP0_JCTRLDM_I_R_C0 <= CP0_JCTRLDM_I_P;
CP0_JCTRLDM_S_R <= CP0_JCTRLDM_I_R_C0;
CP0_JCTRLDM_E_R <= CP0_JCTRLDM_S_R;
CP0_JCTRLDM_M_R <= CP0_JCTRLDM_E_R;
CP0_JCTRLDM_M_R_C0 <= CP0_JCTRLDM_E_R;
CP0_JCTRLDM_M_R_C1 <= CP0_JCTRLDM_E_R;
CP0_JCTRLDM_W_R <= CP0_JCTRLDM_M_R_C1;

XCPN_W_R <= CP0_XCPN_M;

IForceFF2EJT_R <= IForceFF2EJT_P;
end
end
always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin






if (!`RESET_D2_R_N_) begin
IntreqT_R <= 6'b111111;
Intreqs_R <= 6'b000000;
end
else if (!CLMI_RHOLD) begin
IntreqT_R <= INTREQ_N;
Intreqs_R <= ~IntreqT_R;
end

end



always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

IADDRB1_S_R <= 1'b0;
Dadalerr_M_R <= 1'b0;
Daddr_M_R <= 32'h0000_0000;

ADELINST_M_R <= 1'b0;
POP_M_R <= 1'b0;

ADESLDATA_M_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin

IADDRB1_S_R <= Iaddr_I_R[1];
Dadalerr_M_R <= Dadalerr_M_P;
Daddr_M_R <= Daddr_M_P;

ADELINST_M_R <= ADELINST_M_P;
POP_M_R <= POP_M_P;

ADESLDATA_M_R <= ADESLDATA_M_P;

end
end





always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

PBreakPend_R <= 1'b0;
IBreakPend_R <= 1'b0;
DBrkRdPend_R <= 1'b0;
DBrkWrPend_R <= 1'b0;
PTracePend_R <= 1'b0;
ITracePend_R <= 1'b0;
DTracePend_R <= 1'b0;

end
else begin

PBreakPend_R <= PBreakPend_P;
IBreakPend_R <= IBreakPend_P;
DBrkRdPend_R <= DBrkRdPend_P;
DBrkWrPend_R <= DBrkWrPend_P;
PTracePend_R <= PTracePend_P;
ITracePend_R <= ITracePend_P;
DTracePend_R <= DTracePend_P;

end
end




endmodule


