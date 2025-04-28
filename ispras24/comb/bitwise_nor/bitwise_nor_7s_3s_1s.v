module bitwise_nor_7s_3s_1s(a, b, c);
  input signed [6:0] a;
  input signed [2:0] b;
  output signed c;
  assign c = a ~| b;
endmodule
