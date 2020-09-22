






`include "x_def.v"







module CNTstk (/* in */ T_RST, DSPCLK, CNTin, PushCNT_EN, PopCNT_EN,
CNS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif

TopCNT, CNT_full, CNT_empty, CNT_has1);

input [13:0] CNTin;
input T_RST, DSPCLK, PushCNT_EN, PopCNT_EN, CNS_CKenb;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [13:0] TopCNT;
output CNT_empty,
CNT_full,
CNT_has1;

reg [2:0] ptr;
wire [13:0] stkin;
wire [2:0] ptr_in, ptr_p, ptr_m;
wire [1:0] WA, RA;
wire WE;
wire pop, push;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm1 (.Z(CNS_CKenb_dft), .A(CNS_CKenb), .B(SCAN_TEST));
GTECH_NOR2 uk0 (.Z(CNSCLK_), .A(DSPCLK), .B(CNS_CKenb_dft));
GtCLK_NOT ckCNSCLK (.Z(CNSCLK), .A(CNSCLK_));
`else
GTECH_NOR2 uk0 (.Z(CNSCLK_), .A(DSPCLK), .B(CNS_CKenb));
GtCLK_NOT ckCNSCLK (.Z(CNSCLK), .A(CNSCLK_));
`endif

`else
wire CNSCLK_en=!CNS_CKenb;
wire CNSCLK = DSPCLK;
`endif









assign push = PushCNT_EN && !CNT_full;
assign pop = PopCNT_EN && !CNT_empty;

assign stkin[13:0] = CNTin[13:0];

assign ptr_p[2:0] = ptr[2:0] + 1'b1;
assign ptr_m[2:0] = ptr[2:0] - 1'b1;
assign ptr_in[2:0] = push ? ptr_p[2:0] : ptr_m[2:0];

always @(posedge CNSCLK or posedge T_RST) begin
if (T_RST) ptr[2:0] <= #1 3'b111;
`ifdef FD_GTCLK
else if (push || pop) ptr[2:0] <= #1 ptr_in[2:0];
`else
else if ((push || pop) & CNSCLK_en) ptr[2:0] <= #1 ptr_in[2:0];
`endif
end



assign CNT_empty = ptr[2];
assign CNT_full = (ptr[2:0] == 3'h3);
assign CNT_has1 = (ptr[2:0] == 3'h0);



`ifdef FD_GTCLK
assign WE = push;
`else
assign WE = push & CNSCLK_en;
`endif
assign WA[1:0] = ptr_p[1:0];
assign RA[1:0] = ptr[1:0];

CNTS4x14 cnts4x14 (CNSCLK, WE, WA[1:0], stkin[13:0], RA[1:0],
TopCNT[13:0]);

endmodule







module CNTS4x14 (CNSCLK, WE, WA[1:0], stkin[13:0], RA[1:0], TopCNT[13:0]);

output [13:0] TopCNT;
input [13:0] stkin;
input [1:0] RA, WA;
input CNSCLK, WE;

reg [13:0] CNTcell[3:0];
wire [13:0] TopCNT;




always @(posedge CNSCLK)
if (WE) CNTcell[WA] <= #1 stkin[13:0];



assign TopCNT[13:0] = CNTcell[RA];







wire [13:0] cntstk0 = CNTcell[0];
wire [13:0] cntstk1 = CNTcell[1];
wire [13:0] cntstk2 = CNTcell[2];
wire [13:0] cntstk3 = CNTcell[3];



endmodule
