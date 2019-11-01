module s444_bench(
  blif_clk_net,
  blif_reset_net,
  G0,
  G1,
  G2,
  G118,
  G167,
  G107,
  G119,
  G168,
  G108);
input blif_clk_net;
input blif_reset_net;
input G0;
input G1;
input G2;
output G118;
output G167;
output G107;
output G119;
output G168;
output G108;
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
reg G31;
wire IIII212;
wire G50;
wire G95;
wire IIII211;
wire G120;
wire IIII192;
wire IIII272;
wire G79;
wire G138;
wire G61;
wire G140;
wire G161;
wire IIII201;
wire G77;
wire IIII190;
wire IIII283;
wire G93;
wire G137;
wire G105;
wire G165;
wire G144;
wire G129;
wire IIII226;
wire IIII281;
wire IIII372;
wire G134;
wire IIII235;
wire G147;
wire G146;
wire G41;
wire G83;
wire G160;
wire G35;
wire G122;
wire G80;
wire G117;
wire G132;
wire G151;
wire G158;
wire G65;
wire G81;
wire G113;
wire G73;
wire G58;
wire IIII181;
wire G163;
wire G148;
wire G43;
wire IIII271;
wire IIII392;
wire G153;
wire G114;
wire G85;
wire G74;
wire G115;
wire G103;
wire IIII202;
wire G51;
wire IIII236;
wire G49;
wire IIII246;
wire G157;
wire G130;
wire G54;
wire G67;
wire G42;
wire IIII182;
wire G87;
wire G71;
wire G69;
wire G90;
wire IIII255;
wire G126;
wire IIII321;
wire G75;
wire G47;
wire G111;
wire G142;
wire IIII304;
wire G40;
wire IIII180;
wire IIII318;
wire G101;
wire G121;
wire G57;
wire IIII225;
wire G166;
wire G159;
wire G149;
wire IIII256;
wire G33;
wire IIII200;
wire G139;
wire G109;
wire IIII257;
wire G162;
wire G164;
wire G68;
wire IIII293;
wire IIII291;
wire G145;
wire G37;
wire G66;
wire G136;
wire IIII191;
wire G125;
wire G141;
wire G123;
wire IIII273;
wire IIII105;
wire IIII292;
wire G155;
wire G56;
wire G44;
wire G128;
wire G46;
wire G94;
wire G91;
wire G59;
wire G97;
wire IIII210;
wire G62;
wire G102;
wire G104;
wire G150;
wire IIII227;
wire G99;
wire G152;
wire G135;
wire G116;
wire G112;
wire G60;
wire G82;
wire G64;
wire IIII237;
wire G84;
wire G86;
wire IIII382;
wire G92;
wire G34;
wire IIII245;
wire IIII336;
wire G162BF;
wire G45;
wire G89;
wire IIII324;
wire G76;
wire G72;
wire G98;
wire G63;
wire G55;
wire G133;
wire G78;
wire G96;
wire G38;
wire G127;
wire IIII247;
wire G48;
wire G53;
wire G36;
wire G156;
wire G110;
wire G88;
wire G32;
wire IIII302;
wire G131;
wire IIII282;
wire G143;
wire G100;
wire G70;
wire IIII303;
wire G154;
wire G52;
wire G124;
wire G106;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G11 <= 0;
  else
    G11 <= G37;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G12 <= 0;
  else
    G12 <= G41;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G13 <= 0;
  else
    G13 <= G45;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G14 <= 0;
  else
    G14 <= G49;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G15 <= 0;
  else
    G15 <= G58;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G16 <= 0;
  else
    G16 <= G62;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G17 <= 0;
  else
    G17 <= G66;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G18 <= 0;
  else
    G18 <= G70;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G19 <= 0;
  else
    G19 <= G80;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G20 <= 0;
  else
    G20 <= G84;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G21 <= 0;
  else
    G21 <= G88;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G22 <= 0;
  else
    G22 <= G92;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G23 <= 0;
  else
    G23 <= G101;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G24 <= 0;
  else
    G24 <= G162BF;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G25 <= 0;
  else
    G25 <= G109;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G26 <= 0;
  else
    G26 <= G110;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G27 <= 0;
  else
    G27 <= G111;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G28 <= 0;
  else
    G28 <= G112;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G29 <= 0;
  else
    G29 <= G113;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G30 <= 0;
  else
    G30 <= G114;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G31 <= 0;
  else
    G31 <= G155;
assign IIII212 = ((~G51))|((~IIII210));
assign G50 = ((~G52));
assign G95 = ((~G76)&(~G77)&(~G78)&(~G79));
assign IIII211 = ((~G14))|((~IIII210));
assign IIII192 = ((~G43))|((~IIII190));
assign G120 = ((~G150))|((~G128));
assign G167 = ((~G29));
assign IIII272 = ((~G19))|((~IIII271));
assign G79 = ((~G97));
assign G138 = (G136)|(G142);
assign G61 = ((~IIII226))|((~IIII227));
assign G140 = (G24)|(G21)|(G20)|(G150);
assign G161 = ((~G17));
assign IIII201 = ((~G13))|((~IIII200));
assign G77 = ((~G20));
assign G93 = ((~G74)&(~G79)&(~G75));
assign IIII283 = ((~G86))|((~IIII281));
assign IIII190 = ((~G12))|((~G43));
assign G137 = (G136)|(G20)|(G19);
assign G105 = (G102)|(G103);
assign G165 = ((~G148))|((~G149));
assign G144 = ((~G21));
assign G129 = ((~G19))|((~G135));
assign IIII226 = ((~G15))|((~IIII225));
assign IIII281 = ((~G20))|((~G86));
assign IIII372 = ((~G0));
assign G134 = (G152)|(G142)|(G21);
assign IIII235 = ((~G16))|((~G64));
assign G147 = (G152)|(G144);
assign G146 = (G152)|(G143);
assign G41 = ((~G98)&(~G42)&(~G152));
assign G83 = ((~IIII272))|((~IIII273));
assign G160 = ((~IIII382));
assign G35 = ((~G12));
assign G122 = (G24&G121);
assign G80 = ((~G93)&(~G81)&(~G152));
assign G117 = ((~G145))|((~G146))|((~G147));
assign G151 = ((~G20))|((~G144))|((~G143))|((~G139));
assign G132 = ((~G133))|((~G134));
assign G158 = (G31)|(G160);
assign G65 = ((~IIII236))|((~IIII237));
assign G81 = ((~G83));
assign G113 = ((~G163)&(~G164));
assign G73 = ((~IIII256))|((~IIII257));
assign G58 = ((~G97)&(~G59)&(~G152));
assign IIII181 = ((~G11))|((~IIII180));
assign G163 = (G161&G165&G162);
assign G148 = ((~G150))|((~G135))|((~G132));
assign G43 = ((~G34));
assign IIII271 = ((~G19))|((~G82));
assign IIII392 = ((~G30));
assign G114 = ((~G150)&(~G151));
assign G153 = ((~G152));
assign G85 = ((~G87));
assign G115 = (G161&G117&G162);
assign G74 = ((~G22));
assign G103 = ((~G106));
assign IIII202 = ((~G47))|((~IIII200));
assign G51 = ((~G34)&(~G35)&(~G36));
assign IIII236 = ((~G16))|((~IIII235));
assign G49 = ((~G98)&(~G50)&(~G152));
assign IIII246 = ((~G17))|((~IIII245));
assign G118 = ((~IIII336));
assign G157 = ((~G160));
assign G130 = ((~G143)&(~G152));
assign G54 = ((~G15)&(~G16)&(~G17));
assign G67 = ((~G69));
assign G42 = ((~G44));
assign G107 = ((~IIII321));
assign IIII182 = ((~IIII180));
assign G87 = ((~IIII282))|((~IIII283));
assign G71 = ((~G73));
assign G69 = ((~IIII246))|((~IIII247));
assign G90 = ((~G76)&(~G77)&(~G79));
assign IIII255 = ((~G18))|((~G72));
assign G126 = (G139&G21);
assign IIII321 = ((~G25));
assign G75 = ((~G19)&(~G20)&(~G21));
assign G47 = ((~G34)&(~G35));
assign G111 = ((~G140))|((~G141))|((~G139));
assign G142 = ((~G22));
assign IIII304 = ((~G95))|((~IIII302));
assign G40 = ((~IIII181))|((~IIII182));
assign IIII180 = ((~G11));
assign IIII318 = ((~G2));
assign G101 = (G100&G99);
assign G57 = ((~G31)&(~G98));
assign G121 = ((~G19))|((~G135))|((~G142))|((~G136));
assign IIII225 = ((~G15))|((~G60));
assign G166 = ((~G162));
assign G149 = ((~G131))|((~G130));
assign G159 = (G156)|(G157);
assign IIII256 = ((~G18))|((~IIII255));
assign G33 = ((~G11)&(~G12)&(~G13));
assign IIII200 = ((~G13))|((~G47));
assign G139 = ((~G152));
assign G109 = ((~G122)&(~G123));
assign IIII257 = ((~G72))|((~IIII255));
assign G162 = ((~G120))|((~G149));
assign G164 = (G165&G166);
assign IIII293 = ((~G90))|((~IIII291));
assign G68 = ((~G55)&(~G56)&(~G57));
assign IIII291 = ((~G21))|((~G90));
assign G37 = ((~G98)&(~G38)&(~G152));
assign G145 = (G152)|(G142)|(G20)|(G19);
assign G66 = ((~G97)&(~G67)&(~G152));
assign G136 = ((~G23));
assign IIII191 = ((~G12))|((~IIII190));
assign G125 = (G139&G20&G19);
assign G141 = (G24)|(G22)|(G21);
assign G123 = ((~G137))|((~G138))|((~G21))|((~G139));
assign G168 = ((~IIII392));
assign IIII273 = ((~G82))|((~IIII271));
assign IIII105 = ((~G162));
assign IIII292 = ((~G21))|((~IIII291));
assign G155 = (G154&G153);
assign G56 = ((~G16));
assign G44 = ((~IIII191))|((~IIII192));
assign G128 = ((~G20)&(~G144)&(~G136)&(~G152));
assign G46 = ((~G48));
assign G94 = ((~G96));
assign G91 = ((~IIII292))|((~IIII293));
assign G59 = ((~G61));
assign G97 = ((~G53)&(~G57)&(~G54));
assign IIII210 = ((~G14))|((~G51));
assign G62 = ((~G97)&(~G63)&(~G152));
assign G102 = ((~G23));
assign G150 = ((~G19));
assign G104 = (G23)|(G106);
assign IIII227 = ((~G60))|((~IIII225));
assign G99 = ((~G152));
assign G152 = ((~IIII372));
assign G135 = ((~G20));
assign G116 = (G117&G166);
assign G112 = ((~G115)&(~G116));
assign G60 = ((~G57));
assign G82 = ((~G79));
assign G64 = ((~G55)&(~G57));
assign IIII237 = ((~G64))|((~IIII235));
assign G84 = ((~G93)&(~G85)&(~G152));
assign G86 = ((~G76)&(~G79));
assign IIII382 = ((~G1));
assign G92 = ((~G93)&(~G94)&(~G152));
assign G34 = ((~G11));
assign IIII245 = ((~G17))|((~G68));
assign IIII336 = ((~G27));
assign G162BF = ((~IIII105));
assign G45 = ((~G98)&(~G46)&(~G152));
assign G89 = ((~G91));
assign IIII324 = ((~G26));
assign G76 = ((~G19));
assign G98 = ((~G32)&(~G33));
assign G72 = ((~G55)&(~G56)&(~G161)&(~G57));
assign G63 = ((~G65));
assign G55 = ((~G15));
assign G133 = (G152)|(G136)|(G22)|(G144);
assign G78 = ((~G21));
assign G96 = ((~IIII303))|((~IIII304));
assign G38 = ((~G40));
assign G127 = (G139&G24);
assign IIII247 = ((~G68))|((~IIII245));
assign G53 = ((~G18));
assign G48 = ((~IIII201))|((~IIII202));
assign G36 = ((~G13));
assign G156 = ((~G31));
assign G108 = ((~IIII324));
assign G110 = ((~G124)&(~G125)&(~G126)&(~G127));
assign G88 = ((~G93)&(~G89)&(~G152));
assign G32 = ((~G14));
assign IIII302 = ((~G22))|((~G95));
assign G119 = ((~G28));
assign G131 = (G144)|(G22)|(G23)|(G129);
assign IIII282 = ((~G20))|((~IIII281));
assign G143 = ((~G24));
assign G100 = (G104&G105);
assign G70 = ((~G97)&(~G71)&(~G152));
assign IIII303 = ((~G22))|((~IIII302));
assign G154 = (G158&G159);
assign G52 = ((~IIII211))|((~IIII212));
assign G124 = (G139&G22&G150);
assign G106 = ((~IIII318));
endmodule
