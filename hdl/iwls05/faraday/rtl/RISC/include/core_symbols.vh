


































































































































































































`define RALU_WSELA 8:0 

`define RALU_SA_PCREL 9'b000000001 
`define RALU_SA_ALURES 9'b000000010 
`define RALU_SA_DBUS 9'b000000100 
`define RALU_SA_ALUREGM 9'b000001000 
`define RALU_SA_REGCWB 9'b000010000 

`define RALU_SA_IMMED 9'b000100000 
`define RALU_SA_REGASF 9'b001000000 
`define RALU_SA_REGAHOLD 9'b010000000 
`define RALU_SA_RESET 9'b100000000 















`define RALU_WSELBR 7:0 

`define RALU_SBR_REGBSF 8'b00000001 
`define RALU_SBR_ALURES 8'b00000010 
`define RALU_SBR_DBUS 8'b00000100 
`define RALU_SBR_ALUREGM 8'b00001000 
`define RALU_SBR_REGCWB 8'b00010000 

`define RALU_SBR_REGBRHOLD 8'b00100000 
`define RALU_SBR_RESET 8'b01000000 
`define RALU_SBR_SPARE 8'b10000000 













`define RALU_WSELBI 8:0 

`define RALU_SBI_REGBSF 9'b000000001 
`define RALU_SBI_ALURES 9'b000000010 
`define RALU_SBI_DBUS 9'b000000100 
`define RALU_SBI_ALUREGM 9'b000001000 
`define RALU_SBI_REGCWB 9'b000010000 

`define RALU_SBI_IMMED 9'b000100000 
`define RALU_SBI_REGBIHOLD 9'b001000000 
`define RALU_SBI_RESET 9'b010000000 
`define RALU_SBI_SPARE 9'b100000000 















`define RALU_WSELC 3:0 

`define RALU_SC_RESET 4'b0001 
`define RALU_SC_HOLD 4'b0010 
`define RALU_SC_DBUS 4'b0100 
`define RALU_SC_ALUREGM 4'b1000 









`define RALU_WALUOP 12 

`define RALU_IOP_ADD 0 
`define RALU_IOP_SUB 1 
`define RALU_IOP_SLTZ 2 
`define RALU_IOP_AND 3 
`define RALU_IOP_OR 4 
`define RALU_IOP_NOR 5 
`define RALU_IOP_XOR 6 
`define RALU_IOP_SLEFT 7 
`define RALU_IOP_SRIGHTL 8 
`define RALU_IOP_SRIGHTA 9 
`define RALU_IOP_SLEFT16 10 
`define RALU_IOP_SLTS 11 
`define RALU_IOP_LINK 12 

`define RALU_IOP_INIT 13'b0_0000_1000_0000 





`define RALU_WWIDTH 3 

`define RALU_BYTE 0 
`define RALU_HALF 1 
`define RALU_WORD 2 
`define RALU_NONE 3 

`define RALU_WIDTH_INIT 4'b1000 




`define RALU_ARITH 1'b0 
`define RALU_LOGICAL 1'b1 
`define RALU_RIGHTS 1'b0 
`define RALU_LEFTS 1'b1 
`define RALU_L_NORMAL 1'b0 
`define RALU_L_LUI 1'b1 








`define PTYP_PSEQ 2'b00 
`define PTYP_DIRJ 2'b01 
`define PTYP_INDJ 2'b10 
`define PTYP_PNUL 2'b11 







`define CP0_WIMUX 9 

`define CP0_SBRANCH_PC 0 
`define CP0_SJUMP_PC 1 
`define CP0_SINCR_PC 2 
`define CP0_STRAP 3 
`define CP0_SRESET_PC 4 
`define CP0_SJUMPREG 5 
`define CP0_SBACKUP 6 
`define CP0_SJUMPX_PC 7 
`define CP0_DRET 8 
`define CP0_SIADDR_PC 9 







`define CP0_WLDCOP0 5 


`define CP0_WSELST 10 

`define CP0_STATUS 0 
`define CP0_CAUSE 1 
`define CP0_CCNTL 2 

`define CP0_DREG 3 
`define CP0_DEPC 4 
`define CP0_DSAVE 5 


`define CP0_BADVADDR 6 
`define CP0_EPC 7 
`define CP0_PRID 8 
`define CP0_CVSTAG 9 
`define CP0_RESREG 10 






`define CP0_WPCSEL 3 

`define CP0_SEL_PC_S 0 
`define CP0_SEL_PC_E 1 
`define CP0_SEL_PC_M 2 
`define CP0_SEL_ZERO 3 




`define CP0_WEPCSEL 2 

`define CP0_EPC_WP1 0 
`define CP0_EPC_W 1 
`define CP0_EPC_M 2 





`define CP0_TRAP_BEV0 32'h8000_0080 
`define CP0_TRAP_BEV1 32'hbfc0_0180 

`define CP0_TRAP_DPBE 32'hff20_0200 
`define CP0_TRAP_DNPB 32'hbfc0_0200 

`define CP0_RESET_VECTOR 32'hbfc0_0000 
`define CP0_RESET_VECTOR_EJ 32'hff20_0000 




`define CP0_BADVA_ADDR 5'b01000 
`define CP0_STATUS_ADDR 5'b01100 
`define CP0_CAUSE_ADDR 5'b01101 
`define CP0_EPC_ADDR 5'b01110 
`define CP0_PRID_ADDR 5'b01111 
`define CP0_CCNTL_ADDR 5'b10100 
`define CP0_CVSTAG_ADDR 5'b10101 

`define CP0_DREG_ADDR 5'b10000 
`define CP0_DEPC_ADDR 5'b10001 
`define CP0_DSAVE_ADDR 5'b11111 




`define CP0_UMODE 1'b1 
`define CP0_KMODE 1'b0 

`define CP0_RFE_INST 32'b0100_0010_0000_0000_0000_0000_0001_0000 
`define CP0_INIT_STATUS 32'b0000_0000_0100_0000_0000_0000_0000_0000 






`define CP0_WMMD 4 

`define MACD_MMD_RND 4:3 
`define MACD_MMD_MF 2 
`define MACD_MMD_MS 1 
`define MACD_MMD_MT 0 

`define MMD_CONV_MODE 2'b00 
`define MMD_RTN_MODE 2'b01 

`define REG_AS 24:21 
`define REG_AT 19:16 
`define REG_AD 14:11 
`define REG_SO 10:7 
`define M32_SUB_U 9 
`define M32_SUB_G 8 
`define M32_SUB_Z 8 
`define M32_SUB_S 7 
`define M32_SUB_K 7 
`define M32_SUB_D 6 

`define M32_LEXOP4180 6'b111100 
`define M16_LEXOP4180 6'b101111 

`define LEX_MADDA 6'b010010 
`define LEX_MSUBA 6'b010011 
`define LEX_RNDA 6'b010110 
`define LEX_DIVA 6'b011010 
`define LEX_CMULTA 6'b011011 
`define LEX_MFA 6'b011100 
`define LEX_MTA 6'b011101 
`define LEX_ADDMA 6'b011110 
`define LEX_SUBMA 6'b011111 














`define M32_OPCODE 31:26 

`define M32_REG_0 5'b00000 
`define M32_REG_T 5'b11000 
`define M32_REG_SP 5'b11101 
`define M32_REG_A 5'b11111 

`define M32_NOP 32'h0000_0000 


`define M32_SHIFT_I 4'b0000 



`define M32_SPECIAL 6'b000000 

`define M32_REGIMM 6'b000001 
`define M32_J 6'b000010 
`define M32_JAL 6'b000011 
`define M32_BEQ 6'b000100 
`define M32_BNE 6'b000101 
`define M32_BLEZ 6'b000110 
`define M32_BGTZ 6'b000111 
`define M32_ADDI 6'b001000 
`define M32_ADDIU 6'b001001 
`define M32_SLTI 6'b001010 
`define M32_SLTIU 6'b001011 
`define M32_ANDIOP 6'b001100 
`define M32_ORIOP 6'b001101 
`define M32_XORIOP 6'b001110 
`define M32_LUI 6'b001111 
`define M32_COP0 6'b010000 
`define M32_COP1 6'b010001 
`define M32_COP2 6'b010010 
`define M32_COP3 6'b010011 

`define M32_SPECIAL2 6'b011100 
`define M32_JALX 6'b011101 

`define M32_LB 6'b100000 
`define M32_LH 6'b100001 
`define M32_LWL 6'b100010 
`define M32_LW 6'b100011 
`define M32_LBU 6'b100100 
`define M32_LHU 6'b100101 
`define M32_LWR 6'b100110 

`define M32_SB 6'b101000 
`define M32_SH 6'b101001 
`define M32_SWL 6'b101010 
`define M32_SW 6'b101011 

`define M32_SWR 6'b101110 

`define M32_LWC1 6'b110001 
`define M32_LWC2 6'b110010 
`define M32_LWC3 6'b110011 

`define M32_SWC1 6'b111001 
`define M32_SWC2 6'b111010 
`define M32_SWC3 6'b111011 
`define M32_LEXOP 6'b111_100 










`define M32_SUB_SPECIAL 5:0 
`define M32_SUBOP `M32_SUB_SPECIAL 

`define M32_SLL 6'b000000 
`define M32_SRL 6'b000010 
`define M32_SRA 6'b000011 
`define M32_SLLV 6'b000100 
`define M32_SRLV 6'b000110 
`define M32_SRAV 6'b000111 

`define M32_JR 6'b001000 
`define M32_JALR 6'b001001 

`define M32_SYSCALL 6'b001100 
`define M32_BREAK 6'b001101 

`define M32_MFHI 6'b010000 
`define M32_MTHI 6'b010001 
`define M32_MFLO 6'b010010 
`define M32_MTLO 6'b010011 

`define M32_MULT 6'b011000 
`define M32_MULTU 6'b011001 
`define M32_DIV 6'b011010 
`define M32_DIVU 6'b011011 

`define M32_ADD 6'b100000 
`define M32_ADDU 6'b100001 
`define M32_OPSUB 6'b100010 
`define M32_OPSUBU 6'b100011 
`define M32_ANDROP 6'b100100 
`define M32_ORROP 6'b100101 
`define M32_XORROP 6'b100110 
`define M32_NORROP 6'b100111 

`define M32_SLT 6'b101010 
`define M32_SLTU 6'b101011 








`define M32_MAD 6'b000000 
`define M32_MADU 6'b000001 
`define M32_SPEC2000010 6'b000010 
`define M32_SPEC2000011 6'b000011 
`define M32_MSUB 6'b000100 
`define M32_MSUBU 6'b000101 
`define M32_SPEC2000110 6'b000110 
`define M32_SPEC2000111 6'b000111 

`define M32_SPEC2001xxx 6'b001xxx 
`define M32_SPEC2010xxx 6'b010xxx 
`define M32_SPEC2011xxx 6'b011xxx 
`define M32_SPEC2100xxx 6'b100xxx 
`define M32_SPEC2101xxx 6'b101xxx 
`define M32_SPEC2110xxx 6'b110xxx 

`define M32_SPEC21110xx 6'b1110xx 
`define M32_SPEC211110x 6'b11110x 
`define M32_SPEC2111110 6'b111110 
`define M32_SDBBP 6'b111111 









`define M32_SUB_LEXRA 5:0 

`define M32_MADH 6'b000000 
`define M32_MADL 6'b000010 
`define M32_MAZH 6'b000100 
`define M32_MAZL 6'b000110 

`define M32_MASH 6'b001000 
`define M32_MASL 6'b001010 

`define M32_MFHS 6'b001100 
`define M32_MFLS 6'b001110 

`define M32_MSBH 6'b010000 
`define M32_MSBL 6'b010010 
`define M32_MSZH 6'b010100 
`define M32_MSZL 6'b010110 

`define M32_MSSH 6'b011000 
`define M32_MSSL 6'b011010 

`define M32_SLEEP 6'b111000 









`define M32_SUB_REGIMM 20:16 

`define M32_BLTZ 5'b00000 
`define M32_BGEZ 5'b00001 

`define M32_BLTZAL 5'b10000 
`define M32_BGEZAL 5'b10001 













`define M32_SUB_COPZRS 25:21 


`define M32_MF 5'b00000 
`define M32_CF 5'b00010 
`define M32_MT 5'b00100 
`define M32_CT 5'b00110 
`define M32_BC 5'b01000 
`define M32_CO 2'b10 














`define M32_SUB_COPZRT 20:16 

`define M32_BCF 5'b00000 
`define M32_BCT 5'b00001 
`define M32_BCFL 5'b00010 
`define M32_BCTL 5'b00011 









`define M32_RFE 6'b010_000 
`define M32_ERET 6'b011_000 
`define M32_DRET 6'b011_111 








`define M32_CEIOPCODE 11:6 
`define M32_CEISUBOP 5:0 



`define M32_NEW_ROP0 6'b111_000 
`define M32_NEW_ROP1 6'b111_001 
`define M32_NEW_ROP2 6'b111_010 
`define M32_NEW_ROP3 6'b111_011 
`define M32_NEW_ROP4 6'b111_100 
`define M32_NEW_ROP5 6'b111_101 
`define M32_NEW_ROP6 6'b111_110 
`define M32_NEW_ROP7 6'b111_111 

`define M32_NEW_IOP0 6'b011_000 
`define M32_NEW_IOP1 6'b011_001 
`define M32_NEW_IOP2 6'b011_010 
`define M32_NEW_IOP3 6'b011_011 
`define M32_NEW_IOP4 6'b011_100 
`define M32_NEW_IOP5 6'b011_101 
`define M32_NEW_IOP6 6'b011_110 
`define M32_NEW_IOP7 6'b011_111 


`define M32_CEVAL_RFORMAT 2'b10 
`define M32_CEVAL_IFORMAT 2'b11 
`define M32_IFORMAT 1'b1 
`define M32_RFORMAT 1'b0 
`define M32_VALID 1'b1 
`define M32_INVALID 1'b0 


















































`define M16_OPCODE 31:26 

`define M32 1'b0 
`define M16 1'b1 

`define M16_REG_0 5'b00000 
`define M16_REG_T 5'b11000 
`define M16_REG_SP 5'b11101 
`define M16_REG_A 5'b11111 

`define M16_RX 10:8 
`define M16_RY 7:5 

`define M16_NOP 32'b001100_0000000000_01100_101_00000_000 













`define M16_LB 6'b100000 
`define M16_LBU 6'b100100 
`define M16_LH 6'b100001 
`define M16_LHU 6'b100101 
`define M16_LW 6'b100011 
`define M16_LWPC 6'b100110 
`define M16_LWSP 6'b100010 


`define M16_SB 6'b101000 
`define M16_SH 6'b101001 
`define M16_SW 6'b101011 
`define M16_SWSP 6'b101010 


`define M16_LI 6'b001101 
`define M16_ADDIU8 6'b001001 
`define M16_ADDIUPC 6'b000001 
`define M16_ADDIUSP 6'b000000 
`define M16_SLTI 6'b001010 
`define M16_SLTIU 6'b001011 
`define M16_CMPI 6'b001110 


`define M16_BEQZ 6'b000100 
`define M16_BNEZ 6'b000101 
`define M16_B 6'b000010 

`define M16_JAL 6'b000011 

`define M16_JALT 1'b0 
`define M16_JALX 1'b1 



`define M16_SHIFT 6'b000110 


`define M16_SUB_SHIFT 1:0 

`define M16_SLL 2'b00 
`define M16_DSLL 2'b01 
`define M16_SRL 2'b10 
`define M16_SRA 2'b11 


`define M16_EXTEND 6'b101110 


`define M16_LD 6'b000111 
`define M16_SD 6'b001111 
`define M16_LWU 6'b100111 

`define M16_I64 6'b101111 









`define M16_RR 6'b101101 
`define M16_SUB_RR 4:0 



`define M16_JREG 5'b00000 


`define M16_JRX 3'b000 
`define M16_JRA 3'b001 
`define M16_JALR 3'b010 



`define M16_SDBBP 5'b00001 


`define M16_SLT 5'b00010 
`define M16_SLTU 5'b00011 


`define M16_SLLV 5'b00100 
`define M16_BREAK 5'b00101 
`define M16_SRLV 5'b00110 
`define M16_SRAV 5'b00111 


`define M16_DSRL 5'b01000 
`define M16_RR01001 5'b01001 
`define M16_CMP 5'b01010 
`define M16_NEG 5'b01011 

`define M16_AND 5'b01100 
`define M16_OR 5'b01101 
`define M16_XOR 5'b01110 
`define M16_NOT 5'b01111 


`define M16_MFHI 5'b10000 
`define M16_RR10001 5'b10001 
`define M16_MFLO 5'b10010 
`define M16_DSRA 5'b10011 

`define M16_DSLLV 5'b10100 
`define M16_RR10101 5'b10101 
`define M16_DSRLV 5'b10110 
`define M16_DSRAV 5'b10111 

`define M16_MULT 5'b11000 
`define M16_MULTU 5'b11001 
`define M16_DIV 5'b11010 
`define M16_DIVU 5'b11011 

`define M16_DMULT 5'b11100 
`define M16_DMULTU 5'b11101 
`define M16_DDIV 5'b11110 
`define M16_DDIVU 5'b11111 













`define M16_I8 6'b001100 
`define M16_SUB_I8 10:8 

`define M16_BTEQZ 3'b000 
`define M16_BTNEZ 3'b001 

`define M16_SWRASP 3'b010 

`define M16_ADDJSP 3'b011 

`define M16_I8100 3'b100 
`define M16_MOV32R 3'b101 
`define M16_I8110 3'b110 
`define M16_MOVR32 3'b111 










`define M16_RRR 6'b101100 
`define M16_SUB_RRR 1:0 


`define M16_DADDU 2'b00 
`define M16_ADDU 2'b01 
`define M16_DSUBU 2'b10 
`define M16_SUBU 2'b11 








`define M16_RRI_A 6'b001000 
`define M16_SUB_RRI_A 4 

`define M16_ADDIU 1'b0 
`define M16_DADDIU 1'b1 












`define M16_LEXOP 6'b101111 
`define M16_SUB_LEXRA 4:0 

`define M16_MADH 5'b00000 
`define M16_MADL 5'b00010 
`define M16_MAZH 5'b00100 
`define M16_MAZL 5'b00110 

`define M16_MASH 5'b01000 
`define M16_MASL 5'b01010 

`define M16_MFHS 5'b01100 
`define M16_MFLS 5'b01110 

`define M16_MSBH 5'b10000 
`define M16_MSBL 5'b10010 
`define M16_MSZH 5'b10100 
`define M16_MSZL 5'b10110 

`define M16_MSSH 5'b11000 
`define M16_MSSL 5'b11010 





`define M16_CEIOPCODE 11:6 
`define M16_CEISUBOP 5:0 












`define CLMI_SEL_INST_ZERO_POS 0 
`define CLMI_SEL_INST_LOAD_POS 1 
`define CLMI_SEL_INST_HOLD_POS 2 

`define CLMI_SEL_INST_HI 2 

`define CLMI_SEL_INST_NIL_VECT 3'b000 











`define LOP_MADH `M32_MADH 
`define LOP_MADL `M32_MADL 
`define LOP_MAZH `M32_MAZH 
`define LOP_MAZL `M32_MAZL 

`define LOP_MASH `M32_MASH 
`define LOP_MASL `M32_MASL 

`define LOP_MFHS `M32_MFHS 
`define LOP_MFLS `M32_MFLS 

`define LOP_MSBH `M32_MSBH 
`define LOP_MSBL `M32_MSBL 
`define LOP_MSZH `M32_MSZH 
`define LOP_MSZL `M32_MSZL 

`define LOP_MSSH `M32_MSSH 
`define LOP_MSSL `M32_MSSL 









`define SOP_SLL `M32_SLL 

`define SOP_SRL `M32_SRL 
`define SOP_SRA `M32_SRA 
`define SOP_SLLV `M32_SLLV 

`define SOP_SRLV `M32_SRLV 
`define SOP_SRAV `M32_SRAV 
`define SOP_JR `M32_JR 
`define SOP_JALR `M32_JALR 

`define SOP_SYSCALL `M32_SYSCALL 
`define SOP_BREAK `M32_BREAK 


`define SOP_MFHI `M32_MFHI 
`define SOP_MTHI `M32_MTHI 
`define SOP_MFLO `M32_MFLO 
`define SOP_MTLO `M32_MTLO 

`define SOP_MULT `M32_MULT 
`define SOP_MULTU `M32_MULTU 
`define SOP_DIV `M32_DIV 
`define SOP_DIVU `M32_DIVU 

`define SOP_ADD `M32_ADD 
`define SOP_ADDU `M32_ADDU 
`define SOP_OPSUB `M32_OPSUB 
`define SOP_OPSUBU `M32_OPSUBU 
`define SOP_ANDROP `M32_ANDROP 
`define SOP_ORROP `M32_ORROP 
`define SOP_XORROP `M32_XORROP 
`define SOP_NORROP `M32_NORROP 

`define SOP_SLT `M32_SLT 
`define SOP_SLTU `M32_SLTU 







`define SOP2_MAD `M32_MAD 
`define SOP2_MADU `M32_MADU 
`define SOP2_MSUB `M32_MSUB 
`define SOP2_MSUBU `M32_MSUBU 





