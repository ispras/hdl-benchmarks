module reduce_nor_1(a, b);
  input a;
  output b;
  assign b = ~|a;
endmodule
