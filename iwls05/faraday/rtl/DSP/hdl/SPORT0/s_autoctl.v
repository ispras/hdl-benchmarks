






`include "x_def.v"





module AUTOctl (/* -------- Inputs : --------- */
T_RST, DSPCLK, GO_Ex, MFRX0_E, MFTX0_E,
MFRX1_E, MFTX1_E, MFSPT_E,
ICE_ST,
STBY,

DSreqi, DWRcyc, PWRcyc, /*CWRcyc,*/
DRDcyc, PRDcyc, /*CRDcyc,*/ BOOT,
T0Sreqi, R0Sreqi, RX0, TX0,
T1Sreqi, R1Sreqi, RX1, TX1,
BSreqi, BDMRD_cyc, BDMWR_cyc, BPMRD_cyc,
BPMWR_cyc, BM_cyc, ECYC,
`ifdef FD_DFT
SCAN_TEST,
`endif

STEAL, SREQ,
DMSreqx_wr, PMSreqx_wr, /*CMSreqx_wr,*/
DMSreqx_rd, PMSreqx_rd, /*CMSreqx_rd,*/
DSack, DSreqx,
T0Sreqx, R0Sreqx, T0Sack, R0Sack,
T1Sreqx, R1Sreqx, T1Sack, R1Sack,
spt0DMD_oe, spt1DMD_oe,
BSack, BSreqx,


autoDMD_do);
`ifdef FD_DFT
input SCAN_TEST;
`endif

input BSreqi,
BDMRD_cyc,
BDMWR_cyc,
BPMRD_cyc,
BPMWR_cyc,
BM_cyc,
ECYC;

input [15:0] RX0, RX1, TX0, TX1;
input T_RST,
DSPCLK,
GO_Ex,
STBY,
BOOT,
ICE_ST,


T0Sreqi,
R0Sreqi,
T1Sreqi,
R1Sreqi,
DSreqi,
DWRcyc,
PWRcyc,

DRDcyc,
PRDcyc;

input MFRX0_E, MFTX0_E, MFRX1_E,
MFTX1_E, MFSPT_E;

output STEAL,
SREQ,
T0Sack,
R0Sack,
T1Sack,
R1Sack,
DSack,
DSreqx,
T0Sreqx,
R0Sreqx,
T1Sreqx,
R1Sreqx,
spt0DMD_oe,
spt1DMD_oe,
PMSreqx_wr,
DMSreqx_wr,

PMSreqx_rd,
DMSreqx_rd,

BSack,
BSreqx;

output [15:0] autoDMD_do;


reg STEAL, DSack, T0Sack, R0Sack, T1Sack, R1Sack, BSack;

wire [15:0] DMD_do;
wire T0Sreqx, R0Sreqx, T1Sreqx, R1Sreqx, GO_SPT;
wire T0Sreq, R0Sreq, T1Sreq, R1Sreq, DSreq;
wire BSreq, BSreqx, SREQ_bdma;




assign #`da T0Sreq = T0Sreqi && !ICE_ST;
assign #`da R0Sreq = R0Sreqi && !ICE_ST;
assign #`da T1Sreq = T1Sreqi && !ICE_ST;
assign #`da R1Sreq = R1Sreqi && !ICE_ST;
assign #`da DSreq = DSreqi;
assign #`da BSreq = BSreqi && !ICE_ST;



assign #`da DMD_do[15:0] = {16{MFRX0_E}} & RX0[15:0] |
{16{MFTX0_E}} & TX0[15:0] |
{16{MFRX1_E}} & RX1[15:0] |
{16{MFTX1_E}} & TX1[15:0];



assign #`da autoDMD_do[15:0] = {16{MFSPT_E}} & DMD_do[15:0];






























`ifdef FD_DFT
reg RST_h;
wire RST;
always @(posedge DSPCLK) RST_h <= #`db T_RST;
assign RST = SCAN_TEST ? T_RST : RST_h;
`else
reg RST;
always @(posedge DSPCLK) RST <= #`db T_RST;
`endif

assign #`da GO_SPT = GO_Ex || STEAL || STBY || BM_cyc && ECYC;

assign #`da SREQ = (GO_SPT || BOOT) && (
T0Sreq ||
R0Sreq ||
T1Sreq ||
R1Sreq ||
DSreq ||
BSreq);

always @(posedge DSPCLK or posedge RST)
begin
if (RST) STEAL <= #`db 1'b0;
else STEAL <= #`db SREQ;
end






assign #`da T0Sreqx = T0Sreq;
assign #`da R0Sreqx = R0Sreq && !T0Sreq;
assign #`da T1Sreqx = T1Sreq && !(T0Sreq || R0Sreq);
assign #`da R1Sreqx = R1Sreq && !(T0Sreq || R0Sreq || T1Sreq);
assign #`da DSreqx = DSreq && !(T0Sreq || R0Sreq || T1Sreq || R1Sreq);
assign #`da BSreqx = BSreq && !(T0Sreq || R0Sreq || T1Sreq || R1Sreq || DSreq);




always @(posedge DSPCLK or posedge RST)
begin
if (RST) T0Sack <= #`db 1'b0;
else if (T0Sack) T0Sack <= #`db 1'b0;
else if (GO_SPT) T0Sack <= #`db T0Sreqx;
end

always @(posedge DSPCLK or posedge RST)
begin
if (RST) R0Sack <= #`db 1'b0;
else if (R0Sack) R0Sack <= #`db 1'b0;
else if (GO_SPT) R0Sack <= #`db R0Sreqx;
end

always @(posedge DSPCLK or posedge RST)
begin
if (RST) T1Sack <= #`db 1'b0;
else if (T1Sack) T1Sack <= #`db 1'b0;
else if (GO_SPT) T1Sack <= #`db T1Sreqx;
end

always @(posedge DSPCLK or posedge RST)
begin
if (RST) R1Sack <= #`db 1'b0;
else if (R1Sack) R1Sack <= #`db 1'b0;
else if (GO_SPT) R1Sack <= #`db R1Sreqx;
end

assign #`da spt0DMD_oe = R0Sreqx && GO_SPT;
assign #`da spt1DMD_oe = R1Sreqx && GO_SPT;


always @(posedge DSPCLK or posedge RST)
begin
if (RST) DSack <= #`db 1'b0;
else if (DSack) DSack <= #`db 1'b0;
else if (GO_SPT || BOOT || ICE_ST)
DSack <= #`db DSreqx;
end

always @(posedge DSPCLK or posedge RST)
begin
if (RST) BSack <= #`db 1'b0;
else if (BSack) BSack <= #`db 1'b0;
else if (GO_SPT || BOOT) BSack <= #`db BSreqx;
end













assign #`da DMSreqx_wr =
R0Sreqx ||
R1Sreqx ||
DSreqx && DWRcyc ||
BSreqx && BDMRD_cyc;

assign #`da DMSreqx_rd = T0Sreqx ||
T1Sreqx ||
DSreqx && DRDcyc ||
BSreqx && BDMWR_cyc;

assign #`da PMSreqx_wr =
DSreqx && PWRcyc ||
BSreqx && BPMRD_cyc;

assign #`da PMSreqx_rd = DSreqx && PRDcyc ||
BSreqx && BPMWR_cyc;


endmodule
