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

ENTITY sbox0_init IS
PORT (
	address : IN     std_logic_vector(7 downto 0);
	data    : INOUT std_logic_vector(31 downto 0)
);
END sbox0_init;

ARCHITECTURE fishy OF sbox0_init IS
	TYPE sbox_data IS ARRAY (0 to 255) OF std_logic_vector(31 downto 0); 
	SIGNAL contents : sbox_data;
BEGIN

	data <= contents(TO_INTEGER(UNSIGNED(address)));

	contents(0 ) <= x"d1310ba6";
	contents(1 ) <= x"98dfb5ac";
	contents(2 ) <= x"2ffd72db";
	contents(3 ) <= x"d01adfb7";
	contents(4 ) <= x"b8e1afed";
	contents(5 ) <= x"6a267e96";
	contents(6 ) <= x"ba7c9045";
	contents(7 ) <= x"f12c7f99";
	contents(8 ) <= x"24a19947";
	contents(9 ) <= x"b3916cf7";
	contents(10) <= x"0801f2e2";
	contents(11) <= x"858efc16";
	contents(12) <= x"636920d8";
	contents(13) <= x"71574e69";
	contents(14) <= x"a458fea3";
	contents(15) <= x"f4933d7e";
	contents(16) <= x"0d95748f";
	contents(17) <= x"728eb658";
	contents(18) <= x"718bcd58";
	contents(19) <= x"82154aee";
	contents(20) <= x"7b54a41d";
	contents(21) <= x"c25a59b5";
	contents(22) <= x"9c30d539";
	contents(23) <= x"2af26013";
	contents(24) <= x"c5d1b023";
	contents(25) <= x"286085f0";
	contents(26) <= x"ca417918";
	contents(27) <= x"b8db38ef";
	contents(28) <= x"8e79dcb0";
	contents(29) <= x"603a180e";
	contents(30) <= x"6c9e0e8b";
	contents(31) <= x"b01e8a3e";
	contents(32) <= x"d71577c1";
	contents(33) <= x"bd314b27";
	contents(34) <= x"78af2fda";
	contents(35) <= x"55605c60";
	contents(36) <= x"e65525f3";
	contents(37) <= x"aa55ab94";
	contents(38) <= x"57489862";
	contents(39) <= x"63e81440";
	contents(40) <= x"55ca396a";
	contents(41) <= x"2aab10b6";
	contents(42) <= x"b4cc5c34";
	contents(43) <= x"1141e8ce";
	contents(44) <= x"a15486af";
	contents(45) <= x"7c72e993";
	contents(46) <= x"b3ee1411";
	contents(47) <= x"636fbc2a";
	contents(48) <= x"2ba9c55d";
	contents(49) <= x"741831f6";
	contents(50) <= x"ce5c3e16";
	contents(51) <= x"9b87931e";
	contents(52) <= x"afd6ba33";
	contents(53) <= x"6c24cf5c";
	contents(54) <= x"7a325381";
	contents(55) <= x"28958677";
	contents(56) <= x"3b8f4898";
	contents(57) <= x"6b4bb9af";
	contents(58) <= x"c4bfe81b";
	contents(59) <= x"66282193";
	contents(60) <= x"61d809cc";
	contents(61) <= x"fb21a991";
	contents(62) <= x"487cac60";
	contents(63) <= x"5dec8032";
	contents(64) <= x"ef845d5d";
	contents(65) <= x"e98575b1";
	contents(66) <= x"dc262302";
	contents(67) <= x"eb651b88";
	contents(68) <= x"23893e81";
	contents(69) <= x"d396acc5";
	contents(70) <= x"0f6d6ff3";
	contents(71) <= x"83f44239";
	contents(72) <= x"2e0b4482";
	contents(73) <= x"a4842004";
	contents(74) <= x"69c8f04a";
	contents(75) <= x"9e1f9b5e";
	contents(76) <= x"21c66842";
	contents(77) <= x"f6e96c9a";
	contents(78) <= x"670c9c61";
	contents(79) <= x"abd388f0";
	contents(80) <= x"6a51a0d2";
	contents(81) <= x"d8542f68";
	contents(82) <= x"960fa728";
	contents(83) <= x"ab5133a3";
	contents(84) <= x"6eef0b6c";
	contents(85) <= x"137a3be4";
	contents(86) <= x"ba3bf050";
	contents(87) <= x"7efb2a98";
	contents(88) <= x"a1f1651d";
	contents(89) <= x"39af0176";
	contents(90) <= x"66ca593e";
	contents(91) <= x"82430e88";
	contents(92) <= x"8cee8619";
	contents(93) <= x"456f9fb4";
	contents(94) <= x"7d84a5c3";
	contents(95) <= x"3b8b5ebe";
	contents(96) <= x"e06f75d8";
	contents(97) <= x"85c12073";
	contents(98) <= x"401a449f";
	contents(99) <= x"56c16aa6";
	contents(100) <= x"4ed3aa62";
	contents(101) <= x"363f7706";
	contents(102) <= x"1bfedf72";
	contents(103) <= x"429b023d";
	contents(104) <= x"37d0d724";
	contents(105) <= x"d00a1248";
	contents(106) <= x"db0fead3";
	contents(107) <= x"49f1c09b";
	contents(108) <= x"075372c9";
	contents(109) <= x"80991b7b";
	contents(110) <= x"25d479d8";
	contents(111) <= x"f6e8def7";
	contents(112) <= x"e3fe501a";
	contents(113) <= x"b6794c3b";
	contents(114) <= x"976ce0bd";
	contents(115) <= x"04c006ba";
	contents(116) <= x"c1a94fb6";
	contents(117) <= x"409f60c4";
	contents(118) <= x"5e5c9ec2";
	contents(119) <= x"196a2463";
	contents(120) <= x"68fb6faf";
	contents(121) <= x"3e6c53b5";
	contents(122) <= x"1339b2eb";
	contents(123) <= x"3b52ec6f";
	contents(124) <= x"6dfc511f";
	contents(125) <= x"9b30952c";
	contents(126) <= x"cc814544";
	contents(127) <= x"af5ebd09";
	contents(128) <= x"bee3d004";
	contents(129) <= x"de334afd";
	contents(130) <= x"660f2807";
	contents(131) <= x"192e4bb3";
	contents(132) <= x"c0cba857";
	contents(133) <= x"45c8740f";
	contents(134) <= x"d20b5f39";
	contents(135) <= x"b9d3fbdb";
	contents(136) <= x"5579c0bd";
	contents(137) <= x"1a60320a";
	contents(138) <= x"d6a100c6";
	contents(139) <= x"402c7279";
	contents(140) <= x"679f25fe";
	contents(141) <= x"fb1fa3cc";
	contents(142) <= x"8ea5e9f8";
	contents(143) <= x"db3222f8";
	contents(144) <= x"3c7516df";
	contents(145) <= x"fd616b15";
	contents(146) <= x"2f501ec8";
	contents(147) <= x"ad0552ab";
	contents(148) <= x"323db5fa";
	contents(149) <= x"fd238760";
	contents(150) <= x"53317b48";
	contents(151) <= x"3e00df82";
	contents(152) <= x"9e5c57bb";
	contents(153) <= x"ca6f8ca0";
	contents(154) <= x"1a87562e";
	contents(155) <= x"df1769db";
	contents(156) <= x"d542a8f6";
	contents(157) <= x"287effc3";
	contents(158) <= x"ac6732c6";
	contents(159) <= x"8c4f5573";
	contents(160) <= x"695b27b0";
	contents(161) <= x"bbca58c8";
	contents(162) <= x"e1ffa35d";
	contents(163) <= x"b8f011a0";
	contents(164) <= x"10fa3d98";
	contents(165) <= x"fd2183b8";
	contents(166) <= x"4afcb56c";
	contents(167) <= x"2dd1d35b";
	contents(168) <= x"9a53e479";
	contents(169) <= x"b6f84565";
	contents(170) <= x"d28e49bc";
	contents(171) <= x"4bfb9790";
	contents(172) <= x"e1ddf2da";
	contents(173) <= x"a4cb7e33";
	contents(174) <= x"62fb1341";
	contents(175) <= x"cee4c6e8";
	contents(176) <= x"ef20cada";
	contents(177) <= x"36774c01";
	contents(178) <= x"d07e9efe";
	contents(179) <= x"2bf11fb4";
	contents(180) <= x"95dbda4d";
	contents(181) <= x"ae909198";
	contents(182) <= x"eaad8e71";
	contents(183) <= x"6b93d5a0";
	contents(184) <= x"d08ed1d0";
	contents(185) <= x"afc725e0";
	contents(186) <= x"8e3c5b2f";
	contents(187) <= x"8e7594b7";
	contents(188) <= x"8ff6e2fb";
	contents(189) <= x"f2122b64";
	contents(190) <= x"8888b812";
	contents(191) <= x"900df01c";
	contents(192) <= x"4fad5ea0";
	contents(193) <= x"688fc31c";
	contents(194) <= x"d1cff191";
	contents(195) <= x"b3a8c1ad";
	contents(196) <= x"2f2f2218";
	contents(197) <= x"be0e1777";
	contents(198) <= x"ea752dfe";
	contents(199) <= x"8b021fa1";
	contents(200) <= x"e5a0cc0f";
	contents(201) <= x"b56f74e8";
	contents(202) <= x"18acf3d6";
	contents(203) <= x"ce89e299";
	contents(204) <= x"b4a84fe0";
	contents(205) <= x"fd13e0b7";
	contents(206) <= x"7cc43b81";
	contents(207) <= x"d2ada8d9";
	contents(208) <= x"165fa266";
	contents(209) <= x"80957705";
	contents(210) <= x"93cc7314";
	contents(211) <= x"211a1477";
	contents(212) <= x"e6ad2065";
	contents(213) <= x"77b5fa86";
	contents(214) <= x"c75442f5";
	contents(215) <= x"fb9d35cf";
	contents(216) <= x"ebcdaf0c";
	contents(217) <= x"7b3e89a0";
	contents(218) <= x"d6411bd3";
	contents(219) <= x"ae1e7e49";
	contents(220) <= x"00250e2d";
	contents(221) <= x"2071b35e";
	contents(222) <= x"226800bb";
	contents(223) <= x"57b8e0af";
	contents(224) <= x"2464369b";
	contents(225) <= x"f009b91e";
	contents(226) <= x"5563911d";
	contents(227) <= x"59dfa6aa";
	contents(228) <= x"78c14389";
	contents(229) <= x"d95a537f";
	contents(230) <= x"207d5ba2";
	contents(231) <= x"02e5b9c5";
	contents(232) <= x"83260376";
	contents(233) <= x"6295cfa9";
	contents(234) <= x"11c81968";
	contents(235) <= x"4e734a41";
	contents(236) <= x"b3472dca";
	contents(237) <= x"7b14a94a";
	contents(238) <= x"1b510052";
	contents(239) <= x"9a532915";
	contents(240) <= x"d60f573f";
	contents(241) <= x"bc9bc6e4";
	contents(242) <= x"2b60a476";
	contents(243) <= x"81e67400";
	contents(244) <= x"08ba6fb5";
	contents(245) <= x"571be91f";
	contents(246) <= x"f296ec6b";
	contents(247) <= x"2a0dd915";
	contents(248) <= x"b6636521";
	contents(249) <= x"e7b9f9b6";
	contents(250) <= x"ff34052e";
	contents(251) <= x"c5855664";
	contents(252) <= x"53b02d5d";
	contents(253) <= x"a99f8fa1";
	contents(254) <= x"08ba4799";
	contents(255) <= x"6e85076a";

END;
