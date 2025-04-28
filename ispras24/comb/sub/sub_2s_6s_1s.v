module sub_2s_6s_1s(a, b, c);
  input signed [1:0] a;
  input signed [5:0] b;
  output signed c;
  assign c = a - b;
endmodule
