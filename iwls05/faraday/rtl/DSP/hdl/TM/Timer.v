






/*----------------------------------------------------------------------*/ 
























/*----------------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 


/*--------------------------------------------------------------*/ 

module TM(/*----------- Input from I/O pads ---------------*/ 
TMCLK, DSPCLK, T_RST, TMODE, DMD, 


selTSR, selTCR, selTPR, TSR_we, TCR_we, 
TPR_we, MSTAT5, TMOUT, MMR_web, 
ICE_ST, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 



TINT); 


/*--------------------------------------------------------*/ 
input [15:0] DMD; 
input TMCLK; 
input DSPCLK; 
input T_RST; 
input selTSR; 
input selTCR; 
input selTPR; 
input MSTAT5; 
input TSR_we; 
input TCR_we; 
input TPR_we; 
input TMODE; 
input MMR_web; 
input ICE_ST; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 


output [15:0] TMOUT; 
output TINT; 

/*---------------------------------------------------------*/ 

reg WR_TSR_p, WR_TCR_p; 

always @(posedge DSPCLK) 
begin 
WR_TSR_p <= #1 TSR_we; 
WR_TCR_p <= #1 TCR_we; 
end 

/*-------------------------------------------------------*/ 
wire [7:0] TSR; 
wire CLKsel; 
wire [15:0] TCR; 
wire [15:0] TPR; 

`ifdef FD_DFT 
REG9LC tsr_reg(DSPCLK, MMR_web, TSR_we, {DMD[15], DMD[7:0]}, {CLKsel, TSR[7:0]}, 
T_RST, SCAN_TEST); 
REG16LC tcr_reg(DSPCLK, MMR_web, TCR_we, DMD[15:0], TCR[15:0], T_RST, SCAN_TEST); 
REG16LC tpr_reg(DSPCLK, MMR_web, TPR_we, DMD[15:0], TPR[15:0], T_RST, SCAN_TEST); 
`else 
REG9LC tsr_reg(DSPCLK, MMR_web, TSR_we, {DMD[15], DMD[7:0]}, {CLKsel, TSR[7:0]}, T_RST); 
REG16LC tcr_reg(DSPCLK, MMR_web, TCR_we, DMD[15:0], TCR[15:0], T_RST); 
REG16LC tpr_reg(DSPCLK, MMR_web, TPR_we, DMD[15:0], TPR[15:0], T_RST); 
`endif 

































wire WR_TCR_TMP, WR_TSR_TMP; 

`ifdef FD_GTCLK 
`ifdef FD_DFT 
GTECH_AND_NOT uu0 (.Z(CLKsel_dft), .A(CLKsel), .B(SCAN_TEST)); 
GtCLK_MUX2 uk2 (.Z(TIMERCLK), .A(DSPCLK), .B(TMCLK), .S(CLKsel_dft)); 
`else 
GtCLK_MUX2 uk2 (.Z(TIMERCLK), .A(DSPCLK), .B(TMCLK), .S(CLKsel)); 
`endif 

`ifdef FD_DFT 
GTECH_NOR3 uk3 (.Z(TIMERCLKenb), .A(MSTAT5), .B(WR_TCR_TMP), .C(WR_TSR_TMP)); 
GTECH_AND_NOT utm1 (.Z(TIMERCLKenb_dft), .A(TIMERCLKenb), .B(SCAN_TEST)); 
GtCLK_NOR2 uk4 (.Z(TIMERCLKg_), .A(TIMERCLK), .B(TIMERCLKenb_dft)); 
`else 
GTECH_NOR3 uk3 (.Z(TIMERCLKenb), .A(MSTAT5), .B(WR_TCR_TMP), .C(WR_TSR_TMP)); 
GtCLK_NOR2 uk4 (.Z(TIMERCLKg_), .A(TIMERCLK), .B(TIMERCLKenb)); 
`endif 
GtCLK_NOT ckTIMERCLKg (.Z(TIMERCLKg), .A(TIMERCLKg_)); 

`else 
wire TIMERCLK = CLKsel ? TMCLK : DSPCLK; 
wire TIMERCLKg=TIMERCLK; 
`endif 

/*----------------------------------------------------------*/ 
reg WR_TSR_TMP_GEN1; 
reg WR_TSR_TMP_GEN2; 
reg WR_TSR_KEEP_TO_TMCLK_p; 

wire WR_TSR_RST; 

always @(posedge TIMERCLK) 
WR_TSR_TMP_GEN1 <= #1 WR_TSR_KEEP_TO_TMCLK_p; 

always @(posedge TIMERCLK) 
WR_TSR_TMP_GEN2 <= #1 WR_TSR_TMP_GEN1; 

assign WR_TSR_TMP = TMODE ? 1'b0 : WR_TSR_TMP_GEN1 & ~WR_TSR_TMP_GEN2; 

`ifdef FD_DFT 
wire WR_TSR_RST_h = (T_RST | WR_TSR_TMP); 
assign WR_TSR_RST = SCAN_TEST ? T_RST : WR_TSR_RST_h; 
`else 
assign WR_TSR_RST = T_RST | WR_TSR_TMP; 
`endif 

always @(posedge DSPCLK or posedge WR_TSR_RST) 
begin 
if (WR_TSR_RST) 
WR_TSR_KEEP_TO_TMCLK_p <= #1 1'b0; 
else if (WR_TSR_p) 
WR_TSR_KEEP_TO_TMCLK_p <= #1 1'b1; 
end 

/*------------------------------------------------------------*/ 
wire TSREQ0, RELOAD_TSR; 
reg [7:0] TSR_TMP; 

assign TSREQ0 = (TSR_TMP[7:0] == 8'h0); 
assign RELOAD_TSR = TMODE ? 1'b0 
: MSTAT5 ? TSREQ0 : 1'b1; 

wire [3:0] TSR_SUM0, TSR_SUM1; 
wire [7:0] TSR_TMPin; 
wire SCo0, SCi0; 

assign {SCo0, TSR_SUM0[3:0]} = TSR_TMP[3:0] + 4'b1111; 
assign SCi0 = TMODE ? 1'b0 : SCo0; 
assign TSR_SUM1[3:0] = TSR_TMP[7:4] + SCi0 + 4'b1111; 
assign TSR_TMPin[7:0] = {TSR_SUM1[3:0], TSR_SUM0[3:0]}; 






always @(posedge TIMERCLKg or posedge T_RST) 
begin 
if (T_RST) 
TSR_TMP[7:0] <= #1 8'h0; 
else if (WR_TSR_TMP) 
TSR_TMP[7:0] <= #1 TSR[7:0]; 
else if (RELOAD_TSR) 
TSR_TMP[7:0] <= #1 TSR[7:0]; 
else if(!ICE_ST) 
TSR_TMP[7:0] <= #1 TSR_TMPin[7:0]; 
end 

/*-------------------------------------------------------------*/ 
wire TCREQ0, RELOAD_TCR; 
wire RELOAD_TCR_TMP; 
wire TINT_SET; 
reg TINT_SET_L; 
reg TINT_GEN1; 
reg TINT_GEN2; 
reg MSTAT5_syn; 
reg [15:0] TCR_TMP; 

assign TCREQ0 = (TCR_TMP[15:0] == 16'h0); 

assign RELOAD_TCR = TMODE ? 1'b0 
: MSTAT5 ? TCREQ0 : 1'b0; 

assign RELOAD_TCR_TMP = TMODE ? 1'b0 
: MSTAT5 ? ~TSREQ0 : 1'b1; 

assign TINT_SET = MSTAT5_syn & ~(WR_TCR_TMP | WR_TSR_TMP) & TCREQ0; 

always @(posedge TIMERCLKg or posedge T_RST) 
begin 
if (T_RST) 
MSTAT5_syn <=#1 1'b0; 
else 
MSTAT5_syn <=#1 MSTAT5; 
end 

always @(posedge TIMERCLKg or posedge T_RST) 
begin 
if (T_RST) 
TINT_SET_L <= #1 1'b0; 
else if (TINT_SET) 
TINT_SET_L <= #1 1'b1; 
else 
TINT_SET_L <= #1 1'b0; 
end 

always @(posedge DSPCLK or posedge T_RST) 
begin 
if (T_RST) 
TINT_GEN1 <= #1 1'b0; 
else 
TINT_GEN1 <= #1 TINT_SET_L; 
end 

always @(posedge DSPCLK or posedge T_RST) 
begin 
if (T_RST) 
TINT_GEN2 <= #1 1'b0; 
else 
TINT_GEN2 <= #1 TINT_GEN1; 
end 

assign TINT = TMODE ? 1'b0 : TINT_GEN2 & ~TINT_GEN1; 

/*---------------------------------------------------------------*/ 

reg WR_TCR_TMP_GEN1; 
reg WR_TCR_TMP_GEN2; 
reg WR_TCR_KEEP_TO_TMCLK_p; 
wire WR_TCR_RST; 

always @(posedge TIMERCLK) 
WR_TCR_TMP_GEN1 <= #1 WR_TCR_KEEP_TO_TMCLK_p; 

always @(posedge TIMERCLK) 
WR_TCR_TMP_GEN2 <= #1 WR_TCR_TMP_GEN1; 

assign WR_TCR_TMP = TMODE ? 1'b0 : WR_TCR_TMP_GEN1 & ~WR_TCR_TMP_GEN2; 
`ifdef FD_DFT 
wire WR_TCR_RST_h = T_RST | WR_TCR_TMP; 
assign WR_TCR_RST = SCAN_TEST ? T_RST : WR_TCR_RST_h; 
`else 
assign WR_TCR_RST = T_RST | WR_TCR_TMP; 
`endif 

always @(posedge DSPCLK or posedge WR_TCR_RST) 
begin 
if (WR_TCR_RST) 
WR_TCR_KEEP_TO_TMCLK_p <= #1 1'b0; 
else if (WR_TCR_p) 
WR_TCR_KEEP_TO_TMCLK_p <= #1 1'b1; 
end 

/*---------------------------------------------------------------*/ 

wire [3:0] TCR_SUM0, TCR_SUM1; 
wire [3:0] TCR_SUM2, TCR_SUM3; 
wire [15:0] TCR_TMPin; 
wire RCo0, RCo1, RCo2; 
wire RCi0, RCi1, RCi2; 

assign {RCo0, TCR_SUM0[3:0]} = TCR_TMP[3:0] + 4'b1111 ; 
assign RCi0 = TMODE ? 1'b0 : RCo0; 
assign {RCo1, TCR_SUM1[3:0]} = TCR_TMP[7:4] + RCi0 + 4'b1111; 
assign RCi1 = TMODE ? 1'b0 : RCo1; 
assign {RCo2, TCR_SUM2[3:0]} = TCR_TMP[11:8] + RCi1 + 4'b1111; 
assign RCi2 = TMODE ? 1'b0 : RCo2; 
assign TCR_SUM3[3:0] = TCR_TMP[15:12] + RCi2 + 4'b1111; 

assign TCR_TMPin[15:0] = {TCR_SUM3[3:0], TCR_SUM2[3:0], TCR_SUM1[3:0], TCR_SUM0[3:0]}; 






always @(posedge TIMERCLKg or posedge T_RST) 
begin 
if (T_RST) 
TCR_TMP[15:0] <= #1 16'b0; 
else if (WR_TCR_TMP) 
TCR_TMP[15:0] <= #1 TCR[15:0]; 
else if (RELOAD_TCR) 
TCR_TMP[15:0] <= #1 TPR[15:0]; 
else if (RELOAD_TCR_TMP) 
TCR_TMP[15:0] <= #1 TCR_TMP[15:0]; 
else if(!ICE_ST) 
TCR_TMP[15:0] <= #1 TCR_TMPin[15:0]; 
end 

/*--------------------------------------------------------------*/ 
wire [15:0] TCR_OUT; 

assign TCR_OUT[15:0] = TCR_TMP[15:0]; 

assign TMOUT[15:0] = {16{selTSR}} & {CLKsel, 7'b0, {TSR[7:0]}} 
| {16{selTCR}} & TCR_OUT[15:0] 
| {16{selTPR}} & TPR[15:0]; 




endmodule 
