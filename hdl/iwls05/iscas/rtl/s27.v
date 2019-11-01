module s27_bench(
  blif_clk_net,
  blif_reset_net,
  G0,
  G1,
  G2,
  G3,
  G17);
input blif_clk_net;
input blif_reset_net;
input G0;
input G1;
input G2;
input G3;
output G17;
reg G5;
reg G6;
reg G7;
wire G8;
wire G11;
wire G9;
wire G16;
wire G14;
wire G13;
wire G12;
wire G15;
wire G10;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G5 <= 0;
  else
    G5 <= G10;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G6 <= 0;
  else
    G6 <= G11;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G7 <= 0;
  else
    G7 <= G13;
assign G14 = ((~G0));
assign G8 = (G14&G6);
assign G11 = ((~G5)&(~G9));
assign G17 = ((~G11));
assign G9 = ((~G16))|((~G15));
assign G13 = ((~G2)&(~G12));
assign G12 = ((~G1)&(~G7));
assign G15 = (G12)|(G8);
assign G10 = ((~G14)&(~G11));
assign G16 = (G3)|(G8);
endmodule
