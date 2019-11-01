



















































































module daddr

























(SYSCLK, TMODE, RESET_D1_R_N, CLMI_RHOLD,
REGA_E_R, REGBI_E_R, REGBR_E_R,
WIDTH_E_P,
DBYEN_E,
DADALERR_E,
DADDR_E,
DWORD_E,
ADATAREG_M_R
);

`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"


input SYSCLK;
input TMODE;
input RESET_D1_R_N;
input CLMI_RHOLD;

input [31:0] REGA_E_R;
input [31:0] REGBI_E_R;
input [31:0] REGBR_E_R;

input [`RALU_WWIDTH:0] WIDTH_E_P;


output [3:0] DBYEN_E;
output DWORD_E;
output DADALERR_E;
output [31:0] DADDR_E;
output [31:0] ADATAREG_M_R;




reg [31:0] DADDR_E;
reg [3:0] DBYEN_E;
reg [31:0] ADATAREG_M_R;
reg DADALERR_E;
wire DWORD_E;




wire [31:0] DADDRi_E;
reg [31:0] Adatareg_M_P;
reg [`RALU_WWIDTH:0] Width_E_R;


wire RESET_D2_R_N;




wire NC_FOO = TMODE;


















always @(Width_E_R or REGBR_E_R )

case (1'b1)

Width_E_R[`RALU_BYTE]: Adatareg_M_P = {4{REGBR_E_R[7:0]}};
Width_E_R[`RALU_HALF]: Adatareg_M_P = {2{REGBR_E_R[15:0]}};
Width_E_R[`RALU_WORD]: Adatareg_M_P = REGBR_E_R[31:0];
Width_E_R[`RALU_NONE]: Adatareg_M_P = REGBR_E_R[31:0];

endcase



always @(Width_E_R or DADDRi_E )

case (1'b1)

Width_E_R[`RALU_BYTE]:

case (DADDRi_E[1:0])
2'b00: begin DADALERR_E = 1'b0; DBYEN_E = 4'b1000; end
2'b01: begin DADALERR_E = 1'b0; DBYEN_E = 4'b0100; end
2'b10: begin DADALERR_E = 1'b0; DBYEN_E = 4'b0010; end
2'b11: begin DADALERR_E = 1'b0; DBYEN_E = 4'b0001; end
endcase


Width_E_R[`RALU_HALF]:

case (DADDRi_E[1:0])
2'b00: begin DADALERR_E = 1'b0; DBYEN_E = 4'b1100; end
2'b01: begin DADALERR_E = 1'b1; DBYEN_E = 4'b1100; end
2'b10: begin DADALERR_E = 1'b0; DBYEN_E = 4'b0011; end
2'b11: begin DADALERR_E = 1'b1; DBYEN_E = 4'b0011; end
endcase


Width_E_R[`RALU_WORD]:

case (DADDRi_E[1:0])
2'b00: begin DADALERR_E = 1'b0; DBYEN_E = 4'b1111; end
2'b01,
2'b10,
2'b11: begin DADALERR_E = 1'b1; DBYEN_E = 4'b1111; end
endcase

Width_E_R[`RALU_NONE]:

begin DADALERR_E = 1'b0; DBYEN_E = 4'b0000; end

endcase



assign DWORD_E = Width_E_R[`RALU_WORD];


assign DADDRi_E = REGA_E_R + REGBI_E_R;





always @(Width_E_R or DADDRi_E )

case (1'b1)

Width_E_R[`RALU_BYTE],
Width_E_R[`RALU_HALF],
Width_E_R[`RALU_WORD]: DADDR_E = DADDRi_E;
Width_E_R[`RALU_NONE]: DADDR_E = 32'hffff_ffff;

endcase



  // synopsys translate_off
  // verilint translate off


always @(posedge SYSCLK)

if (`RESET_D2_R_N_ && !(|Width_E_R)) begin
$display("ERROR %t %m: Illegal DATA WIDTH", $time);
$stop;
end




  // verilint translate on
  // synopsys translate_on















reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;






always @(posedge SYSCLK `negedge_RESET_D2_R_N_)


if (!`RESET_D2_R_N_) begin

Width_E_R <= `RALU_WIDTH_INIT;
ADATAREG_M_R <= 32'h0000_0000;

end
else if (!CLMI_RHOLD) begin

Width_E_R <= WIDTH_E_P;
ADATAREG_M_R <= Adatareg_M_P;

end


endmodule
