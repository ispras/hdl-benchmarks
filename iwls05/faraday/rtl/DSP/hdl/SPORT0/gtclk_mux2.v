module GtCLK_MUX2 ( Z, A, B, S );

input A, B, S;
output Z;

GTECH_MUX2 Gtclk1 (.Z(Z), .S(S), .A(A), .B(B));

endmodule
