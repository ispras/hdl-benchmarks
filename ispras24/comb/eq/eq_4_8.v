module eq_4_8(a, b, c);
  input [3:0] a;
  input [7:0] b;
  output c;

  assign c = (a == b);

endmodule
