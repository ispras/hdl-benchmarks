






/*----------------------------------------------*/ 
 
 
/*----------------------------------------------*/ 

/*----------------------------------------------*/ 
 
 
/*----------------------------------------------*/ 


module EM_MAC (/*---------------------- Input ----------------------*/ 
 DSPCLK, GO_E, GO_C, EX_enc, 
R_in_D, 
 satMR_Eg, MACop_E, updMF_E, updMR_E, DOUBLE_E, 
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, 
MTMR0_Eg, MTMR1_Eg, MTMR2_Eg, MFMX0_E, 
MFMX1_E, MFMY0_E, MFMY1_E, MFMR0_E, 
MFMR1_E, MFMR2_E, BYPASSMX_D, BYPASSMY_D, BYPASSR_D, 
pMFMAC_E, MFMAC_E, accPM_E, Sq_R, GO_MAC, MACop_R, 
 Xop_D, Xop_E, Yop_D, Yop_E, 
AMF_D, 
 SHADOW, FracMode_E, 
 
BIASRND, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 


 
 R_mac_E, R_mac_D, 
 updateMV, MVin, 

 
 DMDin, DMDmac, PMDin, PMDmac); 


 
input DSPCLK, GO_E, GO_C, EX_enc; 
input [15:0] R_in_D; 
input DOUBLE_E; 
input MTMX0_Eg, MTMX1_Eg, MTMY0_Eg; 
input MTMY1_Eg, MTMR0_Eg, MTMR1_Eg, MTMR2_Eg; 
input MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E; 
input MFMR0_E, MFMR1_E, MFMR2_E, BYPASSMX_D; 
input BYPASSMY_D, BYPASSR_D; 
input [2:0] Xop_D, Xop_E; 
input [1:0] Yop_D, Yop_E; 
input [3:0] AMF_D; 
input SHADOW, FracMode_E; 
input pMFMAC_E, MFMAC_E; 
input accPM_E; 
input Sq_R, GO_MAC; 
input satMR_Eg, MACop_E; 
input updMF_E, updMR_E; 
input MACop_R; 
input BIASRND; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 


 
output updateMV; 
output MVin; 
output [15:0] R_mac_E, R_mac_D; 

 
input [15:0] DMDin; 
output [15:0] DMDmac; 
input [15:0] PMDin; 
output [15:0] PMDmac; 

/*-----------------------------------------------*/ 
wire updateMX0s, updateMX0r, updateMX1s, updateMX1r; 
wire updateMY0s, updateMY0r, updateMY1s, updateMY1r; 
wire updateMRs, updateMRr, selMY_D, selMX_D, zeroMY_D; 
wire msub1_E, mzero_E, rnd_E; 
wire unsignX_E, unsignY_E, updateMFs, updateMFr; 
wire Rstore_MR0_D, Rstore_MR1_D, Rstore_MR2_D; 
wire Rstore_MR0_E, Rstore_MR1_E, Rstore_MR2_E; 
wire MXBy_R, MYBy_R; 
wire msub2_E, msub3_E, msub4_E, msub5_E; 
wire msub6_E, msub7_E, msub8_E; 

EM_DEC em_dec(/* IN */ 
Xop_D[2:0], Xop_E[2:0], Yop_D[1:0], Yop_E[1:0], AMF_D[3:0], 
EX_enc, GO_C, SHADOW, 
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, BYPASSMX_D, 
BYPASSMY_D, GO_MAC, DSPCLK, GO_E, 
MACop_E, updMF_E, updMR_E, MACop_R, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
updateMX0s, updateMX0r, updateMX1s, updateMX1r, updateMRs, 
updateMY0s, updateMY0r, updateMY1s, updateMY1r, updateMRr, 
selMY_D, selMX_D, zeroMY_D, msub1_E, mzero_E, 
rnd_E, unsignX_E, unsignY_E, updateMFs, updateMFr, 
Rstore_MR0_D, Rstore_MR1_D, Rstore_MR2_D, Rstore_MR0_E, 
Rstore_MR1_E, Rstore_MR2_E, updateMV, MXBy_R, 
MYBy_R, msub2_E, msub3_E, 
msub4_E, msub5_E, msub6_E, msub7_E, msub8_E); 

/*------------------------------------------------*/ 
wire [15:0] MXOP_E, MYOP_E; 
wire [39:0] MACin; 
wire [15:0] MR0, MR1; 
wire [7:0] MR2; 
wire [8:0] MRovf; 

EM_REG em_reg(/* IN */ 
DSPCLK, SHADOW, GO_C, GO_E, DOUBLE_E, 
updateMX0r, updateMX0s, updateMX1r, updateMX1s, 
updateMY0s, updateMY0r, updateMY1s, updateMY1r, 
MACin[39:0], updateMFs, updateMFr, satMR_Eg, 
MTMR0_Eg, MTMR1_Eg, MTMR2_Eg, updateMRs, updateMRr, 
MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E, MFMR0_E, 
MFMR1_E, MFMR2_E, Xop_E[0], Xop_D[0], Yop_E[0], Yop_D[0], BYPASSR_D, 
selMX_D, R_in_D[15:0], zeroMY_D, selMY_D, 
Rstore_MR0_D, Rstore_MR1_D, Rstore_MR2_D, Rstore_MR0_E, 
Rstore_MR1_E, Rstore_MR2_E, MFMAC_E, pMFMAC_E, accPM_E, Sq_R, GO_MAC, 
MXBy_R, MYBy_R, MACop_R, MACop_E, EX_enc, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
MXOP_E[15:0], MYOP_E[15:0], MR0[15:0], MR1[15:0], MR2[7:0], 
R_mac_D[15:0], R_mac_E[15:0], MRovf[8:0], 

 
DMDin[15:0], DMDmac[15:0], PMDin[15:0], PMDmac[15:0]); 

/*-------------------------------------------------*/ 

EM_CORE em_core(/* IN */ 
unsignX_E, unsignY_E, FracMode_E, 
mzero_E, msub1_E, rnd_E, 
MXOP_E[15:0], MYOP_E[15:0], MR2[7:0], 
MR1[15:0], MR0[15:0], msub2_E, msub3_E, 
msub4_E, msub5_E, msub6_E, msub7_E, msub8_E, 
MACop_E, BIASRND, 

 
MACin[39:0]); 

/*-------------------------------------------------*/ 

EM_MVOVF em_mvovf(/* IN */ 
MRovf[8:0], 
 
MVin); 

endmodule 




