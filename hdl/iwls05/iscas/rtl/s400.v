module s400_bench(
  blif_clk_net,
  blif_reset_net,
  FM,
  TEST,
  CLR,
  GRN2,
  YLW2,
  RED2,
  GRN1,
  YLW1,
  RED1);
input blif_clk_net;
input blif_reset_net;
input FM;
input TEST;
input CLR;
output GRN2;
output YLW2;
output RED2;
output GRN1;
output YLW1;
output RED1;
reg TESTL;
reg FML;
reg OLATCH_Y2L;
reg OLATCHVUC_6;
reg OLATCHVUC_5;
reg OLATCH_R1L;
reg OLATCH_G2L;
reg OLATCH_G1L;
reg OLATCH_FEL;
reg C3_Q3;
reg C3_Q2;
reg C3_Q1;
reg C3_Q0;
reg UC_16;
reg UC_17;
reg UC_18;
reg UC_19;
reg UC_8;
reg UC_9;
reg UC_10;
reg UC_11;
wire Y1C;
wire TCOMBVNODE16VOR1NF;
wire C3_Q1VZVOR1NF;
wire FMLVIINMUXVOR1NF;
wire TESTLVIINLATCHN;
wire UC_9VZ;
wire TESTLVIINMUXVOR1NF;
wire C2_QN2;
wire C3_Q3VZVOR1NF;
wire C3VIINHN;
wire R2C;
wire C1VCO2;
wire TCOMBVNODE6;
wire UC_17VD;
wire C3_Q3VUC_0;
wire TCOMB_GA2;
wire TCOMBVNODE3;
wire UC_19VUC_0;
wire R2CVAD1NF;
wire UC_8VZVOR1NF;
wire OLATCH_R2L;
wire UC_10VZVOR1NF;
wire UC_26;
wire UC_18VZVOR1NF;
wire OUTBUFVBUFY1VIIR1;
wire TCOMBVNODE18;
wire UC_18VZ;
wire TCOMBVNODE12;
wire C2VIINHN;
wire C3VCO2;
wire UC_17VUC_0;
wire C2VCO1;
wire UC_15;
wire TCOMB_RA2;
wire TESTLVIINLATCHVCDN;
wire OUTBUFVBUFR2VIIR1;
wire C3_Q2VZ;
wire UC_11VUC_0;
wire TCOMBVNODE19;
wire OUTBUFVBUFG2VIIR1;
wire UC_11VZ;
wire TCOMBVNCLR;
wire FMLVIINMUXVOR2NF;
wire UC_13;
wire FMLVIINMUXVND1;
wire TCOMBVNQB;
wire FMLVIINLATCHN;
wire CTST;
wire TCOMB_RA1VOR2NF;
wire C3_Q0VZVOR1NF;
wire FMLVIINLATCHVCDN;
wire C3_Q0VZ;
wire C3VCIIA;
wire C1_CO;
wire C3_Q2VD;
wire TCOMB_YA1;
wire TESTLVIINLATCHVCDAD;
wire UC_9VD;
wire UC_22;
wire UC_25;
wire TCOMBVNODE8VOR2NF;
wire TCOMB_GA2VAD1NF;
wire UC_19VD;
wire TCOMBVNFM;
wire TCOMBVNQC;
wire TCOMBVNODE16;
wire CLRBVIIR1;
wire C3VCO1;
wire UC_8VUC_0;
wire TESTBVIIR1;
wire TESTLVIINMUXVND1;
wire UC_10VUC_0;
wire TCOMBVNODE8VOR1NF;
wire UC_16VUC_0;
wire TCOMBVNODE8;
wire FMBVIIR1;
wire TESTLVIINMUX;
wire FMLVIINMUXVIIR1;
wire TCOMB_RA2VOR2NF;
wire UC_16VZVOR1NF;
wire Y1CVAD2NF;
wire TCOMB_FE_BF;
wire UC_16VZ;
wire C1VCO1;
wire C1VCIIA;
wire TCOMB_GA1;
wire R2CVAD2NF;
wire UC_20;
wire TESTLVIINMUXVOR2NF;
wire C2VCIIA;
wire UC_11VD;
wire CLRB;
wire TCOMB_RA1VOR1NF;
wire C3_Q2VUC_0;
wire TCOMBVNODE4VOR1NF;
wire C2_CO;
wire UC_23;
wire Y1CVAD1NF;
wire UC_21;
wire UC_27;
wire OLATCH_Y1L;
wire TCOMBVNODE4;
wire C3_Q2VZVOR1NF;
wire TCOMB_GA2VAD4NF;
wire TCOMB_GA2VAD3NF;
wire TCOMB_GA1VAD1NF;
wire UC_17VZVOR1NF;
wire FEN;
wire UC_18VD;
wire FMLVIINMUX;
wire C3_Q0VD;
wire TCOMB_YA2;
wire UC_19VZ;
wire TESTLVIINMUXVIIR1;
wire TCOMB_RA2VOR1NF;
wire C3_Q1VUC_0;
wire C2VCO2;
wire TCOMBVNFEL;
wire TCOMBVNQA;
wire OUTBUFVBUFR1VIIR1;
wire UC_9VUC_0;
wire FMLVIINLATCHVCDAD;
wire UC_10VZ;
wire UC_18VUC_0;
wire C3_Q0VUC_0;
wire C3_Q1VZ;
wire TCOMBVNODE15;
wire TESTB;
wire TCOMBVNODE4VOR2NF;
wire C1VCO0;
wire II84;
wire UC_17VZ;
wire UC_8VD;
wire C2VCO0;
wire C3_Q1VD;
wire TCOMB_GA2VAD2NF;
wire UC_14;
wire C3_Q3VD;
wire UC_12;
wire TCOMB_RA1;
wire TCOMB_FE;
wire OUTBUFVBUFY2VIIR1;
wire UC_10VD;
wire UC_24;
wire UC_19VZVOR1NF;
wire CO2;
wire C3_Q3VZ;
wire TCOMBVNQD;
wire TCOMBVNODE14;
wire UC_16VD;
wire UC_8VZ;
wire TCOMB_RA2VOR3NF;
wire OUTBUFVBUFG1VIIR1;
wire UC_9VZVOR1NF;
wire FMB;
wire C3VCO0;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    TESTL <= 0;
  else
    TESTL <= TESTLVIINLATCHVCDAD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    FML <= 0;
  else
    FML <= FMLVIINLATCHVCDAD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCH_Y2L <= 0;
  else
    OLATCH_Y2L <= TCOMB_YA2;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCHVUC_6 <= 0;
  else
    OLATCHVUC_6 <= Y1C;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCHVUC_5 <= 0;
  else
    OLATCHVUC_5 <= R2C;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCH_R1L <= 0;
  else
    OLATCH_R1L <= TCOMB_RA1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCH_G2L <= 0;
  else
    OLATCH_G2L <= TCOMB_GA2;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCH_G1L <= 0;
  else
    OLATCH_G1L <= TCOMB_GA1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    OLATCH_FEL <= 0;
  else
    OLATCH_FEL <= TCOMB_FE_BF;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    C3_Q3 <= 0;
  else
    C3_Q3 <= C3_Q3VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    C3_Q2 <= 0;
  else
    C3_Q2 <= C3_Q2VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    C3_Q1 <= 0;
  else
    C3_Q1 <= C3_Q1VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    C3_Q0 <= 0;
  else
    C3_Q0 <= C3_Q0VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_16 <= 0;
  else
    UC_16 <= UC_16VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_17 <= 0;
  else
    UC_17 <= UC_17VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_18 <= 0;
  else
    UC_18 <= UC_18VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_19 <= 0;
  else
    UC_19 <= UC_19VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_8 <= 0;
  else
    UC_8 <= UC_8VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_9 <= 0;
  else
    UC_9 <= UC_9VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_10 <= 0;
  else
    UC_10 <= UC_10VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    UC_11 <= 0;
  else
    UC_11 <= UC_11VD;
assign Y1C = ((~Y1CVAD2NF)&(~Y1CVAD1NF));
assign TCOMBVNODE16VOR1NF = (TCOMBVNODE18)|(FML)|(C3_Q3)|(TCOMBVNQC);
assign C3_Q1VZVOR1NF = (C3VCO0)|(C3_Q1);
assign GRN1 = ((~OUTBUFVBUFG1VIIR1));
assign FMLVIINMUXVOR1NF = (FMB)|(FML);
assign TESTLVIINLATCHN = ((~TESTL));
assign UC_9VZ = ((~UC_9VZVOR1NF))|((~UC_9VUC_0));
assign TESTLVIINMUXVOR1NF = (TESTB)|(TESTL);
assign C2_QN2 = ((~UC_17));
assign C3_Q3VZVOR1NF = (C3VCO2)|(C3_Q3);
assign C3VIINHN = ((~CO2));
assign R2C = ((~R2CVAD2NF)&(~R2CVAD1NF));
assign C1VCO2 = ((~UC_13)&(~UC_14)&(~UC_15));
assign TCOMBVNODE6 = ((~TCOMBVNFM))|((~TCOMBVNQD))|((~TCOMBVNQB))|((~C3_Q0));
assign UC_17VD = ((~CLRB)&(~UC_17VZ)&(~C2_CO));
assign C3_Q3VUC_0 = ((~C3VCO2))|((~C3_Q3));
assign TCOMB_GA2 = ((~TCOMB_GA2VAD4NF)&(~TCOMB_GA2VAD3NF)&(~TCOMB_GA2VAD2NF)&(~TCOMB_GA2VAD1NF));
assign TCOMBVNODE3 = ((~TCOMBVNODE4))|((~TCOMBVNQB))|((~TCOMBVNQA));
assign UC_19VUC_0 = ((~C2VIINHN))|((~UC_19));
assign R2CVAD1NF = (TCOMB_FE&TCOMB_RA2&C2_QN2);
assign UC_8VZVOR1NF = (C1VCO2)|(UC_8);
assign OLATCH_R2L = ((~OLATCHVUC_5));
assign UC_10VZVOR1NF = (C1VCO0)|(UC_10);
assign UC_26 = ((~C3_Q0));
assign UC_18VZVOR1NF = (C2VCO0)|(UC_18);
assign OUTBUFVBUFY1VIIR1 = ((~OLATCH_Y1L));
assign TCOMBVNODE12 = ((~TCOMBVNCLR))|((~TCOMBVNFEL))|((~TCOMBVNQC))|((~C3_Q1));
assign UC_18VZ = ((~UC_18VZVOR1NF))|((~UC_18VUC_0));
assign TCOMBVNODE18 = ((~TCOMBVNQB))|((~C3_Q0));
assign C2VIINHN = ((~CTST));
assign C3VCO2 = ((~CO2)&(~UC_24)&(~UC_25)&(~UC_26));
assign UC_17VUC_0 = ((~C2VCO1))|((~UC_17));
assign C2VCO1 = ((~CTST)&(~UC_21)&(~UC_22));
assign UC_15 = ((~UC_11));
assign TCOMB_RA2 = ((~TCOMB_RA2VOR3NF))|((~TCOMB_RA2VOR2NF))|((~TCOMB_RA2VOR1NF));
assign OUTBUFVBUFR2VIIR1 = ((~OLATCH_R2L));
assign TESTLVIINLATCHVCDN = ((~CLRB));
assign C3_Q2VZ = ((~C3_Q2VZVOR1NF))|((~C3_Q2VUC_0));
assign UC_11VUC_0 = ((~UC_11));
assign TCOMBVNODE19 = ((~CLRB)&(~TCOMBVNFEL));
assign OUTBUFVBUFG2VIIR1 = ((~OLATCH_G2L));
assign RED1 = ((~OUTBUFVBUFR1VIIR1));
assign TCOMBVNCLR = ((~CLRB));
assign UC_11VZ = ((~UC_11VUC_0));
assign FMLVIINMUXVOR2NF = (FMLVIINMUXVIIR1)|(FMLVIINLATCHN);
assign UC_13 = ((~UC_9));
assign FMLVIINMUXVND1 = ((~FMLVIINMUXVOR2NF))|((~FMLVIINMUXVOR1NF));
assign TCOMBVNQB = ((~C3_Q1));
assign FMLVIINLATCHN = ((~FML));
assign TCOMB_RA1VOR2NF = (C3_Q2)|(C3_Q3)|(OLATCH_FEL);
assign CTST = ((~C1_CO)&(~TESTL));
assign C3_Q0VZVOR1NF = (C3VIINHN)|(C3_Q0);
assign FMLVIINLATCHVCDN = ((~CLRB));
assign C3_Q0VZ = ((~C3_Q0VZVOR1NF))|((~C3_Q0VUC_0));
assign C3VCIIA = ((~C3_Q2)&(~C3_Q1)&(~C3_Q0));
assign C1_CO = ((~C1VCIIA)&(~UC_12));
assign C3_Q2VD = ((~CLRB)&(~C3_Q2VZ)&(~UC_27));
assign TCOMB_YA1 = ((~TCOMBVNODE16))|((~TCOMBVNODE3));
assign TESTLVIINLATCHVCDAD = (TESTLVIINLATCHVCDN&TESTLVIINMUX);
assign UC_9VD = ((~CLRB)&(~UC_9VZ)&(~C1_CO));
assign UC_25 = ((~C3_Q1));
assign UC_22 = ((~UC_19));
assign TCOMBVNODE8VOR2NF = (TCOMBVNQD)|(TCOMBVNFM);
assign TCOMB_GA2VAD1NF = (TCOMBVNQA&C3_Q3&TCOMBVNCLR);
assign UC_19VD = ((~CLRB)&(~UC_19VZ)&(~C2_CO));
assign TCOMBVNFM = ((~FML));
assign YLW1 = ((~OUTBUFVBUFY1VIIR1));
assign TCOMBVNQC = ((~C3_Q2));
assign TCOMBVNODE16 = ((~TCOMBVNODE19))|((~TCOMBVNODE16VOR1NF));
assign CLRBVIIR1 = ((~CLR));
assign C3VCO1 = ((~CO2)&(~UC_25)&(~UC_26));
assign UC_8VUC_0 = ((~C1VCO2))|((~UC_8));
assign TESTBVIIR1 = ((~TEST));
assign TESTLVIINMUXVND1 = ((~TESTLVIINMUXVOR2NF))|((~TESTLVIINMUXVOR1NF));
assign UC_10VUC_0 = ((~C1VCO0))|((~UC_10));
assign TCOMBVNODE8VOR1NF = (C3_Q0)|(C3_Q1)|(TCOMBVNFM);
assign TCOMBVNODE8 = ((~TCOMBVNCLR))|((~C3_Q2))|((~TCOMBVNODE8VOR2NF))|((~TCOMBVNODE8VOR1NF));
assign UC_16VUC_0 = ((~C2VCO2))|((~UC_16));
assign FMBVIIR1 = ((~FM));
assign TESTLVIINMUX = ((~TESTLVIINMUXVND1));
assign FMLVIINMUXVIIR1 = ((~FMB));
assign TCOMB_RA2VOR2NF = (TCOMBVNFEL)|(CLRB);
assign UC_16VZVOR1NF = (C2VCO2)|(UC_16);
assign Y1CVAD2NF = (FEN&TCOMB_YA1);
assign TCOMB_FE_BF = ((~II84));
assign UC_16VZ = ((~UC_16VZVOR1NF))|((~UC_16VUC_0));
assign C1VCO1 = ((~UC_14)&(~UC_15));
assign C1VCIIA = ((~UC_9)&(~UC_10)&(~UC_11));
assign TCOMB_GA1 = ((~TCOMBVNODE8)&(~TCOMB_GA1VAD1NF));
assign R2CVAD2NF = (FEN&TCOMB_RA2);
assign UC_20 = ((~UC_16));
assign C2VCIIA = ((~UC_17)&(~UC_18)&(~UC_19));
assign TESTLVIINMUXVOR2NF = (TESTLVIINMUXVIIR1)|(TESTLVIINLATCHN);
assign UC_11VD = ((~CLRB)&(~UC_11VZ)&(~C1_CO));
assign CLRB = ((~CLRBVIIR1));
assign TCOMB_RA1VOR1NF = (TCOMBVNQA)|(C3_Q1)|(C3_Q2)|(OLATCH_FEL);
assign C3_Q2VUC_0 = ((~C3VCO1))|((~C3_Q2));
assign TCOMBVNODE4VOR1NF = (TCOMBVNQC)|(C3_Q3)|(TCOMBVNFM)|(CLRB);
assign C2_CO = ((~C2VCIIA)&(~CTST)&(~UC_20));
assign UC_23 = ((~C3_Q3));
assign UC_21 = ((~UC_18));
assign Y1CVAD1NF = (TCOMB_FE&TCOMB_YA1&C2_QN2);
assign UC_27 = ((~C3VCIIA)&(~CO2)&(~UC_23));
assign OLATCH_Y1L = ((~OLATCHVUC_6));
assign TCOMBVNODE4 = ((~TCOMBVNODE4VOR2NF))|((~TCOMBVNODE4VOR1NF));
assign TCOMB_GA2VAD4NF = (OLATCH_FEL&TCOMBVNCLR);
assign C3_Q2VZVOR1NF = (C3VCO1)|(C3_Q2);
assign TCOMB_GA2VAD3NF = (C3_Q2&TCOMBVNCLR);
assign TCOMB_GA1VAD1NF = (TCOMBVNODE6&OLATCH_FEL);
assign UC_17VZVOR1NF = (C2VCO1)|(UC_17);
assign FEN = ((~TCOMB_FE));
assign UC_18VD = ((~CLRB)&(~UC_18VZ)&(~C2_CO));
assign FMLVIINMUX = ((~FMLVIINMUXVND1));
assign C3_Q0VD = ((~CLRB)&(~C3_Q0VZ)&(~UC_27));
assign TCOMB_YA2 = ((~TCOMBVNODE12)&(~TCOMBVNQA));
assign UC_19VZ = ((~UC_19VZVOR1NF))|((~UC_19VUC_0));
assign TESTLVIINMUXVIIR1 = ((~TESTB));
assign TCOMB_RA2VOR1NF = (C3_Q0)|(C3_Q1)|(TCOMBVNQD)|(CLRB);
assign C3_Q1VUC_0 = ((~C3VCO0))|((~C3_Q1));
assign TCOMBVNQA = ((~C3_Q0));
assign TCOMBVNFEL = ((~OLATCH_FEL));
assign C2VCO2 = ((~CTST)&(~C2_QN2)&(~UC_21)&(~UC_22));
assign OUTBUFVBUFR1VIIR1 = ((~OLATCH_R1L));
assign UC_9VUC_0 = ((~C1VCO1))|((~UC_9));
assign FMLVIINLATCHVCDAD = (FMLVIINLATCHVCDN&FMLVIINMUX);
assign UC_10VZ = ((~UC_10VZVOR1NF))|((~UC_10VUC_0));
assign UC_18VUC_0 = ((~C2VCO0))|((~UC_18));
assign C3_Q0VUC_0 = ((~C3VIINHN))|((~C3_Q0));
assign C3_Q1VZ = ((~C3_Q1VZVOR1NF))|((~C3_Q1VUC_0));
assign TCOMBVNODE15 = ((~CLRB)&(~TCOMBVNFM)&(~TCOMBVNQC)&(~C3_Q1));
assign TESTB = ((~TESTBVIIR1));
assign C1VCO0 = ((~UC_15));
assign TCOMBVNODE4VOR2NF = (C3_Q2)|(TCOMBVNQD)|(CLRB);
assign UC_17VZ = ((~UC_17VZVOR1NF))|((~UC_17VUC_0));
assign II84 = ((~TCOMB_FE));
assign UC_8VD = ((~CLRB)&(~UC_8VZ)&(~C1_CO));
assign YLW2 = ((~OUTBUFVBUFY2VIIR1));
assign C3_Q1VD = ((~CLRB)&(~C3_Q1VZ)&(~UC_27));
assign C2VCO0 = ((~CTST)&(~UC_22));
assign TCOMB_GA2VAD2NF = (C3_Q0&C3_Q1&TCOMBVNCLR);
assign UC_14 = ((~UC_10));
assign C3_Q3VD = ((~CLRB)&(~C3_Q3VZ)&(~UC_27));
assign UC_12 = ((~UC_8));
assign TCOMB_RA1 = ((~TCOMBVNCLR))|((~TCOMB_RA1VOR2NF))|((~TCOMB_RA1VOR1NF));
assign TCOMB_FE = ((~TCOMBVNODE16))|((~TCOMBVNODE14));
assign OUTBUFVBUFY2VIIR1 = ((~OLATCH_Y2L));
assign UC_10VD = ((~CLRB)&(~UC_10VZ)&(~C1_CO));
assign UC_24 = ((~C3_Q2));
assign CO2 = ((~C2_CO));
assign RED2 = ((~OUTBUFVBUFR2VIIR1));
assign UC_19VZVOR1NF = (C2VIINHN)|(UC_19);
assign GRN2 = ((~OUTBUFVBUFG2VIIR1));
assign C3_Q3VZ = ((~C3_Q3VZVOR1NF))|((~C3_Q3VUC_0));
assign TCOMBVNQD = ((~C3_Q3));
assign TCOMBVNODE14 = ((~TCOMBVNODE15))|((~TCOMBVNQA));
assign UC_8VZ = ((~UC_8VZVOR1NF))|((~UC_8VUC_0));
assign UC_16VD = ((~CLRB)&(~UC_16VZ)&(~C2_CO));
assign OUTBUFVBUFG1VIIR1 = ((~OLATCH_G1L));
assign TCOMB_RA2VOR3NF = (TCOMBVNQC)|(CLRB);
assign UC_9VZVOR1NF = (C1VCO1)|(UC_9);
assign FMB = ((~FMBVIIR1));
assign C3VCO0 = ((~CO2)&(~UC_26));
endmodule
