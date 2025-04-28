module add_6s_2s(a, b, c);
  input signed [5:0] a;
  input signed [1:0] b;
  output signed [6:0] c;
  assign c = a + b;
endmodule
