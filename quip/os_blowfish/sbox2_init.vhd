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

ENTITY sbox2_init IS
PORT (
	address : IN     std_logic_vector(7 downto 0);
	data    : INOUT std_logic_vector(31 downto 0)
);
END sbox2_init;

ARCHITECTURE fishy OF sbox2_init IS
	TYPE sbox_data IS ARRAY (0 to 255) OF std_logic_vector(31 downto 0); 
	SIGNAL contents : sbox_data;
BEGIN

	data <= contents(TO_INTEGER(UNSIGNED(address)));

	contents(0 ) <= x"e93d5a68";
	contents(1 ) <= x"948140f7";
	contents(2 ) <= x"f64c261c";
	contents(3 ) <= x"94692934";
	contents(4 ) <= x"411520f7";
	contents(5 ) <= x"7602d4f7";
	contents(6 ) <= x"bcf46b2e";
	contents(7 ) <= x"d4a20068";
	contents(8 ) <= x"d4082471";
	contents(9 ) <= x"3320f46a";
	contents(10) <= x"43b7d4b7";
	contents(11) <= x"500061af";
	contents(12) <= x"1e39f62e";
	contents(13) <= x"97244546";
	contents(14) <= x"14214f74";
	contents(15) <= x"bf8b8840";
	contents(16) <= x"4d95fc1d";
	contents(17) <= x"96b591af";
	contents(18) <= x"70f4ddd3";
	contents(19) <= x"66a02f45";
	contents(20) <= x"bfbc09ec";
	contents(21) <= x"03bd9785";
	contents(22) <= x"7fac6dd0";
	contents(23) <= x"31cb8504";
	contents(24) <= x"96eb27b3";
	contents(25) <= x"55fd3941";
	contents(26) <= x"da2547e6";
	contents(27) <= x"abca0a9a";
	contents(28) <= x"28507825";
	contents(29) <= x"530429f4";
	contents(30) <= x"0a2c86da";
	contents(31) <= x"e9b66dfb";
	contents(32) <= x"68dc1462";
	contents(33) <= x"d7486900";
	contents(34) <= x"680ec0a4";
	contents(35) <= x"27a18dee";
	contents(36) <= x"4f3ffea2";
	contents(37) <= x"e887ad8c";
	contents(38) <= x"b58ce006";
	contents(39) <= x"7af4d6b6";
	contents(40) <= x"aace1e7c";
	contents(41) <= x"d3375fec";
	contents(42) <= x"ce78a399";
	contents(43) <= x"406b2a42";
	contents(44) <= x"20fe9e35";
	contents(45) <= x"d9f385b9";
	contents(46) <= x"ee39d7ab";
	contents(47) <= x"3b124e8b";
	contents(48) <= x"1dc9faf7";
	contents(49) <= x"4b6d1856";
	contents(50) <= x"26a36631";
	contents(51) <= x"eae397b2";
	contents(52) <= x"3a6efa74";
	contents(53) <= x"dd5b4332";
	contents(54) <= x"6841e7f7";
	contents(55) <= x"ca7820fb";
	contents(56) <= x"fb0af54e";
	contents(57) <= x"d8feb397";
	contents(58) <= x"454056ac";
	contents(59) <= x"ba489527";
	contents(60) <= x"55533a3a";
	contents(61) <= x"20838d87";
	contents(62) <= x"fe6ba9b7";
	contents(63) <= x"d096954b";
	contents(64) <= x"55a867bc";
	contents(65) <= x"a1159a58";
	contents(66) <= x"cca92963";
	contents(67) <= x"99e1db33";
	contents(68) <= x"a62a4a56";
	contents(69) <= x"3f3125f9";
	contents(70) <= x"5ef47e1c";
	contents(71) <= x"9029317c";
	contents(72) <= x"fdf8e802";
	contents(73) <= x"04272f70";
	contents(74) <= x"80bb155c";
	contents(75) <= x"05282ce3";
	contents(76) <= x"95c11548";
	contents(77) <= x"e4c66d22";
	contents(78) <= x"48c1133f";
	contents(79) <= x"c70f86dc";
	contents(80) <= x"07f9c9ee";
	contents(81) <= x"41041f0f";
	contents(82) <= x"404779a4";
	contents(83) <= x"5d886e17";
	contents(84) <= x"325f51eb";
	contents(85) <= x"d59bc0d1";
	contents(86) <= x"f2bcc18f";
	contents(87) <= x"41113564";
	contents(88) <= x"257b7834";
	contents(89) <= x"602a9c60";
	contents(90) <= x"dff8e8a3";
	contents(91) <= x"1f636c1b";
	contents(92) <= x"0e12b4c2";
	contents(93) <= x"02e1329e";
	contents(94) <= x"af664fd1";
	contents(95) <= x"cad18115";
	contents(96) <= x"6b2395e0";
	contents(97) <= x"333e92e1";
	contents(98) <= x"3b240b62";
	contents(99) <= x"eebeb922";
	contents(100) <= x"85b2a20e";
	contents(101) <= x"e6ba0d99";
	contents(102) <= x"de720c8c";
	contents(103) <= x"2da2f728";
	contents(104) <= x"d0127845";
	contents(105) <= x"95b794fd";
	contents(106) <= x"647d0862";
	contents(107) <= x"e7ccf5f0";
	contents(108) <= x"5449a36f";
	contents(109) <= x"877d48fa";
	contents(110) <= x"c39dfd27";
	contents(111) <= x"f33e8d1e";
	contents(112) <= x"0a476341";
	contents(113) <= x"992eff74";
	contents(114) <= x"3a6f6eab";
	contents(115) <= x"f4f8fd37";
	contents(116) <= x"a812dc60";
	contents(117) <= x"a1ebddf8";
	contents(118) <= x"991be14c";
	contents(119) <= x"db6e6b0d";
	contents(120) <= x"c67b5510";
	contents(121) <= x"6d672c37";
	contents(122) <= x"2765d43b";
	contents(123) <= x"dcd0e804";
	contents(124) <= x"f1290dc7";
	contents(125) <= x"cc00ffa3";
	contents(126) <= x"b5390f92";
	contents(127) <= x"690fed0b";
	contents(128) <= x"667b9ffb";
	contents(129) <= x"cedb7d9c";
	contents(130) <= x"a091cf0b";
	contents(131) <= x"d9155ea3";
	contents(132) <= x"bb132f88";
	contents(133) <= x"515bad24";
	contents(134) <= x"7b9479bf";
	contents(135) <= x"763bd6eb";
	contents(136) <= x"37392eb3";
	contents(137) <= x"cc115979";
	contents(138) <= x"8026e297";
	contents(139) <= x"f42e312d";
	contents(140) <= x"6842ada7";
	contents(141) <= x"c66a2b3b";
	contents(142) <= x"12754ccc";
	contents(143) <= x"782ef11c";
	contents(144) <= x"6a124237";
	contents(145) <= x"b79251e7";
	contents(146) <= x"06a1bbe6";
	contents(147) <= x"4bfb6350";
	contents(148) <= x"1a6b1018";
	contents(149) <= x"11caedfa";
	contents(150) <= x"3d25bdd8";
	contents(151) <= x"e2e1c3c9";
	contents(152) <= x"44421659";
	contents(153) <= x"0a121386";
	contents(154) <= x"d90cec6e";
	contents(155) <= x"d5abea2a";
	contents(156) <= x"64af674e";
	contents(157) <= x"da86a85f";
	contents(158) <= x"bebfe988";
	contents(159) <= x"64e4c3fe";
	contents(160) <= x"9dbc8057";
	contents(161) <= x"f0f7c086";
	contents(162) <= x"60787bf8";
	contents(163) <= x"6003604d";
	contents(164) <= x"d1fd8346";
	contents(165) <= x"f6381fb0";
	contents(166) <= x"7745ae04";
	contents(167) <= x"d736fccc";
	contents(168) <= x"83426b33";
	contents(169) <= x"f01eab71";
	contents(170) <= x"b0804187";
	contents(171) <= x"3c005e5f";
	contents(172) <= x"77a057be";
	contents(173) <= x"bde8ae24";
	contents(174) <= x"55464299";
	contents(175) <= x"bf582e61";
	contents(176) <= x"4e58f48f";
	contents(177) <= x"f2ddfda2";
	contents(178) <= x"f474ef38";
	contents(179) <= x"8789bdc2";
	contents(180) <= x"5366f9c3";
	contents(181) <= x"c8b38e74";
	contents(182) <= x"b475f255";
	contents(183) <= x"46fcd9b9";
	contents(184) <= x"7aeb2661";
	contents(185) <= x"8b1ddf84";
	contents(186) <= x"846a0e79";
	contents(187) <= x"915f95e2";
	contents(188) <= x"466e598e";
	contents(189) <= x"20b45770";
	contents(190) <= x"8cd55591";
	contents(191) <= x"c902de4c";
	contents(192) <= x"b90bace1";
	contents(193) <= x"bb8205d0";
	contents(194) <= x"11a86248";
	contents(195) <= x"7574a99e";
	contents(196) <= x"b77f19b6";
	contents(197) <= x"e0a9dc09";
	contents(198) <= x"662d09a1";
	contents(199) <= x"c4324633";
	contents(200) <= x"e85a1f02";
	contents(201) <= x"09f0be8c";
	contents(202) <= x"4a99a025";
	contents(203) <= x"1d6efe10";
	contents(204) <= x"1ab93d1d";
	contents(205) <= x"0ba5a4df";
	contents(206) <= x"a186f20f";
	contents(207) <= x"2868f169";
	contents(208) <= x"dcb7da83";
	contents(209) <= x"573906fe";
	contents(210) <= x"a1e2ce9b";
	contents(211) <= x"4fcd7f52";
	contents(212) <= x"50115e01";
	contents(213) <= x"a70683fa";
	contents(214) <= x"a002b5c4";
	contents(215) <= x"0de6d027";
	contents(216) <= x"9af88c27";
	contents(217) <= x"773f8641";
	contents(218) <= x"c3604c06";
	contents(219) <= x"61a806b5";
	contents(220) <= x"f0177a28";
	contents(221) <= x"c0f586e0";
	contents(222) <= x"006058aa";
	contents(223) <= x"30dc7d62";
	contents(224) <= x"11e69ed7";
	contents(225) <= x"2338ea63";
	contents(226) <= x"53c2dd94";
	contents(227) <= x"c2c21634";
	contents(228) <= x"bbcbee56";
	contents(229) <= x"90bcb6de";
	contents(230) <= x"ebfc7da1";
	contents(231) <= x"ce591d76";
	contents(232) <= x"6f05e409";
	contents(233) <= x"4b7c0188";
	contents(234) <= x"39720a3d";
	contents(235) <= x"7c927c24";
	contents(236) <= x"86e3725f";
	contents(237) <= x"724d9db9";
	contents(238) <= x"1ac15bb4";
	contents(239) <= x"d39eb8fc";
	contents(240) <= x"ed545578";
	contents(241) <= x"08fca5b5";
	contents(242) <= x"d83d7cd3";
	contents(243) <= x"4dad0fc4";
	contents(244) <= x"1e50ef5e";
	contents(245) <= x"b161e6f8";
	contents(246) <= x"a28514d9";
	contents(247) <= x"6c51133c";
	contents(248) <= x"6fd5c7e7";
	contents(249) <= x"56e14ec4";
	contents(250) <= x"362abfce";
	contents(251) <= x"ddc6c837";
	contents(252) <= x"d79a3234";
	contents(253) <= x"92638212";
	contents(254) <= x"670efa8e";
	contents(255) <= x"406000e0";
  
END;
