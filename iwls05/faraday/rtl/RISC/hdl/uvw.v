module coplogic


(SYSCLK, TMODE, RESET_D1_R_N, EXCEPTION, INSTM32_S_R_N,
COPNO,
INSTSF, RHOLD, DLOAD,
CMEMOPM_R, CONDINN, CPCONDN_R,
CRDADDR, CRDGEN, CRDCON, CRDDATA,
CWRADDR_R, CWRGEN_R, CWRCON_R, CWRDATA_R,
CDRIVERM_R,
CIDBUSINM, CRDDATAM_R);


`include "lxr_symbols.vh"
`include "core_symbols.vh"


`define CI_COPOP {4'b0100, COPNO}
`define CI_LWCZ {4'b1100, COPNO}
`define CI_SWCZ {4'b1110, COPNO}


input SYSCLK;
input TMODE;
input RESET_D1_R_N;
input INSTM32_S_R_N;

input EXCEPTION;

input [1:0] COPNO;

input [31:0] INSTSF;
input RHOLD;
input DLOAD;

input CONDINN;
output CPCONDN_R;

output CMEMOPM_R;

output [4:0] CRDADDR;
output CRDGEN;
output CRDCON;
input [31:0] CRDDATA;

output [4:0] CWRADDR_R;
output CWRGEN_R;
output CWRCON_R;
output [31:0] CWRDATA_R;

output CDRIVERM_R;

input [31:0] CIDBUSINM;

output [31:0] CRDDATAM_R;









reg CPCONDN_R;

reg CMEMOPM_R;

reg [4:0] CRDADDR;
reg CRDGEN;
reg CRDCON;

reg [4:0] CWRADDR_R;
reg CWRGEN_R;
reg CWRCON_R;
reg [31:0] CWRDATA_R;

reg CDRIVERM_R;
reg [31:0] CRDDATAM_R;






reg CmemOp32_E_P,CmemOp_E_R;
reg CmemOp_E_P;

reg Cdriver32_E_P,Cdriver_E_R;
reg Cdriver_E_P;

reg Rdsel32_E_P,Rdsel_E_R;
reg Rdsel_E_P;

reg [4:0] CwrAddr32_E_P;
reg [4:0] CwrAddr_E_P;
reg [4:0] CwrAddr_E_R;
reg [4:0] CwrAddr_M_R;

reg CwrGen32_E_P,CwrGen_E_R,CwrGen_M_R;
reg CwrCon32_E_P,CwrCon_E_R,CwrCon_M_R;
reg CrdGen32_S;
reg CrdCon32_S;

reg CwrGen_E_P;
reg CwrCon_E_P;
reg CrdGen_S;
reg CrdCon_S;

reg Exc_W_R;




wire NC_FOO = TMODE;

















always @(INSTSF or INSTM32_S_R_N or CwrAddr_M_R or CwrGen_M_R or CwrCon_M_R or COPNO) begin

CmemOp32_E_P = 1'b0;
CrdGen32_S = 1'b0;
CrdCon32_S = 1'b0;
CwrGen32_E_P = 1'b0;
CwrCon32_E_P = 1'b0;
Rdsel32_E_P = 1'b0;
Cdriver32_E_P = 1'b0;

CwrAddr32_E_P = 5'b00000;






case (INSTSF[`M32_OPCODE])

`CI_COPOP: case (INSTSF[25:21])

`M32_MF: begin
if((INSTSF[15:11] == CwrAddr_M_R) && CwrGen_M_R)
Rdsel32_E_P = 1'b1;
else begin
CrdGen32_S = 1'b1;
CwrAddr32_E_P = INSTSF[15:11];
end
Cdriver32_E_P = 1'b1;
end

`M32_CF: begin
if((INSTSF[15:11] == CwrAddr_M_R) & CwrCon_M_R)
Rdsel32_E_P = 1'b1;
else begin
CrdCon32_S = 1'b1;
CwrAddr32_E_P = INSTSF[15:11];
end
Cdriver32_E_P = 1'b1;
end

`M32_MT: begin
CwrGen32_E_P = 1'b1;
CwrAddr32_E_P = INSTSF[15:11];
end

`M32_CT: begin
CwrCon32_E_P = 1'b1;
CwrAddr32_E_P = INSTSF[15:11];
end

default: begin
CmemOp32_E_P = 1'b0;
CrdGen32_S = 1'b0;
CrdCon32_S = 1'b0;
CwrGen32_E_P = 1'b0;
CwrCon32_E_P = 1'b0;
Rdsel32_E_P = 1'b0;
Cdriver32_E_P = 1'b0;
CwrAddr32_E_P = 5'b00000;
end

endcase

`CI_SWCZ: begin
CmemOp32_E_P = 1'b1;
if((INSTSF[20:16] == CwrAddr_M_R) & CwrGen_M_R)
Rdsel32_E_P = 1'b1;
else begin
CrdGen32_S = 1'b1;
CwrAddr32_E_P = INSTSF[20:16];
end
Cdriver32_E_P = 1'b1;
end


`CI_LWCZ: begin
CmemOp32_E_P = 1'b1;
CwrGen32_E_P = 1'b1;
CwrAddr32_E_P = INSTSF[20:16];
end


default: begin
CmemOp32_E_P = 1'b0;
CrdGen32_S = 1'b0;
CrdCon32_S = 1'b0;
CwrGen32_E_P = 1'b0;
CwrCon32_E_P = 1'b0;
Rdsel32_E_P = 1'b0;
Cdriver32_E_P = 1'b0;
CwrAddr32_E_P = 5'b00000;
end


endcase





CmemOp_E_P = (!INSTM32_S_R_N) ? CmemOp32_E_P : 1'b0;
CrdGen_S = (!INSTM32_S_R_N) ? CrdGen32_S : 1'b0;
CrdCon_S = (!INSTM32_S_R_N) ? CrdCon32_S : 1'b0;
CwrGen_E_P = (!INSTM32_S_R_N) ? CwrGen32_E_P : 1'b0;
CwrCon_E_P = (!INSTM32_S_R_N) ? CwrCon32_E_P : 1'b0;
Rdsel_E_P = (!INSTM32_S_R_N) ? Rdsel32_E_P : 1'b0;
Cdriver_E_P = (!INSTM32_S_R_N) ? Cdriver32_E_P : 1'b0;

CwrAddr_E_P = (!INSTM32_S_R_N) ? CwrAddr32_E_P : 5'b00000;



CRDADDR = CwrAddr_E_P;
CRDCON = CrdCon_S;
CRDGEN = CrdGen_S;






end





















reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
wire RESET_D2_R_N = RESET_X_R_N | TMODE;









always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin
CPCONDN_R <= 1'b0;
Exc_W_R <= 1'b0;
end
else begin
CPCONDN_R <= CONDINN;
Exc_W_R <= EXCEPTION;
end
end







always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin



if (!`RESET_D2_R_N_) begin

CWRADDR_R <= 5'b00000;
CwrAddr_M_R <= 5'b00000;
CwrAddr_E_R <= 5'b00000;

CWRGEN_R <= 1'b0;
CwrGen_M_R <= 1'b0;
CwrGen_E_R <= 1'b0;
CWRCON_R <= 1'b0;
CwrCon_M_R <= 1'b0;
CwrCon_E_R <= 1'b0;

end
else if (!RHOLD) begin

CWRADDR_R <= CwrAddr_M_R;
CwrAddr_M_R <= CwrAddr_E_R;
CwrAddr_E_R <= CwrAddr32_E_P;











CWRGEN_R <= EXCEPTION ? 1'b0 : CwrGen_M_R;
CwrGen_M_R <= EXCEPTION ? 1'b0 : CwrGen_E_R;
CwrGen_E_R <= EXCEPTION ? 1'b0 : CwrGen_E_P;

CWRCON_R <= EXCEPTION ? 1'b0 : CwrCon_M_R;
CwrCon_M_R <= EXCEPTION ? 1'b0 : CwrCon_E_R;
CwrCon_E_R <= EXCEPTION ? 1'b0 : CwrCon_E_P;

end
end







always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if(!`RESET_D2_R_N_) begin





CRDDATAM_R <= 32'h0000_0000;

Rdsel_E_R <= 1'b0;






CDRIVERM_R <= 1'b0;
Cdriver_E_R <= 1'b0;

end
else if (!RHOLD) begin

CRDDATAM_R <= Rdsel_E_R ? CWRDATA_R : CRDDATA;

Rdsel_E_R <= Exc_W_R ? 1'b0 : Rdsel_E_P;

CDRIVERM_R <= Cdriver_E_R;

Cdriver_E_R <= Cdriver_E_P;

end

end
always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if(!`RESET_D2_R_N_) begin
CWRDATA_R <= 32'h0000_0000;
end
else begin
CWRDATA_R <= DLOAD ? CIDBUSINM :
(RHOLD ? CWRDATA_R : CIDBUSINM);
end

end



always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if(!`RESET_D2_R_N_) begin
CMEMOPM_R <= 1'b0;
CmemOp_E_R <= 1'b0;

end
else if (!RHOLD) begin

CMEMOPM_R <= CmemOp_E_R;
CmemOp_E_R <= CmemOp_E_P;

end

end






endmodule






