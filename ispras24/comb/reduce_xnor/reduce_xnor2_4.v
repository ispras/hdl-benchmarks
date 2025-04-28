module reduce_xnor2_4(a, b);
  input [3:0] a;
  output b;
  assign b = ^~a;
endmodule
