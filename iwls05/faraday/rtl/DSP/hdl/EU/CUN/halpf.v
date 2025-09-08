//NOTE: no-implementation module stub

module HALFP (
    input wire T_RST,
    input wire DSPCLK,
    input wire update_MV,
    `ifdef FD_DFT
    input wire SCAN_TEST,
    `endif
    output reg update_MV_C
);

endmodule
