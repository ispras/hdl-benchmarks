






`include "../../include/x_def.v"







module PCstk (/* in */ T_RST, DSPCLK, PCin, PushPC_EN, PopPC_EN,
PCS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif

TopPC, nTopPC, PC_full, PC_empty,
PC_has1);

input [13:0] PCin;
input T_RST, DSPCLK, PushPC_EN, PopPC_EN, PCS_CKenb;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [13:0] TopPC,
nTopPC;
output PC_empty,
PC_full,
PC_has1;

reg [4:0] ptr;
wire [13:0] stkin;
wire [4:0] ptr_in, ptr_p, ptr_m;
wire [3:0] WA, RA, RA_m;
wire WE;
wire pop, push;

`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND_NOT utm1 (.Z(PCS_CKenb_dft), .A(PCS_CKenb), .B(SCAN_TEST));
GTECH_NOR2 uk0 (.Z(PCSCLK_), .A(DSPCLK), .B(PCS_CKenb_dft));
GtCLK_NOT ckPCSCLK (.Z(PCSCLK), .A(PCSCLK_));
`else
GTECH_NOR2 uk0 (.Z(PCSCLK_), .A(DSPCLK), .B(PCS_CKenb));
GtCLK_NOT ckPCSCLK (.Z(PCSCLK), .A(PCSCLK_));
`endif

`else
wire PCSCLK_en = !PCS_CKenb;
wire PCSCLK = DSPCLK;
`endif








assign #`da push = PushPC_EN && !PC_full;
assign #`da pop = PopPC_EN && !PC_empty;

assign #`d0 stkin[13:0] = PCin[13:0];

assign #`da ptr_p[4:0] = ptr[4:0] + 1'b1;
assign #`da ptr_m[4:0] = ptr[4:0] - 1'b1;
assign #`da ptr_in[4:0] = push ? ptr_p[4:0] : ptr_m[4:0];

always @(posedge PCSCLK or posedge T_RST) begin
if (T_RST) ptr[4:0] <= #`db 5'b11111;
`ifdef FD_GTCLK
else if (push || pop) ptr[4:0] <= #`db ptr_in[4:0];
`else
else if ((push || pop) & PCSCLK_en) ptr[4:0] <= #`db ptr_in[4:0];
`endif
end



assign #`d0 PC_empty = ptr[4];
assign #`da PC_full = (ptr[4:0] == 5'hf);
assign #`da PC_has1 = (ptr[4:0] == 5'h0);



`ifdef FD_GTCLK
assign #`d0 WE = push;
`else
assign #`d0 WE = push & PCSCLK_en;
`endif
assign #`da WA[3:0] = ptr_p[3:0];
assign #`da RA[3:0] = ptr[3:0];
assign #`da RA_m[3:0] = ptr_m[3:0];

PCS16x14 cnts16x14 (PCSCLK, WE, WA[3:0], stkin[13:0], RA[3:0], RA_m[3:0],
TopPC[13:0], nTopPC[13:0]);

endmodule







module PCS16x14 (PCSCLK, WE, WA[3:0], stkin[13:0], RA[3:0], RA_m[3:0],
TopPC[13:0], nTopPC[13:0]);

output [13:0] TopPC, nTopPC;
input [13:0] stkin;
input [3:0] RA, RA_m, WA;
input PCSCLK, WE;

reg [13:0] PCcell[15:0];
reg [13:0] TopPC, nTopPC;




always @(posedge PCSCLK)
if (WE) PCcell[WA] <= #`db stkin[13:0];





always @(RA)
case(RA)
4'b0000 : TopPC = PCcell[4'b0000];
4'b0001 : TopPC = PCcell[4'b0001];
4'b0010 : TopPC = PCcell[4'b0010];
4'b0011 : TopPC = PCcell[4'b0011];
4'b0100 : TopPC = PCcell[4'b0100];
4'b0101 : TopPC = PCcell[4'b0101];
4'b0110 : TopPC = PCcell[4'b0110];
4'b0111 : TopPC = PCcell[4'b0111];
4'b1000 : TopPC = PCcell[4'b1000];
4'b1001 : TopPC = PCcell[4'b1001];
4'b1010 : TopPC = PCcell[4'b1010];
4'b1011 : TopPC = PCcell[4'b1011];
4'b1100 : TopPC = PCcell[4'b1100];
4'b1101 : TopPC = PCcell[4'b1101];
4'b1110 : TopPC = PCcell[4'b1110];
4'b1111 : TopPC = PCcell[4'b1111];
default : TopPC = PCcell[4'b0000];
endcase




always @(RA_m)
case(RA_m)
4'b0000 : nTopPC = PCcell[4'b0000];
4'b0001 : nTopPC = PCcell[4'b0001];
4'b0010 : nTopPC = PCcell[4'b0010];
4'b0011 : nTopPC = PCcell[4'b0011];
4'b0100 : nTopPC = PCcell[4'b0100];
4'b0101 : nTopPC = PCcell[4'b0101];
4'b0110 : nTopPC = PCcell[4'b0110];
4'b0111 : nTopPC = PCcell[4'b0111];
4'b1000 : nTopPC = PCcell[4'b1000];
4'b1001 : nTopPC = PCcell[4'b1001];
4'b1010 : nTopPC = PCcell[4'b1010];
4'b1011 : nTopPC = PCcell[4'b1011];
4'b1100 : nTopPC = PCcell[4'b1100];
4'b1101 : nTopPC = PCcell[4'b1101];
4'b1110 : nTopPC = PCcell[4'b1110];
4'b1111 : nTopPC = PCcell[4'b1111];
default : nTopPC = PCcell[4'b0000];
endcase





wire [13:0] pcstk0 = PCcell[0];
wire [13:0] pcstk1 = PCcell[1];
wire [13:0] pcstk2 = PCcell[2];
wire [13:0] pcstk3 = PCcell[3];
wire [13:0] pcstk4 = PCcell[4];
wire [13:0] pcstk5 = PCcell[5];
wire [13:0] pcstk6 = PCcell[6];
wire [13:0] pcstk7 = PCcell[7];
wire [13:0] pcstk8 = PCcell[8];
wire [13:0] pcstk9 = PCcell[9];
wire [13:0] pcstk10 = PCcell[10];
wire [13:0] pcstk11 = PCcell[11];
wire [13:0] pcstk12 = PCcell[12];
wire [13:0] pcstk13 = PCcell[13];
wire [13:0] pcstk14 = PCcell[14];
wire [13:0] pcstk15 = PCcell[15];


endmodule
