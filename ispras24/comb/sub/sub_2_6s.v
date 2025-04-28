module sub_2_6s(a, b, c);
  input [1:0] a;
  input signed [5:0] b;
  output signed [6:0] c;
  assign c = a - b;
endmodule
