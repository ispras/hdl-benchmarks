module gte_3s_2(a, b, c);
  input signed [2:0] a;
  input [1:0] b;
  output c;

  assign c = (a >= b);

endmodule
