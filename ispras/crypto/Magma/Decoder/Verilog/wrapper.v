module wrapper(
    input [63:0] encoded,
    input [255:0] key,
    output [63:0] block,
    input clk);

  reg [63:0] encoded_buf;
  reg [255:0] key_buf;
  wire [63:0] w_blk_buf;
  reg [63:0] blk_buf;

  always @ (posedge clk) begin
    encoded_buf <= encoded;
    key_buf <= key;
  end

  MagmaDecoder inst (
      .encoded(encoded_buf),
      .key(key_buf),
      .block(w_blk_buf)
  );

  always @ (posedge clk) begin
    blk_buf <= w_blk_buf;
  end

  assign block = blk_buf;

endmodule

