



















































































module dcont






















































(SYSCLK, RESET_D1_R_N,
CP0_INSTM32_I_R_C1_N,
CP0_XCPN_M_C1,
INST_S_R, CLMI_RHOLD, RLShold, DLOAD,
IMMED_S,
SELA_S, SELBR_S, SELBI_S,
ALUOP_E_P,
WIDTH_E_P,
DREAD_E_R, DWRITE_E_R, DSIGN_E_R,
DREAD_E_R_C, DWRITE_E_R_C,
RDBDRIVER_R,
SELC_M,
REGCADDR_M_R, REGCWRITE_M_R,
REGAADDR_S, REGBADDR_S,
RALU_HALT_E_R,
TMODE
);


`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"



input SYSCLK;
input RESET_D1_R_N;
input CP0_INSTM32_I_R_C1_N;
input CP0_XCPN_M_C1;

input [31:0] INST_S_R;
input CLMI_RHOLD;
input RLShold;
input DLOAD;
input TMODE;

output [16:0] IMMED_S;
output [`RALU_WSELA] SELA_S;
output [`RALU_WSELBR] SELBR_S;
output [`RALU_WSELBI] SELBI_S;

output [`RALU_WALUOP:0] ALUOP_E_P;
output [`RALU_WWIDTH:0] WIDTH_E_P;

output DREAD_E_R;
output DWRITE_E_R;
output DSIGN_E_R;

output DREAD_E_R_C;
output DWRITE_E_R_C;

output RDBDRIVER_R;

output [`RALU_WSELC] SELC_M;

output [4:0] REGCADDR_M_R;
output REGCWRITE_M_R;

output [4:0] REGAADDR_S;
output [4:0] REGBADDR_S;

output [`HALT_DRV_RANGE] RALU_HALT_E_R;






wire NC_FOO = TMODE;





reg [16:0] IMMED_S;
reg [`RALU_WSELA] SELA_S;
reg [`RALU_WSELBR] SELBR_S;
reg [`RALU_WSELBI] SELBI_S;

reg [`RALU_WALUOP:0] ALUOP_E_P;
reg [`RALU_WWIDTH:0] WIDTH_E_P;

reg DREAD_E_R_C;
reg DWRITE_E_R_C;

reg DREAD_E_R;
reg DWRITE_E_R;
reg DSIGN_E_R;

reg RDBDRIVER_R;

reg [`RALU_WSELC] SELC_M;

reg [4:0] REGCADDR_M_R;
reg REGCWRITE_M_R;

reg [4:0] REGAADDR_S;
reg [4:0] REGBADDR_S;




reg [4:0] RegcAddr32_E_P;
reg [4:0] RegcAddr16_E_P;
reg [4:0] RegcAddr_E_R;
reg [4:0] RegcAddr_E_P;
reg [4:0] RegcAddr_W_R;

reg [4:0] RegaAddr16_S;
reg [4:0] RegbAddr16_S;

reg RegcWrite32_E_P;
reg RegcWrite16_E_P;
reg RegcWrite_E_P;

reg RegcWrite_E_R;
reg RegcWrite_W_R;

reg RdbDriver_E_R;
reg RdbDriver_E_P;

reg Dread_E_P;
reg Dwrite_E_P;
reg Dsign_E_P;

reg [`RALU_WSELA] Sela_E_R;
reg [`RALU_WSELBR] Selbr_E_R;
reg [`RALU_WSELBI] Selbi_E_R;

reg [`RALU_WSELC] Selc_E_P;
reg [`RALU_WSELC] Selc_E_R;

reg [`RALU_WSELC] pSelc_M_R;

reg [4:0] REGX_S;
reg [4:0] REGY_S;
reg [4:0] M16R_S;
reg [4:0] RRRWr_S;
reg [4:0] M16_JREG_S;

reg SelApc_S;
reg SelAIimmed_S;
reg SelAIimmed32_S;
reg SelAIimmed16_S;
reg SelBIimmed_S;
reg SelBIimmed32_S;
reg SelBIimmed16_S;

reg [16:0] IMMED32_S;
reg [16:0] IMMED16_S;

reg [11:0] Extend_E_R;
reg Extendval_E_R;
reg JALval_E_R;

reg [16:0] Extend_imm1_s;
reg [16:0] Extend_imm1_u;
reg [16:0] Extend_adrria;

reg [`RALU_WWIDTH:0] Width32_S;
reg [`RALU_WWIDTH:0] Width16_S;

reg Dsign32_E_P;
reg Dsign16_E_P;
reg [`RALU_WSELC] Selc32_E_P;
reg [`RALU_WSELC] Selc16_E_P;
reg Dread32_E_P;
reg Dread16_E_P;
reg Dwrite32_E_P;
reg Dwrite16_E_P;
reg RdbDriver32_E_P;
reg RdbDriver16_E_P;

reg [`RALU_WALUOP:0] Aluop32_S;
reg [`RALU_WALUOP:0] Aluop16_S;

reg INSTM32_S_R_N;

reg SelaDBUS_S;
reg SelaALU_S;
reg SelaALUR_S;
reg SelaC_S;
reg SelaZero_S;
reg SelaZero16_S;

reg [`RALU_WSELA] SaData_M;

reg SelbrDBUS_S;
reg SelbiDBUS_S;
reg SelbALU_S;
reg SelbALUR_S;
reg SelbC_S;

reg [`RALU_WSELBR] SbrData_M;
reg [`RALU_WSELBI] SbiData_M;


wire RESET_D2_R_N;


reg INIT_D3_R_N;





assign RALU_HALT_E_R = { `HALT_DRV_COUNT { 1'b0 } };



always @(INST_S_R) begin

REGX_S = { ~INST_S_R[10] & ~INST_S_R[9], 1'b0, INST_S_R[10:8]};
REGY_S = { ~INST_S_R[7] & ~INST_S_R[6], 1'b0, INST_S_R[7:5]};
M16R_S = { ~INST_S_R[2] & ~INST_S_R[1], 1'b0, INST_S_R[2:0]};
RRRWr_S = { ~INST_S_R[4] & ~INST_S_R[3], 1'b0, INST_S_R[4:2] };

M16_JREG_S = (INST_S_R[`M16_RY] == `M16_JRA) ? `M16_REG_A : REGX_S;

end







always @(INST_S_R or INSTM32_S_R_N or REGX_S or M16_JREG_S) begin





case (INST_S_R[`M16_OPCODE])
`M16_LWSP,
`M16_SWSP,
`M16_ADDIUSP: RegaAddr16_S = `M16_REG_SP;
`M16_RR:
case (INST_S_R[`M16_SUB_RR])
`M16_JREG: RegaAddr16_S = M16_JREG_S;
default: RegaAddr16_S = REGX_S;
endcase
`M16_I8:
case (INST_S_R[`M16_SUB_I8])
`M16_BTNEZ,
`M16_BTEQZ: RegaAddr16_S = `M16_REG_T;
`M16_SWRASP,
`M16_ADDJSP: RegaAddr16_S = `M16_REG_SP;
default: RegaAddr16_S = REGX_S;
endcase
default: RegaAddr16_S = REGX_S;
endcase

REGAADDR_S = (INSTM32_S_R_N == `M32) ? INST_S_R[25:21] : RegaAddr16_S;

end






always @(INST_S_R or INSTM32_S_R_N or REGX_S or REGY_S or M16R_S) begin





case (INST_S_R[`M16_OPCODE])
`M16_LWSP,
`M16_SWSP: RegbAddr16_S = REGX_S;
`M16_I8:
case (INST_S_R[`M16_SUB_I8])
`M16_SWRASP: RegbAddr16_S = `M16_REG_A;
`M16_MOVR32: RegbAddr16_S = INST_S_R[4:0];
`M16_MOV32R: RegbAddr16_S = M16R_S;
default: RegbAddr16_S = REGY_S;
endcase
default: RegbAddr16_S = REGY_S;
endcase

REGBADDR_S = (INSTM32_S_R_N == `M32) ? INST_S_R[20:16] : RegbAddr16_S;

end







always @(INST_S_R or INSTM32_S_R_N or REGX_S or REGY_S or RRRWr_S or JALval_E_R ) begin



case (INST_S_R[`M32_OPCODE])

`M32_SPECIAL: RegcAddr32_E_P = INST_S_R[15:11];
`M32_REGIMM: RegcAddr32_E_P = `M32_REG_A;
`M32_JALX,
`M32_JAL: RegcAddr32_E_P = `M32_REG_A;
default: RegcAddr32_E_P = INST_S_R[20:16];

endcase




case (INST_S_R[`M16_OPCODE])

`M16_LB, `M16_LBU,
`M16_LH, `M16_LHU,
`M16_LW: RegcAddr16_E_P = REGY_S;

`M16_SLTI,
`M16_SLTIU,
`M16_CMPI: RegcAddr16_E_P = `M16_REG_T;



`M16_RR:

case (INST_S_R[`M16_SUB_RR])

`M16_SLT,
`M16_SLTU,
`M16_CMP: RegcAddr16_E_P = `M16_REG_T;

`M16_SLLV,
`M16_SRLV,
`M16_SRAV: RegcAddr16_E_P = REGY_S;

`M16_JREG: RegcAddr16_E_P = `M16_REG_A;

default: RegcAddr16_E_P = REGX_S;

endcase

`M16_I8:


case (INST_S_R[`M16_SUB_I8])
`M16_MOV32R: RegcAddr16_E_P = {INST_S_R[4:3], INST_S_R[7:5]};
`M16_ADDJSP: RegcAddr16_E_P = `M16_REG_SP;
default: RegcAddr16_E_P = REGY_S;
endcase

`M16_RRR:


RegcAddr16_E_P = RRRWr_S;

`M16_RRI_A:


RegcAddr16_E_P = REGY_S;

default: RegcAddr16_E_P = REGX_S;

endcase


RegcAddr_E_P = (INSTM32_S_R_N == `M32) ? RegcAddr32_E_P :
(JALval_E_R ) ? `M16_REG_A :
RegcAddr16_E_P;


end








always @(INST_S_R or INSTM32_S_R_N or JALval_E_R or RegcAddr32_E_P or RegcAddr16_E_P) begin



case (INST_S_R[`M32_OPCODE])

`M32_SPECIAL:

case (INST_S_R[`M32_SUB_SPECIAL])
`M32_JR,
`M32_SYSCALL,
`M32_BREAK: RegcWrite32_E_P = 1'b0;
default: RegcWrite32_E_P = ~(INST_S_R[15:11] == 5'b00000);
endcase

`M32_SPECIAL2:
case (INST_S_R[`M32_SUB_SPECIAL])
`M32_MAD,
`M32_MADU,
`M32_MSUB,
`M32_MSUBU: RegcWrite32_E_P = 1'b0;
`M32_SDBBP: RegcWrite32_E_P = 1'b0;
default: RegcWrite32_E_P = 1'b1;
endcase

`M32_REGIMM:

case (INST_S_R[20:16])



`M32_BLTZAL,
`M32_BGEZAL: RegcWrite32_E_P = 1'b1;
default: RegcWrite32_E_P = 1'b0;
endcase


`M32_J: RegcWrite32_E_P = 1'b0;




`M32_JALX,
`M32_JAL: RegcWrite32_E_P = 1'b1;

`M32_BEQ,
`M32_BNE,
`M32_BLEZ,
`M32_BGTZ: RegcWrite32_E_P = 1'b0;

`M32_COP0,
`M32_COP1,
`M32_COP2,
`M32_COP3:

case (INST_S_R[25:21])
`M32_MF,
`M32_CF: RegcWrite32_E_P = ~(INST_S_R[20:16] == 5'b00000);
default: RegcWrite32_E_P = 1'b0;
endcase


`M32_LWC1,
`M32_LWC2,
`M32_LWC3: RegcWrite32_E_P = 1'b0;


`M32_SB,
`M32_SH,
`M32_SWL,
`M32_SW,
`M32_SWR,
`M32_SWC1,
`M32_SWC2,
`M32_SWC3: RegcWrite32_E_P = 1'b0;

`M32_LEXOP: RegcWrite32_E_P = 1'b0;


default: RegcWrite32_E_P = ~(INST_S_R[20:16] == 5'b00000);


endcase




case (INST_S_R[`M16_OPCODE])




`M16_SB,
`M16_SH,
`M16_SW,
`M16_SWSP: RegcWrite16_E_P = 1'b0;


`M16_BEQZ,
`M16_BNEZ,
`M16_B: RegcWrite16_E_P = 1'b0;
`M16_JAL: RegcWrite16_E_P = 1'b0;

`M16_EXTEND: RegcWrite16_E_P = 1'b0;

`M16_RR:

case (INST_S_R[`M16_SUB_RR])
`M16_SDBBP,
`M16_MULT,
`M16_MULTU,
`M16_DIV,
`M16_DIVU: RegcWrite16_E_P = 1'b0;
`M16_JREG: RegcWrite16_E_P = (INST_S_R[`M16_RY] == `M16_JALR);
`M16_BREAK: RegcWrite16_E_P = 1'b0;
default: RegcWrite16_E_P = 1'b1;
endcase

`M16_I8:

case (INST_S_R[`M16_SUB_I8])
`M16_BTNEZ: RegcWrite16_E_P = 1'b0;
`M16_BTEQZ: RegcWrite16_E_P = 1'b0;
`M16_SWRASP: RegcWrite16_E_P = 1'b0;
default: RegcWrite16_E_P = 1'b1;
endcase





`M16_LEXOP:

case (INST_S_R[`M16_SUB_LEXRA])

`M16_MADH,
`M16_MADL,

`M16_MAZH,
`M16_MAZL,

`M16_MASH,
`M16_MASL,

`M16_MSBH,
`M16_MSBL,

`M16_MSZH,
`M16_MSZL,

`M16_MSSH,
`M16_MSSL: RegcWrite16_E_P = 1'b0;

default: RegcWrite16_E_P = 1'b1;
endcase

default: RegcWrite16_E_P = 1'b1;

endcase



RegcWrite_E_P = (INSTM32_S_R_N == `M32) ?
(RegcWrite32_E_P & (RegcAddr32_E_P != 5'b00000)) :
(JALval_E_R) ? 1'b1 :
(RegcWrite16_E_P & (RegcAddr16_E_P != 5'b00000));

end

















always @(INST_S_R or INSTM32_S_R_N) begin

SelAIimmed32_S = (INST_S_R[`M32_OPCODE] == `M32_SPECIAL) &
(INST_S_R[5:2] == `M32_SHIFT_I);

SelAIimmed16_S = (INST_S_R[`M16_OPCODE] == `M16_SHIFT);




SelAIimmed_S = (INSTM32_S_R_N == `M32) ? SelAIimmed32_S : SelAIimmed16_S;

SelApc_S = (INSTM32_S_R_N == `M16) &
((INST_S_R[`M16_OPCODE] == `M16_LWPC) ||
(INST_S_R[`M16_OPCODE] == `M16_ADDIUPC));



end





always @(INST_S_R or INSTM32_S_R_N) begin




if ((INST_S_R[31:29] != 3'b000) &&
(INST_S_R[`M32_OPCODE] != `M32_LEXOP) &&
(INST_S_R[`M32_OPCODE] != `M32_SPECIAL2))
SelBIimmed32_S = 1'b1;
else
SelBIimmed32_S = 1'b0;





case (INST_S_R[`M16_OPCODE])

`M16_SHIFT: SelBIimmed16_S = 1'b0;

`M16_I8: case (INST_S_R[`M16_SUB_I8])
`M16_MOVR32,
`M16_MOV32R: SelBIimmed16_S = 1'b0;
default: SelBIimmed16_S = 1'b1;
endcase

`M16_RR: SelBIimmed16_S = 1'b0;
`M16_RRR: SelBIimmed16_S = 1'b0;
`M16_LEXOP: SelBIimmed16_S = 1'b0;

default: SelBIimmed16_S = 1'b1;

endcase

SelBIimmed_S = (INSTM32_S_R_N == `M32) ? SelBIimmed32_S : SelBIimmed16_S;



end











always @(INST_S_R or INSTM32_S_R_N or Extendval_E_R or Extend_E_R) begin




if ((INST_S_R[`M32_OPCODE] == `M32_ANDIOP) |
(INST_S_R[`M32_OPCODE] == `M32_ORIOP) |
(INST_S_R[`M32_OPCODE] == `M32_XORIOP))
IMMED32_S = {1'b0, INST_S_R[15:0]};
else
IMMED32_S = {INST_S_R[15], INST_S_R[15:0]};







Extend_imm1_s = {Extend_E_R[4], Extend_E_R[4:0], Extend_E_R[10:5], INST_S_R[4:0]};
Extend_imm1_u = {1'b0, Extend_E_R[4:0], Extend_E_R[10:5], INST_S_R[4:0]};


Extend_adrria = {{2{Extend_E_R[3]}}, Extend_E_R[3:0], Extend_E_R[10:4], INST_S_R[3:0]};


case (INST_S_R[`M16_OPCODE])

`M16_BEQZ,
`M16_BNEZ: IMMED16_S = 17'b0_0000_0000_0000_0000;



`M16_LB,
`M16_LBU,
`M16_SB: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {12'h000, INST_S_R[4:0]};



`M16_LH,
`M16_LHU,
`M16_SH: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {3'b000, 8'h00, INST_S_R[4:0], 1'b0};



`M16_LW,
`M16_SW: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {2'b00, 8'h00, INST_S_R[4:0], 2'b00};



`M16_LWSP,
`M16_LWPC,
`M16_SWSP,
`M16_ADDIUSP,
`M16_ADDIUPC: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {3'b000, 4'h0, INST_S_R[7:0], 2'b00};

`M16_ADDIU8: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {{9{INST_S_R[7]}}, INST_S_R[7:0]};




`M16_SLTI,
`M16_SLTIU: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {1'b0, 8'h00, INST_S_R[7:0]};



`M16_LI,
`M16_CMPI: IMMED16_S = Extendval_E_R ? Extend_imm1_u : {1'b0, 8'h00, INST_S_R[7:0]};

`M16_SHIFT: IMMED16_S = Extendval_E_R ? {2'b00, 4'h0, Extend_E_R[10:6], 2'b00, 4'h0 } :
(INST_S_R[4:2] == 3'b000) ? {2'b00, 4'h0, 5'b01000, 2'b00, 4'h0 } :
{2'b00, 4'h0, 2'b00, INST_S_R[4:2], 2'b00, 4'h0};

`M16_I8: case (INST_S_R[`M16_SUB_I8])
`M16_BTNEZ: IMMED16_S = {1'b0, 16'h0000};
`M16_BTEQZ: IMMED16_S = {1'b0, 16'h0000};
`M16_SWRASP: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {3'b000, 4'h0, INST_S_R[7:0], 2'b00};
default: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {{6{INST_S_R[7]}}, INST_S_R[7:0], 3'b000};
endcase

`M16_RRI_A: IMMED16_S = Extendval_E_R ? Extend_adrria : {{13{INST_S_R[3]}}, INST_S_R[3:0]};

default: IMMED16_S = Extendval_E_R ? Extend_imm1_s : {1'b0, 8'h00, INST_S_R[7:0]};

endcase

IMMED_S = (INSTM32_S_R_N == `M32) ? IMMED32_S : IMMED16_S;


end














always @(INST_S_R or INSTM32_S_R_N or RegcAddr_E_R or RegcWrite_E_R or
REGCADDR_M_R or REGCWRITE_M_R or REGAADDR_S or
CLMI_RHOLD or Sela_E_R or DLOAD or SELC_M
or RegcAddr_W_R or RegcWrite_W_R or
SelAIimmed_S or SelApc_S or INSTM32_S_R_N
or INIT_D3_R_N) begin

case (INST_S_R[`M16_OPCODE])
`M16_LI: SelaZero16_S = 1'b1;
`M16_RR:
case (INST_S_R[`M16_SUB_RR])
`M16_NOT,
`M16_NEG: SelaZero16_S = 1'b1;
default: SelaZero16_S = 1'b0;
endcase
`M16_I8:
case (INST_S_R[`M16_SUB_I8])
`M16_MOVR32,
`M16_MOV32R: SelaZero16_S = 1'b1;
default: SelaZero16_S = 1'b0;
endcase
default: SelaZero16_S = 1'b0;
endcase

SelaZero_S = SelaZero16_S & (INSTM32_S_R_N == `M16);

SelaDBUS_S = (Sela_E_R == `RALU_SA_DBUS) & DLOAD;
SelaALU_S = (REGAADDR_S == RegcAddr_E_R) & RegcWrite_E_R;
SelaALUR_S = (REGAADDR_S == REGCADDR_M_R) & REGCWRITE_M_R;
SelaC_S = (REGAADDR_S == RegcAddr_W_R) & RegcWrite_W_R;

SaData_M = (SELC_M == `RALU_SC_DBUS) ?
`RALU_SA_DBUS: `RALU_SA_ALUREGM;









if (!INIT_D3_R_N)
SELA_S = `RALU_SA_RESET;

else if (SelaDBUS_S)
SELA_S = `RALU_SA_DBUS;

else if (CLMI_RHOLD)
SELA_S = `RALU_SA_REGAHOLD;

else if (SelaZero_S || SelAIimmed_S || SelApc_S)

case (1'b1)
SelaZero_S: SELA_S = `RALU_SA_RESET;
SelAIimmed_S: SELA_S = `RALU_SA_IMMED;
SelApc_S: SELA_S = `RALU_SA_PCREL;
endcase


else if (SelaALU_S)
SELA_S = `RALU_SA_ALURES;

else if (SelaALUR_S)
SELA_S = SaData_M;

else if (SelaC_S)
SELA_S = `RALU_SA_REGCWB;

else
SELA_S = `RALU_SA_REGASF;


end



























always @(INST_S_R or RegcAddr_E_R or RegcWrite_E_R or SelBIimmed_S or
REGBADDR_S or
REGCADDR_M_R or REGCWRITE_M_R or DLOAD or CLMI_RHOLD or Selbr_E_R or Selbi_E_R or SELC_M
or RegcAddr_W_R or RegcWrite_W_R or INIT_D3_R_N) begin



SelbrDBUS_S = (Selbr_E_R == `RALU_SBR_DBUS) & DLOAD;
SelbiDBUS_S = (Selbi_E_R == `RALU_SBI_DBUS) & DLOAD;
SelbALU_S = (REGBADDR_S == RegcAddr_E_R) & RegcWrite_E_R;
SelbALUR_S = (REGBADDR_S == REGCADDR_M_R) & REGCWRITE_M_R;
SelbC_S = (REGBADDR_S == RegcAddr_W_R) & RegcWrite_W_R;

SbrData_M = (SELC_M == `RALU_SC_DBUS) ?
`RALU_SBR_DBUS: `RALU_SBR_ALUREGM;

SbiData_M = (SELC_M == `RALU_SC_DBUS) ?
`RALU_SBI_DBUS: `RALU_SBI_ALUREGM;






if (!INIT_D3_R_N)
SELBI_S = `RALU_SBI_RESET;

else if (SelbiDBUS_S)
SELBI_S = `RALU_SBI_DBUS;

else if (CLMI_RHOLD)
SELBI_S = `RALU_SBI_REGBIHOLD;

else if (SelBIimmed_S)
SELBI_S = `RALU_SBI_IMMED;

else if (SelbALU_S)
SELBI_S = `RALU_SBI_ALURES;

else if (SelbALUR_S)
SELBI_S = SbiData_M;

else if (SelbC_S)
SELBI_S = `RALU_SBI_REGCWB;

else
SELBI_S = `RALU_SBI_REGBSF;






if (!INIT_D3_R_N)
SELBR_S = `RALU_SBR_RESET;

else if (SelbrDBUS_S)
SELBR_S = `RALU_SBR_DBUS;

else if (CLMI_RHOLD)
SELBR_S = `RALU_SBR_REGBRHOLD;

else if (SelbALU_S)
SELBR_S = `RALU_SBR_ALURES;

else if (SelbALUR_S)
SELBR_S = SbrData_M;

else if (SelbC_S)
SELBR_S = `RALU_SBR_REGCWB;

else
SELBR_S = `RALU_SBR_REGBSF;




end







always @(pSelc_M_R or DLOAD or CLMI_RHOLD or INIT_D3_R_N)



if (!INIT_D3_R_N) SELC_M = `RALU_SC_RESET;

else if (DLOAD) SELC_M = `RALU_SC_DBUS;

else if (CLMI_RHOLD) SELC_M = `RALU_SC_HOLD;

else SELC_M = pSelc_M_R;





















always @(INST_S_R or INSTM32_S_R_N or JALval_E_R) begin




Aluop32_S = 0;

case (INST_S_R[`M32_OPCODE])

`M32_SPECIAL:
case (INST_S_R[`M32_SUB_SPECIAL])
`M32_SLL,
`M32_SLLV: Aluop32_S[`RALU_IOP_SLEFT] = 1;
`M32_SRL,
`M32_SRLV: Aluop32_S[`RALU_IOP_SRIGHTL] = 1;
`M32_SRA,
`M32_SRAV: Aluop32_S[`RALU_IOP_SRIGHTA] = 1;

`M32_JALR: Aluop32_S[`RALU_IOP_LINK] = 1;
`M32_OPSUB,
`M32_OPSUBU: Aluop32_S[`RALU_IOP_SUB] = 1;

`M32_ANDROP: Aluop32_S[`RALU_IOP_AND] = 1;
`M32_ORROP: Aluop32_S[`RALU_IOP_OR] = 1;
`M32_XORROP: Aluop32_S[`RALU_IOP_XOR] = 1;
`M32_NORROP: Aluop32_S[`RALU_IOP_NOR] = 1;

`M32_SLT: Aluop32_S[`RALU_IOP_SLTS] = 1;
`M32_SLTU: Aluop32_S[`RALU_IOP_SLTZ] = 1;

default: Aluop32_S[`RALU_IOP_ADD] = 1;
endcase
`M32_REGIMM:
case (INST_S_R[20:16])
`M32_BLTZAL,
`M32_BGEZAL: Aluop32_S[`RALU_IOP_LINK] = 1;

default: Aluop32_S[`RALU_IOP_XOR] = 1;
endcase
`M32_JALX,
`M32_JAL: Aluop32_S[`RALU_IOP_LINK] = 1;

`M32_BEQ,
`M32_BNE: Aluop32_S[`RALU_IOP_XOR] = 1;
`M32_BLEZ,
`M32_BGTZ: Aluop32_S[`RALU_IOP_XOR] = 1;

`M32_SLTI: Aluop32_S[`RALU_IOP_SLTS] = 1;
`M32_SLTIU: Aluop32_S[`RALU_IOP_SLTZ] = 1;
`M32_ANDIOP: Aluop32_S[`RALU_IOP_AND] = 1;
`M32_ORIOP: Aluop32_S[`RALU_IOP_OR] = 1;
`M32_XORIOP: Aluop32_S[`RALU_IOP_XOR] = 1;
`M32_LUI: Aluop32_S[`RALU_IOP_SLEFT16] = 1;

default: Aluop32_S[`RALU_IOP_ADD] = 1;

endcase




Aluop16_S = 0;

case (INST_S_R[`M16_OPCODE])

`M16_LI: Aluop16_S[`RALU_IOP_OR] = 1;
`M16_SLTI: Aluop16_S[`RALU_IOP_SLTS] = 1;
`M16_SLTIU: Aluop16_S[`RALU_IOP_SLTZ] = 1;
`M16_CMPI: Aluop16_S[`RALU_IOP_XOR] = 1;
`M16_BEQZ, `M16_BNEZ: Aluop16_S[`RALU_IOP_XOR] = 1;



`M16_SHIFT:
case(INST_S_R[1:0])
`M16_SRA: Aluop16_S[`RALU_IOP_SRIGHTA] = 1;
`M16_SLL: Aluop16_S[`RALU_IOP_SLEFT] = 1;
`M16_SRL: Aluop16_S[`RALU_IOP_SRIGHTL] = 1;
default: Aluop16_S[`RALU_IOP_ADD] = 1;
endcase

`M16_RR:
case(INST_S_R[`M16_SUB_RR])
`M16_SLT: Aluop16_S[`RALU_IOP_SLTS] = 1;
`M16_SLTU: Aluop16_S[`RALU_IOP_SLTZ] = 1;
`M16_CMP: Aluop16_S[`RALU_IOP_XOR] = 1;
`M16_NEG: Aluop16_S[`RALU_IOP_SUB] = 1;
`M16_AND: Aluop16_S[`RALU_IOP_AND] = 1;
`M16_OR: Aluop16_S[`RALU_IOP_OR] = 1;
`M16_XOR: Aluop16_S[`RALU_IOP_XOR] = 1;
`M16_NOT: Aluop16_S[`RALU_IOP_NOR] = 1;
`M16_SLLV: Aluop16_S[`RALU_IOP_SLEFT] = 1;
`M16_SRLV: Aluop16_S[`RALU_IOP_SRIGHTL] = 1;
`M16_SRAV: Aluop16_S[`RALU_IOP_SRIGHTA] = 1;
`M16_JREG: Aluop16_S[`RALU_IOP_LINK] = 1;
default: Aluop16_S[`RALU_IOP_ADD] = 1;
endcase

`M16_I8:
case(INST_S_R[`M16_SUB_I8])
`M16_BTNEZ: Aluop16_S[`RALU_IOP_XOR] = 1;
`M16_BTEQZ: Aluop16_S[`RALU_IOP_XOR] = 1;

`M16_MOVR32: Aluop16_S[`RALU_IOP_OR] = 1;
`M16_MOV32R: Aluop16_S[`RALU_IOP_OR] = 1;
default: Aluop16_S[`RALU_IOP_ADD] = 1;
endcase


`M16_RRR:
case(INST_S_R[`M16_SUB_RRR])
`M16_SUBU: Aluop16_S[`RALU_IOP_SUB] = 1;
default: Aluop16_S[`RALU_IOP_ADD] = 1;
endcase

default: Aluop16_S[`RALU_IOP_ADD] = 1;



endcase


if (JALval_E_R ) begin
Aluop16_S = 0;
Aluop16_S[`RALU_IOP_LINK] = 1;
end


ALUOP_E_P = (INSTM32_S_R_N == `M32) ? Aluop32_S : Aluop16_S;


end


















always @(INST_S_R or INSTM32_S_R_N or JALval_E_R) begin




Width32_S = 0;

case (INST_S_R[`M32_OPCODE])


`M32_COP0,
`M32_COP1,
`M32_COP2,
`M32_COP3:
case (INST_S_R[25:21])

`M32_MF,
`M32_CF: begin
Width32_S[`RALU_NONE] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_DBUS;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_MT,
`M32_CT: begin
Width32_S[`RALU_NONE] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b1;
end

default: begin
Width32_S[`RALU_NONE] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end
endcase

`M32_LB: begin
Width32_S[`RALU_BYTE] = 1;
Dsign32_E_P = 1'b1; Selc32_E_P = `RALU_SC_DBUS;
Dread32_E_P = 1'b1 ; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_LBU: begin
Width32_S[`RALU_BYTE] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_DBUS;
Dread32_E_P = 1'b1 ; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_LH: begin
Width32_S[`RALU_HALF] = 1;
Dsign32_E_P = 1'b1; Selc32_E_P = `RALU_SC_DBUS;
Dread32_E_P = 1'b1 ; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_LHU: begin
Width32_S[`RALU_HALF] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_DBUS;
Dread32_E_P = 1'b1 ; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_LW: begin
Width32_S[`RALU_WORD] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_DBUS;
Dread32_E_P = 1'b1 ; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_LWC1,
`M32_LWC2,
`M32_LWC3:
begin
Width32_S[`RALU_WORD] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b1 ; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

`M32_SB: begin
Width32_S[`RALU_BYTE] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b1;
RdbDriver32_E_P = 1'b1;
end

`M32_SH: begin
Width32_S[`RALU_HALF] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b1;
RdbDriver32_E_P = 1'b1;
end

`M32_SW: begin
Width32_S[`RALU_WORD] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b1;
RdbDriver32_E_P = 1'b1;
end

`M32_SWC1,
`M32_SWC2,
`M32_SWC3:
begin
Width32_S[`RALU_WORD] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b1;
RdbDriver32_E_P = 1'b0;
end

default:
begin
Width32_S[`RALU_NONE] = 1;
Dsign32_E_P = 1'b0; Selc32_E_P = `RALU_SC_ALUREGM;
Dread32_E_P = 1'b0; Dwrite32_E_P = 1'b0;
RdbDriver32_E_P = 1'b0;
end

endcase




Width16_S = 0;

case ({JALval_E_R, INST_S_R[`M16_OPCODE]})


{1'b0,`M16_LB}: begin
Width16_S[`RALU_BYTE] = 1;
Dsign16_E_P = 1'b1; Selc16_E_P = `RALU_SC_DBUS;
Dread16_E_P = 1'b1; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end

{1'b0,`M16_LBU}: begin
Width16_S[`RALU_BYTE] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_DBUS;
Dread16_E_P = 1'b1; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end

{1'b0,`M16_LH}: begin
Width16_S[`RALU_HALF] = 1;
Dsign16_E_P = 1'b1; Selc16_E_P = `RALU_SC_DBUS;
Dread16_E_P = 1'b1; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end

{1'b0,`M16_LHU}: begin
Width16_S[`RALU_HALF] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_DBUS;
Dread16_E_P = 1'b1; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end

{1'b0,`M16_LW},
{1'b0,`M16_LWPC},
{1'b0,`M16_LWSP}: begin
Width16_S[`RALU_WORD] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_DBUS;
Dread16_E_P = 1'b1; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end

{1'b0,`M16_SB}: begin
Width16_S[`RALU_BYTE] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_ALUREGM;
Dread16_E_P = 1'b0; Dwrite16_E_P = 1'b1;
RdbDriver16_E_P = 1'b1;
end

{1'b0,`M16_SH}: begin
Width16_S[`RALU_HALF] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_ALUREGM;
Dread16_E_P = 1'b0; Dwrite16_E_P = 1'b1;
RdbDriver16_E_P = 1'b1;
end

{1'b0,`M16_SW},
{1'b0,`M16_SWSP}: begin
Width16_S[`RALU_WORD] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_ALUREGM;
Dread16_E_P = 1'b0; Dwrite16_E_P = 1'b1;
RdbDriver16_E_P = 1'b1;
end

{1'b0,`M16_I8}: begin
case(INST_S_R[`M16_SUB_I8])

`M16_SWRASP: begin
Width16_S[`RALU_WORD] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_ALUREGM;
Dread16_E_P = 1'b0; Dwrite16_E_P = 1'b1;
RdbDriver16_E_P = 1'b1;
end

default: begin
Width16_S[`RALU_NONE] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_ALUREGM;
Dread16_E_P = 1'b0; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end
endcase
end

default:
begin
Width16_S[`RALU_NONE] = 1;
Dsign16_E_P = 1'b0; Selc16_E_P = `RALU_SC_ALUREGM;
Dread16_E_P = 1'b0; Dwrite16_E_P = 1'b0;
RdbDriver16_E_P = 1'b0;
end

endcase


WIDTH_E_P = (INSTM32_S_R_N == `M32) ? Width32_S : Width16_S;
Dsign_E_P = (INSTM32_S_R_N == `M32) ? Dsign32_E_P : Dsign16_E_P;
Selc_E_P = (INSTM32_S_R_N == `M32) ? Selc32_E_P : Selc16_E_P;
Dread_E_P = (INSTM32_S_R_N == `M32) ? Dread32_E_P : Dread16_E_P;
Dwrite_E_P = (INSTM32_S_R_N == `M32) ? Dwrite32_E_P : Dwrite16_E_P;
RdbDriver_E_P = (INSTM32_S_R_N == `M32) ? RdbDriver32_E_P : RdbDriver16_E_P;

end


















reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;








always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (!`RESET_D2_R_N_) begin

Extend_E_R <= 12'h000;
Extendval_E_R <= 1'b0;
JALval_E_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin

Extend_E_R <= INST_S_R[11:0];


Extendval_E_R <= (INST_S_R[`M16_OPCODE] == `M16_EXTEND) &
(INSTM32_S_R_N == `M16) &
~JALval_E_R;



JALval_E_R <= (INST_S_R[`M16_OPCODE] == `M16_JAL) &
(INSTM32_S_R_N == `M16) &
~CP0_XCPN_M_C1 & ~JALval_E_R;

end





always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (!`RESET_D2_R_N_) begin

Sela_E_R <= `RALU_SA_REGASF;
Selbi_E_R <= `RALU_SBI_REGBSF;
Selbr_E_R <= `RALU_SBR_REGBSF;
pSelc_M_R <= `RALU_SC_ALUREGM;
Selc_E_R <= `RALU_SC_ALUREGM;



end
else if (!CLMI_RHOLD) begin

Sela_E_R <= SELA_S;
Selbi_E_R <= SELBI_S;
Selbr_E_R <= SELBR_S;
pSelc_M_R <= Selc_E_R;
Selc_E_R <= Selc_E_P;


end




always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (!`RESET_D2_R_N_) begin

DREAD_E_R_C <= 1'b0;
DREAD_E_R <= 1'b0;

DWRITE_E_R_C <= 1'b0;
DWRITE_E_R <= 1'b0;

DSIGN_E_R <= 1'b0;

RDBDRIVER_R <= 1'b0;
RdbDriver_E_R <= 1'b0;


REGCADDR_M_R <= 5'b00000;
RegcAddr_E_R <= 5'b00000;


REGCWRITE_M_R <= 1'b0;
RegcWrite_E_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin


DREAD_E_R_C <= ~CP0_XCPN_M_C1 & Dread_E_P;
DREAD_E_R <= ~CP0_XCPN_M_C1 & Dread_E_P;

DWRITE_E_R_C <= ~CP0_XCPN_M_C1 & Dwrite_E_P;
DWRITE_E_R <= ~CP0_XCPN_M_C1 & Dwrite_E_P;

DSIGN_E_R <= Dsign_E_P;

RDBDRIVER_R <= RdbDriver_E_R;
RdbDriver_E_R <= RdbDriver_E_P;


REGCADDR_M_R <= RegcAddr_E_R;
RegcAddr_E_R <= RegcAddr_E_P;


REGCWRITE_M_R <= ~CP0_XCPN_M_C1 & RegcWrite_E_R;
RegcWrite_E_R <= ~CP0_XCPN_M_C1 & RegcWrite_E_P;

end




always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (!`RESET_D2_R_N_) begin

RegcAddr_W_R <= 5'b00000;
RegcWrite_W_R <= 1'b0;

end
else if (!RLShold) begin

RegcAddr_W_R <= REGCADDR_M_R;
RegcWrite_W_R <= REGCWRITE_M_R;

end






always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (!`RESET_D2_R_N_)
INSTM32_S_R_N <= `M32;
else if (!CLMI_RHOLD)
INSTM32_S_R_N <= CP0_INSTM32_I_R_C1_N;


always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (!`RESET_D2_R_N_)
INIT_D3_R_N <= 1'b0;
else
INIT_D3_R_N <= 1'b1;
















endmodule







