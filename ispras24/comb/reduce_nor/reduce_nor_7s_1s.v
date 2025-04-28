module reduce_nor_7s_1s(a, b);
  input signed [6:0] a;
  output signed b;
  assign b = ~|a;
endmodule
