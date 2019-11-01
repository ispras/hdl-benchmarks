






`include "../../include/x_def.v"





module BDMA (/* ---------- Inputs : ---------- */
 BSreqx, BSack,
 X_MMAP, X_BMODE, T_ED, T_RSTn,
GRST, PM_bdry_sel,
 ENS12, ECS12, ENS13, ECS13,
ENS14, ECS14, ENS0,
 DSPCLK, CM_rd, PMDin,
DMDin,
 BOOT, GO_STEAL,
 BCNT_we, BCTL_we, BOVL_we, BIAD_we,
BEAD_we, selBCNT, selBCTL, selBOVL,
selBIAD, selBEAD,
`ifdef FD_DFT
 SCAN_TEST,
`endif



 BDMWR_cyc, BPMWR_cyc, BDMRD_cyc,
BPMRD_cyc, BSreq,
 BDMAmode, BMpage, BEAD,
BWdataBUF, BDIR, BWRn,
BWend,
 BDMA_end, BDMA_boot, BCM_cyc, BCMRD_cyc,
BRdataBUF, BOVL, BM_cyc,
 T_BDMA, BPM_cyc, BDM_cyc,
BIAD, BRST,
 BDMAmmio, bdmaDMD_oe, bdmaPMD_oe
);

input [23:0] CM_rd;
input [15:0] PMDin;
input [15:0] DMDin;
input [7:0] T_ED;
input X_MMAP,
X_BMODE,
GO_STEAL,
PM_bdry_sel,

T_RSTn,
GRST,
BSreqx,
BSack,
ENS12,
ECS12,
ENS13,
ECS13,
ENS14,
ECS14,
ENS0,


DSPCLK,
BOOT,
BCNT_we,
BCTL_we,
BOVL_we,
BIAD_we,
BEAD_we,
selBCNT,
selBCTL,
selBOVL,
selBIAD,
selBEAD;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output [23:0] BRdataBUF;
output [7:0] BWdataBUF;
output [15:0] BDMAmmio;
output [13:0] BEAD, BIAD;
output [7:0] BMpage;
output [11:0] BOVL;


output BDMAmode,
BDMA_boot,
BDMA_end,
BSreq,
BDIR,
BWRn,
BDMWR_cyc,
BPMWR_cyc,
BDMRD_cyc,
BPMRD_cyc,
BCMRD_cyc,
bdmaDMD_oe,
bdmaPMD_oe,
BCM_cyc,
BPM_cyc,
BDM_cyc,
T_BDMA,
BRST,
BM_cyc,
BWend;


reg BDMA_boot, BDMAmode, BSreq, BMcyc_del, BM_cyc,
BWRn, WRlat, DM_2nd, BRST_s2;

reg [23:0] BRdataBUF;
reg [7:0] BWdataBUF;
reg [15:0] BCTL;
reg [13:0] BWCOUNT, BIAD, BEAD;
reg [11:0] BOVL;
reg [1:0] CMcnt;


wire BDMA_end, BDIR, RDlat, set_BSreq,
BDM_en, BPM_en, rst_BSreq, BDMACLK,
BCM_en, BPCM_en, BCM_cyc,
pullH_WR, BPM_cyc, BDM_cyc,
load_BRH, BWcnt_end,
load_BRM, load_BRL, load_BWH, load_BWM,
load_BWL, BRDcyc, Word_OK, BCMRD_cyc, BPMRD_cyc,
CMWord_OK, PMWord_OK, CMcnteq0, CMcnteq1,
CMcnteq2, BDMRD_cyc, DMWord_OK, DM_fullW,
MSB_align, LSB_align, T_BDMA, BRST_s1, BRST,
BCMWR_cyc, BPMWR_cyc, BDMWR_cyc, BWRcyc, BM_begin,
bdmaDMD_oe, bdmaPMD_oe;
wire selCM, selPM;
reg [23:0] BWdataBUF_h;
wire [15:0] BDMAmmio;
wire [7:0] BMpage;
wire [4:0] BMWAIT;


`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_OR2 utm0 (.Z(BDMACLK_enb), .A(BDMAmode), .B(SCAN_TEST));
GtCLK_OR_NOT ckBDMA (.Z(BDMACLK), .B(BDMACLK_enb), .A(DSPCLK));
`else
GtCLK_OR_NOT ckBDMA (.Z(BDMACLK), .B(BDMAmode), .A(DSPCLK));
`endif
`else
assign #`da BDMACLK = DSPCLK;
`endif




`ifdef FD_DFT
reg RST_pin_h, RST_h;
wire RST_pin, RST;
always @(posedge DSPCLK) RST_pin_h <= #`db !T_RSTn;
always @(posedge DSPCLK) RST_h <= #`db GRST;

assign RST_pin = SCAN_TEST ? !T_RSTn : RST_pin_h;
assign RST = SCAN_TEST ? GRST : RST_h;

`else
reg RST_pin, RST;
always @(posedge DSPCLK) RST_pin <= #`db !T_RSTn;
always @(posedge DSPCLK) RST <= #`db GRST;
`endif

always @(posedge DSPCLK or posedge RST) begin
if(RST) BDMAmode <= #`db 1'b0;
else if (BDMA_end) BDMAmode <= #`db 1'b0;
else BDMAmode <= #`db |{BWCOUNT[13:0]};
end

always @(posedge DSPCLK or posedge RST_pin)
if (RST_pin) BDMA_boot <= #`db !(X_MMAP || X_BMODE);
else if (BDMA_end) BDMA_boot <= #`db 1'b0;

assign #`da BDMA_end = Word_OK && (BWCOUNT == 13'h1);


always @(posedge DSPCLK)
BM_cyc <= #`db ENS12 | ENS13 | ENS14;

always @(posedge DSPCLK) BMcyc_del <= #`db BM_cyc;

assign #`da BM_begin = BM_cyc && !BMcyc_del;





always @(posedge DSPCLK or posedge RST_pin) begin
if(RST_pin)
BWCOUNT[13:0] <= #`db {8'b0, !(X_MMAP || X_BMODE), 5'b0};

else if (BCNT_we) BWCOUNT[13:0] <= #`db DMDin[13:0];
else if (Word_OK) BWCOUNT[13:0] <= #`db BWCOUNT[13:0] - 1;
end



always @(posedge DSPCLK or posedge RST) begin
if(RST) BCTL[15:0] <= #`db 16'h00f8;
else if (BCTL_we) BCTL[15:0] <= #`db (DMDin[7:4] == 4'h0) ?
{DMDin[15:8], 4'b1111, DMDin[3:0]} :
DMDin[15:0];
end

assign #`d0 BDIR = BCTL[2];

assign #`da BMpage[7:0] = BCTL[15:8];

always @(posedge DSPCLK or posedge RST) begin
if(RST) BOVL[11:0] <= #`db 12'h0;
else if (BOVL_we) BOVL[11:0] <= #`db DMDin[11:0];
end



assign #`da BDM_en = |{BCTL[1:0]} && BDMAmode && BM_cyc;

assign #`da selCM = PM_bdry_sel ? (BIAD[13] == 1'b0) :
!(BIAD[13:12] == 2'b11);

assign #`da selPM = PM_bdry_sel ? (BIAD[13] == 1'b1) :
(BIAD[13:12] == 2'b11);

assign #`da BPM_en = !(|{BCTL[1:0]}) && selPM && BDMAmode && BM_cyc;

assign #`da BCM_en = !(|{BCTL[1:0]}) && selCM && BDMAmode && BM_cyc;

assign #`da BPCM_en = BPM_en || BCM_en;





wire BWcnt_en, BWcnt_clr, BWend;
reg [4:0] BWcnt;

assign #`da BMWAIT[4:0] = BDIR ? {BCTL[7:4], 1'b1} : {1'b1, BCTL[7:4]};

assign #`da BWend = (BWcnt[4:0] == BMWAIT[4:0]);
assign #`da BWcnt_en = ECS12 && !BSreq;
assign #`da BWcnt_clr = ENS0;

always @(posedge DSPCLK or posedge RST) begin
if (RST) BWcnt[4:0] <= #`db 5'h0;
else if (BWcnt_clr) BWcnt[4:0] <= #`db 5'h0;
else if (BWcnt_en) BWcnt[4:0] <= #`db BWcnt + 1;
end


assign #`da BWcnt_end = (ECS13 || ECS14) && ENS0;



always @(posedge DSPCLK or posedge RST) begin
if (RST) BIAD[13:0] <= #`db 14'b0;
else if(BIAD_we) BIAD[13:0] <= #`db DMDin[13:0];
else if(Word_OK) BIAD[13:0] <= #`db BIAD[13:0] + 1;
end



always @(posedge DSPCLK or posedge RST) begin
if (RST) BEAD[13:0] <= #`db 14'h0;
else if(BEAD_we) BEAD[13:0] <= #`db DMDin[13:0];
else if(BWcnt_end) BEAD[13:0] <= #`db BEAD[13:0] +
{BPM_en && CMcnteq1,
!(BPM_en && CMcnteq1)};
end

assign #`da pullH_WR = BDIR && (BWcnt == BCTL[7:4] + 3);

always @(posedge BDMACLK or posedge RST) begin
if (RST) BWRn <= #`db 1'b1;
else if(pullH_WR) BWRn <= #`db 1'b1;
else if(WRlat) BWRn <= #`db 1'b0;

end



assign #`da set_BSreq = BDIR && BDMAmode ? BM_begin && BWRcyc :
RDlat && BRDcyc;
`ifdef FD_DFT
wire rst_BSreq_h;
assign #`da rst_BSreq_h = (RST || BSack);
assign #`da rst_BSreq = SCAN_TEST ? RST : rst_BSreq_h;

`else
assign #`da rst_BSreq = RST || BSack;
`endif

always @(posedge DSPCLK or posedge rst_BSreq) begin
if(rst_BSreq) BSreq <= #`db 1'b0;
else if (set_BSreq) BSreq <= #`db 1'b1;
end





assign #`da RDlat = (BWcnt == BMWAIT[4:0]) && !BDIR;



assign #`da load_BRH = RDlat && BPCM_en && CMcnteq0;
assign #`da load_BRM = RDlat && ((BPCM_en && CMcnteq1) ||
(DM_fullW && !DM_2nd) ||
MSB_align) ;
assign #`da load_BRL = RDlat && ((BCM_en && CMcnteq2) ||
(DM_fullW && DM_2nd) ||
LSB_align) ;

always @(posedge BDMACLK) begin
if (load_BRH) BRdataBUF[23:16] <= #`db T_ED[7:0];
else if (load_BRM) BRdataBUF[15: 8] <= #`db T_ED[7:0];
else if (load_BRL) BRdataBUF[ 7: 0] <= #`db T_ED[7:0];
else if (LSB_align) BRdataBUF[15: 8] <= #`db 8'h0;
else if (MSB_align) BRdataBUF[ 7: 0] <= #`db 8'h0;
end



always @(posedge BDMACLK) WRlat <= #`db (BWcnt == 5'h3) && BDIR && BM_cyc;

always @(posedge BDMACLK) begin
if(BSack) BWdataBUF_h[23:0] <= #`db {24{BCMWR_cyc}} & CM_rd[23:0] |
{{16{BPMWR_cyc}} & PMDin[15:0], 8'b0} |
{8'b0, {16{BDMWR_cyc}} & DMDin[15:0]} ;
end

assign #`da load_BWH = WRlat && BPCM_en && CMcnteq0;
assign #`da load_BWM = WRlat && ((BPCM_en && CMcnteq1) ||
(DM_fullW && !DM_2nd) ||
MSB_align) ;
assign #`da load_BWL = WRlat && ((BCM_en && CMcnteq2) ||
(DM_fullW && DM_2nd) ||
LSB_align) ;


always @(posedge BDMACLK) begin
if (load_BWH) BWdataBUF[7:0] <= #`db BWdataBUF_h[23:16];
else if (load_BWM) BWdataBUF[7:0] <= #`db BWdataBUF_h[15:8];
else if (load_BWL) BWdataBUF[7:0] <= #`db BWdataBUF_h[7:0];
end



assign #`da BRDcyc = BSreq || BCMRD_cyc || BPMRD_cyc || BDMRD_cyc ;

assign #`da BWRcyc = BCMWR_cyc || BPMWR_cyc || BDMWR_cyc;

assign #`da Word_OK = CMWord_OK || PMWord_OK || DMWord_OK;

assign #`da BCMRD_cyc = BCM_en && CMcnteq2 && !BDIR;
assign #`da BPMRD_cyc = BPM_en && CMcnteq1 && !BDIR;

assign #`da BCMWR_cyc = BCM_en && CMcnteq0 && BDIR;
assign #`da BPMWR_cyc = BPM_en && CMcnteq0 && BDIR;

assign #`da BCM_cyc = BCMRD_cyc || BCMWR_cyc;
assign #`da BPM_cyc = BPMRD_cyc || BPMWR_cyc;

assign #`da CMWord_OK = BWcnt_end && BCM_en && CMcnteq2;
assign #`da PMWord_OK = BWcnt_end && BPM_en && CMcnteq1;

always @(posedge BDMACLK or posedge RST) begin
if (RST) CMcnt[1:0] <= #`db 2'h0;
else if (CMWord_OK || PMWord_OK)
CMcnt[1:0] <= #`db 2'h0;
else if (BWcnt_end && BPCM_en)
CMcnt[1:0] <= #`db CMcnt[1:0] + 1;
end

assign #`da CMcnteq0 = (CMcnt[1:0] == 2'h0);
assign #`da CMcnteq1 = (CMcnt[1:0] == 2'h1);
assign #`da CMcnteq2 = (CMcnt[1:0] == 2'h2);



assign #`da BDM_cyc = BDMRD_cyc || BDMWR_cyc;

assign #`da BDMRD_cyc = !BDIR && BDM_en && (BCTL[1] ? 1'b1 : DM_2nd);

assign #`da BDMWR_cyc = BDIR && BDM_en && (BCTL[1] ? 1'b1 : !DM_2nd);

assign #`da DMWord_OK = BDM_en && (BCTL[1] ? BWcnt_end : DM_2nd && BWcnt_end) ;



always @(posedge BDMACLK or posedge RST ) begin
if (RST) DM_2nd <= #`db 1'b0;
else if (BWcnt_end && BDM_en) DM_2nd <= #`db !DM_2nd;
end

assign #`da DM_fullW = !BCTL[1] && BCTL[0];
assign #`da MSB_align = BCTL[1] && !BCTL[0];
assign #`da LSB_align = BCTL[1] && BCTL[0];



assign #`da bdmaDMD_oe = BSreqx && BDMRD_cyc && GO_STEAL;

assign #`da bdmaPMD_oe = BSreqx && BPMRD_cyc && GO_STEAL;



assign #`da T_BDMA = BDMA_end && !BOOT;

assign #`da BRST_s1 = BCTL[3] && BDMA_end;

always @(posedge DSPCLK or posedge RST)
if (RST) BRST_s2 <= #`db 1'b0;
else BRST_s2 <= #`db BRST_s1;

assign #`da BRST = BRST_s1 || BRST_s2;



assign #`da BDMAmmio = {16{selBEAD}} & {2'b0, BEAD[13:0]} |
{16{selBIAD}} & {2'b0, BIAD[13:0]} |
{16{selBCTL}} & BCTL[15:0] |
{16{selBCNT}} & {2'b0, BWCOUNT[13:0]} |
{16{selBOVL}} & {4'b0, BOVL[11:0]};

endmodule




