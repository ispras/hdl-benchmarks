
















`define del 1
`include "x_def.v"

module ILM2REG (/* IN */
DSPCLK, T_RST, GO_E, GO_C, EX_en, DOUBLE_R, IDJUMP_D, Post2_E,
MTIreg_E, MTLreg_E, MTMreg_E,
MFIreg_E, MFLreg_E, MFMreg_E,
newI2, IR, MFDAG2_E,
STEALI_R, STEALM_R, STEALI_E,
STEAL, SPreqx, redoM_h, STBY, sel_STAC, sel_PMA, sel_PMAR,
DSreqx, BOOT, DCTL, STA_C, Sackx, DAG2_EN, DAG2P_R,
 BSreqx, BPM_cyc, BIAD, BM_cyc, ECYC,
`ifdef FD_DFT
 SCAN_TEST,
`endif


I, L, M, PMA_R,
PMA, PMAin, IS_R2, ldI7_4,
ldI_R7_4, I7_4, I_R7_4,

DMDin, DMD);

/*----------------------------------------------*/

/*----------------------------------------------*/
input [13:0] BIAD;
input BSreqx, BPM_cyc, BM_cyc, ECYC;
input DSPCLK, T_RST, GO_E, GO_C, EX_en, DOUBLE_R;
input IDJUMP_D, Post2_E;
input [7:4] MTIreg_E, MTLreg_E, MTMreg_E;
input [7:4] MFIreg_E, MFLreg_E, MFMreg_E;
input MFDAG2_E;
input [13:0] newI2;
input [7:0] IR;
input [2:0] STEALI_R, STEALI_E;
input [1:0] STEALM_R;
input STEAL, SPreqx, redoM_h;
input STBY, DSreqx, Sackx, BOOT;
input sel_STAC, sel_PMAR, sel_PMA;
input [13:0] STA_C;
input [14:0] DCTL;
input DAG2_EN;
input DAG2P_R;

`ifdef FD_DFT
input SCAN_TEST;
`endif

/*----------------------------------------------*/

/*----------------------------------------------*/

output [13:0] I, L, M;
output [13:0] PMA_R, PMA, PMAin;
output [13:0] IS_R2;
output ldI7_4, ldI_R7_4;
output [13:0] I7_4, I_R7_4;

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
wire [1:0] IL_R;
wire [13:0] Iin;
reg [1:0] IL_E;

assign #`db IL_R[1:0] = (DOUBLE_R | IDJUMP_D) ? IR[7:6] : IR[3:2];

assign Iin[13:0] = (Post2_E | Sackx) ? newI2[13:0] : DMDin[13:0];

always @(posedge DSPCLK)
if (GO_E) IL_E[1:0] <= #`db IL_R[1:0];

/*----------------------------------------------*/
wire [1:0] updateI4, updateI5, updateI6, updateI7;
wire CLKI4enb, CLKI5enb, CLKI6enb, CLKI7enb;
wire [7:4] ldI;
wire [13:0] I4, I5, I6, I7;

assign updateI4[1] = Sackx && (STEALI_E[2:0] == 3'b100);
assign updateI4[0] = !Sackx && Post2_E && (IL_E[1:0] == 2'b00) && EX_en;

assign updateI5[1] = Sackx && (STEALI_E[2:0] == 3'b101);
assign updateI5[0] = !Sackx && Post2_E && (IL_E[1:0] == 2'b01) && EX_en;

assign updateI6[1] = Sackx && (STEALI_E[2:0] == 3'b110);
assign updateI6[0] = !Sackx && Post2_E && (IL_E[1:0] == 2'b10) && EX_en;

assign updateI7[1] = Sackx && (STEALI_E[2:0] == 3'b111);
assign updateI7[0] = !Sackx && Post2_E && (IL_E[1:0] == 2'b11) && EX_en;

assign CLKI4enb = !((MTIreg_E[4] && EX_en) || updateI4[1] || updateI4[0]);
assign CLKI5enb = !((MTIreg_E[5] && EX_en) || updateI5[1] || updateI5[0]);
assign CLKI6enb = !((MTIreg_E[6] && EX_en) || updateI6[1] || updateI6[0]);
assign CLKI7enb = !((MTIreg_E[7] && EX_en) || updateI7[1] || updateI7[0]);

assign ldI[4] = (MTIreg_E[4] && EX_en && GO_C)
|| (updateI4[0] && EX_en && GO_C) || updateI4[1];
assign ldI[5] = (MTIreg_E[5] && EX_en && GO_C)
|| (updateI5[0] && EX_en && GO_C) || updateI5[1];
assign ldI[6] = (MTIreg_E[6] && EX_en && GO_C)
|| (updateI6[0] && EX_en && GO_C) || updateI6[1];
assign ldI[7] = (MTIreg_E[7] && EX_en && GO_C)
|| (updateI7[0] && EX_en && GO_C) || updateI7[1];

`ifdef FD_DFT
REG14L I4_we(DSPCLK, RST, CLKI4enb, ldI[4], Iin[13:0], I4[13:0], SCAN_TEST);
REG14L I5_we(DSPCLK, RST, CLKI5enb, ldI[5], Iin[13:0], I5[13:0], SCAN_TEST);
REG14L I6_we(DSPCLK, RST, CLKI6enb, ldI[6], Iin[13:0], I6[13:0], SCAN_TEST);
REG14L I7_we(DSPCLK, RST, CLKI7enb, ldI[7], Iin[13:0], I7[13:0], SCAN_TEST);
`else
REG14L I4_we(DSPCLK, RST, CLKI4enb, ldI[4], Iin[13:0], I4[13:0]);
REG14L I5_we(DSPCLK, RST, CLKI5enb, ldI[5], Iin[13:0], I5[13:0]);
REG14L I6_we(DSPCLK, RST, CLKI6enb, ldI[6], Iin[13:0], I6[13:0]);
REG14L I7_we(DSPCLK, RST, CLKI7enb, ldI[7], Iin[13:0], I7[13:0]);
`endif

/*----------------------------------------------*/

/*----------------------------------------------*/
wire CLKL4enb, CLKL5enb, CLKL6enb, CLKL7enb;
wire [7:4] ldL;
wire [13:0] L4, L5, L6, L7;

assign CLKL4enb = !(MTLreg_E[4] && EX_en);
assign CLKL5enb = !(MTLreg_E[5] && EX_en);
assign CLKL6enb = !(MTLreg_E[6] && EX_en);
assign CLKL7enb = !(MTLreg_E[7] && EX_en);

assign ldL[4] = MTLreg_E[4] && EX_en && GO_C;
assign ldL[5] = MTLreg_E[5] && EX_en && GO_C;
assign ldL[6] = MTLreg_E[6] && EX_en && GO_C;
assign ldL[7] = MTLreg_E[7] && EX_en && GO_C;

`ifdef FD_DFT
REG14L L4_we(DSPCLK, RST, CLKL4enb, ldL[4], DMDin[13:0], L4[13:0], SCAN_TEST);
REG14L L5_we(DSPCLK, RST, CLKL5enb, ldL[5], DMDin[13:0], L5[13:0], SCAN_TEST);
REG14L L6_we(DSPCLK, RST, CLKL6enb, ldL[6], DMDin[13:0], L6[13:0], SCAN_TEST);
REG14L L7_we(DSPCLK, RST, CLKL7enb, ldL[7], DMDin[13:0], L7[13:0], SCAN_TEST);
`else
REG14L L4_we(DSPCLK, RST, CLKL4enb, ldL[4], DMDin[13:0], L4[13:0]);
REG14L L5_we(DSPCLK, RST, CLKL5enb, ldL[5], DMDin[13:0], L5[13:0]);
REG14L L6_we(DSPCLK, RST, CLKL6enb, ldL[6], DMDin[13:0], L6[13:0]);
REG14L L7_we(DSPCLK, RST, CLKL7enb, ldL[7], DMDin[13:0], L7[13:0]);
`endif

/*----------------------------------------------*/

/*----------------------------------------------*/
wire CLKM4enb, CLKM5enb, CLKM6enb, CLKM7enb;
wire [7:4] ldM;
wire [13:0] M4, M5, M6, M7;

assign CLKM4enb = !(MTMreg_E[4] && EX_en);
assign CLKM5enb = !(MTMreg_E[5] && EX_en);
assign CLKM6enb = !(MTMreg_E[6] && EX_en);
assign CLKM7enb = !(MTMreg_E[7] && EX_en);

assign ldM[4] = MTMreg_E[4] && EX_en && GO_C;
assign ldM[5] = MTMreg_E[5] && EX_en && GO_C;
assign ldM[6] = MTMreg_E[6] && EX_en && GO_C;
assign ldM[7] = MTMreg_E[7] && EX_en && GO_C;

`ifdef FD_DFT
REG14L M4_we(DSPCLK, RST, CLKM4enb, ldM[4], DMDin[13:0], M4[13:0], SCAN_TEST);
REG14L M5_we(DSPCLK, RST, CLKM5enb, ldM[5], DMDin[13:0], M5[13:0], SCAN_TEST);
REG14L M6_we(DSPCLK, RST, CLKM6enb, ldM[6], DMDin[13:0], M6[13:0], SCAN_TEST);
REG14L M7_we(DSPCLK, RST, CLKM7enb, ldM[7], DMDin[13:0], M7[13:0], SCAN_TEST);
`else
REG14L M4_we(DSPCLK, RST, CLKM4enb, ldM[4], DMDin[13:0], M4[13:0]);
REG14L M5_we(DSPCLK, RST, CLKM5enb, ldM[5], DMDin[13:0], M5[13:0]);
REG14L M6_we(DSPCLK, RST, CLKM6enb, ldM[6], DMDin[13:0], M6[13:0]);
REG14L M7_we(DSPCLK, RST, CLKM7enb, ldM[7], DMDin[13:0], M7[13:0]);
`endif

/*----------------------------------------------*/



/*----------------------------------------------*/
wire [13:0] Iout;
wire [13:0] I_R;
wire [13:0] I_D;
wire [1:0] ILSEL;



assign #`db ILSEL[1:0] = redoM_h ? IL_E[1:0]
: SPreqx ? STEALI_R[1:0] : IL_R[1:0];

assign #`db I_D[13:0] = {14{(ILSEL[1:0] == 2'b00) && !ldI[4]}} & I4[13:0] |
{14{(ILSEL[1:0] == 2'b01) && !ldI[5]}} & I5[13:0] |
{14{(ILSEL[1:0] == 2'b10) && !ldI[6]}} & I6[13:0] |
{14{(ILSEL[1:0] == 2'b11) && !ldI[7]}} & I7[13:0] |
{14{(ILSEL[1:0] == 2'b00) && ldI[4]}} & Iin[13:0] |
{14{(ILSEL[1:0] == 2'b01) && ldI[5]}} & Iin[13:0] |
{14{(ILSEL[1:0] == 2'b10) && ldI[6]}} & Iin[13:0] |
{14{(ILSEL[1:0] == 2'b11) && ldI[7]}} & Iin[13:0] ;
`ifdef FD_RTL_SIM
assign #`db I_R[13:0] = {14{(IL_R[1:0] == 2'b00) && !ldI[4]}} & I4[13:0] |
{14{(IL_R[1:0] == 2'b01) && !ldI[5]}} & I5[13:0] |
{14{(IL_R[1:0] == 2'b10) && !ldI[6]}} & I6[13:0] |
{14{(IL_R[1:0] == 2'b11) && !ldI[7]}} & I7[13:0] |
{14{(IL_R[1:0] == 2'b00) && ldI[4]}} & Iin[13:0] |
{14{(IL_R[1:0] == 2'b01) && ldI[5]}} & Iin[13:0] |
{14{(IL_R[1:0] == 2'b10) && ldI[6]}} & Iin[13:0] |
{14{(IL_R[1:0] == 2'b11) && ldI[7]}} & Iin[13:0] ;

assign #`db IS_R2[13:0] = {14{(STEALI_R[2:0] == 3'b100) && !ldI[4]}} & I4[13:0] |
{14{(STEALI_R[2:0] == 3'b101) && !ldI[5]}} & I5[13:0] |
{14{(STEALI_R[2:0] == 3'b110) && !ldI[6]}} & I6[13:0] |
{14{(STEALI_R[2:0] == 3'b111) && !ldI[7]}} & I7[13:0] |
{14{(STEALI_R[2:0] == 3'b100) && ldI[4]}} & Iin[13:0] |
{14{(STEALI_R[2:0] == 3'b101) && ldI[5]}} & Iin[13:0] |
{14{(STEALI_R[2:0] == 3'b110) && ldI[6]}} & Iin[13:0] |
{14{(STEALI_R[2:0] == 3'b111) && ldI[7]}} & Iin[13:0] ;

`else
wire ldI7_4, ldI_R7_4, ldIS_R7_4;
wire [13:0] I7_4, I_R7_4, IS_R7_4;

assign ldI_R7_4 = (IL_R[1:0] == 2'b00) && ldI[4] ||
(IL_R[1:0] == 2'b01) && ldI[5] ||
(IL_R[1:0] == 2'b10) && ldI[6] ||
(IL_R[1:0] == 2'b11) && ldI[7] ;

assign I_R7_4[13:0] = {14{(IL_R[1:0] == 2'b00) && !ldI[4]}} & I4[13:0] |
{14{(IL_R[1:0] == 2'b01) && !ldI[5]}} & I5[13:0] |
{14{(IL_R[1:0] == 2'b10) && !ldI[6]}} & I6[13:0] |
{14{(IL_R[1:0] == 2'b11) && !ldI[7]}} & I7[13:0] ;

assign ldIS_R7_4 = (STEALI_R[2:0] == 3'b100) && ldI[4] ||
(STEALI_R[2:0] == 3'b101) && ldI[5] ||
(STEALI_R[2:0] == 3'b110) && ldI[6] ||
(STEALI_R[2:0] == 3'b111) && ldI[7] ;

assign IS_R7_4[13:0] = {14{(STEALI_R[2:0] == 3'b100) && !ldI[4]}} & I4[13:0] |
{14{(STEALI_R[2:0] == 3'b101) && !ldI[5]}} & I5[13:0] |
{14{(STEALI_R[2:0] == 3'b110) && !ldI[6]}} & I6[13:0] |
{14{(STEALI_R[2:0] == 3'b111) && !ldI[7]}} & I7[13:0] ;

assign ldI7_4 = SPreqx ? ldIS_R7_4 : ldI_R7_4;

assign I7_4[13:0] = SPreqx ? IS_R7_4[13:0] : I_R7_4[13:0];

`endif

assign #`db Iout[13:0] = {14{MFIreg_E[4]}} & I4[13:0] |
{14{MFIreg_E[5]}} & I5[13:0] |
{14{MFIreg_E[6]}} & I6[13:0] |
{14{MFIreg_E[7]}} & I7[13:0] ;

/*----------------------------------------------*/



/*----------------------------------------------*/

wire [13:0] Lout;
wire [13:0] L_D;

assign #`db L_D[13:0] = {14{(ILSEL[1:0] == 2'b00) && !ldL[4]}} & L4[13:0] |
{14{(ILSEL[1:0] == 2'b01) && !ldL[5]}} & L5[13:0] |
{14{(ILSEL[1:0] == 2'b10) && !ldL[6]}} & L6[13:0] |
{14{(ILSEL[1:0] == 2'b11) && !ldL[7]}} & L7[13:0] |
{14{(ILSEL[1:0] == 2'b00) && ldL[4]}} & DMDin[13:0] |
{14{(ILSEL[1:0] == 2'b01) && ldL[5]}} & DMDin[13:0] |
{14{(ILSEL[1:0] == 2'b10) && ldL[6]}} & DMDin[13:0] |
{14{(ILSEL[1:0] == 2'b11) && ldL[7]}} & DMDin[13:0] ;

assign #`db Lout[13:0] = {14{MFLreg_E[4]}} & L4[13:0] |
{14{MFLreg_E[5]}} & L5[13:0] |
{14{MFLreg_E[6]}} & L6[13:0] |
{14{MFLreg_E[7]}} & L7[13:0];

/************************************************/

/************************************************/

wire [1:0] M_R;
wire [13:0] Mout;
wire [13:0] M_D;

wire [1:0] MSEL;
reg [1:0] M_E;

assign #`db M_R[1:0] = DOUBLE_R ? IR[5:4] : IR[1:0];

always @(posedge DSPCLK or posedge RST)
if (RST) M_E[1:0] <= #`db 2'b0;
else if (GO_E) M_E[1:0] <= #`db M_R[1:0];

assign #`db MSEL[1:0] = redoM_h ? M_E[1:0]
: SPreqx ? STEALM_R[1:0] : M_R[1:0];


assign #`db M_D[13:0] = {14{(MSEL[1:0] == 2'b00) && !ldM[4]}} & M4[13:0] |
{14{(MSEL[1:0] == 2'b01) && !ldM[5]}} & M5[13:0] |
{14{(MSEL[1:0] == 2'b10) && !ldM[6]}} & M6[13:0] |
{14{(MSEL[1:0] == 2'b11) && !ldM[7]}} & M7[13:0] |
{14{(MSEL[1:0] == 2'b00) && ldM[4]}} & DMDin[13:0] |
{14{(MSEL[1:0] == 2'b01) && ldM[5]}} & DMDin[13:0] |
{14{(MSEL[1:0] == 2'b10) && ldM[6]}} & DMDin[13:0] |
{14{(MSEL[1:0] == 2'b11) && ldM[7]}} & DMDin[13:0] ;

assign #`db Mout[13:0] = {14{MFMreg_E[4]}} & M4[13:0] |
{14{MFMreg_E[5]}} & M5[13:0] |
{14{MFMreg_E[6]}} & M6[13:0] |
{14{MFMreg_E[7]}} & M7[13:0];


/*----------------------------------------------*/


/*----------------------------------------------*/
wire [15:0] DAG2out;

assign DAG2out[15:14] = {2{Mout[13]}};

assign DAG2out[13:0] = Iout[13:0] |
Lout[13:0] |
Mout[13:0] ;

assign #2 DMD[15:0] = {16{MFDAG2_E}} & DAG2out[15:0];

/*----------------------------------------------*/
wire sel_ISR;
wire sel_DCTL;
wire sel_BDMA;
wire [13:0] PMA_R;
wire [13:0] PMAin;

`ifdef FD_RTL_SIM
assign PMA_R[13:0] = I_R[13:0];

`else
wire pmars1, pmars0;

assign pmars1 = Post2_E || Sackx;
assign pmars0 = ldI_R7_4;


GTECH_MUX4 pmar13(.D0(I_R7_4[13]), .D1(DMDin[13]), .D2(I_R7_4[13]), .D3(newI2[13]),
.B(pmars1), .A(pmars0), .Z(PMA_R[13]));

GTECH_MUX4 pmar12(.D0(I_R7_4[12]), .D1(DMDin[12]), .D2(I_R7_4[12]), .D3(newI2[12]),
.B(pmars1), .A(pmars0), .Z(PMA_R[12]));

GTECH_MUX4 pmar11(.D0(I_R7_4[11]), .D1(DMDin[11]), .D2(I_R7_4[11]), .D3(newI2[11]),
.B(pmars1), .A(pmars0), .Z(PMA_R[11]));

GTECH_MUX4 pmar10(.D0(I_R7_4[10]), .D1(DMDin[10]), .D2(I_R7_4[10]), .D3(newI2[10]),
.B(pmars1), .A(pmars0), .Z(PMA_R[10]));

GTECH_MUX4 pmar09(.D0(I_R7_4[9]), .D1(DMDin[9]), .D2(I_R7_4[9]), .D3(newI2[9]),
.B(pmars1), .A(pmars0), .Z(PMA_R[9]));

GTECH_MUX4 pmar08(.D0(I_R7_4[8]), .D1(DMDin[8]), .D2(I_R7_4[8]), .D3(newI2[8]),
.B(pmars1), .A(pmars0), .Z(PMA_R[8]));

GTECH_MUX4 pmar07(.D0(I_R7_4[7]), .D1(DMDin[7]), .D2(I_R7_4[7]), .D3(newI2[7]),
.B(pmars1), .A(pmars0), .Z(PMA_R[7]));

GTECH_MUX4 pmar06(.D0(I_R7_4[6]), .D1(DMDin[6]), .D2(I_R7_4[6]), .D3(newI2[6]),
.B(pmars1), .A(pmars0), .Z(PMA_R[6]));

GTECH_MUX4 pmar05(.D0(I_R7_4[5]), .D1(DMDin[5]), .D2(I_R7_4[5]), .D3(newI2[5]),
.B(pmars1), .A(pmars0), .Z(PMA_R[5]));

GTECH_MUX4 pmar04(.D0(I_R7_4[4]), .D1(DMDin[4]), .D2(I_R7_4[4]), .D3(newI2[4]),
.B(pmars1), .A(pmars0), .Z(PMA_R[4]));

GTECH_MUX4 pmar03(.D0(I_R7_4[3]), .D1(DMDin[3]), .D2(I_R7_4[3]), .D3(newI2[3]),
.B(pmars1), .A(pmars0), .Z(PMA_R[3]));

GTECH_MUX4 pmar02(.D0(I_R7_4[2]), .D1(DMDin[2]), .D2(I_R7_4[2]), .D3(newI2[2]),
.B(pmars1), .A(pmars0), .Z(PMA_R[2]));

GTECH_MUX4 pmar01(.D0(I_R7_4[1]), .D1(DMDin[1]), .D2(I_R7_4[1]), .D3(newI2[1]),
.B(pmars1), .A(pmars0), .Z(PMA_R[1]));

GTECH_MUX4 pmar00(.D0(I_R7_4[0]), .D1(DMDin[0]), .D2(I_R7_4[0]), .D3(newI2[0]),
.B(pmars1), .A(pmars0), .Z(PMA_R[0]));
`endif

wire CLKPMAenb;
wire [13:0] PMA;

assign CLKPMAenb = !DAG2P_R;

`ifdef FD_DFT
REG14L PMA_pi(DSPCLK, RST, CLKPMAenb, GO_E, PMA_R[13:0], PMA[13:0], SCAN_TEST);
`else
REG14L PMA_pi(DSPCLK, RST, CLKPMAenb, GO_E, PMA_R[13:0], PMA[13:0]);
`endif


assign sel_ISR = SPreqx && (GO_E || STEAL || STBY);
assign sel_DCTL = DSreqx && !DCTL[14] && (GO_E || STEAL || STBY || BOOT);
assign sel_BDMA = BSreqx && BPM_cyc && (GO_E || STEAL || STBY || BOOT || BM_cyc && ECYC);


`ifdef FD_RTL_SIM
assign PMAin[13:0] = sel_BDMA ? BIAD[13:0] :
{14{sel_ISR}} & IS_R2[13:0]
| {14{sel_DCTL}} & DCTL[13:0]
| {14{sel_STAC}} & STA_C[13:0]
| {14{sel_PMAR}} & PMA_R[13:0]
| {14{sel_PMA}} & PMA[13:0];

`else
wire [13:0] PMAOT;
wire [4:0] PMACOND;
wire [13:0] PMAin_mux1;
reg pmas2, pmas1, pmas0;

assign PMAOT[13:0] = sel_BDMA ? BIAD[13:0] :
{14{sel_DCTL}} & DCTL[13:0]
| {14{sel_STAC}} & STA_C[13:0]
| {14{sel_PMA}} & PMA[13:0];

assign PMACOND[4:0] = {(Post2_E || Sackx), ldI_R7_4, ldIS_R7_4, sel_PMAR, sel_ISR};

always @(PMACOND)
begin
casex (PMACOND)
5'b01x1x : {pmas2, pmas1, pmas0} = 3'b1xx;
5'b11x1x : {pmas2, pmas1, pmas0} = 3'b000;
5'bx0x1x : {pmas2, pmas1, pmas0} = 3'b001;
5'b1x1x1 : {pmas2, pmas1, pmas0} = 3'b000;
5'b0x1x1 : {pmas2, pmas1, pmas0} = 3'b1xx;
5'bxx0x1 : {pmas2, pmas1, pmas0} = 3'b010;
5'bxxx00 : {pmas2, pmas1, pmas0} = 3'b011;
endcase
end


GTECH_MUX4 pma1_13(.D0(newI2[13]), .D1(I_R7_4[13]), .D2(IS_R7_4[13]), .D3(PMAOT[13]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[13]));

GTECH_MUX4 pma1_12(.D0(newI2[12]), .D1(I_R7_4[12]), .D2(IS_R7_4[12]), .D3(PMAOT[12]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[12]));

GTECH_MUX4 pma1_11(.D0(newI2[11]), .D1(I_R7_4[11]), .D2(IS_R7_4[11]), .D3(PMAOT[11]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[11]));

GTECH_MUX4 pma1_10(.D0(newI2[10]), .D1(I_R7_4[10]), .D2(IS_R7_4[10]), .D3(PMAOT[10]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[10]));

GTECH_MUX4 pma1_09(.D0(newI2[9]), .D1(I_R7_4[9]), .D2(IS_R7_4[9]), .D3(PMAOT[9]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[9]));

GTECH_MUX4 pma1_08(.D0(newI2[8]), .D1(I_R7_4[8]), .D2(IS_R7_4[8]), .D3(PMAOT[8]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[8]));

GTECH_MUX4 pma1_07(.D0(newI2[7]), .D1(I_R7_4[7]), .D2(IS_R7_4[7]), .D3(PMAOT[7]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[7]));

GTECH_MUX4 pma1_06(.D0(newI2[6]), .D1(I_R7_4[6]), .D2(IS_R7_4[6]), .D3(PMAOT[6]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[6]));

GTECH_MUX4 pma1_05(.D0(newI2[5]), .D1(I_R7_4[5]), .D2(IS_R7_4[5]), .D3(PMAOT[5]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[5]));

GTECH_MUX4 pma1_04(.D0(newI2[4]), .D1(I_R7_4[4]), .D2(IS_R7_4[4]), .D3(PMAOT[4]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[4]));

GTECH_MUX4 pma1_03(.D0(newI2[3]), .D1(I_R7_4[3]), .D2(IS_R7_4[3]), .D3(PMAOT[3]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[3]));

GTECH_MUX4 pma1_02(.D0(newI2[2]), .D1(I_R7_4[2]), .D2(IS_R7_4[2]), .D3(PMAOT[2]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[2]));

GTECH_MUX4 pma1_01(.D0(newI2[1]), .D1(I_R7_4[1]), .D2(IS_R7_4[1]), .D3(PMAOT[1]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[1]));

GTECH_MUX4 pma1_00(.D0(newI2[0]), .D1(I_R7_4[0]), .D2(IS_R7_4[0]), .D3(PMAOT[0]),
.B(pmas1), .A(pmas0), .Z(PMAin_mux1[0]));


GTECH_MUX2 pma13(.A(PMAin_mux1[13]), .B(DMDin[13]),
.S(pmas2), .Z(PMAin[13]));

GTECH_MUX2 pma12(.A(PMAin_mux1[12]), .B(DMDin[12]),
.S(pmas2), .Z(PMAin[12]));

GTECH_MUX2 pma11(.A(PMAin_mux1[11]), .B(DMDin[11]),
.S(pmas2), .Z(PMAin[11]));

GTECH_MUX2 pma10(.A(PMAin_mux1[10]), .B(DMDin[10]),
.S(pmas2), .Z(PMAin[10]));

GTECH_MUX2 pma09(.A(PMAin_mux1[9]), .B(DMDin[9]),
.S(pmas2), .Z(PMAin[9]));

GTECH_MUX2 pma08(.A(PMAin_mux1[8]), .B(DMDin[8]),
.S(pmas2), .Z(PMAin[8]));

GTECH_MUX2 pma07(.A(PMAin_mux1[7]), .B(DMDin[7]),
.S(pmas2), .Z(PMAin[7]));

GTECH_MUX2 pma06(.A(PMAin_mux1[6]), .B(DMDin[6]),
.S(pmas2), .Z(PMAin[6]));

GTECH_MUX2 pma05(.A(PMAin_mux1[5]), .B(DMDin[5]),
.S(pmas2), .Z(PMAin[5]));

GTECH_MUX2 pma04(.A(PMAin_mux1[4]), .B(DMDin[4]),
.S(pmas2), .Z(PMAin[4]));

GTECH_MUX2 pma03(.A(PMAin_mux1[3]), .B(DMDin[3]),
.S(pmas2), .Z(PMAin[3]));

GTECH_MUX2 pma02(.A(PMAin_mux1[2]), .B(DMDin[2]),
.S(pmas2), .Z(PMAin[2]));

GTECH_MUX2 pma01(.A(PMAin_mux1[1]), .B(DMDin[1]),
.S(pmas2), .Z(PMAin[1]));

GTECH_MUX2 pma00(.A(PMAin_mux1[0]), .B(DMDin[0]),
.S(pmas2), .Z(PMAin[0]));

`endif
/*----------------------------------------------*/

/*----------------------------------------------*/
`ifdef FD_LR

wire [13:0] I, L, M;
wire CLKPIenb, CLKPLenb, CLKPMenb;
wire PIen, PLen, PMen;

assign CLKPIenb = !(DAG2_EN || redoM_h || SPreqx);
assign CLKPLenb = !(DAG2_EN || redoM_h || SPreqx);
assign CLKPMenb = !(DAG2_EN || redoM_h || SPreqx);

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
else if (GO_E & DAG2_EN | redoM_h | sel_ISR) I[13:0] <= #`db I_D[13:0];
always @(posedge DSPCLK or posedge RST)
if (RST) L[13:0] <= #`db 14'b0;
else if (GO_E & DAG2_EN | redoM_h | sel_ISR) L[13:0] <= #`db L_D[13:0];
always @(posedge DSPCLK or posedge RST)
if (RST) M[13:0] <= #`db 14'b0;
else if (GO_E & DAG2_EN | redoM_h | sel_ISR) M[13:0] <= #`db M_D[13:0];

`endif
endmodule
