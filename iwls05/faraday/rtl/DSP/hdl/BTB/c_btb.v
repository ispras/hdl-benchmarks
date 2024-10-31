






`include "x_def.v"





module BTB (/* ------------ Inputs : ------------- */
 /*T_RST,*/ DSPCLK,
 PPclr_h, GO_F, GO_D, GO_E, GO_C, IFA_nx,
IFA, EXA, Bterr_E, Taddr_E,
 RTS_R, RTS_Ed, BR_Ed,
 Ctrue,
 TB_EN,
 BTB_rd,
 RTB_rd,
`ifdef FD_DFT
 SCAN_TEST,
`endif



 BTB_ra, BTB_wa, BTB_wd, BTB_web,
 /*RTB_wd,*/ RTB_web,
 BTaken_I, RTaken_I, PTaken_R, PTaken_E);


input [25:0] BTB_rd;
input [4:0] IFA_nx;
input [13:0] IFA,
EXA,
Taddr_E;
input [11:0] RTB_rd;
input /*T_RST,*/
DSPCLK,
PPclr_h,
GO_F,
GO_D,
GO_E,
GO_C,
Bterr_E,
Ctrue,
RTS_R, RTS_Ed,
BR_Ed,
TB_EN;

`ifdef FD_DFT
input SCAN_TEST;
`endif


output [4:0] BTB_wa,
BTB_ra;
output [25:0] BTB_wd;
output BTB_web,
RTB_web,
BTaken_I,
RTaken_I,
PTaken_R,
PTaken_E;



reg [8:0] Btag_R, Rtag_R;
reg [4:0] BTB_wa_d1;
reg [1:0] BTB_wd_d1;
reg [1:0] Bh_R, Rh_R,
nh_E;
reg [13:0] Bt_R;
reg [25:0] Dor_E,
Bwd_E;


reg RST,
Bv_R, Bhit_R, Rhit_R, PTaken_R,
Rv_R, Bhit_E, Rhit_E, PTaken_E,
BRTBwcyc, BTaken_R, BTaken_E;

wire [8:0] Btag_I, Rtag_I;
wire [4:0] BTB_ra_d1;
wire [1:0] Bh_I, Rh_I;
wire [13:0] Bt_I;

wire [25:0] Dor_R,
nEntry, Rwd_E, BRwd_E;
wire Bv_I, Rv_I,
Bhit_Ii, Rhit_Ii,
Bhit_I, Rhit_I,
Bwe_h, Rwe_h, Conf_I;











`ifdef FD_GTCLK
`ifdef FD_DFT
GTECH_NOR2 utm1 (.Z(BTBCLK_enb_dft), .A(TB_EN), .B(SCAN_TEST));
GTECH_NOR2 uk1 (.Z(BTBCLK_), .A(DSPCLK), .B(BTBCLK_enb_dft));
`else
GTECH_NOT uk0 (.Z(TB_EN_), .A(TB_EN));
GTECH_NOR2 uk1 (.Z(BTBCLK_), .A(DSPCLK), .B(TB_EN_));
`endif
GtCLK_NOT ckBTB (.Z(BTBCLK), .A(BTBCLK_));
`else
wire BTBCLK=DSPCLK;
`endif











assign #`d0 {Btag_I[8:0], Bv_I, Bt_I[13:0] } = BTB_rd[25:2];
assign #`d0 {Rtag_I[8:0], Rv_I } = RTB_rd[11:2];

assign #`d0 Bh_I[1:0] = Conf_I ? BTB_wd_d1[1:0] : BTB_rd[1:0];
assign #`d0 Rh_I[1:0] = Conf_I ? BTB_wd_d1[1:0] : RTB_rd[1:0];



assign #`da Bhit_Ii = (IFA[13:5] == Btag_I[8:0]) && Bv_I;
assign #`da Rhit_Ii = (IFA[13:5] == Rtag_I[8:0]) && Rv_I;

assign #`da Bhit_I = Bhit_Ii && !Conf_I;
assign #`da Rhit_I = Rhit_Ii && !Conf_I;

assign #`da BTaken_I = Bhit_I && (|{Bh_I[1:0]});
assign #`da RTaken_I = Rhit_I && (|{Rh_I[1:0]});



assign #`da Conf_I = !TB_EN ||
(BTB_ra_d1[4:0] == BTB_wa_d1[4:0]) && BRTBwcyc;














always @(posedge BTBCLK) begin
if (PPclr_h) begin
Bhit_R <= #`db 1'b0;
Rhit_R <= #`db 1'b0;
BTaken_R <= #`db 1'b0;
end
`ifdef FD_GTCLK
else if (GO_D) begin
`else
else if (GO_D & TB_EN) begin
`endif
Bhit_R <= #`db Bhit_I;
Rhit_R <= #`db Rhit_I;
BTaken_R <= #`db BTaken_I;
end
end

always @(posedge DSPCLK)
if (PPclr_h)
PTaken_R <= #`db 1'b0;
else if (GO_D)
PTaken_R <= #`db BTaken_I || RTaken_I;

always @(posedge BTBCLK) begin
`ifdef FD_GTCLK
if (GO_D) begin
`else
if (GO_D & TB_EN) begin
`endif
Btag_R[8:0] <= #`db Btag_I[8:0];
Bv_R <= #`db Bv_I;
Bh_R[1:0] <= #`db Bh_I[1:0];
Bt_R[13:0] <= #`db Bt_I[13:0];

Rtag_R[8:0] <= #`db Rtag_I[8:0];
Rv_R <= #`db Rv_I;
Rh_R[1:0] <= #`db Rh_I[1:0];
end
end



assign #`da Dor_R[25:0] = RTS_R ? {Rtag_R, Rv_R, 14'b0, Rh_R}
: {Btag_R, Bv_R, Bt_R, Bh_R};





















always @(posedge BTBCLK) begin
if (PPclr_h) begin
Bhit_E <= #`db 1'b0;
Rhit_E <= #`db 1'b0;
BTaken_E <= #`db 1'b0;
end
`ifdef FD_GTCLK
else if (GO_E) begin
`else
else if (GO_E & TB_EN) begin
`endif
Bhit_E <= #`db Bhit_R;
Rhit_E <= #`db Rhit_R;
BTaken_E <= #`db BTaken_R;
end
end

always @(posedge DSPCLK)
if (PPclr_h)
PTaken_E <= #`db 1'b0;
else if (GO_E)
PTaken_E <= #`db PTaken_R;

always @(posedge BTBCLK) begin
`ifdef FD_GTCLK
if (GO_E) Dor_E[25:0] <= #`db Dor_R[25:0];
`else
if (GO_E & TB_EN) Dor_E[25:0] <= #`db Dor_R[25:0];
`endif
end




assign #`da Bwe_h = (Bhit_E || Ctrue) && BR_Ed && GO_C;
assign #`da Rwe_h = (Rhit_E || Ctrue) && RTS_Ed && GO_C;




assign #`da nEntry[25:0] = {EXA[13:5], 1'b1, Taddr_E[13:0], nh_E[1:0]};

always @(Bhit_E or BTaken_E or Ctrue or Bterr_E or nEntry or
nh_E or Taddr_E or Dor_E) begin
casex ({Bhit_E, BTaken_E, Ctrue, Bterr_E})
4'b0xxx : Bwd_E[25:0] <= #`da nEntry[25:0];
4'b100x : Bwd_E[25:0] <= #`da {Dor_E[25:2], nh_E[1:0]};
4'b101x : Bwd_E[25:0] <= #`da {Dor_E[25:16], Taddr_E[13:0], nh_E[1:0]};
4'b110x : Bwd_E[25:0] <= #`da {Dor_E[25:2], nh_E[1:0]};
4'b1110 : Bwd_E[25:0] <= #`da {Dor_E[25:2], nh_E[1:0]};
4'b1111 : Bwd_E[25:0] <= #`da {Dor_E[25:16], Taddr_E[13:0], nh_E[1:0]};


default : Bwd_E[25:0] <= #`da Dor_E[25:0];

endcase
end

assign #`da Rwd_E[25:0] = Rhit_E ? {Dor_E[25:2], nh_E[1:0]}
: {EXA[13:5], 1'b1, 14'b0, nh_E[1:0]};

assign #`da BRwd_E[25:0] = BR_Ed ? Bwd_E[25:0] : Rwd_E[25:0];




parameter SN = 2'h0,
WN = 2'h1,
WT = 2'h2,
ST = 2'h3;

wire [1:0] Dor_E_temp = Dor_E[1:0];
always @(Dor_E_temp or Ctrue) begin

nh_E[1:0] <= #`da WN;

case (Dor_E_temp)
SN : nh_E[1:0] <= #`da Ctrue ? WN : SN;
WN : nh_E[1:0] <= #`da Ctrue ? WT : SN;
WT : nh_E[1:0] <= #`da Ctrue ? ST : WN;
ST : nh_E[1:0] <= #`da Ctrue ? ST : WT;
endcase
end














always @(posedge BTBCLK) begin
`ifdef FD_GTCLK
`else
if(TB_EN)
`endif
BRTBwcyc <= #`db Bwe_h || Rwe_h;
end




always @(posedge BTBCLK) begin
`ifdef FD_GTCLK
if (GO_C) begin
`else
if (GO_C & TB_EN) begin
`endif

BTB_wa_d1[4:0] <= #`db EXA[4:0];
BTB_wd_d1[1:0] <= #`db BTB_wd[1:0];
end
end








assign #`d0 BTB_ra_d1[4:0] = IFA[4:0];










assign #`da BTB_web = !Bwe_h;
assign #`da RTB_web = !Rwe_h;



assign #`da BTB_wd[25:0] = BRwd_E[25:0];
assign #`da BTB_wa[4:0] = EXA[4:0];




assign #`da BTB_ra[4:0] = GO_F ? IFA_nx : IFA[4:0];




endmodule
