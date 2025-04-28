module pow_4_6(a, b, c);
  input [3:0] a;
  input [5:0] b;
  output [23:0] c;

  assign c = a ** b;

endmodule
