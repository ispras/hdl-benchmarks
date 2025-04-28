module eq_8_4(a, b, c);
  input [7:0] a;
  input [3:0] b;
  output c;

  assign c = (a == b);

endmodule
