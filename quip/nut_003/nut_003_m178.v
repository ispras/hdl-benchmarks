// 3 ins 1 outs
module nut_003_m178 (clock,reset,ins,outs);
input clock,reset;
input [2:0] ins;
output [0:0] outs;
cfg_wrt cfg_wrt_inst (
  .tar_trdy_state(ins[0]),
  .cdec_wrt_op(ins[1]),
  .cdec_cfg_op(ins[2]),
  .tar_wrt_config(outs[0])
);
endmodule

module cfg_wrt (
   cdec_wrt_op,
   cdec_cfg_op,
   tar_trdy_state,
   tar_wrt_config
);
   input         cdec_wrt_op, cdec_cfg_op;
   input         tar_trdy_state;
   output        tar_wrt_config;
   wire    tar_wrt_config = cdec_cfg_op && cdec_wrt_op &&tar_trdy_state;
endmodule
