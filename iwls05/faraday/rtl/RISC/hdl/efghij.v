
`include "lxr_symbols.vh"
`include "core_symbols.vh"

module lmi_watchb











(

DATAUPI, DATADOWNI,


C_IADDR_A, C_IREAD_I_N,
IX_VAL, IX_MISS_S_R, C_DADDR_E, C_DREAD_E, C_DWRITE_E,
C_DBYEN_E, CP0_XCPN_M, DC_VAL, DC_MISS_W_R,
X_HALT_R,


DATAUPI_buf, DATADOWNI_buf,


C_IADDR_A_buf, C_IREAD_I_N_buf,
IX_VAL_buf, IX_MISS_S_R_buf, C_DADDR_E_buf, C_DREAD_E_buf, C_DWRITE_E_buf,
C_DBYEN_E_buf, CP0_XCPN_M_buf, DC_VAL_buf, DC_MISS_W_R_buf,
X_HALT_R_buf
);


input [31:0] DATADOWNI;
input [31:0] DATAUPI;


input [31:0] C_IADDR_A;
input C_IREAD_I_N;
input [1:0] IX_VAL;
input [1:0] IX_MISS_S_R;
input [31:0] C_DADDR_E;
input C_DREAD_E;
input C_DWRITE_E;
input [3:0] C_DBYEN_E;
input CP0_XCPN_M;
input DC_VAL;
input DC_MISS_W_R;
input [`HALT_SIG_RANGE] X_HALT_R;

output [31:0] C_IADDR_A_buf;
output C_IREAD_I_N_buf;
output [1:0] IX_VAL_buf;
output [1:0] IX_MISS_S_R_buf;
output [31:0] C_DADDR_E_buf;
output C_DREAD_E_buf;
output C_DWRITE_E_buf;
output [3:0] C_DBYEN_E_buf;
output CP0_XCPN_M_buf;
output DC_VAL_buf;
output DC_MISS_W_R_buf;
output [`HALT_SIG_RANGE] X_HALT_R_buf;


output [31:0] DATADOWNI_buf;
output [31:0] DATAUPI_buf;




assign DATADOWNI_buf = DATADOWNI;
assign DATAUPI_buf = DATAUPI;


assign C_IADDR_A_buf = C_IADDR_A;
assign C_IREAD_I_N_buf = C_IREAD_I_N;

assign IX_VAL_buf = IX_VAL;
assign IX_MISS_S_R_buf = IX_MISS_S_R;
assign C_DADDR_E_buf = C_DADDR_E;
assign C_DREAD_E_buf = C_DREAD_E;
assign C_DWRITE_E_buf = C_DWRITE_E;

assign C_DBYEN_E_buf = C_DBYEN_E;
assign CP0_XCPN_M_buf = CP0_XCPN_M;
assign DC_VAL_buf = DC_VAL;
assign DC_MISS_W_R_buf = DC_MISS_W_R;

assign X_HALT_R_buf = X_HALT_R;

endmodule









