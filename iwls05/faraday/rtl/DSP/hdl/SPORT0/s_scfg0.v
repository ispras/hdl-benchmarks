`include "x_def.v"





module SCFG0 (/* in */ RST, DSPCLK, SP_EN, FSDIV, SCLKDIV,
ISCLK, FSD, FSW, ITFS, IRFS, INVTFS, INVRFS,
SLEN, INVxSCLK, AC97_MODE, MWORD_13,
`ifdef FD_DFT
SCAN_TEST,
`endif

SP_ENg, RFSsm, TFSsm, SCLKg3_, SCLKg4, SCLKg5,
SCLKg6, FSi_set,
SCLKo, T_SCLK, RFSi, T_RFS, TFSi, T_TFS);

input [15:0] FSDIV,
SCLKDIV;
input [4:0] SLEN;
input [1:0] FSD;
input RST,
DSPCLK,
SP_EN,
ISCLK,
FSW,
ITFS,
IRFS,
INVTFS,
INVRFS,
INVxSCLK,
T_SCLK,
T_RFS,
T_TFS;
input AC97_MODE;
input MWORD_13;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output SCLKo,
RFSi,
TFSi,
SP_ENg,
SCLKg3_, SCLKg4,
SCLKg5, SCLKg6,
RFSsm,
TFSsm;
output FSi_set;

reg [15:0] SCLKi_cnt, FSi_cnt;
reg FSi, RFSg_d1, RFSg_d2, RFSg_d3, TFSg_d1,
TFSg_d2, TFSg_d3, FS_s1, FS_s2, SP_ENg;
reg SP_ENg_D1;

wire SCLKi_chg, FSi_clr, RFSgi, TFSgi, SCLKo,
RFSg, TFSg, FSfall, SCLKg, SCLKg1, SCLKg2;
wire FIRST_FS, T_SCLKi;






















wire SCLKin;

reg SCLKi_enb;
always @(posedge DSPCLK) SCLKi_enb <= #`db !((SP_ENg || SP_EN) && ISCLK);


`ifdef FD_GTCLK
`ifdef FD_DFT
wire SCLKi_enb_dft;
GTECH_AND_NOT utm1 (.Z(SCLKi_enb_dft), .A(SCLKi_enb), .B(SCAN_TEST));
GtCLK_NOR2 uck0 (.Z(SCLKin_), .A(DSPCLK), .B(SCLKi_enb_dft));
GtCLK_NOT ckSCLKin (.Z(SCLKin), .A(SCLKin_));
`else
GtCLK_NOR2 uck0 (.Z(SCLKin_), .A(DSPCLK), .B(SCLKi_enb));
GtCLK_NOT ckSCLKin (.Z(SCLKin), .A(SCLKin_));
`endif

`else
assign #`d0 SCLKin = DSPCLK;
`endif

assign #`da SCLKi_chg = (SCLKi_cnt[15:0] == SCLKDIV[15:0]) || !SP_ENg;

always @(posedge SCLKin or posedge RST) begin
if (RST) SCLKi_cnt[15:0] <= #`db 16'b0;
else if (SCLKi_chg) SCLKi_cnt[15:0] <= #`db 16'b0;
else SCLKi_cnt[15:0] <= #`db SCLKi_cnt + 1;
end

reg SCLKi_h;
wire SCLKi;
always @(posedge SCLKin or posedge RST) begin
if (RST) SCLKi_h <= #`db 1'b0;
else if (SCLKi_chg) SCLKi_h <= #`db !SCLKi;
end

assign SCLKi = SCLKi_h;

assign #`da SCLKo = INVxSCLK ^ SCLKi;

`ifdef FD_DFT
assign #`da T_SCLKi = SCAN_TEST ? T_SCLK : INVxSCLK ^ T_SCLK;
`else
assign #`da T_SCLKi = INVxSCLK ^ T_SCLK;
`endif






`ifdef FD_FPGA
`ifdef FD_EVB
wire SCLKgi;
assign #`da SCLKgi = ISCLK ? SCLKi : T_SCLKi;
BUFG sclk0 (.I(SCLKgi), .O(SCLKg));
`else
assign #`da SCLKg = ISCLK ? SCLKi : T_SCLKi;
`endif
assign #`da SCLKg1 = SCLKg;
assign #`da SCLKg2 = SCLKg;
assign #`da SCLKg3_ = !SCLKg;
assign #`da SCLKg4 = SCLKg;
assign #`da SCLKg5 = SCLKg;
assign #`da SCLKg6 = SCLKg;
`else
`ifdef FD_DFT
wire ISCLK_dft;
assign ISCLK_dft = ISCLK && !SCAN_TEST;
GtCLK_MUX2 uu0 (.Z(SCLKg), .S(ISCLK_dft), .A(T_SCLKi), .B(SCLKi));
`else
GtCLK_MUX2 uu0 (.Z(SCLKg), .S(ISCLK), .A(T_SCLKi), .B(SCLKi));
`endif
GtCLK_NOT uu1 (.Z(SCLKga_), .A(SCLKg));
GtCLK_NOT uu2 (.Z(SCLKg3_), .A(SCLKg));
GtCLK_NOT uu3 (.Z(SCLKgc_), .A(SCLKg));

GtCLK_NOT uu4 (.Z(SCLKg1), .A(SCLKga_));
GtCLK_NOT uu5 (.Z(SCLKg2), .A(SCLKga_));

GtCLK_NOT uu6 (.Z(SCLKg4), .A(SCLKg3_));

GtCLK_NOT uu7 (.Z(SCLKg5), .A(SCLKgc_));
GtCLK_NOT uu8 (.Z(SCLKg6), .A(SCLKgc_));
`endif





















































assign #`da FSi_set = SP_ENg && SP_EN && ((FSi_cnt[15:0] == FSDIV[15:0])
|| !(IRFS || ITFS));

always @(posedge SCLKg1 or posedge RST) begin
if (RST) FSi_cnt[15:0] <= #`db 16'b0;
else if ( FIRST_FS) FSi_cnt[15:0] <= #`db FSDIV[15:0];
else if ( FSi_set) FSi_cnt[15:0] <= #`db 16'b0;
else if ( SP_ENg ) FSi_cnt[15:0] <= #`db FSi_cnt + 1;
else FSi_cnt[15:0] <= #`db FSi_cnt;
end




assign #`da FSi_clr = !FSW ||
(FSi_cnt[4:0] == SLEN[4:0]) ||
(AC97_MODE && FSi_cnt[4:0] == 'hf) ||
!SP_ENg;


always @(posedge SCLKg2 or posedge RST) begin
if (RST) FSi <= #`db 1'b0;
else if (FSi && FSi_clr) FSi <= #`db 1'b0;
else if (FSi_set) FSi <= #`db 1'b1;
end




wire AC97_RST;
assign #`da AC97_RST = AC97_MODE && MWORD_13;

assign #`da RFSi = FSi ^ INVRFS || AC97_RST;
assign #`da TFSi = FSi ^ INVTFS || AC97_RST;












assign #2.0 RFSgi = INVRFS ^ (IRFS ? RFSi : T_RFS);
assign #2.0 TFSgi = INVTFS ^ (ITFS ? TFSi : T_TFS);

















always @(posedge SCLKg2 or posedge RST) begin
if (RST) SP_ENg <= #`db 0;

else SP_ENg <= #`db SP_EN;
end

always @(posedge SCLKg2) begin
SP_ENg_D1 <= #`db SP_ENg;
end

reg RFSgi_d, TFSgi_d;
always @(posedge SCLKg2 or posedge RST) begin
if (RST) RFSgi_d <= 1'b0;
else RFSgi_d <= RFSgi;
end

always @(posedge SCLKg2 or posedge RST) begin
if (RST) TFSgi_d <= #`db 1'b0;
else TFSgi_d <= #`db TFSgi;
end

assign #`da RFSg = SP_ENg && RFSgi && !RFSgi_d;
assign #`da TFSg = SP_ENg && TFSgi && !TFSgi_d;

assign #`da FIRST_FS = !SP_ENg_D1 && SP_ENg;



always @(posedge SCLKg2 or posedge RST) begin
if (RST) begin
RFSg_d1 <= #`db 1'b0;
RFSg_d2 <= #`db 1'b0;
RFSg_d3 <= #`db 1'b0;
TFSg_d1 <= #`db 1'b0;
TFSg_d2 <= #`db 1'b0;
TFSg_d3 <= #`db 1'b0;
end
else begin
RFSg_d1 <= #`db RFSg;
RFSg_d2 <= #`db RFSg_d1;
RFSg_d3 <= #`db RFSg_d2;
TFSg_d1 <= #`db TFSg;
TFSg_d2 <= #`db TFSg_d1;
TFSg_d3 <= #`db TFSg_d2;
end
end

assign #`da RFSsm = (FSD[1:0] == 2'b00) ? RFSg :
(FSD[1:0] == 2'b01) ? RFSg_d1 :
(FSD[1:0] == 2'b10) ? RFSg_d2 : RFSg_d3;

assign #`da TFSsm = (FSD[1:0] == 2'b00) ? TFSg :
(FSD[1:0] == 2'b01) ? TFSg_d1 :
(FSD[1:0] == 2'b10) ? TFSg_d2 : TFSg_d3;


endmodule
