module arith_shl_5s_3s(a, b, c);
  input signed [4:0] a;
  input signed [2:0] b;
  output signed [12:0] c;
  assign c = a <<< b;
endmodule
