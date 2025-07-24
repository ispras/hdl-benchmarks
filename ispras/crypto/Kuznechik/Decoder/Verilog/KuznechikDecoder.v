module tablePermut(
    input wire [7:0] in,
    output wire [7:0] out
);
  parameter inv = 0;

  `define C(ind, val) assign invtab[ind] = 8'd``val
  wire [7:0] invtab [255:0];
  `C(0, 165); `C(1, 45); `C(2, 50); `C(3, 143); `C(4, 14); `C(5, 48);
  `C(6, 56);  `C(7, 192); `C(8, 84); `C(9, 230); `C(10, 158); `C(11, 57);
  `C(12, 85); `C(13, 126); `C(14, 82); `C(15, 145); `C(16, 100); `C(17, 3);
  `C(18, 87); `C(19, 90); `C(20, 28); `C(21, 96); `C(22, 7); `C(23, 24);
  `C(24, 33); `C(25, 114); `C(26, 168); `C(27, 209); `C(28, 41); `C(29, 198);
  `C(30, 164); `C(31, 63); `C(32, 224); `C(33, 39); `C(34, 141); `C(35, 12);
  `C(36, 130); `C(37, 234); `C(38, 174); `C(39, 180); `C(40, 154); `C(41, 99);
  `C(42, 73); `C(43, 229); `C(44, 66); `C(45, 228); `C(46, 21); `C(47, 183);
  `C(48, 200); `C(49, 6); `C(50, 112); `C(51, 157); `C(52, 65); `C(53, 117);
  `C(54, 25); `C(55, 201); `C(56, 170); `C(57, 252); `C(58, 77); `C(59, 191);
  `C(60, 42); `C(61, 115); `C(62, 132); `C(63, 213); `C(64, 195); `C(65, 175);
  `C(66, 43); `C(67, 134); `C(68, 167); `C(69, 177); `C(70, 178); `C(71, 91);
  `C(72, 70); `C(73, 211); `C(74, 159); `C(75, 253); `C(76, 212); `C(77, 15);
  `C(78, 156); `C(79, 47); `C(80, 155); `C(81, 67); `C(82, 239); `C(83, 217);
  `C(84, 121);  `C(85, 182); `C(86, 83); `C(87, 127); `C(88, 193); `C(89, 240);
  `C(90, 35); `C(91, 231); `C(92, 37); `C(93, 94); `C(94, 181); `C(95, 30);
  `C(96, 162); `C(97, 223); `C(98, 166); `C(99, 254); `C(100, 172); `C(101, 34);
  `C(102, 249); `C(103, 226); `C(104, 74); `C(105, 188); `C(106, 53);
  `C(107, 202); `C(108, 238); `C(109, 120); `C(110, 5); `C(111, 107);
  `C(112, 81); `C(113, 225); `C(114, 89); `C(115, 163); `C(116, 242);
  `C(117, 113); `C(118, 86); `C(119, 17); `C(120, 106); `C(121, 137);
  `C(122, 148); `C(123, 101); `C(124, 140); `C(125, 187); `C(126, 119);
  `C(127, 60); `C(128, 123); `C(129, 40); `C(130, 171); `C(131, 210);
  `C(132, 49); `C(133, 222); `C(134, 196); `C(135, 95); `C(136, 204);
  `C(137, 207); `C(138, 118); `C(139, 44); `C(140, 184); `C(141, 216);
  `C(142, 46); `C(143, 54); `C(144, 219); `C(145, 105); `C(146, 179);
  `C(147, 20); `C(148, 149); `C(149, 190); `C(150, 98); `C(151, 161);
  `C(152, 59); `C(153, 22); `C(154, 102); `C(155, 233); `C(156, 92);
  `C(157, 108); `C(158, 109); `C(159, 173); `C(160, 55); `C(161, 97);
  `C(162, 75); `C(163, 185); `C(164, 227); `C(165, 186); `C(166, 241);
  `C(167, 160); `C(168, 133); `C(169, 131); `C(170, 218); `C(171, 71);
  `C(172, 197); `C(173, 176); `C(174, 51); `C(175, 250); `C(176, 150);
  `C(177, 111); `C(178, 110); `C(179, 194); `C(180, 246); `C(181, 80);
  `C(182, 255); `C(183, 93); `C(184, 169); `C(185, 142); `C(186, 23);
  `C(187, 27); `C(188, 151); `C(189, 125); `C(190, 236); `C(191, 88);
  `C(192, 247); `C(193, 31); `C(194, 251); `C(195, 124); `C(196, 9);
  `C(197, 13); `C(198, 122); `C(199, 103); `C(200, 69); `C(201, 135);
  `C(202, 220); `C(203, 232); `C(204, 79); `C(205, 29); `C(206, 78);
  `C(207, 4); `C(208, 235); `C(209, 248); `C(210, 243); `C(211, 62);
  `C(212, 61); `C(213, 189); `C(214, 138); `C(215, 136); `C(216, 221);
  `C(217, 205); `C(218, 11); `C(219, 19); `C(220, 152); `C(221, 2);
  `C(222, 147); `C(223, 128); `C(224, 144); `C(225, 208); `C(226, 36);
  `C(227, 52); `C(228, 203); `C(229, 237); `C(230, 244); `C(231, 206);
  `C(232, 153); `C(233, 16); `C(234, 68); `C(235, 64); `C(236, 146);
  `C(237, 58); `C(238, 1); `C(239, 38); `C(240, 18); `C(241, 26);
  `C(242, 72); `C(243, 104); `C(244, 245); `C(245, 129); `C(246, 139);
  `C(247, 199); `C(248, 214); `C(249, 32); `C(250, 10); `C(251, 8);
  `C(252, 0); `C(253, 76); `C(254, 215); `C(255, 116); 

  `undef C
  `define C(ind, val) assign tab[ind] = 8'd``val
  wire [7:0] tab [255:0];
  `C(0, 252); `C(1, 238); `C(2, 221); `C(3, 17); `C(4, 207); `C(5, 110);
  `C(6, 49);  `C(7, 22); `C(8, 251); `C(9, 196); `C(10, 250); `C(11, 218);
  `C(12, 35); `C(13, 197); `C(14, 4); `C(15, 77); `C(16, 233); `C(17, 119);
  `C(18, 240); `C(19, 219); `C(20, 147); `C(21, 46); `C(22, 153); `C(23, 186);
  `C(24, 23); `C(25, 54); `C(26, 241); `C(27, 187); `C(28, 20); `C(29, 205);
  `C(30, 95); `C(31, 193); `C(32, 249); `C(33, 24); `C(34, 101); `C(35, 90);
  `C(36, 226); `C(37, 92); `C(38, 239); `C(39, 33); `C(40, 129); `C(41, 28);
  `C(42, 60); `C(43, 66); `C(44, 139); `C(45, 1); `C(46, 142); `C(47, 79);
  `C(48, 5); `C(49, 132); `C(50, 2); `C(51, 174); `C(52, 227); `C(53, 106);
  `C(54, 143); `C(55, 160); `C(56, 6); `C(57, 11); `C(58, 237); `C(59, 152);
  `C(60, 127); `C(61, 212); `C(62, 211); `C(63, 31); `C(64, 235); `C(65, 52);
  `C(66, 44); `C(67, 81); `C(68, 234); `C(69, 200); `C(70, 72); `C(71, 171);
  `C(72, 242); `C(73, 42); `C(74, 104); `C(75, 162); `C(76, 253); `C(77, 58);
  `C(78, 206); `C(79, 204); `C(80, 181); `C(81, 112); `C(82, 14); `C(83, 86);
  `C(84, 8);  `C(85, 12); `C(86, 118); `C(87, 18); `C(88, 191); `C(89, 114);
  `C(90, 19); `C(91, 71); `C(92, 156); `C(93, 183); `C(94, 93); `C(95, 135);
  `C(96, 21); `C(97, 161); `C(98, 150); `C(99, 41); `C(100, 16); `C(101, 123);
  `C(102, 154); `C(103, 199); `C(104, 243); `C(105, 145); `C(106, 120);
  `C(107, 111); `C(108, 157); `C(109, 158); `C(110, 178); `C(111, 177);
  `C(112, 50); `C(113, 117); `C(114, 25); `C(115, 61); `C(116, 255);
  `C(117, 53); `C(118, 138); `C(119, 126); `C(120, 109); `C(121, 84);
  `C(122, 198); `C(123, 128); `C(124, 195); `C(125, 189); `C(126, 13);
  `C(127, 87); `C(128, 223); `C(129, 245); `C(130, 36); `C(131, 169);
  `C(132, 62); `C(133, 168); `C(134, 67); `C(135, 201); `C(136, 215);
  `C(137, 121); `C(138, 214); `C(139, 246); `C(140, 124); `C(141, 34);
  `C(142, 185); `C(143, 3); `C(144, 224); `C(145, 15); `C(146, 236);
  `C(147, 222); `C(148, 122); `C(149, 148); `C(150, 176); `C(151, 188);
  `C(152, 220); `C(153, 232); `C(154, 40); `C(155, 80); `C(156, 78);
  `C(157, 51); `C(158, 10); `C(159, 74); `C(160, 167); `C(161, 151);
  `C(162, 96); `C(163, 115); `C(164, 30); `C(165, 0); `C(166, 98);
  `C(167, 68); `C(168, 26); `C(169, 184); `C(170, 56); `C(171, 130);
  `C(172, 100); `C(173, 159); `C(174, 38); `C(175, 65); `C(176, 173);
  `C(177, 69); `C(178, 70); `C(179, 146); `C(180, 39); `C(181, 94);
  `C(182, 85); `C(183, 47); `C(184, 140); `C(185, 163); `C(186, 165);
  `C(187, 125); `C(188, 105); `C(189, 213); `C(190, 149); `C(191, 59);
  `C(192, 7); `C(193, 88); `C(194, 179); `C(195, 64); `C(196, 134);
  `C(197, 172); `C(198, 29); `C(199, 247); `C(200, 48); `C(201, 55);
  `C(202, 107); `C(203, 228); `C(204, 136); `C(205, 217); `C(206, 231);
  `C(207, 137); `C(208, 225); `C(209, 27); `C(210, 131); `C(211, 73);
  `C(212, 76); `C(213, 63); `C(214, 248); `C(215, 254); `C(216, 141);
  `C(217, 83); `C(218, 170); `C(219, 144); `C(220, 202); `C(221, 216);
  `C(222, 133); `C(223, 97); `C(224, 32); `C(225, 113); `C(226, 103);
  `C(227, 164); `C(228, 45); `C(229, 43); `C(230, 9); `C(231, 91);
  `C(232, 203); `C(233, 155); `C(234, 37); `C(235, 208); `C(236, 190);
  `C(237, 229); `C(238, 108); `C(239, 82); `C(240, 89); `C(241, 166);
  `C(242, 116); `C(243, 210); `C(244, 230); `C(245, 244); `C(246, 180);
  `C(247, 192); `C(248, 209); `C(249, 102); `C(250, 175); `C(251, 194);
  `C(252, 57); `C(253, 75); `C(254, 99); `C(255, 182); 

  assign out = (inv) ? invtab[in] : tab[in];
endmodule


module S(
    input wire [127:0] in,
    output wire [127:0] out
);

  parameter inv = 0;

  genvar i;
  generate
  for (i = 0; i < 128; i = i + 8) begin
    tablePermut #(.inv(inv)) inst(.in(in[i + 7 : i]), .out(out[i + 7 : i]));
  end
  endgenerate

endmodule

module galois8Mul(
    input wire [7:0] left,
    input wire [7:0] right,
    output wire [7:0] result
);

  wire [7:0] iters [8:0];
  assign iters[0] = 0;
  wire [7:0] left_iters [7:0];
  assign left_iters[0] = left;
  wire [7:0] right_iters [7:0];
  assign right_iters[0] = right;

  genvar i;
  generate
  for (i = 0; i < 7; i = i + 1) begin

    assign iters[i + 1] = iters[i] ^ (right_iters[i][0] ? left_iters[i] : 0);

    assign left_iters[i + 1] = (left_iters[i] << 1) ^ (left_iters[i][7] ? 8'd195 : 0);

    assign right_iters[i + 1] = right_iters[i] >> 1;

  end
  endgenerate

  assign iters[8] = iters[7] ^ (right_iters[7][0] ? left_iters[7] : 0);

  assign result = iters[8];

endmodule

module LGalois(
    input wire [127:0] in,
    output wire [7:0] out
);

  wire [7:0] consts [15:0];
  assign consts[0] = 8'd148; assign consts[1] = 8'd32;
  assign consts[2] = 8'd133; assign consts[3] = 8'd16;
  assign consts[4] = 8'd194; assign consts[5] = 8'd192;
  assign consts[6] = 8'd1; assign consts[7] = 8'd251;
  assign consts[8] = 8'd1; assign consts[9] = 8'd192;
  assign consts[10] = 8'd194; assign consts[11] = 8'd16;
  assign consts[12] = 8'd133; assign consts[13] = 8'd32;
  assign consts[14] = 8'd148; assign consts[15] = 8'd1;

  wire [7:0] iters [16:0];

  assign iters[0] = 0;
  genvar i;
  generate
  for (i = 0; i < 16; i = i + 1) begin
    wire [7:0] mul_out;
    galois8Mul inst(
        .left(consts[i]),
        .right(in[127 - 8 * i : 120 - 8 * i]),
        .result(mul_out)
    );
    assign iters[i + 1] = iters[i] ^ mul_out;
  end
  endgenerate

  assign out = iters[16];

endmodule

module R(
    input wire [127:0] in,
    output wire [127:0] out
);

  parameter inv = 0;

  wire [7:0] l_galois_o;
  if (inv) begin
    LGalois ins(.in({in[119:0], in[127:120]}), .out(l_galois_o));
    assign out = {in[119:0], l_galois_o};
    
  end else begin
    LGalois inst(.in(in), .out(l_galois_o));
    assign out = {l_galois_o, in[127:8]};
  end
  
endmodule

module L(
    input wire [127:0] in,
    output wire [127:0] out
);

  parameter inv = 0;

  wire [127:0] iters [16:0];
  assign iters[0] = in;
  
  genvar i;
  generate
  for (i = 0; i < 16; i = i + 1) begin
    R #(.inv(inv)) inst(.in(iters[i]), .out(iters[i + 1]));
  end
  endgenerate

  assign out = iters[16];

endmodule

module XSL(
    input wire [127:0] key,
    input wire [127:0] value,
    output wire [127:0] out
);

  wire [127:0] added_key = key ^ value;

  wire [127:0] permut;
  S s_inst(.in(added_key), .out(permut));
  L l_inst(.in(permut), .out(out));

endmodule

module LSX(
    input wire [127:0] key,
    input wire [127:0] value,
    output wire [127:0] out
);

  wire [127:0] l_result;
  wire [127:0] permut;

  L #(.inv(1)) l_inst(.in(value), .out(l_result));
  S #(.inv(1)) s_inst(.in(l_result), .out(permut));

  assign out = key ^ permut; 

endmodule

module F(
    input wire [127:0] constVal,
    input wire [127:0] left_i,
    input wire [127:0] right_i,
    output wire [127:0] left_o,
    output wire [127:0] right_o
);

  wire [127:0] xsl_o;
  XSL xsl(.key(constVal), .value(left_i), .out(xsl_o));
  assign left_o = xsl_o ^ right_i;
  assign right_o = left_i;

endmodule

module getConsts(
    output wire [4095:0] consts
);
  assign consts[127:0]     = 128'h6ea276726c487ab85d27bd10dd849401;
  assign consts[255:128]   = 128'hdc87ece4d890f4b3ba4eb92079cbeb02;
  assign consts[383:256]   = 128'hb2259a96b4d88e0be7690430a44f7f03;
  assign consts[511:384]   = 128'h7bcd1b0b73e32ba5b79cb140f2551504;
  assign consts[639:512]   = 128'h156f6d791fab511deabb0c502fd18105;
  assign consts[767:640]   = 128'ha74af7efab73df160dd208608b9efe06;
  assign consts[895:768]   = 128'hc9e8819dc73ba5ae50f5b570561a6a07;
  assign consts[1023:896]  = 128'hf6593616e6055689adfba18027aa2a08;
  assign consts[1151:1024] = 128'h98fb40648a4d2c31f0dc1c90fa2ebe09;
  assign consts[1279:1152] = 128'h2adedaf23e95a23a17b518a05e61c10a;
  assign consts[1407:1280] = 128'h447cac8052ddd8824a92a5b083e5550b;
  assign consts[1535:1408] = 128'h8d942d1d95e67d2c1a6710c0d5ff3f0c;
  assign consts[1663:1536] = 128'he3365b6ff9ae07944740add0087bab0d;
  assign consts[1791:1664] = 128'h5113c1f94d76899fa029a9e0ac34d40e;
  assign consts[1919:1792] = 128'h3fb1b78b213ef327fd0e14f071b0400f;
  assign consts[2047:1920] = 128'h2fb26c2c0f0aacd1993581c34e975410;
  assign consts[2175:2048] = 128'h41101a5e6342d669c4123cd39313c011;
  assign consts[2303:2176] = 128'hf33580c8d79a5862237b38e3375cbf12;
  assign consts[2431:2304] = 128'h9d97f6babbd222da7e5c85f3ead82b13;
  assign consts[2559:2432] = 128'h547f77277ce987742ea93083bcc24114;
  assign consts[2687:2560] = 128'h3add015510a1fdcc738e8d936146d515;
  assign consts[2815:2688] = 128'h88f89bc3a47973c794e789a3c509aa16;
  assign consts[2943:2816] = 128'he65aedb1c831097fc9c034b3188d3e17;
  assign consts[3071:2944] = 128'hd9eb5a3ae90ffa5834ce2043693d7e18;
  assign consts[3199:3072] = 128'hb7492c48854780e069e99d53b4b9ea19;
  assign consts[3327:3200] = 128'h056cb6de319f0eeb8e80996310f6951a;
  assign consts[3455:3328] = 128'h6bcec0ac5dd77453d3a72473cd72011b;
  assign consts[3583:3456] = 128'ha22641319aecd1fd835291039b686b1c;
  assign consts[3711:3584] = 128'hcc843743f6a4ab45de752c1346ecff1d;
  assign consts[3839:3712] = 128'h7ea1add5427c254e391c2823e2a3801e;
  assign consts[3967:3840] = 128'h1003dba72e345ff6643b95333f27141f;
  assign consts[4095:3968] = 128'h5ea7d8581e149b61f16ac1459ceda820;

endmodule

module genKeyPair(
    input wire [127:0] left_i,
    input wire [127:0] right_i,
    input wire [1023:0] consts,
    output wire [127:0] left_o,
    output wire [127:0] right_o
);

  wire [127:0] left_iters [8:0];
  assign left_iters[0] = left_i;
  wire [127:0] right_iters [8:0];
  assign right_iters[0] = right_i;

  genvar i;
  generate
  for (i = 0; i < 8; i = i + 1) begin
    F f_inst(
        .constVal(consts[128 * i + 127 : 128 * i]),
        .left_i(left_iters[i]),
        .right_i(right_iters[i]),
        .left_o(left_iters[i + 1]),
        .right_o(right_iters[i + 1])
    );
  end
  endgenerate

  assign left_o = left_iters[8];
  assign right_o = right_iters[8];

endmodule

module genKeys(
    input wire [255:0] key,
    output wire [1279:0] keys
);

  wire [4095:0] consts;
  getConsts consts_inst(.consts(consts));

  assign keys[127:0] = key[255:128];
  assign keys[255:128] = key[127:0];

  genvar i;
  generate
  for (i = 0; i < 4; i = i + 1) begin
    genKeyPair inst(
        .left_i(keys[128 * (2 * i) + 127 : 128 * (2 * i)]),
        .right_i(keys[128 * (2 * i + 1) + 127 : 128 * (2 * i + 1)]),
        .consts(consts[1024 * i + 1023 : 1024 * i]),
        .left_o(keys[128 * (2 * (i + 1)) + 127 : 128 * (2 * (i + 1))]),
        .right_o(keys[128 * (2 * (i + 1) + 1) + 127 : 128 * (2 * (i + 1) + 1)])
    );
  end
  endgenerate
endmodule

module KuznechikDecoder(
    input wire [127:0] encoded,
    input wire [255:0] key,
    output wire [127:0] block
);

  wire [1279:0] keys;
  genKeys k_instance(.key(key), .keys(keys));

  wire [127:0] rounds [9:0];
  assign rounds[0] = encoded ^ keys[1279:1152];

  genvar i;
  generate
  for (i = 8; i >= 0; i = i - 1) begin
    LSX inst(
        .key(keys[128 * i + 127 : 128 * i]),
	.value(rounds[8 - i]),
	.out(rounds[9 - i])
    );
  end
  endgenerate

  assign block = rounds[9];
endmodule
