module dmux









/**************************************************************************/
/**************************************************************************/




/**************************************************************************/
/**************************************************************************/






























/**************************************************************************/
/**************************************************************************/



(/*AUTOARG*/

REGC_W_R, REGA_E_R, REGBI_E_R, REGBR_E_R, CINA_E_R, CINBI_E_R, Z_E,

SYSCLK, TMODE, SEN, RESET_D1_R_N, CLMI_RHOLD, REGA_S, REGB_S,
IMMED_S, SELA_S, SELBR_S, SELBI_S, ALURES_E, SELC_M, CP0_PCREL_S,
RDBUSINM
);

`include "lxr_symbols.vh"
`include "core_symbols.vh"


input SYSCLK;
input TMODE;
input SEN;
input RESET_D1_R_N;
input CLMI_RHOLD;

input [31:0] REGA_S;
input [31:0] REGB_S;

input [16:0] IMMED_S;
input [`RALU_WSELA] SELA_S;
input [`RALU_WSELBR] SELBR_S;
input [`RALU_WSELBI] SELBI_S;

input [31:0] ALURES_E;

input [`RALU_WSELC] SELC_M;

input [31:0] CP0_PCREL_S;

input [31:0] RDBUSINM;

output [31:0] REGC_W_R;
output [31:0] REGA_E_R;
output [31:0] REGBI_E_R;
output [31:0] REGBR_E_R;

output [31:0] CINA_E_R;
output [31:0] CINBI_E_R;

output Z_E;






reg [31:0] REGC_W_R;
reg [31:0] REGA_E_R;
reg [31:0] REGBI_E_R;
reg [31:0] REGBR_E_R;



reg [31:0] REGAEX_P;
reg [31:0] REGBREX_P;
reg [31:0] REGBIEX_P;

reg [31:0] REGCWB_P;

reg [31:0] AluregM_R;

reg Z_E;

`ifdef VPP_LOCAL_RESET
wire RESET_D2_R_N;
`endif



wire NC_FOO = TMODE;
wire NC_FOO2 = SEN;



/*******************************************************************/
/*******************************************************************/






/********************************************************************/
/********************************************************************/

assign CINA_E_R = REGA_E_R;
assign CINBI_E_R = REGBI_E_R;


/********************************************************************/
/********************************************************************/












always @(SELA_S or IMMED_S or ALURES_E or REGC_W_R or REGA_S or REGA_E_R or
CP0_PCREL_S or RDBUSINM or AluregM_R)



case (SELA_S)

`RALU_SA_IMMED: REGAEX_P = {3'b000,24'h000000,IMMED_S[10:6]};
`RALU_SA_ALURES: REGAEX_P = ALURES_E;
`RALU_SA_ALUREGM: REGAEX_P = AluregM_R;
`RALU_SA_REGAHOLD: REGAEX_P = REGA_E_R;
`RALU_SA_DBUS: REGAEX_P = RDBUSINM[31:0];
`RALU_SA_REGCWB: REGAEX_P = REGC_W_R;
`RALU_SA_PCREL: REGAEX_P = CP0_PCREL_S;
`RALU_SA_REGASF: REGAEX_P = REGA_S;
`RALU_SA_RESET: REGAEX_P = 32'h0000_0000;
default: REGAEX_P = 32'hxxxx_xxxx;

endcase


  // synopsys translate_off
  // verilint translate off




always @(posedge SYSCLK)

if (`RESET_D2_R_N_ && !(|SELA_S)) begin

$display("ERROR %t %m: Illegal ALU A-INPUT SELECT", $time);
$stop;
end





/********************************************************************/



/********************************************************************/
/********************************************************************/










always @(SELBR_S or ALURES_E or REGC_W_R or REGB_S or REGBR_E_R or
RDBUSINM or AluregM_R )




case (SELBR_S)

`RALU_SBR_ALURES: REGBREX_P = ALURES_E;
`RALU_SBR_ALUREGM: REGBREX_P = AluregM_R;
`RALU_SBR_REGBRHOLD: REGBREX_P = REGBR_E_R;
`RALU_SBR_DBUS: REGBREX_P = RDBUSINM[31:0];
`RALU_SBR_REGCWB: REGBREX_P = REGC_W_R;
`RALU_SBR_REGBSF: REGBREX_P = REGB_S;
`RALU_SBR_RESET: REGBREX_P = 32'h0000_0000;
default: REGBREX_P = 32'hxxxx_xxxx;

endcase







always @(posedge SYSCLK)

if (`RESET_D2_R_N_ && !(|SELBI_S)) begin

$display("ERROR %t %m: Illegal ALU BR-INPUT SELECT", $time);
$stop;
end





/********************************************************************/





/********************************************************************/
/********************************************************************/











always @(SELBI_S or IMMED_S or ALURES_E or REGC_W_R or REGB_S or REGBI_E_R or
RDBUSINM or AluregM_R)



case (SELBI_S)

`RALU_SBI_IMMED: REGBIEX_P = {{16{IMMED_S[16]}}, IMMED_S[15:0]};
`RALU_SBI_ALURES: REGBIEX_P = ALURES_E;
`RALU_SBI_ALUREGM: REGBIEX_P = AluregM_R;
`RALU_SBI_REGBIHOLD: REGBIEX_P = REGBI_E_R;
`RALU_SBI_DBUS: REGBIEX_P = RDBUSINM[31:0];
`RALU_SBI_REGCWB: REGBIEX_P = REGC_W_R;
`RALU_SBI_REGBSF: REGBIEX_P = REGB_S;
`RALU_SBI_RESET: REGBIEX_P = 32'h0000_0000;
default: REGBIEX_P = 32'hxxxx_xxxx;

endcase







always @(posedge SYSCLK)

if (`RESET_D2_R_N_ && !(|SELBI_S)) begin

$display("ERROR %t %m: Illegal ALU BI-INPUT SELECT", $time);
$stop;
end






/********************************************************************/





/********************************************************************/
/********************************************************************/








always @(SELC_M or RDBUSINM or AluregM_R or REGC_W_R)



case (SELC_M)

`RALU_SC_RESET: REGCWB_P = 32'h0000_0000;
`RALU_SC_DBUS: REGCWB_P = RDBUSINM[31:0];
`RALU_SC_HOLD: REGCWB_P = REGC_W_R;
`RALU_SC_ALUREGM: REGCWB_P = AluregM_R;
default: REGCWB_P = 32'hxxxx_xxxx;

endcase







always @(posedge SYSCLK)

if (`RESET_D2_R_N_ && !(|SELC_M)) begin

$display("ERROR %t %m: Illegal C-INPUT SELECT", $time);
$stop;
end





/********************************************************************/
/********************************************************************/







  // verilint translate on
  // synopsys translate_on

always @(REGA_E_R or REGBI_E_R)
Z_E = ~(| (REGA_E_R ^ REGBI_E_R));

/********************************************************************/
/********************************************************************/




`ifdef VPP_LOCAL_RESET

`ifdef VPP_BUFFERED_RESET
assign RESET_D2_R_N = RESET_D1_R_N;
`else


reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;


`endif

`endif




`ifdef VPP_ASYNC_RESET

always @(posedge SYSCLK `negedge_RESET_D2_R_N_)






if (!`RESET_D2_R_N_) begin
REGA_E_R <= 32'h0000_0000;
REGBR_E_R <= 32'h0000_0000;
REGBI_E_R <= 32'h0000_0000;
REGC_W_R <= 32'h0000_0000;
end
else begin
REGA_E_R <= REGAEX_P;
REGBR_E_R <= REGBREX_P;
REGBI_E_R <= REGBIEX_P;
REGC_W_R <= REGCWB_P;
end

`else



always @(posedge SYSCLK) begin






REGA_E_R <= REGAEX_P;
REGBR_E_R <= REGBREX_P;
REGBI_E_R <= REGBIEX_P;
REGC_W_R <= REGCWB_P;

end



`endif


always @(posedge SYSCLK `negedge_RESET_D2_R_N_)



if (!`RESET_D2_R_N_)
AluregM_R <= 32'h0000_0000;
else if (!CLMI_RHOLD)
AluregM_R <= ALURES_E;









endmodule







