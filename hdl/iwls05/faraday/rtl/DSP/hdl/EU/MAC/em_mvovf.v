














`include "x_def.v"
module EM_MVOVF(/* IN */
MRovf_C,


MVin_C);

/*------------------------------*/

/*------------------------------*/
input [8:0] MRovf_C;

/*------------------------------*/

/*------------------------------*/
output MVin_C;

assign #`da MVin_C = ~((MRovf_C[8:0] == 9'b000_000_000)
| (MRovf_C[8:0] == 9'b111_111_111));

endmodule
