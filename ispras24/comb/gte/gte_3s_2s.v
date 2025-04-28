module gte_3s_2s(a, b, c);
  input signed [2:0] a;
  input signed [1:0] b;
  output c;

  assign c = (a >= b);

endmodule
