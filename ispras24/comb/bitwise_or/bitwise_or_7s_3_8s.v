module bitwise_or_7s_3_8s(a, b, c);
  input signed [6:0] a;
  input [2:0] b;
  output signed [7:0] c;
  assign c = a | b;
endmodule
