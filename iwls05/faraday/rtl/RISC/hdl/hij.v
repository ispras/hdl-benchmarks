



















































































`include "lxr_symbols.vh"

module ejtag_dataout














(

EJDO_DATA,

EJSN_DATA, EJPM_DATA, EJDM_DATA, EJIM_DATA, EJC_DEBUGCTL,
EJDI_SELDCR, EJDI_SELIBS, EJDI_SELDBS, EJDI_SELPBS, EJDI_SELIBRS,
EJDI_SELDBRS, EJDI_SELPBRS, EJDI_SELPROBE, EJC_DMAACC, RESET_DIS,
CORE_CLOCK, RESET_D1_R_N
);

input [31:0] EJSN_DATA;
input [31:0] EJPM_DATA;
input [31:0] EJDM_DATA;
input [31:0] EJIM_DATA;
input [31:0] EJC_DEBUGCTL;

input EJDI_SELDCR;
input EJDI_SELIBS;
input EJDI_SELDBS;
input EJDI_SELPBS;
input EJDI_SELIBRS;
input EJDI_SELDBRS;
input EJDI_SELPBRS;

input EJDI_SELPROBE;
input EJC_DMAACC;

input RESET_DIS;
input CORE_CLOCK;
input RESET_D1_R_N;

output [31:0] EJDO_DATA;














reg [31:0] Data_R, Data_P;


assign EJDO_DATA = Data_R;


wire sel_proc = EJDI_SELPBS | EJDI_SELPBRS;
wire sel_data = EJDI_SELDBS | EJDI_SELDBRS;
wire sel_inst = EJDI_SELIBS | EJDI_SELIBRS;


wire NC_FOO1 = EJDI_SELPROBE;
wire NC_FOO2 = EJC_DMAACC;






reg RESET_X_R_N;


always @ (posedge CORE_CLOCK)
RESET_X_R_N <= RESET_D1_R_N;


wire RESET_D2_R_N = RESET_X_R_N | RESET_DIS;




always @(Data_R or EJC_DEBUGCTL
or EJDI_SELDCR or EJDM_DATA or EJIM_DATA
or EJPM_DATA or EJSN_DATA or sel_data or sel_inst
or sel_proc) begin

Data_P = EJSN_DATA;

if (sel_proc) begin
Data_P = EJPM_DATA;
end

if (sel_data) begin
Data_P = EJDM_DATA;
end

if (sel_inst) begin
Data_P = EJIM_DATA;
end

if (EJDI_SELDCR) begin
Data_P = EJC_DEBUGCTL;
end

end

always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_)
Data_R <= 32'h0000_0000;
else
Data_R <= Data_P;
end

  // synopsys translate_off
  // verilint translate off

always @(posedge CORE_CLOCK) begin
if (sel_proc + sel_data + sel_inst + EJDI_SELPROBE > 1) begin
$display ("ERROR %t %m: Unexpected multiple selects, M/T/S:%b/%b/%b",
$time, sel_proc, sel_data, sel_inst);
end
end

  // verilint translate on
  // synopsys translate_on

endmodule
