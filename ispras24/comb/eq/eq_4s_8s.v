module eq_4s_8s(a, b, c);
  input signed [3:0] a;
  input signed [7:0] b;
  output c;

  assign c = (a == b);

endmodule
