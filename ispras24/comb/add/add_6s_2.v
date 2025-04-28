module add_6s_2(a, b, c);
  input signed [5:0] a;
  input [1:0] b;
  output signed [6:0] c;
  assign c = a + b;
endmodule
