module MagmaAdder(
  input wire [31:0] left,
  input wire [31:0] right,
  input wire clk,
  output wire [31:0] out
);
  wire [31:0] add_8;
  assign add_8 = left + right;
  assign out = add_8;
endmodule
