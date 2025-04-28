module add_2s_6(a, b, c);
  input signed [1:0] a;
  input [5:0] b;
  output signed [6:0] c;
  assign c = a + b;
endmodule
