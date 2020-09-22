






`include "x_def.v"

module GtCLK_OR_NOT ( Z, A, B );
input A, B;
output Z;
GTECH_OR_NOT Gtclk1 (.Z(Z), .B(B), .A(A));
endmodule

module GtCLK_NOT ( Z, A );
input A;
output Z;
GTECH_NOT Gtclk1 (.Z(Z), .A(A));
endmodule

module GtCLK_AND3 ( Z, A, B, C );
input A, B, C;
output Z;
GTECH_AND3 Gtclk1 (.Z(Z), .A(A), .B(B), .C(C));
endmodule

module GtCLK_BUF ( Z, A );
input A;
output Z;
GTECH_BUF Gtclk1 (.Z(Z), .A(A));

endmodule

module GtCLK_NOR3 ( Z, A, B, C );
input A, B, C;
output Z;
GTECH_NOR3 Gtclk1 (.Z(Z), .A(A), .B(B), .C(C));
endmodule

module GtCLK_NOR2 ( Z, A, B );
input A, B;
output Z;
GTECH_NOR2 Gtclk1 (.Z(Z), .A(A), .B(B));
endmodule

module GtCLK_MUX2 ( Z, A, B, S );
input A, B, S;
output Z;
GTECH_MUX2 Gtclk1 (.Z(Z), .S(S), .A(A), .B(B));
endmodule

module GtCLK_OA21 ( Z, A, B, C );
input A, B, C;
output Z;
GTECH_OA21 Gtclk1 (.Z(Z), .C(C), .A(A), .B(B));
endmodule

module GtCLK_OR2 ( Z, A, B );
input A, B;
output Z;
GTECH_OR2 Gtclk1 (.Z(Z), .A(A), .B(B));
endmodule

module GtCLK_NAND2 ( Z, A, B );
input A, B;
output Z;
GTECH_NAND2 Gtclk1 (.Z(Z), .A(A), .B(B));
endmodule

module GtCLK_NAND3 ( Z, A, B, C );
input A, B, C;
output Z;
GTECH_NAND3 Gtclk1 (.Z(Z), .A(A), .B(B), .C(C));
endmodule

module GtCLK_FJK3 ( Q, QN, CP, CD, SD, J, K);
input CP, CD, SD, J, K;
output Q, QN;
GTECH_FJK3 STDCLK_reg (.Q(Q), .QN(QN), .CP(CP), .CD(CD),
.SD(SD), .J(J), .K(K));
endmodule

