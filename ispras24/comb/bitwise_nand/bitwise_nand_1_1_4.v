module bitwise_nand_1_1_4(a, b, c);
  input a;
  input b;
  output [3:0] c;
  assign c = a ~& b;
endmodule
