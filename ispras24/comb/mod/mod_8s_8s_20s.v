module mod_8s_8s_20s(a, b, c);
  input signed [7:0] a;
  input signed [7:0] b;
  output signed [19:0] c;

  assign c = a % b;

endmodule
