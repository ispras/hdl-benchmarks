module reduce_xnor2_1(a, b);
  input a;
  output b;
  assign b = ^~a;
endmodule
