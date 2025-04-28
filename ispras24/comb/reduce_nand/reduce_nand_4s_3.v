module reduce_nand_4s_3(a, b);
  input signed [3:0] a;
  output [2:0] b;
  assign b = ~&a;
endmodule
