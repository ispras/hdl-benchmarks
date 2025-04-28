module bitwise_or_3_7s_1(a, b, c);
  input [2:0] a;
  input signed [6:0] b;
  output c;
  assign c = a | b;
endmodule
