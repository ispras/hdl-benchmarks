



















































































module macd























(

CE_RES_E, CE_SEL_E_R, CE_HALT_E_R_C,

CLK, RESET_DIS, SEN, RESET_D1_R_N, CEI_CEHOLD, CEI_XCPN_M,
CEI_INVLDP_S_R, CEI_ILEXOP_S_R, CEI_INVLD_M, CEI_INST_S_R,
CEI_INSTM32_S_R_N, CEI_AOP_E_R, CEI_BOP_E_R, CFG_CEENBL,
CFG_MACMODE_E_R
);




`include "lxr_symbols.vh"
`include "core_symbols.vh"


























































































input CLK;
input RESET_DIS;
input SEN;
input RESET_D1_R_N;
input CEI_CEHOLD;
input CEI_XCPN_M;
input CEI_INVLDP_S_R;
input CEI_ILEXOP_S_R;
input CEI_INVLD_M;

input [31:0] CEI_INST_S_R;
input CEI_INSTM32_S_R_N;
input [31:0] CEI_AOP_E_R;
input [31:0] CEI_BOP_E_R;

input CFG_CEENBL;
input [`CP0_WMMD:0] CFG_MACMODE_E_R;

output [31:0] CE_RES_E;
output CE_SEL_E_R;


output [`HALT_DRV_RANGE] CE_HALT_E_R_C;






reg CE_SEL_E_R;
reg CE_HALT_E_R;




reg [8:0] CEop_E_R;
reg [3:0] CEopVld_E_R_C;




reg [3:0] Res_E_R_C0;
reg [3:2] Res_E_R_C1;

reg [3:0] SrcA_E;
reg [3:0] SrcB_E;
reg [3:0] Dest_E;

wire [3:0] SrcA_C_P;
wire [3:0] SrcB_C_P;
wire [3:0] Dest_C_P;

reg [3:0] SrcA_C_R;
reg [3:0] SrcB_C_R;
reg [3:0] Dest_C_R;

wire [3:0] Dest_A_P;
wire [3:0] Dest_M3_P;

reg [3:0] Dest_A_R;
reg [3:0] Dest_M3_R;

wire [3:0] Dest_Acc;

reg M2Add_C_R;
reg M2Sub_C_R;
reg MTA_C_R;

reg M2Add_A_R;
reg M2Sub_A_R;
reg MTA_A_R;



wire [3:0] ArSh_C_R;
wire ArAdd_C_R;
wire ArSub_C_R;
wire ArRnd_C_R;
wire ArSat_C_R;
wire ArAdd_A_R;
wire ArSub_A_R;

wire CMult_M1_R;
wire CMult_M2_R;
wire CMult_M3_R;

wire Frac_E_R;
wire M0Trunc_R;
wire M0Frac_R;
wire MTG_C_R;

wire M0Mand16H_E_R;
wire M1Mand16H_E_R;

wire M1Mult_M1_R;
wire M1Mult_M2_R;
wire M1Mult_M3_R;
wire M1Madd32_M12_R;
wire M1Msub32_M12_R;

wire M1Mand32_E_R;

wire M1IsU_E_R;
wire M1Trunc_R;
wire M1Frac_R;

wire M2Sat_C_R;

wire ArRnd_A_R;
wire ArSat_A_R;

wire [3:0] ResSh_E_R_C0;
wire [3:0] ResSh_E_R_C1;

wire [3:0] LEX_INST_AD_E_R;
wire [3:0] LEX_INST_AS_E_R;
wire [3:0] LEX_INST_AT_E_R;
wire [3:0] LEX_INST_SO_E_R;
wire LEX_INST_SAT_E_R;
wire LEX_INST_Z_E_R;
wire LEX_INST_D_E_R;
wire LEX_INST_U_E_R;



assign ArSh_C_R = 4'b0000;
assign ArAdd_C_R = 1'b0;
assign ArSub_C_R = 1'b0;
assign ArRnd_C_R = 1'b0;
assign ArSat_C_R = 1'b0;
assign ArAdd_A_R = 1'b0;
assign ArSub_A_R = 1'b0;

assign CMult_M1_R = 1'b0;
assign CMult_M2_R = 1'b0;
assign CMult_M3_R = 1'b0;

assign Frac_E_R = 1'b0;
assign M0Trunc_R = 1'b0;
assign M0Frac_R = 1'b0;
assign MTG_C_R = 1'b0;

assign M0Mand16H_E_R = 1'b0;
assign M1Mand16H_E_R = 1'b0;

assign M1Mult_M1_R = 1'b0;
assign M1Mult_M2_R = 1'b0;
assign M1Mult_M3_R = 1'b0;
assign M1Madd32_M12_R = 1'b0;
assign M1Msub32_M12_R = 1'b0;

assign M1Mand32_E_R = 1'b0;

assign M1IsU_E_R = 1'b0;
assign M1Trunc_R = 1'b0;
assign M1Frac_R = 1'b0;

assign M2Sat_C_R = 1'b0;

assign ArRnd_A_R = 1'b0;
assign ArSat_A_R = 1'b0;

assign ResSh_E_R_C0 = 4'b0000;
assign ResSh_E_R_C1 = 4'b0000;

assign LEX_INST_AD_E_R = 4'b0000;
assign LEX_INST_AS_E_R = 4'b0000;
assign LEX_INST_AT_E_R = 4'b0000;
assign LEX_INST_SO_E_R = 4'b0000;
assign LEX_INST_SAT_E_R = 1'b0;
assign LEX_INST_Z_E_R = 1'b0;
assign LEX_INST_D_E_R = 1'b0;
assign LEX_INST_U_E_R = 1'b0;



reg M0Mult_M1_R;
reg M0Mult_M2_R;
reg M0Mult_M3_R;
reg M0Madd32_M12_R;
reg M0Msub32_M12_R;

reg [4:0] DivDCyc_R;

reg DivDCyc0_R;
reg DivDCycFirst_R;
reg DivDCycLast_R;
reg DivDCycZF_R_N;
reg DivDCycFL_R_N;

reg DIV2HI_R;
reg DIV2LO_R_C1;
reg DIV2LO_R_C2;

reg DivIsU_R;
reg [3:2] DivDest_R;


wire CFG_CEENBL_C1;






wire ECycGo;
wire myRhold;

wire [8:0] CEop_S;
reg [8:0] CEopIfLEX_S;
reg [8:0] CEopIfM32_S;
reg [8:0] CEopIfM16_S;
wire [8:0] CEopIfNotExcpn_E_P;
wire [8:0] CEop_E_P;

wire CEhaltSrcinE1_S;
wire CEhaltSrcinE2_S;
wire CEhaltSrcinE3_S;
wire CEhaltSrcinEDiv_S;

wire CEhaltSrcAinADiv_S;
wire CEhaltSrcAinA1_S;
wire CEhaltSrcBinADiv_S;
wire CEhaltSrcBinA1_S;

wire CEhaltSrcinE2_E;
wire CEhaltSrcinE3_E;
wire CEhaltSrcinEDiv_E;

wire CEhaltSrcAinADiv_E;
wire CEhaltSrcBinADiv_E;

wire CEhaltTgtDiv_S;
wire CEhaltTgtM1_S;

wire CEhaltTgtDiv_E;

reg [3:0] CEhaltSrcinELEX_S;
reg [3:0] CEhaltSrcinEM32_S;
reg [3:0] CEhaltSrcinEM16_S;
wire [3:0] CEhaltSrcinE_S;

reg [3:0] CEhaltSrcAinALEX_S;
wire [3:0] CEhaltSrcAinA_S;

reg [3:0] CEhaltSrcBinALEX_S;
wire [3:0] CEhaltSrcBinA_S;

reg [3:0] CEhaltSrcinE_E;
reg [3:0] CEhaltSrcAinA_E;
reg [3:0] CEhaltSrcBinA_E;

reg [3:0] CEhaltTgtinALEX_S;
reg [3:0] CEhaltTgtinAM32_S;
reg [3:0] CEhaltTgtinAM16_S;
wire [3:0] CEhaltTgtinA_S;
reg [3:0] CEhaltTgtinA_E;

wire SrcinAConflictHX00_S;
wire SrcinAConflictHX10_E;

wire SrcinEConflictHX00_S;
wire SrcinEConflictHX10_E;

wire TgtinAConflictHX00_S;
wire TgtinAConflictHX10_E;

wire CEhaltDivEn_S;
wire CEhaltMulEn_S;

reg CEhaltDivEnIfLEX_S;
reg CEhaltMulEnIfLEX_S;


reg CEhaltDivEnIfM32_S;
reg CEhaltMulEnIfM32_S;

reg CEhaltDivEnIfM16_S;
reg CEhaltMulEnIfM16_S;

reg CEhaltDivEn_E;
reg CEhaltMulEn_E;

wire CE_HALT_E_P;

wire [31:0] CEI_AOPandV_E;
wire [31:0] CEI_BOPandV_E;

wire [3:0] LEX_INST_AD_S;
wire [3:0] LEX_INST_AS_S;
wire [3:0] LEX_INST_AT_S;
wire [3:0] LEX_INST_SO_S;
wire LEX_INST_SAT_S;
wire LEX_INST_Z_S;
wire LEX_INST_D_S;
wire LEX_INST_U_S;

wire [3:0] LEX_INST_AD_E_P;
wire [3:0] LEX_INST_AS_E_P;
wire [3:0] LEX_INST_AT_E_P;
wire [3:0] LEX_INST_SO_E_P;
wire LEX_INST_SAT_E_P;
wire LEX_INST_Z_E_P;
wire LEX_INST_D_E_P;
wire LEX_INST_U_E_P;

wire LEX_INST_G_E_R;




wire ArResH2SrcA;
wire ArResL2SrcA;
wire M0ResH2SrcA;
wire M0ResL2SrcA;
wire M1ResH2SrcA;
wire M1ResL2SrcA;


wire ArResH2SrcB;
wire ArResL2SrcB;
wire M0ResH2SrcB;
wire M0ResL2SrcB;
wire M1ResH2SrcB;
wire M1ResL2SrcB;


wire ArResL2ACCL;
wire M0ResL2ACCL;
wire M0ResH2ACCL;
wire M1ResL2ACCL;


wire ArResH2ACCH;
wire M0ResH2ACCH;
wire M1ResH2ACCH;

reg [39:0] SrcBusA_C;
reg [39:0] SrcBusB_C;

reg [39:0] ResBusH_A;
reg [39:0] ResBusL_A;

wire [71:0] M0Res;
wire [71:0] M1Res;

wire [31:0] ACC2DIVLO;

wire [39:0] ArA2ACC_A;
wire [39:0] ArB2ACC_A;

wire [39:0] ACC2SrcA_C;
wire [39:0] ACC2SrcB_C;

wire [39:0] M0MPPA_R;
wire [39:0] M1MPPA_R;

reg M0Mand16HIfLEX_S;
wire M0Mand16H_S;
wire M0Mand16H_E_P;
reg M1Mand16HIfLEX_S;
wire M1Mand16H_S;
wire M1Mand16H_E_P;

reg Mand32IfM16_S;
reg Mand32IfM32_S;
reg Mand32IfLEX_S;
wire Mand32_S;
wire M0Mand32_E_P;
wire M1Mand32_E_P;

reg M0Mand32_E_R;

reg MultIsUIfM16_S;
reg MultIsUIfM32_S;
reg MultIsUIfLEX_S;
wire MultIsU_S;
wire M0IsU_E_P;
wire M1IsU_E_P;

reg M0IsU_E_R;

wire Frac_S;
wire Frac_E_P;

wire Frac_M_P;
wire M0Frac_P;
wire Mac0Sub_E;

reg [3:0] ResIfLEX_S;
reg [3:0] ResIfM32_S;
reg [3:0] ResIfM16_S;
wire [3:0] Res_S;
wire [3:0] Res_E_P;

reg [3:0] ResShIfLEX_S;
reg [3:0] ResShIfM32_S;
reg [3:0] ResShIfM16_S;
wire [3:0] ResSh_S;
wire [3:0] ResSh_E_P;

reg M2Add_E;
reg M2Sub_E;
reg M2Sat_E;
reg M2PPA_E;
reg MTA_E;

wire M2Add_C_P;
wire M2Sub_C_P;
wire M2Sat_C_P;
wire M2PPA_C_P;
wire MTA_C_P;

wire M2Add_A_P;
wire M2Sub_A_P;
wire M2Sat_A_P;
wire M2PPA_A_P;
wire MTA_A_P;

wire MAND2PPA_A_P;

reg MTG_E;
wire MTG_C_P;
wire MTG_A_P;

reg CMult_E;

reg [3:0] ArSh_E;
reg ArAdd_E;
reg ArSub_E;
reg ArRnd_E;
reg ArSat_E;

wire [3:0] ArSh_C_P;
wire [3:0] ArSh_A_P;

wire ArAdd_C_P;
wire ArAdd_A_P;

wire ArSub_C_P;
wire ArSub_A_P;

wire ArRnd_C_P;
wire ArRnd_A_P;
wire [1:0] ArRndMode_A_P;

wire ArSat_C_P;
wire ArSat_A_P;

wire CMult_M1_P;
wire CMult_M2_P;
wire CMult_M3_P;

wire M1Trunc_P;
wire M1Frac_P;
wire Mac1Sub_E;


wire M1Mult_M1_P;
wire M1Mult_M2_P;
wire M1Mult_M3_P;

wire M1Madd32_M12_P;
wire M1Msub32_M12_P;
wire M1MMHold_E;


reg Mand32_E;
reg Mult32_E;
reg MultIsU_E;
reg Madd32_E;
reg Msub32_E;

wire Trunc_P;

wire MultMac0;
wire M0Trunc_P;

wire M0Mult_M1_P;
wire M0Mult_M2_P;
wire M0Mult_M3_P;

wire M0Madd32_M12_P;
wire M0Msub32_M12_P;
wire M0MMHold_E;

wire M0MultCycNth;
wire M1MultCycNth;

reg [3:2] DivDest_E;
wire [3:2] DivDest_P;
wire [3:0] DivDest_C1;
wire [3:0] DivDest_C2;

wire [4:0] DivDCyc_P;
wire DivDCyc0_P;
wire DivDCyc0Go;
reg Div_E;
wire DivDCycFirst_P;
wire DivDCycLast_P;
wire DivDCycZF_P_N;
wire DivDCycFL_P_N;
wire DivIsU_P;
reg DivIsU_E;

wire DIVxInProg;

wire MulbusyIfHX00_P;
wire MulbusyIfHX10_P;

wire DivbusyIfHX00_P;
wire DivbusyIfHX10_P;

wire [39:0] DDATAHI;
wire [39:0] DDATALO;
wire DIV2HI_P;
wire DIV2LO_P;

wire UNI_CEI_ILEXOP_S_R;





assign UNI_CEI_ILEXOP_S_R = 1'b0;



wire RESET_D2_R_N;




assign M0MultCycNth = CMult_M1_R | M0Mult_M1_R;
assign M1MultCycNth = CMult_M1_R | M1Mult_M1_R;

macu macu0 (
.CLK (CLK ),

.RESET_D2_R_N (`RESET_D2_R_N_ ),

.CEI_AOPandV_E (CEI_AOPandV_E),
.CEI_BOPandV_E (CEI_BOPandV_E),
.MultIsU (M0IsU_E_R ),
.MultCycNth (M0MultCycNth ),
.Mand32 (M0Mand32_E_R),
.Mand16H (M0Mand16H_E_R),

.M1CMult_M1 (1'b0),

.MMHold_E (M0MMHold_E ),

.MAND2PPA_A_P (MAND2PPA_A_P),
.M2PPA_A_P (M2PPA_A_P ),
.Mult_M2_P (M0Mult_M2_P ),
.Mult_M3_P (M0Mult_M3_P ),

.CEopMSUBGo_E ( Mac0Sub_E ),


.MTG_A_P ( 1'b0 ),
.M2Sat_A_R ( 1'b0 ),
.M0CMult_M1 ( 1'b0 ),
.Frac_E_R ( 1'b0 ),
.Frac_M_R ( 1'b0 ),
.SatMode ( 1'b0 ),
.TruncMode ( 1'b0 ),

.SrcA ( SrcBusA_C ),
.SrcB ( SrcBusB_C ),
.Result ( M0Res ),
.MPPA_R ( M0MPPA_R )
);


assign M1Res = 72'h00_0000_0000_0000_0000;
assign M1MPPA_R = 40'h00_0000_0000;




mdiv mdiv1 (
.CLK ( CLK ),

.RESET_D2_R_N ( `RESET_D2_R_N_ ),

.CEI_AOPandV_E ( CEI_AOPandV_E ),
.CEI_BOPandV_E ( CEI_BOPandV_E ),

.LO_R ( ACC2DIVLO ),
.DivDCyc0Go ( DivDCyc0Go ),
.DivDCyc0_R ( DivDCyc0_R ),
.DivDCycFirst_R ( DivDCycFirst_R ),
.DivDCycLast_P ( DivDCycLast_P ),
.DivDCycLast_R ( DivDCycLast_R ),
.DivDCycZF_R_N ( DivDCycZF_R_N ),
.DivDCycFL_R_N ( DivDCycFL_R_N ),
.DivIsU_R ( DivIsU_R ),
.DIVxInProg ( DIVxInProg ),
.DDATAHI ( DDATAHI ),
.DDATALO ( DDATALO )
);

assign ArA2ACC_A = 40'h00_0000_0000;
assign ArB2ACC_A = 40'h00_0000_0000;




assign CE_HALT_E_R_C = {`HALT_DRV_COUNT{CE_HALT_E_R}};








assign CEI_AOPandV_E = { ({16{CEopVld_E_R_C[0]}} & CEI_AOP_E_R[31:16]),
({16{CEopVld_E_R_C[1]}} & CEI_AOP_E_R[15:00])};





assign CEI_BOPandV_E = { ({16{CEopVld_E_R_C[2]}} & CEI_BOP_E_R[31:16]),
({16{CEopVld_E_R_C[3]}} & CEI_BOP_E_R[15:00])};



















assign ECycGo = ~CEI_XCPN_M & ~CEI_CEHOLD & ~CE_HALT_E_R;



assign myRhold = CEI_CEHOLD | CE_HALT_E_R;






























wire [31:0] INST16WIDE;
assign INST16WIDE = CEI_INST_S_R[31:0];


always @(CEI_INST_S_R or INST16WIDE) begin



CEopIfM32_S[5:0] = CEI_INST_S_R[`M32_SUBOP];

case (CEI_INST_S_R[`M32_OPCODE])

`M32_SPECIAL: CEopIfM32_S[7:6] = 2'b00;
`M32_LEXOP4180: CEopIfM32_S[7:6] = 2'b01;
`M32_SPECIAL2: CEopIfM32_S[7:6] = 2'b10;
default: CEopIfM32_S[7:6] = 2'b00;

endcase


case ({CEI_INST_S_R[`M32_OPCODE],CEI_INST_S_R[`M32_SUBOP]})

{`M32_SPECIAL,`M32_MFHI }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_MTHI }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_MFLO }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_MTLO }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_MULT }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_MULTU}: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_DIV }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL,`M32_DIVU }: CEopIfM32_S[8] = 1;

{`M32_SPECIAL2,`M32_MAD }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL2,`M32_MADU}: CEopIfM32_S[8] = 1;
{`M32_SPECIAL2,`M32_MSUB }: CEopIfM32_S[8] = 1;
{`M32_SPECIAL2,`M32_MSUBU}: CEopIfM32_S[8] = 1;

{`M32_LEXOP4180 ,`M32_MADH }: CEopIfM32_S[8] = 1;
{`M32_LEXOP4180 ,`M32_MADL }: CEopIfM32_S[8] = 1;
{`M32_LEXOP4180 ,`M32_MAZH }: CEopIfM32_S[8] = 1;
{`M32_LEXOP4180 ,`M32_MAZL }: CEopIfM32_S[8] = 1;

{`M32_LEXOP4180 ,`M32_MSBH }: CEopIfM32_S[8] = 1;
{`M32_LEXOP4180 ,`M32_MSBL }: CEopIfM32_S[8] = 1;
{`M32_LEXOP4180 ,`M32_MSZH }: CEopIfM32_S[8] = 1;
{`M32_LEXOP4180 ,`M32_MSZL }: CEopIfM32_S[8] = 1;

default: CEopIfM32_S[8] = 0;

endcase



CEopIfLEX_S[7:6] = 2'b11;
CEopIfLEX_S[5:0] = CEI_INST_S_R[`M32_SUBOP];

case ({CEI_INST_S_R[`M32_SUBOP]})

`LEX_MFA : CEopIfLEX_S[8] = 1;
`LEX_MTA : CEopIfLEX_S[8] = 1;
`LEX_MADDA : CEopIfLEX_S[8] = 1;
`LEX_MSUBA : CEopIfLEX_S[8] = 1;
`LEX_DIVA : CEopIfLEX_S[8] = 1;
`LEX_CMULTA : CEopIfLEX_S[8] = 1;
`LEX_ADDMA : CEopIfLEX_S[8] = 1;
`LEX_SUBMA : CEopIfLEX_S[8] = 1;
`LEX_RNDA : CEopIfLEX_S[8] = 1;

default: CEopIfLEX_S[8] = 0;

endcase


CEopIfM16_S[5:0] = {1'b0,INST16WIDE[4:0]};


case (INST16WIDE[`M16_OPCODE])

`M16_RR: CEopIfM16_S[7:6] = 2'b00;
`M16_LEXOP4180: CEopIfM16_S[7:6] = 2'b01;
default: CEopIfM16_S[7:6] = 2'b00;

endcase

case ({INST16WIDE[`M16_OPCODE],INST16WIDE[`M16_SUB_RR]})

{`M16_RR ,`M16_MFHI }: CEopIfM16_S[8] = 1;

{`M16_RR ,`M16_MFLO }: CEopIfM16_S[8] = 1;

{`M16_RR ,`M16_MULT }: CEopIfM16_S[8] = 1;
{`M16_RR ,`M16_MULTU}: CEopIfM16_S[8] = 1;
{`M16_RR ,`M16_DIV }: CEopIfM16_S[8] = 1;
{`M16_RR ,`M16_DIVU }: CEopIfM16_S[8] = 1;

{`M16_LEXOP4180 ,`M16_MADH }: CEopIfM16_S[8] = 1;
{`M16_LEXOP4180 ,`M16_MADL }: CEopIfM16_S[8] = 1;
{`M16_LEXOP4180 ,`M16_MAZH }: CEopIfM16_S[8] = 1;
{`M16_LEXOP4180 ,`M16_MAZL }: CEopIfM16_S[8] = 1;

{`M16_LEXOP4180 ,`M16_MSBH }: CEopIfM16_S[8] = 1;
{`M16_LEXOP4180 ,`M16_MSBL }: CEopIfM16_S[8] = 1;
{`M16_LEXOP4180 ,`M16_MSZH }: CEopIfM16_S[8] = 1;
{`M16_LEXOP4180 ,`M16_MSZL }: CEopIfM16_S[8] = 1;

default: CEopIfM16_S[8] = 0;

endcase

end




assign CEop_S[8] = ~CEI_INVLDP_S_R &
(UNI_CEI_ILEXOP_S_R ? CEopIfLEX_S[8] :
((~CEI_INSTM32_S_R_N) ? CEopIfM32_S[8]
: CEopIfM16_S[8]));

assign CEop_S[7:0] = (UNI_CEI_ILEXOP_S_R ? CEopIfLEX_S[7:0] :
((~CEI_INSTM32_S_R_N) ? CEopIfM32_S[7:0]
: CEopIfM16_S[7:0]));

assign Frac_S = UNI_CEI_ILEXOP_S_R ? CFG_MACMODE_E_R[`MACD_MMD_MF] : 1'b0;


assign CEopIfNotExcpn_E_P = myRhold ? CEop_E_R : CEop_S;

assign Frac_E_P = myRhold ? Frac_E_R : Frac_S;




assign CEop_E_P[8] = CEopIfNotExcpn_E_P[8] & ~CEI_XCPN_M & CFG_CEENBL_C1;
assign CEop_E_P[7:0] = CEopIfNotExcpn_E_P[7:0];








































assign LEX_INST_AD_S = CEI_INST_S_R[`REG_AD];
assign LEX_INST_AT_S = CEI_INST_S_R[`REG_AT];
assign LEX_INST_AS_S = CEI_INST_S_R[`REG_AS];
assign LEX_INST_SO_S = CEI_INST_S_R[`REG_SO];
assign LEX_INST_SAT_S = CEI_INST_S_R[`M32_SUB_S];
assign LEX_INST_Z_S = CEI_INST_S_R[`M32_SUB_Z];
assign LEX_INST_D_S = CEI_INST_S_R[`M32_SUB_D];
assign LEX_INST_U_S = CEI_INST_S_R[`M32_SUB_U];
assign LEX_INST_G_E_R = LEX_INST_Z_E_R;






always @(CEI_INST_S_R or INST16WIDE or LEX_INST_AD_S
or LEX_INST_AS_S or LEX_INST_AT_S or UNI_CEI_ILEXOP_S_R) begin


CEhaltSrcinEM32_S = 4'b0000;
CEhaltTgtinAM32_S = 4'b0000;
CEhaltDivEnIfM32_S = 0;
CEhaltMulEnIfM32_S = 0;


case ({CEI_INST_S_R[`M32_OPCODE],CEI_INST_S_R[`M32_SUBOP]})


{`M32_SPECIAL,`M32_MFHI }: CEhaltSrcinEM32_S = 4'b0010;
{`M32_SPECIAL,`M32_MFLO }: CEhaltSrcinEM32_S = 4'b0001;

{`M32_SPECIAL,`M32_MTHI }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0010; end
{`M32_SPECIAL,`M32_MTLO }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0001; end


{`M32_SPECIAL,`M32_MULT }: begin
CEhaltMulEnIfM32_S = 1;
CEhaltTgtinAM32_S = 4'b0011;
end
{`M32_SPECIAL,`M32_MULTU}: begin
CEhaltMulEnIfM32_S = 1;
CEhaltTgtinAM32_S = 4'b0011;
end

{`M32_SPECIAL2,`M32_MAD }: begin
CEhaltMulEnIfM32_S = 1;
CEhaltTgtinAM32_S = 4'b0011;
end
{`M32_SPECIAL2,`M32_MADU }: begin
CEhaltMulEnIfM32_S = 1;
CEhaltTgtinAM32_S = 4'b0011;
end
{`M32_SPECIAL2,`M32_MSUB }: begin
CEhaltMulEnIfM32_S = 1;
CEhaltTgtinAM32_S = 4'b0011;
end
{`M32_SPECIAL2,`M32_MSUBU}: begin
CEhaltMulEnIfM32_S = 1;
CEhaltTgtinAM32_S = 4'b0011;
end

{`M32_SPECIAL,`M32_DIV }: begin CEhaltDivEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0011; end
{`M32_SPECIAL,`M32_DIVU }: begin CEhaltDivEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0011; end

{`M32_LEXOP4180 ,`M32_MADH }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0010; end
{`M32_LEXOP4180 ,`M32_MADL }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0001; end
{`M32_LEXOP4180 ,`M32_MAZH }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0010; end
{`M32_LEXOP4180 ,`M32_MAZL }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0001; end

{`M32_LEXOP4180 ,`M32_MSBH }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0010; end
{`M32_LEXOP4180 ,`M32_MSBL }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0001; end
{`M32_LEXOP4180 ,`M32_MSZH }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0010; end
{`M32_LEXOP4180 ,`M32_MSZL }: begin CEhaltMulEnIfM32_S = 1; CEhaltTgtinAM32_S = 4'b0001; end

default: ;

endcase


CEhaltSrcinELEX_S = 4'b0000;
CEhaltSrcAinALEX_S = 4'b0000;


CEhaltSrcBinALEX_S = 4'b0000;
CEhaltTgtinALEX_S = 4'b0000;
CEhaltDivEnIfLEX_S = 1'b0;
CEhaltMulEnIfLEX_S = 1'b0;


case ({UNI_CEI_ILEXOP_S_R,CEI_INST_S_R[`M32_SUBOP]})


{1'b1,`LEX_MFA }: CEhaltSrcinELEX_S = LEX_INST_AT_S;

{1'b1,`LEX_MTA }: begin CEhaltMulEnIfLEX_S = 1; CEhaltTgtinALEX_S = LEX_INST_AD_S; end

{1'b1,`LEX_DIVA }: begin CEhaltDivEnIfLEX_S = 1; CEhaltTgtinALEX_S = LEX_INST_AD_S; end

{1'b1,`LEX_MADDA }: begin
CEhaltMulEnIfLEX_S = 1'b1;
CEhaltTgtinALEX_S = LEX_INST_AD_S;
end
{1'b1,`LEX_MSUBA }: begin
CEhaltMulEnIfLEX_S = 1'b1;
CEhaltTgtinALEX_S = LEX_INST_AD_S;
end

{1'b1,`LEX_CMULTA}: begin CEhaltMulEnIfLEX_S = 1; CEhaltTgtinALEX_S = LEX_INST_AD_S; end

{1'b1,`LEX_ADDMA }: begin
CEhaltMulEnIfLEX_S = 1'b1;
CEhaltTgtinALEX_S = LEX_INST_AD_S;
CEhaltSrcAinALEX_S = LEX_INST_AS_S;
CEhaltSrcBinALEX_S = LEX_INST_AT_S;
end
{1'b1,`LEX_SUBMA }: begin
CEhaltMulEnIfLEX_S = 1'b1;
CEhaltTgtinALEX_S = LEX_INST_AD_S;
CEhaltSrcAinALEX_S = LEX_INST_AS_S;
CEhaltSrcBinALEX_S = LEX_INST_AT_S;
end
{1'b1,`LEX_RNDA }: begin
CEhaltMulEnIfLEX_S = 1'b1;
CEhaltTgtinALEX_S = LEX_INST_AT_S;
CEhaltSrcAinALEX_S = LEX_INST_AT_S & 4'b1101;
CEhaltSrcBinALEX_S = LEX_INST_AT_S & 4'b1110;
end

default: ;

endcase



CEhaltSrcinEM16_S = 4'b0000;
CEhaltTgtinAM16_S = 4'b0000;
CEhaltDivEnIfM16_S = 1'b0;
CEhaltMulEnIfM16_S = 1'b0;


case ({INST16WIDE[`M16_OPCODE],INST16WIDE[`M16_SUB_RR]})

{`M16_RR ,`M16_MFHI }: CEhaltSrcinEM16_S = 4'b0010;
{`M16_RR ,`M16_MFLO }: CEhaltSrcinEM16_S = 4'b0001;




{`M16_RR ,`M16_MULT }: begin
CEhaltMulEnIfM16_S = 1;
CEhaltTgtinAM16_S = 4'b0011;
end
{`M16_RR ,`M16_MULTU}: begin
CEhaltMulEnIfM16_S = 1;
CEhaltTgtinAM16_S = 4'b0011;
end

{`M16_RR ,`M16_DIV }: begin CEhaltDivEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0011; end
{`M16_RR ,`M16_DIVU }: begin CEhaltDivEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0011; end

{`M16_LEXOP4180 ,`M16_MADH }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0010; end
{`M16_LEXOP4180 ,`M16_MADL }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0001; end
{`M16_LEXOP4180 ,`M16_MAZH }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0010; end
{`M16_LEXOP4180 ,`M16_MAZL }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0001; end

{`M16_LEXOP4180 ,`M16_MSBH }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0010; end
{`M16_LEXOP4180 ,`M16_MSBL }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0001; end
{`M16_LEXOP4180 ,`M16_MSZH }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0010; end
{`M16_LEXOP4180 ,`M16_MSZL }: begin CEhaltMulEnIfM16_S = 1; CEhaltTgtinAM16_S = 4'b0001; end

default: ;

endcase
end




assign CEhaltSrcinE_S = ~{4{CEI_INVLDP_S_R}} &
(UNI_CEI_ILEXOP_S_R ? CEhaltSrcinELEX_S :
((~CEI_INSTM32_S_R_N) ? CEhaltSrcinEM32_S
: CEhaltSrcinEM16_S));

assign CEhaltSrcAinA_S = ~{4{CEI_INVLDP_S_R}} &
(UNI_CEI_ILEXOP_S_R ? CEhaltSrcAinALEX_S
: 4'b0000);

assign CEhaltSrcBinA_S = ~{4{CEI_INVLDP_S_R}} &
(UNI_CEI_ILEXOP_S_R ? CEhaltSrcBinALEX_S
: 4'b0000);

assign CEhaltTgtinA_S = ~{4{CEI_INVLDP_S_R}} &
(UNI_CEI_ILEXOP_S_R ? CEhaltTgtinALEX_S :
((~CEI_INSTM32_S_R_N) ? CEhaltTgtinAM32_S
: CEhaltTgtinAM16_S));

assign CEhaltMulEn_S = ~CEI_INVLDP_S_R &
(UNI_CEI_ILEXOP_S_R ? CEhaltMulEnIfLEX_S :
((~CEI_INSTM32_S_R_N) ? CEhaltMulEnIfM32_S
: CEhaltMulEnIfM16_S));
assign CEhaltDivEn_S = ~CEI_INVLDP_S_R &
(UNI_CEI_ILEXOP_S_R ? CEhaltDivEnIfLEX_S :
((~CEI_INSTM32_S_R_N) ? CEhaltDivEnIfM32_S
: CEhaltDivEnIfM16_S));

always @(CEI_INST_S_R or INST16WIDE or LEX_INST_D_S
or LEX_INST_U_S or UNI_CEI_ILEXOP_S_R) begin


case ({INST16WIDE[`M16_OPCODE],INST16WIDE[`M16_SUB_RR]})

{`M16_RR ,`M16_MULT }: begin Mand32IfM16_S = 1'b1; MultIsUIfM16_S = 1'b0; end
{`M16_RR ,`M16_MULTU}: begin Mand32IfM16_S = 1'b1; MultIsUIfM16_S = 1'b1; end
default: begin Mand32IfM16_S = 1'b0; MultIsUIfM16_S = 1'b0; end

endcase


case ({CEI_INST_S_R[`M32_OPCODE],CEI_INST_S_R[`M32_SUBOP]})

{`M32_SPECIAL ,`M32_MULT }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b0; end
{`M32_SPECIAL ,`M32_MULTU }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b1; end
{`M32_SPECIAL ,`M32_MTHI }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b0; end
{`M32_SPECIAL ,`M32_MTLO }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b0; end
{`M32_SPECIAL2,`M32_MAD }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b0; end
{`M32_SPECIAL2,`M32_MADU }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b1; end
{`M32_SPECIAL2,`M32_MSUB }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b0; end
{`M32_SPECIAL2,`M32_MSUBU }: begin Mand32IfM32_S = 1'b1; MultIsUIfM32_S = 1'b1; end
default: begin Mand32IfM32_S = 1'b0; MultIsUIfM32_S = 1'b0; end

endcase


case ({UNI_CEI_ILEXOP_S_R,CEI_INST_S_R[`M32_SUBOP]})

{1'b1, `LEX_MADDA} : begin
M0Mand16HIfLEX_S = 1'b0;
M1Mand16HIfLEX_S = LEX_INST_D_S;
Mand32IfLEX_S = ~LEX_INST_D_S;
MultIsUIfLEX_S = LEX_INST_U_S & ~LEX_INST_D_S;
end
{1'b1, `LEX_MSUBA} : begin
M0Mand16HIfLEX_S = 1'b0;
M1Mand16HIfLEX_S = LEX_INST_D_S;
Mand32IfLEX_S = ~LEX_INST_D_S;
MultIsUIfLEX_S = LEX_INST_U_S & ~LEX_INST_D_S;
end
{1'b1, `LEX_CMULTA} : begin
M0Mand16HIfLEX_S = 1'b1;
M1Mand16HIfLEX_S = 1'b0;
Mand32IfLEX_S = 1'b0;
MultIsUIfLEX_S = 1'b0;
end
{1'b1, `LEX_MTA} : begin
M0Mand16HIfLEX_S = 1'b0;
M1Mand16HIfLEX_S = 1'b0;
Mand32IfLEX_S = 1'b1;
MultIsUIfLEX_S = 1'b0;
end
default : begin
M0Mand16HIfLEX_S = 1'b0;
M1Mand16HIfLEX_S = 1'b0;
Mand32IfLEX_S = 1'b0;
MultIsUIfLEX_S = 1'b0;
end

endcase

end

assign M0Mand16H_S = UNI_CEI_ILEXOP_S_R ? M0Mand16HIfLEX_S : 1'b0;
assign M1Mand16H_S = UNI_CEI_ILEXOP_S_R ? M1Mand16HIfLEX_S : 1'b0;

assign M0Mand16H_E_P = myRhold ? M0Mand16H_E_R : M0Mand16H_S;
assign M1Mand16H_E_P = myRhold ? M1Mand16H_E_R : M1Mand16H_S;

assign MultIsU_S = ~CEI_INVLDP_S_R & ~CEI_XCPN_M &
(UNI_CEI_ILEXOP_S_R ? MultIsUIfLEX_S :
((~CEI_INSTM32_S_R_N) ? MultIsUIfM32_S
: MultIsUIfM16_S));

assign Mand32_S = ~CEI_INVLDP_S_R & ~CEI_XCPN_M &
(UNI_CEI_ILEXOP_S_R ? Mand32IfLEX_S :
((~CEI_INSTM32_S_R_N) ? Mand32IfM32_S
: Mand32IfM16_S));



always @(CEI_INST_S_R or INST16WIDE or LEX_INST_AT_S
or LEX_INST_SO_S or UNI_CEI_ILEXOP_S_R) begin


case ({INST16WIDE[`M16_OPCODE],INST16WIDE[`M16_SUB_RR]})

{`M16_RR ,`M16_MFHI }: begin ResIfM16_S = 4'b0010; ResShIfM16_S = 4'b0000; end
{`M16_RR ,`M16_MFLO }: begin ResIfM16_S = 4'b0001; ResShIfM16_S = 4'b0000; end
default: begin ResIfM16_S = 4'b0000; ResShIfM16_S = 4'b0000; end
endcase


case ({CEI_INST_S_R[`M32_OPCODE],CEI_INST_S_R[`M32_SUBOP]})

{`M32_SPECIAL,`M32_MFHI }: begin ResIfM32_S = 4'b0010; ResShIfM32_S = 4'b0000; end
{`M32_SPECIAL,`M32_MFLO }: begin ResIfM32_S = 4'b0001; ResShIfM32_S = 4'b0000; end
default: begin ResIfM32_S = 4'b0000; ResShIfM32_S = 4'b0000; end

endcase


case ({UNI_CEI_ILEXOP_S_R,CEI_INST_S_R[`M32_SUBOP]})

{1'b1 ,`LEX_MFA }: begin ResIfLEX_S = LEX_INST_AT_S; ResShIfLEX_S = LEX_INST_SO_S; end
default: begin ResIfLEX_S = 4'b0000; ResShIfLEX_S = 4'b0000; end

endcase

end


assign Res_S = ~{4{CEI_INVLDP_S_R}} & ~{4{CEI_XCPN_M}} &
(UNI_CEI_ILEXOP_S_R ? ResIfLEX_S :
((~CEI_INSTM32_S_R_N) ? ResIfM32_S
: ResIfM16_S));

assign ResSh_S = ~{4{CEI_INVLDP_S_R}} &
(UNI_CEI_ILEXOP_S_R ? ResShIfLEX_S :
((~CEI_INSTM32_S_R_N) ? ResShIfM32_S
: ResShIfM16_S));



always @(CEop_E_R or LEX_INST_AD_E_R or LEX_INST_AS_E_R
or LEX_INST_AT_E_R) begin

CEhaltSrcinE_E = 4'b0000;
CEhaltSrcAinA_E = 4'b0000;


CEhaltSrcBinA_E = 4'b0000;
CEhaltTgtinA_E = 4'b0000;
CEhaltDivEn_E = 1'b0;
CEhaltMulEn_E = 1'b0;

case (CEop_E_R)



{3'b100,`SOP_MFHI }: CEhaltSrcinE_E = 4'b0010;
{3'b100,`SOP_MFLO }: CEhaltSrcinE_E = 4'b0001;

{3'b100,`SOP_MTHI }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = 4'b0010; end
{3'b100,`SOP_MTLO }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = 4'b0001; end


{3'b100,`SOP_MULT }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = 4'b0011;
end
{3'b100,`SOP_MULTU}: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = 4'b0011;
end

{3'b110,`SOP2_MAD }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = 4'b0011;
end
{3'b110,`SOP2_MADU }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = 4'b0011;
end
{3'b110,`SOP2_MSUB }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = 4'b0011;
end
{3'b110,`SOP2_MSUBU}: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = 4'b0011;
end

{3'b100,`SOP_DIV }: begin CEhaltDivEn_E = 1; CEhaltTgtinA_E = 4'b0011; end
{3'b100,`SOP_DIVU }: begin CEhaltDivEn_E = 1; CEhaltTgtinA_E = 4'b0011; end

{3'b101,`LOP_MADH }: begin CEhaltMulEn_E = 1'b1; CEhaltTgtinA_E = 4'b0010; end
{3'b101,`LOP_MADL }: begin CEhaltMulEn_E = 1'b1; CEhaltTgtinA_E = 4'b0001; end
{3'b101,`LOP_MAZH }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = 4'b0010; end
{3'b101,`LOP_MAZL }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = 4'b0001; end

{3'b101,`LOP_MSBH }: begin CEhaltMulEn_E = 1'b1; CEhaltTgtinA_E = 4'b0010; end
{3'b101,`LOP_MSBL }: begin CEhaltMulEn_E = 1'b1; CEhaltTgtinA_E = 4'b0001; end
{3'b101,`LOP_MSZH }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = 4'b0010; end
{3'b101,`LOP_MSZL }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = 4'b0001; end

{3'b111,`LEX_MFA }: CEhaltSrcinE_E = LEX_INST_AT_E_R;

{3'b111,`LEX_MTA }: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = LEX_INST_AD_E_R; end

{3'b111,`LEX_DIVA }: begin CEhaltDivEn_E = 1; CEhaltTgtinA_E = LEX_INST_AD_E_R; end

{3'b111,`LEX_MADDA }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = LEX_INST_AD_E_R;
end
{3'b111,`LEX_MSUBA }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = LEX_INST_AD_E_R;
end

{3'b111,`LEX_CMULTA}: begin CEhaltMulEn_E = 1; CEhaltTgtinA_E = LEX_INST_AD_E_R; end

{3'b111,`LEX_ADDMA }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = LEX_INST_AD_E_R;
CEhaltSrcAinA_E = LEX_INST_AS_E_R;
CEhaltSrcBinA_E = LEX_INST_AT_E_R;
end
{3'b111,`LEX_SUBMA }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = LEX_INST_AD_E_R;
CEhaltSrcAinA_E = LEX_INST_AS_E_R;
CEhaltSrcBinA_E = LEX_INST_AT_E_R;
end
{3'b111,`LEX_RNDA }: begin
CEhaltMulEn_E = 1'b1;
CEhaltTgtinA_E = LEX_INST_AT_E_R;
CEhaltSrcAinA_E = LEX_INST_AT_E_R & 4'b1101;
CEhaltSrcBinA_E = LEX_INST_AT_E_R & 4'b1110;
end
default: ;

endcase
end




assign Res_E_P = myRhold ? Res_E_R_C0 : Res_S;
assign ResSh_E_P = myRhold ? ResSh_E_R_C0 : ResSh_S;

assign M0IsU_E_P = (M0Mult_M1_P) ? M0IsU_E_R :
myRhold ? MultIsU_E
: MultIsU_S;

assign M1IsU_E_P = (M1Mult_M1_P) ? M1IsU_E_R :
myRhold ? MultIsU_E
: MultIsU_S;

assign M0Mand32_E_P = (M0Mult_M1_P) ? M0Mand32_E_R :
myRhold ? Mand32_E
: Mand32_S;

assign M1Mand32_E_P = (M1Mult_M1_P) ? M1Mand32_E_R :
myRhold ? Mand32_E
: Mand32_S;

assign LEX_INST_AD_E_P = myRhold ? LEX_INST_AD_E_R : LEX_INST_AD_S;
assign LEX_INST_AS_E_P = myRhold ? LEX_INST_AS_E_R : LEX_INST_AS_S;
assign LEX_INST_AT_E_P = myRhold ? LEX_INST_AT_E_R : LEX_INST_AT_S;
assign LEX_INST_SO_E_P = myRhold ? LEX_INST_SO_E_R : LEX_INST_SO_S;
assign LEX_INST_SAT_E_P = myRhold ? LEX_INST_SAT_E_R : LEX_INST_SAT_S;
assign LEX_INST_Z_E_P = myRhold ? LEX_INST_Z_E_R : LEX_INST_Z_S;
assign LEX_INST_D_E_P = myRhold ? LEX_INST_D_E_R : LEX_INST_D_S;
assign LEX_INST_U_E_P = myRhold ? LEX_INST_U_E_R : LEX_INST_U_S;











always @(CEop_E_R or DivDest_R or DivIsU_R
or LEX_INST_AD_E_R or LEX_INST_AS_E_R or LEX_INST_AT_E_R
or LEX_INST_D_E_R or LEX_INST_G_E_R or LEX_INST_SAT_E_R
or LEX_INST_SO_E_R or LEX_INST_U_E_R or LEX_INST_Z_E_R) begin





SrcA_E = 4'b0000;
SrcB_E = 4'b0000;
Dest_E = 4'b0000;
M2Add_E = 1'b0;
M2Sub_E = 1'b0;
M2Sat_E = 1'b0;
M2PPA_E = 1'b0;
MTA_E = 1'b0;
MTG_E = 1'b0;
CMult_E = 1'b0;
ArSh_E = 4'b0000;
ArAdd_E = 1'b0;
ArSub_E = 1'b0;
ArRnd_E = 1'b0;
ArSat_E = 1'b0;


Mult32_E = 0;
Mand32_E = 0;
Div_E = 0;
MultIsU_E = 1'b0;
Madd32_E = 1'b0;
Msub32_E = 1'b0;



DivDest_E = DivDest_R;
DivIsU_E = DivIsU_R;




case (CEop_E_R)




{3'b101,`LOP_MADH} : begin
SrcA_E = 4'b0010;
Dest_E = 4'b0010;
M2Add_E = 1'b1;
M2Sub_E = 1'b0;
M2Sat_E = 1'b0;
end
{3'b101,`LOP_MADL} : begin
SrcA_E = 4'b0001;
Dest_E = 4'b0001;
M2Add_E = 1'b1;
M2Sub_E = 1'b0;
M2Sat_E = 1'b0;
end
{3'b101,`LOP_MAZH} : begin
Dest_E = 4'b0010;
M2Add_E = 1'b1;
M2Sub_E = 1'b0;
M2Sat_E = 1'b0;
end
{3'b101,`LOP_MAZL} : begin
Dest_E = 4'b0001;
M2Add_E = 1'b1;
M2Sub_E = 1'b0;
M2Sat_E = 1'b0;
end

{3'b101,`LOP_MSBH} : begin
SrcA_E = 4'b0010;
Dest_E = 4'b0010;
M2Add_E = 1'b0;
M2Sub_E = 1'b1;
M2Sat_E = 1'b0;
end
{3'b101,`LOP_MSBL} : begin
SrcA_E = 4'b0001;
Dest_E = 4'b0001;
M2Add_E = 1'b0;
M2Sub_E = 1'b1;
M2Sat_E = 1'b0;
end
{3'b101,`LOP_MSZH} : begin
Dest_E = 4'b0010;
M2Add_E = 1'b0;
M2Sub_E = 1'b1;
M2Sat_E = 1'b0;
end
{3'b101,`LOP_MSZL} : begin
Dest_E = 4'b0001;
M2Add_E = 1'b0;
M2Sub_E = 1'b1;
M2Sat_E = 1'b0;
end


{3'b100,`SOP_MTHI}: begin
Dest_E = 4'b0010;
Mand32_E = 1;
MTA_E = 1'b1;
MTG_E = 1'b0;
end
{3'b100,`SOP_MTLO}: begin
Dest_E = 4'b0001;
Mand32_E = 1;
MTA_E = 1'b1;
MTG_E = 1'b0;
end

{3'b100,`SOP_MULT }: begin
Mult32_E = 1;
Mand32_E = 1;
MultIsU_E = 0;
Dest_E = 4'b0011;
end

{3'b100,`SOP_MULTU}: begin
Mult32_E = 1;
Mand32_E = 1;
MultIsU_E = 1;
Dest_E = 4'b0011;
end

{3'b110,`SOP2_MAD }: begin
SrcA_E = 4'b0010;
SrcB_E = 4'b0001;
Mult32_E = 1;
Mand32_E = 1;
MultIsU_E = 0;
Madd32_E = 1;
Dest_E = 4'b0011;
end

{3'b110,`SOP2_MADU}: begin
SrcA_E = 4'b0010;
SrcB_E = 4'b0001;
Mult32_E = 1;
Mand32_E = 1;
MultIsU_E = 1;
Madd32_E = 1;
Dest_E = 4'b0011;
end

{3'b110,`SOP2_MSUB }: begin
SrcA_E = 4'b0010;
SrcB_E = 4'b0001;
Mult32_E = 1;
Mand32_E = 1;
MultIsU_E = 0;
Msub32_E = 1;
Dest_E = 4'b0011;
end

{3'b110,`SOP2_MSUBU}: begin
SrcA_E = 4'b0010;
SrcB_E = 4'b0001;
Mult32_E = 1;
Mand32_E = 1;
MultIsU_E = 1;
Msub32_E = 1;
Dest_E = 4'b0011;
end

{3'b100,`SOP_DIV }: begin
Div_E = 1;
DivIsU_E = 0;
DivDest_E = 2'b00;
end

{3'b100,`SOP_DIVU}: begin
Div_E = 1;
DivIsU_E = 1;
DivDest_E = 2'b00;
end


{3'b111,`LEX_MTA}: begin
Dest_E = LEX_INST_AD_E_R;
MTA_E = 1'b1;
MTG_E = LEX_INST_G_E_R;
end

{3'b111,`LEX_DIVA }: begin
Div_E = 1;
DivIsU_E = LEX_INST_U_E_R;
DivDest_E = LEX_INST_AD_E_R[3:2];
end

{3'b111,`LEX_MADDA} : begin
SrcA_E = LEX_INST_AD_E_R & {2'b11, ~LEX_INST_Z_E_R, 1'b0 };
SrcB_E = LEX_INST_AD_E_R & {2'b11, 1'b0 , ~LEX_INST_Z_E_R};
Dest_E = LEX_INST_AD_E_R;

Mult32_E = ~LEX_INST_D_E_R;
Mand32_E = ~LEX_INST_D_E_R;
MultIsU_E = LEX_INST_U_E_R & ~LEX_INST_D_E_R;
Madd32_E = ~LEX_INST_Z_E_R & ~LEX_INST_D_E_R;

M2Add_E = LEX_INST_D_E_R;
M2Sub_E = 1'b0;
M2Sat_E = LEX_INST_SAT_E_R & LEX_INST_D_E_R;
end
{3'b111,`LEX_MSUBA} : begin
SrcA_E = LEX_INST_AD_E_R & {2'b11, ~LEX_INST_Z_E_R, 1'b0 };
SrcB_E = LEX_INST_AD_E_R & {2'b11, 1'b0 , ~LEX_INST_Z_E_R};
Dest_E = LEX_INST_AD_E_R;

Mult32_E = ~LEX_INST_D_E_R;
Mand32_E = ~LEX_INST_D_E_R;
MultIsU_E = LEX_INST_U_E_R & ~LEX_INST_D_E_R;
Msub32_E = ~LEX_INST_Z_E_R & ~LEX_INST_D_E_R;

M2Add_E = 1'b0;
M2Sub_E = LEX_INST_D_E_R;
M2Sat_E = LEX_INST_SAT_E_R & LEX_INST_D_E_R;
end
{3'b111,`LEX_CMULTA} : begin
CMult_E = 1'b1;
SrcA_E = LEX_INST_AD_E_R & {2'b11, 1'b1 , 1'b0 };
SrcB_E = LEX_INST_AD_E_R & {2'b11, 1'b0 , 1'b1 };
Dest_E = LEX_INST_AD_E_R;
end
{3'b111,`LEX_ADDMA} : begin
SrcA_E = LEX_INST_AS_E_R;
SrcB_E = LEX_INST_AT_E_R;
Dest_E = LEX_INST_AD_E_R;
ArSat_E = LEX_INST_SAT_E_R;
ArAdd_E = 1'b1;
end
{3'b111,`LEX_SUBMA} : begin
SrcA_E = LEX_INST_AS_E_R;
SrcB_E = LEX_INST_AT_E_R;
Dest_E = LEX_INST_AD_E_R;
ArSat_E = LEX_INST_SAT_E_R;
ArSub_E = 1'b1;
end
{3'b111,`LEX_RNDA} : begin
SrcA_E = LEX_INST_AS_E_R;
SrcB_E = LEX_INST_AT_E_R;
Dest_E = LEX_INST_AD_E_R;
ArSh_E = LEX_INST_SO_E_R;
ArRnd_E = 1'b1;
end
default: ;

endcase
end



























assign CEhaltSrcinE1_S = (( CEhaltSrcinE_S[3:2] == Dest_E [3:2]) &
((CEhaltSrcinE_S[1] & Dest_E [1])|
(CEhaltSrcinE_S[0] & Dest_E [0])));

assign CEhaltSrcinE2_S = (( CEhaltSrcinE_S[3:2] == Dest_C_R[3:2]) &
((CEhaltSrcinE_S[1] & Dest_C_R[1])|
(CEhaltSrcinE_S[0] & Dest_C_R[0])));

assign CEhaltSrcinE3_S = (( CEhaltSrcinE_S[3:2] == Dest_A_R[3:2]) &
((CEhaltSrcinE_S[1] & Dest_A_R[1])|
(CEhaltSrcinE_S[0] & Dest_A_R[0])) &
(M0Mult_M2_R | M1Mult_M2_R | CMult_M2_R));

assign CEhaltSrcinEDiv_S = ((CEhaltSrcinE_S[3:2] == DivDest_E[3:2]) &
(CEhaltSrcinE_S[0] |
CEhaltSrcinE_S[1] ) & DivbusyIfHX00_P);

assign SrcinEConflictHX00_S = CEhaltSrcinE1_S |
CEhaltSrcinE2_S |
CEhaltSrcinE3_S |
CEhaltSrcinEDiv_S ;


assign CEhaltSrcAinADiv_S = ((CEhaltSrcAinA_S[3:2] == DivDest_E[3:2]) &
(CEhaltSrcAinA_S[0] |
CEhaltSrcAinA_S[1] ) & DivbusyIfHX00_P);

assign CEhaltSrcAinA1_S = (( CEhaltSrcAinA_S[3:2] == Dest_E [3:2]) &
((CEhaltSrcAinA_S[0] & Dest_E [1])|
(CEhaltSrcAinA_S[1] & Dest_E [0])) &
(CMult_E | Mult32_E));


assign CEhaltSrcBinADiv_S = ((CEhaltSrcBinA_S[3:2] == DivDest_E[3:2]) &
(CEhaltSrcBinA_S[0] |
CEhaltSrcBinA_S[1] ) & DivbusyIfHX00_P);

assign CEhaltSrcBinA1_S = (( CEhaltSrcBinA_S[3:2] == Dest_E [3:2]) &
((CEhaltSrcBinA_S[0] & Dest_E [1])|
(CEhaltSrcBinA_S[1] & Dest_E [0])) &
(CMult_E | Mult32_E));

assign SrcinAConflictHX00_S = ( CEhaltSrcAinADiv_S |
CEhaltSrcAinA1_S |
CEhaltSrcBinADiv_S |
CEhaltSrcBinA1_S );


assign CEhaltTgtDiv_S = ((CEhaltTgtinA_S[3:2] == DivDest_E[3:2]) &
(CEhaltTgtinA_S[1] |
CEhaltTgtinA_S[0] ) & DivbusyIfHX00_P);

assign CEhaltTgtM1_S = (( CEhaltTgtinA_S[3:2] == Dest_E [3:2]) &
((CEhaltTgtinA_S[1] & Dest_E [1])|
(CEhaltTgtinA_S[0] & Dest_E [0])) &
(CMult_E | Mult32_E));



assign TgtinAConflictHX00_S = ( CEhaltTgtDiv_S |
CEhaltTgtM1_S );




assign CEhaltSrcinE2_E = (( CEhaltSrcinE_E[3:2] == Dest_C_R[3:2]) &
((CEhaltSrcinE_E[0] & Dest_C_R[0])|
(CEhaltSrcinE_E[1] & Dest_C_R[1])));

assign CEhaltSrcinE3_E = (( CEhaltSrcinE_E[3:2] == Dest_A_R[3:2]) &
((CEhaltSrcinE_E[0] & Dest_A_R[0])|
(CEhaltSrcinE_E[1] & Dest_A_R[1])) &
(M0Mult_M2_R | M1Mult_M2_R | CMult_M2_R));

assign CEhaltSrcinEDiv_E = ((CEhaltSrcinE_E[3:2] == DivDest_R[3:2]) &
(CEhaltSrcinE_E[1] |
CEhaltSrcinE_E[0] ) & DivbusyIfHX10_P);


assign SrcinEConflictHX10_E = ( CEhaltSrcinE2_E |
CEhaltSrcinE3_E |
CEhaltSrcinEDiv_E );


assign CEhaltSrcAinADiv_E = ((CEhaltSrcAinA_E[3:2] == DivDest_R[3:2]) &
(CEhaltSrcAinA_E[1] |
CEhaltSrcAinA_E[0] ) & DivbusyIfHX10_P);


assign CEhaltSrcBinADiv_E = ((CEhaltSrcBinA_E[3:2] == DivDest_R[3:2]) &
(CEhaltSrcBinA_E[1] |
CEhaltSrcBinA_E[0] ) &DivbusyIfHX10_P);


assign SrcinAConflictHX10_E = ( CEhaltSrcAinADiv_E |
CEhaltSrcBinADiv_E );


assign CEhaltTgtDiv_E = ((CEhaltTgtinA_E[3:2] == DivDest_R[3:2]) &
(CEhaltTgtinA_E[1] |
CEhaltTgtinA_E[0] ) & DivbusyIfHX10_P);


assign TgtinAConflictHX10_E = CEhaltTgtDiv_E ;




assign ArResH2SrcA = (ArAdd_A_R | ArSub_A_R | ArRnd_A_R) &
(Dest_A_R[3:2] == SrcA_C_R[3:2]) &
Dest_A_R[1] & SrcA_C_R[1];

assign ArResL2SrcA = (ArAdd_A_R | ArSub_A_R | ArRnd_A_R) &
(Dest_A_R [3:2] == SrcA_C_R[3:2]) &
Dest_A_R [0] & SrcA_C_R[0];

assign M0ResL2SrcA = M0Mult_M3_R &
(Dest_M3_R[3:2] == SrcA_C_R[3:2]) &
(Dest_M3_R[0] & SrcA_C_R[0] ) |
M0Mult_M2_R;

assign M0ResH2SrcA = (M0Mult_M3_R &
(Dest_M3_R[3:2] == SrcA_C_R[3:2]) &
(Dest_M3_R[1] & SrcA_C_R[1] )) |
(CMult_M3_R &
(Dest_M3_R[3:2] == SrcA_C_R[3:2]) &
(Dest_M3_R[0] & SrcA_C_R[0] )) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
(Dest_A_R [3:2] == SrcA_C_R[3:2]) &
(Dest_A_R [1] & SrcA_C_R[1] )) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
(Dest_A_R [3:2] == SrcA_C_R[3:2]) &
(Dest_A_R [0] & SrcA_C_R[0] ));




assign M1ResL2SrcA = 1'b0;
assign M1ResH2SrcA = 1'b0;



assign ArResH2SrcB = (ArAdd_A_R | ArSub_A_R | ArRnd_A_R) &
(Dest_A_R[3:2] == SrcB_C_R[3:2]) &
Dest_A_R[1] & SrcB_C_R[1];

assign ArResL2SrcB = (ArAdd_A_R | ArSub_A_R | ArRnd_A_R) &
(Dest_A_R [3:2] == SrcB_C_R[3:2]) &
Dest_A_R [0] & SrcB_C_R[0];

assign M0ResL2SrcB = M0Mult_M3_R &
(Dest_M3_R[3:2] == SrcB_C_R[3:2]) &
(Dest_M3_R[0] & SrcB_C_R[0] );

assign M0ResH2SrcB = (M0Mult_M3_R &
(Dest_M3_R[3:2] == SrcB_C_R[3:2]) &
(Dest_M3_R[1] & SrcB_C_R[1] )) |
(CMult_M3_R &
(Dest_M3_R[3:2] == SrcB_C_R[3:2]) &
(Dest_M3_R[0] & SrcB_C_R[0] )) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
(Dest_A_R [3:2] == SrcB_C_R[3:2]) &
(Dest_A_R [1] & SrcB_C_R[1] )) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
(Dest_A_R [3:2] == SrcB_C_R[3:2]) &
(Dest_A_R [0] & SrcB_C_R[0] )) |
M0Mult_M2_R;


assign M1ResL2SrcB = 1'b0;
assign M1ResH2SrcB = 1'b0;


always @(ACC2SrcA_C or ACC2SrcB_C or ArA2ACC_A
or ArB2ACC_A or ArResH2SrcA or ArResH2SrcB or ArResL2SrcA
or ArResL2SrcB or M0Res or M0ResH2SrcA or M0ResH2SrcB
or M0ResL2SrcA or M0ResL2SrcB or M1Res or M1ResH2SrcA
or M1ResH2SrcB or M1ResL2SrcA or M1ResL2SrcB) begin

case (1'b1)
ArResH2SrcA: SrcBusA_C = ArA2ACC_A;
ArResL2SrcA: SrcBusA_C = ArB2ACC_A;
M0ResL2SrcA: SrcBusA_C = {8'h00, M0Res[31:0]};
M0ResH2SrcA: SrcBusA_C = M0Res[71:32];
M1ResL2SrcA: SrcBusA_C = {8'h00, M1Res[31:0]};
M1ResH2SrcA: SrcBusA_C = M1Res[71:32];
default: SrcBusA_C = ACC2SrcA_C;
endcase

case (1'b1)
ArResH2SrcB: SrcBusB_C = ArA2ACC_A;
ArResL2SrcB: SrcBusB_C = ArB2ACC_A;
M0ResL2SrcB: SrcBusB_C = {8'h00, M0Res[31:0]};
M0ResH2SrcB: SrcBusB_C = M0Res[71:32];
M1ResL2SrcB: SrcBusB_C = {8'h00, M1Res[31:0]};
M1ResH2SrcB: SrcBusB_C = M1Res[71:32];
default: SrcBusB_C = ACC2SrcB_C;
endcase

end


assign ArResL2ACCL = (ArAdd_A_R | ArSub_A_R | ArRnd_A_R) &
Dest_A_R[0];

assign M0ResL2ACCL = M0Mult_M3_R &
Dest_M3_R[0];

assign M0ResH2ACCL = (CMult_M3_R &
Dest_M3_R[0]) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
Dest_A_R [1]) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
Dest_A_R [0]) ;

assign M1ResL2ACCL = M1Mult_M3_R &
Dest_M3_R[0];



assign ArResH2ACCH = (ArAdd_A_R | ArSub_A_R | ArRnd_A_R) &
Dest_A_R[1];

assign M0ResH2ACCH = (CMult_M3_R &
Dest_M3_R[1]) |

((M2Add_A_R | M2Sub_A_R | MTA_A_R) &
Dest_A_R [1]) |

(M0Mult_M3_R &
Dest_M3_R[1]);


assign M1ResH2ACCH = 1'b0;


always @(ArA2ACC_A or ArResH2ACCH or ArResL2ACCL
or M0Res or M0ResH2ACCH or M0ResH2ACCL or M0ResL2ACCL
or M1Res or M1ResH2ACCH or M1ResL2ACCL) begin

case (1'b1)
ArResL2ACCL: ResBusL_A = ArA2ACC_A;
M0ResL2ACCL: ResBusL_A = {8'h00, M0Res[31:0]};
M0ResH2ACCL: ResBusL_A = M0Res[71:32];
M1ResL2ACCL: ResBusL_A = {8'h00, M1Res[31:0]};
default: ResBusL_A = {8'h00, M0Res[31:0]};
endcase

case (1'b1)
ArResH2ACCH: ResBusH_A = ArA2ACC_A;
M0ResH2ACCH: ResBusH_A = M0Res[71:32];
M1ResH2ACCH: ResBusH_A = M1Res[71:32];
default: ResBusH_A = M0Res[71:32];
endcase

end

assign MAND2PPA_A_P = MTA_C_R & ~MTG_C_R & ~CEI_INVLD_M;
assign M2PPA_A_P = (M2Add_C_R | M2Sub_C_R) & ~CEI_INVLD_M;




assign DIVxInProg = DivDCyc0_R | (| DivDCyc_R);
assign DivDCyc0_P = Div_E & ECycGo;
assign DivDCycFirst_P = DivDCyc0Go;
assign DivDCycLast_P = (DivDCyc_R == 5'b1_0001);
assign DivDCycFL_P_N = ~(DivDCycFirst_P || DivDCycLast_P);
assign DivDCycZF_P_N = ~(DivDCyc0_P || DivDCycFirst_P);



assign DivDCyc_P = DivDCyc0Go ? 5'b0_0001 :
(DivDCycLast_R ? 5'b0_0000 :
({5{(| DivDCyc_R)}} &
(DivDCyc_R + 5'b0_0001)));



assign DivDCyc0Go = DivDCyc0_R & ~CEI_INVLD_M;




assign DIV2HI_P = DivDCycLast_P;
assign DIV2LO_P = (| DivDCyc_P);


assign DivIsU_P = ECycGo ? DivIsU_E : DivIsU_R;
assign DivDest_P = ECycGo ? DivDest_E : DivDest_R;




assign DivbusyIfHX00_P = Div_E |
DivDCyc0_R |
(( | DivDCyc_R) & ~DivDCycLast_R);


assign MulbusyIfHX00_P = Mult32_E;






assign DivbusyIfHX10_P =
DivDCyc0_R |
(( | DivDCyc_R) & ~DivDCycLast_R);

assign MulbusyIfHX10_P = 1'b0;



















assign CE_HALT_E_P =
(SrcinEConflictHX00_S & ~myRhold & ~CEI_XCPN_M) |
(SrcinAConflictHX00_S & ~myRhold & ~CEI_XCPN_M) |
(TgtinAConflictHX00_S & ~myRhold & ~CEI_XCPN_M) |

(CEhaltDivEn_S & DivbusyIfHX00_P & ~myRhold & ~CEI_XCPN_M) |
(CEhaltMulEn_S & MulbusyIfHX00_P & ~myRhold & ~CEI_XCPN_M) |

(SrcinEConflictHX10_E & myRhold & ~CEI_XCPN_M) |
(SrcinAConflictHX10_E & myRhold & ~CEI_XCPN_M) |
(TgtinAConflictHX10_E & myRhold & ~CEI_XCPN_M) |
(CEhaltDivEn_E & DivbusyIfHX10_P & myRhold & ~CEI_XCPN_M) |
(CEhaltMulEn_E & MulbusyIfHX10_P & myRhold & ~CEI_XCPN_M) ;

assign Dest_Acc = (CMult_M3_R | M0Mult_M3_R | M1Mult_M3_R) ? Dest_M3_R :
(CMult_M2_R | M0Mult_M2_R | M1Mult_M2_R) ? 4'b0000
: Dest_A_R;



macfile macfile
(

.CLK ( CLK ),
.RESET_D1_R_N ( RESET_D1_R_N ),
.RESET_DIS ( RESET_DIS ),

.DivDest_C1 ( DivDest_C1 ),
.DivDest_C2 ( DivDest_C2 ),

.SrcA_C_R ( SrcA_C_R ),
.SrcB_C_R ( SrcB_C_R ),
.Dest_Acc ( Dest_Acc ),

.ResSh_E_R_C0 ( ResSh_E_R_C0 ),
.ResSh_E_R_C1 ( ResSh_E_R_C1 ),

.DDATAHI ( DDATAHI ),
.DDATALO ( DDATALO ),
.Res2HI ( ResBusH_A ),
.Res2LO ( ResBusL_A ),

.Res_E_R_C0 ( Res_E_R_C0 ),
.Res_E_R_C1 ( Res_E_R_C1 ),
.Rhold ( myRhold ),
.Xcpn ( CEI_XCPN_M ),

.ACC2DIVLO ( ACC2DIVLO ),
.ACC2SrcA_C ( ACC2SrcA_C ),
.ACC2SrcB_C ( ACC2SrcB_C ),
.ACC2RES_E ( CE_RES_E )
);







assign SrcA_C_P = SrcA_E & {4{ECycGo}};
assign SrcB_C_P = SrcB_E & {4{ECycGo}};
assign Dest_C_P = Dest_E & {4{ECycGo}};

assign Dest_A_P = Dest_C_R & {4{~CEI_INVLD_M}};
assign Dest_M3_P = (CMult_M2_R | M0Mult_M2_R | M1Mult_M2_R) ? Dest_A_R : 4'b0000;

assign M2Add_C_P = M2Add_E & ECycGo;
assign M2Sub_C_P = M2Sub_E & ECycGo;
assign M2Sat_C_P = M2Sat_E & ECycGo;
assign M2PPA_C_P = M2PPA_E & ECycGo;
assign MTA_C_P = MTA_E & ECycGo;
assign MTG_C_P = MTG_E & ECycGo;

assign M2Add_A_P = M2Add_C_R & ~CEI_INVLD_M;
assign M2Sub_A_P = M2Sub_C_R & ~CEI_INVLD_M;
assign M2Sat_A_P = M2Sat_C_R & ~CEI_INVLD_M;
assign MTA_A_P = MTA_C_R & ~CEI_INVLD_M;
assign MTG_A_P = MTG_C_R & ~CEI_INVLD_M;

assign CMult_M1_P = CMult_E & ECycGo;
assign CMult_M2_P = CMult_M1_R & ~CEI_INVLD_M;
assign CMult_M3_P = CMult_M2_R;

assign M0Mult_M1_P = MultMac0 & Mult32_E & ECycGo;
assign M0Mult_M2_P = M0Mult_M1_R & ~CEI_INVLD_M;
assign M0Mult_M3_P = M0Mult_M2_R;

assign M0Madd32_M12_P = M0Mult_M1_P ? Madd32_E : M0Madd32_M12_R;
assign M0Msub32_M12_P = M0Mult_M1_P ? Msub32_E : M0Msub32_M12_R;

assign M0Trunc_P = 1'b0;


assign M0Frac_P = (M0Mult_M1_P|CMult_M1_P) ? Frac_M_P : M0Frac_R;

assign M1Mult_M1_P = ~MultMac0 & Mult32_E & ECycGo;
assign M1Mult_M2_P = M1Mult_M1_R & ~CEI_INVLD_M;
assign M1Mult_M3_P = M1Mult_M2_R;

assign M1Madd32_M12_P = M1Mult_M1_P ? Madd32_E : M1Madd32_M12_R;
assign M1Msub32_M12_P = M1Mult_M1_P ? Msub32_E : M1Msub32_M12_R;

assign M1Trunc_P = 1'b0;

assign M1Frac_P = (M1Mult_M1_P|CMult_M1_P) ? Frac_M_P : M1Frac_R;

assign MultMac0 = ~M0Mult_M1_R;
assign Mac0Sub_E = ((M2Sub_E |
(M0Mult_M1_P&Msub32_E)) & ECycGo) |
(M0Mult_M1_R&M0Msub32_M12_R);

assign Mac1Sub_E = (M2Sub_E|CMult_E) & ECycGo;

assign M0MMHold_E = M0Mult_M1_P | (CMult_E & ECycGo);
assign M1MMHold_E = M1Mult_M1_P | (CMult_E & ECycGo);


assign Trunc_P = (CEop_E_R[7:6] == 2'b11) ? CFG_MACMODE_E_R[`MACD_MMD_MT] : 1'b0;
assign Frac_M_P = (CEop_E_R[7:6] == 2'b11) ? CFG_MACMODE_E_R[`MACD_MMD_MF] : 1'b0;

assign ArSh_C_P = ArSh_E;
assign ArAdd_C_P = ArAdd_E;
assign ArSub_C_P = ArSub_E;
assign ArRnd_C_P = ArRnd_E;
assign ArSat_C_P = ArSat_E & ECycGo;

assign ArSat_A_P = ArSat_C_R ;
assign ArSh_A_P = ArSh_C_R;
assign ArAdd_A_P = ArAdd_C_R;
assign ArSub_A_P = ArSub_C_R;
assign ArRnd_A_P = ArRnd_C_R;
assign ArRndMode_A_P = CFG_MACMODE_E_R[`MACD_MMD_RND];


assign DivDest_C1 = {2'b00, DIV2HI_R, DIV2LO_R_C1 };
assign DivDest_C2 = {2'b00, DIV2HI_R, DIV2LO_R_C2 };




wire NC_FOO = SEN;











reg RESET_X_R_N;
always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;





assign CFG_CEENBL_C1 = CFG_CEENBL;


always @(posedge CLK `negedge_RESET_D2_R_N_) begin

if (~`RESET_D2_R_N_) begin

CEop_E_R <= 9'b0_0000_0000;
CEopVld_E_R_C<= 4'b0000;
CE_SEL_E_R <= 0;

Res_E_R_C0 <= 4'b0000;
Res_E_R_C1 <= 2'b00;
CE_HALT_E_R <= 0;

SrcA_C_R <= 4'b0000;
SrcB_C_R <= 4'b0000;
Dest_C_R <= 4'b0000;

Dest_A_R <= 4'b0000;
Dest_M3_R <= 4'b0000;

M2Add_C_R <= 1'b0;
M2Sub_C_R <= 1'b0;
MTA_C_R <= 1'b0;

M2Add_A_R <= 1'b0;
M2Sub_A_R <= 1'b0;
MTA_A_R <= 1'b0;




M0Mult_M1_R <= 1'b0;
M0Mult_M2_R <= 1'b0;
M0Mult_M3_R <= 1'b0;

M0Madd32_M12_R <= 1'b0;
M0Msub32_M12_R <= 1'b0;

M0Mand32_E_R <= 1'b0;

M0IsU_E_R <= 1'b0;

DivDCyc_R <= 5'b0_0000;
DivDCyc0_R <= 1'b0;
DivDCycFirst_R <= 1'b0;
DivDCycLast_R <= 1'b0;
DivDCycFL_R_N <= 1'b1;
DivDCycZF_R_N <= 1'b1;
DivIsU_R <= 1'b0;
DivDest_R <= 2'b00;
DIV2HI_R <= 1'b0;
DIV2LO_R_C1 <= 1'b0;
DIV2LO_R_C2 <= 1'b0;
end

else begin

CEop_E_R <= CEop_E_P;
CEopVld_E_R_C<= {4{CEop_E_P[8]}};
CE_SEL_E_R <= CEop_E_P[8];

CE_HALT_E_R <= CE_HALT_E_P;

Res_E_R_C0 <= Res_E_P;
Res_E_R_C1 <= Res_E_P[3:2];

SrcA_C_R <= SrcA_C_P;
SrcB_C_R <= SrcB_C_P;
Dest_C_R <= Dest_C_P;

Dest_A_R <= Dest_A_P;
Dest_M3_R <= Dest_M3_P;

M2Add_C_R <= M2Add_C_P;
M2Sub_C_R <= M2Sub_C_P;
MTA_C_R <= MTA_C_P;

M2Add_A_R <= M2Add_A_P;
M2Sub_A_R <= M2Sub_A_P;




MTA_A_R <= MTA_A_P;

M0Mult_M1_R <= M0Mult_M1_P;
M0Mult_M2_R <= M0Mult_M2_P;
M0Mult_M3_R <= M0Mult_M3_P;
M0Madd32_M12_R <= M0Madd32_M12_P;
M0Msub32_M12_R <= M0Msub32_M12_P;

M0Mand32_E_R <= M0Mand32_E_P;

M0IsU_E_R <= M0IsU_E_P;

DivDCyc_R <= DivDCyc_P;
DivDCyc0_R <= DivDCyc0_P;
DivDCycFirst_R <= DivDCycFirst_P;
DivDCycLast_R <= DivDCycLast_P;
DivDCycZF_R_N <= DivDCycZF_P_N;
DivDCycFL_R_N <= DivDCycFL_P_N;
DivIsU_R <= DivIsU_P;
DivDest_R <= DivDest_P;
DIV2HI_R <= DIV2HI_P;
DIV2LO_R_C1 <= DIV2LO_P;
DIV2LO_R_C2 <= DIV2LO_P;
end
end








always @(posedge CLK) begin
if (`RESET_D2_R_N_) begin




end
end



wire write_m0l = (((Dest_A_R[3:2] == 2'b00) & Dest_A_R[0]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b00) & Dest_M3_R[0]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b00) & DivDCycLast_R);

wire write_m1l = (((Dest_A_R[3:2] == 2'b01) & Dest_A_R[0]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b01) & Dest_M3_R[0]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b01) & DivDCycLast_R);


wire write_m2l = (((Dest_A_R[3:2] == 2'b10) & Dest_A_R[0]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b10) & Dest_M3_R[0]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b10) & DivDCycLast_R);

wire write_m3l = (((Dest_A_R[3:2] == 2'b11) & Dest_A_R[0]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b11) & Dest_M3_R[0]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b11) & DivDCycLast_R);

wire write_m0h = (((Dest_A_R[3:2] == 2'b00) & Dest_A_R[1]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b00) & Dest_M3_R[1]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b00) & DivDCycLast_R);

wire write_m1h = (((Dest_A_R[3:2] == 2'b01) & Dest_A_R[1]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b01) & Dest_M3_R[1]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b01) & DivDCycLast_R);

wire write_m2h = (((Dest_A_R[3:2] == 2'b10) & Dest_A_R[1]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b10) & Dest_M3_R[1]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b10) & DivDCycLast_R);

wire write_m3h = (((Dest_A_R[3:2] == 2'b11) & Dest_A_R[1]) &
(M2Add_A_R | M2Sub_A_R | MTA_A_R |
ArAdd_A_R | ArSub_A_R | ArRnd_A_R)) |
(((Dest_M3_R[3:2] == 2'b11) & Dest_M3_R[1]) &
(M0Mult_M3_R | M1Mult_M3_R | CMult_M3_R)) |
((DivDest_R == 2'b11) & DivDCycLast_R);

reg write_m0l_r;
reg write_m1l_r;
reg write_m2l_r;
reg write_m3l_r;
reg write_m0h_r;
reg write_m1h_r;
reg write_m2h_r;
reg write_m3h_r;
always @(posedge CLK) begin
write_m0l_r <= write_m0l;
write_m1l_r <= write_m1l;
write_m2l_r <= write_m2l;
write_m3l_r <= write_m3l;
write_m0h_r <= write_m0h;
write_m1h_r <= write_m1h;
write_m2h_r <= write_m2h;
write_m3h_r <= write_m3h;
end





endmodule

