module wrapper(
    input [127:0] encoded,
    input [255:0] key,
    output [127:0] block,
    input clk);

  reg [127:0] encoded_buf;
  reg [255:0] key_buf;
  wire [127:0] w_blk_buf;
  reg [127:0] blk_buf;

  always @ (posedge clk) begin
    encoded_buf <= encoded;
    key_buf <= key;
  end

  KuznechikDecoder inst (
      .encoded(encoded_buf),
      .key(key_buf),
      .block(w_blk_buf),
      .clk(clk)
  );

  always @ (posedge clk) begin
    blk_buf <= w_blk_buf;
  end

  assign block = blk_buf;

endmodule

