module reduce_xnor1_1s(a, b);
  input signed a;
  output signed b;
  assign b = ~^a;
endmodule
