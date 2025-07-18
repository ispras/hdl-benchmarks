`include "x_def.v"

module Glogic(/* input */
T_RSTn,
T_ICE_RSTn,
T_CLKI_PLL,
T_CLKI_OSC,
T_Sel_PLL,
XTALoffn,
ED_oe,
BMcs,
BDIR,
T_TMODE,
`ifdef FD_DFT
SCAN_TEST,
`endif

P_RSTn,
T_CLKI,
T_selECM,
TMODE,
ED_oe_15,
ED_oe_14_8,
ED_oe_7_0
);

input [1:0] T_TMODE;
input T_RSTn,
ED_oe,
BMcs,
BDIR,
T_ICE_RSTn,
T_CLKI_PLL,
T_CLKI_OSC,
T_Sel_PLL,
XTALoffn;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output P_RSTn,
T_CLKI,
T_selECM,
TMODE,
ED_oe_15,
ED_oe_14_8,
ED_oe_7_0;

wire T_CLKI_SRC;


`ifdef FD_DFT
assign P_RSTn = SCAN_TEST ? T_RSTn : T_RSTn && T_ICE_RSTn;
`else
assign P_RSTn = T_RSTn && T_ICE_RSTn;
`endif


`ifdef FD_DFT
wire T_Sel_PLL_dft;
wire XTALoffn_dft;

assign T_Sel_PLL_dft = T_Sel_PLL && !SCAN_TEST;
assign T_CLKI_SRC = T_Sel_PLL_dft ? T_CLKI_PLL : T_CLKI_OSC;

assign XTALoffn_dft = XTALoffn || SCAN_TEST;
GtCLK_NAND2 ckT_CLKI (.Z(T_CLKI), .A(T_CLKI_SRC), .B(XTALoffn_dft));

`else

assign T_CLKI_SRC = T_Sel_PLL ? T_CLKI_PLL : T_CLKI_OSC;

`ifdef FD_FPGA
assign T_CLKI = !(T_CLKI_SRC && XTALoffn);
`else
GtCLK_NAND2 ckT_CLKI (.Z(T_CLKI), .A(T_CLKI_SRC), .B(XTALoffn));
`endif

`endif

assign T_selECM = T_TMODE[1];
assign TMODE = T_TMODE[0];

assign ED_oe_15 = ED_oe;
assign ED_oe_14_8 = ED_oe || BMcs;
assign ED_oe_7_0 = ED_oe || BMcs && BDIR;


endmodule
