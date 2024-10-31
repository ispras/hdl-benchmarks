






/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
 


module EM_REG(/* In */ 
DSPCLK, SHADOW, GO_C, GO_E, DOUBLE_E, 
updateMX0r, updateMX0s, updateMX1r, updateMX1s, 
updateMY0s, updateMY0r, updateMY1s, updateMY1r, 
MACin, updateMFs, updateMFr, satMR_Eg, 
MTMR0_Eg, MTMR1_Eg, MTMR2_Eg, updateMRs, updateMRr, 
MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E, MFMR0_E, 
MFMR1_E, MFMR2_E, Xop0_E, Xop0_D, Yop0_E, Yop0_D, BYPASSR_D, 
selMX_D, R_in_D, zeroMY_D, selMY_D, 
Rstore_MR0_D, Rstore_MR1_D, Rstore_MR2_D, Rstore_MR0_E, 
Rstore_MR1_E, Rstore_MR2_E, MFMAC_E, pMFMAC_E, accPM_E, Sq_R, 
GO_MAC, MXBy_R, MYBy_R, MACop_R, MACop_E, EX_enc, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 


 
MXOP_E, MYOP_E, MR0, MR1, MR2, 
R_mac_D, R_mac_E, MRovf, 

 
DMDin, DMDmac, PMDin, PMDmac); 

 
input DSPCLK, SHADOW, GO_C, DOUBLE_E, GO_E; 
input updateMX0r, updateMX0s, updateMX1r, updateMX1s; 
input updateMY0s, updateMY0r, updateMY1s, updateMY1r; 
input updateMFs, updateMFr, satMR_Eg, updateMRs, updateMRr; 
input [39:0] MACin; 
input MTMR0_Eg, MTMR1_Eg, MTMR2_Eg; 
input MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E, MFMR0_E; 
input MFMR1_E, MFMR2_E; 
input Xop0_D, Yop0_D, BYPASSR_D, selMX_D; 
input zeroMY_D, selMY_D; 
input Rstore_MR0_D, Rstore_MR1_D, Rstore_MR2_D; 
input Rstore_MR0_E, Rstore_MR1_E, Rstore_MR2_E; 
input [15:0] R_in_D; 
input MFMAC_E, pMFMAC_E, accPM_E, Sq_R; 
input GO_MAC, MXBy_R, MYBy_R; 
input Xop0_E, Yop0_E; 
input MACop_R, MACop_E, EX_enc; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 

 
output [15:0] MXOP_E, MYOP_E; 
output [15:0] MR0, MR1; 
output [7:0] MR2; 
output [8:0] MRovf; 
output [15:0] R_mac_D, R_mac_E; 

 
input [15:0] DMDin; 
output [15:0] DMDmac; 
input [15:0] PMDin; 
output [15:0] PMDmac; 

wire [15:0] DMDin1; 

DMDbuf DMDIN_BUF(DMDin[15:0], DMDin1[15:0]); 

 
wire [15:0] Xin; 

assign Xin[15:0] = accPM_E ? PMDin[15:0] : DMDin1[15:0]; 

wire [15:0] MX0r, MX0s, MX1r, MX1s; 
wire CLKMX0renb, CLKMX0senb, CLKMX1renb, CLKMX1senb; 

assign CLKMX0renb = !updateMX0r; 
assign CLKMX0senb = !updateMX0s; 
assign CLKMX1renb = !updateMX1r; 
assign CLKMX1senb = !updateMX1s; 

`ifdef FD_DFT 
REG16L mx0rwe(DSPCLK, CLKMX0renb, GO_C, Xin[15:0], MX0r[15:0], SCAN_TEST); 
REG16L mx0swe(DSPCLK, CLKMX0senb, GO_C, Xin[15:0], MX0s[15:0], SCAN_TEST); 
REG16L mx1rwe(DSPCLK, CLKMX1renb, GO_C, Xin[15:0], MX1r[15:0], SCAN_TEST); 
REG16L mx1swe(DSPCLK, CLKMX1senb, GO_C, Xin[15:0], MX1s[15:0], SCAN_TEST); 
`else 
REG16L mx0rwe(DSPCLK, CLKMX0renb, GO_C, Xin[15:0], MX0r[15:0]); 
REG16L mx0swe(DSPCLK, CLKMX0senb, GO_C, Xin[15:0], MX0s[15:0]); 
REG16L mx1rwe(DSPCLK, CLKMX1renb, GO_C, Xin[15:0], MX1r[15:0]); 
REG16L mx1swe(DSPCLK, CLKMX1senb, GO_C, Xin[15:0], MX1s[15:0]); 
`endif 

 
 
 
 
 
/*----------------------------------------------*/ 
wire [15:0] MX0; 
wire [15:0] MX1; 
wire [15:0] MX_D; 
wire sel_XOP; 
wire sel_YOP; 

assign sel_XOP = GO_MAC ? Xop0_E : Xop0_D; 
assign sel_YOP = GO_MAC ? Yop0_E : Yop0_D; 
assign MX0[15:0] = SHADOW ? MX0s[15:0] : MX0r[15:0]; 
assign MX1[15:0] = SHADOW ? MX1s[15:0] : MX1r[15:0]; 
assign MX_D[15:0] = MXBy_R ? Xin[15:0] : 
sel_XOP ? MX1[15:0] : MX0[15:0]; 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
wire [15:0] MXOP_E; 
wire CLKMXOPenb; 
wire MXOPwe; 
wire [15:0] MXOPDI2; 

assign CLKMXOPenb = !(MACop_E || MACop_R); 
assign MXOPwe = !selMX_D && (GO_MAC || GO_E); 
assign MXOPDI2[15:0] = ((GO_MAC && MACop_E) || (GO_E && MACop_R)) ? MX_D[15:0] : MXOP_E[15:0]; 
`ifdef FD_DFT 
REG2D16L mxopwe(DSPCLK, CLKMXOPenb, MXOPwe, R_in_D[15:0], MXOPDI2[15:0], MXOP_E[15:0], SCAN_TEST); 
`else 
REG2D16L mxopwe(DSPCLK, CLKMXOPenb, MXOPwe, R_in_D[15:0], MXOPDI2[15:0], MXOP_E[15:0]); 
`endif 


 

wire [15:0] Yin; 

assign Yin[15:0] = (DOUBLE_E | accPM_E) ? PMDin[15:0] : DMDin[15:0]; 

wire [15:0] MY0r, MY0s, MY1r, MY1s; 
wire CLKMY0renb, CLKMY0senb, CLKMY1renb, CLKMY1senb; 

assign CLKMY0renb = !updateMY0r; 
assign CLKMY0senb = !updateMY0s; 
assign CLKMY1renb = !updateMY1r; 
assign CLKMY1senb = !updateMY1s; 

`ifdef FD_DFT 
REG16L my0rwe(DSPCLK, CLKMY0renb, GO_C, Yin[15:0], MY0r[15:0], SCAN_TEST); 
REG16L my0swe(DSPCLK, CLKMY0senb, GO_C, Yin[15:0], MY0s[15:0], SCAN_TEST); 
REG16L my1rwe(DSPCLK, CLKMY1renb, GO_C, Yin[15:0], MY1r[15:0], SCAN_TEST); 
REG16L my1swe(DSPCLK, CLKMY1senb, GO_C, Yin[15:0], MY1s[15:0], SCAN_TEST); 
`else 
REG16L my0rwe(DSPCLK, CLKMY0renb, GO_C, Yin[15:0], MY0r[15:0]); 
REG16L my0swe(DSPCLK, CLKMY0senb, GO_C, Yin[15:0], MY0s[15:0]); 
REG16L my1rwe(DSPCLK, CLKMY1renb, GO_C, Yin[15:0], MY1r[15:0]); 
REG16L my1swe(DSPCLK, CLKMY1senb, GO_C, Yin[15:0], MY1s[15:0]); 
`endif 

 
wire [15:0] MY0; 
wire [15:0] MY1; 
wire [15:0] MF; 
wire [15:0] MY; 
wire [15:0] MX; 
wire [15:0] MYOP_D; 

wire [15:0] MFs, MFr; 

assign MY0[15:0] = SHADOW ? MY0s[15:0] : MY0r[15:0]; 
assign MY1[15:0] = SHADOW ? MY1s[15:0] : MY1r[15:0]; 
assign MF[15:0] = SHADOW ? MFs[15:0] : MFr[15:0]; 
assign MY[15:0] = sel_YOP ? MY1[15:0] : MY0[15:0]; 
assign MX[15:0] = sel_XOP ? MX1[15:0] : MX0[15:0]; 

wire Sq_D; 
reg Sq_E; 
always @(posedge DSPCLK) 
if (GO_E) Sq_E <= Sq_R; 

assign Sq_D = GO_MAC ? Sq_E : Sq_R; 


wire [15:0] MYOP_in_D; 
assign MYOP_in_D[15:0] = {16{~MYBy_R & zeroMY_D & (GO_MAC | GO_E)}} & {16'h0000} 
| {16{~MYBy_R & ~zeroMY_D & Sq_D & selMX_D & ~MXBy_R & (GO_MAC | GO_E)}} & MX[15:0] 
| {16{~MYBy_R & ~zeroMY_D & ~Sq_D & selMY_D & (GO_MAC | GO_E)}} & MY[15:0] 
| {16{~MYBy_R & ~zeroMY_D & ~Sq_D & ~selMY_D & (GO_MAC | GO_E)}} & MF[15:0] 
| {16{~(GO_MAC | GO_E)}} & MYOP_E[15:0]; 


`ifdef FD_RTL_SIM 
assign MYOP_D[15:0] = {16{MYBy_R & GO_E}} & Yin[15:0] 
| {16{~MYBy_R & ~zeroMY_D & Sq_D & selMX_D & MXBy_R & GO_E}} & Xin[15:0] 
| MYOP_in_D[15:0]; 

`else 
 
 

wire my_s1, my_s0; 
assign my_s1 = MYBy_R & (DOUBLE_E | accPM_E) & GO_E 
| ~MYBy_R & ~zeroMY_D & Sq_D & selMX_D & MXBy_R & accPM_E & (GO_MAC | GO_E); 

assign my_s0 = MYBy_R & ~(DOUBLE_E | accPM_E) & GO_E 
| ~MYBy_R & ~zeroMY_D & Sq_D & selMX_D & MXBy_R & ~accPM_E & (GO_MAC | GO_E); 


GTECH_MUX4 my_d0( .Z(MYOP_D[0]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[0]), .D1(DMDin[0]), 
.D2(PMDin[0]), .D3(MYOP_in_D[0]) ); 
GTECH_MUX4 my_d1( .Z(MYOP_D[1]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[1]), .D1(DMDin[1]), 
.D2(PMDin[1]), .D3(MYOP_in_D[1]) ); 
GTECH_MUX4 my_d2( .Z(MYOP_D[2]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[2]), .D1(DMDin[2]), 
.D2(PMDin[2]), .D3(MYOP_in_D[2]) ); 
GTECH_MUX4 my_d3( .Z(MYOP_D[3]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[3]), .D1(DMDin[3]), 
.D2(PMDin[3]), .D3(MYOP_in_D[3]) ); 
GTECH_MUX4 my_d4( .Z(MYOP_D[4]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[4]), .D1(DMDin[4]), 
.D2(PMDin[4]), .D3(MYOP_in_D[4]) ); 
GTECH_MUX4 my_d5( .Z(MYOP_D[5]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[5]), .D1(DMDin[5]), 
.D2(PMDin[5]), .D3(MYOP_in_D[5]) ); 
GTECH_MUX4 my_d6( .Z(MYOP_D[6]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[6]), .D1(DMDin[6]), 
.D2(PMDin[6]), .D3(MYOP_in_D[6]) ); 
GTECH_MUX4 my_d7( .Z(MYOP_D[7]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[7]), .D1(DMDin[7]), 
.D2(PMDin[7]), .D3(MYOP_in_D[7]) ); 
GTECH_MUX4 my_d8( .Z(MYOP_D[8]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[8]), .D1(DMDin[8]), 
.D2(PMDin[8]), .D3(MYOP_in_D[8]) ); 
GTECH_MUX4 my_d9( .Z(MYOP_D[9]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[9]), .D1(DMDin[9]), 
.D2(PMDin[9]), .D3(MYOP_in_D[9]) ); 
GTECH_MUX4 my_d10( .Z(MYOP_D[10]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[10]), .D1(DMDin[10]), 
.D2(PMDin[10]), .D3(MYOP_in_D[10]) ); 
GTECH_MUX4 my_d11( .Z(MYOP_D[11]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[11]), .D1(DMDin[11]), 
.D2(PMDin[11]), .D3(MYOP_in_D[11]) ); 
GTECH_MUX4 my_d12( .Z(MYOP_D[12]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[12]), .D1(DMDin[12]), 
.D2(PMDin[12]), .D3(MYOP_in_D[12]) ); 
GTECH_MUX4 my_d13( .Z(MYOP_D[13]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[13]), .D1(DMDin[13]), 
.D2(PMDin[13]), .D3(MYOP_in_D[13]) ); 
GTECH_MUX4 my_d14( .Z(MYOP_D[14]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[14]), .D1(DMDin[14]), 
.D2(PMDin[14]), .D3(MYOP_in_D[14]) ); 
GTECH_MUX4 my_d15( .Z(MYOP_D[15]), .B(my_s1), .A(my_s0), .D0(MYOP_in_D[15]), .D1(DMDin[15]), 
.D2(PMDin[15]), .D3(MYOP_in_D[15]) ); 
`endif 


/*--------------------------------------------*/ 
 
/*--------------------------------------------*/ 
wire [15:0] MYOP_E; 
wire CLKMYOPenb; 
wire MYOPwe; 

assign CLKMYOPenb = !(MACop_R || MACop_E); 
assign MYOPwe = (!MYBy_R) && (!zeroMY_D) && Sq_D && (!selMX_D) && (GO_MAC || GO_E); 

`ifdef FD_DFT 
REG2D16L myopwe(DSPCLK, CLKMYOPenb, MYOPwe, R_in_D[15:0], MYOP_D[15:0], MYOP_E[15:0], SCAN_TEST); 
`else 
REG2D16L myopwe(DSPCLK, CLKMYOPenb, MYOPwe, R_in_D[15:0], MYOP_D[15:0], MYOP_E[15:0]); 
`endif 











 

 
 
 
/*--------------------------------------------*/ 
wire CLKMFsenb, CLKMFrenb; 
wire MFrwe, MFswe; 

assign CLKMFsenb = !updateMFs; 
assign CLKMFrenb = !updateMFr; 
assign MFrwe = GO_C && EX_enc; 
assign MFswe = GO_C && EX_enc; 

`ifdef FD_DFT 
REG16L mfswe(DSPCLK, CLKMFsenb, MFswe, MACin[31:16], MFs[15:0], SCAN_TEST); 
REG16L mfrwe(DSPCLK, CLKMFrenb, MFrwe, MACin[31:16], MFr[15:0], SCAN_TEST); 
`else 
REG16L mfswe(DSPCLK, CLKMFsenb, MFswe, MACin[31:16], MFs[15:0]); 
REG16L mfrwe(DSPCLK, CLKMFrenb, MFrwe, MACin[31:16], MFr[15:0]); 
`endif 

 
wire [15:0] MR0r, MR0s, MR1r, MR1s; 
wire [7:0] MR2r, MR2s; 

wire [15:0] MR0rin, MR0sin, MR1rin, MR1sin; 
wire [7:0] MR2rin, MR2sin; 

assign MR0rin[15:0] = satMR_Eg & !SHADOW & GO_C ? (MR2r[7] ? 16'h0000 : 16'hffff) : 
MTMR0_Eg & !SHADOW & GO_C ? Xin[15:0] : 
MR0r[15:0]; 

assign MR0sin[15:0] = satMR_Eg & SHADOW & GO_C ? (MR2s[7] ? 16'h0000 : 16'hffff) : 
MTMR0_Eg & SHADOW & GO_C ? Xin[15:0] : 
MR0s[15:0]; 

assign MR1rin[15:0] = satMR_Eg & !SHADOW & GO_C ? {MR2r[7], {MR2r[7] ? 15'h0000 : 15'h7fff}} : 
MTMR1_Eg & !SHADOW & GO_C ? Xin[15:0] : 
MR1r[15:0]; 

assign MR1sin[15:0] = satMR_Eg & SHADOW & GO_C ? {MR2s[7], {MR2s[7] ? 15'h0000 : 15'h7fff}} : 
MTMR1_Eg & SHADOW & GO_C ? Xin[15:0] : 
MR1s[15:0]; 

assign MR2rin[7:0] = satMR_Eg & !SHADOW & GO_C ? (MR2r[7] ? 8'hff : 8'h00) : 
MTMR1_Eg & !SHADOW & GO_C ? {8{Xin[15]}} : 
MTMR2_Eg & !SHADOW & GO_C ? Xin[7:0] : 
MR2r[7:0]; 

assign MR2sin[7:0] = satMR_Eg & SHADOW & GO_C ? (MR2s[7] ? 8'hff : 8'h00) : 
MTMR1_Eg & SHADOW & GO_C ? {8{Xin[15]}} : 
MTMR2_Eg & SHADOW & GO_C ? Xin[7:0] : 
MR2s[7:0]; 

wire [8:0] MRovf; 
wire CLKovfenb; 
wire MRovfwe; 

assign CLKovfenb = !MACop_E; 
assign MRovfwe = GO_C && EX_enc; 

`ifdef FD_DFT 
REG9L mrovfwe(DSPCLK, CLKovfenb, MRovfwe, MACin[39:31], MRovf[8:0], SCAN_TEST); 
`else 
REG9L mrovfwe(DSPCLK, CLKovfenb, MRovfwe, MACin[39:31], MRovf[8:0]); 
`endif 










 


wire updateMR0r, updateMR1r, updateMR2r; 
wire updateMR0s, updateMR1s, updateMR2s; 
wire CLKmr0renb, CLKmr0senb, CLKmr1renb; 
wire CLKmr1senb, CLKmr2renb, CLKmr2senb; 
wire MR0r_we, MR1r_we, MR2r_we; 
wire MR0s_we, MR1s_we, MR2s_we; 

assign updateMR0r = !SHADOW && (satMR_Eg || MTMR0_Eg); 
assign updateMR1r = !SHADOW && (satMR_Eg || MTMR1_Eg); 
assign updateMR2r = !SHADOW && (satMR_Eg || MTMR1_Eg || MTMR2_Eg); 
assign updateMR0s = SHADOW && (satMR_Eg || MTMR0_Eg); 
assign updateMR1s = SHADOW && (satMR_Eg || MTMR1_Eg); 
assign updateMR2s = SHADOW && (satMR_Eg || MTMR1_Eg || MTMR2_Eg); 

assign CLKmr0renb = !(updateMRr || updateMR0r); 
assign CLKmr1renb = !(updateMRr || updateMR1r); 
assign CLKmr2renb = !(updateMRr || updateMR2r); 
assign CLKmr0senb = !(updateMRs || updateMR0s); 
assign CLKmr1senb = !(updateMRs || updateMR1s); 
assign CLKmr2senb = !(updateMRs || updateMR2s); 

assign MR0r_we = updateMRr && GO_C && EX_enc; 
assign MR1r_we = updateMRr && GO_C && EX_enc; 
assign MR2r_we = updateMRr && GO_C && EX_enc; 
assign MR0s_we = updateMRs && GO_C && EX_enc; 
assign MR1s_we = updateMRs && GO_C && EX_enc; 
assign MR2s_we = updateMRs && GO_C && EX_enc; 

`ifdef FD_DFT 
REG2D16L mr0rwe(DSPCLK, CLKmr0renb, MR0r_we, MACin[15:0], MR0rin[15:0], MR0r[15:0], SCAN_TEST); 
REG2D16L mr0swe(DSPCLK, CLKmr0senb, MR0s_we, MACin[15:0], MR0sin[15:0], MR0s[15:0], SCAN_TEST); 
REG2D16L mr1rwe(DSPCLK, CLKmr1renb, MR1r_we, MACin[31:16], MR1rin[15:0], MR1r[15:0], SCAN_TEST); 
REG2D16L mr1swe(DSPCLK, CLKmr1senb, MR1s_we, MACin[31:16], MR1sin[15:0], MR1s[15:0], SCAN_TEST); 
REG2D8L mr2rwe(DSPCLK, CLKmr2renb, MR2r_we, MACin[39:32], MR2rin[7:0], MR2r[7:0], SCAN_TEST); 
REG2D8L mr2swe(DSPCLK, CLKmr2senb, MR2s_we, MACin[39:32], MR2sin[7:0], MR2s[7:0], SCAN_TEST); 
`else 
REG2D16L mr0rwe(DSPCLK, CLKmr0renb, MR0r_we, MACin[15:0], MR0rin[15:0], MR0r[15:0]); 
REG2D16L mr0swe(DSPCLK, CLKmr0senb, MR0s_we, MACin[15:0], MR0sin[15:0], MR0s[15:0]); 
REG2D16L mr1rwe(DSPCLK, CLKmr1renb, MR1r_we, MACin[31:16], MR1rin[15:0], MR1r[15:0]); 
REG2D16L mr1swe(DSPCLK, CLKmr1senb, MR1s_we, MACin[31:16], MR1sin[15:0], MR1s[15:0]); 
REG2D8L mr2rwe(DSPCLK, CLKmr2renb, MR2r_we, MACin[39:32], MR2rin[7:0], MR2r[7:0]); 
REG2D8L mr2swe(DSPCLK, CLKmr2senb, MR2s_we, MACin[39:32], MR2sin[7:0], MR2s[7:0]); 
`endif 

 
wire [15:0] MR1, MR0; 
wire [7:0] MR2; 

assign MR2[7:0] = SHADOW ? MR2s[7:0] : MR2r[7:0]; 
assign MR1[15:0] = SHADOW ? MR1s[15:0] : MR1r[15:0]; 
assign MR0[15:0] = SHADOW ? MR0s[15:0] : MR0r[15:0]; 

/*--------------------------------------*/ 
 
/*--------------------------------------*/ 

wire [7:0] MR2_D; 

wire [15:0] R_mac_in_D; 

assign R_mac_in_D[15:0] = {16{Rstore_MR0_D & BYPASSR_D & ~GO_MAC & satMR_Eg}} & {16{~MR2[7]}} 
| {16{Rstore_MR0_D & ~BYPASSR_D & ~GO_MAC}} & MR0[15:0] 
| {16{Rstore_MR0_E & GO_MAC}} & MR0[15:0] 
| {16{Rstore_MR1_D & BYPASSR_D & ~GO_MAC & satMR_Eg}} & {MR2[7], {15{~MR2[7]}}} 
| {16{Rstore_MR1_D & ~BYPASSR_D & ~GO_MAC}} & MR1[15:0] 
| {16{Rstore_MR1_E & GO_MAC}} & MR1[15:0] 
| {16{Rstore_MR2_D & BYPASSR_D & ~GO_MAC & satMR_Eg}} & {16{MR2[7]}} 
| {16{Rstore_MR2_D & ~BYPASSR_D & ~GO_MAC}} & {{8{MR2[7]}}, MR2[7:0]} 
| {16{Rstore_MR2_E & GO_MAC}} & {{8{MR2[7]}}, MR2[7:0]}; 
`ifdef FD_RTL_SIM 
assign R_mac_D[15:0] = {16{BYPASSR_D & ~GO_MAC & accPM_E & ((Rstore_MR0_D & MTMR0_Eg) 
| (Rstore_MR1_D & MTMR1_Eg))}} & {PMDin[15:0]} 
| {16{BYPASSR_D & ~GO_MAC & ~accPM_E & ((Rstore_MR0_D & MTMR0_Eg) 
| (Rstore_MR1_D & MTMR1_Eg))}} & {DMDin[15:0]} 
| {16{Rstore_MR2_D & BYPASSR_D & ~GO_MAC & MTMR1_Eg}} & {16{Xin[15]}} 
| {16{Rstore_MR2_D & BYPASSR_D & ~GO_MAC & MTMR2_Eg & accPM_E}} & {{8{PMDin[7]}}, PMDin[7:0]} 
| {16{Rstore_MR2_D & BYPASSR_D & ~GO_MAC & MTMR2_Eg & ~accPM_E}} & {{8{DMDin[7]}}, DMDin[7:0]} 
| R_mac_in_D[15:0]; 

`else 

wire [4:0] SEL_mac_D; 
reg s0, s1, s2; 

assign SEL_mac_D[4] = BYPASSR_D & ~GO_MAC & accPM_E & ((Rstore_MR0_D & MTMR0_Eg) | (Rstore_MR1_D & MTMR1_Eg)); 
assign SEL_mac_D[3] = BYPASSR_D & ~GO_MAC & ~accPM_E & ((Rstore_MR0_D & MTMR0_Eg) | (Rstore_MR1_D & MTMR1_Eg)); 
assign SEL_mac_D[2] = Rstore_MR2_D & BYPASSR_D & ~GO_MAC & MTMR1_Eg; 
assign SEL_mac_D[1] = Rstore_MR2_D & BYPASSR_D & ~GO_MAC & MTMR2_Eg & accPM_E; 
assign SEL_mac_D[0] = Rstore_MR2_D & BYPASSR_D & ~GO_MAC & MTMR2_Eg & ~accPM_E; 

always @(SEL_mac_D) 
begin 
case (SEL_mac_D) 
5'b10000 : {s2, s1, s0} = 3'b000; 
5'b01000 : {s2, s1, s0} = 3'b001; 
5'b00100 : {s2, s1, s0} = 3'b010; 
5'b00010 : {s2, s1, s0} = 3'b011; 
5'b00001 : {s2, s1, s0} = 3'b100; 
5'b00000 : {s2, s1, s0} = 3'b101; 
endcase 
end 

GTECH_MUX8 mac_d15(.D0(PMDin[15]), .D1(DMDin[15]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[15]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[15])); 
GTECH_MUX8 mac_d14(.D0(PMDin[14]), .D1(DMDin[14]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[14]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[14])); 
GTECH_MUX8 mac_d13(.D0(PMDin[13]), .D1(DMDin[13]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[13]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[13])); 
GTECH_MUX8 mac_d12(.D0(PMDin[12]), .D1(DMDin[12]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[12]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[12])); 
GTECH_MUX8 mac_d11(.D0(PMDin[11]), .D1(DMDin[11]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[11]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[11])); 
GTECH_MUX8 mac_d10(.D0(PMDin[10]), .D1(DMDin[10]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[10]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[10])); 
GTECH_MUX8 mac_d9(.D0(PMDin[9]), .D1(DMDin[9]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[9]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[9])); 
GTECH_MUX8 mac_d8(.D0(PMDin[8]), .D1(DMDin[8]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[8]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[8])); 
GTECH_MUX8 mac_d7(.D0(PMDin[7]), .D1(DMDin[7]), .D2(Xin[15]), .D3(PMDin[7]), .D4(DMDin[7]), 
.D5(R_mac_in_D[7]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[7])); 
GTECH_MUX8 mac_d6(.D0(PMDin[6]), .D1(DMDin[6]), .D2(Xin[15]), .D3(PMDin[6]), .D4(DMDin[6]), 
.D5(R_mac_in_D[6]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[6])); 
GTECH_MUX8 mac_d5(.D0(PMDin[5]), .D1(DMDin[5]), .D2(Xin[15]), .D3(PMDin[5]), .D4(DMDin[5]), 
.D5(R_mac_in_D[5]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[5])); 
GTECH_MUX8 mac_d4(.D0(PMDin[4]), .D1(DMDin[4]), .D2(Xin[15]), .D3(PMDin[4]), .D4(DMDin[4]), 
.D5(R_mac_in_D[4]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[4])); 
GTECH_MUX8 mac_d3(.D0(PMDin[3]), .D1(DMDin[3]), .D2(Xin[15]), .D3(PMDin[3]), .D4(DMDin[3]), 
.D5(R_mac_in_D[3]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[3])); 
GTECH_MUX8 mac_d2(.D0(PMDin[2]), .D1(DMDin[2]), .D2(Xin[15]), .D3(PMDin[2]), .D4(DMDin[2]), 
.D5(R_mac_in_D[2]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[2])); 
GTECH_MUX8 mac_d1(.D0(PMDin[1]), .D1(DMDin[1]), .D2(Xin[15]), .D3(PMDin[1]), .D4(DMDin[1]), 
.D5(R_mac_in_D[1]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[1])); 
GTECH_MUX8 mac_d0(.D0(PMDin[0]), .D1(DMDin[0]), .D2(Xin[15]), .D3(PMDin[0]), .D4(DMDin[0]), 
.D5(R_mac_in_D[0]), .D6(1'b0), .D7(1'b0), 
.C(s2), .B(s1), .A(s0), .Z(R_mac_D[0])); 

`endif 


















 

assign R_mac_E[15:0] = {16{Rstore_MR0_E}} & MR0[15:0] 
| {16{Rstore_MR1_E}} & MR1[15:0] 
| {16{Rstore_MR2_E}} & {{8{MR2[7]}}, MR2[7:0]} ; 


/*--------------------------------------*/ 
 
/*--------------------------------------*/ 
wire [15:0] MACout; 

assign MACout[15:0] = {16{MFMX0_E}} & MX0[15:0] 
| {16{MFMX1_E}} & MX1[15:0] 
| {16{MFMY0_E}} & MY0[15:0] 
| {16{MFMY1_E}} & MY1[15:0] 
| {16{MFMR0_E}} & MR0[15:0] 
| {16{MFMR1_E}} & MR1[15:0] 
| {16{MFMR2_E}} & {{8{MR2[7]}}, MR2[7:0]}; 

assign DMDmac[15:0] = {16{MFMAC_E}} & MACout[15:0]; 
assign PMDmac[15:0] = {16{pMFMAC_E}} & MACout[15:0]; 

endmodule 


