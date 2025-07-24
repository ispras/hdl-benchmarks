module MagmaEncoder(
  input wire [63:0] _block,
  input wire [255:0] key,
  input wire clk,
  output wire [63:0] out
);
  wire [3:0] arr5__2[16] = '{4'h5, 4'hd, 4'hf, 4'h6, 4'h9, 4'h2, 4'hc, 4'ha, 4'hb, 4'h7, 4'h8, 4'h1, 4'h4, 4'h3, 4'he, 4'h0};
  wire [3:0] arr4__3[16] = '{4'h7, 4'hf, 4'h5, 4'ha, 4'h8, 4'h1, 4'h6, 4'hd, 4'h0, 4'h9, 4'h3, 4'he, 4'hb, 4'h4, 4'h2, 4'hc};
  wire [3:0] arr3__4[16] = '{4'hc, 4'h8, 4'h2, 4'h1, 4'hd, 4'h4, 4'hf, 4'h6, 4'h7, 4'h0, 4'ha, 4'h5, 4'h3, 4'he, 4'h9, 4'hb};
  wire [3:0] arr2__5[16] = '{4'hb, 4'h3, 4'h5, 4'h8, 4'h2, 4'hf, 4'ha, 4'hd, 4'he, 4'h1, 4'h7, 4'h4, 4'hc, 4'h9, 4'h6, 4'h0};
  wire [3:0] arr1__6[16] = '{4'h6, 4'h8, 4'h2, 4'h3, 4'h9, 4'ha, 4'h5, 4'hc, 4'h1, 4'he, 4'h4, 4'h7, 4'hb, 4'hd, 4'h0, 4'hf};
  wire [3:0] arr0__7[16] = '{4'hc, 4'h4, 4'h6, 4'h2, 4'ha, 4'h5, 4'hb, 4'h9, 4'he, 4'h8, 4'hd, 4'h7, 4'h0, 4'h3, 4'hf, 4'h1};
  wire [3:0] arr7[16] = '{4'h1, 4'h7, 4'he, 4'hd, 4'h0, 4'h5, 4'h8, 4'h3, 4'h4, 4'hf, 4'ha, 4'h6, 4'h9, 4'hc, 4'hb, 4'h2};
  wire [3:0] arr6__1[16] = '{4'h8, 4'he, 4'h2, 4'h5, 4'h6, 4'h9, 4'h1, 4'hc, 4'hf, 4'h4, 4'hb, 4'h0, 4'hd, 4'ha, 4'h3, 4'h7};
  wire [31:0] sum;
  wire [31:0] sum__1;
  wire [31:0] sum__2;
  wire [31:0] sum__3;
  wire [31:0] sum__4;
  wire [31:0] sum__5;
  wire [31:0] sum__6;
  wire [31:0] sum__7;
  wire [31:0] sum__8;
  wire [31:0] sum__9;
  wire [31:0] sum__10;
  wire [31:0] sum__11;
  wire [31:0] sum__12;
  wire [31:0] sum__13;
  wire [31:0] sum__14;
  wire [31:0] sum__15;
  wire [31:0] sum__16;
  wire [31:0] sum__17;
  wire [31:0] sum__18;
  wire [31:0] sum__19;
  wire [31:0] sum__20;
  wire [31:0] sum__21;
  wire [31:0] sum__22;
  wire [31:0] sum__23;
  wire [31:0] sum__24;
  wire [31:0] sum__25;
  wire [31:0] sum__26;
  wire [31:0] sum__27;
  wire [31:0] sum__28;
  wire [31:0] sum__29;
  wire [31:0] sum__30;
  wire [31:0] sum__31;
  wire [3:0] array_index_14028;
  wire [3:0] array_index_13998;
  wire [3:0] subst0__1;
  wire [3:0] array_index_14072;
  wire [3:0] subst0;
  wire [3:0] array_index_14050;
  wire [31:0] currRight;
  wire [31:0] shifted__1;
  wire [3:0] subst0__3;
  wire [3:0] array_index_14116;
  wire [31:0] currLeft;
  wire [31:0] shifted;
  wire [3:0] subst0__2;
  wire [3:0] array_index_14094;
  wire [31:0] oldRight__2;
  wire [31:0] shifted__3;
  wire [3:0] subst0__5;
  wire [3:0] array_index_14160;
  wire [31:0] oldRight__1;
  wire [31:0] shifted__2;
  wire [3:0] subst0__4;
  wire [3:0] array_index_14138;
  wire [31:0] oldRight__4;
  wire [31:0] shifted__5;
  wire [3:0] subst0__7;
  wire [3:0] array_index_14202;
  wire [31:0] oldRight__3;
  wire [31:0] shifted__4;
  wire [3:0] subst0__6;
  wire [3:0] array_index_14181;
  wire [31:0] oldRight__6;
  wire [31:0] shifted__7;
  wire [3:0] subst0__9;
  wire [3:0] array_index_14244;
  wire [31:0] oldRight__5;
  wire [31:0] shifted__6;
  wire [3:0] subst0__8;
  wire [3:0] array_index_14223;
  wire [31:0] oldRight__8;
  wire [31:0] shifted__9;
  wire [3:0] subst0__11;
  wire [3:0] array_index_14286;
  wire [31:0] oldRight__7;
  wire [31:0] shifted__8;
  wire [3:0] subst0__10;
  wire [3:0] array_index_14265;
  wire [31:0] oldRight__10;
  wire [31:0] shifted__11;
  wire [3:0] subst0__13;
  wire [3:0] array_index_14328;
  wire [31:0] oldRight__9;
  wire [31:0] shifted__10;
  wire [3:0] subst0__12;
  wire [3:0] array_index_14307;
  wire [31:0] oldRight__12;
  wire [31:0] shifted__13;
  wire [3:0] subst0__15;
  wire [3:0] array_index_14370;
  wire [31:0] oldRight__11;
  wire [31:0] shifted__12;
  wire [3:0] subst0__14;
  wire [3:0] array_index_14349;
  wire [31:0] oldRight__14;
  wire [31:0] shifted__15;
  wire [3:0] subst0__17;
  wire [3:0] array_index_14412;
  wire [31:0] oldRight__13;
  wire [31:0] shifted__14;
  wire [3:0] subst0__16;
  wire [3:0] array_index_14391;
  wire [31:0] oldRight__16;
  wire [31:0] shifted__17;
  wire [3:0] subst0__19;
  wire [3:0] array_index_14454;
  wire [31:0] oldRight__15;
  wire [31:0] shifted__16;
  wire [3:0] subst0__18;
  wire [3:0] array_index_14433;
  wire [31:0] oldRight__18;
  wire [31:0] shifted__19;
  wire [3:0] subst0__21;
  wire [3:0] array_index_14496;
  wire [31:0] oldRight__17;
  wire [31:0] shifted__18;
  wire [3:0] subst0__20;
  wire [3:0] array_index_14475;
  wire [31:0] oldRight__20;
  wire [31:0] shifted__21;
  wire [3:0] subst0__23;
  wire [3:0] array_index_14538;
  wire [31:0] oldRight__19;
  wire [31:0] shifted__20;
  wire [3:0] subst0__22;
  wire [3:0] array_index_14517;
  wire [31:0] oldRight__22;
  wire [31:0] shifted__23;
  wire [3:0] subst0__25;
  wire [3:0] array_index_14580;
  wire [31:0] oldRight__21;
  wire [31:0] shifted__22;
  wire [3:0] subst0__24;
  wire [3:0] array_index_14559;
  wire [31:0] oldRight__24;
  wire [31:0] shifted__25;
  wire [3:0] subst0__27;
  wire [3:0] array_index_14622;
  wire [31:0] oldRight__23;
  wire [31:0] shifted__24;
  wire [3:0] subst0__26;
  wire [3:0] array_index_14601;
  wire [31:0] oldRight__26;
  wire [31:0] shifted__27;
  wire [3:0] subst0__29;
  wire [3:0] array_index_14664;
  wire [31:0] oldRight__25;
  wire [31:0] shifted__26;
  wire [3:0] subst0__28;
  wire [3:0] array_index_14643;
  wire [31:0] oldRight__28;
  wire [31:0] shifted__29;
  wire [3:0] subst0__31;
  wire [31:0] oldRight__27;
  wire [31:0] shifted__28;
  wire [3:0] subst0__30;
  wire [31:0] oldRight__30;
  wire [31:0] shifted__31;
  wire [31:0] oldRight__29;
  wire [31:0] shifted__30;
  wire [31:0] resRight;
  wire [31:0] oldRight__31;

  assign array_index_14028 = arr5__2[sum__1[23:20]];
  assign array_index_13998 = arr5__2[sum[23:20]];
  assign subst0__1 = arr7[sum__1[31:28]];
  assign array_index_14072 = arr5__2[sum__3[23:20]];
  assign subst0 = arr7[sum[31:28]];
  assign array_index_14050 = arr5__2[sum__2[23:20]];
  assign currRight = _block[31:0];
  assign shifted__1 = {array_index_14028[0], arr4__3[sum__1[19:16]], arr3__4[sum__1[15:12]], arr2__5[sum__1[11:8]], arr1__6[sum__1[7:4]], arr0__7[sum__1[3:0]], subst0__1, arr6__1[sum__1[27:24]], array_index_14028[3:1]};
  assign subst0__3 = arr7[sum__3[31:28]];
  assign array_index_14116 = arr5__2[sum__5[23:20]];
  assign currLeft = _block[63:32];
  assign shifted = {array_index_13998[0], arr4__3[sum[19:16]], arr3__4[sum[15:12]], arr2__5[sum[11:8]], arr1__6[sum[7:4]], arr0__7[sum[3:0]], subst0, arr6__1[sum[27:24]], array_index_13998[3:1]};
  assign subst0__2 = arr7[sum__2[31:28]];
  assign array_index_14094 = arr5__2[sum__4[23:20]];
  assign oldRight__2 = currRight ^ shifted__1;
  assign shifted__3 = {array_index_14072[0], arr4__3[sum__3[19:16]], arr3__4[sum__3[15:12]], arr2__5[sum__3[11:8]], arr1__6[sum__3[7:4]], arr0__7[sum__3[3:0]], subst0__3, arr6__1[sum__3[27:24]], array_index_14072[3:1]};
  assign subst0__5 = arr7[sum__5[31:28]];
  assign array_index_14160 = arr5__2[sum__7[23:20]];
  assign oldRight__1 = currLeft ^ shifted;
  assign shifted__2 = {array_index_14050[0], arr4__3[sum__2[19:16]], arr3__4[sum__2[15:12]], arr2__5[sum__2[11:8]], arr1__6[sum__2[7:4]], arr0__7[sum__2[3:0]], subst0__2, arr6__1[sum__2[27:24]], array_index_14050[3:1]};
  assign subst0__4 = arr7[sum__4[31:28]];
  assign array_index_14138 = arr5__2[sum__6[23:20]];
  assign oldRight__4 = oldRight__2 ^ shifted__3;
  assign shifted__5 = {array_index_14116[0], arr4__3[sum__5[19:16]], arr3__4[sum__5[15:12]], arr2__5[sum__5[11:8]], arr1__6[sum__5[7:4]], arr0__7[sum__5[3:0]], subst0__5, arr6__1[sum__5[27:24]], array_index_14116[3:1]};
  assign subst0__7 = arr7[sum__7[31:28]];
  assign array_index_14202 = arr5__2[sum__9[23:20]];
  assign oldRight__3 = oldRight__1 ^ shifted__2;
  assign shifted__4 = {array_index_14094[0], arr4__3[sum__4[19:16]], arr3__4[sum__4[15:12]], arr2__5[sum__4[11:8]], arr1__6[sum__4[7:4]], arr0__7[sum__4[3:0]], subst0__4, arr6__1[sum__4[27:24]], array_index_14094[3:1]};
  assign subst0__6 = arr7[sum__6[31:28]];
  assign array_index_14181 = arr5__2[sum__8[23:20]];
  assign oldRight__6 = oldRight__4 ^ shifted__5;
  assign shifted__7 = {array_index_14160[0], arr4__3[sum__7[19:16]], arr3__4[sum__7[15:12]], arr2__5[sum__7[11:8]], arr1__6[sum__7[7:4]], arr0__7[sum__7[3:0]], subst0__7, arr6__1[sum__7[27:24]], array_index_14160[3:1]};
  assign subst0__9 = arr7[sum__9[31:28]];
  assign array_index_14244 = arr5__2[sum__11[23:20]];
  assign oldRight__5 = oldRight__3 ^ shifted__4;
  assign shifted__6 = {array_index_14138[0], arr4__3[sum__6[19:16]], arr3__4[sum__6[15:12]], arr2__5[sum__6[11:8]], arr1__6[sum__6[7:4]], arr0__7[sum__6[3:0]], subst0__6, arr6__1[sum__6[27:24]], array_index_14138[3:1]};
  assign subst0__8 = arr7[sum__8[31:28]];
  assign array_index_14223 = arr5__2[sum__10[23:20]];
  assign oldRight__8 = oldRight__6 ^ shifted__7;
  assign shifted__9 = {array_index_14202[0], arr4__3[sum__9[19:16]], arr3__4[sum__9[15:12]], arr2__5[sum__9[11:8]], arr1__6[sum__9[7:4]], arr0__7[sum__9[3:0]], subst0__9, arr6__1[sum__9[27:24]], array_index_14202[3:1]};
  assign subst0__11 = arr7[sum__11[31:28]];
  assign array_index_14286 = arr5__2[sum__13[23:20]];
  assign oldRight__7 = oldRight__5 ^ shifted__6;
  assign shifted__8 = {array_index_14181[0], arr4__3[sum__8[19:16]], arr3__4[sum__8[15:12]], arr2__5[sum__8[11:8]], arr1__6[sum__8[7:4]], arr0__7[sum__8[3:0]], subst0__8, arr6__1[sum__8[27:24]], array_index_14181[3:1]};
  assign subst0__10 = arr7[sum__10[31:28]];
  assign array_index_14265 = arr5__2[sum__12[23:20]];
  assign oldRight__10 = oldRight__8 ^ shifted__9;
  assign shifted__11 = {array_index_14244[0], arr4__3[sum__11[19:16]], arr3__4[sum__11[15:12]], arr2__5[sum__11[11:8]], arr1__6[sum__11[7:4]], arr0__7[sum__11[3:0]], subst0__11, arr6__1[sum__11[27:24]], array_index_14244[3:1]};
  assign subst0__13 = arr7[sum__13[31:28]];
  assign array_index_14328 = arr5__2[sum__15[23:20]];
  assign oldRight__9 = oldRight__7 ^ shifted__8;
  assign shifted__10 = {array_index_14223[0], arr4__3[sum__10[19:16]], arr3__4[sum__10[15:12]], arr2__5[sum__10[11:8]], arr1__6[sum__10[7:4]], arr0__7[sum__10[3:0]], subst0__10, arr6__1[sum__10[27:24]], array_index_14223[3:1]};
  assign subst0__12 = arr7[sum__12[31:28]];
  assign array_index_14307 = arr5__2[sum__14[23:20]];
  assign oldRight__12 = oldRight__10 ^ shifted__11;
  assign shifted__13 = {array_index_14286[0], arr4__3[sum__13[19:16]], arr3__4[sum__13[15:12]], arr2__5[sum__13[11:8]], arr1__6[sum__13[7:4]], arr0__7[sum__13[3:0]], subst0__13, arr6__1[sum__13[27:24]], array_index_14286[3:1]};
  assign subst0__15 = arr7[sum__15[31:28]];
  assign array_index_14370 = arr5__2[sum__17[23:20]];
  assign oldRight__11 = oldRight__9 ^ shifted__10;
  assign shifted__12 = {array_index_14265[0], arr4__3[sum__12[19:16]], arr3__4[sum__12[15:12]], arr2__5[sum__12[11:8]], arr1__6[sum__12[7:4]], arr0__7[sum__12[3:0]], subst0__12, arr6__1[sum__12[27:24]], array_index_14265[3:1]};
  assign subst0__14 = arr7[sum__14[31:28]];
  assign array_index_14349 = arr5__2[sum__16[23:20]];
  assign oldRight__14 = oldRight__12 ^ shifted__13;
  assign shifted__15 = {array_index_14328[0], arr4__3[sum__15[19:16]], arr3__4[sum__15[15:12]], arr2__5[sum__15[11:8]], arr1__6[sum__15[7:4]], arr0__7[sum__15[3:0]], subst0__15, arr6__1[sum__15[27:24]], array_index_14328[3:1]};
  assign subst0__17 = arr7[sum__17[31:28]];
  assign array_index_14412 = arr5__2[sum__19[23:20]];
  assign oldRight__13 = oldRight__11 ^ shifted__12;
  assign shifted__14 = {array_index_14307[0], arr4__3[sum__14[19:16]], arr3__4[sum__14[15:12]], arr2__5[sum__14[11:8]], arr1__6[sum__14[7:4]], arr0__7[sum__14[3:0]], subst0__14, arr6__1[sum__14[27:24]], array_index_14307[3:1]};
  assign subst0__16 = arr7[sum__16[31:28]];
  assign array_index_14391 = arr5__2[sum__18[23:20]];
  assign oldRight__16 = oldRight__14 ^ shifted__15;
  assign shifted__17 = {array_index_14370[0], arr4__3[sum__17[19:16]], arr3__4[sum__17[15:12]], arr2__5[sum__17[11:8]], arr1__6[sum__17[7:4]], arr0__7[sum__17[3:0]], subst0__17, arr6__1[sum__17[27:24]], array_index_14370[3:1]};
  assign subst0__19 = arr7[sum__19[31:28]];
  assign array_index_14454 = arr5__2[sum__21[23:20]];
  assign oldRight__15 = oldRight__13 ^ shifted__14;
  assign shifted__16 = {array_index_14349[0], arr4__3[sum__16[19:16]], arr3__4[sum__16[15:12]], arr2__5[sum__16[11:8]], arr1__6[sum__16[7:4]], arr0__7[sum__16[3:0]], subst0__16, arr6__1[sum__16[27:24]], array_index_14349[3:1]};
  assign subst0__18 = arr7[sum__18[31:28]];
  assign array_index_14433 = arr5__2[sum__20[23:20]];
  assign oldRight__18 = oldRight__16 ^ shifted__17;
  assign shifted__19 = {array_index_14412[0], arr4__3[sum__19[19:16]], arr3__4[sum__19[15:12]], arr2__5[sum__19[11:8]], arr1__6[sum__19[7:4]], arr0__7[sum__19[3:0]], subst0__19, arr6__1[sum__19[27:24]], array_index_14412[3:1]};
  assign subst0__21 = arr7[sum__21[31:28]];
  assign array_index_14496 = arr5__2[sum__23[23:20]];
  assign oldRight__17 = oldRight__15 ^ shifted__16;
  assign shifted__18 = {array_index_14391[0], arr4__3[sum__18[19:16]], arr3__4[sum__18[15:12]], arr2__5[sum__18[11:8]], arr1__6[sum__18[7:4]], arr0__7[sum__18[3:0]], subst0__18, arr6__1[sum__18[27:24]], array_index_14391[3:1]};
  assign subst0__20 = arr7[sum__20[31:28]];
  assign array_index_14475 = arr5__2[sum__22[23:20]];
  assign oldRight__20 = oldRight__18 ^ shifted__19;
  assign shifted__21 = {array_index_14454[0], arr4__3[sum__21[19:16]], arr3__4[sum__21[15:12]], arr2__5[sum__21[11:8]], arr1__6[sum__21[7:4]], arr0__7[sum__21[3:0]], subst0__21, arr6__1[sum__21[27:24]], array_index_14454[3:1]};
  assign subst0__23 = arr7[sum__23[31:28]];
  assign array_index_14538 = arr5__2[sum__25[23:20]];
  assign oldRight__19 = oldRight__17 ^ shifted__18;
  assign shifted__20 = {array_index_14433[0], arr4__3[sum__20[19:16]], arr3__4[sum__20[15:12]], arr2__5[sum__20[11:8]], arr1__6[sum__20[7:4]], arr0__7[sum__20[3:0]], subst0__20, arr6__1[sum__20[27:24]], array_index_14433[3:1]};
  assign subst0__22 = arr7[sum__22[31:28]];
  assign array_index_14517 = arr5__2[sum__24[23:20]];
  assign oldRight__22 = oldRight__20 ^ shifted__21;
  assign shifted__23 = {array_index_14496[0], arr4__3[sum__23[19:16]], arr3__4[sum__23[15:12]], arr2__5[sum__23[11:8]], arr1__6[sum__23[7:4]], arr0__7[sum__23[3:0]], subst0__23, arr6__1[sum__23[27:24]], array_index_14496[3:1]};
  assign subst0__25 = arr7[sum__25[31:28]];
  assign array_index_14580 = arr5__2[sum__27[23:20]];
  assign oldRight__21 = oldRight__19 ^ shifted__20;
  assign shifted__22 = {array_index_14475[0], arr4__3[sum__22[19:16]], arr3__4[sum__22[15:12]], arr2__5[sum__22[11:8]], arr1__6[sum__22[7:4]], arr0__7[sum__22[3:0]], subst0__22, arr6__1[sum__22[27:24]], array_index_14475[3:1]};
  assign subst0__24 = arr7[sum__24[31:28]];
  assign array_index_14559 = arr5__2[sum__26[23:20]];
  assign oldRight__24 = oldRight__22 ^ shifted__23;
  assign shifted__25 = {array_index_14538[0], arr4__3[sum__25[19:16]], arr3__4[sum__25[15:12]], arr2__5[sum__25[11:8]], arr1__6[sum__25[7:4]], arr0__7[sum__25[3:0]], subst0__25, arr6__1[sum__25[27:24]], array_index_14538[3:1]};
  assign subst0__27 = arr7[sum__27[31:28]];
  assign array_index_14622 = arr5__2[sum__29[23:20]];
  assign oldRight__23 = oldRight__21 ^ shifted__22;
  assign shifted__24 = {array_index_14517[0], arr4__3[sum__24[19:16]], arr3__4[sum__24[15:12]], arr2__5[sum__24[11:8]], arr1__6[sum__24[7:4]], arr0__7[sum__24[3:0]], subst0__24, arr6__1[sum__24[27:24]], array_index_14517[3:1]};
  assign subst0__26 = arr7[sum__26[31:28]];
  assign array_index_14601 = arr5__2[sum__28[23:20]];
  assign oldRight__26 = oldRight__24 ^ shifted__25;
  assign shifted__27 = {array_index_14580[0], arr4__3[sum__27[19:16]], arr3__4[sum__27[15:12]], arr2__5[sum__27[11:8]], arr1__6[sum__27[7:4]], arr0__7[sum__27[3:0]], subst0__27, arr6__1[sum__27[27:24]], array_index_14580[3:1]};
  assign subst0__29 = arr7[sum__29[31:28]];
  assign array_index_14664 = arr5__2[sum__31[23:20]];
  assign oldRight__25 = oldRight__23 ^ shifted__24;
  assign shifted__26 = {array_index_14559[0], arr4__3[sum__26[19:16]], arr3__4[sum__26[15:12]], arr2__5[sum__26[11:8]], arr1__6[sum__26[7:4]], arr0__7[sum__26[3:0]], subst0__26, arr6__1[sum__26[27:24]], array_index_14559[3:1]};
  assign subst0__28 = arr7[sum__28[31:28]];
  assign array_index_14643 = arr5__2[sum__30[23:20]];
  assign oldRight__28 = oldRight__26 ^ shifted__27;
  assign shifted__29 = {array_index_14622[0], arr4__3[sum__29[19:16]], arr3__4[sum__29[15:12]], arr2__5[sum__29[11:8]], arr1__6[sum__29[7:4]], arr0__7[sum__29[3:0]], subst0__29, arr6__1[sum__29[27:24]], array_index_14622[3:1]};
  assign subst0__31 = arr7[sum__31[31:28]];
  assign oldRight__27 = oldRight__25 ^ shifted__26;
  assign shifted__28 = {array_index_14601[0], arr4__3[sum__28[19:16]], arr3__4[sum__28[15:12]], arr2__5[sum__28[11:8]], arr1__6[sum__28[7:4]], arr0__7[sum__28[3:0]], subst0__28, arr6__1[sum__28[27:24]], array_index_14601[3:1]};
  assign subst0__30 = arr7[sum__30[31:28]];
  assign oldRight__30 = oldRight__28 ^ shifted__29;
  assign shifted__31 = {array_index_14664[0], arr4__3[sum__31[19:16]], arr3__4[sum__31[15:12]], arr2__5[sum__31[11:8]], arr1__6[sum__31[7:4]], arr0__7[sum__31[3:0]], subst0__31, arr6__1[sum__31[27:24]], array_index_14664[3:1]};
  assign oldRight__29 = oldRight__27 ^ shifted__28;
  assign shifted__30 = {array_index_14643[0], arr4__3[sum__30[19:16]], arr3__4[sum__30[15:12]], arr2__5[sum__30[11:8]], arr1__6[sum__30[7:4]], arr0__7[sum__30[3:0]], subst0__30, arr6__1[sum__30[27:24]], array_index_14643[3:1]};
  assign resRight = oldRight__30 ^ shifted__31;
  assign oldRight__31 = oldRight__29 ^ shifted__30;
  // ===== Instantiations

  MagmaAdder __MagmaEncoder__MagmaAdder_sum_inst (
      .clk(clk),
      .left(currRight),
      .right(key[255:224]),
      .out(sum)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__1_inst (
      .clk(clk),
      .left(oldRight__1),
      .right(key[223:192]),
      .out(sum__1)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__2_inst (
      .clk(clk),
      .left(oldRight__2),
      .right(key[191:160]),
      .out(sum__2)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__3_inst (
      .clk(clk),
      .left(oldRight__3),
      .right(key[159:128]),
      .out(sum__3)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__4_inst (
      .clk(clk),
      .left(oldRight__4),
      .right(key[127:96]),
      .out(sum__4)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__5_inst (
      .clk(clk),
      .left(oldRight__5),
      .right(key[95:64]),
      .out(sum__5)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__6_inst (
      .clk(clk),
      .left(oldRight__6),
      .right(key[63:32]),
      .out(sum__6)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__7_inst (
      .clk(clk),
      .left(oldRight__7),
      .right(key[31:0]),
      .out(sum__7)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__8_inst (
      .clk(clk),
      .left(oldRight__8),
      .right(key[255:224]),
      .out(sum__8)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__9_inst (
      .clk(clk),
      .left(oldRight__9),
      .right(key[223:192]),
      .out(sum__9)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__10_inst (
      .clk(clk),
      .left(oldRight__10),
      .right(key[191:160]),
      .out(sum__10)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__11_inst (
      .clk(clk),
      .left(oldRight__11),
      .right(key[159:128]),
      .out(sum__11)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__12_inst (
      .clk(clk),
      .left(oldRight__12),
      .right(key[127:96]),
      .out(sum__12)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__13_inst (
      .clk(clk),
      .left(oldRight__13),
      .right(key[95:64]),
      .out(sum__13)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__14_inst (
      .clk(clk),
      .left(oldRight__14),
      .right(key[63:32]),
      .out(sum__14)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__15_inst (
      .clk(clk),
      .left(oldRight__15),
      .right(key[31:0]),
      .out(sum__15)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__16_inst (
      .clk(clk),
      .left(oldRight__16),
      .right(key[255:224]),
      .out(sum__16)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__17_inst (
      .clk(clk),
      .left(oldRight__17),
      .right(key[223:192]),
      .out(sum__17)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__18_inst (
      .clk(clk),
      .left(oldRight__18),
      .right(key[191:160]),
      .out(sum__18)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__19_inst (
      .clk(clk),
      .left(oldRight__19),
      .right(key[159:128]),
      .out(sum__19)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__20_inst (
      .clk(clk),
      .left(oldRight__20),
      .right(key[127:96]),
      .out(sum__20)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__21_inst (
      .clk(clk),
      .left(oldRight__21),
      .right(key[95:64]),
      .out(sum__21)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__22_inst (
      .clk(clk),
      .left(oldRight__22),
      .right(key[63:32]),
      .out(sum__22)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__23_inst (
      .clk(clk),
      .left(oldRight__23),
      .right(key[31:0]),
      .out(sum__23)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__24_inst (
      .clk(clk),
      .left(oldRight__24),
      .right(key[31:0]),
      .out(sum__24)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__25_inst (
      .clk(clk),
      .left(oldRight__25),
      .right(key[63:32]),
      .out(sum__25)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__26_inst (
      .clk(clk),
      .left(oldRight__26),
      .right(key[95:64]),
      .out(sum__26)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__27_inst (
      .clk(clk),
      .left(oldRight__27),
      .right(key[127:96]),
      .out(sum__27)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__28_inst (
      .clk(clk),
      .left(oldRight__28),
      .right(key[159:128]),
      .out(sum__28)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__29_inst (
      .clk(clk),
      .left(oldRight__29),
      .right(key[191:160]),
      .out(sum__29)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__30_inst (
      .clk(clk),
      .left(oldRight__30),
      .right(key[223:192]),
      .out(sum__30)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__31_inst (
      .clk(clk),
      .left(oldRight__31),
      .right(key[255:224]),
      .out(sum__31)
  );
  assign out = {resRight, oldRight__31};
endmodule
