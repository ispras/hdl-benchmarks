module wrapper(
    input wire [63:0] block,
    input wire [255:0] key,
    output wire [63:0] encoded,
    input clk);

  reg [63:0] block_buf;
  reg [255:0] key_buf;
  wire [63:0] w_encoded_buf;
  reg [63:0] encoded_buf;

  always @ (posedge clk) begin
    block_buf <= block;
    key_buf <= key;
  end

  MagmaEncoder inst (
      .block(block_buf),
      .key(key_buf),
      .encoded(w_encoded_buf)
  );

  always @ (posedge clk) begin
    encoded_buf <= w_encoded_buf;
  end

  assign encoded = encoded_buf;

endmodule

