






/*------------------------------------------------------*/ 
 
 
/*------------------------------------------------------*/ 

/*------------------------------------------------------*/ 
 
 
/*------------------------------------------------------*/ 

module EM_DEC(/* IN */ 
Xop_D, Xop_E, Yop_D, Yop_E, AMF_D, 
EX_enc, GO_C, SHADOW, 
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, BYPASSMX_D, 
BYPASSMY_D, GO_MAC, DSPCLK, GO_E, MACop_E, 
updMF_E, updMR_E, MACop_R, 
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

 
input [2:0] Xop_D, Xop_E; 
input [1:0] Yop_D, Yop_E; 
input [3:0] AMF_D; 
input EX_enc, GO_C; 
input SHADOW; 
input MACop_E, MTMX0_Eg; 
input MTMX1_Eg, MTMY0_Eg, MTMY1_Eg; 
input BYPASSMX_D, BYPASSMY_D; 
input GO_MAC; 
input DSPCLK, GO_E; 
input updMF_E, updMR_E; 
input MACop_R; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 

 
output updateMX0s, updateMX0r, updateMX1s; 
output updateMX1r, updateMY0s, updateMY0r; 
output updateMY1s, updateMY1r; 
output selMY_D, selMX_D; 
output zeroMY_D, msub1_E; 
output mzero_E, rnd_E; 
output unsignX_E, unsignY_E; 
output updateMFs, updateMFr; 
output Rstore_MR0_D, Rstore_MR1_D; 
output Rstore_MR2_D, Rstore_MR0_E; 
output Rstore_MR1_E, Rstore_MR2_E; 
output updateMV, updateMRr, updateMRs; 
output MXBy_R, MYBy_R; 
output msub2_E, msub3_E, msub4_E, msub5_E; 
output msub6_E, msub7_E, msub8_E; 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
 
 
 
/*----------------------------------------------*/ 

wire selMX_D, selMY_D; 

assign selMX_D = GO_MAC ? (Xop_E[2:1] == 2'b00) 
: (Xop_D[2:1] == 2'b00); 
assign selMY_D = GO_MAC ? (Yop_E[1] == 1'b0) 
: (Yop_D[1] == 1'b0); 
assign zeroMY_D = GO_MAC ? (Yop_E[1:0] == 2'b11) 
: (Yop_D[1:0] == 2'b11); 


/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 






 

wire msub_D; 
wire mzero_D; 
wire rnd_D; 

assign msub_D = (AMF_D[3:0] == 4'b0011) | (AMF_D[3:2] == 2'b11); 
assign mzero_D = (AMF_D[3:0] == 4'b0001) | (AMF_D[3:2] == 2'b01); 
assign rnd_D = (AMF_D[3:2] == 2'b00); 
assign MXBy_R = BYPASSMX_D & ~GO_MAC; 
assign MYBy_R = BYPASSMY_D & ~GO_MAC; 


wire msub1_E, msub2_E, msub3_E; 
wire msub4_E, msub5_E, msub6_E; 
wire msub7_E, msub8_E, unsignY_E; 
wire mzero_E, rnd_E, unsignX_E; 
wire CLKEMCOREenb; 
wire [11:0] EMCOREdi, EMCOREdo; 
wire unsignX_D, unsignY_D; 

assign unsignX_D = AMF_D[1] && (!rnd_D); 
assign unsignY_D = AMF_D[0] && (!rnd_D); 
assign CLKEMCOREenb = !MACop_R; 
assign EMCOREdi[11:0] = {{8{msub_D}}, unsignX_D, unsignY_D, mzero_D, rnd_D}; 
assign {msub1_E, msub2_E, msub3_E, msub4_E, msub5_E, msub6_E, msub7_E, msub8_E, 
unsignX_E, unsignY_E, mzero_E, rnd_E} = EMCOREdo[11:0]; 

`ifdef FD_DFT 
REG12L emcorepi(DSPCLK, CLKEMCOREenb, GO_E, EMCOREdi[11:0], EMCOREdo[11:0], SCAN_TEST); 
`else 
REG12L emcorepi(DSPCLK, CLKEMCOREenb, GO_E, EMCOREdi[11:0], EMCOREdo[11:0]); 
`endif 

/*----------------------------------------------*/ 
 
 
 
 
/*----------------------------------------------*/ 
assign updateMX0r = !SHADOW && MTMX0_Eg; 
assign updateMX0s = SHADOW && MTMX0_Eg; 
assign updateMX1r = !SHADOW && MTMX1_Eg; 
assign updateMX1s = SHADOW && MTMX1_Eg; 
assign updateMY0r = !SHADOW && MTMY0_Eg; 
assign updateMY0s = SHADOW && MTMY0_Eg; 
assign updateMY1r = !SHADOW && MTMY1_Eg; 
assign updateMY1s = SHADOW && MTMY1_Eg; 
assign updateMFr = !SHADOW && updMF_E; 
assign updateMFs = SHADOW && updMF_E; 
assign updateMRr = !SHADOW && updMR_E; 
assign updateMRs = SHADOW && updMR_E; 
/*----------------------------------------------*/ 
 
 
/*----------------------------------------------*/ 
assign updateMV = MACop_E && EX_enc; 


/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 

assign Rstore_MR0_D = (Xop_D[2:0] == 3'b011); 
assign Rstore_MR1_D = (Xop_D[2:0] == 3'b100); 
assign Rstore_MR2_D = (Xop_D[2:0] == 3'b101); 
assign Rstore_MR0_E = (Xop_E[2:0] == 3'b011); 
assign Rstore_MR1_E = (Xop_E[2:0] == 3'b100); 
assign Rstore_MR2_E = (Xop_E[2:0] == 3'b101); 

endmodule 

