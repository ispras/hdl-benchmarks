module lte_3s_4s(a, b, c);
  input signed [2:0] a;
  input signed [3:0] b;
  output c;

  assign c = (a <= b);

endmodule
