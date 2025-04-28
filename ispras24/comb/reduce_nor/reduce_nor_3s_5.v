module reduce_nor_3s_5(a, b);
  input signed [2:0] a;
  output [4:0] b;
  assign b = ~|a;
endmodule
