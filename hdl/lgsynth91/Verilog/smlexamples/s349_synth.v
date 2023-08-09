// IWLS benchmark module "s349.bench" printed on Wed May 29 21:27:58 2002
module \s349.bench (START, B0, B1, B2, B3, A0, A1, A2, A3, CNTVCO2, CNTVCON2, READY, P0, P1, P2, P3, P4, P5, P6, P7);
input
  START,
  A0,
  A1,
  A2,
  A3,
  B0,
  B1,
  B2,
  B3;
output
  P0,
  P1,
  P2,
  P3,
  P4,
  P5,
  P6,
  P7,
  READY,
  CNTVCO2,
  CNTVCON2;
reg
  CT0,
  CT1,
  CT2,
  MRVQN0,
  MRVQN1,
  MRVQN2,
  MRVQN3,
  ACVQN0,
  ACVQN1,
  ACVQN2,
  ACVQN3,
  AX0,
  AX1,
  AX2,
  AX3;
wire
  MRVG1VDVAD2NF,
  \[40] ,
  \[26] ,
  \[41] ,
  CNTVG3VD,
  ADSH,
  \[27] ,
  READYN,
  \[42] ,
  \[28] ,
  ACVG2VD1,
  MRVG4VDVAD2NF,
  \[43] ,
  \[29] ,
  \[44] ,
  ADDVG2VCN,
  \[45] ,
  \[46] ,
  \[47] ,
  MRVG2VD,
  \[48] ,
  \[49] ,
  \[15] ,
  ACVG1VD1,
  \[30] ,
  \[16] ,
  \[31] ,
  \[17] ,
  ADDVG1VCN,
  \[32] ,
  ADDVG4VCN,
  \[18] ,
  MRVG4VD,
  MRVG3VDVAD2NF,
  SMVG3VG1VAD2NF,
  \[33] ,
  \[19] ,
  IINIIT,
  AM0,
  AM1,
  \[34] ,
  AM2,
  AM3,
  ACVG4VD1,
  SMVG2VG1VAD2NF,
  CNTVG2VD,
  \[35] ,
  MRVG2VDVAD2NF,
  \[50] ,
  \[36] ,
  \[37] ,
  MRVG1VD,
  \[38] ,
  \[39] ,
  ADDVG3VCN,
  \[54] ,
  SMVG4VG1VAD2NF,
  \[20] ,
  \[55] ,
  \[21] ,
  ACVG3VD1,
  \[56] ,
  \[22] ,
  MRVG3VD,
  \[23] ,
  \[24] ,
  CNTVG1VD,
  \[25] ;
assign
  MRVG1VDVAD2NF = (\[50]  & B0) | (\[49]  & ~MRVQN0),
  \[40]  = AM0,
  \[26]  = CNTVG3VD,
  \[41]  = ~AX3 | MRVQN0,
  CNTVG3VD = (~IINIIT & (~CNTVG2VD & (\[16]  & ~START))) | (CNTVG1VD & CT2),
  ADSH = ~IINIIT & READYN,
  \[27]  = CNTVG2VD,
  READYN = ~CT0 | (CT1 | ~CT2),
  \[42]  = ~AX2 | MRVQN0,
  \[28]  = CNTVG1VD,
  ACVG2VD1 = (~SMVG3VG1VAD2NF & ADSH) | ((~SMVG3VG1VAD2NF & ACVQN1) | START),
  MRVG4VDVAD2NF = (\[50]  & B3) | (\[49]  & ~MRVQN3),
  \[43]  = ~AX1 | MRVQN0,
  \[29]  = ACVG4VD1,
  P0 = \[18] ,
  P1 = \[19] ,
  P2 = \[20] ,
  P3 = \[21] ,
  P4 = \[22] ,
  P5 = \[23] ,
  P6 = \[24] ,
  P7 = \[25] ,
  \[44]  = ~READYN | ~CT0,
  ADDVG2VCN = (\[56]  & \[43] ) | ~\[48] ,
  \[45]  = ~AX0 | MRVQN0,
  \[46]  = ~ADDVG3VCN | ~ACVQN3,
  \[47]  = ~ADDVG2VCN | ~ACVQN2,
  MRVG2VD = (~ADSH & ~MRVG2VDVAD2NF) | (~MRVG2VDVAD2NF & MRVQN2),
  \[48]  = ~ADDVG1VCN | ~ACVQN1,
  \[49]  = ~READYN,
  READY = \[17] ,
  \[15]  = ~\[16] ,
  CNTVCO2 = \[15] ,
  ACVG1VD1 = (~SMVG2VG1VAD2NF & ADSH) | ((~SMVG2VG1VAD2NF & ACVQN0) | START),
  \[30]  = ACVG3VD1,
  \[16]  = ~CT0 | (~CT1 | ~CT2),
  CNTVCON2 = \[16] ,
  \[31]  = ACVG2VD1,
  \[17]  = ~READYN,
  ADDVG1VCN = \[45]  | ACVQN0,
  \[32]  = ACVG1VD1,
  ADDVG4VCN = (\[54]  & \[41] ) | ~\[46] ,
  \[18]  = ~MRVQN0,
  MRVG4VD = (\[45]  & (~MRVG4VDVAD2NF & ACVQN0)) | ((~ADSH & ~MRVG4VDVAD2NF) | (~ADDVG1VCN & ~MRVG4VDVAD2NF)),
  MRVG3VDVAD2NF = (\[50]  & B2) | (\[49]  & ~MRVQN2),
  SMVG3VG1VAD2NF = (~\[55]  & (~\[42]  & ADSH)) | ((\[47]  & (ADSH & ADDVG3VCN)) | (~\[42]  & (ADSH & ADDVG3VCN))),
  \[33]  = MRVG4VD,
  \[19]  = ~MRVQN1,
  IINIIT = ~CT2 & (~CT1 & ~CT0),
  AM0 = (~IINIIT & AX0) | (IINIIT & A0),
  AM1 = (~IINIIT & AX1) | (IINIIT & A1),
  \[34]  = MRVG3VD,
  AM2 = (~IINIIT & AX2) | (IINIIT & A2),
  AM3 = (~IINIIT & AX3) | (IINIIT & A3),
  ACVG4VD1 = (~ADSH & ACVQN3) | ((ADSH & ADDVG4VCN) | START),
  SMVG2VG1VAD2NF = (~\[56]  & (~\[43]  & ADSH)) | ((\[48]  & (ADSH & ADDVG2VCN)) | (~\[43]  & (ADSH & ADDVG2VCN))),
  CNTVG2VD = (~\[44]  & (~CT1 & ~START)) | (\[44]  & (CT1 & ~START)),
  \[35]  = MRVG2VD,
  MRVG2VDVAD2NF = (\[50]  & B1) | (\[49]  & ~MRVQN1),
  \[50]  = ~ADSH & READYN,
  \[36]  = MRVG1VD,
  \[37]  = AM3,
  MRVG1VD = (~ADSH & ~MRVG1VDVAD2NF) | (~MRVG1VDVAD2NF & MRVQN1),
  \[38]  = AM2,
  \[39]  = AM1,
  ADDVG3VCN = (\[55]  & \[42] ) | ~\[47] ,
  \[54]  = ADDVG3VCN | ACVQN3,
  SMVG4VG1VAD2NF = (~\[54]  & (~\[41]  & ADSH)) | ((\[46]  & (ADSH & ADDVG4VCN)) | (~\[41]  & (ADSH & ADDVG4VCN))),
  \[20]  = ~MRVQN2,
  \[55]  = ADDVG2VCN | ACVQN2,
  \[21]  = ~MRVQN3,
  ACVG3VD1 = (~SMVG4VG1VAD2NF & ADSH) | ((~SMVG4VG1VAD2NF & ACVQN2) | START),
  \[56]  = ADDVG1VCN | ACVQN1,
  \[22]  = ~ACVQN0,
  MRVG3VD = (~ADSH & ~MRVG3VDVAD2NF) | (~MRVG3VDVAD2NF & MRVQN3),
  \[23]  = ~ACVQN1,
  \[24]  = ~ACVQN2,
  CNTVG1VD = \[44]  & ~START,
  \[25]  = ~ACVQN3;
always begin
  CT0 = \[28] ;
  CT1 = \[27] ;
  CT2 = \[26] ;
  MRVQN0 = \[36] ;
  MRVQN1 = \[35] ;
  MRVQN2 = \[34] ;
  MRVQN3 = \[33] ;
  ACVQN0 = \[32] ;
  ACVQN1 = \[31] ;
  ACVQN2 = \[30] ;
  ACVQN3 = \[29] ;
  AX0 = \[40] ;
  AX1 = \[39] ;
  AX2 = \[38] ;
  AX3 = \[37] ;
end
initial begin
  CT0 = 0;
  CT1 = 0;
  CT2 = 0;
  MRVQN0 = 0;
  MRVQN1 = 0;
  MRVQN2 = 0;
  MRVQN3 = 0;
  ACVQN0 = 0;
  ACVQN1 = 0;
  ACVQN2 = 0;
  ACVQN3 = 0;
  AX0 = 0;
  AX1 = 0;
  AX2 = 0;
  AX3 = 0;
end
endmodule

