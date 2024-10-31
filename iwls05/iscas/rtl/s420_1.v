module s420_1_bench(
  blif_clk_net,
  blif_reset_net,
  P_0,
  C_16,
  C_15,
  C_14,
  C_13,
  C_12,
  C_11,
  C_10,
  C_9,
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
input C_16;
input C_15;
input C_14;
input C_13;
input C_12;
input C_11;
input C_10;
input C_9;
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
reg X_12;
reg X_11;
reg X_10;
reg X_9;
reg X_16;
reg X_15;
reg X_14;
reg X_13;
wire I363_1;
wire I603_2;
wire I603_1;
wire I555_1;
wire I405_3;
wire I262;
wire I88_1;
wire I406_2;
wire I357;
wire I203_4;
wire I246;
wire I355;
wire I422;
wire I88_3;
wire I506;
wire P_7;
wire I308;
wire I113;
wire P_10;
wire I50;
wire I497;
wire I408_3;
wire I69;
wire I598;
wire I105_4;
wire I73_2;
wire I413;
wire I440;
wire I470;
wire I583_2;
wire I466;
wire I407_3;
wire I559_2;
wire I301_3;
wire P_1;
wire I547;
wire I88_4;
wire I403_2;
wire I550;
wire I7_1;
wire I211;
wire I559_1;
wire I599;
wire I533_3;
wire I361;
wire I479;
wire I2_2;
wire I244;
wire I15;
wire P_2;
wire I467;
wire I626;
wire I503;
wire I186_4;
wire P_4;
wire I147;
wire I498;
wire I265;
wire P_16;
wire P_11;
wire I554;
wire I533_1;
wire I534_4;
wire I403_3;
wire I193_1;
wire I1_3;
wire I146;
wire I412;
wire I49;
wire I378_3;
wire I627_1;
wire I64;
wire I442;
wire I171_4;
wire I167;
wire I260;
wire I366_1;
wire I148;
wire I284_2;
wire I209;
wire I258;
wire I448;
wire I301_4;
wire I406_3;
wire I622;
wire I269_2;
wire I73_1;
wire I291_1;
wire P_6;
wire I496;
wire I359;
wire I105_1;
wire I95_1;
wire I1_2;
wire I13;
wire I284_4;
wire I439;
wire I166;
wire I168_1;
wire I301_2;
wire I105_3;
wire I186_3;
wire I631_2;
wire I7_4;
wire I88_2;
wire I551;
wire I602;
wire I404_3;
wire I73_3;
wire I607_2;
wire I112;
wire I203_2;
wire I269_4;
wire I309;
wire I575;
wire P_3;
wire I594;
wire I12;
wire I208;
wire I618;
wire P_9;
wire I307;
wire I160;
wire I627_2;
wire I555_2;
wire I378_2;
wire I171_1;
wire I408_2;
wire I495;
wire P_8;
wire I2_3;
wire I7_2;
wire I469;
wire I546;
wire I476;
wire I505;
wire I451;
wire I269_1;
wire I478;
wire I284_1;
wire I494;
wire I186_1;
wire I68;
wire I533_4;
wire I245;
wire I450;
wire I631_1;
wire I468;
wire I384_1;
wire I574;
wire I411;
wire I62;
wire I579_1;
wire I110;
wire I405_4;
wire I171_3;
wire I344;
wire I378_1;
wire P_12;
wire I164;
wire I534_5;
wire I186_2;
wire I583_1;
wire I414;
wire P_14;
wire I404_2;
wire I407_1;
wire I534_3;
wire I533_2;
wire I570;
wire I345;
wire I623;
wire I423;
wire I378_4;
wire I210;
wire I111;
wire I404_4;
wire I595;
wire I571;
wire I70_1;
wire I358;
wire I264;
wire I406_4;
wire I403_4;
wire I203_1;
wire I360;
wire I607_1;
wire I269_3;
wire I619;
wire I284_3;
wire I162;
wire I578;
wire I306;
wire I266_1;
wire I2_1;
wire P_13;
wire I420;
wire I105_2;
wire I66;
wire I1_4;
wire I171_2;
wire I387_1;
wire I579_2;
wire I438;
wire I7_3;
wire I203_3;
wire I410;
wire I14;
wire I407_2;
wire P_5;
wire I534_2;
wire I441;
wire P_15;
wire I73_4;
wire I301_1;
wire I405_2;
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
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_12 <= 0;
  else
    X_12 <= I208;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_11 <= 0;
  else
    X_11 <= I209;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_10 <= 0;
  else
    X_10 <= I210;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_9 <= 0;
  else
    X_9 <= I211;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_16 <= 0;
  else
    X_16 <= I306;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_15 <= 0;
  else
    X_15 <= I307;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_14 <= 0;
  else
    X_14 <= I308;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    X_13 <= 0;
  else
    X_13 <= I309;
assign I363_1 = (I361)|(X_16)|(I344);
assign I603_2 = (I594)|(I598);
assign I603_1 = (I595)|(I599);
assign I555_1 = (I547)|(I551);
assign I405_3 = ((~I469)&(~I476));
assign I262 = ((~X_9))|((~I1_3));
assign I88_1 = ((~X_1));
assign I406_2 = ((~X_7)&(~I448)&(~I442));
assign I203_4 = (X_10&I203_1);
assign I357 = ((~I358));
assign I246 = ((~X_11));
assign I355 = ((~I384_1))|((~X_16));
assign I88_3 = (X_1&I88_2);
assign I422 = ((~I411))|((~P_0));
assign I506 = ((~I505));
assign P_7 = (I407_1&I405_2);
assign I308 = ((~I301_3)&(~I301_4));
assign I113 = (I186_3)|(I186_4);
assign P_10 = (I408_2&I404_3);
assign I50 = ((~X_3));
assign I497 = ((~X_15));
assign I408_3 = (I408_2&I407_3);
assign I69 = ((~I64)&(~I48));
assign I105_4 = (X_6&I105_1);
assign I598 = ((~C_10));
assign I73_2 = ((~X_3));
assign I413 = ((~X_3));
assign I440 = ((~X_6));
assign I470 = ((~X_12));
assign I583_2 = (P_4&C_4);
assign I466 = ((~P_0));
assign I407_3 = ((~X_12)&(~X_10)&(~X_11)&(~X_9));
assign I559_2 = (P_0&C_0);
assign I301_3 = (I359&I301_2);
assign P_1 = ((~I410)&(~I411));
assign I88_4 = (P_0&I88_1);
assign I547 = ((~P_3));
assign I403_2 = ((~I438)&(~I439));
assign I550 = ((~C_2));
assign I211 = (I284_3)|(I284_4);
assign I7_1 = ((~I66));
assign I559_1 = (P_1&C_1);
assign I599 = ((~C_11));
assign I533_3 = ((~I603_1))|((~I603_2))|((~I602));
assign I361 = ((~I360))|((~X_14));
assign I479 = ((~I478));
assign I2_2 = ((~I162)&(~I147)&(~I148));
assign I244 = ((~I1_3));
assign I15 = (I88_3)|(I88_4);
assign P_2 = ((~I412)&(~I422));
assign I467 = ((~X_9));
assign I626 = ((~I631_1)&(~I631_2));
assign I503 = ((~I506))|((~I496));
assign I186_4 = (I1_2&I186_1);
assign P_4 = ((~X_3)&(~I420)&(~I414));
assign I147 = ((~X_8));
assign I498 = ((~X_16));
assign I265 = ((~I260)&(~I244));
assign P_16 = (I408_3&I406_4);
assign P_11 = (I408_2&I405_3);
assign I554 = ((~I559_1)&(~I559_2));
assign I533_1 = ((~I555_1))|((~I555_2))|((~I554));
assign I534_4 = (I534_3)|(I533_4);
assign I403_3 = ((~I466)&(~I467));
assign Z = (I534_4)|(I534_5);
assign I193_1 = (I162)|(I148)|(I146);
assign I1_3 = (I2_2&I1_2);
assign I146 = ((~I1_2));
assign I412 = ((~X_2));
assign I49 = ((~X_4));
assign I378_3 = (X_13&I378_2);
assign I627_1 = (I619)|(I623);
assign I64 = ((~X_1))|((~X_2));
assign I442 = ((~X_8));
assign I171_4 = (X_7&I171_1);
assign I167 = ((~I162)&(~I146));
assign I260 = ((~X_9))|((~X_10));
assign I366_1 = (I361)|(X_15);
assign I148 = ((~X_7));
assign I284_2 = ((~I1_3));
assign I209 = (I269_3)|(I269_4);
assign I258 = ((~I291_1))|((~X_12));
assign I448 = ((~I451))|((~I440));
assign I301_4 = (X_14&I301_1);
assign I406_3 = ((~X_11)&(~I476)&(~I470));
assign I622 = ((~C_14));
assign I269_2 = ((~X_11));
assign I73_1 = ((~I69));
assign I291_1 = (I260)|(I246)|(I244);
assign P_6 = (I407_1&I404_2);
assign I496 = ((~X_14));
assign I105_1 = ((~I164));
assign I359 = ((~X_13))|((~I1_4));
assign I95_1 = (I64)|(I50)|(I48);
assign I13 = (I73_3)|(I73_4);
assign I1_2 = (I2_1&P_0);
assign I284_4 = (I1_3&I284_1);
assign I168_1 = (I166)|(X_8)|(I148);
assign I439 = ((~X_5));
assign I166 = ((~I167));
assign I105_3 = (I164&I105_2);
assign I301_2 = ((~X_14));
assign I186_3 = (X_5&I186_2);
assign I631_2 = (P_12&C_12);
assign I7_4 = (X_2&I7_1);
assign I88_2 = ((~P_0));
assign I551 = ((~C_3));
assign I602 = ((~I607_1)&(~I607_2));
assign I404_3 = ((~I468)&(~I478));
assign I73_3 = (I69&I73_2);
assign I607_2 = (P_8&C_8);
assign I112 = ((~I105_3)&(~I105_4));
assign I203_2 = ((~X_10));
assign I269_4 = (X_11&I269_1);
assign I309 = (I378_3)|(I378_4);
assign I575 = ((~C_7));
assign P_3 = ((~I413)&(~I420));
assign I12 = ((~I70_1))|((~I62));
assign I208 = ((~I266_1))|((~I258));
assign I594 = ((~P_10));
assign I618 = ((~P_14));
assign I160 = ((~I193_1))|((~X_8));
assign P_9 = (I408_2&I403_3);
assign I307 = ((~I366_1))|((~I357));
assign I627_2 = (I618)|(I622);
assign I555_2 = (I546)|(I550);
assign I171_1 = ((~I167));
assign I378_2 = ((~I1_4));
assign I408_2 = (I407_1&I407_2);
assign I495 = ((~X_13));
assign P_8 = (I407_1&I406_2);
assign I2_3 = ((~I260)&(~I245)&(~I246));
assign I7_2 = ((~X_2));
assign I469 = ((~X_11));
assign I546 = ((~P_2));
assign I476 = ((~I479))|((~I468));
assign I505 = ((~I495))|((~P_0));
assign I451 = ((~I450));
assign I269_1 = ((~I265));
assign I478 = ((~I467))|((~P_0));
assign I284_1 = ((~X_9));
assign I186_1 = ((~X_5));
assign I494 = ((~P_0));
assign I68 = ((~I69));
assign I533_4 = ((~I627_1))|((~I627_2))|((~I626));
assign I245 = ((~X_12));
assign I450 = ((~I439))|((~P_0));
assign I631_1 = (P_13&C_13);
assign I468 = ((~X_10));
assign I384_1 = (I359)|(I345)|(I344);
assign I411 = ((~X_1));
assign I574 = ((~C_6));
assign I62 = ((~I95_1))|((~X_4));
assign I579_1 = (I571)|(I575);
assign I110 = ((~I168_1))|((~I160));
assign I405_4 = ((~I497)&(~I503));
assign I171_3 = (I167&I171_2);
assign I344 = ((~X_15));
assign I378_1 = ((~X_13));
assign P_12 = (I408_2&I406_3);
assign I164 = ((~X_5))|((~I1_2));
assign I534_5 = (P_16&C_16);
assign I186_2 = ((~I1_2));
assign I583_1 = (P_5&C_5);
assign I414 = ((~X_4));
assign I404_2 = ((~I440)&(~I450));
assign I407_1 = ((~X_4)&(~X_2)&(~X_3)&(~X_1));
assign P_14 = (I408_3&I404_4);
assign I534_3 = (I534_2)|(I533_3);
assign I533_2 = ((~I579_1))|((~I579_2))|((~I578));
assign I570 = ((~P_6));
assign I345 = ((~X_14));
assign I623 = ((~C_15));
assign I423 = ((~I422));
assign I378_4 = (I1_4&I378_1);
assign I111 = (I171_3)|(I171_4);
assign I210 = ((~I203_3)&(~I203_4));
assign I404_4 = ((~I496)&(~I505));
assign I571 = ((~P_7));
assign I595 = ((~P_11));
assign I70_1 = (I68)|(X_4)|(I50);
assign I358 = ((~I344)&(~I387_1));
assign I264 = ((~I265));
assign I406_4 = ((~X_15)&(~I503)&(~I498));
assign I403_4 = ((~I494)&(~I495));
assign I203_1 = ((~I262));
assign I360 = ((~I359));
assign I607_1 = (P_9&C_9);
assign I269_3 = (I265&I269_2);
assign I619 = ((~P_15));
assign I162 = ((~X_5))|((~X_6));
assign I284_3 = (X_9&I284_2);
assign I578 = ((~I583_1)&(~I583_2));
assign I266_1 = (I264)|(X_12)|(I246);
assign I2_1 = ((~I64)&(~I49)&(~I50));
assign I306 = ((~I363_1))|((~I355));
assign P_13 = (I408_3&I403_4);
assign I420 = ((~I423))|((~I412));
assign I105_2 = ((~X_6));
assign I66 = ((~X_1))|((~P_0));
assign I1_4 = (I2_3&I1_3);
assign I171_2 = ((~X_7));
assign I387_1 = (I360&X_14);
assign I579_2 = (I570)|(I574);
assign I438 = ((~P_0));
assign I7_3 = (I66&I7_2);
assign I203_3 = (I262&I203_2);
assign I14 = ((~I7_3)&(~I7_4));
assign I410 = ((~P_0));
assign I407_2 = ((~X_8)&(~X_6)&(~X_7)&(~X_5));
assign P_5 = (I407_1&I403_2);
assign I534_2 = (I533_1)|(I533_2);
assign I441 = ((~X_7));
assign P_15 = (I408_3&I405_4);
assign I73_4 = (X_3&I73_1);
assign I301_1 = ((~I359));
assign I405_2 = ((~I441)&(~I448));
assign I48 = ((~P_0));
endmodule
