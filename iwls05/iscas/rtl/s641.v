module s641_bench(
  blif_clk_net,
  blif_reset_net,
  G1,
  G2,
  G3,
  G4,
  G5,
  G6,
  G8,
  G9,
  G10,
  G11,
  G12,
  G13,
  G14,
  G15,
  G16,
  G17,
  G18,
  G19,
  G20,
  G21,
  G22,
  G23,
  G24,
  G25,
  G26,
  G27,
  G28,
  G29,
  G30,
  G31,
  G32,
  G33,
  G34,
  G35,
  G36,
  G91,
  G94,
  G107,
  G83,
  G84,
  G85,
  G100BF,
  G98BF,
  G96BF,
  G92,
  G87BF,
  G89BF,
  G101BF,
  G106BF,
  G97BF,
  G104BF,
  G88BF,
  G99BF,
  G105BF,
  G86BF,
  G95BF,
  G103BF,
  G90);
input blif_clk_net;
input blif_reset_net;
input G1;
input G2;
input G3;
input G4;
input G5;
input G6;
input G8;
input G9;
input G10;
input G11;
input G12;
input G13;
input G14;
input G15;
input G16;
input G17;
input G18;
input G19;
input G20;
input G21;
input G22;
input G23;
input G24;
input G25;
input G26;
input G27;
input G28;
input G29;
input G30;
input G31;
input G32;
input G33;
input G34;
input G35;
input G36;
output G91;
output G94;
output G107;
output G83;
output G84;
output G85;
output G100BF;
output G98BF;
output G96BF;
output G92;
output G87BF;
output G89BF;
output G101BF;
output G106BF;
output G97BF;
output G104BF;
output G88BF;
output G99BF;
output G105BF;
output G86BF;
output G95BF;
output G103BF;
output G90;
reg G64;
reg G65;
reg G66;
reg G67;
reg G68;
reg G69;
reg G70;
reg G71;
reg G72;
reg G73;
reg G74;
reg G75;
reg G76;
reg G77;
reg G78;
reg G79;
reg G80;
reg G81;
reg G82;
wire G178;
wire II372;
wire G333;
wire G381;
wire G260;
wire G228;
wire G234;
wire G361;
wire IIII272;
wire II263;
wire G138;
wire G140;
wire G371;
wire II476;
wire G301;
wire G217;
wire G209;
wire G395;
wire G254;
wire G353;
wire G365;
wire II175;
wire II517;
wire II172;
wire G356;
wire G105;
wire IIII348;
wire IIII652;
wire G313;
wire G270;
wire G329;
wire G134;
wire G218;
wire IIII343;
wire G122;
wire G117;
wire IIII553;
wire G389;
wire II363;
wire IIII527;
wire IIII649;
wire G210;
wire II469;
wire G310;
wire G284;
wire II266;
wire G238;
wire G325;
wire G114;
wire G221;
wire G246;
wire G307;
wire IIII244;
wire II366;
wire G386;
wire II278;
wire II440;
wire II291;
wire II466;
wire G118;
wire IIII285;
wire II321;
wire G130;
wire IIII660;
wire II199;
wire G348;
wire G87;
wire IIII320;
wire IIII680;
wire G373;
wire G341;
wire G213;
wire II511;
wire G126;
wire G366;
wire G354;
wire G377;
wire II382;
wire G344;
wire G300;
wire G169;
wire II193;
wire IIII518;
wire G111;
wire G263;
wire G233;
wire II208;
wire G324;
wire II190;
wire G239;
wire G166;
wire G312;
wire G216;
wire IIII533;
wire IIII422;
wire G227;
wire II472;
wire G282;
wire G286;
wire G392;
wire G369;
wire G162;
wire IIII655;
wire II551;
wire G136;
wire IIII646;
wire II538;
wire G359;
wire G391;
wire G364;
wire G141;
wire G190;
wire II338;
wire G245;
wire G128;
wire G285;
wire II390;
wire IIII538;
wire G97;
wire G271;
wire IIII210;
wire II386;
wire IIII512;
wire G150;
wire G379;
wire G316;
wire G104;
wire IIII406;
wire G225;
wire G360;
wire G135;
wire II527;
wire G384;
wire II524;
wire II324;
wire G303;
wire G397;
wire G375;
wire IIII336;
wire II205;
wire G247;
wire G376;
wire G264;
wire II275;
wire G89;
wire G257;
wire G294;
wire G212;
wire G276;
wire G98;
wire G339;
wire II449;
wire G372;
wire II211;
wire G183;
wire IIII313;
wire II541;
wire G127;
wire G336;
wire G173;
wire II373;
wire II442;
wire G108;
wire G252;
wire IIII329;
wire G110;
wire G88;
wire II181;
wire II335;
wire G119;
wire IIII306;
wire II354;
wire G131;
wire G331;
wire II169;
wire G347;
wire II254;
wire IIII265;
wire G100;
wire G363;
wire G124;
wire IIII315;
wire II357;
wire G120;
wire G95;
wire IIII222;
wire G315;
wire G244;
wire G368;
wire G273;
wire II269;
wire G236;
wire G393;
wire II547;
wire II535;
wire G258;
wire G248;
wire IIII208;
wire G137;
wire G383;
wire G129;
wire G342;
wire G174;
wire G378;
wire G146;
wire G309;
wire IIII521;
wire G198;
wire G289;
wire IIII524;
wire G184;
wire G256;
wire G132;
wire G380;
wire G158;
wire IIII258;
wire G387;
wire IIII299;
wire IIII224;
wire II460;
wire G113;
wire II281;
wire G272;
wire G319;
wire G222;
wire IIII287;
wire G219;
wire G338;
wire G230;
wire G115;
wire G283;
wire IIII341;
wire G103;
wire IIII301;
wire II608;
wire G243;
wire G374;
wire G208;
wire G211;
wire G293;
wire IIII251;
wire G265;
wire IIII687;
wire IIII537;
wire G267;
wire G275;
wire II165;
wire II295;
wire II260;
wire G279;
wire IIII294;
wire G277;
wire G262;
wire G215;
wire II196;
wire G335;
wire II287;
wire G223;
wire G281;
wire II360;
wire II341;
wire G322;
wire G362;
wire IIII398;
wire G202;
wire G396;
wire G358;
wire G235;
wire G142;
wire G352;
wire II178;
wire G288;
wire G206;
wire G304;
wire G101;
wire II202;
wire G121;
wire G370;
wire G261;
wire G139;
wire G109;
wire G321;
wire G237;
wire G259;
wire IIII308;
wire IIII279;
wire G125;
wire II303;
wire G298;
wire IIII350;
wire G168;
wire II184;
wire IIII292;
wire IIII327;
wire G350;
wire G229;
wire G318;
wire II452;
wire G274;
wire G179;
wire II272;
wire G357;
wire II369;
wire IIII178;
wire G394;
wire G226;
wire G224;
wire IIII356;
wire G99;
wire IIII515;
wire G388;
wire G382;
wire G116;
wire G112;
wire G250;
wire IIII237;
wire G287;
wire G86;
wire G241;
wire G306;
wire G231;
wire G280;
wire IIII476;
wire IIII643;
wire G214;
wire G327;
wire IIII414;
wire G133;
wire IIII684;
wire G266;
wire G242;
wire IIII633;
wire G96;
wire II375;
wire IIII334;
wire G345;
wire G249;
wire G194;
wire G232;
wire IIII495;
wire G220;
wire II257;
wire II463;
wire G390;
wire G367;
wire G278;
wire IIII546;
wire II187;
wire IIII230;
wire G143;
wire IIII322;
wire II544;
wire G355;
wire G154;
wire II378;
wire G106;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G64 <= 0;
  else
    G64 <= G380;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G65 <= 0;
  else
    G65 <= G262;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G66 <= 0;
  else
    G66 <= G394;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G67 <= 0;
  else
    G67 <= G250;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G68 <= 0;
  else
    G68 <= G122;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G69 <= 0;
  else
    G69 <= G133;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G70 <= 0;
  else
    G70 <= G138;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G71 <= 0;
  else
    G71 <= G139;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G72 <= 0;
  else
    G72 <= G140;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G73 <= 0;
  else
    G73 <= G141;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G74 <= 0;
  else
    G74 <= G142;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G75 <= 0;
  else
    G75 <= G125;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G76 <= 0;
  else
    G76 <= G126;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G77 <= 0;
  else
    G77 <= G127;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G78 <= 0;
  else
    G78 <= G128;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G79 <= 0;
  else
    G79 <= G129;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G80 <= 0;
  else
    G80 <= G130;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G81 <= 0;
  else
    G81 <= G131;
always @(posedge blif_clk_net or posedge blif_reset_net)
  if(blif_reset_net == 1)
    G82 <= 0;
  else
    G82 <= G132;
assign G178 = ((~IIII414));
assign II372 = ((~G303));
assign G333 = ((~II324));
assign G381 = ((~II287));
assign G260 = (G395&G383&IIII524);
assign G228 = (G366&G158);
assign G234 = (G379&G387);
assign G361 = ((~IIII646));
assign IIII272 = ((~G277));
assign II263 = ((~G338));
assign G138 = ((~IIII322));
assign G140 = ((~IIII336));
assign G371 = ((~II295));
assign II476 = ((~G158));
assign G301 = ((~II544));
assign G395 = ((~G158));
assign G217 = ((~II211));
assign G209 = ((~II193));
assign G254 = (G353&G370);
assign G353 = ((~II527));
assign G365 = ((~G364));
assign II175 = ((~G72));
assign II517 = ((~G134));
assign II172 = ((~G71));
assign G356 = ((~G355));
assign G105 = (G307&G16);
assign IIII348 = ((~G288));
assign IIII652 = ((~G8));
assign G313 = ((~II272));
assign G270 = (G265)|(G266)|(G267)|(IIII546);
assign G329 = ((~II321));
assign G134 = ((~IIII294));
assign G218 = ((~G360));
assign IIII343 = ((~IIII341));
assign G83 = (G316&G19);
assign G122 = ((~IIII210));
assign G117 = ((~II175));
assign IIII553 = (G366&G150&G393);
assign G389 = ((~IIII687));
assign II363 = ((~G309));
assign IIII527 = (G366&G64&G393);
assign IIII649 = ((~G6));
assign G210 = ((~G379))|((~G356));
assign II469 = ((~G306));
assign G310 = ((~II363));
assign G284 = ((~II440));
assign II266 = ((~G344));
assign G238 = (G370&G372);
assign G325 = ((~II257));
assign G114 = ((~G360));
assign G221 = ((~II184));
assign G246 = (G357&G378);
assign IIII244 = ((~G273));
assign G307 = ((~II469));
assign II366 = ((~G341));
assign G386 = ((~IIII680));
assign II278 = ((~G318));
assign II440 = ((~G235));
assign II291 = ((~G194));
assign II466 = ((~G306));
assign G118 = ((~G360));
assign IIII285 = ((~G279));
assign II321 = ((~G135));
assign G130 = ((~IIII265));
assign IIII660 = ((~G10));
assign II199 = ((~G76));
assign G348 = ((~II538));
assign G104BF = ((~G104));
assign G87 = (G329&G23);
assign IIII320 = ((~G284));
assign G103BF = ((~G103));
assign IIII680 = ((~G11));
assign G373 = ((~II386));
assign G341 = (G116&G117);
assign G213 = ((~II205));
assign II511 = ((~G239));
assign G88BF = ((~G88));
assign G126 = ((~IIII237));
assign G366 = ((~G2));
assign G354 = ((~G353));
assign G377 = ((~II472));
assign II382 = ((~G162));
assign G344 = (G118&G119);
assign G300 = (G208&G209);
assign G169 = ((~II524));
assign II193 = ((~G75));
assign IIII518 = (G391&G395&G397);
assign G111 = ((~II202));
assign G263 = (G379&G364&G368&G390);
assign G233 = (G379&G387);
assign II208 = ((~G78));
assign G100BF = ((~G100));
assign G97BF = ((~G97));
assign II190 = ((~G82));
assign G324 = (G110&G111);
assign G239 = (G370&G371);
assign G166 = ((~II254));
assign G216 = ((~G360));
assign G312 = (G216&G217);
assign IIII533 = (G365&G367&G373);
assign IIII422 = ((~G89));
assign G227 = (G366&G392);
assign II472 = ((~G190));
assign G282 = (G233)|(G249)|(G263);
assign G286 = ((~II373));
assign G392 = ((~II390));
assign G369 = ((~II547));
assign G162 = ((~II360));
assign II551 = ((~G150));
assign IIII655 = ((~G9));
assign G136 = ((~IIII308));
assign IIII646 = ((~G5));
assign II538 = ((~G347));
assign G359 = ((~G184));
assign G391 = ((~G150));
assign G364 = ((~IIII655));
assign G141 = ((~IIII343));
assign G190 = ((~II460));
assign II338 = ((~G183));
assign G245 = (G352&G396);
assign G128 = ((~IIII251));
assign G285 = (G236)|(G252);
assign II390 = ((~G154));
assign G94 = ((~IIII178));
assign IIII538 = (G377&G381&G383&G387);
assign G91 = ((~II165));
assign G86BF = ((~G86));
assign G97 = (G342&G32);
assign G271 = (G226)|(G242)|(G257);
assign IIII210 = ((~IIII208));
assign II386 = ((~G198));
assign IIII512 = (G364&G368&G377);
assign G150 = ((~II541));
assign G104 = (G304&G15);
assign G316 = ((~II275));
assign G379 = ((~G3));
assign IIII406 = ((~G87));
assign G225 = ((~G388));
assign G360 = ((~IIII643));
assign G135 = ((~IIII301));
assign II527 = ((~G169));
assign G384 = ((~G383));
assign II524 = ((~G168));
assign II324 = ((~G137));
assign G84 = (G319&G20);
assign G303 = (G210&G211);
assign G397 = ((~G396));
assign G92 = (G350&G28);
assign G375 = ((~II291));
assign IIII336 = ((~IIII334));
assign II205 = ((~G77));
assign G247 = (G379&G365&G368&G390);
assign G376 = ((~G375));
assign G264 = (G379&G364&G367&G390);
assign G89 = (G333&G25);
assign II275 = ((~G315));
assign G257 = (G363&G369&G371&IIII515);
assign G294 = ((~II357));
assign G212 = ((~G379))|((~G358));
assign G276 = (G366&G392&G395&G397);
assign G98 = (G339&G33);
assign G339 = ((~II263));
assign II449 = ((~G178));
assign G372 = ((~G371));
assign II211 = ((~G79));
assign G183 = ((~IIII422));
assign IIII313 = ((~G283));
assign II541 = ((~G300));
assign G87BF = ((~G87));
assign G127 = ((~IIII244));
assign G336 = ((~II463));
assign G173 = ((~IIII406));
assign II373 = ((~G237));
assign II442 = ((~G136));
assign G108 = ((~G359));
assign G252 = (G355&G374);
assign IIII329 = ((~IIII327));
assign G110 = ((~G360));
assign G88 = (G331&G24);
assign II181 = ((~G73));
assign II335 = ((~G173));
assign G119 = ((~II181));
assign IIII306 = ((~G282));
assign II354 = ((~G293));
assign G131 = ((~IIII272));
assign G331 = ((~II442));
assign II169 = ((~G70));
assign G347 = (G120&G121);
assign II254 = ((~G324));
assign IIII265 = ((~G276));
assign G100 = (G325&G35);
assign G363 = ((~IIII652));
assign G124 = ((~IIII224));
assign G98BF = ((~G98));
assign IIII315 = ((~IIII313));
assign II357 = ((~G293));
assign G95 = (G348&G30);
assign G120 = ((~G354));
assign IIII222 = ((~G270));
assign G315 = (G218&G219);
assign G244 = (G158&G362);
assign G368 = ((~G367));
assign G273 = (G228)|(G244)|(G259);
assign II269 = ((~G344));
assign G236 = (G374&G376);
assign G393 = ((~G392));
assign II547 = ((~G206));
assign II535 = ((~G347));
assign G258 = (G361&G373&G375&IIII518);
assign G248 = (G379&G365&G367&G390);
assign IIII208 = ((~G224));
assign G137 = ((~IIII315));
assign G129 = ((~IIII258));
assign G383 = ((~II378));
assign G174 = ((~II335));
assign G342 = ((~II369));
assign G378 = ((~G377));
assign G309 = (G214&G215);
assign G146 = ((~II354));
assign IIII521 = (G391&G393&G397);
assign G198 = ((~II366));
assign G105BF = ((~G105));
assign G289 = (G386&G388&G389);
assign IIII524 = (G352&G391&G393);
assign G184 = ((~II338));
assign G256 = (G381&G390&IIII512);
assign G132 = ((~IIII279));
assign G380 = ((~II551));
assign IIII258 = ((~G275));
assign G158 = ((~II466));
assign G387 = ((~G386));
assign IIII299 = ((~G281));
assign IIII224 = ((~IIII222));
assign II460 = ((~G335));
assign G113 = ((~II169));
assign II281 = ((~G321));
assign G272 = (G227)|(G243)|(G258);
assign G222 = ((~G360));
assign G319 = ((~II278));
assign IIII287 = ((~IIII285));
assign G219 = ((~II178));
assign G85 = (G322&G21);
assign G338 = (G114&G115);
assign G230 = (G378&G382);
assign G115 = ((~II172));
assign G283 = (G234)|(G67)|(G264);
assign IIII341 = ((~G287));
assign G103 = (G301&G14);
assign IIII301 = ((~IIII299));
assign II608 = ((~G124));
assign G243 = (G392&G361);
assign G374 = ((~G373));
assign G208 = ((~G379))|((~G354));
assign G211 = ((~II199));
assign IIII251 = ((~G274));
assign G293 = (G108&G109);
assign G265 = (G375&G390&IIII533);
assign IIII687 = ((~G13));
assign G107 = (G313&G18);
assign G267 = (IIII537&IIII538);
assign IIII537 = (G369&G371&G373&G375);
assign G275 = (G395&G397&IIII553);
assign II165 = ((~G27));
assign II295 = ((~G202));
assign G90 = (G298&G26);
assign II260 = ((~G338));
assign G101BF = ((~G101));
assign G279 = (G230)|(G246);
assign IIII294 = ((~IIII292));
assign G277 = (G366&G158&G397);
assign G262 = (G366&G392&G395&G397);
assign G215 = ((~II208));
assign II196 = ((~G68));
assign II287 = ((~G166));
assign G335 = (G112&G113);
assign G223 = ((~II190));
assign G281 = (G232)|(G248)|(G65);
assign G362 = ((~IIII649));
assign G322 = ((~II281));
assign II341 = ((~G174));
assign II360 = ((~G309));
assign IIII398 = ((~G86));
assign G202 = ((~II266));
assign G396 = ((~II382));
assign G358 = ((~G357));
assign G235 = (G378&G381);
assign G142 = ((~IIII350));
assign G352 = ((~IIII633));
assign II178 = ((~G80));
assign G288 = ((~II511));
assign G206 = ((~II535));
assign G304 = ((~II375));
assign II202 = ((~G69));
assign G101 = (G294&G36);
assign G121 = ((~II187));
assign G261 = (G395&G397&IIII527);
assign G370 = ((~G369));
assign G139 = ((~IIII329));
assign G109 = ((~II196));
assign G321 = (G222&G223);
assign G237 = (G374&G375);
assign G259 = (G362&G377&G381&IIII521);
assign IIII308 = ((~IIII306));
assign IIII279 = ((~G278));
assign G89BF = ((~G89));
assign G125 = ((~IIII230));
assign II303 = ((~G143));
assign G298 = ((~II608));
assign IIII350 = ((~IIII348));
assign G168 = ((~IIII398));
assign II184 = ((~G81));
assign IIII292 = ((~G280));
assign G350 = ((~II303));
assign IIII327 = ((~G285));
assign G229 = (G366&G396);
assign G318 = (G220&G221);
assign G95BF = ((~G95));
assign II452 = ((~G179));
assign G274 = (G229)|(G245)|(G260);
assign II272 = ((~G312));
assign G179 = ((~II449));
assign IIII178 = ((~G29));
assign II369 = ((~G341));
assign G357 = ((~II452));
assign G394 = ((~II476));
assign G226 = (G366&G150);
assign IIII356 = ((~G289));
assign G224 = ((~IIII476));
assign G99 = (G336&G34);
assign IIII515 = (G393&G395&G397);
assign G388 = ((~IIII684));
assign G382 = ((~G381));
assign G116 = ((~G356));
assign G112 = ((~G358));
assign G99BF = ((~G99));
assign IIII237 = ((~G272));
assign G250 = (G366&G396);
assign G287 = (G238)|(G254);
assign G86 = (G327&G22);
assign G241 = (G371&G390&IIII495);
assign G306 = (G212&G213);
assign G231 = (G379&G387);
assign G280 = (G231)|(G247)|(G261);
assign IIII643 = ((~G4));
assign IIII476 = ((~G384));
assign G214 = ((~G379))|((~G359));
assign G327 = ((~II517));
assign IIII414 = ((~G88));
assign G133 = ((~IIII287));
assign IIII684 = ((~G12));
assign G242 = (G150&G363);
assign G266 = (G364&G367&G383&G390);
assign IIII633 = ((~G1));
assign G96 = (G345&G31);
assign II375 = ((~G303));
assign G345 = ((~II269));
assign IIII334 = ((~G286));
assign G249 = (G366&G66&G397);
assign G232 = (G379&G387);
assign G194 = ((~II260));
assign IIII495 = (G365&G368&G369);
assign II257 = ((~G324));
assign G220 = ((~G360));
assign II463 = ((~G335));
assign G390 = ((~G389));
assign G367 = ((~IIII660));
assign G278 = (G366&G396);
assign IIII546 = (G225)|(G241)|(G256);
assign II187 = ((~G74));
assign IIII230 = ((~G271));
assign G96BF = ((~G96));
assign G143 = ((~IIII356));
assign IIII322 = ((~IIII320));
assign G106BF = ((~G106));
assign II544 = ((~G300));
assign G355 = ((~II341));
assign G154 = ((~II372));
assign II378 = ((~G146));
assign G106 = (G310&G17);
endmodule
