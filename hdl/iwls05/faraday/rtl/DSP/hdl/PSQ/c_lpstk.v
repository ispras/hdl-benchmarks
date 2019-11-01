






`include "../../include/x_def.v"










module LPstk (/* in */ T_RST, DSPCLK, LPin, PushLP_EN, PopLP_EN,
LPS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif

TopLP, LP_full, LP_empty, LP_has1);

input [21:0] LPin;
input T_RST, DSPCLK, PushLP_EN, PopLP_EN, LPS_CKenb;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [21:0] TopLP;
output LP_empty,
LP_full,
LP_has1;

reg [2:0] ptr;
wire [21:0] stkin;
wire [2:0] ptr_in, ptr_p, ptr_m;
wire [1:0] WA, RA;
wire WE;
wire pop, push;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm1 (.Z(LPS_CKenb_dft), .A(LPS_CKenb), .B(SCAN_TEST));
GTECH_NOR2 uk0 (.Z(LPSCLK_), .A(DSPCLK), .B(LPS_CKenb_dft));
GtCLK_NOT ckLPSCLK (.Z(LPSCLK), .A(LPSCLK_));
`else
GTECH_NOR2 uk0 (.Z(LPSCLK_), .A(DSPCLK), .B(LPS_CKenb));
GtCLK_NOT ckLPSCLK (.Z(LPSCLK), .A(LPSCLK_));
`endif

`else
wire LPSCLK_en=!LPS_CKenb;
wire LPSCLK = DSPCLK;
`endif








assign push = PushLP_EN && !LP_full;
assign pop = PopLP_EN && !LP_empty;

assign stkin[21:0] = LPin[21:0];

assign ptr_p[2:0] = ptr[2:0] + 1'b1;
assign ptr_m[2:0] = ptr[2:0] - 1'b1;
assign ptr_in[2:0] = push ? ptr_p[2:0] : ptr_m[2:0];

always @(posedge LPSCLK or posedge T_RST) begin
if (T_RST) ptr[2:0] <= #1 3'b111;
`ifdef FD_GTCLK
else if (push || pop) ptr[2:0] <= #1 ptr_in[2:0];
`else
else if ((push || pop) & LPSCLK_en) ptr[2:0] <= #1 ptr_in[2:0];
`endif
end



assign LP_empty = ptr[2];
assign LP_full = (ptr[2:0] == 3'h3);
assign LP_has1 = (ptr[2:0] == 3'h0);



`ifdef FD_GTCLK
assign WE = push;
`else
assign WE = push & LPSCLK_en;
`endif
assign WA[1:0] = ptr_p[1:0];
assign RA[1:0] = ptr[1:0];

LPS4x22 lps4x22 (LPSCLK, WE, WA[1:0], stkin[21:0], RA[1:0],
TopLP[21:0]);

endmodule







module LPS4x22 (LPSCLK, WE, WA[1:0], stkin[21:0], RA[1:0], TopLP[21:0]);

output [21:0] TopLP;
input [21:0] stkin;
input [1:0] RA, WA;
input LPSCLK, WE;

reg [21:0] LPcell[3:0];
wire [21:0] TopLP;




always @(posedge LPSCLK)
if (WE) LPcell[WA] <= #1 stkin[21:0];



assign TopLP[21:0] = LPcell[RA];






wire [21:0] lpstk0 = LPcell[0];
wire [21:0] lpstk1 = LPcell[1];
wire [21:0] lpstk2 = LPcell[2];
wire [21:0] lpstk3 = LPcell[3];



endmodule
