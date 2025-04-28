module pow_4_4(a, b, c);
  input [3:0] a;
  input [3:0] b;
  output [15:0] c;

  assign c = a ** b;

endmodule
