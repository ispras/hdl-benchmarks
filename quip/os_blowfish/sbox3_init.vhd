-- "blowfishvhdl" is a free synthesizable VHDL Blowfish implementation
-- Copyright (C) 2000  Wesley J. Landaker <wjl@mindless.com>

-- Speed and Size Optimizations: 14/Mar/2004
-- Paul Metzgen <pmetzgen@altera.com>  

-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

-- See http://blowfishvhdl.sourceforge.net for more information.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY sbox3_init IS
PORT (
	address : IN     std_logic_vector(7 downto 0);
	data    : INOUT std_logic_vector(31 downto 0)
);
END sbox3_init;

ARCHITECTURE fishy OF sbox3_init IS
	TYPE sbox_data IS ARRAY (0 to 255) OF std_logic_vector(31 downto 0); 
	SIGNAL contents : sbox_data;
BEGIN

	data <= contents(TO_INTEGER(UNSIGNED(address)));

	contents(0 ) <= x"3a39ce37";
	contents(1 ) <= x"d3faf5cf";
	contents(2 ) <= x"abc27737";
	contents(3 ) <= x"5ac52d1b";
	contents(4 ) <= x"5cb0679e";
	contents(5 ) <= x"4fa33742";
	contents(6 ) <= x"d3822740";
	contents(7 ) <= x"99bc9bbe";
	contents(8 ) <= x"d5118e9d";
	contents(9 ) <= x"bf0f7315";
	contents(10) <= x"d62d1c7e";
	contents(11) <= x"c700c47b";
	contents(12) <= x"b78c1b6b";
	contents(13) <= x"21a19045";
	contents(14) <= x"b26eb1be";
	contents(15) <= x"6a366eb4";
	contents(16) <= x"5748ab2f";
	contents(17) <= x"bc946e79";
	contents(18) <= x"c6a376d2";
	contents(19) <= x"6549c2c8";
	contents(20) <= x"530ff8ee";
	contents(21) <= x"468dde7d";
	contents(22) <= x"d5730a1d";
	contents(23) <= x"4cd04dc6";
	contents(24) <= x"2939bbdb";
	contents(25) <= x"a9ba4650";
	contents(26) <= x"ac9526e8";
	contents(27) <= x"be5ee304";
	contents(28) <= x"a1fad5f0";
	contents(29) <= x"6a2d519a";
	contents(30) <= x"63ef8ce2";
	contents(31) <= x"9a86ee22";
	contents(32) <= x"c089c2b8";
	contents(33) <= x"43242ef6";
	contents(34) <= x"a51e03aa";
	contents(35) <= x"9cf2d0a4";
	contents(36) <= x"83c061ba";
	contents(37) <= x"9be96a4d";
	contents(38) <= x"8fe51550";
	contents(39) <= x"ba645bd6";
	contents(40) <= x"2826a2f9";
	contents(41) <= x"a73a3ae1";
	contents(42) <= x"4ba99586";
	contents(43) <= x"ef5562e9";
	contents(44) <= x"c72fefd3";
	contents(45) <= x"f752f7da";
	contents(46) <= x"3f046f69";
	contents(47) <= x"77fa0a59";
	contents(48) <= x"80e4a915";
	contents(49) <= x"87b08601";
	contents(50) <= x"9b09e6ad";
	contents(51) <= x"3b3ee593";
	contents(52) <= x"e990fd5a";
	contents(53) <= x"9e34d797";
	contents(54) <= x"2cf0b7d9";
	contents(55) <= x"022b8b51";
	contents(56) <= x"96d5ac3a";
	contents(57) <= x"017da67d";
	contents(58) <= x"d1cf3ed6";
	contents(59) <= x"7c7d2d28";
	contents(60) <= x"1f9f25cf";
	contents(61) <= x"adf2b89b";
	contents(62) <= x"5ad6b472";
	contents(63) <= x"5a88f54c";
	contents(64) <= x"e029ac71";
	contents(65) <= x"e019a5e6";
	contents(66) <= x"47b0acfd";
	contents(67) <= x"ed93fa9b";
	contents(68) <= x"e8d3c48d";
	contents(69) <= x"283b57cc";
	contents(70) <= x"f8d56629";
	contents(71) <= x"79132e28";
	contents(72) <= x"785f0191";
	contents(73) <= x"ed756055";
	contents(74) <= x"f7960e44";
	contents(75) <= x"e3d35e8c";
	contents(76) <= x"15056dd4";
	contents(77) <= x"88f46dba";
	contents(78) <= x"03a16125";
	contents(79) <= x"0564f0bd";
	contents(80) <= x"c3eb9e15";
	contents(81) <= x"3c9057a2";
	contents(82) <= x"97271aec";
	contents(83) <= x"a93a072a";
	contents(84) <= x"1b3f6d9b";
	contents(85) <= x"1e6321f5";
	contents(86) <= x"f59c66fb";
	contents(87) <= x"26dcf319";
	contents(88) <= x"7533d928";
	contents(89) <= x"b155fdf5";
	contents(90) <= x"03563482";
	contents(91) <= x"8aba3cbb";
	contents(92) <= x"28517711";
	contents(93) <= x"c20ad9f8";
	contents(94) <= x"abcc5167";
	contents(95) <= x"ccad925f";
	contents(96) <= x"4de81751";
	contents(97) <= x"3830dc8e";
	contents(98) <= x"379d5862";
	contents(99) <= x"9320f991";
	contents(100) <= x"ea7a90c2";
	contents(101) <= x"fb3e7bce";
	contents(102) <= x"5121ce64";
	contents(103) <= x"774fbe32";
	contents(104) <= x"a8b6e37e";
	contents(105) <= x"c3293d46";
	contents(106) <= x"48de5369";
	contents(107) <= x"6413e680";
	contents(108) <= x"a2ae0810";
	contents(109) <= x"dd6db224";
	contents(110) <= x"69852dfd";
	contents(111) <= x"09072166";
	contents(112) <= x"b39a460a";
	contents(113) <= x"6445c0dd";
	contents(114) <= x"586cdecf";
	contents(115) <= x"1c20c8ae";
	contents(116) <= x"5bbef7dd";
	contents(117) <= x"1b588d40";
	contents(118) <= x"ccd2017f";
	contents(119) <= x"6bb4e3bb";
	contents(120) <= x"dda26a7e";
	contents(121) <= x"3a59ff45";
	contents(122) <= x"3e350a44";
	contents(123) <= x"bcb4cdd5";
	contents(124) <= x"72eacea8";
	contents(125) <= x"fa6484bb";
	contents(126) <= x"8d6612ae";
	contents(127) <= x"bf3c6f47";
	contents(128) <= x"d29be463";
	contents(129) <= x"542f5d9e";
	contents(130) <= x"aec2771b";
	contents(131) <= x"f64e6370";
	contents(132) <= x"740e0d8d";
	contents(133) <= x"e75b1357";
	contents(134) <= x"f8721671";
	contents(135) <= x"af537d5d";
	contents(136) <= x"4040cb08";
	contents(137) <= x"4eb4e2cc";
	contents(138) <= x"34d2466a";
	contents(139) <= x"0115af84";
	contents(140) <= x"e1b00428";
	contents(141) <= x"95983a1d";
	contents(142) <= x"06b89fb4";
	contents(143) <= x"ce6ea048";
	contents(144) <= x"6f3f3b82";
	contents(145) <= x"3520ab82";
	contents(146) <= x"011a1d4b";
	contents(147) <= x"277227f8";
	contents(148) <= x"611560b1";
	contents(149) <= x"e7933fdc";
	contents(150) <= x"bb3a792b";
	contents(151) <= x"344525bd";
	contents(152) <= x"a08839e1";
	contents(153) <= x"51ce794b";
	contents(154) <= x"2f32c9b7";
	contents(155) <= x"a01fbac9";
	contents(156) <= x"e01cc87e";
	contents(157) <= x"bcc7d1f6";
	contents(158) <= x"cf0111c3";
	contents(159) <= x"a1e8aac7";
	contents(160) <= x"1a908749";
	contents(161) <= x"d44fbd9a";
	contents(162) <= x"d0dadecb";
	contents(163) <= x"d50ada38";
	contents(164) <= x"0339c32a";
	contents(165) <= x"c6913667";
	contents(166) <= x"8df9317c";
	contents(167) <= x"e0b12b4f";
	contents(168) <= x"f79e59b7";
	contents(169) <= x"43f5bb3a";
	contents(170) <= x"f2d519ff";
	contents(171) <= x"27d9459c";
	contents(172) <= x"bf97222c";
	contents(173) <= x"15e6fc2a";
	contents(174) <= x"0f91fc71";
	contents(175) <= x"9b941525";
	contents(176) <= x"fae59361";
	contents(177) <= x"ceb69ceb";
	contents(178) <= x"c2a86459";
	contents(179) <= x"12baa8d1";
	contents(180) <= x"b6c1075e";
	contents(181) <= x"e3056a0c";
	contents(182) <= x"10d25065";
	contents(183) <= x"cb03a442";
	contents(184) <= x"e0ec6e0e";
	contents(185) <= x"1698db3b";
	contents(186) <= x"4c98a0be";
	contents(187) <= x"3278e964";
	contents(188) <= x"9f1f9532";
	contents(189) <= x"e0d392df";
	contents(190) <= x"d3a0342b";
	contents(191) <= x"8971f21e";
	contents(192) <= x"1b0a7441";
	contents(193) <= x"4ba3348c";
	contents(194) <= x"c5be7120";
	contents(195) <= x"c37632d8";
	contents(196) <= x"df359f8d";
	contents(197) <= x"9b992f2e";
	contents(198) <= x"e60b6f47";
	contents(199) <= x"0fe3f11d";
	contents(200) <= x"e54cda54";
	contents(201) <= x"1edad891";
	contents(202) <= x"ce6279cf";
	contents(203) <= x"cd3e7e6f";
	contents(204) <= x"1618b166";
	contents(205) <= x"fd2c1d05";
	contents(206) <= x"848fd2c5";
	contents(207) <= x"f6fb2299";
	contents(208) <= x"f523f357";
	contents(209) <= x"a6327623";
	contents(210) <= x"93a83531";
	contents(211) <= x"56cccd02";
	contents(212) <= x"acf08162";
	contents(213) <= x"5a75ebb5";
	contents(214) <= x"6e163697";
	contents(215) <= x"88d273cc";
	contents(216) <= x"de966292";
	contents(217) <= x"81b949d0";
	contents(218) <= x"4c50901b";
	contents(219) <= x"71c65614";
	contents(220) <= x"e6c6c7bd";
	contents(221) <= x"327a140a";
	contents(222) <= x"45e1d006";
	contents(223) <= x"c3f27b9a";
	contents(224) <= x"c9aa53fd";
	contents(225) <= x"62a80f00";
	contents(226) <= x"bb25bfe2";
	contents(227) <= x"35bdd2f6";
	contents(228) <= x"71126905";
	contents(229) <= x"b2040222";
	contents(230) <= x"b6cbcf7c";
	contents(231) <= x"cd769c2b";
	contents(232) <= x"53113ec0";
	contents(233) <= x"1640e3d3";
	contents(234) <= x"38abbd60";
	contents(235) <= x"2547adf0";
	contents(236) <= x"ba38209c";
	contents(237) <= x"f746ce76";
	contents(238) <= x"77afa1c5";
	contents(239) <= x"20756060";
	contents(240) <= x"85cbfe4e";
	contents(241) <= x"8ae88dd8";
	contents(242) <= x"7aaaf9b0";
	contents(243) <= x"4cf9aa7e";
	contents(244) <= x"1948c25c";
	contents(245) <= x"02fb8a8c";
	contents(246) <= x"01c36ae4";
	contents(247) <= x"d6ebe1f9";
	contents(248) <= x"90d4f869";
	contents(249) <= x"a65cdea0";
	contents(250) <= x"3f09252d";
	contents(251) <= x"c208e69f";
	contents(252) <= x"b74e6132";
	contents(253) <= x"ce77e25b";
	contents(254) <= x"578fdfe3";
	contents(255) <= x"3ac372e6";
  
END;
