module reduce_nand_4s_9s(a, b);
  input signed [3:0] a;
  output signed [8:0] b;
  assign b = ~&a;
endmodule
