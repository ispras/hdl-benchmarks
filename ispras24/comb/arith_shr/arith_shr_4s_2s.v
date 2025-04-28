module arith_shr_4s_2s(a, b, c);
  input signed [3:0] a;
  input signed [1:0] b;
  output signed [3:0] c;
  assign c = a >>> b;
endmodule
