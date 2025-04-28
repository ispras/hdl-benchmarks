module neq_6s_4s(a, b, c);
  input signed [5:0] a;
  input signed [3:0] b;
  output c;

  assign c = (a != b);

endmodule
