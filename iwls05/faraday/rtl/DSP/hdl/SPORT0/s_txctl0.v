`include "delaya.v"






`include "x_def.v"





module TXctl0 (/* in */ RST, DSPCLK, GO_Cx, EX_en, SCLKg5, SCLKg6,
SP_EN, SP_ENg, TFSsm, TSack, Twrap, SLEN,
MWORD, TBUF, logTX, MTTX_E,
DMD, AUlaw_en, SLEN_ex, FSi_set,
`ifdef FD_DFT
SCAN_TEST,
`endif
TD, TSreq, IST, TX, SLOT_NUM);

`ifdef FD_DFT
input SCAN_TEST;
`endif

input [4:0] SLEN;
input [15:0] MWORD;
input [7:0] logTX;
input [15:0] DMD;
input RST,
DSPCLK,
GO_Cx,
EX_en,
SCLKg5, SCLKg6,
SP_EN,
SP_ENg,
SLEN_ex,
TFSsm,
TSack,
Twrap,
TBUF,
MTTX_E,
AUlaw_en;
input FSi_set;

output [15:0] TX;
output TD,
TSreq,
IST;
output [3:0] SLOT_NUM;

reg [15:0] TX,
TXSHT;
reg [2:0] TCS, TNS;
reg [4:0] Bcnt;
reg [7:0] Wcnt;
reg b_sync1, c_sync1, c_sync2, ldTX_cmp, TSreqi,
TSreq, ISTai;
reg TAG_SLOT;

wire [15:0] TX_di, TXSHT_di;
wire ldBcnt, ldWcnt, Bcnteq0, Wcnteq0, Wcnt_dn;
wire rawTX_we, TX_we, ISTa, sTSreq, rTSreq;






























parameter TX_idle = 3'b001,
TX_shift = 3'b010,
TX_wstart = 3'b100;


always @(TCS or TFSsm or Bcnteq0 or Wcnteq0)
begin
case (TCS)
TX_idle : TNS <= #`da TFSsm ? TX_shift : TX_idle;
TX_shift : begin
if (Bcnteq0)
TNS <= #`da Wcnteq0 ? TX_idle : TX_wstart;
else
TNS <= #`da TX_shift;
end
TX_wstart : TNS <= #`da TX_shift;
default : TNS <= #`da TX_idle;
endcase
end

`ifdef FD_DFT
wire rst_SP_ENg_h = !SP_ENg ;
wire rst_SP_ENg = SCAN_TEST ? RST : rst_SP_ENg_h;
`else
wire rst_SP_ENg = !SP_ENg;
`endif

always @(posedge SCLKg5 or posedge rst_SP_ENg) begin
if (rst_SP_ENg) TCS <= #`db 3'b001;
else TCS <= #`db TNS;
end




assign #`da ldBcnt = TNS[0] || TNS[2];
assign #`da Bcnteq0 = !(|Bcnt[4:0]);
always @(posedge SCLKg5)
TAG_SLOT <= #`db MWORD[14] && FSi_set;

always @(posedge SCLKg5 or posedge rst_SP_ENg) begin
if (rst_SP_ENg) Bcnt[4:0] <= #`db 5'b0;
else if (TAG_SLOT) Bcnt[4:0] <= #`db 5'hf;
else if (ldBcnt) Bcnt[4:0] <= #`db SLEN[4:0];
else Bcnt[4:0] <= #`db Bcnt[4:0] - 1;
end




assign #`da ldWcnt = TNS[0];
assign #`da Wcnt_dn = TNS[2];
assign #`da Wcnteq0 = !(|Wcnt[7:0]);
assign #`da SLOT_NUM[3:0] = Wcnt[3:0];

always @(posedge SCLKg5 or posedge rst_SP_ENg) begin
if (rst_SP_ENg) Wcnt[7:0] <= #`db 8'b0;
else if (ldWcnt) Wcnt[7:0] <= #`db MWORD[7:0];
else if (Wcnt_dn) Wcnt[7:0] <= #`db Wcnt[7:0] - 1;
end

































assign #`da TXSHT_di[15:0] = TNS[1] ? {TXSHT[14:0], 1'b0}
: TX[15:0];

always @(posedge SCLKg6) TXSHT[15:0] <= #`db TXSHT_di[15:0];

wire [3:0] slen_msb = SLEN[3:0];
assign #`d0 TD = SLEN_ex ? TXSHT[15] : TXSHT[slen_msb];




assign #`da rawTX_we = MTTX_E && EX_en && GO_Cx ||
TSack;

assign #`da TX_we = rawTX_we ||
ldTX_cmp;

assign #`da TX_di = ldTX_cmp ? {{8{logTX[7]}}, logTX[7:0]} : DMD[15:0];

always @(posedge DSPCLK) if (TX_we) TX[15:0] <= #`db TX_di;




























always @(posedge DSPCLK) begin
b_sync1 <= #`db rawTX_we;
ldTX_cmp <= #`db b_sync1 && AUlaw_en/* && SP_EN*/;
end











Delaya d1 (TSack, delTSack);

reg SP_EN_D1;
wire SP_EN_1T;

always @(posedge DSPCLK) SP_EN_D1 <= #`db SP_EN;
assign #`da SP_EN_1T = SP_EN && !SP_EN_D1;

`ifdef FD_DFT
wire rTSreq_h = (RST || delTSack);
assign rTSreq = SCAN_TEST ? RST : rTSreq_h;
`else
assign #`da rTSreq = RST || delTSack;
`endif

assign #`da sTSreq = SP_ENg && TBUF && !TCS[1] && TNS[1];

always @(posedge SCLKg5 or posedge rTSreq) begin
if (rTSreq) TSreqi <= #`db 1'b0;
else if (sTSreq) TSreqi <= #`db 1'b1;
end

always @(posedge DSPCLK or posedge rTSreq) begin
if (rTSreq) TSreq <= #`db 1'b0;
else TSreq <= #`db TSreqi || (SP_EN_1T && MWORD[14]);

end

















always @(posedge SCLKg5 or posedge RST)
if (RST) ISTai <= #`db 1'b0;
else ISTai <= #`db SP_ENg && (!TCS[1] && TNS[1]);

always @(posedge DSPCLK) begin
c_sync1 <= #`db ISTai;
c_sync2 <= #`db c_sync1;
end

assign #`da ISTa = c_sync1 && !c_sync2;

assign #`da IST = TBUF ? Twrap : ISTa;


endmodule
