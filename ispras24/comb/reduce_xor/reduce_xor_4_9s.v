module reduce_xor_4_9s(a, b);
  input [3:0] a;
  output signed [8:0] b;
  assign b = ^a;
endmodule
