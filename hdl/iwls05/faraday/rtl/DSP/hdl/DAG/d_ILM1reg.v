
















`define del 1
`include "../../include/x_def.v"

module ILM1REG(/* IN */
DSPCLK, T_RST, GO_C, GO_E, EX_en, Post1_E, IR, IRE,
MTIreg_E, newI1, MTLreg_E,
MTMreg_E, MFIreg_E, MFLreg_E,
MFMreg_E, MSTAT1, MFDAG1_E,
DAG1D_R, DAG2D_R, immAddr_R, redoSTI_h, redoEX_h,
PwriteI_Eg, DwriteI_Eg, STEAL, T0Sreqx, T1Sreqx, R0Sreqx, R1Sreqx,
R0IREG, R1IREG, T0IREG, T1IREG,
R0MREG, R1MREG, T0MREG, T1MREG,
DSreqx, BOOT, STBY, redoM_h, accPM_E, SREQ,
DAG2A_R, PMA, DCTL, IS_R2,
T0sack, T1sack, R0sack, R1sack, DAG1_EN, newI2,
ldI7_4, ldI_R7_4, I7_4, I_R7_4,
Post2_E, DMAen_R,
 BSreqx, BDM_cyc, BIAD, BM_cyc, ECYC,
`ifdef FD_DFT
 SCAN_TEST,
`endif


I, L, M, STEALI_R, STEALM_R,
STEALI_E, SPreqx, DMA_R, DMA, DMAin,
STA_C, sel_PMA, sel_PMAR, Sackx,


DMDin, DMD);

/*----------------------------------------------*/

/*----------------------------------------------*/
input [13:0] BIAD;
input BSreqx, BDM_cyc, BM_cyc, ECYC;
input DSPCLK, T_RST, GO_C, GO_E, EX_en, Post1_E;
input [3:0] MTIreg_E, MTLreg_E, MTMreg_E;
input [13:0] newI1;
input [17:0] IR;
input [3:0] IRE;
input [3:0] MFIreg_E, MFLreg_E, MFMreg_E;
input MSTAT1, MFDAG1_E, immAddr_R;
input DAG1D_R, DAG2D_R, STEAL, DMAen_R;
input redoSTI_h, redoEX_h, PwriteI_Eg, DwriteI_Eg;
input T0Sreqx, T1Sreqx, R0Sreqx, R1Sreqx, redoM_h;
input [2:0] R0IREG, R1IREG, T0IREG, T1IREG;
input [1:0] R0MREG, R1MREG, T0MREG, T1MREG;
input DSreqx, BOOT, STBY, accPM_E;
input SREQ;
input [14:0] DCTL;
input [13:0] DAG2A_R;
input [13:0] PMA;
input [13:0] IS_R2;
input [13:0] newI2;
input T0sack, T1sack, R0sack, R1sack;
input DAG1_EN, Post2_E;
input ldI7_4, ldI_R7_4;
input [13:0] I7_4, I_R7_4;
`ifdef FD_DFT
input SCAN_TEST;
`endif

/*----------------------------------------------*/

/*----------------------------------------------*/
output [13:0] I, L, M;
output [13:0] DMA, DMA_R, DMAin;
output [13:0] STA_C;
output [2:0] STEALI_R, STEALI_E;
output [1:0] STEALM_R;
output SPreqx, sel_PMA, sel_PMAR;
output Sackx;

/*----------------------------------------------*/

/*----------------------------------------------*/
input [13:0] DMDin;
output [15:0] DMD;


`ifdef FD_DFT
reg RST_o;
wire RST;
always @(posedge DSPCLK) RST_o <= #`db T_RST;
assign RST = SCAN_TEST ? T_RST : RST_o;
`else
reg RST;
always @(posedge DSPCLK) RST <= #`db T_RST;
`endif
/*----------------------------------------------*/





/*----------------------------------------------*/
wire sel_STAC, sel_DMAR, sel_DMA, sel_BDMA;

assign sel_STAC = redoSTI_h;
assign sel_DMAR = !SREQ && !DwriteI_Eg && GO_E;
assign sel_DMA = !SREQ && DwriteI_Eg && GO_E
|| redoEX_h;

assign sel_PMAR = !SREQ && !PwriteI_Eg && GO_E;
assign sel_PMA = !SREQ && PwriteI_Eg && GO_E
|| redoEX_h;

/*----------------------------------------------*/

/*----------------------------------------------*/

wire SPreqx = T0Sreqx || T1Sreqx || R0Sreqx || R1Sreqx;
wire Sackx = T0sack || T1sack || R0sack || R1sack;

/*----------------------------------------------*/



/*----------------------------------------------*/
wire [2:0] STEALI_R;
wire [1:0] STEALM_R;
wire [13:0] Iin;
reg [2:0] STEALI_E;
reg [1:0] STEALM_E;

assign STEALI_R[2:0] = {3{T0Sreqx}} & T0IREG[2:0]
| {3{T1Sreqx}} & T1IREG[2:0]
| {3{R0Sreqx}} & R0IREG[2:0]
| {3{R1Sreqx}} & R1IREG[2:0];

assign STEALM_R[1:0] = {2{T0Sreqx}} & T0MREG[1:0]
| {2{T1Sreqx}} & T1MREG[1:0]
| {2{R0Sreqx}} & R0MREG[1:0]
| {2{R1Sreqx}} & R1MREG[1:0];

/*------------------------------------------------------*/




/*------------------------------------------------------*/

always @(posedge DSPCLK)
if (SREQ) STEALI_E[2:0] <= #`db STEALI_R[2:0];

assign #`db Iin[13:0] = (Post1_E | Sackx) ? newI1[13:0] : DMDin[13:0];

wire [1:0] updateI0, updateI1, updateI2, updateI3;
wire CLKI0enb, CLKI1enb, CLKI2enb, CLKI3enb;
wire [3:0] ldI;
wire [13:0] I0, I1, I2, I3;

assign updateI0[1] = Sackx && (STEALI_E[2:0] == 3'b000);
assign updateI0[0] = !Sackx && Post1_E && (IRE[3:2] == 2'b00) && EX_en;

assign updateI1[1] = Sackx && (STEALI_E[2:0] == 3'b001);
assign updateI1[0] = !Sackx && Post1_E && (IRE[3:2] == 2'b01) && EX_en;

assign updateI2[1] = Sackx && (STEALI_E[2:0] == 3'b010);
assign updateI2[0] = !Sackx && Post1_E && (IRE[3:2] == 2'b10) && EX_en;

assign updateI3[1] = Sackx && (STEALI_E[2:0] == 3'b011);
assign updateI3[0] = !Sackx && Post1_E && (IRE[3:2] == 2'b11) && EX_en;

assign CLKI0enb = !((MTIreg_E[0] && EX_en) || updateI0[1] || updateI0[0]);
assign CLKI1enb = !((MTIreg_E[1] && EX_en) || updateI1[1] || updateI1[0]);
assign CLKI2enb = !((MTIreg_E[2] && EX_en) || updateI2[1] || updateI2[0]);
assign CLKI3enb = !((MTIreg_E[3] && EX_en) || updateI3[1] || updateI3[0]);

assign ldI[0] = (MTIreg_E[0] && EX_en && GO_C)
|| (updateI0[0] && EX_en && GO_C) || updateI0[1];
assign ldI[1] = (MTIreg_E[1] && EX_en && GO_C)
|| (updateI1[0] && EX_en && GO_C) || updateI1[1];
assign ldI[2] = (MTIreg_E[2] && EX_en && GO_C)
|| (updateI2[0] && EX_en && GO_C) || updateI2[1];
assign ldI[3] = (MTIreg_E[3] && EX_en && GO_C)
|| (updateI3[0] && EX_en && GO_C) || updateI3[1];

`ifdef FD_DFT
REG14L I0_we(DSPCLK, RST, CLKI0enb, ldI[0], Iin[13:0], I0[13:0], SCAN_TEST);
REG14L I1_we(DSPCLK, RST, CLKI1enb, ldI[1], Iin[13:0], I1[13:0], SCAN_TEST);
REG14L I2_we(DSPCLK, RST, CLKI2enb, ldI[2], Iin[13:0], I2[13:0], SCAN_TEST);
REG14L I3_we(DSPCLK, RST, CLKI3enb, ldI[3], Iin[13:0], I3[13:0], SCAN_TEST);
`else
REG14L I0_we(DSPCLK, RST, CLKI0enb, ldI[0], Iin[13:0], I0[13:0]);
REG14L I1_we(DSPCLK, RST, CLKI1enb, ldI[1], Iin[13:0], I1[13:0]);
REG14L I2_we(DSPCLK, RST, CLKI2enb, ldI[2], Iin[13:0], I2[13:0]);
REG14L I3_we(DSPCLK, RST, CLKI3enb, ldI[3], Iin[13:0], I3[13:0]);
`endif

/*----------------------------------------------*/

/*----------------------------------------------*/

wire CLKL0enb, CLKL1enb, CLKL2enb, CLKL3enb;
wire [3:0] ldL;
wire [13:0] L0, L1, L2, L3;

assign CLKL0enb = !(MTLreg_E[0] && EX_en);
assign CLKL1enb = !(MTLreg_E[1] && EX_en);
assign CLKL2enb = !(MTLreg_E[2] && EX_en);
assign CLKL3enb = !(MTLreg_E[3] && EX_en);

assign ldL[0] = MTLreg_E[0] && EX_en && GO_C;
assign ldL[1] = MTLreg_E[1] && EX_en && GO_C;
assign ldL[2] = MTLreg_E[2] && EX_en && GO_C;
assign ldL[3] = MTLreg_E[3] && EX_en && GO_C;

`ifdef FD_DFT
REG14L L0_we(DSPCLK, RST, CLKL0enb, ldL[0], DMDin[13:0], L0[13:0], SCAN_TEST);
REG14L L1_we(DSPCLK, RST, CLKL1enb, ldL[1], DMDin[13:0], L1[13:0], SCAN_TEST);
REG14L L2_we(DSPCLK, RST, CLKL2enb, ldL[2], DMDin[13:0], L2[13:0], SCAN_TEST);
REG14L L3_we(DSPCLK, RST, CLKL3enb, ldL[3], DMDin[13:0], L3[13:0], SCAN_TEST);
`else
REG14L L0_we(DSPCLK, RST, CLKL0enb, ldL[0], DMDin[13:0], L0[13:0]);
REG14L L1_we(DSPCLK, RST, CLKL1enb, ldL[1], DMDin[13:0], L1[13:0]);
REG14L L2_we(DSPCLK, RST, CLKL2enb, ldL[2], DMDin[13:0], L2[13:0]);
REG14L L3_we(DSPCLK, RST, CLKL3enb, ldL[3], DMDin[13:0], L3[13:0]);
`endif

/*----------------------------------------------*/

/*----------------------------------------------*/

wire CLKM0enb, CLKM1enb, CLKM2enb, CLKM3enb;
wire [3:0] ldM;
wire [13:0] M0, M1, M2, M3;

assign CLKM0enb = !(MTMreg_E[0] && EX_en);
assign CLKM1enb = !(MTMreg_E[1] && EX_en);
assign CLKM2enb = !(MTMreg_E[2] && EX_en);
assign CLKM3enb = !(MTMreg_E[3] && EX_en);

assign ldM[0] = MTMreg_E[0] && EX_en && GO_C;
assign ldM[1] = MTMreg_E[1] && EX_en && GO_C;
assign ldM[2] = MTMreg_E[2] && EX_en && GO_C;
assign ldM[3] = MTMreg_E[3] && EX_en && GO_C;

`ifdef FD_DFT
REG14L M0_we(DSPCLK, RST, CLKM0enb, ldM[0], DMDin[13:0], M0[13:0], SCAN_TEST);
REG14L M1_we(DSPCLK, RST, CLKM1enb, ldM[1], DMDin[13:0], M1[13:0], SCAN_TEST);
REG14L M2_we(DSPCLK, RST, CLKM2enb, ldM[2], DMDin[13:0], M2[13:0], SCAN_TEST);
REG14L M3_we(DSPCLK, RST, CLKM3enb, ldM[3], DMDin[13:0], M3[13:0], SCAN_TEST);
`else
REG14L M0_we(DSPCLK, RST, CLKM0enb, ldM[0], DMDin[13:0], M0[13:0]);
REG14L M1_we(DSPCLK, RST, CLKM1enb, ldM[1], DMDin[13:0], M1[13:0]);
REG14L M2_we(DSPCLK, RST, CLKM2enb, ldM[2], DMDin[13:0], M2[13:0]);
REG14L M3_we(DSPCLK, RST, CLKM3enb, ldM[3], DMDin[13:0], M3[13:0]);
`endif

/*----------------------------------------------*/






/*----------------------------------------------*/
wire [13:0] Iout;
wire [1:0] ISEL;
wire [13:0] I_D;

assign ISEL[1:0] = redoM_h ? IRE[3:2]
: SPreqx ? STEALI_R[1:0] : IR[3:2] ;

assign I_D[13:0] = {14{(ISEL[1:0] == 2'b00) && !ldI[0]}} & I0[13:0] |
{14{(ISEL[1:0] == 2'b01) && !ldI[1]}} & I1[13:0] |
{14{(ISEL[1:0] == 2'b10) && !ldI[2]}} & I2[13:0] |
{14{(ISEL[1:0] == 2'b11) && !ldI[3]}} & I3[13:0] |
{14{(ISEL[1:0] == 2'b00) && ldI[0]}} & Iin[13:0] |
{14{(ISEL[1:0] == 2'b01) && ldI[1]}} & Iin[13:0] |
{14{(ISEL[1:0] == 2'b10) && ldI[2]}} & Iin[13:0] |
{14{(ISEL[1:0] == 2'b11) && ldI[3]}} & Iin[13:0] ;
`ifdef FD_RTL_SIM
wire [13:0] I_R;
wire [13:0] IS_R1;
wire [13:0] IS_R;

assign I_R[13:0] = {14{(IR[3:2] == 2'b00) && !ldI[0]}} & I0[13:0] |
{14{(IR[3:2] == 2'b01) && !ldI[1]}} & I1[13:0] |
{14{(IR[3:2] == 2'b10) && !ldI[2]}} & I2[13:0] |
{14{(IR[3:2] == 2'b11) && !ldI[3]}} & I3[13:0] |
{14{(IR[3:2] == 2'b00) && ldI[0]}} & Iin[13:0] |
{14{(IR[3:2] == 2'b01) && ldI[1]}} & Iin[13:0] |
{14{(IR[3:2] == 2'b10) && ldI[2]}} & Iin[13:0] |
{14{(IR[3:2] == 2'b11) && ldI[3]}} & Iin[13:0] ;

assign IS_R1[13:0] = {14{(STEALI_R[2:0] == 3'b000) && !ldI[0]}} & I0[13:0] |
{14{(STEALI_R[2:0] == 3'b001) && !ldI[1]}} & I1[13:0] |
{14{(STEALI_R[2:0] == 3'b010) && !ldI[2]}} & I2[13:0] |
{14{(STEALI_R[2:0] == 3'b011) && !ldI[3]}} & I3[13:0] |
{14{(STEALI_R[2:0] == 3'b000) && ldI[0]}} & Iin[13:0] |
{14{(STEALI_R[2:0] == 3'b001) && ldI[1]}} & Iin[13:0] |
{14{(STEALI_R[2:0] == 3'b010) && ldI[2]}} & Iin[13:0] |
{14{(STEALI_R[2:0] == 3'b011) && ldI[3]}} & Iin[13:0] ;

assign IS_R[13:0] = IS_R1[13:0] | IS_R2[13:0];

`else
wire [13:0] I_R3_0;
wire ldI_R3_0;
wire [13:0] IS_R3_0;
wire ldIS_R3_0;
wire [13:0] I3_0;
wire ldI3_0;

assign I_R3_0[13:0] = {14{(IR[3:2] == 2'b00) && !ldI[0]}} & I0[13:0] |
{14{(IR[3:2] == 2'b01) && !ldI[1]}} & I1[13:0] |
{14{(IR[3:2] == 2'b10) && !ldI[2]}} & I2[13:0] |
{14{(IR[3:2] == 2'b11) && !ldI[3]}} & I3[13:0] ;

assign ldI_R3_0 = (IR[3:2] == 2'b00) && ldI[0] ||
(IR[3:2] == 2'b01) && ldI[1] ||
(IR[3:2] == 2'b10) && ldI[2] ||
(IR[3:2] == 2'b11) && ldI[3] ;

assign IS_R3_0[13:0] = {14{(STEALI_R[2:0] == 3'b000) && !ldI[0]}} & I0[13:0] |
{14{(STEALI_R[2:0] == 3'b001) && !ldI[1]}} & I1[13:0] |
{14{(STEALI_R[2:0] == 3'b010) && !ldI[2]}} & I2[13:0] |
{14{(STEALI_R[2:0] == 3'b011) && !ldI[3]}} & I3[13:0] ;

assign ldIS_R3_0 = (STEALI_R[2:0] == 3'b000) && ldI[0] ||
(STEALI_R[2:0] == 3'b001) && ldI[1] ||
(STEALI_R[2:0] == 3'b010) && ldI[2] ||
(STEALI_R[2:0] == 3'b011) && ldI[3] ;

assign ldI3_0 = SPreqx ? ldIS_R3_0 : ldI_R3_0;
assign I3_0[13:0] = SPreqx ? IS_R3_0[13:0] : I_R3_0[13:0];

`endif

assign Iout[13:0] = {14{MFIreg_E[0]}} & I0[13:0] |
{14{MFIreg_E[1]}} & I1[13:0] |
{14{MFIreg_E[2]}} & I2[13:0] |
{14{MFIreg_E[3]}} & I3[13:0] ;

/*----------------------------------------------*/



/*----------------------------------------------*/
wire [13:0] Lout;
wire [13:0] L_D;

assign L_D[13:0] = {14{(ISEL[1:0] == 2'b00) && !ldL[0]}} & L0[13:0] |
{14{(ISEL[1:0] == 2'b01) && !ldL[1]}} & L1[13:0] |
{14{(ISEL[1:0] == 2'b10) && !ldL[2]}} & L2[13:0] |
{14{(ISEL[1:0] == 2'b11) && !ldL[3]}} & L3[13:0] |
{14{(ISEL[1:0] == 2'b00) & ldL[0]}} & DMDin[13:0] |
{14{(ISEL[1:0] == 2'b01) & ldL[1]}} & DMDin[13:0] |
{14{(ISEL[1:0] == 2'b10) & ldL[2]}} & DMDin[13:0] |
{14{(ISEL[1:0] == 2'b11) & ldL[3]}} & DMDin[13:0] ;

assign Lout[13:0] = {14{MFLreg_E[0]}} & L0[13:0] |
{14{MFLreg_E[1]}} & L1[13:0] |
{14{MFLreg_E[2]}} & L2[13:0] |
{14{MFLreg_E[3]}} & L3[13:0];

/*----------------------------------------------*/



/*----------------------------------------------*/
wire [13:0] M_D;
wire [13:0] Mout;
wire [1:0] MSEL;

assign MSEL[1:0] = redoM_h ? IRE[1:0]
: SPreqx ? STEALM_R[1:0] : IR[1:0];

assign M_D[13:0] = {14{(MSEL[1:0] == 2'b00) && !ldM[0]}} & M0[13:0] |
{14{(MSEL[1:0] == 2'b01) && !ldM[1]}} & M1[13:0] |
{14{(MSEL[1:0] == 2'b10) && !ldM[2]}} & M2[13:0] |
{14{(MSEL[1:0] == 2'b11) && !ldM[3]}} & M3[13:0] |
{14{(MSEL[1:0] == 2'b00) && ldM[0]}} & DMDin[13:0] |
{14{(MSEL[1:0] == 2'b01) && ldM[1]}} & DMDin[13:0] |
{14{(MSEL[1:0] == 2'b10) && ldM[2]}} & DMDin[13:0] |
{14{(MSEL[1:0] == 2'b11) && ldM[3]}} & DMDin[13:0] ;

assign Mout[13:0] = {14{MFMreg_E[0]}} & M0[13:0] |
{14{MFMreg_E[1]}} & M1[13:0] |
{14{MFMreg_E[2]}} & M2[13:0] |
{14{MFMreg_E[3]}} & M3[13:0] ;


/*----------------------------------------------*/


/*----------------------------------------------*/
wire [15:0] DAG1out;

assign DAG1out[15:14] = {2{Mout[13]}};

assign DAG1out[13:0] = Iout[13:0] |
Lout[13:0] |
Mout[13:0];

assign #2 DMD[15:0] = {16{MFDAG1_E}} & DAG1out[15:0];

/*----------------------------------------------*/

/*----------------------------------------------*/
`ifdef FD_RTL_SIM

wire [13:0] BREVI_R;
wire [13:0] DAG1A_R;

assign BREVI_R[13:0] =
{I_R[0], I_R[1], I_R[2], I_R[3], I_R[4], I_R[5], I_R[6],
I_R[7], I_R[8], I_R[9], I_R[10], I_R[11], I_R[12], I_R[13]};

assign DAG1A_R[13:0] = MSTAT1 ? BREVI_R[13:0] : I_R[13:0];

`else
`endif

/*------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------*/








/*------------------------------------------------------------------------------*/
wire sel_ISR;
wire sel_DCTL;
wire [13:0] DMA_R;

wire CLKSTACenb, STACen;
wire [13:0] STA_C;
wire [13:0] STACin;

assign STACin[13:0] = accPM_E ? PMA[13:0] : DMA[13:0];

assign CLKSTACenb = !(T0Sreqx || R0Sreqx || T1Sreqx || R1Sreqx || DSreqx || BSreqx);
assign STACen = (GO_E || STEAL || STBY || BOOT || BM_cyc && ECYC) && GO_C &&
(T0Sreqx || R0Sreqx || T1Sreqx || R1Sreqx || DSreqx || BSreqx);

`ifdef FD_DFT
REG14L STAC_pi(DSPCLK, RST, CLKSTACenb, STACen, STACin[13:0], STA_C[13:0], SCAN_TEST);
`else
REG14L STAC_pi(DSPCLK, RST, CLKSTACenb, STACen, STACin[13:0], STA_C[13:0]);
`endif


wire CLKDMAenb;
wire [13:0] DMA;

assign CLKDMAenb = !DMAen_R;

`ifdef FD_DFT
REG14L DMA_pi(DSPCLK, RST, CLKDMAenb, GO_E, DMA_R[13:0], DMA[13:0], SCAN_TEST);
`else
REG14L DMA_pi(DSPCLK, RST, CLKDMAenb, GO_E, DMA_R[13:0], DMA[13:0]);
`endif

`ifdef FD_RTL_SIM
assign #`db DMA_R[13:0] = {14{DAG1D_R}} & DAG1A_R[13:0]
| {14{DAG2D_R}} & DAG2A_R[13:0]
| {14{immAddr_R}} & IR[17:4];

`else
reg dmars2, dmars1, dmars0;
wire [6:0] DMARCOND;
wire [13:0] DMAROT;

assign DMAROT[13:0] = {14{(!ldI_R7_4) & DAG2D_R}} & I_R7_4[13:0]
| {14{immAddr_R}} & IR[17:4];

assign DMARCOND[6:0] = {(Post1_E || Sackx), ldI_R3_0, MSTAT1, (Post2_E || Sackx), ldI_R7_4, DAG1D_R, DAG2D_R};

always @(DMARCOND)
begin
casex (DMARCOND)
7'b011xx10 : {dmars2, dmars1, dmars0} = 3'b000;
7'b010xx10 : {dmars2, dmars1, dmars0} = 3'b001;
7'b111xx10 : {dmars2, dmars1, dmars0} = 3'b010;
7'b110xx10 : {dmars2, dmars1, dmars0} = 3'b011;
7'bx01xx10 : {dmars2, dmars1, dmars0} = 3'b100;
7'bx00xx10 : {dmars2, dmars1, dmars0} = 3'b101;
7'bxxx0101 : {dmars2, dmars1, dmars0} = 3'b001;
7'bxxx1101 : {dmars2, dmars1, dmars0} = 3'b110;
7'bxxxx001 : {dmars2, dmars1, dmars0} = 3'b111;
7'bxxxxx00 : {dmars2, dmars1, dmars0} = 3'b111;


default : {dmars2, dmars1, dmars0} = 3'b111;

endcase
end


GTECH_MUX8 dmar13(.D0(DMDin[0]), .D1(DMDin[13]), .D2(newI1[0]), .D3(newI1[13]),
.D4(I_R3_0[0]), .D5(I_R3_0[13]), .D6(newI2[13]), .D7(DMAROT[13]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[13]));

GTECH_MUX8 dmar12(.D0(DMDin[1]), .D1(DMDin[12]), .D2(newI1[1]), .D3(newI1[12]),
.D4(I_R3_0[1]), .D5(I_R3_0[12]), .D6(newI2[12]), .D7(DMAROT[12]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[12]));

GTECH_MUX8 dmar11(.D0(DMDin[2]), .D1(DMDin[11]), .D2(newI1[2]), .D3(newI1[11]),
.D4(I_R3_0[2]), .D5(I_R3_0[11]), .D6(newI2[11]), .D7(DMAROT[11]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[11]));

GTECH_MUX8 dmar10(.D0(DMDin[3]), .D1(DMDin[10]), .D2(newI1[3]), .D3(newI1[10]),
.D4(I_R3_0[3]), .D5(I_R3_0[10]), .D6(newI2[10]), .D7(DMAROT[10]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[10]));

GTECH_MUX8 dmar09(.D0(DMDin[4]), .D1(DMDin[9]), .D2(newI1[4]), .D3(newI1[9]),
.D4(I_R3_0[4]), .D5(I_R3_0[9]), .D6(newI2[9]), .D7(DMAROT[9]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[9]));

GTECH_MUX8 dmar08(.D0(DMDin[5]), .D1(DMDin[8]), .D2(newI1[5]), .D3(newI1[8]),
.D4(I_R3_0[5]), .D5(I_R3_0[8]), .D6(newI2[8]), .D7(DMAROT[8]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[8]));

GTECH_MUX8 dmar07(.D0(DMDin[6]), .D1(DMDin[7]), .D2(newI1[6]), .D3(newI1[7]),
.D4(I_R3_0[6]), .D5(I_R3_0[7]), .D6(newI2[7]), .D7(DMAROT[7]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[7]));

GTECH_MUX8 dmar06(.D0(DMDin[7]), .D1(DMDin[6]), .D2(newI1[7]), .D3(newI1[6]),
.D4(I_R3_0[7]), .D5(I_R3_0[6]), .D6(newI2[6]), .D7(DMAROT[6]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[6]));

GTECH_MUX8 dmar05(.D0(DMDin[8]), .D1(DMDin[5]), .D2(newI1[8]), .D3(newI1[5]),
.D4(I_R3_0[8]), .D5(I_R3_0[5]), .D6(newI2[5]), .D7(DMAROT[5]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[5]));

GTECH_MUX8 dmar04(.D0(DMDin[9]), .D1(DMDin[4]), .D2(newI1[9]), .D3(newI1[4]),
.D4(I_R3_0[9]), .D5(I_R3_0[4]), .D6(newI2[4]), .D7(DMAROT[4]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[4]));

GTECH_MUX8 dmar03(.D0(DMDin[10]), .D1(DMDin[3]), .D2(newI1[10]), .D3(newI1[3]),
.D4(I_R3_0[10]), .D5(I_R3_0[3]), .D6(newI2[3]), .D7(DMAROT[3]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[3]));

GTECH_MUX8 dmar02(.D0(DMDin[11]), .D1(DMDin[2]), .D2(newI1[11]), .D3(newI1[2]),
.D4(I_R3_0[11]), .D5(I_R3_0[2]), .D6(newI2[2]), .D7(DMAROT[2]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[2]));

GTECH_MUX8 dmar01(.D0(DMDin[12]), .D1(DMDin[1]), .D2(newI1[12]), .D3(newI1[1]),
.D4(I_R3_0[12]), .D5(I_R3_0[1]), .D6(newI2[1]), .D7(DMAROT[1]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[1]));

GTECH_MUX8 dmar00(.D0(DMDin[13]), .D1(DMDin[0]), .D2(newI1[13]), .D3(newI1[0]),
.D4(I_R3_0[13]), .D5(I_R3_0[0]), .D6(newI2[0]), .D7(DMAROT[0]),
.C(dmars2), .B(dmars1), .A(dmars0), .Z(DMA_R[0]));

`endif

assign sel_ISR = SPreqx && (GO_E || STEAL || STBY);
assign sel_DCTL = DSreqx && DCTL[14] && (GO_E || STEAL || BOOT || STBY);
assign sel_BDMA = BSreqx && BDM_cyc && (GO_E || STEAL || BOOT || STBY || BM_cyc && ECYC);

`ifdef FD_RTL_SIM
assign #`db DMAin = sel_BDMA ? BIAD[13:0] :
{14{sel_ISR}} & IS_R[13:0]
| {14{sel_DCTL}} & DCTL[13:0]
| {14{sel_STAC}} & STA_C[13:0]
| {14{sel_DMAR}} & DMA_R[13:0]
| {14{sel_DMA}} & DMA[13:0] ;

`else
reg dmas2, dmas1, dmas0;
wire [8:0] DMACOND;
wire [13:0] DMAOT;

assign DMAOT[13:0] = sel_BDMA ? BIAD[13:0] :
{14{sel_DCTL}} & DCTL[13:0]
| {14{sel_STAC}} & STA_C[13:0]
| {14{sel_DMA}} & DMA[13:0]
| {14{sel_DMAR && DAG2D_R}} & I7_4[13:0]
| {14{sel_DMAR && DAG1D_R}} & I3_0[13:0]
| {14{sel_DMAR && immAddr_R}} & IR[17:4];

assign DMACOND[8:0] = {(Post1_E || Sackx), ldI3_0, MSTAT1, (Post2_E || Sackx),
ldI7_4, sel_ISR, sel_DMAR, DAG1D_R, DAG2D_R};

always @(DMACOND)
begin
casex (DMACOND)
9'b01xxx1xxx : {dmas2, dmas1, dmas0} = 3'b000;
9'b11xxx1xxx : {dmas2, dmas1, dmas0} = 3'b001;
9'bx0xx01xxx : {dmas2, dmas1, dmas0} = 3'b010;
9'b011xxx11x : {dmas2, dmas1, dmas0} = 3'b011;
9'b010xxx11x : {dmas2, dmas1, dmas0} = 3'b000;
9'b111xxx11x : {dmas2, dmas1, dmas0} = 3'b100;
9'b110xxx11x : {dmas2, dmas1, dmas0} = 3'b001;
9'bx01xxx11x : {dmas2, dmas1, dmas0} = 3'b101;
9'bx00xxx11x : {dmas2, dmas1, dmas0} = 3'b111;
9'bxxx011xxx : {dmas2, dmas1, dmas0} = 3'b000;
9'bxxx111xxx : {dmas2, dmas1, dmas0} = 3'b110;
9'bxxx01x1x1 : {dmas2, dmas1, dmas0} = 3'b000;
9'bxxx11x1x1 : {dmas2, dmas1, dmas0} = 3'b110;
9'bxxxx0x1x1 : {dmas2, dmas1, dmas0} = 3'b111;
9'bxxxxx00xx : {dmas2, dmas1, dmas0} = 3'b111;
9'bxxxxxx100 : {dmas2, dmas1, dmas0} = 3'b111;


default : {dmas2, dmas1, dmas0} = 3'b111;

endcase
end

wire [13:0] ISR;
assign ISR[13:0] = I3_0[13:0] | I7_4[13:0];

GTECH_MUX8 dma13(.D0(DMDin[13]), .D1(newI1[13]), .D2(ISR[13]), .D3(DMDin[0]),
.D4(newI1[0]), .D5(I3_0[0]), .D6(newI2[13]), .D7(DMAOT[13]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[13]));

GTECH_MUX8 dma12(.D0(DMDin[12]), .D1(newI1[12]), .D2(ISR[12]), .D3(DMDin[1]),
.D4(newI1[1]), .D5(I3_0[1]), .D6(newI2[12]), .D7(DMAOT[12]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[12]));

GTECH_MUX8 dma11(.D0(DMDin[11]), .D1(newI1[11]), .D2(ISR[11]), .D3(DMDin[2]),
.D4(newI1[2]), .D5(I3_0[2]), .D6(newI2[11]), .D7(DMAOT[11]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[11]));

GTECH_MUX8 dma10(.D0(DMDin[10]), .D1(newI1[10]), .D2(ISR[10]), .D3(DMDin[3]),
.D4(newI1[3]), .D5(I3_0[3]), .D6(newI2[10]), .D7(DMAOT[10]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[10]));

GTECH_MUX8 dma09(.D0(DMDin[9]), .D1(newI1[9]), .D2(ISR[9]), .D3(DMDin[4]),
.D4(newI1[4]), .D5(I3_0[4]), .D6(newI2[9]), .D7(DMAOT[9]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[9]));

GTECH_MUX8 dma08(.D0(DMDin[8]), .D1(newI1[8]), .D2(ISR[8]), .D3(DMDin[5]),
.D4(newI1[5]), .D5(I3_0[5]), .D6(newI2[8]), .D7(DMAOT[8]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[8]));

GTECH_MUX8 dma07(.D0(DMDin[7]), .D1(newI1[7]), .D2(ISR[7]), .D3(DMDin[6]),
.D4(newI1[6]), .D5(I3_0[6]), .D6(newI2[7]), .D7(DMAOT[7]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[7]));

GTECH_MUX8 dma06(.D0(DMDin[6]), .D1(newI1[6]), .D2(ISR[6]), .D3(DMDin[7]),
.D4(newI1[7]), .D5(I3_0[7]), .D6(newI2[6]), .D7(DMAOT[6]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[6]));

GTECH_MUX8 dma05(.D0(DMDin[5]), .D1(newI1[5]), .D2(ISR[5]), .D3(DMDin[8]),
.D4(newI1[8]), .D5(I3_0[8]), .D6(newI2[5]), .D7(DMAOT[5]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[5]));

GTECH_MUX8 dma04(.D0(DMDin[4]), .D1(newI1[4]), .D2(ISR[4]), .D3(DMDin[9]),
.D4(newI1[9]), .D5(I3_0[9]), .D6(newI2[4]), .D7(DMAOT[4]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[4]));

GTECH_MUX8 dma03(.D0(DMDin[3]), .D1(newI1[3]), .D2(ISR[3]), .D3(DMDin[10]),
.D4(newI1[10]), .D5(I3_0[10]), .D6(newI2[3]), .D7(DMAOT[3]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[3]));

GTECH_MUX8 dma02(.D0(DMDin[2]), .D1(newI1[2]), .D2(ISR[2]), .D3(DMDin[11]),
.D4(newI1[11]), .D5(I3_0[11]), .D6(newI2[2]), .D7(DMAOT[2]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[2]));

GTECH_MUX8 dma01(.D0(DMDin[1]), .D1(newI1[1]), .D2(ISR[1]), .D3(DMDin[12]),
.D4(newI1[12]), .D5(I3_0[12]), .D6(newI2[1]), .D7(DMAOT[1]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[1]));

GTECH_MUX8 dma00(.D0(DMDin[0]), .D1(newI1[0]), .D2(ISR[0]), .D3(DMDin[13]),
.D4(newI1[13]), .D5(I3_0[13]), .D6(newI2[0]), .D7(DMAOT[0]),
.C(dmas2), .B(dmas1), .A(dmas0), .Z(DMAin[0]));

`endif

/*----------------------------------------------*/

/*----------------------------------------------*/
`ifdef FD_LR

wire [13:0] I, L, M;
wire CLKPIenb, CLKPLenb, CLKPMenb;
wire PIen, PLen, PMen;

assign CLKPIenb = !(DAG1_EN || redoM_h || SPreqx);
assign CLKPLenb = !(DAG1_EN || redoM_h || SPreqx);
assign CLKPMenb = !(DAG1_EN || redoM_h || SPreqx);

assign PIen = GO_E || redoM_h || sel_ISR;
assign PLen = GO_E || redoM_h || sel_ISR;
assign PMen = GO_E || redoM_h || sel_ISR;

`ifdef FD_DFT
REG14L pien(DSPCLK, RST, CLKPIenb, PIen, I_D[13:0], I[13:0], SCAN_TEST);
REG14L plen(DSPCLK, RST, CLKPLenb, PLen, L_D[13:0], L[13:0], SCAN_TEST);
REG14L pmen(DSPCLK, RST, CLKPMenb, PMen, M_D[13:0], M[13:0], SCAN_TEST);
`else
REG14L pien(DSPCLK, RST, CLKPIenb, PIen, I_D[13:0], I[13:0]);
REG14L plen(DSPCLK, RST, CLKPLenb, PLen, L_D[13:0], L[13:0]);
REG14L pmen(DSPCLK, RST, CLKPMenb, PMen, M_D[13:0], M[13:0]);
`endif

`else

reg [13:0] I, L, M;

always @(posedge DSPCLK or posedge RST)
if (RST) I[13:0] <= #`db 14'b0;
else if (GO_E & DAG1_EN | redoM_h | sel_ISR) I[13:0] <= #`db I_D[13:0];
always @(posedge DSPCLK or posedge RST)
if (RST) L[13:0] <= #`db 14'b0;
else if (GO_E & DAG1_EN | redoM_h | sel_ISR) L[13:0] <= #`db L_D[13:0];
always @(posedge DSPCLK or posedge RST)
if (RST) M[13:0] <= #`db 14'b0;
else if (GO_E & DAG1_EN | redoM_h | sel_ISR) M[13:0] <= #`db M_D[13:0];

`endif
endmodule

