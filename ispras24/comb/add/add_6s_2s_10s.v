module add_6s_2s_10s(a, b, c);
  input signed [5:0] a;
  input signed [1:0] b;
  output signed [9:0] c;
  assign c = a + b;
endmodule
