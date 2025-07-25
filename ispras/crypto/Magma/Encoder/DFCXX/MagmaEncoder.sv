// Generated by CIRCT firtool-1.110.0
module MagmaEncoder(
  input  [255:0] key,
  input  [63:0]  block,
  output [63:0]  encoded,
  input          clk
);

  wire [31:0]      _placeholder_res1;
  wire [31:0]      _placeholder_res1_0;
  wire [31:0]      _placeholder_res1_1;
  wire [31:0]      _placeholder_res1_2;
  wire [31:0]      _placeholder_res1_3;
  wire [31:0]      _placeholder_res1_4;
  wire [31:0]      _placeholder_res1_5;
  wire [31:0]      _placeholder_res1_6;
  wire [31:0]      _placeholder_res1_7;
  wire [31:0]      _placeholder_res1_8;
  wire [31:0]      _placeholder_res1_9;
  wire [31:0]      _placeholder_res1_10;
  wire [31:0]      _placeholder_res1_11;
  wire [31:0]      _placeholder_res1_12;
  wire [31:0]      _placeholder_res1_13;
  wire [31:0]      _placeholder_res1_14;
  wire [31:0]      _placeholder_res1_15;
  wire [31:0]      _placeholder_res1_16;
  wire [31:0]      _placeholder_res1_17;
  wire [31:0]      _placeholder_res1_18;
  wire [31:0]      _placeholder_res1_19;
  wire [31:0]      _placeholder_res1_20;
  wire [31:0]      _placeholder_res1_21;
  wire [31:0]      _placeholder_res1_22;
  wire [31:0]      _placeholder_res1_23;
  wire [31:0]      _placeholder_res1_24;
  wire [31:0]      _placeholder_res1_25;
  wire [31:0]      _placeholder_res1_26;
  wire [31:0]      _placeholder_res1_27;
  wire [31:0]      _placeholder_res1_28;
  wire [31:0]      _placeholder_res1_29;
  wire [31:0]      _placeholder_res1_30;
  wire [31:0]      _placeholder_res1_31;
  wire [31:0]      _placeholder_res1_32;
  wire [31:0]      _placeholder_res1_33;
  wire [31:0]      _placeholder_res1_34;
  wire [31:0]      _placeholder_res1_35;
  wire [31:0]      _placeholder_res1_36;
  wire [31:0]      _placeholder_res1_37;
  wire [31:0]      _placeholder_res1_38;
  wire [31:0]      _placeholder_res1_39;
  wire [31:0]      _placeholder_res1_40;
  wire [31:0]      _placeholder_res1_41;
  wire [31:0]      _placeholder_res1_42;
  wire [31:0]      _placeholder_res1_43;
  wire [31:0]      _placeholder_res1_44;
  wire [31:0]      _placeholder_res1_45;
  wire [31:0]      _placeholder_res1_46;
  wire [31:0]      _placeholder_res1_47;
  wire [31:0]      _placeholder_res1_48;
  wire [31:0]      _placeholder_res1_49;
  wire [31:0]      _placeholder_res1_50;
  wire [31:0]      _placeholder_res1_51;
  wire [31:0]      _placeholder_res1_52;
  wire [31:0]      _placeholder_res1_53;
  wire [31:0]      _placeholder_res1_54;
  wire [31:0]      _placeholder_res1_55;
  wire [31:0]      _placeholder_res1_56;
  wire [31:0]      _placeholder_res1_57;
  wire [31:0]      _placeholder_res1_58;
  wire [31:0]      _placeholder_res1_59;
  wire [31:0]      _placeholder_res1_60;
  wire [31:0]      _placeholder_res1_61;
  wire [31:0]      _placeholder_res1_62;
  wire [31:0]      _placeholder_res1_63;
  wire [31:0]      _placeholder_res1_64;
  wire [31:0]      _placeholder_res1_65;
  wire [31:0]      _placeholder_res1_66;
  wire [31:0]      _placeholder_res1_67;
  wire [31:0]      _placeholder_res1_68;
  wire [31:0]      _placeholder_res1_69;
  wire [31:0]      _placeholder_res1_70;
  wire [31:0]      _placeholder_res1_71;
  wire [31:0]      _placeholder_res1_72;
  wire [31:0]      _placeholder_res1_73;
  wire [31:0]      _placeholder_res1_74;
  wire [31:0]      _placeholder_res1_75;
  wire [31:0]      _placeholder_res1_76;
  wire [31:0]      _placeholder_res1_77;
  wire [31:0]      _placeholder_res1_78;
  wire [31:0]      _placeholder_res1_79;
  wire [31:0]      _placeholder_res1_80;
  wire [31:0]      _placeholder_res1_81;
  wire [31:0]      _placeholder_res1_82;
  wire [31:0]      _placeholder_res1_83;
  wire [31:0]      _placeholder_res1_84;
  wire [31:0]      _placeholder_res1_85;
  wire [31:0]      _placeholder_res1_86;
  wire [31:0]      _placeholder_res1_87;
  wire [31:0]      _placeholder_res1_88;
  wire [31:0]      _placeholder_res1_89;
  wire [31:0]      _placeholder_res1_90;
  wire [31:0]      _placeholder_res1_91;
  wire [31:0]      _placeholder_res1_92;
  wire [31:0]      _placeholder_res1_93;
  wire [31:0]      _placeholder_res1_94;
  wire [15:0][3:0] _GEN =
    {{4'h1},
     {4'hF},
     {4'h3},
     {4'h0},
     {4'h7},
     {4'hD},
     {4'h8},
     {4'hE},
     {4'h9},
     {4'hB},
     {4'h5},
     {4'hA},
     {4'h2},
     {4'h6},
     {4'h4},
     {4'hC}};
  wire [15:0][3:0] _GEN_0 =
    {{4'hF},
     {4'h0},
     {4'hD},
     {4'hB},
     {4'h7},
     {4'h4},
     {4'hE},
     {4'h1},
     {4'hC},
     {4'h5},
     {4'hA},
     {4'h9},
     {4'h3},
     {4'h2},
     {4'h8},
     {4'h6}};
  wire [15:0][3:0] _GEN_1 =
    {{4'h0},
     {4'h6},
     {4'h9},
     {4'hC},
     {4'h4},
     {4'h7},
     {4'h1},
     {4'hE},
     {4'hD},
     {4'hA},
     {4'hF},
     {4'h2},
     {4'h8},
     {4'h5},
     {4'h3},
     {4'hB}};
  wire [15:0][3:0] _GEN_2 =
    {{4'hB},
     {4'h9},
     {4'hE},
     {4'h3},
     {4'h5},
     {4'hA},
     {4'h0},
     {4'h7},
     {4'h6},
     {4'hF},
     {4'h4},
     {4'hD},
     {4'h1},
     {4'h2},
     {4'h8},
     {4'hC}};
  wire [15:0][3:0] _GEN_3 =
    {{4'hC},
     {4'h2},
     {4'h4},
     {4'hB},
     {4'hE},
     {4'h3},
     {4'h9},
     {4'h0},
     {4'hD},
     {4'h6},
     {4'h1},
     {4'h8},
     {4'hA},
     {4'h5},
     {4'hF},
     {4'h7}};
  wire [15:0][3:0] _GEN_4 =
    {{4'h0},
     {4'hE},
     {4'h3},
     {4'h4},
     {4'h1},
     {4'h8},
     {4'h7},
     {4'hB},
     {4'hA},
     {4'hC},
     {4'h2},
     {4'h9},
     {4'h6},
     {4'hF},
     {4'hD},
     {4'h5}};
  wire [15:0][3:0] _GEN_5 =
    {{4'h7},
     {4'h3},
     {4'hA},
     {4'hD},
     {4'h0},
     {4'hB},
     {4'h4},
     {4'hF},
     {4'hC},
     {4'h1},
     {4'h9},
     {4'h6},
     {4'h5},
     {4'h2},
     {4'hE},
     {4'h8}};
  wire [15:0][3:0] _GEN_6 =
    {{4'h2},
     {4'hB},
     {4'hC},
     {4'h9},
     {4'h6},
     {4'hA},
     {4'hF},
     {4'h4},
     {4'h3},
     {4'h8},
     {4'h5},
     {4'h0},
     {4'hD},
     {4'hE},
     {4'h7},
     {4'h1}};
  wire [31:0]      _GEN_7 =
    {{{{{{{_GEN_6[_placeholder_res1_61[31:28]], _GEN_5[_placeholder_res1_61[27:24]]},
          _GEN_4[_placeholder_res1_61[23:20]]},
         _GEN_3[_placeholder_res1_61[19:16]]},
        _GEN_2[_placeholder_res1_61[15:12]]},
       _GEN_1[_placeholder_res1_61[11:8]]},
      _GEN_0[_placeholder_res1_61[7:4]]},
     _GEN[_placeholder_res1_61[3:0]]};
  wire [31:0]      _GEN_8 = block[63:32] ^ {_GEN_7[20:0], _GEN_7[31:21]};
  wire [31:0]      _GEN_9 =
    {{{{{{{_GEN_6[_placeholder_res1_59[31:28]], _GEN_5[_placeholder_res1_59[27:24]]},
          _GEN_4[_placeholder_res1_59[23:20]]},
         _GEN_3[_placeholder_res1_59[19:16]]},
        _GEN_2[_placeholder_res1_59[15:12]]},
       _GEN_1[_placeholder_res1_59[11:8]]},
      _GEN_0[_placeholder_res1_59[7:4]]},
     _GEN[_placeholder_res1_59[3:0]]};
  wire [31:0]      _GEN_10 = block[31:0] ^ {_GEN_9[20:0], _GEN_9[31:21]};
  wire [31:0]      _GEN_11 =
    {{{{{{{_GEN_6[_placeholder_res1_57[31:28]], _GEN_5[_placeholder_res1_57[27:24]]},
          _GEN_4[_placeholder_res1_57[23:20]]},
         _GEN_3[_placeholder_res1_57[19:16]]},
        _GEN_2[_placeholder_res1_57[15:12]]},
       _GEN_1[_placeholder_res1_57[11:8]]},
      _GEN_0[_placeholder_res1_57[7:4]]},
     _GEN[_placeholder_res1_57[3:0]]};
  wire [31:0]      _GEN_12 = _GEN_8 ^ {_GEN_11[20:0], _GEN_11[31:21]};
  wire [31:0]      _GEN_13 =
    {{{{{{{_GEN_6[_placeholder_res1_55[31:28]], _GEN_5[_placeholder_res1_55[27:24]]},
          _GEN_4[_placeholder_res1_55[23:20]]},
         _GEN_3[_placeholder_res1_55[19:16]]},
        _GEN_2[_placeholder_res1_55[15:12]]},
       _GEN_1[_placeholder_res1_55[11:8]]},
      _GEN_0[_placeholder_res1_55[7:4]]},
     _GEN[_placeholder_res1_55[3:0]]};
  wire [31:0]      _GEN_14 = _GEN_10 ^ {_GEN_13[20:0], _GEN_13[31:21]};
  wire [31:0]      _GEN_15 =
    {{{{{{{_GEN_6[_placeholder_res1_53[31:28]], _GEN_5[_placeholder_res1_53[27:24]]},
          _GEN_4[_placeholder_res1_53[23:20]]},
         _GEN_3[_placeholder_res1_53[19:16]]},
        _GEN_2[_placeholder_res1_53[15:12]]},
       _GEN_1[_placeholder_res1_53[11:8]]},
      _GEN_0[_placeholder_res1_53[7:4]]},
     _GEN[_placeholder_res1_53[3:0]]};
  wire [31:0]      _GEN_16 = _GEN_12 ^ {_GEN_15[20:0], _GEN_15[31:21]};
  wire [31:0]      _GEN_17 =
    {{{{{{{_GEN_6[_placeholder_res1_51[31:28]], _GEN_5[_placeholder_res1_51[27:24]]},
          _GEN_4[_placeholder_res1_51[23:20]]},
         _GEN_3[_placeholder_res1_51[19:16]]},
        _GEN_2[_placeholder_res1_51[15:12]]},
       _GEN_1[_placeholder_res1_51[11:8]]},
      _GEN_0[_placeholder_res1_51[7:4]]},
     _GEN[_placeholder_res1_51[3:0]]};
  wire [31:0]      _GEN_18 = _GEN_14 ^ {_GEN_17[20:0], _GEN_17[31:21]};
  wire [31:0]      _GEN_19 =
    {{{{{{{_GEN_6[_placeholder_res1_49[31:28]], _GEN_5[_placeholder_res1_49[27:24]]},
          _GEN_4[_placeholder_res1_49[23:20]]},
         _GEN_3[_placeholder_res1_49[19:16]]},
        _GEN_2[_placeholder_res1_49[15:12]]},
       _GEN_1[_placeholder_res1_49[11:8]]},
      _GEN_0[_placeholder_res1_49[7:4]]},
     _GEN[_placeholder_res1_49[3:0]]};
  wire [31:0]      _GEN_20 = _GEN_16 ^ {_GEN_19[20:0], _GEN_19[31:21]};
  wire [31:0]      _GEN_21 =
    {{{{{{{_GEN_6[_placeholder_res1_47[31:28]], _GEN_5[_placeholder_res1_47[27:24]]},
          _GEN_4[_placeholder_res1_47[23:20]]},
         _GEN_3[_placeholder_res1_47[19:16]]},
        _GEN_2[_placeholder_res1_47[15:12]]},
       _GEN_1[_placeholder_res1_47[11:8]]},
      _GEN_0[_placeholder_res1_47[7:4]]},
     _GEN[_placeholder_res1_47[3:0]]};
  wire [31:0]      _GEN_22 = _GEN_18 ^ {_GEN_21[20:0], _GEN_21[31:21]};
  wire [31:0]      _GEN_23 =
    {{{{{{{_GEN_6[_placeholder_res1_45[31:28]], _GEN_5[_placeholder_res1_45[27:24]]},
          _GEN_4[_placeholder_res1_45[23:20]]},
         _GEN_3[_placeholder_res1_45[19:16]]},
        _GEN_2[_placeholder_res1_45[15:12]]},
       _GEN_1[_placeholder_res1_45[11:8]]},
      _GEN_0[_placeholder_res1_45[7:4]]},
     _GEN[_placeholder_res1_45[3:0]]};
  wire [31:0]      _GEN_24 = _GEN_20 ^ {_GEN_23[20:0], _GEN_23[31:21]};
  wire [31:0]      _GEN_25 =
    {{{{{{{_GEN_6[_placeholder_res1_43[31:28]], _GEN_5[_placeholder_res1_43[27:24]]},
          _GEN_4[_placeholder_res1_43[23:20]]},
         _GEN_3[_placeholder_res1_43[19:16]]},
        _GEN_2[_placeholder_res1_43[15:12]]},
       _GEN_1[_placeholder_res1_43[11:8]]},
      _GEN_0[_placeholder_res1_43[7:4]]},
     _GEN[_placeholder_res1_43[3:0]]};
  wire [31:0]      _GEN_26 = _GEN_22 ^ {_GEN_25[20:0], _GEN_25[31:21]};
  wire [31:0]      _GEN_27 =
    {{{{{{{_GEN_6[_placeholder_res1_41[31:28]], _GEN_5[_placeholder_res1_41[27:24]]},
          _GEN_4[_placeholder_res1_41[23:20]]},
         _GEN_3[_placeholder_res1_41[19:16]]},
        _GEN_2[_placeholder_res1_41[15:12]]},
       _GEN_1[_placeholder_res1_41[11:8]]},
      _GEN_0[_placeholder_res1_41[7:4]]},
     _GEN[_placeholder_res1_41[3:0]]};
  wire [31:0]      _GEN_28 = _GEN_24 ^ {_GEN_27[20:0], _GEN_27[31:21]};
  wire [31:0]      _GEN_29 =
    {{{{{{{_GEN_6[_placeholder_res1_39[31:28]], _GEN_5[_placeholder_res1_39[27:24]]},
          _GEN_4[_placeholder_res1_39[23:20]]},
         _GEN_3[_placeholder_res1_39[19:16]]},
        _GEN_2[_placeholder_res1_39[15:12]]},
       _GEN_1[_placeholder_res1_39[11:8]]},
      _GEN_0[_placeholder_res1_39[7:4]]},
     _GEN[_placeholder_res1_39[3:0]]};
  wire [31:0]      _GEN_30 = _GEN_26 ^ {_GEN_29[20:0], _GEN_29[31:21]};
  wire [31:0]      _GEN_31 =
    {{{{{{{_GEN_6[_placeholder_res1_37[31:28]], _GEN_5[_placeholder_res1_37[27:24]]},
          _GEN_4[_placeholder_res1_37[23:20]]},
         _GEN_3[_placeholder_res1_37[19:16]]},
        _GEN_2[_placeholder_res1_37[15:12]]},
       _GEN_1[_placeholder_res1_37[11:8]]},
      _GEN_0[_placeholder_res1_37[7:4]]},
     _GEN[_placeholder_res1_37[3:0]]};
  wire [31:0]      _GEN_32 = _GEN_28 ^ {_GEN_31[20:0], _GEN_31[31:21]};
  wire [31:0]      _GEN_33 =
    {{{{{{{_GEN_6[_placeholder_res1_35[31:28]], _GEN_5[_placeholder_res1_35[27:24]]},
          _GEN_4[_placeholder_res1_35[23:20]]},
         _GEN_3[_placeholder_res1_35[19:16]]},
        _GEN_2[_placeholder_res1_35[15:12]]},
       _GEN_1[_placeholder_res1_35[11:8]]},
      _GEN_0[_placeholder_res1_35[7:4]]},
     _GEN[_placeholder_res1_35[3:0]]};
  wire [31:0]      _GEN_34 = _GEN_30 ^ {_GEN_33[20:0], _GEN_33[31:21]};
  wire [31:0]      _GEN_35 =
    {{{{{{{_GEN_6[_placeholder_res1_33[31:28]], _GEN_5[_placeholder_res1_33[27:24]]},
          _GEN_4[_placeholder_res1_33[23:20]]},
         _GEN_3[_placeholder_res1_33[19:16]]},
        _GEN_2[_placeholder_res1_33[15:12]]},
       _GEN_1[_placeholder_res1_33[11:8]]},
      _GEN_0[_placeholder_res1_33[7:4]]},
     _GEN[_placeholder_res1_33[3:0]]};
  wire [31:0]      _GEN_36 = _GEN_32 ^ {_GEN_35[20:0], _GEN_35[31:21]};
  wire [31:0]      _GEN_37 =
    {{{{{{{_GEN_6[_placeholder_res1_31[31:28]], _GEN_5[_placeholder_res1_31[27:24]]},
          _GEN_4[_placeholder_res1_31[23:20]]},
         _GEN_3[_placeholder_res1_31[19:16]]},
        _GEN_2[_placeholder_res1_31[15:12]]},
       _GEN_1[_placeholder_res1_31[11:8]]},
      _GEN_0[_placeholder_res1_31[7:4]]},
     _GEN[_placeholder_res1_31[3:0]]};
  wire [31:0]      _GEN_38 = _GEN_34 ^ {_GEN_37[20:0], _GEN_37[31:21]};
  wire [31:0]      _GEN_39 =
    {{{{{{{_GEN_6[_placeholder_res1_29[31:28]], _GEN_5[_placeholder_res1_29[27:24]]},
          _GEN_4[_placeholder_res1_29[23:20]]},
         _GEN_3[_placeholder_res1_29[19:16]]},
        _GEN_2[_placeholder_res1_29[15:12]]},
       _GEN_1[_placeholder_res1_29[11:8]]},
      _GEN_0[_placeholder_res1_29[7:4]]},
     _GEN[_placeholder_res1_29[3:0]]};
  wire [31:0]      _GEN_40 = _GEN_36 ^ {_GEN_39[20:0], _GEN_39[31:21]};
  wire [31:0]      _GEN_41 =
    {{{{{{{_GEN_6[_placeholder_res1_27[31:28]], _GEN_5[_placeholder_res1_27[27:24]]},
          _GEN_4[_placeholder_res1_27[23:20]]},
         _GEN_3[_placeholder_res1_27[19:16]]},
        _GEN_2[_placeholder_res1_27[15:12]]},
       _GEN_1[_placeholder_res1_27[11:8]]},
      _GEN_0[_placeholder_res1_27[7:4]]},
     _GEN[_placeholder_res1_27[3:0]]};
  wire [31:0]      _GEN_42 = _GEN_38 ^ {_GEN_41[20:0], _GEN_41[31:21]};
  wire [31:0]      _GEN_43 =
    {{{{{{{_GEN_6[_placeholder_res1_25[31:28]], _GEN_5[_placeholder_res1_25[27:24]]},
          _GEN_4[_placeholder_res1_25[23:20]]},
         _GEN_3[_placeholder_res1_25[19:16]]},
        _GEN_2[_placeholder_res1_25[15:12]]},
       _GEN_1[_placeholder_res1_25[11:8]]},
      _GEN_0[_placeholder_res1_25[7:4]]},
     _GEN[_placeholder_res1_25[3:0]]};
  wire [31:0]      _GEN_44 = _GEN_40 ^ {_GEN_43[20:0], _GEN_43[31:21]};
  wire [31:0]      _GEN_45 =
    {{{{{{{_GEN_6[_placeholder_res1_23[31:28]], _GEN_5[_placeholder_res1_23[27:24]]},
          _GEN_4[_placeholder_res1_23[23:20]]},
         _GEN_3[_placeholder_res1_23[19:16]]},
        _GEN_2[_placeholder_res1_23[15:12]]},
       _GEN_1[_placeholder_res1_23[11:8]]},
      _GEN_0[_placeholder_res1_23[7:4]]},
     _GEN[_placeholder_res1_23[3:0]]};
  wire [31:0]      _GEN_46 = _GEN_42 ^ {_GEN_45[20:0], _GEN_45[31:21]};
  wire [31:0]      _GEN_47 =
    {{{{{{{_GEN_6[_placeholder_res1_21[31:28]], _GEN_5[_placeholder_res1_21[27:24]]},
          _GEN_4[_placeholder_res1_21[23:20]]},
         _GEN_3[_placeholder_res1_21[19:16]]},
        _GEN_2[_placeholder_res1_21[15:12]]},
       _GEN_1[_placeholder_res1_21[11:8]]},
      _GEN_0[_placeholder_res1_21[7:4]]},
     _GEN[_placeholder_res1_21[3:0]]};
  wire [31:0]      _GEN_48 = _GEN_44 ^ {_GEN_47[20:0], _GEN_47[31:21]};
  wire [31:0]      _GEN_49 =
    {{{{{{{_GEN_6[_placeholder_res1_19[31:28]], _GEN_5[_placeholder_res1_19[27:24]]},
          _GEN_4[_placeholder_res1_19[23:20]]},
         _GEN_3[_placeholder_res1_19[19:16]]},
        _GEN_2[_placeholder_res1_19[15:12]]},
       _GEN_1[_placeholder_res1_19[11:8]]},
      _GEN_0[_placeholder_res1_19[7:4]]},
     _GEN[_placeholder_res1_19[3:0]]};
  wire [31:0]      _GEN_50 = _GEN_46 ^ {_GEN_49[20:0], _GEN_49[31:21]};
  wire [31:0]      _GEN_51 =
    {{{{{{{_GEN_6[_placeholder_res1_17[31:28]], _GEN_5[_placeholder_res1_17[27:24]]},
          _GEN_4[_placeholder_res1_17[23:20]]},
         _GEN_3[_placeholder_res1_17[19:16]]},
        _GEN_2[_placeholder_res1_17[15:12]]},
       _GEN_1[_placeholder_res1_17[11:8]]},
      _GEN_0[_placeholder_res1_17[7:4]]},
     _GEN[_placeholder_res1_17[3:0]]};
  wire [31:0]      _GEN_52 = _GEN_48 ^ {_GEN_51[20:0], _GEN_51[31:21]};
  wire [31:0]      _GEN_53 =
    {{{{{{{_GEN_6[_placeholder_res1_15[31:28]], _GEN_5[_placeholder_res1_15[27:24]]},
          _GEN_4[_placeholder_res1_15[23:20]]},
         _GEN_3[_placeholder_res1_15[19:16]]},
        _GEN_2[_placeholder_res1_15[15:12]]},
       _GEN_1[_placeholder_res1_15[11:8]]},
      _GEN_0[_placeholder_res1_15[7:4]]},
     _GEN[_placeholder_res1_15[3:0]]};
  wire [31:0]      _GEN_54 = _GEN_50 ^ {_GEN_53[20:0], _GEN_53[31:21]};
  wire [31:0]      _GEN_55 =
    {{{{{{{_GEN_6[_placeholder_res1_13[31:28]], _GEN_5[_placeholder_res1_13[27:24]]},
          _GEN_4[_placeholder_res1_13[23:20]]},
         _GEN_3[_placeholder_res1_13[19:16]]},
        _GEN_2[_placeholder_res1_13[15:12]]},
       _GEN_1[_placeholder_res1_13[11:8]]},
      _GEN_0[_placeholder_res1_13[7:4]]},
     _GEN[_placeholder_res1_13[3:0]]};
  wire [31:0]      _GEN_56 = _GEN_52 ^ {_GEN_55[20:0], _GEN_55[31:21]};
  wire [31:0]      _GEN_57 =
    {{{{{{{_GEN_6[_placeholder_res1_11[31:28]], _GEN_5[_placeholder_res1_11[27:24]]},
          _GEN_4[_placeholder_res1_11[23:20]]},
         _GEN_3[_placeholder_res1_11[19:16]]},
        _GEN_2[_placeholder_res1_11[15:12]]},
       _GEN_1[_placeholder_res1_11[11:8]]},
      _GEN_0[_placeholder_res1_11[7:4]]},
     _GEN[_placeholder_res1_11[3:0]]};
  wire [31:0]      _GEN_58 = _GEN_54 ^ {_GEN_57[20:0], _GEN_57[31:21]};
  wire [31:0]      _GEN_59 =
    {{{{{{{_GEN_6[_placeholder_res1_9[31:28]], _GEN_5[_placeholder_res1_9[27:24]]},
          _GEN_4[_placeholder_res1_9[23:20]]},
         _GEN_3[_placeholder_res1_9[19:16]]},
        _GEN_2[_placeholder_res1_9[15:12]]},
       _GEN_1[_placeholder_res1_9[11:8]]},
      _GEN_0[_placeholder_res1_9[7:4]]},
     _GEN[_placeholder_res1_9[3:0]]};
  wire [31:0]      _GEN_60 = _GEN_56 ^ {_GEN_59[20:0], _GEN_59[31:21]};
  wire [31:0]      _GEN_61 =
    {{{{{{{_GEN_6[_placeholder_res1_7[31:28]], _GEN_5[_placeholder_res1_7[27:24]]},
          _GEN_4[_placeholder_res1_7[23:20]]},
         _GEN_3[_placeholder_res1_7[19:16]]},
        _GEN_2[_placeholder_res1_7[15:12]]},
       _GEN_1[_placeholder_res1_7[11:8]]},
      _GEN_0[_placeholder_res1_7[7:4]]},
     _GEN[_placeholder_res1_7[3:0]]};
  wire [31:0]      _GEN_62 = _GEN_58 ^ {_GEN_61[20:0], _GEN_61[31:21]};
  wire [31:0]      _GEN_63 =
    {{{{{{{_GEN_6[_placeholder_res1_5[31:28]], _GEN_5[_placeholder_res1_5[27:24]]},
          _GEN_4[_placeholder_res1_5[23:20]]},
         _GEN_3[_placeholder_res1_5[19:16]]},
        _GEN_2[_placeholder_res1_5[15:12]]},
       _GEN_1[_placeholder_res1_5[11:8]]},
      _GEN_0[_placeholder_res1_5[7:4]]},
     _GEN[_placeholder_res1_5[3:0]]};
  wire [31:0]      _GEN_64 = _GEN_60 ^ {_GEN_63[20:0], _GEN_63[31:21]};
  wire [31:0]      _GEN_65 =
    {{{{{{{_GEN_6[_placeholder_res1_3[31:28]], _GEN_5[_placeholder_res1_3[27:24]]},
          _GEN_4[_placeholder_res1_3[23:20]]},
         _GEN_3[_placeholder_res1_3[19:16]]},
        _GEN_2[_placeholder_res1_3[15:12]]},
       _GEN_1[_placeholder_res1_3[11:8]]},
      _GEN_0[_placeholder_res1_3[7:4]]},
     _GEN[_placeholder_res1_3[3:0]]};
  wire [31:0]      _GEN_66 = _GEN_62 ^ {_GEN_65[20:0], _GEN_65[31:21]};
  wire [31:0]      _GEN_67 =
    {{{{{{{_GEN_6[_placeholder_res1_1[31:28]], _GEN_5[_placeholder_res1_1[27:24]]},
          _GEN_4[_placeholder_res1_1[23:20]]},
         _GEN_3[_placeholder_res1_1[19:16]]},
        _GEN_2[_placeholder_res1_1[15:12]]},
       _GEN_1[_placeholder_res1_1[11:8]]},
      _GEN_0[_placeholder_res1_1[7:4]]},
     _GEN[_placeholder_res1_1[3:0]]};
  wire [31:0]      _GEN_68 = _GEN_64 ^ {_GEN_67[20:0], _GEN_67[31:21]};
  wire [31:0]      _GEN_69 =
    {{{{{{{_GEN_6[_placeholder_res1[31:28]], _GEN_5[_placeholder_res1[27:24]]},
          _GEN_4[_placeholder_res1[23:20]]},
         _GEN_3[_placeholder_res1[19:16]]},
        _GEN_2[_placeholder_res1[15:12]]},
       _GEN_1[_placeholder_res1[11:8]]},
      _GEN_0[_placeholder_res1[7:4]]},
     _GEN[_placeholder_res1[3:0]]};
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder (
    .res1 (_placeholder_res1_94),
    .arg1 (key[31:0]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_0 (
    .res1 (_placeholder_res1_93),
    .arg1 (key[31:0]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_1 (
    .res1 (_placeholder_res1_92),
    .arg1 (key[31:0]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_2 (
    .res1 (_placeholder_res1_91),
    .arg1 (key[31:0]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_3 (
    .res1 (_placeholder_res1_90),
    .arg1 (key[63:32]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_4 (
    .res1 (_placeholder_res1_89),
    .arg1 (key[63:32]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_5 (
    .res1 (_placeholder_res1_88),
    .arg1 (key[63:32]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_6 (
    .res1 (_placeholder_res1_87),
    .arg1 (key[63:32]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_7 (
    .res1 (_placeholder_res1_86),
    .arg1 (key[95:64]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_8 (
    .res1 (_placeholder_res1_85),
    .arg1 (key[95:64]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_9 (
    .res1 (_placeholder_res1_84),
    .arg1 (key[95:64]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_10 (
    .res1 (_placeholder_res1_83),
    .arg1 (key[95:64]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_11 (
    .res1 (_placeholder_res1_82),
    .arg1 (key[127:96]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_12 (
    .res1 (_placeholder_res1_81),
    .arg1 (key[127:96]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_13 (
    .res1 (_placeholder_res1_80),
    .arg1 (key[127:96]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_14 (
    .res1 (_placeholder_res1_79),
    .arg1 (key[127:96]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_15 (
    .res1 (_placeholder_res1_78),
    .arg1 (key[159:128]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_16 (
    .res1 (_placeholder_res1_77),
    .arg1 (key[159:128]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_17 (
    .res1 (_placeholder_res1_76),
    .arg1 (key[159:128]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_18 (
    .res1 (_placeholder_res1_75),
    .arg1 (key[159:128]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_19 (
    .res1 (_placeholder_res1_74),
    .arg1 (key[191:160]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_20 (
    .res1 (_placeholder_res1_73),
    .arg1 (key[191:160]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_21 (
    .res1 (_placeholder_res1_72),
    .arg1 (key[191:160]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_22 (
    .res1 (_placeholder_res1_71),
    .arg1 (key[191:160]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_23 (
    .res1 (_placeholder_res1_70),
    .arg1 (key[223:192]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_24 (
    .res1 (_placeholder_res1_69),
    .arg1 (key[223:192]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_25 (
    .res1 (_placeholder_res1_68),
    .arg1 (key[223:192]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_26 (
    .res1 (_placeholder_res1_67),
    .arg1 (key[223:192]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_27 (
    .res1 (_placeholder_res1_66),
    .arg1 (key[255:224]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_28 (
    .res1 (_placeholder_res1_65),
    .arg1 (key[255:224]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_29 (
    .res1 (_placeholder_res1_64),
    .arg1 (key[255:224]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_30 (
    .res1 (_placeholder_res1_63),
    .arg1 (key[255:224]),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_31 (
    .res1 (_placeholder_res1_62),
    .arg1 (block[31:0]),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_32 (
    .res1 (_placeholder_res1_61),
    .arg1 (_placeholder_res1_62),
    .arg2 (_placeholder_res1_63),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_33 (
    .res1 (_placeholder_res1_60),
    .arg1 (_GEN_8),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_34 (
    .res1 (_placeholder_res1_59),
    .arg1 (_placeholder_res1_60),
    .arg2 (_placeholder_res1_67),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_35 (
    .res1 (_placeholder_res1_58),
    .arg1 (_GEN_10),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_36 (
    .res1 (_placeholder_res1_57),
    .arg1 (_placeholder_res1_58),
    .arg2 (_placeholder_res1_71),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_37 (
    .res1 (_placeholder_res1_56),
    .arg1 (_GEN_12),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_38 (
    .res1 (_placeholder_res1_55),
    .arg1 (_placeholder_res1_56),
    .arg2 (_placeholder_res1_75),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_39 (
    .res1 (_placeholder_res1_54),
    .arg1 (_GEN_14),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_40 (
    .res1 (_placeholder_res1_53),
    .arg1 (_placeholder_res1_54),
    .arg2 (_placeholder_res1_79),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_41 (
    .res1 (_placeholder_res1_52),
    .arg1 (_GEN_16),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_42 (
    .res1 (_placeholder_res1_51),
    .arg1 (_placeholder_res1_52),
    .arg2 (_placeholder_res1_83),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_43 (
    .res1 (_placeholder_res1_50),
    .arg1 (_GEN_18),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_44 (
    .res1 (_placeholder_res1_49),
    .arg1 (_placeholder_res1_50),
    .arg2 (_placeholder_res1_87),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_45 (
    .res1 (_placeholder_res1_48),
    .arg1 (_GEN_20),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_46 (
    .res1 (_placeholder_res1_47),
    .arg1 (_placeholder_res1_48),
    .arg2 (_placeholder_res1_91),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_47 (
    .res1 (_placeholder_res1_46),
    .arg1 (_GEN_22),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_48 (
    .res1 (_placeholder_res1_45),
    .arg1 (_placeholder_res1_46),
    .arg2 (_placeholder_res1_64),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_49 (
    .res1 (_placeholder_res1_44),
    .arg1 (_GEN_24),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_50 (
    .res1 (_placeholder_res1_43),
    .arg1 (_placeholder_res1_44),
    .arg2 (_placeholder_res1_68),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_51 (
    .res1 (_placeholder_res1_42),
    .arg1 (_GEN_26),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_52 (
    .res1 (_placeholder_res1_41),
    .arg1 (_placeholder_res1_42),
    .arg2 (_placeholder_res1_72),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_53 (
    .res1 (_placeholder_res1_40),
    .arg1 (_GEN_28),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_54 (
    .res1 (_placeholder_res1_39),
    .arg1 (_placeholder_res1_40),
    .arg2 (_placeholder_res1_76),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_55 (
    .res1 (_placeholder_res1_38),
    .arg1 (_GEN_30),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_56 (
    .res1 (_placeholder_res1_37),
    .arg1 (_placeholder_res1_38),
    .arg2 (_placeholder_res1_80),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_57 (
    .res1 (_placeholder_res1_36),
    .arg1 (_GEN_32),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_58 (
    .res1 (_placeholder_res1_35),
    .arg1 (_placeholder_res1_36),
    .arg2 (_placeholder_res1_84),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_59 (
    .res1 (_placeholder_res1_34),
    .arg1 (_GEN_34),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_60 (
    .res1 (_placeholder_res1_33),
    .arg1 (_placeholder_res1_34),
    .arg2 (_placeholder_res1_88),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_61 (
    .res1 (_placeholder_res1_32),
    .arg1 (_GEN_36),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_62 (
    .res1 (_placeholder_res1_31),
    .arg1 (_placeholder_res1_32),
    .arg2 (_placeholder_res1_92),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_63 (
    .res1 (_placeholder_res1_30),
    .arg1 (_GEN_38),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_64 (
    .res1 (_placeholder_res1_29),
    .arg1 (_placeholder_res1_30),
    .arg2 (_placeholder_res1_65),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_65 (
    .res1 (_placeholder_res1_28),
    .arg1 (_GEN_40),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_66 (
    .res1 (_placeholder_res1_27),
    .arg1 (_placeholder_res1_28),
    .arg2 (_placeholder_res1_69),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_67 (
    .res1 (_placeholder_res1_26),
    .arg1 (_GEN_42),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_68 (
    .res1 (_placeholder_res1_25),
    .arg1 (_placeholder_res1_26),
    .arg2 (_placeholder_res1_73),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_69 (
    .res1 (_placeholder_res1_24),
    .arg1 (_GEN_44),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_70 (
    .res1 (_placeholder_res1_23),
    .arg1 (_placeholder_res1_24),
    .arg2 (_placeholder_res1_77),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_71 (
    .res1 (_placeholder_res1_22),
    .arg1 (_GEN_46),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_72 (
    .res1 (_placeholder_res1_21),
    .arg1 (_placeholder_res1_22),
    .arg2 (_placeholder_res1_81),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_73 (
    .res1 (_placeholder_res1_20),
    .arg1 (_GEN_48),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_74 (
    .res1 (_placeholder_res1_19),
    .arg1 (_placeholder_res1_20),
    .arg2 (_placeholder_res1_85),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_75 (
    .res1 (_placeholder_res1_18),
    .arg1 (_GEN_50),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_76 (
    .res1 (_placeholder_res1_17),
    .arg1 (_placeholder_res1_18),
    .arg2 (_placeholder_res1_89),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_77 (
    .res1 (_placeholder_res1_16),
    .arg1 (_GEN_52),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_78 (
    .res1 (_placeholder_res1_15),
    .arg1 (_placeholder_res1_16),
    .arg2 (_placeholder_res1_93),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_79 (
    .res1 (_placeholder_res1_14),
    .arg1 (_GEN_54),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_80 (
    .res1 (_placeholder_res1_13),
    .arg1 (_placeholder_res1_14),
    .arg2 (_placeholder_res1_94),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_81 (
    .res1 (_placeholder_res1_12),
    .arg1 (_GEN_56),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_82 (
    .res1 (_placeholder_res1_11),
    .arg1 (_placeholder_res1_12),
    .arg2 (_placeholder_res1_90),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_83 (
    .res1 (_placeholder_res1_10),
    .arg1 (_GEN_58),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_84 (
    .res1 (_placeholder_res1_9),
    .arg1 (_placeholder_res1_10),
    .arg2 (_placeholder_res1_86),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_85 (
    .res1 (_placeholder_res1_8),
    .arg1 (_GEN_60),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_86 (
    .res1 (_placeholder_res1_7),
    .arg1 (_placeholder_res1_8),
    .arg2 (_placeholder_res1_82),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_87 (
    .res1 (_placeholder_res1_6),
    .arg1 (_GEN_62),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_88 (
    .res1 (_placeholder_res1_5),
    .arg1 (_placeholder_res1_6),
    .arg2 (_placeholder_res1_78),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_89 (
    .res1 (_placeholder_res1_4),
    .arg1 (_GEN_64),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_90 (
    .res1 (_placeholder_res1_3),
    .arg1 (_placeholder_res1_4),
    .arg2 (_placeholder_res1_74),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_91 (
    .res1 (_placeholder_res1_2),
    .arg1 (_GEN_66),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_92 (
    .res1 (_placeholder_res1_1),
    .arg1 (_placeholder_res1_2),
    .arg2 (_placeholder_res1_70),
    .clk  (clk)
  );
  __CAST_IN_bits_32_OUT_fix_0_32_0_0 placeholder_93 (
    .res1 (_placeholder_res1_0),
    .arg1 (_GEN_68),
    .clk  (clk)
  );
  __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 placeholder_94 (
    .res1 (_placeholder_res1),
    .arg1 (_placeholder_res1_0),
    .arg2 (_placeholder_res1_66),
    .clk  (clk)
  );
  assign encoded = {_GEN_66 ^ {_GEN_69[20:0], _GEN_69[31:21]}, _GEN_68};
endmodule

