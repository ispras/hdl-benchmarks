






`include "x_def.v"































module CLKC (/* -------- Inputs : --------- */
P_RSTn, HRST, OSCin, X_PWDn, TMODE,
DMD,
IDLE_ST_h, IDLE_ST, IRE, GOICE,
ICE_wakeup, TRAP_R, TRAP_R_L,
CKR_we, MMR_web, TB_EN,
XTALDIS, XTALDELAY, PUCR,
`ifdef FD_DFT
SCAN_TEST,
`endif


RSTtext_h,
`ifdef FD_EVB
CORECLK, PERICLK,
`else
DSPCLK,
`endif
DSPCLK_cm0, DSPCLK_cm1, DSPCLK_cm2,
DSPCLK_pm0, DSPCLK_pm1, DSPCLK_pm2,
DSPCLK_dm0, DSPCLK_dm1, DSPCLK_dm2,
PWDACK, CLKO,
Awake_h, Awake, enTRAP_RL, STBY, PWRDn,
XTALoffn,
CKR);


input [3:0] IRE;
input [15:0] DMD;
input P_RSTn,
HRST,
OSCin,
X_PWDn,
TMODE,
IDLE_ST_h,
IDLE_ST,
CKR_we,
MMR_web,
TB_EN,
GOICE,
TRAP_R,
TRAP_R_L,
XTALDIS,
XTALDELAY,
PUCR,
ICE_wakeup;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output [15:0] CKR;
output RSTtext_h,
DSPCLK_cm0,
DSPCLK_cm1,
DSPCLK_cm2,
DSPCLK_pm0,
DSPCLK_pm1,
DSPCLK_pm2,
DSPCLK_dm0,
DSPCLK_dm1,
DSPCLK_dm2,
PWDACK,
PWRDn,
STBY,
CLKO,
XTALoffn,
Awake_h, Awake,
enTRAP_RL;

`ifdef FD_EVB
output CORECLK, PERICLK;
`else
output DSPCLK;
`endif

wire [15:0] CKR;
wire [11:0] OSCNTR;

reg [10:0] STDcnt;
reg [4:0] PSEL;
reg [6:0] OUTcnt;
reg CLKOUT, SIDLE_s1, SIDLE_s2,
SlowDn, SlowDn_s1, SlowDn_s2, STBY,
SLEEP, DSPoff, OSCoff_set, OSCoff,
Cnt128, Cnt4096, Cnt4096_s1, Cnt4096_s2,
PWDACK, RSTtext, Awake;

wire [6:0] Num128;
wire [11:0] Num4096;
wire STDchg, OUTchg, SlowDn_ini, stSlowDn,
STBY_set, PWDrise, SLEEP_set, SLEEP_clr,
OSCNTR_ena, OSCNTR_clr, Cnt128_set,
Cnt4096_set, PRST, ONCLK, DSPCLKi,
SRST, crSlowDn,
selSTDCLK, OSC, STDCLKi;



































`ifdef FD_DFT
assign #`da PWRDn = !(SlowDn || SLEEP) && TB_EN && !SCAN_TEST;
`else
assign #`da PWRDn = !(SlowDn || SLEEP) && TB_EN;
`endif
assign #`da XTALoffn = !OSCoff || PRST;




assign #`da selSTDCLK = SlowDn && !PRST;

`ifdef FD_FPGA

reg STDCLK;

assign OSC = !OSCin;
assign ONCLK = OSC;
assign #`da DSPCLKi = selSTDCLK ? STDCLK : ONCLK;
assign #`da DSPCLK = DSPCLKi || DSPoff && !PRST;

`ifdef FD_EVB
BUFG clkcm0 (.O(DSPCLK_cm0), .I(DSPCLK));
BUFG clkcm1 (.O(DSPCLK_cm1), .I(DSPCLK));
BUFG clkcm2 (.O(DSPCLK_cm2), .I(DSPCLK));

BUFG clkpm0 (.O(DSPCLK_pm0), .I(DSPCLK));
BUFG clkpm1 (.O(DSPCLK_pm1), .I(DSPCLK));
assign DSPCLK_pm2 = DSPCLK_pm1;

BUFG clkdm0 (.O(DSPCLK_dm0), .I(DSPCLK));
BUFG clkdm1 (.O(DSPCLK_dm1), .I(DSPCLK));
assign DSPCLK_dm2 = DSPCLK_dm1;

BUFG coreclk (.O(CORECLK), .I(DSPCLK));
BUFG periclk (.O(PERICLK), .I(DSPCLK));
`else

assign DSPCLK_cm0 = DSPCLK;
assign DSPCLK_cm1 = DSPCLK;
assign DSPCLK_cm2 = DSPCLK;
assign DSPCLK_dm0 = DSPCLK;
assign DSPCLK_dm1 = DSPCLK;
assign DSPCLK_dm2 = DSPCLK;
assign DSPCLK_pm0 = DSPCLK;
assign DSPCLK_pm1 = DSPCLK;
assign DSPCLK_pm2 = DSPCLK;

`endif

`else

GtCLK_NOT ckOSC (.Z(OSC), .A(OSCin));

GtCLK_BUF ckONCLK (.Z(ONCLK), .A(OSC));

`ifdef FD_DFT
wire selSTDCLK_dft;
GTECH_AND_NOT uck1 (.Z(selSTDCLK_dft), .A(selSTDCLK), .B(SCAN_TEST));
GtCLK_MUX2 ckDSPCLKi (.Z(DSPCLKi), .S(selSTDCLK_dft), .A(ONCLK), .B(STDCLK));

GTECH_AND_NOT uck2 (.Z(DSPoffx), .A(DSPoff), .B(PRST));
GTECH_AND_NOT uck3 (.Z(DSPoffx_dft), .A(DSPoffx), .B(SCAN_TEST));
GTECH_NOR2 uck4 (.Z(DSPCLKn), .A(DSPCLKi), .B(DSPoffx_dft));
`else
GtCLK_MUX2 ckDSPCLKi (.Z(DSPCLKi), .S(selSTDCLK), .A(ONCLK), .B(STDCLK));
GTECH_AND_NOT uck2 (.Z(DSPoffx), .A(DSPoff), .B(PRST));
GTECH_NOR2 uck4 (.Z(DSPCLKn), .A(DSPCLKi), .B(DSPoffx));
`endif

GtCLK_NOT ckDSPCLK (.Z(DSPCLK), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_cm0 (.Z(DSPCLK_cm0), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_cm1 (.Z(DSPCLK_cm1), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_cm2 (.Z(DSPCLK_cm2), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_pm0 (.Z(DSPCLK_pm0), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_pm1 (.Z(DSPCLK_pm1), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_pm2 (.Z(DSPCLK_pm2), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_dm0 (.Z(DSPCLK_dm0), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_dm1 (.Z(DSPCLK_dm1), .A(DSPCLKn));
GtCLK_NOT ckDSPCLK_dm2 (.Z(DSPCLK_dm2), .A(DSPCLKn));



`endif


`ifdef FD_DFT
assign #`da PRST = !P_RSTn && !SCAN_TEST;
`else
assign #`da PRST = !P_RSTn;
`endif

always @(posedge DSPCLK) RSTtext <= #`db RSTtext_h;

assign #`da SRST = HRST || RSTtext;

wire ARST;
`ifdef FD_DFT
wire ARST_h = (PRST || RSTtext);
assign ARST = SCAN_TEST ? HRST : ARST_h;
`else
assign #`da ARST = PRST || RSTtext;
`endif



reg [1:0] CTR_cnt;
wire CTR_en, CTR_reset;

always @(posedge ONCLK or posedge PRST)
if(PRST) CTR_cnt <= #`db 2'b0;
else if(CTR_en) CTR_cnt <= #`db CTR_cnt + 1;

assign #`da CTR_en = !(&{CTR_cnt[1:0]});

assign #`d0 CTR_reset = CTR_en;


















`ifdef FD_DFT
REG16LC ckr_reg(DSPCLK, MMR_web, CKR_we, DMD[15:0], CKR[15:0], PRST, SCAN_TEST);
`else
REG16LC ckr_reg(DSPCLK, MMR_web, CKR_we, DMD[15:0], CKR[15:0], PRST);
`endif


















assign #`da STDchg = (STDcnt[10:3]== CKR[7:0]);
assign #`da OUTchg = (OUTcnt[6:0] == CKR[14:8]);





`ifdef FD_FPGA
assign #`da STDCLKi = ONCLK && (STBY || SIDLE_s2);
`else
`ifdef FD_DFT
wire STDCLKi_enb_dft = STBY || SIDLE_s2 || SCAN_TEST;
GTECH_AND2 ckSTDCLKi (.Z(STDCLKi), .A(ONCLK), .B(STDCLKi_enb_dft));
`else
GtCLK_OA21 ckSTDCLKi (.Z(STDCLKi), .C(ONCLK), .A(STBY), .B(SIDLE_s2));
`endif
`endif

always @(posedge STDCLKi or posedge PRST) begin
if (PRST) STDcnt[10:0] <= #`db 11'b0;
else if (STDchg) STDcnt[10:0] <= #`db 11'b0;
else STDcnt[10:0] <= #`db STDcnt + 1;
end


`ifdef FD_FPGA
always @(posedge STDCLKi or posedge PRST) begin
if (PRST) STDCLK <= #`db 1'b0;
else if (STDchg) STDCLK <= #`db !STDCLK;
end

`else
GTECH_NOT STDCLK_u1 (.Z(PRSTB), .A(PRST));
`ifdef FD_DFT
GtCLK_FJK3 ckSTDCLK_h (.Q(STDCLK_h), .QN(), .CP(STDCLKi), .CD(PRSTB), .SD(1'b1),
.J(STDchg), .K(STDchg));
GTECH_MUX2 ckSTDCLK (.Z(STDCLK), .A(STDCLK_h), .B(STDCLKi), .S(SCAN_TEST));
`else
GtCLK_FJK3 ckSTDCLK (.Q(STDCLK), .QN(), .CP(STDCLKi), .CD(PRSTB), .SD(1'b1),
.J(STDchg), .K(STDchg));
`endif
`endif






`ifdef FD_FPGA
wire OUTCK = DSPCLK | CKR[15];
`else
`ifdef FD_DFT
wire OUTCK_en_dft = CKR[15] && !SCAN_TEST;
GtCLK_OR2 ckOUTCK (.Z(OUTCK), .A(DSPCLK), .B(OUTCK_en_dft));
`else
GtCLK_OR2 ckOUTCK (.Z(OUTCK), .A(DSPCLK), .B(CKR[15]));
`endif
`endif

always @(posedge OUTCK or posedge PRST) begin
if (PRST) OUTcnt[6:0] <= #`db 7'b0;
else if (OUTchg) OUTcnt[6:0] <= #`db 7'b0;
else OUTcnt[6:0] <= #`db OUTcnt + 1;
end

always @(posedge OUTCK or posedge PRST) begin
if (PRST) CLKOUT <= #`db 1'b0;
else if (OUTchg) CLKOUT <= #`db !CLKOUT;
end

assign #`da CLKO = CLKOUT && !CKR[15];



















assign #`da SlowDn_ini = SIDLE_s1 && !SIDLE_s2;

`ifdef FD_DFT
wire clr_SIDLE_s1, clr_SIDLE_s1_h;
assign clr_SIDLE_s1_h = (ARST || CTR_reset);
assign clr_SIDLE_s1 = SCAN_TEST ? HRST : clr_SIDLE_s1_h;
`else
wire clr_SIDLE_s1;
assign #`da clr_SIDLE_s1 = ARST || CTR_reset;
`endif

always @(posedge ONCLK or posedge clr_SIDLE_s1)
if(clr_SIDLE_s1)
SIDLE_s1 <= #`db 0;
else if(SIDLE_s1 | !SIDLE_s2)
SIDLE_s1 <= #`db IDLE_ST;


always @(posedge STDCLK or posedge ARST)
if(ARST) begin
SIDLE_s2 <= #`db 0;
end
else begin
SIDLE_s2 <= #`db SIDLE_s1;
end

assign #`da stSlowDn = SlowDn_ini && (|{IRE[2:0]});

assign #`da crSlowDn = (TRAP_R || GOICE) ;

always @(posedge STDCLKi or posedge ARST) begin
if (ARST) SlowDn <= #`db 1'b0;
else if (crSlowDn) SlowDn <= #`db 1'b0;
else if (stSlowDn) SlowDn <= #`db STBY;
end

always @(posedge ONCLK) begin
SlowDn_s1 <= #`db SlowDn;
SlowDn_s2 <= #`db SlowDn_s1;
end

assign #`da enTRAP_RL = !(SlowDn || SlowDn_s1 || SlowDn_s2);





wire STBY_clr;
assign #`da STBY_set = IDLE_ST_h && !IRE[3];
`ifdef FD_DFT
wire STBY_clr_h = (RSTtext || CTR_reset);
assign STBY_clr = SCAN_TEST ? HRST : STBY_clr_h;
`else
assign #`da STBY_clr = RSTtext || CTR_reset;
`endif

always @(posedge DSPCLK or posedge STBY_clr) begin
if (STBY_clr) STBY <= #`db 1'b0;
else if (!IDLE_ST) STBY <= #`db STBY_set;
else if (TRAP_R_L) STBY <= #`db 1'b0;
end


















Oneshot pwdr (X_PWDn, PWDrise);



assign #`da SLEEP_set = IDLE_ST_h && IRE[3];
`ifdef FD_DFT
wire SLEEP_clr_h = (SRST || PWDrise || ICE_wakeup || CTR_reset);
assign SLEEP_clr = SCAN_TEST ? HRST : SLEEP_clr_h;
`else
assign #`da SLEEP_clr = SRST || PWDrise || ICE_wakeup || CTR_reset;
`endif
always @(posedge DSPCLK or posedge SLEEP_clr) begin
if (SLEEP_clr) SLEEP <= #`db 1'b0;
else if (!IDLE_ST) SLEEP <= #`db SLEEP_set;
end



always @(posedge DSPCLKi or posedge ARST) begin
if (ARST) DSPoff <= #`db 0;
else if (DSPoff) DSPoff <= #`db !Cnt4096;
else DSPoff <= #`db SLEEP;
end






always @(posedge OSC)
OSCoff_set <= #`db DSPoff && SLEEP && XTALDIS;

wire OSCoff_clr;

`ifdef FD_DFT
wire OSCoff_clr_h = (PRST || ICE_wakeup || PWDrise);
assign OSCoff_clr = SCAN_TEST ? HRST : OSCoff_clr_h;

`else
assign #`da OSCoff_clr = PRST || ICE_wakeup || PWDrise;
`endif

always @(posedge OSC or posedge OSCoff_clr) begin
if (OSCoff_clr) OSCoff <= #`db 0;
else if (!OSCoff) OSCoff <= #`db OSCoff_set && SLEEP;
end





always @(posedge DSPCLK or posedge HRST) begin
if (HRST) PWDACK <= #`db 1'b0;
else if (!IDLE_ST) PWDACK <= #`db SLEEP_set;
else if (Awake) PWDACK <= #`db 1'b0;
end

























wire OSCNTR_enb;
wire [11:0] OSCNTR_nx;

`ifdef FD_FPGA
assign #`da OSCNTR_ena = PWDACK && !SLEEP && IDLE_ST;
assign #`da OSCNTR_enb = !OSCNTR_ena;
`else
GTECH_NOT uck5 (.Z(SLEEPb), .A(SLEEP));
GTECH_AND3 uck6 (.Z(OSCNTR_ena), .A(PWDACK), .B(SLEEPb), .C(IDLE_ST));
GtCLK_NAND3 uck7 (.Z(OSCNTR_enb), .A(PWDACK), .B(SLEEPb), .C(IDLE_ST));
`endif

`ifdef FD_DFT
wire OSCNTR_clr_h = (ARST || Awake);
assign OSCNTR_clr = SCAN_TEST ? HRST : OSCNTR_clr_h;
`else
assign #`da OSCNTR_clr = ARST || Awake;
`endif
assign #`da OSCNTR_nx[11:0] = OSCNTR[11:0] + 1;

`ifdef FD_DFT
REG12LC oscntr_reg(OSC, OSCNTR_enb, OSCNTR_ena, OSCNTR_nx, OSCNTR[11:0],
OSCNTR_clr, SCAN_TEST);
`else
REG12LC oscntr_reg(OSC, OSCNTR_enb, OSCNTR_ena, OSCNTR_nx, OSCNTR[11:0],
OSCNTR_clr);
`endif










assign #`da Num128[6:0] = TMODE ? 7'hf : 7'h7f;
assign #`da Num4096[11:0] = TMODE ? 12'h1f : 12'hfff;

assign Cnt128_set = XTALDIS ? (OSCNTR[6:0] == Num128)
: (OSCNTR[11:0] != 12'h0);

always @(posedge OSC or posedge ARST) begin
if (ARST) Cnt128 <= #`db 0;
else if (Awake) Cnt128 <= #`db 0;
else if (!Cnt128) Cnt128 <= Cnt128_set;
end




assign #`da Cnt4096_set
= (XTALDIS && XTALDELAY) ? (OSCNTR[11:0] == Num4096)
: Cnt128;

always @(posedge OSC or posedge ARST) begin
if (ARST) Cnt4096 <= #`db 0;
else if (Awake) Cnt4096 <= #`db 0;
else if (!Cnt4096) Cnt4096 <= Cnt4096_set;
end












assign #`da Awake_h = Cnt4096_s1 && Cnt4096_s2;

always @(posedge DSPCLK or posedge PRST)
if(PRST) begin
Cnt4096_s1 <= #`db 1'b0;
Cnt4096_s2 <= #`db 1'b0;
Awake <= #`db 1'b0;
end
else begin
Cnt4096_s1 <= #`db Cnt4096;
Cnt4096_s2 <= #`db Cnt4096_s1;
Awake <= #`db Awake_h;
end

assign #`da RSTtext_h = Cnt4096 && Cnt4096_s2 && PUCR;


endmodule
