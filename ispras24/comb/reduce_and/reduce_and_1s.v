module reduce_and_1s(a, b);
  input signed a;
  output signed b;
  assign b = &a;
endmodule
