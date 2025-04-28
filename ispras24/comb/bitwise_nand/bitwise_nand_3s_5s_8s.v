module bitwise_nand_3s_5s_8s(a, b, c);
  input signed [2:0] a;
  input signed [4:0] b;
  output signed [7:0] c;
  assign c = a ~& b;
endmodule
