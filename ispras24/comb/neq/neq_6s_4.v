module neq_6s_4(a, b, c);
  input signed [5:0] a;
  input [3:0] b;
  output c;

  assign c = (a != b);

endmodule
