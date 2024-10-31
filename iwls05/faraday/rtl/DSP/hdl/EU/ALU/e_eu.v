






/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 


module EU(/*--------------- Inputs ---------------*/ 
 DSPCLK, T_RST, GO_E, GO_C, EX_en, EX_enc, 
 condAM_E, DIVQ_E, DIVS_E, DOUBLE_E, 
MTAR_E, MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, BYPASSR_D, 
MFAR_E, MFAX0_E, MFAX1_E, MFAY0_E, MFAY1_E, MFASTAT_E, 
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, MTMR0_Eg, 
MTMR1_Eg, MTMR2_Eg, MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E, 
MFMR0_E, MFMR1_E, MFMR2_E, BYPASSMY_D, MTASTAT_E, 
MTSI_E, MTSB_E, MTSE_E, 
MTSR0_E, MTSR1_E, MFSI_E, MFSB_E, MFSE_E, MFSR1_E, 
MFSR0_E, SIMM_E, BYPASSMX_D, MFALU_E, MFMAC_E, MFSHT_E, 
pMFALU_E, pMFMAC_E, pMFSHT_E, accPM_E, Sq_R, GO_MAC, 
updSR0_Eg, updSR1_Eg, SHTop_E, satMR_Eg, MACop_E, updMF_E, 
updMR_E, ALUop_E, updAR_E, updAF_E, ALUop_R, type9, 
updSR_E, MACop_R, DIVQ_R, DIVS_R, 
 IR, IRE, 





 
TERM_R, 
 SHADOW, satAR, FracMode, CE, MSTAT2, 
pop_ASTAT_E, pop_ASTAT_DATA_E, 
 RSTtext_h, 
 BIASRND, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 


 
 ASTAT, CONDok_C, TERMok_C, 

 
 DMDin, DMD, PMDin, PMD); 

 
input [17:0] IR; 
input [14:0] IRE; 

input DSPCLK; 
input T_RST; 
input GO_E; 
input GO_C; 
input EX_en; 
input EX_enc; 
input MTAX0_E; 


input MTAX1_E; 
input MTAY0_E; 
input MTAY1_E; 
input MTMX0_Eg; 
input MTMX1_Eg; 
input MTMY0_Eg; 
input MTMY1_Eg; 
input MTAR_E; 


input MTMR0_Eg; 
input MTMR1_Eg; 
input MTMR2_Eg; 
input MTSI_E; 
input MTSE_E; 
input MTSR0_E; 
input MTSR1_E; 
input MTSB_E; 


input MTASTAT_E; 
input MFAX0_E; 

input MFAX1_E; 
input MFAY0_E; 
input MFAY1_E; 
input MFAR_E; 
input MFMX0_E; 
input MFMX1_E; 
input MFMY0_E; 
input MFMY1_E; 
input MFMR0_E; 
input MFMR1_E; 
input MFMR2_E; 
input MFSI_E; 
input MFSE_E; 
input MFSR1_E; 
input MFSR0_E; 
input MFSB_E; 

input MFASTAT_E; 
input condAM_E; 

input DIVQ_R; 
input DIVS_R; 
input DIVQ_E; 
input DIVS_E; 
input DOUBLE_E; 
input SIMM_E; 
input BYPASSR_D; 

input BYPASSMX_D; 

input BYPASSMY_D; 

input CE; 
input SHADOW; 
input MSTAT2; 
input satAR; 
input FracMode; 
input pop_ASTAT_E; 
input RSTtext_h; 
input updSR0_Eg; 
input updSR1_Eg; 
input SHTop_E; 
input satMR_Eg; 
input MACop_E; 
input updMF_E; 
input updMR_E; 
input ALUop_E; 
input updAR_E; 
input updAF_E; 
input ALUop_R; 
input MACop_R; 
input type9; 
input updSR_E; 
input MFALU_E; 
input MFSHT_E; 
input MFMAC_E; 
input pMFALU_E; 
input pMFMAC_E; 
input pMFSHT_E; 
input accPM_E; 
input Sq_R; 
input GO_MAC; 
input [7:0] pop_ASTAT_DATA_E; 

input [3:0] TERM_R; 
input BIASRND; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 


 
output [7:0] ASTAT; 
output CONDok_C; 
output TERMok_C; 

 
input [15:0] DMDin; 
output [15:0] DMD; 
input [15:0] PMDin; 
output [15:0] PMD; 

wire [2:0] Xop_D = IR[10:8]; 
wire [1:0] Yop_D = IR[12:11]; 
wire [1:0] CC_D = IR[7:6]; 
wire [1:0] BO_D = IR[5:4]; 
wire [2:0] Xop_E = IRE[10:8]; 
wire [1:0] Yop_E = IRE[12:11]; 
wire [4:0] AMF_D = IR[17:13]; 
wire [3:2] SF_E = IRE[14:13]; 

wire [3:0] COND_R = IR[3:0]; 

/*------------------------------------------*/ 
wire [15:0] R_alu_E, R_alu_D, R_sht_E, R_sht_D; 
wire [15:0] R_mac_E, R_mac_D, R_in_E, R_in_D; 
wire [15:0] DMDalu, DMDsht, DMDmac; 
wire [15:0] PMDalu, PMDsht, PMDmac; 
wire updateDIV, updateALU, updateSS, updateMV; 
wire ABS, ASin, AQin, ACin, MVin; 
wire AVin, ANin, AZin, SSin; 



assign R_in_D[15:0] = R_alu_D | R_sht_D | R_mac_D; 
assign R_in_E[15:0] = R_alu_E | R_sht_E | R_mac_E; 
assign DMD[15:0] = DMDalu[15:0] | DMDsht[15:0] | DMDmac[15:0]; 
assign PMD[15:0] = PMDalu[15:0] | PMDsht[15:0] | PMDmac[15:0]; 

EA_ALU ea_alu(/*------------------ Inputs -------------------*/ 
 DSPCLK, GO_E, GO_C, EX_en, EX_enc, 
R_in_E[15:0], 
 condAM_E, DIVQ_E, DIVS_E, DOUBLE_E, 
MTAR_E, MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, BYPASSR_D, 
MFAR_E, MFAX0_E, MFAX1_E, MFAY0_E, MFAY1_E, MFASTAT_E, 
MFALU_E, pMFALU_E, accPM_E, GO_MAC, ALUop_E, updAR_E, 
updAF_E, ALUop_R, type9, T_RST, DIVQ_R, DIVS_R, 
 Xop_D[2:0], Yop_D[1:0], CC_D[1:0], BO_D[1:0], 
Xop_E[2:0], Yop_E[1:0], IRE[7:6], IRE[5:4], 
AMF_D[4:0], 
 SHADOW, satAR, 
 ASTAT[7:0], 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
 R_alu_E[15:0], R_alu_D[15:0], 
 updateALU, updateDIV, ABS, ASin, AQin, ACin, 
AVin, ANin, AZin, 

 
 DMDin[15:0], DMDalu[15:0], PMDin[15:0], PMDalu[15:0]); 



ES_SHT es_sht(/*---------------- Inputs ---------------*/ 
 DSPCLK, GO_C, EX_en, EX_enc, R_in_E[15:0], 
 {SF_E[3:2], Yop_E[1:0]}, IRE[7:0], Xop_D[2:0], Xop_E[2:0], 
 SHADOW, 
 MTSI_E, MTSB_E, MTSE_E, 
MTSR0_E, MTSR1_E, MFSI_E, MFSB_E, MFSE_E, 
MFSR1_E, MFSR0_E, SIMM_E, BYPASSR_D, MFSHT_E, 
pMFSHT_E, accPM_E, GO_MAC, updSR0_Eg, updSR1_Eg, 
SHTop_E, updSR_E, 
 ASTAT[3], ASTAT[2], ASTAT[7], 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
 R_sht_E[15:0], R_sht_D[15:0], 
 SSin, updateSS, 

 
 DMDin[15:0], DMDsht[15:0], PMDin[15:0], PMDsht[15:0]); 


EM_MAC em_mac(/*---------------------- Input ----------------------*/ 
 DSPCLK, GO_E, GO_C, EX_enc, 
R_in_D[15:0], 
 satMR_Eg, MACop_E, updMF_E, updMR_E, DOUBLE_E, 
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, 
MTMR0_Eg, MTMR1_Eg, MTMR2_Eg, MFMX0_E, 
MFMX1_E, MFMY0_E, MFMY1_E, MFMR0_E, 
MFMR1_E, MFMR2_E, BYPASSMX_D, BYPASSMY_D, BYPASSR_D, 
pMFMAC_E, MFMAC_E, accPM_E, Sq_R, GO_MAC, MACop_R, 
 Xop_D[2:0], Xop_E[2:0], Yop_D[1:0], Yop_E[1:0], 
AMF_D[3:0], 
 SHADOW, ~FracMode, 
 
BIASRND, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 


 
 R_mac_E[15:0], R_mac_D[15:0], 
 updateMV, MVin, 

 
 DMDin[15:0], DMDmac[15:0], PMDin[15:0], PMDmac[15:0]); 

EC_CUN ec_cun(/*--------------------- Input ---------------------*/ 
 DSPCLK, GO_E, GO_C, EX_en, T_RST, DMDin[7:0], 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 
 updateALU, updateDIV, ABS, AZin, 
ANin, AVin, ACin, ASin, AQin, 
MTASTAT_E, 
 updateSS, SSin, 
 updateMV, MVin, 
 COND_R[3:0], TERM_R[3:0], 
 pop_ASTAT_E, pop_ASTAT_DATA_E[7:0], CE, MSTAT2, 
 RSTtext_h, 

 
 CONDok_C, TERMok_C, 
 ASTAT[7:0]); 


endmodule 

