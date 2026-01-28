module div_8s_8s_9s(a, b, c);
  input signed [7:0] a;
  input signed [7:0] b;
  output signed [8:0] c;

  assign c = a / b;

endmodule
