module bitwise_nand_5_3(a, b, c);
  input [4:0] a;
  input [2:0] b;
  output [4:0] c;
  assign c = a ~& b;
endmodule
