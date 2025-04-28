module reduce_xnor1_1(a, b);
  input a;
  output b;
  assign b = ~^a;
endmodule
