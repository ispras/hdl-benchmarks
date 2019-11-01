






`include "../../include/x_def.v"





module DEC (/* ---------- Inputs ---------- */
 T_RST, DSPCLK, CM_rd,
`ifdef FD_DFT
SCAN_TEST,
`endif
 PPclr_h, GO_D, GO_E, GO_C, Prderr_Eg,
/*TRAP_Eg,*/ ICE_ST, redoSTI_h,
 MV, Ctrue,
 Upd_IR, SPC, SBP_EN, /*HALT_Eg,*/ enTYP3,


 IR, IREo, EX_en, EX_enc, Dummy_E,
 Dummy_R, DU_R, dBR_R, idBR_R, RET_R, RTS_R,
EXIT_E, DU_Eg, Call_Ed, RTI_Ed, RTS_Ed, BR_Ed,
RET_Ed, Nseq_Ed, IDLE_Eg, MACdep_Eg, MTCNTR_Eg,
MTOWRCNTR_Eg, MTtoppcs_Eg, MTIMASK_Eg, MTICNTL_Eg,
MTIFC_Eg, MTMSTAT_Eg, MFPSQ_E, MFtoppcs_Eg,
MFIMASK_E, MFICNTL_E, MFSSTAT_E, MFMSTAT_E,
MFCNTR_E, Stkctl_Eg, Modctl_Eg, MpopLP_Eg,
imm16_E, imm14_E, Long_Eg, Nrti_Ed,
 ALUop_E, cdAM_E, MTAX0_E, MTAX1_E, MTAY0_E,
MTAY1_E, MTAR_E, MTASTAT_E, MFAX0_E, MFAX1_E,
MFAY0_E, MFAY1_E, MFAR_E, MFASTAT_E, MFALU_E,
pMFALU_E, DIVQ_E, DIVS_E, updAR_E, updAF_E,
ALUop_R, type9, DIVQ_R, DIVS_R,
 MACop_E, satMR_Eg, Rbyp_Rg, Xbyp_Rg, Ybyp_Rg,
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, MTMR0_Eg,
MTMR1_Eg, MTMR2_Eg, MFMX0_E, MFMX1_E, MFMY0_E,
MFMY1_E, MFMR0_E, MFMR1_E, MFMR2_E, MFMAC_E,
pMFMAC_E, updMR_E, updMF_E, Squ_Rx,
MACop_R,
 SHTop_E, imSHT_E, MTSI_E, MTSE_E, MTSR0_E,
MTSR1_E, MTSB_E, MFSI_E, MFSE_E, MFSR0_E, MFSR1_E,
MFSB_E, MFSHT_E, pMFSHT_E, updSR0_Eg, updSR1_Eg,
updSR_E,
 MTIreg_E, MTLreg_E, MTMreg_E,
MFIreg_E, MFLreg_E, MFMreg_E,
MFDAG1_E, MFDAG2_E, accPM_E, Double_R, Double_E,
Post1_E, Post2_E, DAG1D_R, DAG2D_R, imAddr_R,
DAG1_EN, DAG2_EN, DAG2P_R, DMAen_R,
 Pread_R, Pwrite_R, Dread_R, Dwrite_R, IOcmd_R,
IOread_R, IOwrite_R, IDLE_R, MTPMOVL_E, MTDMOVL_E,
MFPMOVL_E, MFDMOVL_E,
 MFSPT_E, MFRX0_E, MFTX0_E, MFRX1_E, MFTX1_E, MTRX0_E,
MTTX0_E, MTRX1_E, MTTX1_E,
 SBP_R, MFIDR_E, MTIDR_Eg, nNOP_Eg, accCM_R, accCM_E,
wrCM_R, /*wrCM_E,*/ rdCM_E);

input [23:0] CM_rd,
SPC;
input T_RST,
DSPCLK,
PPclr_h,
GO_D,
GO_E,
GO_C,


ICE_ST,
redoSTI_h,
SBP_EN,
MV,
Ctrue,
Prderr_Eg,
enTYP3,
Upd_IR;
`ifdef FD_DFT
input SCAN_TEST;
`endif
output [23:0] IR;
output [19:0] IREo;
output [7:0] MTIreg_E,
MTLreg_E,
MTMreg_E,
MFIreg_E,
MFLreg_E,
MFMreg_E;
output

Dummy_R,
Dummy_E,
EX_en,
EX_enc,
Long_Eg,

DU_R, DU_Eg,
dBR_R,
idBR_R,
RET_R,
RTS_R,
EXIT_E,
Call_Ed,
RTI_Ed,
RTS_Ed,
BR_Ed,
RET_Ed,
Nseq_Ed,
Nrti_Ed,
IDLE_R, IDLE_Eg,
MACdep_Eg,
MTCNTR_Eg,
MTOWRCNTR_Eg,
MTtoppcs_Eg,
MTIMASK_Eg,
MTICNTL_Eg,
MTIFC_Eg,
MTMSTAT_Eg,
MFPSQ_E,
MFtoppcs_Eg,
MFIMASK_E,
MFICNTL_E,
MFSSTAT_E,
MFMSTAT_E,
MFCNTR_E,
imm16_E,
imm14_E,
Stkctl_Eg,
Modctl_Eg,

MpopLP_Eg,



ALUop_E,
ALUop_R,

cdAM_E,
DIVQ_R,
DIVS_R,
DIVQ_E,
DIVS_E,
type9,
MTAX0_E,
MTAX1_E,
MTAY0_E,
MTAY1_E,
MTAR_E,
MTASTAT_E,
MFAX0_E,
MFAX1_E,
MFAY0_E,
MFAY1_E,
MFAR_E,
MFASTAT_E,
MFALU_E,
pMFALU_E,
updAR_E,
updAF_E,

MACop_E,
MACop_R,
satMR_Eg,
Rbyp_Rg,
Xbyp_Rg,
Ybyp_Rg,
MTMX0_Eg,
MTMX1_Eg,
MTMY0_Eg,
MTMY1_Eg,
MTMR0_Eg,
MTMR1_Eg,
MTMR2_Eg,
MFMX0_E,
MFMX1_E,
MFMY0_E,
MFMY1_E,
MFMR0_E,
MFMR1_E,
MFMR2_E,
MFMAC_E,
pMFMAC_E,
updMR_E,
updMF_E,
Squ_Rx,

SHTop_E,


imSHT_E,
MTSI_E,
MTSE_E,
MTSR0_E,
MTSR1_E,
MTSB_E,
MFSI_E,
MFSE_E,
MFSR0_E,
MFSR1_E,
MFSB_E,
MFSHT_E,
pMFSHT_E,
updSR0_Eg,
updSR1_Eg,
updSR_E,


MFDAG1_E,
MFDAG2_E,
accPM_E,
Double_R, Double_E,
Post1_E,
Post2_E,
imAddr_R,
DAG1D_R,
DAG2D_R,
DMAen_R,


Pread_R,
Pwrite_R,
Dread_R,
Dwrite_R,
IOcmd_R,
IOread_R,
IOwrite_R,

SBP_R,
nNOP_Eg,
MFIDR_E,
MTIDR_Eg;
output MFRX0_E, MFTX0_E, MFRX1_E, MFTX1_E,
MTRX0_E, MTTX0_E, MTRX1_E, MTTX1_E,
MFSPT_E, MFPMOVL_E, MFDMOVL_E, MTPMOVL_E,
MTDMOVL_E, accCM_R, accCM_E, wrCM_R,
/*wrCM_E,*/ rdCM_E;
output DAG1_EN, DAG2_EN, DAG2P_R;



reg [23:0] IR, IRE;
reg [7:0] MFIreg_E, MFLreg_E, MFMreg_E,
MTIreg_E, MTLreg_E, MTMreg_E;

reg MFMSTAT_E, MFSSTAT_E, MFIMASK_E, MFICNTL_E, MFCNTR_E,
MFtoppcs_Eg, MTMSTAT_Eg, MTIMASK_Eg, MTICNTL_Eg,
MTCNTR_Eg, MTIFC_Eg, MTOWRCNTR_Eg, MTtoppcs_Eg,
Modctl_Eg, Stkctl_Eg, DU_Eg, MpopLP_Eg, Nseq_Ed,
RET_Ed, BR_Ed, Call_Ed, RTI_Ed, RTS_Ed, IDLE_Eg,
updCTL_E, MACdep_Eg, MFASTAT_E, MFAX0_E, MFAX1_E,
MFAY0_E, MFAY1_E, MFAR_E, MFMX0_E, MFMX1_E, MFMY0_E,
MFMY1_E, MFMR0_E, MFMR1_E, MFMR2_E, MFSI_E, MFSB_E,
MFSE_E, MFSR0_E, MFSR1_E, MTAX0_E, MTAX1_E, MTAY0_E,
MTAY1_E, MTAR_E, MTASTAT_E, MTMX0_E, MTMX1_E, MTMY0_E,
MTMY1_E, MTMR0_E, MTMR1_E, MTMR2_E, MTSI_E, MTSE_E,
MTSR0_E, MTSR1_E, MTSB_E, accPM_E, Double_E, Post1_E,
Post2_E, DIVQ_E, DIVS_E, imSHT_E, updMR_E, updMF_E,
updAR_E, updAF_E, updSR_E, Usecond_E, Dummy_E, Dummy_C,
Prderr_Cg, DU_Cg, cdAM_E, satMR_E, imm16_E,
imm14_E, NOP_E, MTIDR_E, MFIDR_E, EXIT_E, Long_Eg,
Long_Cg, Nrti_Ed, MFPSQ_Ei, MFSPT_Ei, MFDAG1_Ei,
MFDAG2_Ei, MFMAC_Ei, MFALU_Ei, MFSHT_Ei, pMFMAC_Ei,
pMFALU_Ei, pMFSHT_Ei;
reg MFRX0_E, MFTX0_E, MFRX1_E, MFTX1_E, MTRX0_E, MTTX0_E,
MTRX1_E, MTTX1_E, MTPMOVL_E, MTDMOVL_E,
MFPMOVL_E, MFDMOVL_E, accCM_E, rdCM_E ;
reg MFPSQ_Ci, MFSPT_Ci, MFDAG1_Ci, MFDAG2_Ci, MFALU_Ci,
MFMAC_Ci, MFSHT_Ci, pMFALU_Ci, pMFMAC_Ci, pMFSHT_Ci;


reg SHTop_E, MACop_E, ALUop_E;

wire [31:1] Typ;
wire [7:0] MFIreg_R, MFLreg_R, MFMreg_R,
MTIreg_R, MTMreg_R, MTLreg_R;
wire [2:0] MACxop_R;
wire [3:0] MACyop_R, SF_R;
wire [4:0] AMF_R;
wire [5:0] dcreg_R, screg_R, ddreg_R, sdreg_R;
wire MTcreg_R, MFcreg_R, MTASTAT_R, MTMSTAT_R, MTIMASK_R,
MTICNTL_R, MTCNTR_R, MTSB_R, MTIFC_R, MTOWRCNTR_R,
MTtoppcs_R, MFASTAT_R, MFMSTAT_R, MFSSTAT_R, MFIMASK_R,
MFICNTL_R, MFSB_R, MFPX_R, MTdreg_R, MFdreg_R, MTAX0_R,
MTAX1_R, MTMX0_R, MTMX1_R, MTAY0_R, MTAY1_R, MTMY0_R,
MTMY1_R, MTSI_R, MTSE_R, MTAR_R, MTMR0_R, MTMR1_R,
MTMR2_R, MTSR0_R, MTSR1_R, MFAX0_R, MFAX1_R, MFMX0_R,
MFMX1_R, MFAY0_R, MFAY1_R, MFMY0_R, MFMY1_R, MFSI_R,
MFSE_R, MFAR_R, MFMR0_R, MFMR1_R, MFMR2_R, MFSR0_R,
MFSR1_R, Post1_R, Post2_R, Usecond_R, MpopLP_R,
Stkctl_R, Nseq_R, BR_R, Call_R, RTI_R, RTS_R,

Modctl_R, ALUop_R, MACop_R, SHTop_R;
wire MXeqMX0_R, MXeqMX1_R, MXeqAR_R, MXeqMR0_R, MXeqMR1_R,
MXeqMR2_R, MXeqSR0_R, MXeqSR1_R, MXeqMR_R, MYeqMX0_R,
MYeqMX1_R, MYeqAR_R, MYeqMR0_R, MYeqMR1_R, MYeqMR2_R,
MYeqSR0_R, MYeqSR1_R, MYeqMY0_R, MYeqMY1_R, MYeqMF_R,
MYeq0_R, MYeqMR_R, satMR_R, updMR_R, updMF_R, updAR_R,
updAF_R, updSR_R, savMR0_Eg, savMR1_Eg, savMR2_Eg,

MACdep_Rg, MFtoppcs_R, MFCNTR_R, Squ_R,
imm16_R, imm14_R, MFIDR_R, MTIDR_R, EXIT_R, CKtrue,
Long_R, Nrti_R,

MFPSQ_R, MFDAG1_R,
MFDAG2_R, MFALU_R, MFMAC_R, MFSHT_R, mtPMD_R, MFSPT_R;

wire MFRX0_R, MFTX0_R, MFRX1_R, MFTX1_R, MTRX0_R, MTTX0_R,
MTRX1_R, MTTX1_R, MTPMOVL_R, MTDMOVL_R, MFPMOVL_R,
MFDMOVL_R, accCM_R, rdCM_R, wrCM_R;

wire updMR_Eg, updMF_Eg, updAR_Eg, updAF_Eg;







`ifdef FD_DFT

reg PPclr_o, RST_o;
wire PPclr, RST;
always @(posedge DSPCLK) begin
PPclr_o <= #`db T_RST || PPclr_h;
RST_o <= #`db T_RST;
end
assign PPclr = SCAN_TEST ? T_RST : PPclr_o;
assign RST = SCAN_TEST ? T_RST : RST_o;

`else

reg PPclr, RST;
always @(posedge DSPCLK) begin
PPclr <= #`db T_RST || PPclr_h;
RST <= #`db T_RST;
end

`endif




always @(posedge DSPCLK or posedge RST) begin
if (RST) IR[23:0] <= #`db 24'b0;
else if (GO_D) IR[23:0] <= #`db CM_rd[23:0];
else if (Upd_IR) IR[23:0] <= #`db SPC[23:0];
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IRE[23:0] <= #`db 24'b0;
else if (GO_E) IRE[23:0] <= #`db IR[23:0];
end


assign #`d0 IREo[19:0] = IRE[19:0];

















assign #`da Long_R = MFtoppcs_R || MTtoppcs_R || DU_R ||
Stkctl_R || MTIMASK_R || MTMSTAT_R ||
MTASTAT_R ||
Modctl_R && (IR[13] || IR[7] || IR[5]) ||
MTPMOVL_R || MTDMOVL_R;


always @(posedge DSPCLK) begin
if (PPclr_h) Long_Eg <= #`db 1'b0;
else if (GO_E) Long_Eg <= #`db Long_R && !Dummy_R;
end

always @(posedge DSPCLK) begin
if (PPclr_h) Long_Cg <= #`db 1'b0;
else if (GO_C) Long_Cg <= #`db Long_Eg;
end











assign #`da imm16_R = Typ[2] || Typ[6];
assign #`d0 imm14_R = Typ[7];
















assign #`da Typ[2] = (IR[23:22]== 2'b11);
assign #`da Typ[1] = (IR[23:21]== 3'b101);

assign #`da Typ[4] = (IR[23:21]== 3'b100) && enTYP3;
assign #`da accCM_R = (IR[23:21]== 3'b100) && !enTYP3;

assign #`da Typ[3] = (IR[23:21]== 3'b011);
assign #`da Typ[6] = (IR[23:20]== 4'b0101);
assign #`da Typ[5] = (IR[23:20]== 4'b0100);
assign #`da Typ[8] = (IR[23:20]== 4'b0011);
assign #`da Typ[7] = (IR[23:19]== 5'b0010_1);
assign #`da Typ[9] = (IR[23:19]== 5'b0010_0);
assign #`da Typ[11] = (IR[23:19]== 5'b0001_1);
assign #`da Typ[10] = (IR[23:18]== 6'b0001_01);
assign #`da Typ[13] = (IR[23:17]== 7'b0001_001);
assign #`da Typ[12] = (IR[23:16]== 8'b0001_0001);
assign #`da Typ[15] = (IR[23:16]== 8'b0001_0000);
assign #`da Typ[14] = (IR[23:16]== 8'b0000_1111);
assign #`da Typ[17] = (IR[23:16]== 8'b0000_1110);
assign #`da Typ[16] = (IR[23:16]== 8'b0000_1101);
assign #`da Typ[19] = (IR[23:16]== 8'b0000_1100);
assign #`da Typ[18] = (IR[23:16]== 8'b0000_1011);
assign #`da Typ[21] = (IR[23:16]== 8'b0000_1010);
assign #`da Typ[20] = (IR[23:16]== 8'b0000_1001);
assign #`da Typ[23] = (IR[23:16]== 8'b0000_1000);
assign #`da Typ[22] = (IR[23:16]== 8'b0000_0111);
assign #`da Typ[25] = (IR[23:16]== 8'b0000_0110);
assign #`da Typ[24] = (IR[23:16]== 8'b0000_0101);
assign #`da Typ[27] = (IR[23:16]== 8'b0000_0100);
assign #`da Typ[26] = (IR[23:16]== 8'b0000_0011);
assign #`da Typ[29] = (IR[23:15]== 9'b0000_0010_0);
assign #`da Typ[28] = (IR[23:16]== 8'b0000_0001);
assign #`da Typ[31] = (IR[23:16]== 8'b0000_0000);
assign #`da Typ[30] = (IR[23:15]== 9'b0000_0010_1);









assign #`da rdCM_R = accCM_R && !IR[20];
assign #`da wrCM_R = accCM_R && IR[20];

always @(posedge DSPCLK or posedge PPclr_h) begin
if (PPclr_h) begin
accCM_E <= #`db 1'b0;
rdCM_E <= #`db 1'b0;

end
else if (GO_E) begin
accCM_E <= #`db accCM_R;
rdCM_E <= #`db rdCM_R;

end
end
















assign #`da MTcreg_R = (Typ[3] && !IR[20]) || Typ[7] || Typ[17];

assign #`da dcreg_R[5:0] = Typ[17] ? {IR[11:10], IR[7:4]}
: {IR[19:18], IR[3:0]};

assign #`da MFcreg_R = (Typ[3] && IR[20]) || Typ[17];

assign #`da screg_R[5:0] = Typ[17] ? {IR[9:8], IR[3:0]}
: {IR[19:18], IR[3:0]};




assign #`da MTASTAT_R = MTcreg_R && (dcreg_R == 6'h30);
assign #`da MTMSTAT_R = MTcreg_R && (dcreg_R == 6'h31);
assign #`da MTIMASK_R = MTcreg_R && (dcreg_R == 6'h33);
assign #`da MTICNTL_R = MTcreg_R && (dcreg_R == 6'h34);
assign #`da MTCNTR_R = MTcreg_R && (dcreg_R == 6'h35);
assign #`da MTSB_R = MTcreg_R && (dcreg_R == 6'h36);
assign #`da MTRX0_R = MTcreg_R && (dcreg_R == 6'h38);
assign #`da MTTX0_R = MTcreg_R && (dcreg_R == 6'h39);
assign #`da MTRX1_R = MTcreg_R && (dcreg_R == 6'h3a);
assign #`da MTTX1_R = MTcreg_R && (dcreg_R == 6'h3b);
assign #`da MTIFC_R = MTcreg_R && (dcreg_R == 6'h3c);
assign #`da MTOWRCNTR_R = MTcreg_R && (dcreg_R == 6'h3d);
assign #`da MTtoppcs_R = MTcreg_R && (dcreg_R == 6'h3f);

assign #`da MTIreg_R[0] = MTcreg_R && (dcreg_R == 6'h10);
assign #`da MTIreg_R[1] = MTcreg_R && (dcreg_R == 6'h11);
assign #`da MTIreg_R[2] = MTcreg_R && (dcreg_R == 6'h12);
assign #`da MTIreg_R[3] = MTcreg_R && (dcreg_R == 6'h13);
assign #`da MTMreg_R[0] = MTcreg_R && (dcreg_R == 6'h14);
assign #`da MTMreg_R[1] = MTcreg_R && (dcreg_R == 6'h15);
assign #`da MTMreg_R[2] = MTcreg_R && (dcreg_R == 6'h16);
assign #`da MTMreg_R[3] = MTcreg_R && (dcreg_R == 6'h17);
assign #`da MTLreg_R[0] = MTcreg_R && (dcreg_R == 6'h18);
assign #`da MTLreg_R[1] = MTcreg_R && (dcreg_R == 6'h19);
assign #`da MTLreg_R[2] = MTcreg_R && (dcreg_R == 6'h1a);
assign #`da MTLreg_R[3] = MTcreg_R && (dcreg_R == 6'h1b);



assign #`da MTIDR_R = MTcreg_R && (dcreg_R == 6'h1c);
assign #`da MTPMOVL_R = MTcreg_R && (dcreg_R == 6'h1e);
assign #`da MTDMOVL_R = MTcreg_R && (dcreg_R == 6'h1f);



assign #`da MTIreg_R[4] = MTcreg_R && (dcreg_R == 6'h20);
assign #`da MTIreg_R[5] = MTcreg_R && (dcreg_R == 6'h21);
assign #`da MTIreg_R[6] = MTcreg_R && (dcreg_R == 6'h22);
assign #`da MTIreg_R[7] = MTcreg_R && (dcreg_R == 6'h23);
assign #`da MTMreg_R[4] = MTcreg_R && (dcreg_R == 6'h24);
assign #`da MTMreg_R[5] = MTcreg_R && (dcreg_R == 6'h25);
assign #`da MTMreg_R[6] = MTcreg_R && (dcreg_R == 6'h26);
assign #`da MTMreg_R[7] = MTcreg_R && (dcreg_R == 6'h27);
assign #`da MTLreg_R[4] = MTcreg_R && (dcreg_R == 6'h28);
assign #`da MTLreg_R[5] = MTcreg_R && (dcreg_R == 6'h29);
assign #`da MTLreg_R[6] = MTcreg_R && (dcreg_R == 6'h2a);
assign #`da MTLreg_R[7] = MTcreg_R && (dcreg_R == 6'h2b);

assign #`da MFASTAT_R = MFcreg_R && (screg_R == 6'h30);
assign #`da MFMSTAT_R = MFcreg_R && (screg_R == 6'h31);
assign #`da MFSSTAT_R = MFcreg_R && (screg_R == 6'h32);
assign #`da MFIMASK_R = MFcreg_R && (screg_R == 6'h33);
assign #`da MFICNTL_R = MFcreg_R && (screg_R == 6'h34);
assign #`da MFCNTR_R = MFcreg_R && (screg_R == 6'h35);
assign #`da MFSB_R = MFcreg_R && (screg_R == 6'h36);
assign #`da MFPX_R = MFcreg_R && (screg_R == 6'h37);
assign #`da MFRX0_R = MFcreg_R && (screg_R == 6'h38);
assign #`da MFTX0_R = MFcreg_R && (screg_R == 6'h39);
assign #`da MFRX1_R = MFcreg_R && (screg_R == 6'h3a);
assign #`da MFTX1_R = MFcreg_R && (screg_R == 6'h3b);
assign #`da MFtoppcs_R = MFcreg_R && (screg_R == 6'h3f);

assign #`da MFIreg_R[0] = MFcreg_R && (screg_R == 6'h10);
assign #`da MFIreg_R[1] = MFcreg_R && (screg_R == 6'h11);
assign #`da MFIreg_R[2] = MFcreg_R && (screg_R == 6'h12);
assign #`da MFIreg_R[3] = MFcreg_R && (screg_R == 6'h13);
assign #`da MFMreg_R[0] = MFcreg_R && (screg_R == 6'h14);
assign #`da MFMreg_R[1] = MFcreg_R && (screg_R == 6'h15);
assign #`da MFMreg_R[2] = MFcreg_R && (screg_R == 6'h16);
assign #`da MFMreg_R[3] = MFcreg_R && (screg_R == 6'h17);
assign #`da MFLreg_R[0] = MFcreg_R && (screg_R == 6'h18);
assign #`da MFLreg_R[1] = MFcreg_R && (screg_R == 6'h19);
assign #`da MFLreg_R[2] = MFcreg_R && (screg_R == 6'h1a);
assign #`da MFLreg_R[3] = MFcreg_R && (screg_R == 6'h1b);



assign #`da MFIDR_R = MFcreg_R && (screg_R == 6'h1c);
assign #`da MFPMOVL_R = MFcreg_R && (screg_R == 6'h1e);
assign #`da MFDMOVL_R = MFcreg_R && (screg_R == 6'h1f);



assign #`da MFIreg_R[4] = MFcreg_R && (screg_R == 6'h20);
assign #`da MFIreg_R[5] = MFcreg_R && (screg_R == 6'h21);
assign #`da MFIreg_R[6] = MFcreg_R && (screg_R == 6'h22);
assign #`da MFIreg_R[7] = MFcreg_R && (screg_R == 6'h23);
assign #`da MFMreg_R[4] = MFcreg_R && (screg_R == 6'h24);
assign #`da MFMreg_R[5] = MFcreg_R && (screg_R == 6'h25);
assign #`da MFMreg_R[6] = MFcreg_R && (screg_R == 6'h26);
assign #`da MFMreg_R[7] = MFcreg_R && (screg_R == 6'h27);
assign #`da MFLreg_R[4] = MFcreg_R && (screg_R == 6'h28);
assign #`da MFLreg_R[5] = MFcreg_R && (screg_R == 6'h29);
assign #`da MFLreg_R[6] = MFcreg_R && (screg_R == 6'h2a);
assign #`da MFLreg_R[7] = MFcreg_R && (screg_R == 6'h2b);



















assign #`da MTdreg_R = Typ[3] && !IR[20] ||
Typ[7] || Typ[17] ||
(Typ[4] || Typ[5]) && !IR[19] ||
Typ[6] || Typ[8] || Typ[14] ||
(Typ[12] || Typ[13] || Typ[29]) && !IR[15];

assign #`da ddreg_R[5:4] = {2{Typ[3] || Typ[7]}} & IR[19:18] |
{2{Typ[17]}} & IR[11:10];
assign #`da ddreg_R[3:0] = (Typ[3] || Typ[6] || Typ[7] || Typ[29])
? IR[3:0] : IR[7:4];




assign #`da MFdreg_R = Typ[8] || Typ[14] || Typ[17] ||
Typ[3] && IR[20] ||
(Typ[4] || Typ[5]) && IR[19] ||
(Typ[12] || Typ[13] || Typ[29]) && IR[15];

assign #`da sdreg_R[5:4] = {2{Typ[3]}} & IR[19:18] |
{2{Typ[17]}} & IR[9:8];

assign #`da sdreg_R[3:0] = (Typ[3] || Typ[8] || Typ[14] ||
Typ[17] || Typ[29]) ? IR[3:0] : IR[7:4];

assign #`da mtPMD_R = Typ[5] || Typ[13];




assign #`da MTAX0_R = MTdreg_R && (ddreg_R == 6'h0) ||
Typ[1] && (IR[19:18] == 2'b00);

assign #`da MTAX1_R = MTdreg_R && (ddreg_R == 6'h1) ||
Typ[1] && (IR[19:18] == 2'b01);

assign #`da MTMX0_R = MTdreg_R && (ddreg_R == 6'h2) ||
Typ[1] && (IR[19:18] == 2'b10);

assign #`da MTMX1_R = MTdreg_R && (ddreg_R == 6'h3) ||
Typ[1] && (IR[19:18] == 2'b11);

assign #`da MTAY0_R = MTdreg_R && (ddreg_R == 6'h4) ||
Typ[1] && (IR[21:20] == 2'b00);

assign #`da MTAY1_R = MTdreg_R && (ddreg_R == 6'h5) ||
Typ[1] && (IR[21:20] == 2'b01);

assign #`da MTMY0_R = MTdreg_R && (ddreg_R == 6'h6) ||
Typ[1] && (IR[21:20] == 2'b10);

assign #`da MTMY1_R = MTdreg_R && (ddreg_R == 6'h7) ||
Typ[1] && (IR[21:20] == 2'b11);

assign #`da MTSI_R = MTdreg_R && (ddreg_R == 6'h8);
assign #`da MTSE_R = MTdreg_R && (ddreg_R == 6'h9);
assign #`da MTAR_R = MTdreg_R && (ddreg_R == 6'ha);
assign #`da MTMR0_R = MTdreg_R && (ddreg_R == 6'hb);
assign #`da MTMR1_R = MTdreg_R && (ddreg_R == 6'hc);
assign #`da MTMR2_R = MTdreg_R && (ddreg_R == 6'hd);
assign #`da MTSR0_R = MTdreg_R && (ddreg_R == 6'he);
assign #`da MTSR1_R = MTdreg_R && (ddreg_R == 6'hf);

assign #`da MFAX0_R = MFdreg_R && (sdreg_R == 6'h0);
assign #`da MFAX1_R = MFdreg_R && (sdreg_R == 6'h1);
assign #`da MFMX0_R = MFdreg_R && (sdreg_R == 6'h2);
assign #`da MFMX1_R = MFdreg_R && (sdreg_R == 6'h3);
assign #`da MFAY0_R = MFdreg_R && (sdreg_R == 6'h4);
assign #`da MFAY1_R = MFdreg_R && (sdreg_R == 6'h5);
assign #`da MFMY0_R = MFdreg_R && (sdreg_R == 6'h6);
assign #`da MFMY1_R = MFdreg_R && (sdreg_R == 6'h7);
assign #`da MFSI_R = MFdreg_R && (sdreg_R == 6'h8);
assign #`da MFSE_R = MFdreg_R && (sdreg_R == 6'h9);
assign #`da MFAR_R = MFdreg_R && (sdreg_R == 6'ha);
assign #`da MFMR0_R = MFdreg_R && (sdreg_R == 6'hb);
assign #`da MFMR1_R = MFdreg_R && (sdreg_R == 6'hc);
assign #`da MFMR2_R = MFdreg_R && (sdreg_R == 6'hd);
assign #`da MFSR0_R = MFdreg_R && (sdreg_R == 6'he);
assign #`da MFSR1_R = MFdreg_R && (sdreg_R == 6'hf);




assign #`d0 Double_R = Typ[1];

assign #`da Post1_R = Typ[1] ||
Typ[21] && !IR[4] ||
Typ[12] && !IR[16] ||
(Typ[2] || Typ[4]) && !IR[20];

assign #`da Post2_R = Typ[1] || Typ[5] || Typ[13] ||
Typ[12] && IR[16] ||
Typ[21] && IR[4] ||
(Typ[2] || Typ[4]) && IR[20];
















assign #`d0 imAddr_R = Typ[3];

assign #`da DAG1D_R = Typ[1] ||
(Typ[2] || Typ[4]) && !IR[20] ||
Typ[12] && !IR[16];

assign #`da DAG2D_R = (Typ[2] || Typ[4]) && IR[20] ||
Typ[12] && IR[16];

assign #`da DMAen_R = Typ[1] || Typ[2] || Typ[3] || Typ[4] || Typ[12];

assign #`da DAG2P_R = Typ[1] || Typ[5] || Typ[13];

assign #`da Pread_R = Typ[1] ||
Typ[5] && !IR[19] ||
Typ[13] && !IR[15];

assign #`da Pwrite_R = Typ[5] && IR[19] ||
Typ[13] && IR[15];

assign #`da Dread_R = Typ[1] ||
Typ[3] && !IR[20] ||
Typ[4] && !IR[19] ||
Typ[12] && !IR[15];

assign #`da Dwrite_R = Typ[2] ||
Typ[3] && IR[20] ||
Typ[4] && IR[19] ||
Typ[12] && IR[15];

assign #`da IOcmd_R = Typ[29];
assign #`da IOread_R = Typ[29] && !IR[15];
assign #`da IOwrite_R = Typ[29] && IR[15];












assign #`da Usecond_R = Typ[9] ||
Typ[10] ||
Typ[16] ||
Typ[19] ||
RET_R ||
Typ[28];

assign #`d0 Modctl_R = Typ[18];
assign #`d0 Stkctl_R = Typ[26];
assign #`da MpopLP_R = Stkctl_R && IR[3];
assign #`d0 DU_R = Typ[11];
assign #`da Nseq_R = Typ[10] || Typ[19] || RET_R;
assign #`da Nrti_R = Typ[10] || Typ[19] || RTS_R;
assign #`da BR_R = Typ[10] || Typ[19];
assign #`d0 dBR_R = Typ[10];
assign #`d0 idBR_R = Typ[19];
assign #`da Call_R = Typ[10] && IR[18] ||
Typ[19] && IR[4];








































































assign #`d0 AMF_R[4:0] = IR[17:13];
assign #`d0 SF_R[3:0] = IR[14:11];

assign #`da ALUop_R = AMF_R[4] &&
(Typ[1] || Typ[4] || Typ[5] || Typ[8] || Typ[9]);

assign #`da MACop_R = !AMF_R[4] && (|{AMF_R[3:0]}) &&
(Typ[1] || Typ[4] || Typ[5] || Typ[8] || Typ[9]);

assign #`da Squ_Rx = Typ[9] && IR[4];
assign #`da Squ_R = !AMF_R[4] && (|{AMF_R[3:0]}) && Typ[9] && IR[4];

assign #`da SHTop_R = Typ[12] || Typ[13] || Typ[14] || Typ[15] || Typ[16];

assign #`d0 MACxop_R[2:0] = IR[10:8];
assign #`da MACyop_R[3:0] = Squ_R ? {1'b1, IR[10:8]}
: {2'b0, IR[12:11]};




assign #`da MXeqMX0_R = MACxop_R[2:0] == 3'b000;
assign #`da MXeqMX1_R = MACxop_R[2:0] == 3'b001;
assign #`da MXeqAR_R = MACxop_R[2:0] == 3'b010;
assign #`da MXeqMR0_R = MACxop_R[2:0] == 3'b011;
assign #`da MXeqMR1_R = MACxop_R[2:0] == 3'b100;
assign #`da MXeqMR2_R = MACxop_R[2:0] == 3'b101;
assign #`da MXeqSR0_R = MACxop_R[2:0] == 3'b110;
assign #`da MXeqSR1_R = MACxop_R[2:0] == 3'b111;
assign #`da MXeqMR_R = MXeqMR0_R || MXeqMR1_R || MXeqMR2_R;

assign #`da MYeqMX0_R = MACyop_R[3:0] == 4'b1000;
assign #`da MYeqMX1_R = MACyop_R[3:0] == 4'b1001;
assign #`da MYeqAR_R = MACyop_R[3:0] == 4'b1010;
assign #`da MYeqMR0_R = MACyop_R[3:0] == 4'b1011;
assign #`da MYeqMR1_R = MACyop_R[3:0] == 4'b1100;
assign #`da MYeqMR2_R = MACyop_R[3:0] == 4'b1101;
assign #`da MYeqSR0_R = MACyop_R[3:0] == 4'b1110;
assign #`da MYeqSR1_R = MACyop_R[3:0] == 4'b1111;
assign #`da MYeqMY0_R = MACyop_R[3:0] == 4'b0000;
assign #`da MYeqMY1_R = MACyop_R[3:0] == 4'b0001;
assign #`da MYeqMF_R = MACyop_R[3:0] == 4'b0010;
assign #`da MYeq0_R = MACyop_R[3:0] == 4'b0011;
assign #`da MYeqMR_R = MYeqMR0_R || MYeqMR1_R || MYeqMR2_R;






assign #`d0 satMR_R = Typ[25];
assign #`da updMR_R = MACop_R && (!IR[18] || Double_R);
assign #`da updMF_R = MACop_R && ( IR[18] && !Double_R);
assign #`da updAR_R = ALUop_R && (!IR[18] || Double_R);
assign #`da updAF_R = ALUop_R && ( IR[18] && !Double_R);
assign #`da updSR_R = SHTop_R && (SF_R[3:2] != 2'b11);




assign #`da satMR_Eg = satMR_E && EX_en && MV;
assign #`da updMR_Eg = updMR_E && EX_enc;
assign #`da updMF_Eg = updMF_E && EX_enc;

assign #`da MTMR0_Eg = MTMR0_E && EX_en;
assign #`da MTMR1_Eg = MTMR1_E && EX_en;
assign #`da MTMR2_Eg = MTMR2_E && EX_en;

assign #`da MTMX0_Eg = MTMX0_E && EX_en;
assign #`da MTMX1_Eg = MTMX1_E && EX_en;
assign #`da MTMY0_Eg = MTMY0_E && EX_en;
assign #`da MTMY1_Eg = MTMY1_E && EX_en;

assign #`da savMR0_Eg = satMR_Eg || MTMR0_Eg;
assign #`da savMR1_Eg = satMR_Eg || MTMR1_Eg;
assign #`da savMR2_Eg = satMR_Eg || MTMR1_Eg || MTMR2_Eg;





assign #`da updAR_Eg = updAR_E && EX_enc || MTAR_E && EX_en;
assign #`da updAF_Eg = updAF_E && EX_enc;
assign #`da updSR0_Eg = updSR_E && EX_enc || MTSR0_E && EX_en;
assign #`da updSR1_Eg = updSR_E && EX_enc || MTSR1_E && EX_en;

























assign #`da MACdep_Rg = MACop_R && (updMF_Eg && MYeqMF_R ||
updMR_Eg && (MXeqMR_R || MYeqMR_R));




assign #`da Xbyp_Rg = MACop_R && (MTMX0_Eg && MXeqMX0_R ||
MTMX1_Eg && MXeqMX1_R);

assign #`da Ybyp_Rg = MACop_R && (
MTMY0_Eg && MYeqMY0_R ||
MTMY1_Eg && MYeqMY1_R);

assign #`da Rbyp_Rg = MACop_R && (savMR2_Eg && (MXeqMR2_R || MYeqMR2_R) ||
savMR1_Eg && (MXeqMR1_R || MYeqMR1_R) ||
savMR0_Eg && (MXeqMR0_R || MYeqMR0_R) ||
updAR_Eg && (MXeqAR_R || MYeqAR_R) ||
updSR1_Eg && (MXeqSR1_R || MYeqSR1_R) ||
updSR0_Eg && (MXeqSR0_R || MYeqSR0_R));























assign #`da Dummy_R = Prderr_Eg | Prderr_Cg | Long_Eg | Long_Cg;

always @ (posedge DSPCLK or posedge PPclr) begin
if (PPclr) Dummy_E <= #`db 1'b0;
else if (GO_E) Dummy_E <= #`db Dummy_R;
end

always @ (posedge DSPCLK or posedge PPclr) begin
if (PPclr) begin
Prderr_Cg <= #`db 1'b0;
Dummy_C <= #`db 1'b0;
end
else
if (GO_C) begin
Prderr_Cg <= #`db Prderr_Eg;
Dummy_C <= #`db Dummy_E;
end
end

assign #`da CKtrue = !Usecond_E || Ctrue;
assign #`da EX_en = !Dummy_E;
assign #`da EX_enc = !Dummy_E && CKtrue;















assign #`da MFPSQ_R = |{MFMSTAT_R, MFSSTAT_R, MFIMASK_R,
MFICNTL_R, MFCNTR_R, MFtoppcs_R,
MFPMOVL_R, MFDMOVL_R, imm16_R,
imm14_R, MFIDR_R};

assign #`da MFDAG1_R = |{MFIreg_R[3:0], MFLreg_R[3:0],
MFMreg_R[3:0], MFPX_R};

assign #`da MFDAG2_R = |{MFIreg_R[7:4], MFLreg_R[7:4],
MFMreg_R[7:4]};

assign #`da MFALU_R = |{MFASTAT_R, MFAX0_R, MFAX1_R, MFAY0_R,
MFAY1_R, MFAR_R};

assign #`da MFMAC_R = |{MFMX0_R, MFMX1_R, MFMY0_R, MFMY1_R,
MFMR0_R, MFMR1_R, MFMR2_R};

assign #`da MFSHT_R = |{MFSI_R, MFSB_R, MFSE_R, MFSR0_R, MFSR1_R};

assign #`da MFSPT_R = |{MFRX0_R, MFRX1_R, MFTX0_R, MFTX1_R};




















assign #`da MFPSQ_E = !redoSTI_h && MFPSQ_Ei;
assign #`da MFSPT_E = !redoSTI_h && MFSPT_Ei;
assign #`da MFDAG1_E = !redoSTI_h && MFDAG1_Ei;
assign #`da MFDAG2_E = !redoSTI_h && MFDAG2_Ei;

assign #`da MFALU_E = !redoSTI_h && MFALU_Ei;
assign #`da MFMAC_E = !redoSTI_h && MFMAC_Ei;
assign #`da MFSHT_E = !redoSTI_h && MFSHT_Ei;

assign #`da pMFALU_E = !redoSTI_h && pMFALU_Ei;
assign #`da pMFMAC_E = !redoSTI_h && pMFMAC_Ei;
assign #`da pMFSHT_E = !redoSTI_h && pMFSHT_Ei;

always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) begin
MFPSQ_Ei <= #`db 1'b0;
MFSPT_Ei <= #`db 1'b0;
MFDAG1_Ei <= #`db 1'b0;
MFDAG2_Ei <= #`db 1'b0;
MFALU_Ei <= #`db 1'b0;
MFMAC_Ei <= #`db 1'b0;
MFSHT_Ei <= #`db 1'b0;
pMFALU_Ei <= #`db 1'b0;
pMFMAC_Ei <= #`db 1'b0;
pMFSHT_Ei <= #`db 1'b0;
end
else if (GO_E) begin
MFPSQ_Ei <= #`db MFPSQ_R;
MFSPT_Ei <= #`db MFSPT_R;
MFDAG1_Ei <= #`db MFDAG1_R;
MFDAG2_Ei <= #`db MFDAG2_R;
MFALU_Ei <= #`db MFALU_R && !mtPMD_R;
MFMAC_Ei <= #`db MFMAC_R && !mtPMD_R ;
MFSHT_Ei <= #`db MFSHT_R && !mtPMD_R;
pMFALU_Ei <= #`db MFALU_R && mtPMD_R;
pMFMAC_Ei <= #`db MFMAC_R && mtPMD_R;
pMFSHT_Ei <= #`db MFSHT_R && mtPMD_R;
end
end

always @(posedge DSPCLK) begin
if (PPclr) begin
MFPSQ_Ci <= #`db 1'b0;
MFSPT_Ci <= #`db 1'b0;
MFDAG1_Ci <= #`db 1'b0;
MFDAG2_Ci <= #`db 1'b0;
MFALU_Ci <= #`db 1'b0;
MFMAC_Ci <= #`db 1'b0;
MFSHT_Ci <= #`db 1'b0;
pMFALU_Ci <= #`db 1'b0;
pMFMAC_Ci <= #`db 1'b0;
pMFSHT_Ci <= #`db 1'b0;
end
else if (GO_C) begin
MFPSQ_Ci <= #`db MFPSQ_Ei;
MFSPT_Ci <= #`db MFSPT_Ei;
MFDAG1_Ci <= #`db MFDAG1_Ei;
MFDAG2_Ci <= #`db MFDAG2_Ei;
MFALU_Ci <= #`db MFALU_Ei;
MFMAC_Ci <= #`db MFMAC_Ei;
MFSHT_Ci <= #`db MFSHT_Ei;
pMFALU_Ci <= #`db pMFALU_Ei;
pMFMAC_Ci <= #`db pMFMAC_Ei;
pMFSHT_Ci <= #`db pMFSHT_Ei;
end
end






always @(posedge DSPCLK) begin
if (GO_E) begin
MFMSTAT_E <= #`db MFMSTAT_R;
MFSSTAT_E <= #`db MFSSTAT_R;
MFIMASK_E <= #`db MFIMASK_R;
MFICNTL_E <= #`db MFICNTL_R;
MFCNTR_E <= #`db MFCNTR_R;
imm16_E <= #`db imm16_R;
imm14_E <= #`db imm14_R;
MFRX0_E <= #`db MFRX0_R;
MFTX0_E <= #`db MFTX0_R;
MFRX1_E <= #`db MFRX1_R;
MFTX1_E <= #`db MFTX1_R;
end
end



always @(posedge DSPCLK) begin
if (GO_E) begin

MFASTAT_E <= #`db MFASTAT_R;
MFAX0_E <= #`db MFAX0_R;
MFAX1_E <= #`db MFAX1_R;
MFAY0_E <= #`db MFAY0_R;
MFAY1_E <= #`db MFAY1_R;
MFAR_E <= #`db MFAR_R;

MFMX0_E <= #`db MFMX0_R;
MFMX1_E <= #`db MFMX1_R;
MFMY0_E <= #`db MFMY0_R;
MFMY1_E <= #`db MFMY1_R;
MFMR0_E <= #`db MFMR0_R;
MFMR1_E <= #`db MFMR1_R;
MFMR2_E <= #`db MFMR2_R;

MFSI_E <= #`db MFSI_R;
MFSB_E <= #`db MFSB_R;
MFSE_E <= #`db MFSE_R;
MFSR0_E <= #`db MFSR0_R;
MFSR1_E <= #`db MFSR1_R;

MFIreg_E[7:0] <= #`db MFIreg_R[7:0];
MFLreg_E[7:0] <= #`db MFLreg_R[7:0];
MFMreg_E[7:0] <= #`db MFMreg_R[7:0];

MFIDR_E <= #`db MFIDR_R;
MFPMOVL_E <= #`db MFPMOVL_R;
MFDMOVL_E <= #`db MFDMOVL_R;
end
end






always @(posedge DSPCLK) begin
if (PPclr_h) begin
Usecond_E <= #`db 1'b0;
MTMSTAT_Eg <= #`db 1'b0;
MTIMASK_Eg <= #`db 1'b0;
MTICNTL_Eg <= #`db 1'b0;
MTCNTR_Eg <= #`db 1'b0;
MTIFC_Eg <= #`db 1'b0;
MTOWRCNTR_Eg <= #`db 1'b0;
MTtoppcs_Eg <= #`db 1'b0;
MFtoppcs_Eg <= #`db 1'b0;
Modctl_Eg <= #`db 1'b0;
Stkctl_Eg <= #`db 1'b0;
DU_Eg <= #`db 1'b0;
MpopLP_Eg <= #`db 1'b0;
Nseq_Ed <= #`db 1'b0;
Nrti_Ed <= #`db 1'b0;
RET_Ed <= #`db 1'b0;
BR_Ed <= #`db 1'b0;
Call_Ed <= #`db 1'b0;
RTI_Ed <= #`db 1'b0;
RTS_Ed <= #`db 1'b0;
IDLE_Eg <= #`db 1'b0;


MACdep_Eg <= #`db 1'b0;
MTRX0_E <= #`db 1'b0;
MTTX0_E <= #`db 1'b0;
MTRX1_E <= #`db 1'b0;
MTTX1_E <= #`db 1'b0;



end
else if (GO_E) begin
Usecond_E <= #`db Usecond_R;
MTMSTAT_Eg <= #`db MTMSTAT_R && !Dummy_R;
MTIMASK_Eg <= #`db MTIMASK_R && !Dummy_R;
MTICNTL_Eg <= #`db MTICNTL_R && !Dummy_R;
MTCNTR_Eg <= #`db MTCNTR_R && !Dummy_R;
MTIFC_Eg <= #`db MTIFC_R && !Dummy_R;
MTOWRCNTR_Eg <= #`db MTOWRCNTR_R && !Dummy_R;
MTtoppcs_Eg <= #`db MTtoppcs_R && !Dummy_R;
MFtoppcs_Eg <= #`db MFtoppcs_R && !Dummy_R;
Modctl_Eg <= #`db Modctl_R && !Dummy_R;
Stkctl_Eg <= #`db Stkctl_R && !Dummy_R;
DU_Eg <= #`db DU_R && !Dummy_R;
MpopLP_Eg <= #`db MpopLP_R && !Dummy_R;
Nseq_Ed <= #`db Nseq_R && !Dummy_R;
Nrti_Ed <= #`db Nrti_R && !Dummy_R;
RET_Ed <= #`db RET_R && !Dummy_R;
BR_Ed <= #`db BR_R && !Dummy_R;
Call_Ed <= #`db Call_R && !Dummy_R;
RTI_Ed <= #`db RTI_R && !Dummy_R;
RTS_Ed <= #`db RTS_R && !Dummy_R;
IDLE_Eg <= #`db IDLE_R && !Dummy_R;



MACdep_Eg <= #`db MACdep_Rg;
MTRX0_E <= #`db MTRX0_R;
MTTX0_E <= #`db MTTX0_R;
MTRX1_E <= #`db MTRX1_R;
MTTX1_E <= #`db MTTX1_R;



end
end




always @(posedge DSPCLK) begin
if (PPclr_h) begin
ALUop_E <= #`db 1'b0;
updAR_E <= #`db 1'b0;
updAF_E <= #`db 1'b0;
DIVQ_E <= #`db 1'b0;
DIVS_E <= #`db 1'b0;
MTAX0_E <= #`db 1'b0;
MTAX1_E <= #`db 1'b0;
MTAY0_E <= #`db 1'b0;
MTAY1_E <= #`db 1'b0;
MTAR_E <= #`db 1'b0;
MTASTAT_E <= #`db 1'b0;
MACop_E <= #`db 1'b0;
satMR_E <= #`db 1'b0;
updMR_E <= #`db 1'b0;
updMF_E <= #`db 1'b0;

cdAM_E <= #`db 1'b0;
MTMX0_E <= #`db 1'b0;
MTMX1_E <= #`db 1'b0;
MTMY0_E <= #`db 1'b0;
MTMY1_E <= #`db 1'b0;
MTMR0_E <= #`db 1'b0;
MTMR1_E <= #`db 1'b0;
MTMR2_E <= #`db 1'b0;
SHTop_E <= #`db 1'b0;
updSR_E <= #`db 1'b0;


imSHT_E <= #`db 1'b0;
MTSI_E <= #`db 1'b0;
MTSE_E <= #`db 1'b0;
MTSR0_E <= #`db 1'b0;
MTSR1_E <= #`db 1'b0;
MTSB_E <= #`db 1'b0;
accPM_E <= #`db 1'b0;
Double_E <= #`db 1'b0;
Post1_E <= #`db 1'b0;
Post2_E <= #`db 1'b0;
MTIreg_E[7:0] <= #`db 8'b0;
MTLreg_E[7:0] <= #`db 8'b0;
MTMreg_E[7:0] <= #`db 8'b0;

MTIDR_E <= #`db 1'b0;
MTPMOVL_E <= #`db 1'b0;
MTDMOVL_E <= #`db 1'b0;
end
else if (GO_E) begin

ALUop_E <= #`db ALUop_R;
updAR_E <= #`db updAR_R;
updAF_E <= #`db updAF_R;
DIVQ_E <= #`db Typ[23];
DIVS_E <= #`db Typ[24];
MTAX0_E <= #`db MTAX0_R;
MTAX1_E <= #`db MTAX1_R;
MTAY0_E <= #`db MTAY0_R;
MTAY1_E <= #`db MTAY1_R;
MTAR_E <= #`db MTAR_R;
MTASTAT_E <= #`db MTASTAT_R;

MACop_E <= #`db MACop_R;
satMR_E <= #`db satMR_R;
updMR_E <= #`db updMR_R;
updMF_E <= #`db updMF_R;

cdAM_E <= #`db Typ[9];
MTMX0_E <= #`db MTMX0_R;
MTMX1_E <= #`db MTMX1_R;
MTMY0_E <= #`db MTMY0_R;
MTMY1_E <= #`db MTMY1_R;
MTMR0_E <= #`db MTMR0_R;
MTMR1_E <= #`db MTMR1_R;
MTMR2_E <= #`db MTMR2_R;

SHTop_E <= #`db SHTop_R;
updSR_E <= #`db updSR_R;


imSHT_E <= #`db Typ[15];
MTSI_E <= #`db MTSI_R;
MTSE_E <= #`db MTSE_R;
MTSR0_E <= #`db MTSR0_R;
MTSR1_E <= #`db MTSR1_R;
MTSB_E <= #`db MTSB_R;

accPM_E <= #`db Typ[5] || Typ[13];
Double_E <= #`db Double_R;
Post1_E <= #`db Post1_R;
Post2_E <= #`db Post2_R;
MTIreg_E[7:0] <= #`db MTIreg_R[7:0];
MTLreg_E[7:0] <= #`db MTLreg_R[7:0];
MTMreg_E[7:0] <= #`db MTMreg_R[7:0];

MTIDR_E <= #`db MTIDR_R;
MTPMOVL_E <= #`db MTPMOVL_R;
MTDMOVL_E <= #`db MTDMOVL_R;
end
end








always @(posedge DSPCLK) begin
if (PPclr_h) begin
DU_Cg <= #`db 1'b0;

end
else if (GO_C) begin
DU_Cg <= #`db DU_Eg;

end
end








assign #`da nNOP_Eg = !NOP_E && EX_enc;
assign #`da MTIDR_Eg = MTIDR_E && EX_en;



assign #`d0 EXIT_R = Typ[20] && ICE_ST;
assign #`d0 RET_R = Typ[20] && !ICE_ST;
assign #`da RTI_R = Typ[20] && IR[4] && !ICE_ST;
assign #`da RTS_R = Typ[20] && !IR[4] && !ICE_ST;





assign #`d0 IDLE_R = Typ[31] && !IR[4];
assign #`d0 SBP_R = Typ[31] && IR[4] && SBP_EN;



always @(posedge DSPCLK) begin
if (PPclr_h) begin
EXIT_E <= #`db 1'b0;
NOP_E <= #`db 1'b0;
end
else if (GO_E) begin
EXIT_E <= #`db EXIT_R;
NOP_E <= #`db Typ[30];
end
end



wire DAG1_EN, DAG2_EN;
assign DAG1_EN = Typ[1] || (Typ[2] && (!IR[20])) || (Typ[4] && (!IR[20]))
|| (Typ[12] && (!IR[16])) || (Typ[21] && (!IR[4]));

assign DAG2_EN = Typ[1] || (Typ[2] && IR[20]) || (Typ[4] && IR[20])
|| Typ[5] || (Typ[12] && IR[16]) || Typ[13] || (Typ[21] && IR[4]);

assign type9 = Typ[9];
assign DIVQ_R = Typ[23];
assign DIVS_R = Typ[24];

endmodule
