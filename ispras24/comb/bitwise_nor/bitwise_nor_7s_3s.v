module bitwise_nor_7s_3s(a, b, c);
  input signed [6:0] a;
  input signed [2:0] b;
  output signed [6:0] c;
  assign c = a ~| b;
endmodule
