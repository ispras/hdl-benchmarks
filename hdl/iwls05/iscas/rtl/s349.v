module s349_bench(
  blif_clk_net,
  blif_reset_net,
  START,
  B0,
  B1,
  B2,
  B3,
  A0,
  A1,
  A2,
  A3,
  CNTVCO2,
  CNTVCON2,
  READY,
  P0,
  P1,
  P2,
  P3,
  P4,
  P5,
  P6,
  P7);
input blif_clk_net;
input blif_reset_net;
input START;
input B0;
input B1;
input B2;
input B3;
input A0;
input A1;
input A2;
input A3;
output CNTVCO2;
output CNTVCON2;
output READY;
output P0;
output P1;
output P2;
output P3;
output P4;
output P5;
output P6;
output P7;
reg CT2;
reg CT1;
reg CT0;
reg ACVQN3;
reg ACVQN2;
reg ACVQN1;
reg ACVQN0;
reg MRVQN3;
reg MRVQN2;
reg MRVQN1;
reg MRVQN0;
reg AX3;
reg AX2;
reg AX1;
reg AX0;
wire ADDVG2VSN;
wire BMVG4VS0P;
wire SMVG4VX;
wire S0;
wire SMVG3VG1VAD1NF;
wire AMVG3VG1VAD2NF;
wire AMVG5VG1VAD2NF;
wire ADDVC3;
wire ADDVG2VCNVAD1NF;
wire MRVG2VD;
wire ACVG4VD1;
wire IINIIT;
wire BMVG4VX;
wire ADDVG4VCNVAD3NF;
wire ADDVG4VSN;
wire CNTVG2VG2VOR1NF;
wire ADDVG4VCNVOR1NF;
wire BMVG2VG1VAD2NF;
wire SMVG3VX;
wire AMVG4VS0P;
wire AMVG4VG1VAD1NF;
wire AMVG2VX;
wire SMVG5VG1VAD2NF;
wire AD3N;
wire MRVG3VD;
wire CNTVG1VG2VOR1NF;
wire AD0N;
wire CNTVG1VD;
wire AMVG2VG1VAD1NF;
wire ADDVC1;
wire CNTVCON1;
wire MRVG1VDVAD2NF;
wire BMVG3VX;
wire SMVG5VX;
wire ADDVG2VCNVAD4NF;
wire ADDVG4VCNVAD1NF;
wire ADDVG1VPVOR1NF;
wire ADDVG2VCNVOR1NF;
wire AMVG2VS0P;
wire SMVG5VS0P;
wire AM2;
wire SM1;
wire SM0;
wire CNTVG2VZ1;
wire BMVG5VG1VAD2NF;
wire BM0;
wire SMVG2VS0P;
wire BMVG3VS0P;
wire AMVG5VG1VAD1NF;
wire AMVG2VG1VAD2NF;
wire SMVG4VG1VAD2NF;
wire ADDVG1VP;
wire ADDVG3VCNVAD3NF;
wire AMVG4VX;
wire AMVG5VS0P;
wire MRVG3VDVAD2NF;
wire MRVSHLDN;
wire AD1;
wire ADDVG3VCNVAD2NF;
wire AMVG3VX;
wire AMVG3VG1VAD1NF;
wire AD3;
wire BMVG2VS0P;
wire SM2;
wire BM3;
wire SMVG2VX;
wire ADDVG2VCNVAD3NF;
wire MRVG4VDVAD1NF;
wire ACVG2VD1;
wire BMVG4VG1VAD1NF;
wire SMVG2VG1VAD1NF;
wire BMVG5VX;
wire ADDVG4VCNVOR2NF;
wire SMVS0N;
wire CNTVG3VD;
wire CNTVG3VZ;
wire S1;
wire ADDVG3VCNVAD1NF;
wire AD2N;
wire CNTVG2VZ;
wire BMVG2VX;
wire AMVG5VX;
wire ADDVC2;
wire ADDVG1VCN;
wire AD2;
wire AM3;
wire CNTVG3VZ1;
wire AM0;
wire CNTVG1VZ1;
wire CNTVG2VD1;
wire ACVPCN;
wire SMVG5VG1VAD1NF;
wire S3;
wire ADDVG3VCN;
wire AD1N;
wire CNTVG3VG2VOR1NF;
wire CNTVG2VD;
wire SMVG3VS0P;
wire MRVG2VDVAD1NF;
wire CNTVG3VD1;
wire AMVS0N;
wire CNTVG1VQN;
wire CO;
wire CNTVCO0;
wire BMVG3VG1VAD2NF;
wire ADDVG3VCNVOR1NF;
wire BMVG4VG1VAD2NF;
wire SMVG2VG1VAD2NF;
wire MRVG4VDVAD2NF;
wire ADDVG3VCNVAD4NF;
wire ADDVG4VCNVAD2NF;
wire BMVG5VG1VAD1NF;
wire SMVG3VG1VAD2NF;
wire ADDVG4VCN;
wire BMVG3VG1VAD1NF;
wire AD0;
wire CNTVCON0;
wire CNTVG1VD1;
wire ADDVG3VSN;
wire MRVG2VDVAD2NF;
wire MRVG3VDVAD1NF;
wire CNTVG2VQN;
wire CNTVCO1;
wire CNTVG1VZ;
wire SMVG4VG1VAD1NF;
wire BM1;
wire ADDVG3VCNVOR2NF;
wire READYN;
wire SMVG4VS0P;
wire ADDVG2VCNVOR2NF;
wire ACVG1VD1;
wire CNTVG3VQN;
wire ADDVG2VCN;
wire BMVS0N;
wire MRVG4VD;
wire S2;
wire AMVG4VG1VAD2NF;
wire MRVG1VD;
wire AMVG3VS0P;
wire ADDVG4VCNVAD4NF;
wire ADDVG2VCNVAD2NF;
wire SM3;
wire BMVG5VS0P;
wire MRVG1VDVAD1NF;
wire CT1N;
wire AM1;
wire ACVG3VD1;
wire ADSH;
wire BM2;
wire BMVG2VG1VAD1NF;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    CT2 <= 0;
  else
    CT2 <= CNTVG3VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    CT1 <= 0;
  else
    CT1 <= CNTVG2VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    CT0 <= 0;
  else
    CT0 <= CNTVG1VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    ACVQN3 <= 0;
  else
    ACVQN3 <= ACVG4VD1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    ACVQN2 <= 0;
  else
    ACVQN2 <= ACVG3VD1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    ACVQN1 <= 0;
  else
    ACVQN1 <= ACVG2VD1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    ACVQN0 <= 0;
  else
    ACVQN0 <= ACVG1VD1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    MRVQN3 <= 0;
  else
    MRVQN3 <= MRVG4VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    MRVQN2 <= 0;
  else
    MRVQN2 <= MRVG3VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    MRVQN1 <= 0;
  else
    MRVQN1 <= MRVG2VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    MRVQN0 <= 0;
  else
    MRVQN0 <= MRVG1VD;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    AX3 <= 0;
  else
    AX3 <= AM3;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    AX2 <= 0;
  else
    AX2 <= AM2;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    AX1 <= 0;
  else
    AX1 <= AM1;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    AX0 <= 0;
  else
    AX0 <= AM0;
assign ADDVG2VSN = ((~ADDVG2VCNVAD4NF)&(~ADDVG2VCNVAD3NF));
assign BMVG4VS0P = ((~BMVS0N));
assign SMVG4VX = ((~SMVG4VG1VAD2NF)&(~SMVG4VG1VAD1NF));
assign S0 = ((~ADDVG1VP));
assign SMVG3VG1VAD1NF = (SMVS0N&P5);
assign AMVG3VG1VAD2NF = (AMVG3VS0P&A1);
assign AMVG5VG1VAD2NF = (AMVG5VS0P&A3);
assign ADDVC3 = ((~ADDVG3VCN));
assign P3 = ((~MRVQN3));
assign ADDVG2VCNVAD1NF = (AD1&P5);
assign MRVG2VD = ((~MRVG2VDVAD2NF)&(~MRVG2VDVAD1NF));
assign ACVG4VD1 = ((~ACVPCN))|((~SM3));
assign IINIIT = ((~CT0)&(~CT1)&(~CT2));
assign BMVG4VX = ((~BMVG4VG1VAD2NF)&(~BMVG4VG1VAD1NF));
assign P5 = ((~ACVQN1));
assign ADDVG4VCNVAD3NF = (ADDVG4VCNVOR2NF&ADDVG4VCN);
assign ADDVG4VSN = ((~ADDVG4VCNVAD4NF)&(~ADDVG4VCNVAD3NF));
assign CNTVG2VG2VOR1NF = (CT1)|(CNTVG2VD1);
assign BMVG2VG1VAD2NF = (BMVG2VS0P&B0);
assign ADDVG4VCNVOR1NF = (AD3)|(P7);
assign SMVG3VX = ((~SMVG3VG1VAD2NF)&(~SMVG3VG1VAD1NF));
assign AMVG4VS0P = ((~AMVS0N));
assign AMVG4VG1VAD1NF = (AMVS0N&AX2);
assign AMVG2VX = ((~AMVG2VG1VAD2NF)&(~AMVG2VG1VAD1NF));
assign P1 = ((~MRVQN1));
assign SMVG5VG1VAD2NF = (SMVG5VS0P&CO);
assign AD3N = ((~P0))|((~AX3));
assign MRVG3VD = ((~MRVG3VDVAD2NF)&(~MRVG3VDVAD1NF));
assign CNTVG1VG2VOR1NF = (CT0)|(CNTVG1VD1);
assign AD0N = ((~P0))|((~AX0));
assign CNTVG1VD = ((~CNTVG1VZ)&(~START));
assign CNTVCON1 = ((~CT1))|((~CNTVCO0));
assign AMVG2VG1VAD1NF = (AMVS0N&AX0);
assign ADDVC1 = ((~ADDVG1VCN));
assign MRVG1VDVAD2NF = (MRVSHLDN&BM0);
assign BMVG3VX = ((~BMVG3VG1VAD2NF)&(~BMVG3VG1VAD1NF));
assign SMVG5VX = ((~SMVG5VG1VAD2NF)&(~SMVG5VG1VAD1NF));
assign ADDVG2VCNVAD4NF = (ADDVC1&AD1&P5);
assign ADDVG4VCNVAD1NF = (AD3&P7);
assign ADDVG1VPVOR1NF = (AD0)|(P4);
assign ADDVG2VCNVOR1NF = (AD1)|(P5);
assign AMVG2VS0P = ((~AMVS0N));
assign SMVG5VS0P = ((~SMVS0N));
assign AM2 = ((~AMVG4VX));
assign SM0 = ((~SMVG2VX));
assign SM1 = ((~SMVG3VX));
assign CNTVG2VZ1 = ((~CT1))|((~CNTVG2VD1));
assign BMVG5VG1VAD2NF = (BMVG5VS0P&B3);
assign BM0 = ((~BMVG2VX));
assign SMVG2VS0P = ((~SMVS0N));
assign BMVG3VS0P = ((~BMVS0N));
assign AMVG5VG1VAD1NF = (AMVS0N&AX3);
assign AMVG2VG1VAD2NF = (AMVG2VS0P&A0);
assign SMVG4VG1VAD2NF = (SMVG4VS0P&S3);
assign ADDVG1VP = ((~ADDVG1VPVOR1NF))|((~ADDVG1VCN));
assign ADDVG3VCNVAD3NF = (ADDVG3VCNVOR2NF&ADDVG3VCN);
assign AMVG4VX = ((~AMVG4VG1VAD2NF)&(~AMVG4VG1VAD1NF));
assign AMVG5VS0P = ((~AMVS0N));
assign MRVG3VDVAD2NF = (MRVSHLDN&BM2);
assign MRVSHLDN = ((~ADSH));
assign ADDVG3VCNVAD2NF = (ADDVC2&ADDVG3VCNVOR1NF);
assign AMVG3VX = ((~AMVG3VG1VAD2NF)&(~AMVG3VG1VAD1NF));
assign AD1 = ((~AD1N));
assign AMVG3VG1VAD1NF = (AMVS0N&AX1);
assign AD3 = ((~AD3N));
assign BMVG2VS0P = ((~BMVS0N));
assign SM2 = ((~SMVG4VX));
assign MRVG4VDVAD1NF = (ADSH&S0);
assign ADDVG2VCNVAD3NF = (ADDVG2VCNVOR2NF&ADDVG2VCN);
assign BM3 = ((~BMVG5VX));
assign SMVG2VX = ((~SMVG2VG1VAD2NF)&(~SMVG2VG1VAD1NF));
assign ACVG2VD1 = ((~ACVPCN))|((~SM1));
assign BMVG4VG1VAD1NF = (BMVS0N&P2);
assign SMVG2VG1VAD1NF = (SMVS0N&P4);
assign BMVG5VX = ((~BMVG5VG1VAD2NF)&(~BMVG5VG1VAD1NF));
assign ADDVG4VCNVOR2NF = (ADDVC3)|(AD3)|(P7);
assign SMVS0N = ((~ADSH));
assign CNTVG3VZ = ((~CNTVG3VG2VOR1NF))|((~CNTVG3VZ1));
assign CNTVG3VD = ((~CNTVG3VZ)&(~START));
assign S1 = ((~ADDVG2VSN));
assign P2 = ((~MRVQN2));
assign AD2N = ((~P0))|((~AX2));
assign ADDVG3VCNVAD1NF = (AD2&P6);
assign CNTVG2VZ = ((~CNTVG2VG2VOR1NF))|((~CNTVG2VZ1));
assign BMVG2VX = ((~BMVG2VG1VAD2NF)&(~BMVG2VG1VAD1NF));
assign AMVG5VX = ((~AMVG5VG1VAD2NF)&(~AMVG5VG1VAD1NF));
assign ADDVC2 = ((~ADDVG2VCN));
assign ADDVG1VCN = ((~AD0))|((~P4));
assign AD2 = ((~AD2N));
assign AM3 = ((~AMVG5VX));
assign P7 = ((~ACVQN3));
assign CNTVG3VZ1 = ((~CT2))|((~CNTVG3VD1));
assign AM0 = ((~AMVG2VX));
assign CNTVG1VZ1 = ((~CT0))|((~CNTVG1VD1));
assign CNTVG2VD1 = ((~READY)&(~CNTVCON0));
assign ACVPCN = ((~START));
assign SMVG5VG1VAD1NF = (SMVS0N&P7);
assign P4 = ((~ACVQN0));
assign S3 = ((~ADDVG4VSN));
assign ADDVG3VCN = ((~ADDVG3VCNVAD2NF)&(~ADDVG3VCNVAD1NF));
assign AD1N = ((~P0))|((~AX1));
assign P0 = ((~MRVQN0));
assign CNTVG3VG2VOR1NF = (CT2)|(CNTVG3VD1);
assign CNTVG2VD = ((~CNTVG2VZ)&(~START));
assign P6 = ((~ACVQN2));
assign SMVG3VS0P = ((~SMVS0N));
assign MRVG2VDVAD1NF = (ADSH&P2);
assign CNTVG3VD1 = ((~READY)&(~CNTVCON1));
assign CNTVG1VQN = ((~CT0));
assign CNTVCON2 = ((~CT2))|((~CNTVCO1));
assign CO = ((~ADDVG4VCN));
assign AMVS0N = ((~IINIIT));
assign CNTVCO0 = ((~CNTVG1VQN));
assign BMVG3VG1VAD2NF = (BMVG3VS0P&B1);
assign ADDVG3VCNVOR1NF = (AD2)|(P6);
assign BMVG4VG1VAD2NF = (BMVG4VS0P&B2);
assign CNTVCO2 = ((~CNTVG3VQN)&(~CNTVCON1));
assign SMVG2VG1VAD2NF = (SMVG2VS0P&S1);
assign MRVG4VDVAD2NF = (MRVSHLDN&BM3);
assign ADDVG3VCNVAD4NF = (ADDVC2&AD2&P6);
assign ADDVG4VCNVAD2NF = (ADDVC3&ADDVG4VCNVOR1NF);
assign BMVG5VG1VAD1NF = (BMVS0N&P3);
assign ADDVG4VCN = ((~ADDVG4VCNVAD2NF)&(~ADDVG4VCNVAD1NF));
assign SMVG3VG1VAD2NF = (SMVG3VS0P&S2);
assign BMVG3VG1VAD1NF = (BMVS0N&P1);
assign AD0 = ((~AD0N));
assign CNTVCON0 = ((~CT0));
assign ADDVG3VSN = ((~ADDVG3VCNVAD4NF)&(~ADDVG3VCNVAD3NF));
assign CNTVG1VD1 = ((~READY));
assign MRVG2VDVAD2NF = (MRVSHLDN&BM1);
assign MRVG3VDVAD1NF = (ADSH&P3);
assign CNTVG2VQN = ((~CT1));
assign CNTVCO1 = ((~CNTVG2VQN)&(~CNTVCON0));
assign CNTVG1VZ = ((~CNTVG1VG2VOR1NF))|((~CNTVG1VZ1));
assign SMVG4VG1VAD1NF = (SMVS0N&P6);
assign BM1 = ((~BMVG3VX));
assign ADDVG3VCNVOR2NF = (ADDVC2)|(AD2)|(P6);
assign READYN = ((~CT0))|((~CT1N))|((~CT2));
assign SMVG4VS0P = ((~SMVS0N));
assign ADDVG2VCNVOR2NF = (ADDVC1)|(AD1)|(P5);
assign ACVG1VD1 = ((~ACVPCN))|((~SM0));
assign ADDVG2VCN = ((~ADDVG2VCNVAD2NF)&(~ADDVG2VCNVAD1NF));
assign CNTVG3VQN = ((~CT2));
assign S2 = ((~ADDVG3VSN));
assign MRVG4VD = ((~MRVG4VDVAD2NF)&(~MRVG4VDVAD1NF));
assign BMVS0N = ((~READYN));
assign AMVG4VG1VAD2NF = (AMVG4VS0P&A2);
assign MRVG1VD = ((~MRVG1VDVAD2NF)&(~MRVG1VDVAD1NF));
assign AMVG3VS0P = ((~AMVS0N));
assign ADDVG4VCNVAD4NF = (ADDVC3&AD3&P7);
assign ADDVG2VCNVAD2NF = (ADDVC1&ADDVG2VCNVOR1NF);
assign SM3 = ((~SMVG5VX));
assign MRVG1VDVAD1NF = (ADSH&P1);
assign CT1N = ((~CT1));
assign BMVG5VS0P = ((~BMVS0N));
assign ACVG3VD1 = ((~ACVPCN))|((~SM2));
assign AM1 = ((~AMVG3VX));
assign READY = ((~READYN));
assign ADSH = ((~READY)&(~IINIIT));
assign BM2 = ((~BMVG4VX));
assign BMVG2VG1VAD1NF = (BMVS0N&P0);
endmodule
