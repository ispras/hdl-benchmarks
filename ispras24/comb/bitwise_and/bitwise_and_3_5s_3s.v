module bitwise_and_3_5s_3s(a, b, c);
  input [2:0] a;
  input signed [4:0] b;
  output signed [2:0] c;
  assign c = a & b;
endmodule
