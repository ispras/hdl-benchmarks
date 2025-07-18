






/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

`define del 1 


module ES_SHT(/*---------------- Inputs ---------------*/ 
 DSPCLK, GO_C, EX_en, EX_enc, R_in_E, 
 SF_E, IRE, Xop_D, Xop_E, 
 SHADOW, 
 MTSI_E, MTSB_E, MTSE_E, 
MTSR0_E, MTSR1_E, MFSI_E, MFSB_E, MFSE_E, 
MFSR1_E, MFSR0_E, SIMM_E, BYPASSR_D, MFSHT_E, 
pMFSHT_E, accPM_E, GO_MAC, updSR0_Eg, updSR1_Eg, 
SHTop_E, updSR_E, 
 AC, AV, SS, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
 R_sht_E, R_sht_D, 
 SSin, updateSS, 

 
 DMDin, DMDsht, PMDin, PMDsht); 

 
input DSPCLK, GO_C, EX_en, EX_enc; 
input SHADOW; 
input MTSI_E, MTSB_E, MTSE_E, MTSR0_E; 
input MTSR1_E, MFSI_E, MFSB_E, MFSE_E, BYPASSR_D; 
input MFSR1_E, MFSR0_E, SIMM_E, AC, AV, SS; 
input [15:0] R_in_E; 
input [3:0] SF_E; 
input [7:0] IRE; 
input [2:0] Xop_D, Xop_E; 
input MFSHT_E, pMFSHT_E, accPM_E, GO_MAC; 
input updSR0_Eg, updSR1_Eg, SHTop_E; 
input updSR_E; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 

 
output SSin, updateSS; 
output [15:0] R_sht_E, R_sht_D; 

 
input [15:0] DMDin; 
output [15:0] DMDsht; 
input [15:0] PMDin; 
output [15:0] PMDsht; 

/*-----------------------------------------------*/ 
wire EXPGTSB, SEf1, updateSIr, updateSIs; 
wire updateSBr, updateSBs, updateSEr, updateSEs; 
wire updateSR0s, updateSR0r, updateSR1r, updateSR1s; 
wire HIX, LO, XI, NORM; 
wire [4:0] SB; 
wire [5:0] EXP; 
wire [7:0] SE; 
wire [15:0] SO_H, SO_L, SIN; 
wire [15:0] SR0, SR1; 

ES_DEC es_dec(/* IN */ 
GO_C, EX_en, EX_enc, EXPGTSB, SEf1, 
SHADOW, SF_E[3:0], MTSI_E, MTSB_E, MTSE_E, updSR0_Eg, 
updSR1_Eg, SIN[15], AC, AV, SHTop_E, MTSR0_E, MTSR1_E, updSR_E, 
 
updateSIr, updateSIs, updateSBr, updateSBs, updateSEr, 
updateSEs, updateSR0r, updateSR0s, updateSR1r, updateSR1s, 
updateSS, DBE, HIX, LO, XI, NORM); 

ES_REG es_reg(/* IN */ 
DSPCLK, SHADOW, EXP[5:0], Xop_D[2:0], Xop_E[2:0], 
SO_L[15:0], SO_H[15:0], MTSB_E, MTSE_E, 
MTSR1_E, MTSR0_E, R_in_E[15:0], updateSIr, updateSIs, 
updateSBr, updateSBs, updateSEr, updateSEs, 
updateSR1r, updateSR1s, updateSR0r, updateSR0s, 
MFSI_E, MFSB_E, MFSE_E, MFSR1_E, MFSR0_E, BYPASSR_D, MFSHT_E, 
pMFSHT_E, accPM_E, GO_MAC, EX_enc, GO_C, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
SEf1, SIN[15:0], SE[7:0], SB[4:0], SR0[15:0], SR1[15:0], 
R_sht_E[15:0], R_sht_D[15:0], 

 
DMDin[15:0], DMDsht[15:0], PMDin[15:0], PMDsht[15:0]); 

ES_EXP es_exp(/* IN */ 
SIN[15:0], SB[4:0], DBE, HIX, LO, 
SS, AV, SHTop_E, SF_E[3:2], 
 
EXP[5:0], SSin, EXPGTSB); 

ES_ARRAY er_array(/* IN */ 
SIN[15:0], SR1[15:0], SR0[15:0], SF_E[3:0], IRE[7:0], 
SE[7:0], XI, NORM, SIMM_E, SHTop_E, 
 
SO_H[15:0], SO_L[15:0]); 


endmodule 
