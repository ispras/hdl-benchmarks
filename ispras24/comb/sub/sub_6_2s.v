module sub_6_2s(a, b, c);
  input [5:0] a;
  input signed [1:0] b;
  output signed [6:0] c;
  assign c = a - b;
endmodule
