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

ENTITY sbox1_init IS
PORT (
	address : IN     std_logic_vector(7 downto 0);
	data    : INOUT std_logic_vector(31 downto 0)
);
END sbox1_init;

ARCHITECTURE fishy OF sbox1_init IS
	TYPE sbox_data IS ARRAY (0 to 255) OF std_logic_vector(31 downto 0); 
	SIGNAL contents : sbox_data;
BEGIN

	data <= contents(TO_INTEGER(UNSIGNED(address)));

	contents(0 ) <= x"4b7a70e9";
	contents(1 ) <= x"b5b32944";
	contents(2 ) <= x"db75092e";
	contents(3 ) <= x"c4192623";
	contents(4 ) <= x"ad6ea6b0";
	contents(5 ) <= x"49a7df7d";
	contents(6 ) <= x"9cee60b8";
	contents(7 ) <= x"8fedb266";
	contents(8 ) <= x"ecaa8c71";
	contents(9 ) <= x"699a17ff";
	contents(10) <= x"5664526c";
	contents(11) <= x"c2b19ee1";
	contents(12) <= x"193602a5";
	contents(13) <= x"75094c29";
	contents(14) <= x"a0591340";
	contents(15) <= x"e4183a3e";
	contents(16) <= x"3f54989a";
	contents(17) <= x"5b429d65";
	contents(18) <= x"6b8fe4d6";
	contents(19) <= x"99f73fd6";
	contents(20) <= x"a1d29c07";
	contents(21) <= x"efe830f5";
	contents(22) <= x"4d2d38e6";
	contents(23) <= x"f0255dc1";
	contents(24) <= x"4cdd2086";
	contents(25) <= x"8470eb26";
	contents(26) <= x"6382e9c6";
	contents(27) <= x"021ecc5e";
	contents(28) <= x"09686b3f";
	contents(29) <= x"3ebaefc9";
	contents(30) <= x"3c971814";
	contents(31) <= x"6b6a70a1";
	contents(32) <= x"687f3584";
	contents(33) <= x"52a0e286";
	contents(34) <= x"b79c5305";
	contents(35) <= x"aa500737";
	contents(36) <= x"3e07841c";
	contents(37) <= x"7fdeae5c";
	contents(38) <= x"8e7d44ec";
	contents(39) <= x"5716f2b8";
	contents(40) <= x"b03ada37";
	contents(41) <= x"f0500c0d";
	contents(42) <= x"f01c1f04";
	contents(43) <= x"0200b3ff";
	contents(44) <= x"ae0cf51a";
	contents(45) <= x"3cb574b2";
	contents(46) <= x"25837a58";
	contents(47) <= x"dc0921bd";
	contents(48) <= x"d19113f9";
	contents(49) <= x"7ca92ff6";
	contents(50) <= x"94324773";
	contents(51) <= x"22f54701";
	contents(52) <= x"3ae5e581";
	contents(53) <= x"37c2dadc";
	contents(54) <= x"c8b57634";
	contents(55) <= x"9af3dda7";
	contents(56) <= x"a9446146";
	contents(57) <= x"0fd0030e";
	contents(58) <= x"ecc8c73e";
	contents(59) <= x"a4751e41";
	contents(60) <= x"e238cd99";
	contents(61) <= x"3bea0e2f";
	contents(62) <= x"3280bba1";
	contents(63) <= x"183eb331";
	contents(64) <= x"4e548b38";
	contents(65) <= x"4f6db908";
	contents(66) <= x"6f420d03";
	contents(67) <= x"f60a04bf";
	contents(68) <= x"2cb81290";
	contents(69) <= x"24977c79";
	contents(70) <= x"5679b072";
	contents(71) <= x"bcaf89af";
	contents(72) <= x"de9a771f";
	contents(73) <= x"d9930810";
	contents(74) <= x"b38bae12";
	contents(75) <= x"dccf3f2e";
	contents(76) <= x"5512721f";
	contents(77) <= x"2e6b7124";
	contents(78) <= x"501adde6";
	contents(79) <= x"9f84cd87";
	contents(80) <= x"7a584718";
	contents(81) <= x"7408da17";
	contents(82) <= x"bc9f9abc";
	contents(83) <= x"e94b7d8c";
	contents(84) <= x"ec7aec3a";
	contents(85) <= x"db851dfa";
	contents(86) <= x"63094366";
	contents(87) <= x"c464c3d2";
	contents(88) <= x"ef1c1847";
	contents(89) <= x"3215d908";
	contents(90) <= x"dd433b37";
	contents(91) <= x"24c2ba16";
	contents(92) <= x"12a14d43";
	contents(93) <= x"2a65c451";
	contents(94) <= x"50940002";
	contents(95) <= x"133ae4dd";
	contents(96) <= x"71dff89e";
	contents(97) <= x"10314e55";
	contents(98) <= x"81ac77d6";
	contents(99) <= x"5f11199b";
	contents(100) <= x"043556f1";
	contents(101) <= x"d7a3c76b";
	contents(102) <= x"3c11183b";
	contents(103) <= x"5924a509";
	contents(104) <= x"f28fe6ed";
	contents(105) <= x"97f1fbfa";
	contents(106) <= x"9ebabf2c";
	contents(107) <= x"1e153c6e";
	contents(108) <= x"86e34570";
	contents(109) <= x"eae96fb1";
	contents(110) <= x"860e5e0a";
	contents(111) <= x"5a3e2ab3";
	contents(112) <= x"771fe71c";
	contents(113) <= x"4e3d06fa";
	contents(114) <= x"2965dcb9";
	contents(115) <= x"99e71d0f";
	contents(116) <= x"803e89d6";
	contents(117) <= x"5266c825";
	contents(118) <= x"2e4cc978";
	contents(119) <= x"9c10b36a";
	contents(120) <= x"c6150eba";
	contents(121) <= x"94e2ea78";
	contents(122) <= x"a5fc3c53";
	contents(123) <= x"1e0a2df4";
	contents(124) <= x"f2f74ea7";
	contents(125) <= x"361d2b3d";
	contents(126) <= x"1939260f";
	contents(127) <= x"19c27960";
	contents(128) <= x"5223a708";
	contents(129) <= x"f71312b6";
	contents(130) <= x"ebadfe6e";
	contents(131) <= x"eac31f66";
	contents(132) <= x"e3bc4595";
	contents(133) <= x"a67bc883";
	contents(134) <= x"b17f37d1";
	contents(135) <= x"018cff28";
	contents(136) <= x"c332ddef";
	contents(137) <= x"be6c5aa5";
	contents(138) <= x"65582185";
	contents(139) <= x"68ab9802";
	contents(140) <= x"eecea50f";
	contents(141) <= x"db2f953b";
	contents(142) <= x"2aef7dad";
	contents(143) <= x"5b6e2f84";
	contents(144) <= x"1521b628";
	contents(145) <= x"29076170";
	contents(146) <= x"ecdd4775";
	contents(147) <= x"619f1510";
	contents(148) <= x"13cca830";
	contents(149) <= x"eb61bd96";
	contents(150) <= x"0334fe1e";
	contents(151) <= x"aa0363cf";
	contents(152) <= x"b5735c90";
	contents(153) <= x"4c70a239";
	contents(154) <= x"d59e9e0b";
	contents(155) <= x"cbaade14";
	contents(156) <= x"eecc86bc";
	contents(157) <= x"60622ca7";
	contents(158) <= x"9cab5cab";
	contents(159) <= x"b2f3846e";
	contents(160) <= x"648b1eaf";
	contents(161) <= x"19bdf0ca";
	contents(162) <= x"a02369b9";
	contents(163) <= x"655abb50";
	contents(164) <= x"40685a32";
	contents(165) <= x"3c2ab4b3";
	contents(166) <= x"319ee9d5";
	contents(167) <= x"c021b8f7";
	contents(168) <= x"9b540b19";
	contents(169) <= x"875fa099";
	contents(170) <= x"95f7997e";
	contents(171) <= x"623d7da8";
	contents(172) <= x"f837889a";
	contents(173) <= x"97e32d77";
	contents(174) <= x"11ed935f";
	contents(175) <= x"16681281";
	contents(176) <= x"0e358829";
	contents(177) <= x"c7e61fd6";
	contents(178) <= x"96dedfa1";
	contents(179) <= x"7858ba99";
	contents(180) <= x"57f584a5";
	contents(181) <= x"1b227263";
	contents(182) <= x"9b83c3ff";
	contents(183) <= x"1ac24696";
	contents(184) <= x"cdb30aeb";
	contents(185) <= x"532e3054";
	contents(186) <= x"8fd948e4";
	contents(187) <= x"6dbc3128";
	contents(188) <= x"58ebf2ef";
	contents(189) <= x"34c6ffea";
	contents(190) <= x"fe28ed61";
	contents(191) <= x"ee7c3c73";
	contents(192) <= x"5d4a14d9";
	contents(193) <= x"e864b7e3";
	contents(194) <= x"42105d14";
	contents(195) <= x"203e13e0";
	contents(196) <= x"45eee2b6";
	contents(197) <= x"a3aaabea";
	contents(198) <= x"db6c4f15";
	contents(199) <= x"facb4fd0";
	contents(200) <= x"c742f442";
	contents(201) <= x"ef6abbb5";
	contents(202) <= x"654f3b1d";
	contents(203) <= x"41cd2105";
	contents(204) <= x"d81e799e";
	contents(205) <= x"86854dc7";
	contents(206) <= x"e44b476a";
	contents(207) <= x"3d816250";
	contents(208) <= x"cf62a1f2";
	contents(209) <= x"5b8d2646";
	contents(210) <= x"fc8883a0";
	contents(211) <= x"c1c7b6a3";
	contents(212) <= x"7f1524c3";
	contents(213) <= x"69cb7492";
	contents(214) <= x"47848a0b";
	contents(215) <= x"5692b285";
	contents(216) <= x"095bbf00";
	contents(217) <= x"ad19489d";
	contents(218) <= x"1462b174";
	contents(219) <= x"23820e00";
	contents(220) <= x"58428d2a";
	contents(221) <= x"0c55f5ea";
	contents(222) <= x"1dadf43e";
	contents(223) <= x"233f7061";
	contents(224) <= x"3372f092";
	contents(225) <= x"8d937e41";
	contents(226) <= x"d65fecf1";
	contents(227) <= x"6c223bdb";
	contents(228) <= x"7cde3759";
	contents(229) <= x"cbee7460";
	contents(230) <= x"4085f2a7";
	contents(231) <= x"ce77326e";
	contents(232) <= x"a6078084";
	contents(233) <= x"19f8509e";
	contents(234) <= x"e8efd855";
	contents(235) <= x"61d99735";
	contents(236) <= x"a969a7aa";
	contents(237) <= x"c50c06c2";
	contents(238) <= x"5a04abfc";
	contents(239) <= x"800bcadc";
	contents(240) <= x"9e447a2e";
	contents(241) <= x"c3453484";
	contents(242) <= x"fdd56705";
	contents(243) <= x"0e1e9ec9";
	contents(244) <= x"db73dbd3";
	contents(245) <= x"105588cd";
	contents(246) <= x"675fda79";
	contents(247) <= x"e3674340";
	contents(248) <= x"c5c43465";
	contents(249) <= x"713e38d8";
	contents(250) <= x"3d28f89e";
	contents(251) <= x"f16dff20";
	contents(252) <= x"153e21e7";
	contents(253) <= x"8fb03d4a";
	contents(254) <= x"e6e39f2b";
	contents(255) <= x"db83adf7";

END;
