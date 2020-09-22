`include "x_def.v"

module PSEL (/* IN */
msub, Y,

P_1p, P_2p, P_1m, P_2m);

input msub;
input [2:0] Y;

output P_1p;
output P_2p;
output P_1m;
output P_2m;

wire P_1pi, P_2pi, P_1mi, P_2mi;
assign P_1pi = (!Y[2]) & (Y[1] ^ Y[0]);
assign P_2pi = (!Y[2]) & (Y[1] & Y[0]);
assign P_1mi = Y[2] & (Y[1] ^ Y[0]);
assign P_2mi = Y[2] & (~(Y[1] | Y[0]));

assign #`da P_1p = msub ? P_1mi : P_1pi;
assign #`da P_2p = msub ? P_2mi : P_2pi;
assign #`da P_1m = msub ? P_1pi : P_1mi;
assign #`da P_2m = msub ? P_2pi : P_2mi;

endmodule

/*--------------------------------------------------------------*/
module PPART(/* IN */ PX_1p, PX_2p, PX_1m, PX_2m,
 PX1p, PX2p, PX1m, PX2m,
 PX[17:0]);

input PX_1p, PX_2p, PX_1m, PX_2m;
input [17:0] PX1p;
input [17:0] PX2p;
input [17:0] PX1m;
input [17:0] PX2m;

output [17:0] PX;
assign #`da PX[17:0] = ({18{PX_1p}} & PX1p[17:0]) |
({18{PX_2p}} & PX2p[17:0]) |
({18{PX_1m}} & PX1m[17:0]) |
({18{PX_2m}} & PX2m[17:0]) ;

endmodule
