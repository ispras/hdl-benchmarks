module bitwise_nand_5_3_8(a, b, c);
  input [4:0] a;
  input [2:0] b;
  output [7:0] c;
  assign c = a ~& b;
endmodule
