module ejtag_dmadata

(

EJDD_DATA, EJDD_ADDR, EJDD_CAPDATA,

EJSN_DATA, EJSN_ADDR, EJSN_UPDATEDATA, EJSN_UPDATEADDR,
EJSN_UPDATECTL, EJC_DMAACC, EJC_DMAINC, JTAG_CLOCK, RESET_D1_JR_N,
CORE_CLOCK, RESET_D1_R_N, TMODE, LBC_EJDATA, LBC_EVAL
);

`include "lxr_symbols.vh"

input [31:0] EJSN_DATA;
input [31:0] EJSN_ADDR;
input EJSN_UPDATEDATA;
input EJSN_UPDATEADDR;
input EJSN_UPDATECTL;
input EJC_DMAACC;
input EJC_DMAINC;
input JTAG_CLOCK;
input RESET_D1_JR_N;
input CORE_CLOCK;
input RESET_D1_R_N;

input TMODE;

input [31:0] LBC_EJDATA;
input LBC_EVAL;

output [31:0] EJDD_DATA;
output [31:0] EJDD_ADDR;
output [31:0] EJDD_CAPDATA;



wire NC_FOO = TMODE;




reg [31:0] Data_P, Data_JR;
reg [31:0] Addr_P, Addr_JR;

wire [31:0] DMADataCapture_P;
reg [31:0] DMADataCapture_R;


reg [31:0] addr;

assign EJDD_DATA = Data_JR;
assign EJDD_ADDR = Addr_JR;

assign DMADataCapture_P = LBC_EVAL ? LBC_EJDATA : DMADataCapture_R;
assign EJDD_CAPDATA = DMADataCapture_R;

always @(Addr_JR or Data_JR or EJC_DMAACC or EJC_DMAINC
or EJSN_ADDR or EJSN_DATA or EJSN_UPDATEADDR
or EJSN_UPDATECTL or EJSN_UPDATEDATA) begin


if (EJSN_UPDATEDATA && EJC_DMAACC) begin
Data_P = EJSN_DATA;
end
else begin
Data_P = Data_JR;
end


if (EJSN_UPDATEADDR && EJC_DMAACC) begin
addr = EJSN_ADDR;
end
else begin
addr = Addr_JR;
end



if (EJSN_UPDATECTL && EJC_DMAINC) begin

Addr_P = addr + 32'h0000_0004;

end
else begin
Addr_P = addr;
end
end


always @(posedge JTAG_CLOCK or negedge RESET_D1_JR_N) begin
if (!RESET_D1_JR_N) begin
Data_JR <= 32'd0;
Addr_JR <= 32'd0;
end
else begin
Data_JR <= Data_P;
Addr_JR <= Addr_P;
end
end




wire RESET_D1_SD_N = RESET_D1_R_N | TMODE;







always @(posedge CORE_CLOCK or negedge `RESET_D1_SD_N_) begin
if (!`RESET_D1_SD_N_) begin
DMADataCapture_R <= 32'd0;
end
else begin
DMADataCapture_R <= DMADataCapture_P;
end
end





endmodule
