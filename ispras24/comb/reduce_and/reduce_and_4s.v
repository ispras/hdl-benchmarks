module reduce_and_4s(a, b);
  input signed [3:0] a;
  output b;
  assign b = &a;
endmodule
