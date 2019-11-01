






/*----------------------------------------------*/


/*----------------------------------------------*/

/*----------------------------------------------*/

/*----------------------------------------------*/

`define del 1

`include "../../../include/x_def.v"

module EA_REG (/* IN */
DSPCLK, SHADOW, Xop0_E, zeroAX, zeroAY,
selAX, DOUBLE_E, updateDIV, Yop0_E, ACin, AVin, satAR,
selAY, updateAX0r, updateAX0s, updateAX1r,
updateAX1s, updateAY0r, updateAY0s, updateAY1r,
updateAY1s, updateAFr, updateAFs, MTAR_E,
updateARr, updateARs, MFAX0_E, MFAX1_E, R_in_E,
MFAY0_E, MFAY1_E, MFAR_E, MFASTAT_E, ALU, selAF,
invAX, invAY, Rstore_AR_D, Rstore_AR_E, qin,
ASTAT, selCT, CONST_E, BYPASSR_D, MFALU_E,
pMFALU_E, accPM_E, GO_MAC, EX_enc, GO_C,
`ifdef FD_DFT
 SCAN_TEST,
`endif


X, Y, X15, Y15, R_alu_E, R_alu_D,


DMDin, DMDalu, PMDin, PMDalu);

/********************************/

/********************************/

input DSPCLK, SHADOW, Xop0_E, zeroAX, zeroAY, selAX;
input DOUBLE_E, updateDIV, ACin, AVin, satAR, selAY, Yop0_E;
input updateAX0r, updateAX0s, updateAX1r, updateAX1s;
input updateAY0r, updateAY0s, updateAY1r, updateAY1s;
input updateAFr, updateAFs, MTAR_E, updateARr;
input updateARs, MFAX0_E, MFAX1_E;
input MFASTAT_E, MFAY0_E, MFAY1_E;
input MFAR_E, invAX, invAY, selAF;
input [15:0] ALU;
input [7:0] ASTAT;
input Rstore_AR_D;
input Rstore_AR_E;
input qin;
input [15:0] R_in_E;
input selCT, BYPASSR_D;
input [15:0] CONST_E;
input MFALU_E, pMFALU_E, accPM_E;
input GO_MAC, EX_enc, GO_C;
`ifdef FD_DFT
input SCAN_TEST;
`endif

/********************************/

/********************************/

output [15:0] X, Y, R_alu_E, R_alu_D;
output X15, Y15;

/********************************/

/********************************/

input [15:0] DMDin;
output [15:0] DMDalu;
input [15:0] PMDin;
output [15:0] PMDalu;

wire [15:0] DMDin1;

DMDbuf DMDIN_BUF(DMDin[15:0], DMDin1[15:0]);



wire [15:0] Xin;

assign Xin[15:0] = accPM_E ? PMDin[15:0] : DMDin1[15:0];

wire [15:0] AX0r, AX0s, AX1r, AX1s;
wire CLKAX0renb, CLKAX1renb, CLKAX0senb, CLKAX1senb;

assign CLKAX0renb = !updateAX0r;
assign CLKAX0senb = !updateAX0s;
assign CLKAX1renb = !updateAX1r;
assign CLKAX1senb = !updateAX1s;

`ifdef FD_DFT
REG16L ax0rwe(DSPCLK, CLKAX0renb, GO_C, Xin[15:0], AX0r[15:0], SCAN_TEST);
REG16L ax0swe(DSPCLK, CLKAX0senb, GO_C, Xin[15:0], AX0s[15:0], SCAN_TEST);
REG16L ax1rwe(DSPCLK, CLKAX1renb, GO_C, Xin[15:0], AX1r[15:0], SCAN_TEST);
REG16L ax1swe(DSPCLK, CLKAX1senb, GO_C, Xin[15:0], AX1s[15:0], SCAN_TEST);
`else
REG16L ax0rwe(DSPCLK, CLKAX0renb, GO_C, Xin[15:0], AX0r[15:0]);
REG16L ax0swe(DSPCLK, CLKAX0senb, GO_C, Xin[15:0], AX0s[15:0]);
REG16L ax1rwe(DSPCLK, CLKAX1renb, GO_C, Xin[15:0], AX1r[15:0]);
REG16L ax1swe(DSPCLK, CLKAX1senb, GO_C, Xin[15:0], AX1s[15:0]);
`endif


wire [15:0] AX0, AX1, AX;
assign AX0[15:0] = SHADOW ? AX0s[15:0] : AX0r[15:0];
assign AX1[15:0] = SHADOW ? AX1s[15:0] : AX1r[15:0];
assign AX[15:0] = Xop0_E ? AX1[15:0] : AX0[15:0];



wire [15:0] X, A, A_t;
assign A[15:0] = selAX ? AX[15:0] : R_in_E[15:0];

assign A_t[15:0] = zeroAX ? 16'b0 : A[15:0];
assign X15 = A[15];

assign X[15:0] = invAX ? ~A_t[15:0] : A_t[15:0];



wire [15:0] AY0, AY0in, AYin;

assign AYin[15:0] = (DOUBLE_E | accPM_E) ? PMDin[15:0] : DMDin1[15:0];

assign AY0in[15:0] = updateDIV ? {AY0[14:0], qin} : AYin[15:0];

/*-----------------------------------------------*/

wire [15:0] AY0r, AY1r, AY0s, AY1s;
wire CLKAY0renb, CLKAY1renb, CLKAY0senb, CLKAY1senb;

assign CLKAY0renb = !updateAY0r;
assign CLKAY1renb = !updateAY1r;
assign CLKAY0senb = !updateAY0s;
assign CLKAY1senb = !updateAY1s;

`ifdef FD_DFT
REG16L ay0rwe(DSPCLK, CLKAY0renb, GO_C, AY0in[15:0], AY0r[15:0], SCAN_TEST);
REG16L ay0swe(DSPCLK, CLKAY0senb, GO_C, AY0in[15:0], AY0s[15:0], SCAN_TEST);
REG16L ay1rwe(DSPCLK, CLKAY1renb, GO_C, AYin[15:0], AY1r[15:0], SCAN_TEST);
REG16L ay1swe(DSPCLK, CLKAY1senb, GO_C, AYin[15:0], AY1s[15:0], SCAN_TEST);
`else
REG16L ay0rwe(DSPCLK, CLKAY0renb, GO_C, AY0in[15:0], AY0r[15:0]);
REG16L ay0swe(DSPCLK, CLKAY0senb, GO_C, AY0in[15:0], AY0s[15:0]);
REG16L ay1rwe(DSPCLK, CLKAY1renb, GO_C, AYin[15:0], AY1r[15:0]);
REG16L ay1swe(DSPCLK, CLKAY1senb, GO_C, AYin[15:0], AY1s[15:0]);
`endif

/*------------------------------------------------*/
wire [15:0] AY, AY1;
assign AY0[15:0] = SHADOW ? AY0s[15:0] : AY0r[15:0];
assign AY1[15:0] = SHADOW ? AY1s[15:0] : AY1r[15:0];
assign AY[15:0] = Yop0_E ? AY1[15:0] : AY0[15:0];



wire [15:0] AFin;

assign AFin[15:0] = updateDIV ? ({ALU[14:0], AY0[15]}) : ALU[15:0];

wire [15:0] AFr, AFs;
wire CLKAFrenb, CLKAFsenb;
wire AFrwe, AFswe;

assign CLKAFrenb = !updateAFr;
assign CLKAFsenb = !updateAFs;
assign AFrwe = GO_C && EX_enc;
assign AFswe = GO_C && EX_enc;
`ifdef FD_DFT
REG16L afrwe(DSPCLK, CLKAFrenb, AFrwe, AFin[15:0], AFr[15:0], SCAN_TEST);
REG16L afswe(DSPCLK, CLKAFsenb, AFswe, AFin[15:0], AFs[15:0], SCAN_TEST);
`else
REG16L afrwe(DSPCLK, CLKAFrenb, AFrwe, AFin[15:0], AFr[15:0]);
REG16L afswe(DSPCLK, CLKAFsenb, AFswe, AFin[15:0], AFs[15:0]);
`endif

/*----------------------------------------------*/
wire [15:0] AF;

assign AF[15:0] = SHADOW ? AFs[15:0] : AFr[15:0];



wire [15:0] Y, B, B_t;
assign #`db B[15:0] = selCT ? CONST_E[15:0] :
selAY ? AY[15:0] :
selAF ? AF[15:0] : 0 ;

assign #`db B_t[15:0] = zeroAY ? 16'b0 : B[15:0];

assign Y15 = B[15];

assign #`db Y[15:0] = invAY ? ~B_t[15:0] : B_t[15:0];



wire [15:0] ARin, SATin;

assign SATin[15:0] = ACin ? 16'h8000 : 16'h7fff;
assign ARin[15:0] = MTAR_E ? Xin[15:0] :
(AVin && satAR) ? SATin[15:0] : ALU[15:0];

wire [15:0] ARr, ARs;
wire CLKARrenb, CLKARsenb;
wire ARrwe, ARswe;

assign CLKARrenb = !updateARr;
assign CLKARsenb = !updateARs;
assign ARrwe = GO_C && EX_enc;
assign ARswe = GO_C && EX_enc;

`ifdef FD_DFT
REG16L arrwe(DSPCLK, CLKARrenb, ARrwe, ARin[15:0], ARr[15:0], SCAN_TEST);
REG16L arswe(DSPCLK, CLKARsenb, ARswe, ARin[15:0], ARs[15:0], SCAN_TEST);
`else
REG16L arrwe(DSPCLK, CLKARrenb, ARrwe, ARin[15:0], ARr[15:0]);
REG16L arswe(DSPCLK, CLKARsenb, ARswe, ARin[15:0], ARs[15:0]);
`endif

/*------------------------------------------------*/

wire [15:0] AR;

assign AR[15:0] = SHADOW ? ARs[15:0] : ARr[15:0];
/**********************************/

/**********************************/

wire [15:0] ALUout;

assign #`da ALUout[15:0] = ({16{MFAX0_E}} & AX0[15:0]) |
({16{MFAX1_E}} & AX1[15:0]) |
({16{MFAY0_E}} & AY0[15:0]) |
({16{MFAY1_E}} & AY1[15:0]) |
({16{MFAR_E}} & AR[15:0]) |
({16{MFASTAT_E}} & {8'b0, ASTAT[7:0]});

assign DMDalu[15:0] = {16{MFALU_E}} & ALUout[15:0];
assign PMDalu[15:0] = {16{pMFALU_E}} & ALUout[15:0];

/**********************************/

/**********************************/

wire [15:0] R_alu_in_D;

assign #`da R_alu_in_D[15:0] = {16{Rstore_AR_D & BYPASSR_D & ~GO_MAC & ~MTAR_E & AVin & satAR}} & SATin[15:0]
| {16{(Rstore_AR_D & ~BYPASSR_D & ~GO_MAC) | (Rstore_AR_E & GO_MAC)}} & AR[15:0];

assign #`da R_alu_D[15:0] = {16{Rstore_AR_D & BYPASSR_D & ~GO_MAC & MTAR_E & accPM_E}} & PMDin[15:0]
| {16{Rstore_AR_D & BYPASSR_D & ~GO_MAC & MTAR_E & ~accPM_E}} & DMDin[15:0]
| {16{Rstore_AR_D & BYPASSR_D & ~GO_MAC & ~MTAR_E & ~(AVin & satAR)}} & ALU[15:0]
| R_alu_in_D[15:0];








assign R_alu_E[15:0] = {16{Rstore_AR_E}} & AR[15:0];

endmodule

