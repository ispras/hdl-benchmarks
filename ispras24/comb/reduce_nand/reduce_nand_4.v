module reduce_nand_4(a, b);
  input [3:0] a;
  output b;
  assign b = ~&a;
endmodule
