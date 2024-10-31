module s298_bench(
  blif_clk_net,
  blif_reset_net,
  G0,
  G1,
  G2,
  G117,
  G132,
  G66,
  G118,
  G133,
  G67);
input blif_clk_net;
input blif_reset_net;
input G0;
input G1;
input G2;
output G117;
output G132;
output G66;
output G118;
output G133;
output G67;
reg G10;
reg G11;
reg G12;
reg G13;
reg G14;
reg G15;
reg G16;
reg G17;
reg G18;
reg G19;
reg G20;
reg G21;
reg G22;
reg G23;
wire G50;
wire G120;
wire G95;
wire II158;
wire G79;
wire G61;
wire G77;
wire G93;
wire G26;
wire G105;
wire G129;
wire G41;
wire G83;
wire G35;
wire G80;
wire G122;
wire II229;
wire G65;
wire G81;
wire G113;
wire G73;
wire G58;
wire G43;
wire II232;
wire G27;
wire G114;
wire G85;
wire G74;
wire G115;
wire G103;
wire G51;
wire II235;
wire G49;
wire G130;
wire G54;
wire G42;
wire G107;
wire G71;
wire G87;
wire G69;
wire G31;
wire G24;
wire G90;
wire G126;
wire G29;
wire G75;
wire II213;
wire G47;
wire G111;
wire II210;
wire G40;
wire II238;
wire G101;
wire G57;
wire G121;
wire G33;
wire G109;
wire II155;
wire G68;
wire G37;
wire G125;
wire G25;
wire G123;
wire G56;
wire G44;
wire G39;
wire G128;
wire G46;
wire G94;
wire G91;
wire G59;
wire G97;
wire G62;
wire G102;
wire G104;
wire G99;
wire G116;
wire G112;
wire G60;
wire G82;
wire G64;
wire G84;
wire II221;
wire G86;
wire G92;
wire G34;
wire G45;
wire G89;
wire G28;
wire G76;
wire G98;
wire G63;
wire G72;
wire G55;
wire G78;
wire G96;
wire G38;
wire G127;
wire G53;
wire G48;
wire G36;
wire G108;
wire G110;
wire G88;
wire G32;
wire G119;
wire G131;
wire G30;
wire G100;
wire G70;
wire G124;
wire G52;
wire G106;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G10 <= 0;
  else
    G10 <= G29;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G11 <= 0;
  else
    G11 <= G30;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G12 <= 0;
  else
    G12 <= G34;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G13 <= 0;
  else
    G13 <= G39;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G14 <= 0;
  else
    G14 <= G44;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G15 <= 0;
  else
    G15 <= G56;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G16 <= 0;
  else
    G16 <= G86;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G17 <= 0;
  else
    G17 <= G92;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G18 <= 0;
  else
    G18 <= G98;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G19 <= 0;
  else
    G19 <= G102;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G20 <= 0;
  else
    G20 <= G107;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G21 <= 0;
  else
    G21 <= G113;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G22 <= 0;
  else
    G22 <= G119;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G23 <= 0;
  else
    G23 <= G125;
assign G57 = (G59&G11&G60&G61);
assign G121 = ((~G22));
assign G50 = ((~G14));
assign G95 = (G96&G13);
assign G120 = ((~G124));
assign II158 = ((~G17));
assign G33 = (G38&G46);
assign G109 = ((~G71))|((~G72))|((~G73))|((~G14));
assign G79 = (G103)|(G14);
assign II155 = ((~G16));
assign G61 = ((~G14)&(~G55));
assign G68 = (G11)|(G12)|(G13)|(G96);
assign G37 = (G46&G45);
assign G66 = ((~II155));
assign G77 = (G112)|(G103)|(G96)|(G19);
assign G125 = ((~G128)&(~G129)&(~G130));
assign G25 = (G38)|(G11)|(G12);
assign G93 = ((~G17));
assign G123 = (G124&G22);
assign G105 = (G103&G108&G104);
assign G26 = (G28&G50);
assign G56 = ((~G57)&(~G58)&(~G130));
assign G129 = (G131&G23);
assign G39 = ((~G42)&(~G43));
assign G44 = ((~G48)&(~G49)&(~G53));
assign G128 = (G126&G127);
assign G46 = ((~G11));
assign G94 = (G93&G13);
assign G41 = ((~G12))|((~G11))|((~G10));
assign G91 = ((~G12));
assign G83 = (G11)|(G12)|(G13)|(G96);
assign G35 = (G10&G11&G12);
assign G59 = ((~G12));
assign G80 = (G11)|(G14);
assign G122 = (G120&G121);
assign G117 = ((~II210));
assign G97 = ((~G83))|((~G84))|((~G85))|((~G108));
assign G132 = ((~II235));
assign G62 = (G59&G11&G60&G61);
assign II229 = ((~G0));
assign G102 = ((~G105)&(~G106));
assign G104 = ((~G74)&(~G75));
assign G65 = ((~G59))|((~G54))|((~G22))|((~G61));
assign G99 = ((~G18));
assign G81 = (G12)|(G13);
assign G113 = ((~G115)&(~G116));
assign G73 = (G103)|(G20);
assign G58 = (G64&G65);
assign G116 = ((~G79))|((~G80))|((~G81))|((~G108));
assign G112 = ((~G62)&(~G63));
assign G60 = ((~G22));
assign G82 = ((~G11));
assign G43 = ((~G24))|((~G25))|((~G28));
assign G64 = ((~G15));
assign G84 = (G82)|(G91)|(G14);
assign II232 = ((~G1));
assign II221 = ((~G2));
assign G27 = (G51&G28);
assign G86 = ((~G88)&(~G89)&(~G90)&(~G112));
assign G114 = ((~G21));
assign G92 = ((~G94)&(~G95)&(~G97));
assign G85 = (G91)|(G96)|(G17);
assign G34 = ((~G35)&(~G36)&(~G37)&(~G130));
assign G115 = (G114&G14);
assign G74 = (G12&G14&G19);
assign G45 = ((~G12));
assign G89 = (G103&G96);
assign G103 = ((~G13));
assign G28 = ((~G130));
assign G51 = ((~G23));
assign G76 = ((~G10));
assign G72 = (G91)|(G20);
assign G63 = (G64&G65);
assign G98 = ((~G100)&(~G101));
assign G49 = (G50&G51&G52);
assign G55 = ((~G13));
assign II235 = ((~G20));
assign G133 = ((~II238));
assign G118 = ((~II213));
assign G78 = (G108)|(G76);
assign G130 = ((~II229));
assign G96 = ((~G14));
assign G54 = ((~G11));
assign G42 = (G40&G41);
assign G67 = ((~II158));
assign G38 = ((~G10));
assign G107 = ((~G110)&(~G111));
assign G71 = (G82)|(G12)|(G13);
assign G87 = ((~G16));
assign G127 = ((~G23));
assign G53 = ((~G26)&(~G27));
assign G48 = (G45&G46&G10&G47);
assign G36 = (G38&G45);
assign G69 = (G103)|(G18);
assign G31 = (G10&G45&G13);
assign G108 = ((~G112));
assign G24 = (G38)|(G46)|(G45)|(G40);
assign G110 = (G108&G109);
assign G90 = (G91&G103);
assign G88 = (G14&G87);
assign G126 = ((~G131));
assign G29 = ((~G10)&(~G130));
assign G32 = (G10&G11);
assign G75 = (G82&G91&G14);
assign II213 = ((~G19));
assign G119 = ((~G122)&(~G123)&(~G130));
assign G131 = ((~II232));
assign G111 = (G10&G112);
assign G47 = ((~G50)&(~G40));
assign G30 = ((~G31)&(~G32)&(~G33)&(~G130));
assign II210 = ((~G18));
assign G100 = (G99&G14&G12);
assign G70 = (G103)|(G14);
assign G40 = ((~G13));
assign II238 = ((~G21));
assign G52 = ((~G13))|((~G45))|((~G46))|((~G10));
assign G124 = ((~II221));
assign G106 = ((~G77))|((~G78));
assign G101 = ((~G68))|((~G69))|((~G70))|((~G108));
endmodule
