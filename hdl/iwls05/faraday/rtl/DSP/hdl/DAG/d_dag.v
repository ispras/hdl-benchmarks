






/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/

`include "../../include/x_def.v"

module DAG(/*------------------- Inputs ------------------------*/
 DSPCLK, T_RST, GO_E, GO_C, EX_en, STBY,
 MTIreg_E, MTLreg_E, MTMreg_E,
MFIreg_E, MFLreg_E, MFMreg_E,
MFDAG1_E, Post1_E, imAddr_R, DAG1D_R, DAG2D_R,
DAG1_EN, DOUBLE_R, idBR_R, Post2_E, MFDAG2_E,
DAG2_EN, DAG2P_R, DMAen_R,
 IRE, IR,
 MSTAT1, redoSTI_h, redoEX_h, PwriteI_Eg, DwriteI_Eg,
accPM_E, redoM_h,
 STEAL, T0Sreqx, T1Sreqx, R0Sreqx, R1Sreqx,
SREQ, T0sack, T1sack, R0sack, R1sack,
R0IREG, R1IREG, T0IREG, T1IREG,
R0MREG, R1MREG, T0MREG, T1MREG,
 DSreqx, BOOT, DCTL,
 DMDid,
 BSreqx, BPM_cyc, BDM_cyc, BIAD, BM_cyc,
ECYC,
`ifdef FD_DFT
 SCAN_TEST,
`endif



 T0wrap, T1wrap, R0wrap, R1wrap,
 DMA_R, DMA, PMA_R, PMA,
DMAin, PMAin, dagDMD_do);


input [13:0] BIAD;
input BSreqx,
BPM_cyc,
BDM_cyc,
BM_cyc,
ECYC;
input DSPCLK,
T_RST;
input GO_E;
input GO_C;
input EX_en;
input MFDAG1_E;
input MFDAG2_E;
input Post1_E;

input Post2_E;
input imAddr_R;
input DAG1D_R;
input DAG2D_R;
input DAG1_EN;

input DAG2_EN;
input DOUBLE_R;
input idBR_R;
input MSTAT1;
input redoSTI_h;
input redoEX_h;
input redoM_h;
input PwriteI_Eg;
input DwriteI_Eg;
input accPM_E;
input STEAL;
input T0Sreqx;
input T1Sreqx;
input R0Sreqx;
input R1Sreqx;
input SREQ;
input T0sack;
input T1sack;
input R0sack;
input R1sack;
input DSreqx;
input BOOT;
input STBY;
input [7:0] MTIreg_E;


input [7:0] MTLreg_E;
input [7:0] MTMreg_E;
input [7:0] MFIreg_E;

input [7:0] MFLreg_E;
input [7:0] MFMreg_E;
input [2:0] R0IREG;
input [2:0] R1IREG;
input [2:0] T0IREG;
input [2:0] T1IREG;
input [1:0] R0MREG;
input [1:0] R1MREG;
input [1:0] T0MREG;
input [1:0] T1MREG;
input [15:0] DMDid;
input [14:0] DCTL;
input [17:0] IR;
input [3:0] IRE;
input DAG2P_R, DMAen_R;

`ifdef FD_DFT
input SCAN_TEST;
`endif


output T0wrap, T1wrap, R0wrap, R1wrap;
output [13:0] DMA_R, DMA, DMAin;
output [13:0] PMA_R, PMA, PMAin;
output [15:0] dagDMD_do;

/*------------------------------------------------------------------------------*/

wire [13:0] I1, L1, M1;
wire [13:0] I2, L2, M2;
wire [13:0] newI1, newI2;
wire [13:0] STA_C, IS_R2;
wire [2:0] STEALI_R, STEALM_R, STEALI_E;
wire SPreqx, Sackx, sel_PMA, sel_PMAR;
wire [15:0] dag1DMD_do, dag2DMD_do;
wire [13:0] I7_4, I_R7_4;
wire ldI7_4, ldI_R7_4;

assign dagDMD_do[15:0] = dag1DMD_do[15:0] | dag2DMD_do[15:0];

ILM1REG ilm1reg (/* IN */
DSPCLK, T_RST, GO_C, GO_E, EX_en, Post1_E, IR[17:0], IRE[3:0],
MTIreg_E[3:0], newI1[13:0], MTLreg_E[3:0],
MTMreg_E[3:0], MFIreg_E[3:0], MFLreg_E[3:0],
MFMreg_E[3:0], MSTAT1, MFDAG1_E,
DAG1D_R, DAG2D_R, imAddr_R, redoSTI_h, redoEX_h,
PwriteI_Eg, DwriteI_Eg, STEAL, T0Sreqx, T1Sreqx, R0Sreqx, R1Sreqx,
R0IREG[2:0], R1IREG[2:0], T0IREG[2:0], T1IREG[2:0],
R0MREG[1:0], R1MREG[1:0], T0MREG[1:0], T1MREG[1:0],
DSreqx, BOOT, STBY, redoM_h, accPM_E, SREQ,
PMA_R[13:0], PMA[13:0], DCTL[14:0], IS_R2[13:0],
T0sack, T1sack, R0sack, R1sack, DAG1_EN, newI2[13:0],
ldI7_4, ldI_R7_4, I7_4[13:0], I_R7_4[13:0],
Post2_E, DMAen_R,
 BSreqx, BDM_cyc, BIAD[13:0], BM_cyc, ECYC,
`ifdef FD_DFT
 SCAN_TEST,
`endif


I1[13:0], L1[13:0], M1[13:0], STEALI_R[2:0], STEALM_R[1:0],
STEALI_E[2:0], SPreqx, DMA_R[13:0], DMA[13:0], DMAin[13:0],
STA_C[13:0], sel_PMA, sel_PMAR, Sackx, DMDid[13:0],
dag1DMD_do[15:0]);

MODULO1 modulo1 (/* OUT */
newI1[13:0], T0wrap, T1wrap, R0wrap, R1wrap,

T0sack, T1sack, R0sack, R1sack, STEALI_E[2], wrap2,
DSPCLK, I1[13:0], M1[13:0], L1[13:0]);

ILM2REG ilm2reg (/* IN */
DSPCLK, T_RST, GO_E, GO_C, EX_en, DOUBLE_R, idBR_R, Post2_E,
MTIreg_E[7:4], MTLreg_E[7:4], MTMreg_E[7:4],
MFIreg_E[7:4], MFLreg_E[7:4], MFMreg_E[7:4],
newI2[13:0], IR[7:0], MFDAG2_E,
STEALI_R[2:0], STEALM_R[1:0], STEALI_E[2:0],
STEAL, SPreqx, redoM_h, STBY, redoSTI_h, sel_PMA, sel_PMAR,
DSreqx, BOOT, DCTL[14:0], STA_C[13:0], Sackx, DAG2_EN, DAG2P_R,
 BSreqx, BPM_cyc, BIAD[13:0], BM_cyc, ECYC,
`ifdef FD_DFT
 SCAN_TEST,
`endif


I2[13:0], L2[13:0], M2[13:0], PMA_R[13:0],
PMA[13:0], PMAin[13:0], IS_R2[13:0],
ldI7_4, ldI_R7_4, I7_4[13:0], I_R7_4[13:0],
DMDid[13:0], dag2DMD_do[15:0]);

MODULO2 modulo2 (/* OUT */
newI2[13:0], wrap2,

I2[13:0], M2[13:0], L2[13:0]);


endmodule
