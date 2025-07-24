module wrapper(
    input [63:0] block,
    input [255:0] key,
    output [63:0] encoded,
    input clk);

  reg [63:0] block_buf;
  reg [255:0] key_buf;
  wire [63:0] w_enc_buf;
  reg [63:0] enc_buf;

  always @ (posedge clk) begin
    block_buf <= block;
    key_buf <= key;
  end

  MagmaEncoder inst (
      .block(block_buf),
      .key(key_buf),
      .encoded(w_enc_buf),
      .clk(clk)
  );

  always @ (posedge clk) begin
    enc_buf <= w_enc_buf;
  end

  assign encoded = enc_buf;

endmodule

