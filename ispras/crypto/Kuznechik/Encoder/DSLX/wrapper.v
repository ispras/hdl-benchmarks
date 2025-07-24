module wrapper(
    input [127:0] block,
    input [255:0] key,
    output [127:0] encoded,
    input clk);

  reg [127:0] block_buf;
  reg [255:0] key_buf;
  wire [127:0] w_enc_buf;
  reg [127:0] enc_buf;

  always @ (posedge clk) begin
    block_buf <= block;
    key_buf <= key;
  end

  KuznechikEncoder inst (
      ._block(block_buf),
      .key(key_buf),
      .out(w_enc_buf),
      .clk(clk)
  );

  always @ (posedge clk) begin
    enc_buf <= w_enc_buf;
  end

  assign encoded = enc_buf;

endmodule

