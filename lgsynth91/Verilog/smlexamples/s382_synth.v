// IWLS benchmark module "s382.bench" printed on Wed May 29 21:34:54 2002
module \s382.bench (FM, TEST, CLR, GRN1, GRN2, RED1, YLW2, RED2, YLW1);
input
  TEST,
  CLR,
  FM;
output
  RED1,
  RED2,
  YLW1,
  YLW2,
  GRN1,
  GRN2;
reg
  OLATCH_Y2L,
  OLATCH_G1L,
  TESTL,
  UC_10,
  UC_11,
  UC_16,
  UC_17,
  UC_18,
  UC_19,
  UC_8,
  UC_9,
  OLATCH_FEL,
  OLATCHVUC_5,
  OLATCHVUC_6,
  FML,
  C3_Q0,
  C3_Q1,
  C3_Q2,
  C3_Q3,
  OLATCH_R1L,
  OLATCH_G2L;
wire
  \[40] ,
  \[26] ,
  \[41] ,
  UC_17VD,
  \[27] ,
  \[42] ,
  C3_Q1VD,
  \[28] ,
  \[43] ,
  Y1C,
  R2CVAD2NF,
  \[29] ,
  TCOMB_GA1,
  TCOMB_GA2,
  \[44] ,
  TCOMB_RA1,
  \[45] ,
  TESTLVIINLATCHVCDAD,
  UC_8VD,
  \[60] ,
  \[46] ,
  \[61] ,
  UC_19VD,
  \[47] ,
  \[62] ,
  C3_Q3VD,
  \[48] ,
  \[49] ,
  UC_27,
  \[30] ,
  UC_11VD,
  \[31] ,
  UC_16VD,
  \[32] ,
  FMLVIINLATCHVCDAD,
  C3_Q0VD,
  TCOMBVNODE16,
  \[33] ,
  \[34] ,
  \[35] ,
  \[50] ,
  \[36] ,
  \[51] ,
  UC_18VD,
  \[37] ,
  C2_CO,
  TCOMB_GA2VAD2NF,
  \[52] ,
  C3_Q2VD,
  \[38] ,
  TCOMB_YA1,
  TCOMB_YA2,
  \[53] ,
  \[39] ,
  \[54] ,
  UC_10VD,
  \[55] ,
  UC_9VD,
  TCOMB_FE,
  R2C,
  C1_CO,
  \[25] ;
assign
  \[40]  = UC_16VD,
  \[26]  = ~OLATCHVUC_6,
  \[41]  = UC_17VD,
  UC_17VD = (\[62]  & (~UC_18VD & ~UC_17)) | ((\[49]  & (~UC_18 & UC_17)) | (UC_18VD & UC_17)),
  \[27]  = TESTLVIINLATCHVCDAD,
  \[42]  = UC_18VD,
  C3_Q1VD = (\[60]  & (\[53]  & C2_CO)) | ((\[53]  & (~C3_Q0 & C3_Q1)) | (\[61]  & C3_Q1)),
  \[28]  = FMLVIINLATCHVCDAD,
  \[43]  = UC_19VD,
  Y1C = (TCOMB_FE & UC_17) | ~TCOMB_YA1,
  R2CVAD2NF = (~\[50]  & (~TCOMB_FE & (C3_Q3 & ~CLR))) | (~TCOMB_FE & (C3_Q2 & ~CLR)),
  \[29]  = TCOMB_YA2,
  TCOMB_GA1 = (\[50]  & (TCOMBVNODE16 & (~C3_Q3 & ~TCOMB_RA1))) | (TCOMBVNODE16 & (C3_Q2 & (~TCOMB_RA1 & ~FML))),
  TCOMB_GA2 = (\[55]  & (~TCOMB_GA2VAD2NF & C3_Q0)) | (\[51]  & ~TCOMB_GA2VAD2NF),
  \[44]  = UC_8VD,
  TCOMB_RA1 = (\[60]  & \[55] ) | \[51] ,
  \[45]  = UC_9VD,
  TESTLVIINLATCHVCDAD = (~TESTL & (~CLR & TEST)) | (TESTL & (~CLR & ~TEST)),
  UC_8VD = (\[52]  & (UC_9 & ~UC_9VD)) | (UC_11VD & UC_8),
  \[60]  = C3_Q0 & ~C3_Q1,
  \[46]  = UC_10VD,
  \[61]  = \[49] ,
  UC_19VD = (\[49]  & (~\[48]  & UC_19)) | (\[49]  & (\[48]  & ~UC_19)),
  \[47]  = UC_11VD,
  \[62]  = \[49]  & UC_18,
  C3_Q3VD = (C2_CO & (~UC_27 & (TCOMB_GA2VAD2NF & C3_Q2))) | (\[53]  & C3_Q3),
  \[48]  = C1_CO | TESTL,
  \[49]  = ~C2_CO & ~CLR,
  UC_27 = \[54]  & (C2_CO & C3_Q3),
  \[30]  = Y1C,
  UC_11VD = \[52]  & ~UC_11,
  RED1 = OLATCH_R1L,
  \[31]  = R2C,
  RED2 = \[25] ,
  UC_16VD = (\[62]  & (UC_19 & (~UC_19VD & UC_17))) | (\[49]  & UC_16),
  \[32]  = TCOMB_RA1,
  FMLVIINLATCHVCDAD = (~FML & (~CLR & FM)) | (FML & (~CLR & ~FM)),
  C3_Q0VD = (\[53]  & (C2_CO & ~C3_Q0)) | (\[61]  & C3_Q0),
  TCOMBVNODE16 = (\[60]  & (C3_Q2 & (~C3_Q3 & ~FML))) | (~OLATCH_FEL | CLR),
  \[33]  = TCOMB_GA2,
  YLW1 = \[26] ,
  YLW2 = OLATCH_Y2L,
  \[34]  = TCOMB_GA1,
  \[35]  = TCOMB_FE,
  \[50]  = C3_Q0 | C3_Q1,
  \[36]  = C3_Q3VD,
  \[51]  = (\[55]  & ~C3_Q3) | CLR,
  UC_18VD = (\[49]  & (UC_19 & (~UC_19VD & ~UC_18))) | ((\[62]  & ~\[48] ) | (UC_19VD & UC_18)),
  \[37]  = C3_Q2VD,
  C2_CO = (\[48]  & (UC_19 & UC_16)) | ((\[48]  & (UC_18 & UC_16)) | (\[48]  & (UC_17 & UC_16))),
  TCOMB_GA2VAD2NF = C3_Q0 & (C3_Q1 & ~CLR),
  \[52]  = ~C1_CO & ~CLR,
  C3_Q2VD = (C2_CO & (~UC_27 & (TCOMB_GA2VAD2NF & ~C3_Q2))) | ((\[53]  & (~TCOMB_GA2VAD2NF & C3_Q2)) | (\[61]  & C3_Q2)),
  GRN1 = OLATCH_G1L,
  GRN2 = OLATCH_G2L,
  \[38]  = C3_Q1VD,
  TCOMB_YA1 = (~\[54]  & (C3_Q3 & ~CLR)) | ((TCOMB_FE & ~C3_Q3) | ~TCOMBVNODE16),
  TCOMB_YA2 = \[55]  & TCOMB_GA2VAD2NF,
  \[53]  = ~UC_27 & ~CLR,
  \[39]  = C3_Q0VD,
  \[54]  = \[50]  | C3_Q2,
  UC_10VD = (\[52]  & (UC_11 & ~UC_10)) | (UC_11VD & UC_10),
  \[55]  = ~C3_Q2 & ~OLATCH_FEL,
  UC_9VD = (\[52]  & (UC_11 & (UC_10 & ~UC_9))) | ((\[52]  & (~UC_10 & UC_9)) | (UC_11VD & UC_9)),
  TCOMB_FE = (~\[50]  & (C3_Q2 & (FML & ~CLR))) | ~TCOMBVNODE16,
  R2C = (~TCOMB_FE & ~R2CVAD2NF) | (~R2CVAD2NF & UC_17),
  C1_CO = (UC_11 & UC_8) | ((UC_10 & UC_8) | (UC_9 & UC_8)),
  \[25]  = ~OLATCHVUC_5;
always begin
  OLATCH_Y2L = \[29] ;
  OLATCH_G1L = \[34] ;
  TESTL = \[27] ;
  UC_10 = \[46] ;
  UC_11 = \[47] ;
  UC_16 = \[40] ;
  UC_17 = \[41] ;
  UC_18 = \[42] ;
  UC_19 = \[43] ;
  UC_8 = \[44] ;
  UC_9 = \[45] ;
  OLATCH_FEL = \[35] ;
  OLATCHVUC_5 = \[31] ;
  OLATCHVUC_6 = \[30] ;
  FML = \[28] ;
  C3_Q0 = \[39] ;
  C3_Q1 = \[38] ;
  C3_Q2 = \[37] ;
  C3_Q3 = \[36] ;
  OLATCH_R1L = \[32] ;
  OLATCH_G2L = \[33] ;
end
initial begin
  OLATCH_Y2L = 0;
  OLATCH_G1L = 0;
  TESTL = 0;
  UC_10 = 0;
  UC_11 = 0;
  UC_16 = 0;
  UC_17 = 0;
  UC_18 = 0;
  UC_19 = 0;
  UC_8 = 0;
  UC_9 = 0;
  OLATCH_FEL = 0;
  OLATCHVUC_5 = 0;
  OLATCHVUC_6 = 0;
  FML = 0;
  C3_Q0 = 0;
  C3_Q1 = 0;
  C3_Q2 = 0;
  C3_Q3 = 0;
  OLATCH_R1L = 0;
  OLATCH_G2L = 0;
end
endmodule

