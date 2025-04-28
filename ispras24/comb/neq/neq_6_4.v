module neq_6_4(a, b, c);
  input [5:0] a;
  input [3:0] b;
  output c;

  assign c = (a != b);

endmodule
