






`include "x_def.v"





module RXctl1 (/* in */ RST, DSPCLK, GO_Cx, EX_en, SCLKg3_, SCLKg4,
SP_EN, RFSsm, RD, RSack, Rwrap, SLEN,
MWORD, RBUF, FSi_set,
/*expRX[15:0],*/ MTRX_E, DTYPE, DMD,
`ifdef FD_DFT
SCAN_TEST,
`endif
RSreq, ISR, RX, SLOT1_EXT);

`ifdef FD_DFT
input SCAN_TEST;
`endif
input [1:0] DTYPE;
input [4:0] SLEN;
input [15:0] MWORD;
input [15:0] DMD;
input RST,
DSPCLK,
GO_Cx,
EX_en,
SCLKg3_, SCLKg4,
SP_EN,
RFSsm,
RD,
RSack,
Rwrap,
RBUF,
MTRX_E;
input FSi_set;

output [15:0] RX;
output RSreq,
ISR;
output [3:2] SLOT1_EXT;


reg [15:0] RX,
RXSHT;
reg [2:0] RCS, RNS;
reg [4:0] Bcnt;
reg [7:0] Wcnt;
reg a_sync1, a_sync2, b_sync1;
reg ldRX_spt, ldRX_cmp, RSreq, sht2nd, ISRa;
reg TAG_SLOT;

wire [15:0] RX_di, RXSHT_di;
wire ldBcnt, ldWcnt, Bcnteq0, Wcnteq0, Wcnt_dn;
wire ldRXSHT, rawRX_we, RX_we, sRSreq, rRSreq,
ldRX_spt1, zeroext, AUlaw_en;






























assign #`da zeroext = !(|{DTYPE[1:0]});

assign #`da AUlaw_en = DTYPE[1];




parameter RX_idle = 3'b001,
RX_shift = 3'b010,
RX_wstart = 3'b100;


always @(RCS or RFSsm or Bcnteq0 or Wcnteq0)
begin
case (RCS)
RX_idle : RNS <= #`da RFSsm ? RX_shift : RX_idle;
RX_shift : begin
if (Bcnteq0)
RNS <= #`da Wcnteq0 ? RX_idle : RX_wstart;
else
RNS <= #`da RX_shift;
end
RX_wstart : RNS <= #`da RX_shift;
default : RNS <= #`da RX_idle;
endcase
end

`ifdef FD_DFT
wire rst_SP_EN_h = !SP_EN;
wire rst_SP_EN = SCAN_TEST ? RST : rst_SP_EN_h;

`else
wire rst_SP_EN = !SP_EN;
`endif

always @(posedge SCLKg4 or posedge rst_SP_EN) begin
if (rst_SP_EN) RCS <= #`db 3'b001;
else RCS <= #`db RNS;
end


always @(posedge SCLKg4) begin
sht2nd <= #`db (RCS != RX_shift) && (RNS == RX_shift);
end




assign #`da ldBcnt = RNS[0] || RNS[2];
assign #`da Bcnteq0 = !(|Bcnt[4:0]);

always @(posedge SCLKg4)
TAG_SLOT <= #`db MWORD[14] && FSi_set;

always @(posedge SCLKg4 or posedge rst_SP_EN) begin
if (rst_SP_EN) Bcnt[4:0] <= #`db 5'b0;
else if (TAG_SLOT) Bcnt[4:0] <= #`db 5'hf;
else if (ldBcnt) Bcnt[4:0] <= #`db SLEN[4:0];
else Bcnt[4:0] <= #`db Bcnt[4:0] - 1;
end




assign #`da ldWcnt = RNS[0];
assign #`da Wcnt_dn = RNS[2];
assign #`da Wcnteq0 = !(|Wcnt[7:0]);

always @(posedge SCLKg4 or posedge rst_SP_EN) begin
if (rst_SP_EN) Wcnt[7:0] <= #`db 8'b0;
else if (ldWcnt) Wcnt[7:0] <= #`db MWORD[7:0];
else if (Wcnt_dn) Wcnt[7:0] <= #`db Wcnt[7:0] - 1;
end



wire ldLMcnt, LMcnteq0;
reg [4:0] LMcnt;

assign #`da ldLMcnt = RNS[0] || RNS[2];
assign #`da LMcnteq0 = !(|LMcnt[4:0]);

always @(posedge SCLKg4 or posedge rst_SP_EN) begin
if (rst_SP_EN) LMcnt[4:0] <= #`db 5'b0;
else if (ldLMcnt) LMcnt[4:0] <= #`db 5'h10;
else if (LMcnteq0) LMcnt[4:0] <= #`db 5'b0;
else LMcnt[4:0] <= #`db LMcnt[4:0] - 1;
end


wire [3:2] ST_SLOT1_EXT;
reg [3:2] SLOT1_EXT;

assign #`da ST_SLOT1_EXT[3] = (Wcnt == 'd11 && Bcnt == 'd3) ;
assign #`da ST_SLOT1_EXT[2] = (Wcnt == 'd11 && Bcnt == 'd2) ;

always @(posedge SCLKg4 or posedge RST ) begin
if (RST) SLOT1_EXT[3] <= #`db 1'b0;
else if (ST_SLOT1_EXT[3]) SLOT1_EXT[3] <= #`db RD;
else SLOT1_EXT[3] <= #`db SLOT1_EXT[3];
end

always @(posedge SCLKg4 or posedge RST ) begin
if (RST) SLOT1_EXT[2] <= #`db 1'b0;
else if (ST_SLOT1_EXT[2]) SLOT1_EXT[2] <= #`db RD;
else SLOT1_EXT[2] <= #`db SLOT1_EXT[2];
end












































assign #`da ldRXSHT = !LMcnteq0 && (RFSsm || !RCS[0]);

assign #`da RXSHT_di[15:0] = sht2nd ? (zeroext ? {14'b0, RXSHT[0], RD}
: {{15{RXSHT[0]}}, RD})
: {RXSHT[14:0], RD};

always @(posedge SCLKg3_)
if (ldRXSHT) RXSHT[15:0] <= #`db RXSHT_di[15:0];




assign #`da rawRX_we = MTRX_E && EX_en && GO_Cx ||
ldRX_spt1;

assign #`da RX_we = rawRX_we;

assign #`da RX_di = ldRX_spt1 ? RXSHT[15:0] : DMD[15:0];

always @(posedge DSPCLK)
if (RX_we) RX[15:0] <= #`db RX_di;






























always @(posedge SCLKg3_) ldRX_spt <= #`db RCS[1] && !RNS[1];

always @(posedge DSPCLK) begin
a_sync1 <= #`db ldRX_spt;
a_sync2 <= #`db a_sync1;
end

assign #`da ldRX_spt1 = a_sync1 && !a_sync2;

























Delaya d1 (RSack, delRSack);

assign #`da sRSreq = SP_EN && RBUF && rawRX_we;

`ifdef FD_DFT
wire rRSreq_h = (RST || delRSack);
assign rRSreq = SCAN_TEST ? RST : rRSreq_h;
`else
assign #`da rRSreq = RST || delRSack;
`endif

always @(posedge DSPCLK or posedge rRSreq) begin
if (rRSreq) RSreq <= #`db 1'b0;
else if (sRSreq) RSreq <= #`db 1'b1;
end























always @(posedge DSPCLK)
ISRa <= #`db SP_EN && ldRX_spt1;

assign #`da ISR = RBUF ? Rwrap : ISRa;


endmodule
