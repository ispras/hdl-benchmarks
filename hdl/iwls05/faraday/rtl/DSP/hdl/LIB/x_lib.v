






`include "x_def.v"


module DMDbuf (I, O);

input [15:0] I;
output [15:0] O;

assign O = I;
endmodule


module MAbufx (I, O);

input [13:0] I;
output [13:0] O;

assign O = I;
endmodule

module AO12JSS(O, A1, B1, B2);

output O;
input A1, B1, B2;

endmodule

module AO12P(O, A1, B1, B2);

output O;
input A1, B1, B2;

endmodule

module GTECH_BUF( Z, A);

output Z;
input A;

endmodule

module GTECH_MUX2(Z, S, A, B);

output Z;
input S;
input A;
input B;

endmodule

module GTECH_NOT(Z, A);

output Z;
input A;

endmodule

module GTECH_NOR2(Z, A, B);

output Z;
input A;
input B;

endmodule

module GTECH_AND_NOT( A, B, Z);

input A;
input B;
output Z;

endmodule // GTECH_AND_NOT

module GTECH_AND3( Z, A, B, C);

input A;
input B;
input C;
output Z;

endmodule // GTECH_AND3

module GTECH_MUX4( Z, B, A, D0, D1, D2, D3);

output Z;
input B;
input A;
input D0;
input D1;
input D2;
input D3;

endmodule // GTECH_MUX4

module GTECH_MUX8( Z, A, B, C, D0, D1, D2, D3, D4, D5, D6, D7);

output Z;
input A;
input B;
input C;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;


endmodule // GTECH_MUX8

module GTECH_MUXI2( Z, S, A, B);

output Z;
input S;
input A;
input B;

endmodule // GTECH_MUXI2

module GTECH_NAND2( Z, A, B);

output Z;
input A;
input B;

endmodule // GTECH_NAND2

module GTECH_NAND3( Z, A, B, C);

output Z;
input A;
input B;
input C;

endmodule // GTECH_NAND3

module GTECH_OR2( Z, A, B);

output Z;
input A;
input B;

endmodule // GTECH_OR2

module GTECH_OA21(Z, C, A, B);

output Z;
input C, A, B;

endmodule // GTECH_OA21

module GTECH_FJK3(Q, QN, CP, CD, SD, J, K);

output Q;
input QN, CP, CD, SD, J, K;

endmodule // GTECH_FJK3

module BUF4(O, I);

output O;
input I;

endmodule // BUF4

module BUFJSS(O, I);

output O;
input I;

endmodule // BUFJSS

module INV2(O, I);

output O;
input I;

endmodule // INV2

module INVHSS(O, I);

output O;
input I;

endmodule // INVHSS

module OR2HSS(O, I1, I2);

output O;
input I1, I2;

endmodule // OR2HSS

module OR2P(O, I1, I2);

output O;
input I1, I2;

endmodule // OR2P

module YFA28SB(O, I, E, E2, E4, SR);

output O;
input I, E, E2, E4, SR;

endmodule // YFA28SB

module YFA2GSB(O, I, E, E2, E4, E8, SR);

output O;
input I, E, E2, E4, E8, SR;

endmodule // YFA2GSB

module YC04A(O, I, E);

output O;
input I, E;

endmodule // YC04A

module YC04T(O, I, E);

output O;
input I, E;

endmodule // YC04T

module XSCIOM5( IO, I, E, O, FEB);

output IO;
input I;
input E;
output O;
input FEB;

endmodule // XSCIOM5

module XFMB( O, I, PU, PD, SMT);

input I;
input PU;
input PD;
input SMT;
output O;

endmodule // XFMB

module XCD8(O, I);

input I;
output O;

endmodule // XCD8

module INV1 (O, I);

output O;
input I;

endmodule // INV1

module INVGSS (O, I);

output O;
input I;

endmodule // INVGSS

module AN2P (O, I1, I2);

output O;
input I1;
input I2;

endmodule // AN2P

module XC (O, I);

output O;
input I;

endmodule // XC

module XCU8 (O, I);

output O;
input I;

endmodule // XCU8

module UROSCAHB (IO, I, E, O, FEB, EB, S0, S1);

input IO;
input I;
input E;
output O;
input FEB;
input EB;
input S0;
input S1;

endmodule // UROSCAHB

module XFAB ( O, I, PU, PD, SMT);

output O;
input I;
input PU;
input PD;
input SMT;

endmodule // XFAB

module XOSCAHB (IO, I, E, O, FEB, EB, S0, S1);

input IO;
input I;
input E;
output O;
input FEB;
input EB;
input S0;
input S1;

endmodule // XOSCAHB

`ifdef FD_DFT
module REG8L (CK, CKenb, WBen, DI, DO, SCAN_TEST);
input CK, CKenb, WBen, SCAN_TEST;
`else
module REG8L (CK, CKenb, WBen, DI, DO);
input CK, CKenb, WBen;
`endif

input [7:0] DI;
output [7:0] DO;
reg [7:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK)
if (WBen) DO[7:0] <= #`db DI[7:0];

`else
always @(posedge CK)
if (WBen && !CKenb) DO[7:0] <= #`db DI[7:0];

`endif

endmodule


`ifdef FD_DFT
module REG9L (CK, CKenb, WBen, DI, DO, SCAN_TEST);
input CK, CKenb, WBen, SCAN_TEST;
`else
module REG9L (CK, CKenb, WBen, DI, DO);
input CK, CKenb, WBen;
`endif

input [8:0] DI;
output [8:0] DO;
reg [8:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK)
if (WBen) DO[8:0] <= #`db DI[8:0];

`else
always @(posedge CK)
if (WBen && !CKenb) DO[8:0] <= #`db DI[8:0];

`endif

endmodule


`ifdef FD_DFT
module REG12L (CK, CKenb, WBen, DI, DO, SCAN_TEST);
input CK, CKenb, WBen, SCAN_TEST;
`else
module REG12L (CK, CKenb, WBen, DI, DO);
input CK, CKenb, WBen;
`endif

input [11:0] DI;
output [11:0] DO;
reg [11:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK)
if (WBen) DO[11:0] <= #`db DI[11:0];

`else
always @(posedge CK)
if (WBen && !CKenb) DO[11:0] <= #`db DI[11:0];
`endif

endmodule


`ifdef FD_DFT
module REG14L (CK, RST, CKenb, WBen, DI, DO, SCAN_TEST);
input CK, RST, CKenb, WBen, SCAN_TEST;
`else
module REG14L (CK, RST, CKenb, WBen, DI, DO);
input CK, RST, CKenb, WBen;
`endif

input [13:0] DI;
output [13:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb));
`endif

reg [13:0] DO;
always @(posedge CLK or posedge RST)
if (RST) DO[13:0] <= #`db 14'b0;
else if (WBen) DO[13:0] <= #`db DI[13:0];

`else
reg [13:0] DO;
always @(posedge CK or posedge RST)
if (RST) DO[13:0] <= #`db 14'b0;
else if (WBen && !CKenb) DO[13:0] <= #`db DI[13:0];

`endif

endmodule
`ifdef FD_DFT
module REG16L (CK, CKenb, WBen, DI, DO, SCAN_TEST);
input CK, CKenb, WBen, SCAN_TEST;
`else
module REG16L (CK, CKenb, WBen, DI, DO);
input CK, CKenb, WBen;
`endif

input [15:0] DI;
output [15:0] DO;

`ifdef FD_GTCLK
`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb));
`endif

reg [15:0] DO;
always @(posedge CLK)
if (WBen) DO[15:0] <= #`db DI[15:0];
`else
reg [15:0] DO;
always @(posedge CK)
if (WBen && !CKenb) DO[15:0] <= #`db DI[15:0];
`endif

endmodule




`ifdef FD_DFT
module REG4LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG4LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [3:0] DI;
output [3:0] DO;
reg [3:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[3:0] <= #`db 4'b0;
else if (WBen) DO[3:0] <= #`db DI[3:0];
`else
always @(posedge CK or posedge CLR)
if (CLR) DO[3:0] <= #`db 4'b0;
else if (WBen && !CKenb) DO[3:0] <= #`db DI[3:0];
`endif

endmodule


`ifdef FD_DFT
module REG5LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG5LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [4:0] DI;
output [4:0] DO;
reg [4:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[4:0] <= #`db 5'b0;
else if (WBen) DO[4:0] <= #`db DI[4:0];
`else
always @(posedge CK or posedge CLR)
if (CLR) DO[4:0] <= #`db 5'b0;
else if (WBen && !CKenb) DO[4:0] <= #`db DI[4:0];
`endif


endmodule
`ifdef FD_DFT
module REG7LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG7LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [6:0] DI;
output [6:0] DO;
reg [6:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[6:0] <= #`db 7'b0;
else if (WBen) DO[6:0] <= #`db DI[6:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[6:0] <= #`db 7'b0;
else if (WBen && !CKenb) DO[6:0] <= #`db DI[6:0];
`endif

endmodule

`ifdef FD_DFT
module REG8LCI (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG8LCI (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [7:0] DI;
output [7:0] DO;
reg [7:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[7:0] <= #`db 8'b01010101;
else if (WBen) DO[7:0] <= #`db DI[7:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[7:0] <= #`db 8'b01010101;
else if (WBen && !CKenb) DO[7:0] <= #`db DI[7:0];
`endif

endmodule

`ifdef FD_DFT
module REG9LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG9LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [8:0] DI;
output [8:0] DO;
reg [8:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[8:0] <= #`db 9'b0;
else if (WBen) DO[8:0] <= #`db DI[8:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[8:0] <= #`db 9'b0;
else if (WBen && !CKenb) DO[8:0] <= #`db DI[8:0];
`endif

endmodule


`ifdef FD_DFT
module REG11LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG11LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [10:0] DI;
output [10:0] DO;
reg [10:0] DO;

`ifdef FD_GTCLK

GTECH_NOT uu0 (.Z(CLR_), .A(CLR));
`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[10:0] <= #`db 11'b0;
else if (WBen) DO[10:0] <= #`db DI[10:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[10:0] <= #`db 11'b0;
else if (WBen && !CKenb) DO[10:0] <= #`db DI[10:0];
`endif

endmodule


`ifdef FD_DFT
module REG12LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG12LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [11:0] DI;
output [11:0] DO;
reg [11:0] DO;

`ifdef FD_GTCLK

GTECH_NOT uu0 (.Z(CLR_), .A(CLR));
`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[11:0] <= #`db 12'b0;
else if (WBen) DO[11:0] <= #`db DI[11:0];

`else

always @(posedge CK or posedge CLR)
if (CLR) DO[11:0] <= #`db 12'b0;
else if (WBen && !CKenb) DO[11:0] <= #`db DI[11:0];

`endif

endmodule


`ifdef FD_DFT
module REG14LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG14LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [13:0] DI;
output [13:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

reg [13:0] DO;
always @(posedge CLK or posedge CLR)
if (CLR) DO[13:0] <= #`db 14'b0;
else if (WBen) DO[13:0] <= #`db DI[13:0];

`else

reg [13:0] DO;
always @(posedge CK or posedge CLR)
if (CLR) DO[13:0] <= #`db 14'b0;
else if (WBen && !CKenb) DO[13:0] <= #`db DI[13:0];

`endif

endmodule

`ifdef FD_DFT
module REG16LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module REG16LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [15:0] DI;
output [15:0] DO;
reg [15:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[15:0] <= #`db 16'b0;
else if (WBen) DO[15:0] <= #`db DI[15:0];
`else
always @(posedge CK or posedge CLR)
if (CLR) DO[15:0] <= #`db 16'b0;
else if (WBen && !CKenb) DO[15:0] <= #`db DI[15:0];
`endif

endmodule



`ifdef FD_DFT
module REG2D8L (CK, CKenb, WBen, DI1, DI2, DO, SCAN_TEST);
input CK, CKenb, WBen, SCAN_TEST;
`else
module REG2D8L (CK, CKenb, WBen, DI1, DI2, DO);
input CK, CKenb, WBen;
`endif

input [7:0] DI1, DI2 ;
output [7:0] DO;
reg [7:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK) begin
if (WBen) DO[7:0] <= #`db DI1[7:0];
else DO[7:0] <= #`db DI2[7:0];
end

`else
always @(posedge CK) begin
if (WBen && !CKenb) DO[7:0] <= #`db DI1[7:0];
else if(!CKenb) DO[7:0] <= #`db DI2[7:0];
end

`endif

endmodule


`ifdef FD_DFT
module REG2D16L (CK, CKenb, WBen, DI1, DI2, DO, SCAN_TEST);
input CK, CKenb, WBen, SCAN_TEST;
`else
module REG2D16L (CK, CKenb, WBen, DI1, DI2, DO);
input CK, CKenb, WBen;
`endif

input [15:0] DI1, DI2;
output [15:0] DO;
reg [15:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu0(.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK) begin
if (WBen) DO[15:0] <= #`db DI1[15:0];
else DO[15:0] <= #`db DI2[15:0];
end
`else
always @(posedge CK) begin
if (WBen && !CKenb) DO[15:0] <= #`db DI1[15:0];
else if(!CKenb) DO[15:0] <= #`db DI2[15:0];
end
`endif

endmodule



`ifdef FD_DFT
module SREG16MC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module SREG16MC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [15:0] DI;
output [15:0] DO;
reg [15:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[15:0] <= #`db 16'h0800;
else if (WBen) DO[15:0] <= #`db DI[15:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[15:0] <= #`db 16'h0800;
else if (WBen && !CKenb) DO[15:0] <= #`db DI[15:0];
`endif

endmodule



`ifdef FD_DFT
module MREG16MC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module MREG16MC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [15:0] DI;
output [15:0] DO;
reg [15:0] DO;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[15:0] <= #`db {2'h3, 4'h0, 3'h7, 3'h7, 4'hf};
else if (WBen) DO[15:0] <= #`db DI[15:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[15:0] <= #`db {2'h3, 4'h0, 3'h7, 3'h7, 4'hf};
else if (WBen && !CKenb) DO[15:0] <= #`db DI[15:0];
`endif

endmodule



`ifdef FD_DFT
module EREG15LC (CK, CKenb, WBen, DI, DO, CLR, SCAN_TEST);
input CK, CKenb, WBen, CLR, SCAN_TEST;
`else
module EREG15LC (CK, CKenb, WBen, DI, DO, CLR);
input CK, CKenb, WBen, CLR;
`endif

input [14:0] DI;
output [14:0] DO;
reg [14:0] DO;

`ifdef FD_GTCLK
`ifdef FD_DFT
GTECH_AND_NOT utm0 (.A(CKenb), .B(SCAN_TEST), .Z(CKenb_dft));
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb_dft));
`else
OR2LC uu1 (.O(CLK), .I1(CK), .I2(CKenb));
`endif

always @(posedge CLK or posedge CLR)
if (CLR) DO[14:0] <= #`db 15'h7fff;
else if (WBen) DO[14:0] <= #`db DI[14:0];

`else
always @(posedge CK or posedge CLR)
if (CLR) DO[14:0] <= #`db 15'h7fff;
else if (WBen && !CKenb) DO[14:0] <= #`db DI[14:0];
`endif

endmodule





module IDEBN (SCLK, IN, OUT);


input SCLK, IN;
output OUT;

reg IN_syn, OUT;
wire OUT_di;

always @(posedge SCLK)
begin
IN_syn <= #1 IN;
OUT <= #1 OUT_di;
end

assign OUT_di = OUT ? (IN | IN_syn) : (IN & IN_syn);


endmodule





module Delaya (i, o);
input i;
output o;

Delbufx u1 (.I(i), .O(o));
endmodule

module Oneshot (i, o);

input i;
output o;
wire deli;
wire del1, del2, del3, del4, del5, del6, del7, del8, del9;


Delbufx Delbuf1 (i,del1);
Delbufx Delbuf2 (del1,del2);
Delbufx Delbuf3 (del2,del3);
Delbufx Delbuf4 (del3,del4);
Delbufx Delbuf5 (del4,del5);
Delbufx Delbuf6 (del5,del6);
Delbufx Delbuf7 (del6,del7);
Delbufx Delbuf8 (del7,del8);
Delbufx Delbuf9 (del8,del9);
Delbufx Delbufa (del9,deli);

assign #`da o = i && !deli;

endmodule

module Delbufx (I, O);
input I;
output O;
assign #0.1 O = I;
endmodule


module HALFP (RST,
CLK,
IN,
`ifdef FD_DFT
SCAN_TEST,
`endif
WEP1);

input RST, CLK, IN;
`ifdef FD_DFT
input SCAN_TEST;
`endif
output WEP1;

reg FFout;
wire FFout_d, CLR, CLK_;
wire FFout_d1, FFout_d2, FFout_d3, FFout_d4;

assign #`db CLK_ = ~CLK;

always @(posedge CLK or posedge CLR)
if (CLR) FFout <= #`db 1'b0;
else FFout <= #`db IN;



Delbufx Delbuf1 (FFout,FFout_d1);
Delbufx Delbuf2 (FFout_d1,FFout_d2);
Delbufx Delbuf3 (FFout_d2,FFout_d3);
Delbufx Delbuf4 (FFout_d3,FFout_d);


Delbufx Delbuf0 (FFout_d1,WEP1);
`ifdef FD_DFT
wire CLR_h = RST | (CLK_ & FFout_d);
assign CLR = SCAN_TEST ? RST : CLR_h;
`else
assign #`da CLR = RST | (CLK_ & FFout_d);
`endif

endmodule




module OR2LC(I1, I2, O);
input I1, I2;
output O;



GtCLK_NOR2 U0 (.A (I2 ),.B (I1 ),.Z (N1));
GtCLK_NOT U1 (.Z (O),.A (N1));

endmodule

module ZFMA28SB(IO, O, I, E, E4, E2, SMT, PU, PD, SR);

input IO, I, E, E4, E2, SMT, PU, PD, SR;
output O;

endmodule // ZFMA28SB

module ZFA2GSB(IO, O, I, E, E8, E4, E2, SMT, PU, PD, SR);

input IO, I, E, E8, E4, E2, SMT, PU, PD, SR;
output O;

endmodule // ZFA2GSB

module ZCC04A(IO, O, I, E);

input IO, I, E;
output O;

endmodule // ZCC04A

module SH208018 ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
                  DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
                  DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
                  DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // SH208018

module SH210018 ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2,
                  DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16,
                  DI17, DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                  DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // SH210018

module SU208018 (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, DO0, DO1, DO2, DO3, DO4, DO5,
                 DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19,
                 DO20, DO21, DO22, DO23, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10,
                 DI11, DI12, DI13, DI14, DI15, DI16, DI17, DI18, DI19, DI20, DI21, DI22, DI23,
                 CK, WEB, CS, OE);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, DO0, DO1, DO2, DO3, DO4, DO5,
      CK, WEB, CS, OE;
output DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19,
       DO20, DO21, DO22, DO23, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10,
       DI11, DI12, DI13, DI14, DI15, DI16, DI17, DI18, DI19, DI20, DI21, DI22, DI23;

endmodule // SU208018

module SH304010 ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2,
                  DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16,
                  DI17, DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                  DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // 304010

module SH308010 ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2,
                  DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16,
                  DI17, DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                  DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // 308010

module SU208010 ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2,
                  DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16,
                  DI17, DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                  DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // SU208010

module SU210018 ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2,
                  DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16,
                  DI17, DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                  DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // SU210018

module SW10201A ( A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2,
                  DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16,
                  DI17, DI18, DI19, DI20, DI21, DI22, DI23, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                  DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21,
                  DO22, DO23, OE, WEB);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, CK, CS, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
      DI18, DI19, DI20, DI21, DI22, DI23, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16,
       DO17, DO18, DO19, DO20, DO21, DO22, DO23;

endmodule // SW10201A

module SW10200C(A0, A1, A2, A3, A4, B0, B1, B2, B3, B4, CKA, CKB, CSA, CSB, DI0, DI1, DI2, DI3,
                DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7,
                DO8, DO9, DO10, DO11, OE, WEB);

input A0, A1, A2, A3, A4, B0, B1, B2, B3, B4, CKA, CKB, CSA, CSB, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, OE, WEB;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11;

endmodule // SW10200C


module SU20E010(A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, DO0, DO1, DO2, DO3, DO4,
                DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DI0, DI1, DI2, DI3,
                DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, CK, WEB, CS, OE);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, CK, WEB, CS, OE;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15;

endmodule // SU20E010

module SU210010(A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, DO0, DO1, DO2, DO3, DO4,
                DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DI0, DI1, DI2, DI3,
                DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, CK, WEB, CS, OE);

input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, DI0, DI1, DI2, DI3,
      DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, CK, WEB, CS, OE;
output DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15;

endmodule // SU210010
