module reduce_xnor2_1s(a, b);
  input signed a;
  output signed b;
  assign b = ^~a;
endmodule
