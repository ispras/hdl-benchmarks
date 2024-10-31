























































































`include "lxr_symbols.vh"
`include "core_symbols.vh"

module lmi_watch




























(
CLK, TMODE, SEN, RESET_D1_R_N,


DATAUPI, DATADOWNI,


C_IADDR_A, C_IREAD_I_N, IX_VAL, IX_MISS_S_R,
C_DADDR_E, C_DREAD_E, C_DWRITE_E, C_DBYEN_E, DC_VAL,
CP0_XCPN_M,
X_HALT_R,

DC_MISS_W_R,
LW_ISAMPLE_S, LW_IADDR_S_R,
LW_DSAMPLE_W, LW_DWRITE_W_R, LW_DBYEN_W_R, LW_DADDR_W_R, LW_DATA_W_R

);

input CLK;
input TMODE;
input SEN;
input RESET_D1_R_N;

input [`HALT_SIG_RANGE] X_HALT_R;


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


output LW_ISAMPLE_S;
output [31:0] LW_IADDR_S_R;

output LW_DSAMPLE_W;
output LW_DWRITE_W_R;
output [3:0] LW_DBYEN_W_R;
output [31:0] LW_DADDR_W_R;
output [31:0] LW_DATA_W_R;









reg RESET_X_R_N;
always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;
wire RESET_D2_R_N = RESET_X_R_N | TMODE;






wire NC_FOO = SEN;





wire LW_IREAD_S_P;
wire IRMISS_S_P;
wire IVAL_S_P;


reg LW_IREAD_S_R;


reg IRMISS_S_R;
reg IVAL_S_R;



wire DREAD_M_P, LW_DREAD_W_P;
wire LW_DWRITE_W_P, DWRITE_M_P;
wire [3:0] DBYEN_M_P, LW_DBYEN_W_P;

wire DRMISS_W_P;
wire DC_VAL_W_P;

wire [31:0] DADDR_M_P, LW_DADDR_W_P;

wire [31:0] LW_DATA_W_P;

wire anyIMiss_S, anyIVal;
wire anyDMiss_W, anyDVal;
wire anyIBusy, anyDBusy;

reg DREAD_M_R, LW_DREAD_W_R;
reg DWRITE_M_R, LW_DWRITE_W_R;
reg [3:0] DBYEN_M_R, LW_DBYEN_W_R;

reg [31:0] DADDR_M_R, LW_DADDR_W_R;

reg DRMISS_W_R;
reg DC_VAL_W_R;

reg [31:0] LW_DATA_W_R;


wire [31:0] C_IADDR_A_buf;
wire C_IREAD_I_N_buf;
wire [1:0] IX_VAL_buf;
wire [1:0] IX_MISS_S_R_buf;
wire [31:0] C_DADDR_E_buf;
wire C_DREAD_E_buf;
wire C_DWRITE_E_buf;
wire [3:0] C_DBYEN_E_buf;
wire CP0_XCPN_M_buf;
wire DC_VAL_buf;
wire DC_MISS_W_R_buf;
wire [`HALT_SIG_RANGE] X_HALT_R_buf;



wire [31:0] DATAUPI_buf;
wire [31:0] DATADOWNI_buf;






lmi_watchb LMI_WATCHB
(

.DATAUPI ( DATAUPI ),
.DATADOWNI ( DATADOWNI ),


.C_IADDR_A ( C_IADDR_A ),
.C_IREAD_I_N ( C_IREAD_I_N ),
.IX_VAL ( IX_VAL ),
.IX_MISS_S_R ( IX_MISS_S_R ),
.C_DADDR_E ( C_DADDR_E ),
.C_DREAD_E ( C_DREAD_E ),
.C_DWRITE_E ( C_DWRITE_E ),
.C_DBYEN_E ( C_DBYEN_E ),
.CP0_XCPN_M ( CP0_XCPN_M ),
.DC_VAL ( DC_VAL ),
.DC_MISS_W_R ( DC_MISS_W_R ),
.X_HALT_R ( X_HALT_R ),


.DATAUPI_buf ( DATAUPI_buf ),
.DATADOWNI_buf ( DATADOWNI_buf ),


.C_IADDR_A_buf ( C_IADDR_A_buf ),
.C_IREAD_I_N_buf ( C_IREAD_I_N_buf ),
.IX_VAL_buf ( IX_VAL_buf ),
.IX_MISS_S_R_buf ( IX_MISS_S_R_buf ),
.C_DADDR_E_buf ( C_DADDR_E_buf ),
.C_DREAD_E_buf ( C_DREAD_E_buf ),
.C_DWRITE_E_buf ( C_DWRITE_E_buf ),
.C_DBYEN_E_buf ( C_DBYEN_E_buf ),
.CP0_XCPN_M_buf ( CP0_XCPN_M_buf ),
.DC_VAL_buf ( DC_VAL_buf ),
.DC_MISS_W_R_buf ( DC_MISS_W_R_buf ),
.X_HALT_R_buf ( X_HALT_R_buf )
);



lmi_watchd LMI_WATCHD
(
.CLK ( CLK ),
.TMODE ( TMODE ),
.RESET_D1_R_N ( RESET_D1_R_N ),
.X_HALT_R ( X_HALT_R_buf ),
.C_IADDR_A ( C_IADDR_A_buf ),
.IX_MISS_S_R ( IX_MISS_S_R_buf ),
.IX_VAL ( IX_VAL_buf ),
.DC_MISS_W_R ( DC_MISS_W_R_buf ),
.DC_VAL ( DC_VAL_buf ),


.LW_IADDR_S_R ( LW_IADDR_S_R ),
.anyIMiss_S ( anyIMiss_S ),
.anyIVal ( anyIVal ),
.anyDMiss_W ( anyDMiss_W ),
.anyDVal ( anyDVal ),
.anyIBusy ( anyIBusy ),
.anyDBusy ( anyDBusy )
);





assign LW_IREAD_S_P = anyIBusy ? IRMISS_S_R : ~C_IREAD_I_N_buf;

assign IVAL_S_P = anyIVal ? 1'b1 : (anyIBusy ? IVAL_S_R : 1'b0);

assign IRMISS_S_P = anyIMiss_S | IRMISS_S_R & ~anyIVal;






wire [31:0] DATA_IN = DC_VAL_W_P ? DATAUPI_buf : DATADOWNI_buf;


assign DREAD_M_P = (anyDBusy ? DREAD_M_R : C_DREAD_E_buf) & ~CP0_XCPN_M_buf;
assign DWRITE_M_P = (anyDBusy ? DWRITE_M_R : C_DWRITE_E_buf) & ~CP0_XCPN_M_buf;
assign DBYEN_M_P = anyDBusy ? DBYEN_M_R : C_DBYEN_E_buf;
assign DADDR_M_P = anyDBusy ? DADDR_M_R : C_DADDR_E_buf;





assign LW_DREAD_W_P = anyDBusy ? DRMISS_W_R : (DREAD_M_R & ~CP0_XCPN_M_buf);
assign LW_DWRITE_W_P = anyDBusy ? 1'b0 : (DWRITE_M_R & ~CP0_XCPN_M_buf);
assign LW_DBYEN_W_P = anyDBusy ? LW_DBYEN_W_R : DBYEN_M_R;
assign LW_DADDR_W_P = anyDBusy ? LW_DADDR_W_R : DADDR_M_R;
assign LW_DATA_W_P = anyDVal ? DATA_IN : (anyDBusy ? LW_DATA_W_R : DATA_IN);
assign DC_VAL_W_P = anyDVal;

assign DRMISS_W_P = anyDMiss_W | DRMISS_W_R & ~anyDVal;


assign LW_ISAMPLE_S = LW_IREAD_S_R & ~anyIMiss_S & ~IRMISS_S_R
| IVAL_S_R;

assign LW_DSAMPLE_W = LW_DREAD_W_R & ~anyDMiss_W & ~DRMISS_W_R
| LW_DWRITE_W_R
| DC_VAL_W_R;





always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin

LW_IREAD_S_R <= 1'b0;
IVAL_S_R <= 1'b0;
IRMISS_S_R <= 1'b0;

DREAD_M_R <= 1'b0;
DWRITE_M_R <= 1'b0;
DBYEN_M_R <= 4'h0;
DADDR_M_R <= 32'd0;

LW_DREAD_W_R <= 1'b0;
LW_DWRITE_W_R <= 1'b0;
LW_DBYEN_W_R <= 4'h0;
LW_DADDR_W_R <= 32'd0;
LW_DATA_W_R <= 32'd0;
DC_VAL_W_R <= 1'b0;

DRMISS_W_R <= 1'b0;

end
else
begin

LW_IREAD_S_R <= LW_IREAD_S_P;
IVAL_S_R <= IVAL_S_P;
IRMISS_S_R <= IRMISS_S_P;

DREAD_M_R <= DREAD_M_P;
DWRITE_M_R <= DWRITE_M_P;
DBYEN_M_R <= DBYEN_M_P;
DADDR_M_R <= DADDR_M_P;

LW_DREAD_W_R <= LW_DREAD_W_P;
LW_DWRITE_W_R <= LW_DWRITE_W_P;
LW_DBYEN_W_R <= LW_DBYEN_W_P;
LW_DADDR_W_R <= LW_DADDR_W_P;
LW_DATA_W_R <= LW_DATA_W_P;
DC_VAL_W_R <= DC_VAL_W_P;

DRMISS_W_R <= DRMISS_W_P;

end













endmodule

