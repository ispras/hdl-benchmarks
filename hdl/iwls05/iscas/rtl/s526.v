module s526_bench(
  blif_clk_net,
  blif_reset_net,
  G0,
  G1,
  G2,
  G198,
  G213,
  G147,
  G199,
  G214,
  G148);
input blif_clk_net;
input blif_reset_net;
input G0;
input G1;
input G2;
output G198;
output G213;
output G147;
output G199;
output G214;
output G148;
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
reg G24;
reg G25;
reg G26;
reg G27;
reg G28;
reg G29;
reg G30;
wire G178;
wire G50;
wire G120;
wire G95;
wire II368;
wire G167;
wire G196;
wire II351;
wire G79;
wire G138;
wire G61;
wire G207;
wire G140;
wire G161;
wire G209;
wire G200;
wire G77;
wire G93;
wire G191;
wire G105;
wire G137;
wire G165;
wire G144;
wire G129;
wire G193;
wire G174;
wire G134;
wire G41;
wire G146;
wire G83;
wire G160;
wire G35;
wire G122;
wire G80;
wire G117;
wire G184;
wire G151;
wire G132;
wire G158;
wire G65;
wire G113;
wire G81;
wire G73;
wire G58;
wire G176;
wire G163;
wire G210;
wire G43;
wire G153;
wire G189;
wire G114;
wire G85;
wire II285;
wire G74;
wire G115;
wire G175;
wire G103;
wire II343;
wire G172;
wire G51;
wire G187;
wire G49;
wire G118;
wire G157;
wire G130;
wire G177;
wire G208;
wire II362;
wire G54;
wire G211;
wire G42;
wire G67;
wire G107;
wire G71;
wire G87;
wire G31;
wire G69;
wire G90;
wire G126;
wire G202;
wire G169;
wire G75;
wire G47;
wire G111;
wire G142;
wire G171;
wire G40;
wire G206;
wire G101;
wire G57;
wire G121;
wire G166;
wire G159;
wire G149;
wire G33;
wire G139;
wire G109;
wire G162;
wire G197;
wire G164;
wire G68;
wire G37;
wire G145;
wire G66;
wire G136;
wire G185;
wire G125;
wire G192;
wire G195;
wire G181;
wire G141;
wire G204;
wire G190;
wire G123;
wire G168;
wire G155;
wire G56;
wire G44;
wire G39;
wire G128;
wire G46;
wire G94;
wire G91;
wire G59;
wire G179;
wire G97;
wire G62;
wire G102;
wire G150;
wire G104;
wire G99;
wire II288;
wire G152;
wire G135;
wire G116;
wire G60;
wire G112;
wire G82;
wire G64;
wire G188;
wire G84;
wire G205;
wire G86;
wire G92;
wire G34;
wire G45;
wire G201;
wire G89;
wire G182;
wire G170;
wire G76;
wire G212;
wire G63;
wire G98;
wire G72;
wire G55;
wire G133;
wire G78;
wire G186;
wire G203;
wire G96;
wire II365;
wire G183;
wire G38;
wire G127;
wire G48;
wire G53;
wire II359;
wire G36;
wire G156;
wire G194;
wire G173;
wire II340;
wire G108;
wire G110;
wire G88;
wire G32;
wire G180;
wire G119;
wire G131;
wire G143;
wire G100;
wire G70;
wire G154;
wire G52;
wire G124;
wire G106;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G10 <= 0;
  else
    G10 <= G60;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G11 <= 0;
  else
    G11 <= G61;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G12 <= 0;
  else
    G12 <= G62;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G13 <= 0;
  else
    G13 <= G69;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G14 <= 0;
  else
    G14 <= G79;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G15 <= 0;
  else
    G15 <= G84;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G16 <= 0;
  else
    G16 <= G89;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G17 <= 0;
  else
    G17 <= G96;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G18 <= 0;
  else
    G18 <= G101;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G19 <= 0;
  else
    G19 <= G106;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G20 <= 0;
  else
    G20 <= G115;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G21 <= 0;
  else
    G21 <= G127;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G22 <= 0;
  else
    G22 <= G137;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G23 <= 0;
  else
    G23 <= G167;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G24 <= 0;
  else
    G24 <= G173;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G25 <= 0;
  else
    G25 <= G179;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G26 <= 0;
  else
    G26 <= G183;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G27 <= 0;
  else
    G27 <= G188;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G28 <= 0;
  else
    G28 <= G194;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G29 <= 0;
  else
    G29 <= G200;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G30 <= 0;
  else
    G30 <= G206;
assign G178 = ((~G164))|((~G165))|((~G166))|((~G189));
assign G50 = (G16)|(G17);
assign G95 = ((~G44)&(~G45));
assign G120 = (G124&G122&G123);
assign II368 = ((~G28));
assign G167 = ((~G169)&(~G170)&(~G171)&(~G193));
assign G196 = (G195&G13);
assign II351 = ((~G2));
assign G79 = ((~G80)&(~G81)&(~G82)&(~G211));
assign G138 = (G140&G20&G141&G142);
assign G61 = ((~G76)&(~G77)&(~G78)&(~G211));
assign G207 = ((~G212));
assign G140 = ((~G21));
assign G161 = (G20)|(G13);
assign G209 = (G207&G208);
assign G200 = ((~G203)&(~G204)&(~G211));
assign G77 = (G10&G11);
assign G93 = (G94&G122&G123);
assign G191 = (G189&G190);
assign G105 = ((~G51)&(~G52));
assign G137 = ((~G138)&(~G139)&(~G211));
assign G165 = (G163)|(G172)|(G13);
assign G144 = (G145&G146);
assign G129 = ((~G131))|((~G20))|((~G19))|((~G104));
assign G193 = ((~G143)&(~G144));
assign G174 = ((~G24));
assign G134 = (G131)|(G211)|(G132);
assign G41 = ((~G104))|((~G116))|((~G16))|((~G37));
assign G146 = ((~G140))|((~G135))|((~G29))|((~G142));
assign G147 = ((~II285));
assign G198 = ((~II340));
assign G83 = ((~G10));
assign G160 = (G184)|(G13);
assign G35 = (G10&G107&G90&G15);
assign G80 = (G10&G11&G14);
assign G122 = ((~G30));
assign G117 = ((~G124)&(~G112)&(~G18));
assign G184 = ((~G12));
assign G151 = (G184)|(G13);
assign G132 = ((~G34)&(~G124)&(~G125));
assign G158 = (G193)|(G184)|(G177)|(G26);
assign G65 = ((~G12));
assign G113 = ((~G54)&(~G55)&(~G56));
assign G81 = (G83&G90);
assign G73 = ((~G38)&(~G39)&(~G40)&(~G41));
assign G58 = (G59&G19);
assign G176 = (G177&G12);
assign G210 = (G212&G30);
assign G163 = ((~G20));
assign G43 = (G83)|(G11)|(G14);
assign G148 = ((~II288));
assign G114 = ((~G57)&(~G58));
assign G153 = (G172)|(G27);
assign G189 = ((~G193));
assign G85 = ((~G15));
assign II285 = ((~G23));
assign G74 = (G211)|(G125)|(G70)|(G71);
assign G115 = ((~G119)&(~G120)&(~G121)&(~G126));
assign G175 = (G174&G12);
assign G103 = (G104&G122&G123);
assign II343 = ((~G26));
assign G172 = ((~G21));
assign G51 = (G59&G16&G17);
assign G187 = ((~G158))|((~G159));
assign G49 = (G122)|(G94)|(G116);
assign G118 = ((~G53))|((~G122));
assign G157 = ((~G18));
assign G130 = ((~G32))|((~G33));
assign G177 = ((~G13));
assign II362 = ((~G1));
assign G208 = ((~G30));
assign G54 = (G17&G104);
assign G211 = ((~II359));
assign G67 = (G211)|(G63)|(G64)|(G71);
assign G42 = (G83)|(G107)|(G90)|(G85);
assign G107 = ((~G11));
assign G71 = ((~G35)&(~G30));
assign G87 = (G85&G86);
assign G31 = ((~G85)&(~G14)&(~G11)&(~G83));
assign G69 = ((~G74))|((~G75));
assign G213 = ((~II365));
assign G90 = ((~G14));
assign G126 = ((~G59));
assign G75 = (G72)|(G211)|(G73);
assign G169 = (G13&G168);
assign G202 = ((~G29));
assign G111 = (G16&G30&G113);
assign G47 = (G116&G18);
assign G171 = (G172&G184);
assign G142 = ((~G13)&(~G136));
assign G40 = (G12&G131);
assign G206 = ((~G209)&(~G210)&(~G211));
assign G101 = ((~G102)&(~G103)&(~G105));
assign G57 = (G59&G16&G17&G18);
assign G121 = (G124&G125);
assign G166 = (G172)|(G177)|(G24);
assign G159 = (G189)|(G157);
assign G149 = (G20)|(G21)|(G12)|(G177);
assign G33 = (G72)|(G12);
assign G139 = (G145&G146);
assign G109 = (G107&G10&G108&G113);
assign G197 = ((~G160))|((~G161))|((~G162))|((~G189));
assign G162 = (G21)|(G12);
assign G164 = (G20)|(G21)|(G12)|(G177);
assign G68 = (G65)|(G211)|(G66);
assign G37 = ((~G124)&(~G112));
assign G145 = ((~G22));
assign G66 = ((~G36)&(~G131)&(~G124)&(~G125));
assign G136 = ((~G12));
assign G185 = ((~G155)&(~G156));
assign G192 = (G18&G193);
assign G125 = ((~G19))|((~G104))|((~G116))|((~G16));
assign G195 = ((~G28));
assign G181 = (G180&G13&G21);
assign G204 = (G205&G29);
assign G141 = ((~G29));
assign G190 = ((~G152))|((~G153))|((~G154))|((~G13));
assign G168 = ((~G23));
assign G123 = ((~G15))|((~G90))|((~G107))|((~G10));
assign G56 = (G17&G112);
assign G155 = (G21&G13&G26);
assign G39 = (G65&G21);
assign G44 = (G59&G94);
assign G128 = ((~G116))|((~G16));
assign G199 = ((~II343));
assign G46 = (G116&G112);
assign G94 = ((~G16));
assign G91 = ((~G94)&(~G85));
assign G59 = ((~G211));
assign G179 = ((~G181)&(~G182));
assign G97 = ((~G46)&(~G47));
assign G62 = ((~G67))|((~G68));
assign G102 = (G18&G17&G16&G118);
assign G150 = (G184)|(G25);
assign G104 = ((~G18));
assign G99 = (G116&G122&G123);
assign II288 = ((~G24));
assign G152 = (G163)|(G21)|(G12);
assign G135 = ((~G20));
assign G116 = ((~G17));
assign G60 = ((~G10)&(~G211));
assign G112 = ((~G19));
assign G82 = (G107&G90);
assign G64 = ((~G65))|((~G21))|((~G20))|((~G19));
assign G188 = ((~G191)&(~G192));
assign G84 = ((~G87)&(~G88));
assign G205 = ((~II351));
assign G86 = ((~G14))|((~G11))|((~G10));
assign G92 = (G90&G107&G10&G91);
assign G34 = (G122&G123);
assign G201 = ((~G205));
assign G45 = (G122&G59);
assign G182 = ((~G149))|((~G150))|((~G151))|((~G189));
assign G89 = ((~G92)&(~G93)&(~G95));
assign G170 = (G184&G177);
assign G214 = ((~II368));
assign G76 = (G10&G90&G15);
assign G212 = ((~II362));
assign G63 = ((~G104))|((~G116))|((~G16));
assign G72 = ((~G13));
assign G98 = (G107&G10&G108&G97);
assign G55 = (G116&G18);
assign G133 = (G211)|(G128)|(G129)|(G130);
assign G78 = (G83&G107);
assign G203 = (G201&G202);
assign G186 = (G184&G189&G185);
assign G96 = ((~G98)&(~G99)&(~G100));
assign G183 = ((~G186)&(~G187));
assign II365 = ((~G27));
assign G38 = (G122&G123);
assign G127 = ((~G133))|((~G134));
assign G53 = (G83)|(G11)|(G14)|(G85);
assign G48 = (G122)|(G94)|(G18)|(G112);
assign II359 = ((~G0));
assign G36 = (G122&G123);
assign G156 = (G163&G172&G13);
assign G173 = ((~G175)&(~G176)&(~G178));
assign G194 = ((~G196)&(~G197));
assign II340 = ((~G25));
assign G108 = ((~G94)&(~G85)&(~G14));
assign G110 = (G112&G122&G123);
assign G88 = ((~G42))|((~G43))|((~G59));
assign G32 = (G30)|(G31);
assign G180 = ((~G25));
assign G119 = (G116&G16&G117&G118);
assign G131 = ((~G21));
assign G143 = (G140&G20&G141&G142);
assign G100 = ((~G48))|((~G49))|((~G50))|((~G59));
assign G70 = ((~G72))|((~G12))|((~G21))|((~G20));
assign G154 = (G184)|(G27);
assign G124 = ((~G20));
assign G52 = (G59&G18);
assign G106 = ((~G109)&(~G110)&(~G111)&(~G114));
endmodule
