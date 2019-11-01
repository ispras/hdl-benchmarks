
`define del 1
`include "../../include/x_def.v"

module CLA15_0 (/* IN  */ A, B, Cin,
                /* OUT */ SUM);

input [15:1] A, B;
input Cin;

output [15:1] SUM;


wire [15:1] P, G, PS;
wire GS;
assign P[15:1]  = A[15:1] | B[15:1];
assign G[15:1]  = A[15:1] & B[15:1];
assign PS[15:1] = A[15:1] ^ B[15:1];
assign GS = Cin ? (G[1] | P[1]) : G[1];


wire [7:1] G1;
assign G1[1] = G[2]  | (P[2]  & GS   );
assign G1[2] = G[4]  | (P[4]  & G[3] );
assign G1[3] = G[6]  | (P[6]  & G[5] );
assign G1[4] = G[8]  | (P[8]  & G[7] );
assign G1[5] = G[10] | (P[10] & G[9] );
assign G1[6] = G[12] | (P[12] & G[11]);
assign G1[7] = G[14] | (P[14] & G[13]);


wire [7:1] P1;
assign P1[1] = P[2]  & P[1];
assign P1[2] = P[4]  & P[3];
assign P1[3] = P[6]  & P[5];
assign P1[4] = P[8]  & P[7];
assign P1[5] = P[10] & P[9];
assign P1[6] = P[12] & P[11];
assign P1[7] = P[14] & P[13];


wire [4:1] G2;
assign G2[1] = G1[2] | (P1[2] & G1[1]);
assign G2[2] = G1[4] | (P1[4] & G1[3]);
assign G2[3] = G1[6] | (P1[6] & G1[5]);
assign G2[4] = G[15] | (P[15] & G1[7]);


wire [4:1] P2;
assign P2[1] = P1[2] & P1[1];
assign P2[2] = P1[4] & P1[3];
assign P2[3] = P1[6] & P1[5];
assign P2[4] = P[15] & P1[7];


wire [2:1] G3;
assign G3[1] = G2[2] | (P2[2] & G2[1]);
assign G3[2] = G2[4] | (P2[4] & G2[3]);


wire [2:1] P3;
assign P3[1] = P2[2] & P2[1];
assign P3[2] = P2[4] & P2[3];


wire C14, C13, C12, C11, C10;
wire  C9,  C8,  C7,  C6,  C5;
wire  C4,  C3,  C2,  C1;

wire T1, T2, T3, T4, T5;

assign #`db C1 = GS;
assign #`db C2 = G1[1];
assign #`db C3 = G[3] | (G1[1] & P[3]);

assign #`db C4 = G2[1];
assign #`db C5 = G[5]  | (G2[1] & P[5] );
assign #`db C6 = G1[3] | (G2[1] & P1[3]);
assign #`db C7 = G[7]  | (  C6  & P[7] );

assign #`db C8  = G3[1];
assign #`db C9  = G[9]  | (G3[1] & P[9] );
assign #`db C10 = G1[5] | (G3[1] & P1[5]);
assign #`db T1  = G[11] | (G1[5] & P[11]);
assign #`db C11 =   T1  | (G3[1] & P[11] & P1[5]);

assign #`db C12 = G2[3] | (G3[1] & P2[3]);
assign #`db T2  = G[13] | (G2[3] & P[13]);
assign #`db C13 =   T2  | (G3[1] & P2[3] & P[13]);
assign #`db T3  = G1[7] | (G2[3] & P1[7]);
assign #`db C14 =   T3  | (G3[1] & P2[3] & P1[7]);



wire [15:1] SUM;

assign #`db SUM[1]  = Cin ^ PS[1] ;
assign #`db SUM[2]  =  C1 ^ PS[2] ;
assign #`db SUM[3]  =  C2 ^ PS[3] ;
assign #`db SUM[4]  =  C3 ^ PS[4] ;
assign #`db SUM[5]  =  C4 ^ PS[5] ;
assign #`db SUM[6]  =  C5 ^ PS[6] ;
assign #`db SUM[7]  =  C6 ^ PS[7] ;
assign #`db SUM[8]  =  C7 ^ PS[8] ;
assign #`db SUM[9]  =  C8 ^ PS[9] ;
assign #`db SUM[10] =  C9 ^ PS[10];
assign #`db SUM[11] = C10 ^ PS[11];
assign #`db SUM[12] = C11 ^ PS[12];
assign #`db SUM[13] = C12 ^ PS[13];
assign #`db SUM[14] = C13 ^ PS[14];
assign #`db SUM[15] = C14 ^ PS[15];

endmodule
