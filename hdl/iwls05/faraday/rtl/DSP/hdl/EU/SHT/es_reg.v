






/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

`define del 1 

module ES_REG(/* IN */ 
DSPCLK, SHADOW, EXP, Xop_D, Xop_E, 
SO_L, SO_H, MTSB_E, MTSE_E, 
MTSR1_E, MTSR0_E, R_in_E, updateSIr, updateSIs, 
updateSBr, updateSBs, updateSEr, updateSEs, 
updateSR1r, updateSR1s, updateSR0r, updateSR0s, 
MFSI_E, MFSB_E, MFSE_E, MFSR1_E, MFSR0_E, BYPASSR_D, MFSHT_E, 
pMFSHT_E, accPM_E, GO_MAC, EX_enc, GO_C, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 

 
SEf1, SIN, SE, SB, SR0, SR1, 
R_sht_E, R_sht_D, 

 
DMDin, DMDsht, PMDin, PMDsht); 


/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
input DSPCLK; 
input SHADOW, MTSB_E, MTSE_E, MTSR0_E, MTSR1_E; 
input [5:0] EXP; 
input [2:0] Xop_E, Xop_D; 
input [15:0] SO_L, SO_H; 
input updateSIr, updateSBr, updateSEr, updateSR1r, updateSR0r; 
input updateSIs, updateSBs, updateSEs, updateSR1s, updateSR0s; 
input MFSI_E, MFSB_E, MFSE_E, MFSR1_E, MFSR0_E, BYPASSR_D; 
input [15:0] R_in_E; 
input MFSHT_E, pMFSHT_E, accPM_E; 
input GO_MAC, EX_enc, GO_C; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
output SEf1; 
output [15:0] SIN; 
output [7:0] SE; 
output [4:0] SB; 
output [15:0] SR0, SR1; 
output [15:0] R_sht_E, R_sht_D; 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
input [15:0] DMDin; 
output [15:0] DMDsht; 
input [15:0] PMDin; 
output [15:0] PMDsht; 

wire [15:0] DMDin1; 

DMDbuf DMDIN_BUF(DMDin[15:0], DMDin1[15:0]); 


/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 

 
wire [15:0] SSin; 

assign SSin[15:0] = accPM_E ? PMDin[15:0] : DMDin1[15:0]; 

wire [15:0] SIr, SIs; 
wire CLKSIrenb, CLKSIsenb; 

assign CLKSIrenb = !updateSIr; 
assign CLKSIsenb = !updateSIs; 

`ifdef FD_DFT 
REG16L sirwe(DSPCLK, CLKSIrenb, GO_C, SSin[15:0], SIr[15:0], SCAN_TEST); 
REG16L siswe(DSPCLK, CLKSIsenb, GO_C, SSin[15:0], SIs[15:0], SCAN_TEST); 
`else 
REG16L sirwe(DSPCLK, CLKSIrenb, GO_C, SSin[15:0], SIr[15:0]); 
REG16L siswe(DSPCLK, CLKSIsenb, GO_C, SSin[15:0], SIs[15:0]); 
`endif 








 

 
wire [4:0] SBin; 
wire [7:0] SEin; 

assign #`del SBin[4:0] = MTSB_E ? DMDin1[4:0] : EXP[4:0]; 
assign #2 SEin[7:0] = MTSE_E ? SSin[7:0] : {EXP[5], EXP[5], EXP[5:0]}; 

reg [4:0] SBr, SBs; 
always @(posedge DSPCLK) 
if (updateSBr) SBr[4:0] = #`del SBin[4:0]; 
always @(posedge DSPCLK) 
if (updateSBs) SBs[4:0] = #`del SBin[4:0]; 

wire [7:0] SEr, SEs; 

wire CLKSErenb, CLKSEsenb; 
wire SErwe, SEswe; 

assign CLKSErenb = !updateSEr; 
assign CLKSEsenb = !updateSEs; 
assign SErwe = GO_C && EX_enc; 
assign SEswe = GO_C && EX_enc; 

`ifdef FD_DFT 
REG8L serwe(DSPCLK, CLKSErenb, SErwe, SEin[7:0], SEr[7:0], SCAN_TEST); 
REG8L seswe(DSPCLK, CLKSEsenb, SEswe, SEin[7:0], SEs[7:0], SCAN_TEST); 
`else 
REG8L serwe(DSPCLK, CLKSErenb, SErwe, SEin[7:0], SEr[7:0]); 
REG8L seswe(DSPCLK, CLKSEsenb, SEswe, SEin[7:0], SEs[7:0]); 
`endif 

 
wire [15:0] SR0in; 

assign #2 SR0in[15:0] = MTSR0_E ? SSin[15:0] : SO_L[15:0]; 

wire [15:0] SR0r, SR0s; 
wire SR0rwe, SR0swe; 
wire CLKSR0renb, CLKSR0senb; 

assign SR0rwe = GO_C && EX_enc; 
assign SR0swe = GO_C && EX_enc; 
assign CLKSR0renb = !updateSR0r; 
assign CLKSR0senb = !updateSR0s; 

`ifdef FD_DFT 
REG16L sr0rwe(DSPCLK, CLKSR0renb, SR0rwe, SR0in[15:0], SR0r[15:0], SCAN_TEST); 
REG16L sr0swe(DSPCLK, CLKSR0senb, SR0swe, SR0in[15:0], SR0s[15:0], SCAN_TEST); 
`else 
REG16L sr0rwe(DSPCLK, CLKSR0renb, SR0rwe, SR0in[15:0], SR0r[15:0]); 
REG16L sr0swe(DSPCLK, CLKSR0senb, SR0swe, SR0in[15:0], SR0s[15:0]); 
`endif 

 
wire [15:0] SR1in; 

assign #2 SR1in[15:0] = MTSR1_E ? SSin[15:0] : SO_H[15:0]; 

wire [15:0] SR1r, SR1s; 
wire SR1rwe, SR1swe; 
wire CLKSR1renb, CLKSR1senb; 

assign CLKSR1renb = !updateSR1r; 
assign CLKSR1senb = !updateSR1s; 

assign SR1rwe = GO_C && EX_enc; 
assign SR1swe = GO_C && EX_enc; 

`ifdef FD_DFT 
REG16L sr1rwe(DSPCLK, CLKSR1renb, SR1rwe, SR1in[15:0], SR1r[15:0], SCAN_TEST); 
REG16L sr1swe(DSPCLK, CLKSR1senb, SR1swe, SR1in[15:0], SR1s[15:0], SCAN_TEST); 
`else 
REG16L sr1rwe(DSPCLK, CLKSR1renb, SR1rwe, SR1in[15:0], SR1r[15:0]); 
REG16L sr1swe(DSPCLK, CLKSR1senb, SR1swe, SR1in[15:0], SR1s[15:0]); 
`endif 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
 
wire [15:0] SI, SIout; 

assign SI[15:0] = SHADOW ? SIs[15:0] : SIr[15:0]; 
assign SIout[15:0] = {16{MFSI_E}} & SI[15:0]; 

 
wire [15:0] SBout; 

assign SB[4:0] = SHADOW ? SBs[4:0] : SBr[4:0]; 
assign SBout[15:0] = {16{MFSB_E}} & {{11{SB[4]}}, SB[4:0]}; 

 
wire [15:0] SEout; 

assign SE[7:0] = SHADOW ? SEs[7:0] : SEr[7:0]; 
assign SEout[15:0] = {16{MFSE_E}} & {{8{SE[7]}}, SE[7:0]}; 
assign SEf1 = (SE[7:0] == 8'b11110001); 

 
wire [15:0] SR0out; 

assign SR0[15:0] = SHADOW ? SR0s[15:0] : SR0r[15:0]; 
assign SR0out[15:0] = {16{MFSR0_E}} & SR0[15:0]; 

 
wire [15:0] SR1out; 

assign SR1[15:0] = SHADOW ? SR1s[15:0] : SR1r[15:0]; 
assign SR1out[15:0] = {16{MFSR1_E}} & SR1[15:0]; 


wire [15:0] SHTout; 
assign SHTout[15:0] = SIout[15:0] | SBout[15:0] | SEout[15:0] | 
SR0out[15:0] | SR1out[15:0]; 

 

assign DMDsht[15:0] = {16{MFSHT_E}} & SHTout[15:0]; 
assign PMDsht[15:0] = {16{pMFSHT_E}} & SHTout[15:0]; 

 
wire [15:0] SR_E; 
wire Rstore_SR_E, Rstore_SR_D; 

assign Rstore_SR_E = (Xop_E[2:1] == 2'b11); 
assign Rstore_SR_D = (Xop_D[2:1] == 2'b11); 

assign SR_E[15:0] = Xop_E[0] ? SR1[15:0] : SR0[15:0]; 






 
 
 
 

wire [15:0] R_sht_in_D = {16{Rstore_SR_D & ~GO_MAC & ~BYPASSR_D & Xop_D[0]}} & SR1[15:0] 
| {16{Rstore_SR_D & ~GO_MAC & ~BYPASSR_D & ~Xop_D[0]}} & SR0[15:0] 
| {16{Rstore_SR_E & GO_MAC & Xop_E[0]}} & SR1[15:0] 
| {16{Rstore_SR_E & GO_MAC & ~Xop_E[0]}} & SR0[15:0] 
| {16{(Rstore_SR_D & ~GO_MAC & BYPASSR_D & ~MTSR1_E & Xop_D[0])}} & SO_H[15:0] 
| {16{(Rstore_SR_D & ~GO_MAC & BYPASSR_D & ~MTSR0_E & ~Xop_D[0])}} & SO_L[15:0]; 


assign R_sht_D[15:0] = {16{(Rstore_SR_D & ~GO_MAC & BYPASSR_D & accPM_E & ((MTSR1_E & Xop_D[0]) 
|(MTSR0_E & ~Xop_D[0])))}} & PMDin[15:0] 
| {16{(Rstore_SR_D & ~GO_MAC & BYPASSR_D & ~accPM_E & ((MTSR1_E & Xop_D[0]) 
|(MTSR0_E & ~Xop_D[0])))}} & DMDin[15:0] 
| R_sht_in_D[15:0]; 


assign R_sht_E[15:0] = {16{Rstore_SR_E}} & SR_E[15:0]; 

 
wire selSI; 

assign selSI = (Xop_E[2:1] == 00); 
assign SIN[15:0] = selSI ? SI[15:0] : R_in_E[15:0]; 

endmodule 
