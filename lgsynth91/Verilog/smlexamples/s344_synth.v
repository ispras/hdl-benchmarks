// IWLS benchmark module "s344.bench" printed on Wed May 29 21:27:57 2002
module \s344.bench (START, B0, B1, B2, B3, A0, A1, A2, A3, P4, P5, P6, P7, P0, P1, P2, P3, CNTVCON2, CNTVCO2, READY);
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
  \[36] ,
  \[37] ,
  MRVG1VD,
  \[38] ,
  \[53] ,
  \[39] ,
  ADDVG3VCN,
  \[54] ,
  SMVG4VG1VAD2NF,
  \[20] ,
  \[55] ,
  \[21] ,
  ACVG3VD1,
  \[22] ,
  MRVG3VD,
  \[23] ,
  \[24] ,
  CNTVG1VD,
  \[25] ;
assign
  MRVG1VDVAD2NF = (\[49]  & B0) | (\[48]  & ~MRVQN0),
  \[40]  = AM0,
  \[26]  = CNTVG3VD,
  \[41]  = ~AX1 | MRVQN0,
  CNTVG3VD = (CT0 & (CT1 & (~CT2 & ~START))) | (CT2 & (\[23]  & ~START)),
  ADSH = ~IINIIT & READYN,
  \[27]  = CNTVG2VD,
  READYN = ~CT0 | (CT1 | ~CT2),
  \[42]  = ~AX2 | MRVQN0,
  \[28]  = CNTVG1VD,
  ACVG2VD1 = (~SMVG3VG1VAD2NF & ADSH) | ((~SMVG3VG1VAD2NF & ACVQN1) | START),
  MRVG4VDVAD2NF = (\[49]  & B3) | (\[48]  & ~MRVQN3),
  \[43]  = ~AX3 | MRVQN0,
  \[29]  = ACVG4VD1,
  P0 = \[19] ,
  P1 = \[20] ,
  P2 = \[21] ,
  P3 = \[22] ,
  P4 = \[15] ,
  P5 = \[16] ,
  P6 = \[17] ,
  P7 = \[18] ,
  \[44]  = ~AX0 | MRVQN0,
  ADDVG2VCN = (\[53]  & \[41] ) | ~\[45] ,
  \[45]  = ~ADDVG1VCN | ~ACVQN1,
  \[46]  = ~ADDVG2VCN | ~ACVQN2,
  \[47]  = ~ADDVG3VCN | ~ACVQN3,
  MRVG2VD = (~ADSH & ~MRVG2VDVAD2NF) | (~MRVG2VDVAD2NF & MRVQN2),
  \[48]  = ~READYN,
  \[49]  = ~ADSH & READYN,
  READY = \[25] ,
  \[15]  = ~ACVQN0,
  CNTVCO2 = \[24] ,
  ACVG1VD1 = (~SMVG2VG1VAD2NF & ADSH) | ((~SMVG2VG1VAD2NF & ACVQN0) | START),
  \[30]  = ACVG3VD1,
  \[16]  = ~ACVQN1,
  CNTVCON2 = \[23] ,
  \[31]  = ACVG2VD1,
  \[17]  = ~ACVQN2,
  ADDVG1VCN = \[44]  | ACVQN0,
  \[32]  = ACVG1VD1,
  ADDVG4VCN = (\[55]  & \[43] ) | ~\[47] ,
  \[18]  = ~ACVQN3,
  MRVG4VD = (\[44]  & (~MRVG4VDVAD2NF & ACVQN0)) | ((~ADDVG1VCN & ~MRVG4VDVAD2NF) | (~ADSH & ~MRVG4VDVAD2NF)),
  MRVG3VDVAD2NF = (\[49]  & B2) | (\[48]  & ~MRVQN2),
  SMVG3VG1VAD2NF = (~\[54]  & (~\[42]  & ADSH)) | ((\[46]  & (ADDVG3VCN & ADSH)) | (~\[42]  & (ADDVG3VCN & ADSH))),
  \[33]  = MRVG4VD,
  \[19]  = ~MRVQN0,
  IINIIT = ~CT2 & (~CT1 & ~CT0),
  AM0 = (~IINIIT & AX0) | (IINIIT & A0),
  AM1 = (~IINIIT & AX1) | (IINIIT & A1),
  \[34]  = MRVG3VD,
  AM2 = (~IINIIT & AX2) | (IINIIT & A2),
  AM3 = (~IINIIT & AX3) | (IINIIT & A3),
  ACVG4VD1 = (ADDVG4VCN & ADSH) | ((~ADSH & ACVQN3) | START),
  SMVG2VG1VAD2NF = (~\[53]  & (~\[41]  & ADSH)) | ((\[45]  & (ADDVG2VCN & ADSH)) | (~\[41]  & (ADDVG2VCN & ADSH))),
  CNTVG2VD = (~CNTVG1VD & (~CT1 & ~START)) | (CNTVG1VD & CT1),
  \[35]  = MRVG2VD,
  MRVG2VDVAD2NF = (\[49]  & B1) | (\[48]  & ~MRVQN1),
  \[36]  = MRVG1VD,
  \[37]  = AM3,
  MRVG1VD = (~ADSH & ~MRVG1VDVAD2NF) | (~MRVG1VDVAD2NF & MRVQN1),
  \[38]  = AM2,
  \[53]  = ADDVG1VCN | ACVQN1,
  \[39]  = AM1,
  ADDVG3VCN = (\[54]  & \[42] ) | ~\[46] ,
  \[54]  = ADDVG2VCN | ACVQN2,
  SMVG4VG1VAD2NF = (~\[55]  & (~\[43]  & ADSH)) | ((\[47]  & (ADDVG4VCN & ADSH)) | (~\[43]  & (ADDVG4VCN & ADSH))),
  \[20]  = ~MRVQN1,
  \[55]  = ADDVG3VCN | ACVQN3,
  \[21]  = ~MRVQN2,
  ACVG3VD1 = (~SMVG4VG1VAD2NF & ADSH) | ((~SMVG4VG1VAD2NF & ACVQN2) | START),
  \[22]  = ~MRVQN3,
  MRVG3VD = (~ADSH & ~MRVG3VDVAD2NF) | (~MRVG3VDVAD2NF & MRVQN3),
  \[23]  = ~CT0 | (~CT1 | ~CT2),
  \[24]  = ~\[23] ,
  CNTVG1VD = (~READYN & ~START) | (~CT0 & ~START),
  \[25]  = ~READYN;
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

