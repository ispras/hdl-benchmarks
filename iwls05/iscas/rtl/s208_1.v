module s208_1_bench(
  blif_clk_net,
  blif_reset_net,
  P_0,
  C_8,
  C_7,
  C_6,
  C_5,
  C_4,
  C_3,
  C_2,
  C_1,
  C_0,
  Z);
input blif_clk_net;
input blif_reset_net;
input P_0;
input C_8;
input C_7;
input C_6;
input C_5;
input C_4;
input C_3;
input C_2;
input C_1;
input C_0;
output Z;
reg X_4;
reg X_3;
reg X_2;
reg X_1;
reg X_8;
reg X_7;
reg X_6;
reg X_5;
wire P_3;
wire I88_1;
wire I12;
wire I307;
wire I170_1;
wire I88_3;
wire I213;
wire P_7;
wire I191_1;
wire P_8;
wire I113;
wire I315_2;
wire I214;
wire I7_2;
wire I50;
wire I69;
wire I311;
wire I105_4;
wire I295_1;
wire I73_2;
wire I269_1;
wire I149;
wire I319_2;
wire I225;
wire I224;
wire I182_4;
wire I68;
wire P_1;
wire I205_2;
wire I242;
wire I88_4;
wire I251;
wire I7_1;
wire I314;
wire I319_1;
wire I206_2;
wire I222;
wire I244;
wire I15;
wire P_2;
wire I62;
wire I243;
wire I215;
wire I110;
wire I287;
wire I290;
wire I310;
wire I286;
wire I241;
wire I182_3;
wire P_4;
wire I164;
wire I283;
wire I240;
wire I188_1;
wire I163;
wire I291_2;
wire I209_1;
wire I182_2;
wire I282;
wire I49;
wire I249;
wire I111;
wire I64;
wire I70_1;
wire I252;
wire I208_2;
wire I148;
wire I167_1;
wire I270_3;
wire I207_2;
wire I270_2;
wire I269_2;
wire I295_2;
wire I212;
wire I162;
wire I73_1;
wire I291_1;
wire I306;
wire P_6;
wire I2_1;
wire I105_1;
wire I105_2;
wire I165;
wire I95_1;
wire I13;
wire I1_2;
wire I66;
wire I105_3;
wire I7_4;
wire I315_1;
wire I7_3;
wire I88_2;
wire I159;
wire I14;
wire P_5;
wire I182_1;
wire I73_3;
wire I112;
wire I73_4;
wire I216;
wire I161;
wire I48;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_4 <= 0;
  else
    X_4 <= I12;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_3 <= 0;
  else
    X_3 <= I13;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_2 <= 0;
  else
    X_2 <= I14;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_1 <= 0;
  else
    X_1 <= I15;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_8 <= 0;
  else
    X_8 <= I110;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_7 <= 0;
  else
    X_7 <= I111;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_6 <= 0;
  else
    X_6 <= I112;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_5 <= 0;
  else
    X_5 <= I113;
assign P_3 = ((~I215)&(~I222));
assign I88_1 = ((~X_1));
assign I12 = ((~I70_1))|((~I62));
assign I170_1 = (I165)|(X_7);
assign I307 = ((~P_7));
assign I88_3 = (X_1&I88_2);
assign I213 = ((~X_1));
assign I191_1 = (I164&X_6);
assign P_7 = (I209_1&I207_2);
assign P_8 = (I209_1&I208_2);
assign I113 = (I182_3)|(I182_4);
assign I315_2 = (I306)|(I310);
assign I214 = ((~X_2));
assign I7_2 = ((~X_2));
assign I50 = ((~X_3));
assign I69 = ((~I64)&(~I48));
assign I105_4 = (X_6&I105_1);
assign I311 = ((~C_7));
assign I295_1 = (P_1&C_1);
assign I73_2 = ((~X_3));
assign I269_1 = ((~I291_1))|((~I291_2))|((~I290));
assign I149 = ((~X_6));
assign I319_2 = (P_4&C_4);
assign I225 = ((~I224));
assign I224 = ((~I213))|((~P_0));
assign I182_4 = (I1_2&I182_1);
assign I68 = ((~I69));
assign P_1 = ((~I212)&(~I213));
assign I205_2 = ((~I240)&(~I241));
assign I242 = ((~X_6));
assign I88_4 = (P_0&I88_1);
assign I251 = ((~I241))|((~P_0));
assign I7_1 = ((~I66));
assign I314 = ((~I319_1)&(~I319_2));
assign I319_1 = (P_5&C_5);
assign I222 = ((~I225))|((~I214));
assign I206_2 = ((~I242)&(~I251));
assign I244 = ((~X_8));
assign I15 = (I88_3)|(I88_4);
assign I62 = ((~I95_1))|((~X_4));
assign P_2 = ((~I214)&(~I224));
assign I243 = ((~X_7));
assign I215 = ((~X_3));
assign I110 = ((~I167_1))|((~I159));
assign I287 = ((~C_3));
assign I290 = ((~I295_1)&(~I295_2));
assign I310 = ((~C_6));
assign I286 = ((~C_2));
assign I182_3 = (X_5&I182_2);
assign I241 = ((~X_5));
assign P_4 = ((~X_3)&(~I222)&(~I216));
assign I164 = ((~I163));
assign I240 = ((~P_0));
assign I283 = ((~P_3));
assign I188_1 = (I163)|(I149)|(I148);
assign I163 = ((~X_5))|((~I1_2));
assign I291_2 = (I282)|(I286);
assign I209_1 = ((~X_4)&(~X_2)&(~X_3)&(~X_1));
assign Z = (I270_2)|(I270_3);
assign I182_2 = ((~I1_2));
assign I282 = ((~P_2));
assign I49 = ((~X_4));
assign I249 = ((~I252))|((~I242));
assign I111 = ((~I170_1))|((~I161));
assign I64 = ((~X_1))|((~X_2));
assign I70_1 = (I68)|(X_4)|(I50);
assign I252 = ((~I251));
assign I208_2 = ((~X_7)&(~I249)&(~I244));
assign I148 = ((~X_7));
assign I167_1 = (I165)|(X_8)|(I148);
assign I270_3 = (P_8&C_8);
assign I207_2 = ((~I243)&(~I249));
assign I270_2 = (I269_1)|(I269_2);
assign I269_2 = ((~I315_1))|((~I315_2))|((~I314));
assign I295_2 = (P_0&C_0);
assign I212 = ((~P_0));
assign I162 = ((~I148)&(~I191_1));
assign I73_1 = ((~I69));
assign I291_1 = (I283)|(I287);
assign I2_1 = ((~I64)&(~I49)&(~I50));
assign P_6 = (I209_1&I206_2);
assign I306 = ((~P_6));
assign I105_2 = ((~X_6));
assign I105_1 = ((~I163));
assign I165 = ((~I164))|((~X_6));
assign I95_1 = (I64)|(I50)|(I48);
assign I1_2 = (I2_1&P_0);
assign I13 = (I73_3)|(I73_4);
assign I66 = ((~X_1))|((~P_0));
assign I105_3 = (I163&I105_2);
assign I7_4 = (X_2&I7_1);
assign I315_1 = (I307)|(I311);
assign I88_2 = ((~P_0));
assign I7_3 = (I66&I7_2);
assign I159 = ((~I188_1))|((~X_8));
assign I14 = ((~I7_3)&(~I7_4));
assign P_5 = (I209_1&I205_2);
assign I182_1 = ((~X_5));
assign I73_3 = (I69&I73_2);
assign I112 = ((~I105_3)&(~I105_4));
assign I73_4 = (X_3&I73_1);
assign I161 = ((~I162));
assign I48 = ((~P_0));
assign I216 = ((~X_4));
endmodule
