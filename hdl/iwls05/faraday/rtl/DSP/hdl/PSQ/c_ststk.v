






`include "x_def.v"









module STstk (/* in */ T_RST, DSPCLK, STin, PushST_EN, PopST_EN,
STS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif

TopST, ST_full, ST_empty, ST_has1);

input [24:0] STin;
input T_RST, DSPCLK, PushST_EN, PopST_EN, STS_CKenb;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [24:0] TopST;
output ST_empty,
ST_full,
ST_has1;

reg [2:0] ptr;
wire [24:0] stkin;
wire [2:0] ptr_in, ptr_p, ptr_m;
wire [2:0] WA, RA;
wire WE;
wire pop, push;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm1 (.Z(STS_CKenb_dft), .A(STS_CKenb), .B(SCAN_TEST));
GTECH_NOR2 uk0 (.Z(STSCLK_), .A(DSPCLK), .B(STS_CKenb_dft));
GtCLK_NOT ckSTSCLK (.Z(STSCLK), .A(STSCLK_));
`else
GTECH_NOR2 uk0 (.Z(STSCLK_), .A(DSPCLK), .B(STS_CKenb));
GtCLK_NOT ckSTSCLK (.Z(STSCLK), .A(STSCLK_));
`endif

`else
wire STSCLK_en=!STS_CKenb;
wire STSCLK = DSPCLK;
`endif








assign push = PushST_EN && !ST_full;
assign pop = PopST_EN && !ST_empty;

assign stkin[24:0] = STin[24:0];

assign ptr_p[2:0] = ptr[2:0] + 1'b1;
assign ptr_m[2:0] = ptr[2:0] - 1'b1;
assign ptr_in[2:0] = push ? ptr_p[2:0] : ptr_m[2:0];

always @(posedge STSCLK or posedge T_RST) begin
if (T_RST) ptr[2:0] <= #1 3'b111;
`ifdef FD_GTCLK
else if (push || pop) ptr[2:0] <= #1 ptr_in[2:0];
`else
else if ((push || pop) & STSCLK_en) ptr[2:0] <= #1 ptr_in[2:0];
`endif
end



assign ST_empty = (ptr[2:0] == 3'h7);
assign ST_full = (ptr[2:0] == 3'h6);
assign ST_has1 = (ptr[2:0] == 3'h0);



`ifdef FD_GTCLK
assign WE = push;
`else
assign WE = push & STSCLK_en;
`endif
assign WA[2:0] = ptr_p[2:0];
assign RA[2:0] = ptr[2:0];

STS7x23 sts7x23 (STSCLK, WE, WA[2:0], stkin[24:0], RA[2:0],
TopST[24:0]);

endmodule







module STS7x23 (STSCLK, WE, WA[2:0], stkin[24:0], RA[2:0], TopST[24:0]);

output [24:0] TopST;
input [24:0] stkin;
input [2:0] RA, WA;
input STSCLK, WE;

reg [24:0] STcell[6:0];
wire [24:0] TopST;




always @(posedge STSCLK)
if (WE) STcell[WA] <= #1 stkin[24:0];



assign TopST[24:0] = STcell[RA];






wire [24:0] ststk0 = STcell[0];
wire [24:0] ststk1 = STcell[1];
wire [24:0] ststk2 = STcell[2];
wire [24:0] ststk3 = STcell[3];
wire [24:0] ststk4 = STcell[4];
wire [24:0] ststk5 = STcell[5];
wire [24:0] ststk6 = STcell[6];



endmodule
