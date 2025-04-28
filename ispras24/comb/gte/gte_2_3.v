module gte_2_3(a, b, c);
  input [1:0] a;
  input [2:0] b;
  output c;

  assign c = (a >= b);

endmodule
