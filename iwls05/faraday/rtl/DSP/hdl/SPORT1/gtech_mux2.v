module GTECH_MUX2(Z, S, A, B);

output Z;
input S;
input A;
input B;

assign Z = S ? B : A;

endmodule
