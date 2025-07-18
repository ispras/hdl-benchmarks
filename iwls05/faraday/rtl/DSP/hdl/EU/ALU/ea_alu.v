






/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/

`define del 1
`include "x_def.v"


module EA_ALU(/*------------------ Inputs -------------------*/
 DSPCLK, GO_E, GO_C, EX_en, EX_enc,
R_in_E,
 condAM_E, DIVQ_E, DIVS_E, DOUBLE_E,
MTAR_E, MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, BYPASSR_D,
MFAR_E, MFAX0_E, MFAX1_E, MFAY0_E, MFAY1_E, MFASTAT_E,
MFALU_E, pMFALU_E, accPM_E, GO_MAC, ALUop_E, updAR_E,
updAF_E, ALUop_R, type9, T_RST, DIVQ_R, DIVS_R,
 Xop_D, YY_D, CC_D, BO_D,
Xop_E, Yop_E, CC_E, BO_E,
AMF_D,
 SHADOW, satAR,
 ASTAT,
`ifdef FD_DFT
 SCAN_TEST,
`endif



 R_alu_E, R_alu_D,
 updateALU, updateDIV, ABS, ASin, AQin, ACin,
AVin, ANin, AZin,


 DMDin, DMDalu, PMDin, PMDalu);


input DSPCLK, GO_E, GO_C, EX_en, EX_enc;
input [15:0] R_in_E;
input condAM_E, DIVQ_E, DIVS_E, DIVQ_R, DIVS_R, DOUBLE_E;
input MTAR_E, MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, BYPASSR_D;
input MFAR_E, MFAX0_E, MFAX1_E, MFAY0_E, MFAY1_E, MFASTAT_E;
input [2:0] Xop_D, Xop_E;
input [4:0] AMF_D;
input [1:0] YY_D, CC_D, BO_D, Yop_E, CC_E, BO_E;
input SHADOW, satAR;
input MFALU_E, pMFALU_E, accPM_E;
input GO_MAC;
input [7:0] ASTAT;
input ALUop_E, updAR_E, updAF_E;
input ALUop_R, type9, T_RST;
`ifdef FD_DFT
input SCAN_TEST;
`endif


output [15:0] R_alu_E, R_alu_D;
output updateALU, updateDIV;
output ABS, ASin, AQin, ACin, AVin, ANin, AZin;


input [15:0] DMDin;
output [15:0] DMDalu;
input [15:0] PMDin;
output [15:0] PMDalu;

/*------------------------------------------*/
wire X15, Y15, cout, ovf_, zeroAX, zeroAY;
wire selAX, updateDIV, selAY, selAF, invAX;
wire invAY, Rstore_AR_E, qin, selCT;
wire updateAX0s, updateAX1r, updateAX1s;
wire updateAY0r, updateAY0s, updateAY1r;
wire updateAY1s, updateAFr, updateAFs;
wire updateARr, updateARs, updateAX0r;
wire K, L, ADD, Cin;
wire [15:0] ALU, CONST_E, X, Y;

EA_DEC ea_dec(/* In */
DSPCLK, GO_E, GO_C, EX_en, EX_enc,
condAM_E, DIVQ_E, DIVS_E, SHADOW,
MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, X15, Y15,
cout, ovf_, satAR, ASTAT[5], ASTAT[3], Xop_D[2:0], Xop_E[2:0], Yop_E[1:0],
YY_D[1:0], CC_D[1:0], BO_D[1:0], CC_E[1:0], BO_E[1:0],
AMF_D[4:0], ALU[15:0], ALUop_E, updAR_E, updAF_E,
MTAR_E, ALUop_R, type9, T_RST, DIVQ_R, DIVS_R,
`ifdef FD_DFT
 SCAN_TEST,
`endif


Rstore_AR_D, Rstore_AR_E, updateALU, updateDIV, updateAFr,
updateAFs, updateARr, updateARs, updateAX0r, updateAX0s,
updateAX1r, updateAX1s, updateAY0r, updateAY0s, updateAY1r,
updateAY1s, ABS, zeroAX, invAX, zeroAY, invAY, Cin, selAX,
selAY, selAF, selCT, K, L, ADD, ASin, AQin, ACin, AVin, ANin,
AZin, qin, CONST_E[15:0]);


EA_REG ea_reg(/* IN */
DSPCLK, SHADOW, Xop_E[0], zeroAX, zeroAY,
selAX, DOUBLE_E, updateDIV, Yop_E[0], ACin, AVin, satAR,
selAY, updateAX0r, updateAX0s, updateAX1r,
updateAX1s, updateAY0r, updateAY0s, updateAY1r,
updateAY1s, updateAFr, updateAFs, MTAR_E,
updateARr, updateARs, MFAX0_E, MFAX1_E, R_in_E[15:0],
MFAY0_E, MFAY1_E, MFAR_E, MFASTAT_E, ALU[15:0], selAF,
invAX, invAY, Rstore_AR_D, Rstore_AR_E, qin,
ASTAT[7:0], selCT, CONST_E[15:0], BYPASSR_D, MFALU_E,
pMFALU_E, accPM_E, GO_MAC, EX_enc, GO_C,
`ifdef FD_DFT
 SCAN_TEST,
`endif


X[15:0], Y[15:0], X15, Y15, R_alu_E[15:0], R_alu_D[15:0],


DMDin[15:0], DMDalu[15:0], PMDin[15:0], PMDalu[15:0]);



EA_CORE ea_core(K, L, ADD, Cin, X, Y, cout, ovf_, ALU);


endmodule








