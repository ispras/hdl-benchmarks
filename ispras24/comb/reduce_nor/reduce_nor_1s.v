module reduce_nor_1s(a, b);
  input signed a;
  output signed b;
  assign b = ~|a;
endmodule
