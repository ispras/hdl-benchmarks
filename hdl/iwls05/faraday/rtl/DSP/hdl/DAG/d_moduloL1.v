



















`define del 1
`include "../../include/x_def.v"

module MODULO1 (/* OUT */ newI, T0wrap, T1wrap, R0wrap, R1wrap,
 T0sack, T1sack, R0sack, R1sack, STEAL_IE2, wrap2,
DSPCLK, I, M, L);

/********************************/

/********************************/

input [13:0] I;
input [13:0] M;
input [13:0] L;
input T0sack;
input T1sack;
input R0sack;
input R1sack;
input STEAL_IE2;
input wrap2;
input DSPCLK;

/********************************/

/********************************/

output [13:0] newI;
output T0wrap;
output T1wrap;
output R0wrap;
output R1wrap;

wire [13:0] PB, Pa;



reg [13:0] Lp, Ln;
reg Sb;

always @( L )
begin
casex( L )
14'b1????????????? : Lp[13:0] = 14'b11111111111111;
14'b01???????????? : Lp[13:0] = 14'b01111111111111;
14'b001??????????? : Lp[13:0] = 14'b00111111111111;
14'b0001?????????? : Lp[13:0] = 14'b00011111111111;
14'b00001????????? : Lp[13:0] = 14'b00001111111111;
14'b000001???????? : Lp[13:0] = 14'b00000111111111;
14'b0000001??????? : Lp[13:0] = 14'b00000011111111;
14'b00000001?????? : Lp[13:0] = 14'b00000001111111;
14'b000000001????? : Lp[13:0] = 14'b00000000111111;
14'b0000000001???? : Lp[13:0] = 14'b00000000011111;
14'b00000000001??? : Lp[13:0] = 14'b00000000001111;
14'b000000000001?? : Lp[13:0] = 14'b00000000000111;
14'b0000000000001? : Lp[13:0] = 14'b00000000000011;
14'b00000000000001 : Lp[13:0] = 14'b00000000000001;
14'b00000000000000 : Lp[13:0] = 14'b00000000000000;
default : Lp[13:0] = 14'b00000000000000;
endcase
end

always @( L )
begin
casex( L )
14'b?????????????1 : Ln[13:0] = 14'b11111111111111;
14'b????????????10 : Ln[13:0] = 14'b11111111111110;
14'b???????????100 : Ln[13:0] = 14'b11111111111100;
14'b??????????1000 : Ln[13:0] = 14'b11111111111000;
14'b?????????10000 : Ln[13:0] = 14'b11111111110000;
14'b????????100000 : Ln[13:0] = 14'b11111111100000;
14'b???????1000000 : Ln[13:0] = 14'b11111111000000;
14'b??????10000000 : Ln[13:0] = 14'b11111110000000;
14'b?????100000000 : Ln[13:0] = 14'b11111100000000;
14'b????1000000000 : Ln[13:0] = 14'b11111000000000;
14'b???10000000000 : Ln[13:0] = 14'b11110000000000;
14'b??100000000000 : Ln[13:0] = 14'b11100000000000;
14'b?1000000000000 : Ln[13:0] = 14'b11000000000000;
14'b10000000000000 : Ln[13:0] = 14'b10000000000000;
14'b00000000000000 : Ln[13:0] = 14'b00000000000000;
default : Ln[13:0] = 14'b00000000000000;
endcase
end

always @( L )
begin
case( L )
14'b00000000000000 : Sb = 0;
14'b00000000000001 : Sb = 0;
14'b00000000000010 : Sb = 0;
14'b00000000000100 : Sb = 0;
14'b00000000001000 : Sb = 0;
14'b00000000010000 : Sb = 0;
14'b00000000100000 : Sb = 0;
14'b00000001000000 : Sb = 0;
14'b00000010000000 : Sb = 0;
14'b00000100000000 : Sb = 0;
14'b00001000000000 : Sb = 0;
14'b00010000000000 : Sb = 0;
14'b00100000000000 : Sb = 0;
14'b01000000000000 : Sb = 0;
14'b10000000000000 : Sb = 0;
default : Sb = 1;
endcase
end



assign #`da PB[13:0] = Sb ? ~Lp[13:0] : Ln[13:0];
assign #`da Pa[13:0] = Sb ? Lp[13:0] : ~Ln[13:0];


/****************************************/


/****************************************/

wire [13:0] B, a;

assign B[13:0] = I[13:0] & PB[13:0];
assign a[13:0] = I[13:0] & Pa[13:0];

/******************************************/





/******************************************/

wire [14:0] Lx, Mx, ax;
assign Lx[14:0] = M[13] ? {1'b0, L[13:0]} : {1'b1, ~L[13:0]};
assign Mx[14:0] = {M[13], M[13:0]};
assign ax[14:0] = {1'b0, a[13:0]};







wire [15:1] P_a, G_a, PS_a;
wire GS_a;
wire Cin_a = 1'b0;
assign P_a[15:1] = ax[14:0] | Mx[14:0];
assign G_a[15:1] = ax[14:0] & Mx[14:0];
assign PS_a[15:1] = ax[14:0] ^ Mx[14:0];
assign GS_a = Cin_a ? (G_a[1] | P_a[1]) : G_a[1];

/****************************************/

/****************************************/

wire [7:1] G1_a;
assign G1_a[1] = G_a[2] | (P_a[2] & GS_a );
assign G1_a[2] = G_a[4] | (P_a[4] & G_a[3] );
assign G1_a[3] = G_a[6] | (P_a[6] & G_a[5] );
assign G1_a[4] = G_a[8] | (P_a[8] & G_a[7] );
assign G1_a[5] = G_a[10] | (P_a[10] & G_a[9] );
assign G1_a[6] = G_a[12] | (P_a[12] & G_a[11]);
assign G1_a[7] = G_a[14] | (P_a[14] & G_a[13]);

/****************************************/

/****************************************/

wire [7:1] P1_a;
assign P1_a[1] = P_a[2] & P_a[1];
assign P1_a[2] = P_a[4] & P_a[3];
assign P1_a[3] = P_a[6] & P_a[5];
assign P1_a[4] = P_a[8] & P_a[7];
assign P1_a[5] = P_a[10] & P_a[9];
assign P1_a[6] = P_a[12] & P_a[11];
assign P1_a[7] = P_a[14] & P_a[13];

/****************************************/

/****************************************/

wire [4:1] G2_a;
assign G2_a[1] = G1_a[2] | (P1_a[2] & G1_a[1]);
assign G2_a[2] = G1_a[4] | (P1_a[4] & G1_a[3]);
assign G2_a[3] = G1_a[6] | (P1_a[6] & G1_a[5]);
assign G2_a[4] = G_a[15] | (P_a[15] & G1_a[7]);

/****************************************/

/****************************************/

wire [4:1] P2_a;
assign P2_a[1] = P1_a[2] & P1_a[1];
assign P2_a[2] = P1_a[4] & P1_a[3];
assign P2_a[3] = P1_a[6] & P1_a[5];
assign P2_a[4] = P_a[15] & P1_a[7];

/****************************************/

/****************************************/

wire [2:1] G3_a;
assign G3_a[1] = G2_a[2] | (P2_a[2] & G2_a[1]);
assign G3_a[2] = G2_a[4] | (P2_a[4] & G2_a[3]);

/****************************************/

/****************************************/

wire [2:1] P3_a;
assign P3_a[1] = P2_a[2] & P2_a[1];
assign P3_a[2] = P2_a[4] & P2_a[3];

/****************************************/

/****************************************/

wire C14_a, C13_a, C12_a, C11_a, C10_a;
wire C9_a, C8_a, C7_a, C6_a, C5_a;
wire C4_a, C3_a, C2_a, C1_a;

wire T1_a, T2_a, T3_a, T4_a, T5_a;

assign #`db C1_a = GS_a;
assign #`db C2_a = G1_a[1];
assign #`db C3_a = G_a[3] | (G1_a[1] & P_a[3]);

assign #`db C4_a = G2_a[1];
assign #`db C5_a = G_a[5] | (G2_a[1] & P_a[5] );
assign #`db C6_a = G1_a[3] | (G2_a[1] & P1_a[3]);
assign #`db C7_a = G_a[7] | ( C6_a & P_a[7] );

assign #`db C8_a = G3_a[1];
assign #`db C9_a = G_a[9] | (G3_a[1] & P_a[9] );
assign #`db C10_a = G1_a[5] | (G3_a[1] & P1_a[5]);
assign #`db T1_a = G_a[11] | (G1_a[5] & P_a[11]);
assign #`db C11_a = T1_a | (G3_a[1] & P_a[11] & P1_a[5]);

assign #`db C12_a = G2_a[3] | (G3_a[1] & P2_a[3]);
assign #`db T2_a = G_a[13] | (G2_a[3] & P_a[13]);
assign #`db C13_a = T2_a | (G3_a[1] & P2_a[3] & P_a[13]);
assign #`db T3_a = G1_a[7] | (G2_a[3] & P1_a[7]);
assign #`db C14_a = T3_a | (G3_a[1] & P2_a[3] & P1_a[7]);


/********************************/

/********************************/

wire [14:0] aM;

assign #`db aM[0] = Cin_a ^ PS_a[1] ;
assign #`db aM[1] = C1_a ^ PS_a[2] ;
assign #`db aM[2] = C2_a ^ PS_a[3] ;
assign #`db aM[3] = C3_a ^ PS_a[4] ;
assign #`db aM[4] = C4_a ^ PS_a[5] ;
assign #`db aM[5] = C5_a ^ PS_a[6] ;
assign #`db aM[6] = C6_a ^ PS_a[7] ;
assign #`db aM[7] = C7_a ^ PS_a[8] ;
assign #`db aM[8] = C8_a ^ PS_a[9] ;
assign #`db aM[9] = C9_a ^ PS_a[10];
assign #`db aM[10] = C10_a ^ PS_a[11];
assign #`db aM[11] = C11_a ^ PS_a[12];
assign #`db aM[12] = C12_a ^ PS_a[13];
assign #`db aM[13] = C13_a ^ PS_a[14];
assign #`db aM[14] = C14_a ^ PS_a[15];



wire [14:0] aML, SO, CO;


CSA_d b0( ax[0], Mx[0], Lx[0], SO[0], CO[0] );
CSA_d b1( ax[1], Mx[1], Lx[1], SO[1], CO[1] );
CSA_d b2( ax[2], Mx[2], Lx[2], SO[2], CO[2] );
CSA_d b3( ax[3], Mx[3], Lx[3], SO[3], CO[3] );
CSA_d b4( ax[4], Mx[4], Lx[4], SO[4], CO[4] );
CSA_d b5( ax[5], Mx[5], Lx[5], SO[5], CO[5] );
CSA_d b6( ax[6], Mx[6], Lx[6], SO[6], CO[6] );
CSA_d b7( ax[7], Mx[7], Lx[7], SO[7], CO[7] );
CSA_d b8( ax[8], Mx[8], Lx[8], SO[8], CO[8] );
CSA_d b9( ax[9], Mx[9], Lx[9], SO[9], CO[9] );
CSA_d b10(ax[10], Mx[10], Lx[10], SO[10], CO[10] );
CSA_d b11(ax[11], Mx[11], Lx[11], SO[11], CO[11] );
CSA_d b12(ax[12], Mx[12], Lx[12], SO[12], CO[12] );
CSA_d b13(ax[13], Mx[13], Lx[13], SO[13], CO[13] );
CSA_d b14(ax[14], Mx[14], Lx[14], SO[14], CO[14] );





wire [14:0] CO_e = {CO[13:0], 1'b0};
wire Cin_b = ~M[13];



wire [15:1] P_b, G_b, PS_b;
wire GS_b;

assign P_b[15:1] = SO[14:0] | CO_e[14:0];
assign G_b[15:1] = SO[14:0] & CO_e[14:0];
assign PS_b[15:1] = SO[14:0] ^ CO_e[14:0];
assign GS_b = Cin_b ? (G_b[1] | P_b[1]) : G_b[1];

/****************************************/

/****************************************/

wire [7:1] G1_b;
assign G1_b[1] = G_b[2] | (P_b[2] & GS_b );
assign G1_b[2] = G_b[4] | (P_b[4] & G_b[3] );
assign G1_b[3] = G_b[6] | (P_b[6] & G_b[5] );
assign G1_b[4] = G_b[8] | (P_b[8] & G_b[7] );
assign G1_b[5] = G_b[10] | (P_b[10] & G_b[9] );
assign G1_b[6] = G_b[12] | (P_b[12] & G_b[11]);
assign G1_b[7] = G_b[14] | (P_b[14] & G_b[13]);

/****************************************/

/****************************************/

wire [7:1] P1_b;
assign P1_b[1] = P_b[2] & P_b[1];
assign P1_b[2] = P_b[4] & P_b[3];
assign P1_b[3] = P_b[6] & P_b[5];
assign P1_b[4] = P_b[8] & P_b[7];
assign P1_b[5] = P_b[10] & P_b[9];
assign P1_b[6] = P_b[12] & P_b[11];
assign P1_b[7] = P_b[14] & P_b[13];

/****************************************/

/****************************************/

wire [4:1] G2_b;
assign G2_b[1] = G1_b[2] | (P1_b[2] & G1_b[1]);
assign G2_b[2] = G1_b[4] | (P1_b[4] & G1_b[3]);
assign G2_b[3] = G1_b[6] | (P1_b[6] & G1_b[5]);
assign G2_b[4] = G_b[15] | (P_b[15] & G1_b[7]);

/****************************************/

/****************************************/

wire [4:1] P2_b;
assign P2_b[1] = P1_b[2] & P1_b[1];
assign P2_b[2] = P1_b[4] & P1_b[3];
assign P2_b[3] = P1_b[6] & P1_b[5];
assign P2_b[4] = P_b[15] & P1_b[7];

/****************************************/

/****************************************/

wire [2:1] G3_b;
assign G3_b[1] = G2_b[2] | (P2_b[2] & G2_b[1]);
assign G3_b[2] = G2_b[4] | (P2_b[4] & G2_b[3]);

/****************************************/

/****************************************/

wire [2:1] P3_b;
assign P3_b[1] = P2_b[2] & P2_b[1];
assign P3_b[2] = P2_b[4] & P2_b[3];

/****************************************/

/****************************************/

wire C14_b, C13_b, C12_b, C11_b, C10_b;
wire C9_b, C8_b, C7_b, C6_b, C5_b;
wire C4_b, C3_b, C2_b, C1_b;

wire T1_b, T2_b, T3_b, T4_b, T5_b;

assign #`db C1_b = GS_b;
assign #`db C2_b = G1_b[1];
assign #`db C3_b = G_b[3] | (G1_b[1] & P_b[3]);

assign #`db C4_b = G2_b[1];
assign #`db C5_b = G_b[5] | (G2_b[1] & P_b[5] );
assign #`db C6_b = G1_b[3] | (G2_b[1] & P1_b[3]);
assign #`db C7_b = G_b[7] | ( C6_b & P_b[7] );

assign #`db C8_b = G3_b[1];
assign #`db C9_b = G_b[9] | (G3_b[1] & P_b[9] );
assign #`db C10_b = G1_b[5] | (G3_b[1] & P1_b[5]);
assign #`db T1_b = G_b[11] | (G1_b[5] & P_b[11]);
assign #`db C11_b = T1_b | (G3_b[1] & P_b[11] & P1_b[5]);

assign #`db C12_b = G2_b[3] | (G3_b[1] & P2_b[3]);
assign #`db T2_b = G_b[13] | (G2_b[3] & P_b[13]);
assign #`db C13_b = T2_b | (G3_b[1] & P2_b[3] & P_b[13]);
assign #`db T3_b = G1_b[7] | (G2_b[3] & P1_b[7]);
assign #`db C14_b = T3_b | (G3_b[1] & P2_b[3] & P1_b[7]);


/********************************/

/********************************/



assign #`db aML[0] = Cin_b ^ PS_b[1] ;
assign #`db aML[1] = C1_b ^ PS_b[2] ;
assign #`db aML[2] = C2_b ^ PS_b[3] ;
assign #`db aML[3] = C3_b ^ PS_b[4] ;
assign #`db aML[4] = C4_b ^ PS_b[5] ;
assign #`db aML[5] = C5_b ^ PS_b[6] ;
assign #`db aML[6] = C6_b ^ PS_b[7] ;
assign #`db aML[7] = C7_b ^ PS_b[8] ;
assign #`db aML[8] = C8_b ^ PS_b[9] ;
assign #`db aML[9] = C9_b ^ PS_b[10];
assign #`db aML[10] = C10_b ^ PS_b[11];
assign #`db aML[11] = C11_b ^ PS_b[12];
assign #`db aML[12] = C12_b ^ PS_b[13];
assign #`db aML[13] = C13_b ^ PS_b[14];
assign #`db aML[14] = C14_b ^ PS_b[15];



wire [13:0] na;
assign #`da na[13:0] = M[13] ? (aM[14] ? aML[13:0] : aM[13:0])
: (aML[14] ? aM[13:0] : aML[13:0]);

assign #`da newI[13:0] = B[13:0] | na[13:0];


wire ALLZerob;
wire wrap1;
assign #`da ALLZerob = ~(L == 0);
assign #`da wrap1 = ~(~(M[13] & aM[14] & ALLZerob) & (M[13] | aML[14] | (~ALLZerob)));

wire wrap = STEAL_IE2 ? wrap2 : wrap1;
reg T0wrap, T1wrap, R0wrap, R1wrap;

always @(posedge DSPCLK) T0wrap <= #`da T0sack & wrap;
always @(posedge DSPCLK) T1wrap <= #`da T1sack & wrap;
always @(posedge DSPCLK) R0wrap <= #`da R0sack & wrap;
always @(posedge DSPCLK) R1wrap <= #`da R1sack & wrap;

endmodule


