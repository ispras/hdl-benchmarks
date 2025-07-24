module MagmaEncoder(
  input wire clk,
  input wire [63:0] _block,
  input wire [255:0] key,
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

  // ===== Pipe stage 0:
  wire [3:0] p0_array_index_14074_comb;
  wire [3:0] p0_subst0__3_comb;
  wire [31:0] p0_shifted__3_comb;
  wire [3:0] p0_bit_slice_14199_comb;
  wire [3:0] p0_bit_slice_14200_comb;
  wire [3:0] p0_bit_slice_14201_comb;
  wire [3:0] p0_bit_slice_14202_comb;
  wire [3:0] p0_bit_slice_14203_comb;
  wire [3:0] p0_bit_slice_14204_comb;
  wire [3:0] p0_bit_slice_14205_comb;
  wire [3:0] p0_bit_slice_14206_comb;
  wire [3:0] p0_bit_slice_14556_comb;
  wire [3:0] p0_bit_slice_14557_comb;
  wire [3:0] p0_bit_slice_14558_comb;
  wire [3:0] p0_bit_slice_14559_comb;
  wire [3:0] p0_bit_slice_14560_comb;
  wire [3:0] p0_bit_slice_14561_comb;
  wire [3:0] p0_bit_slice_14562_comb;
  wire [3:0] p0_bit_slice_14563_comb;
  wire [3:0] p0_bit_slice_14909_comb;
  wire [3:0] p0_bit_slice_14910_comb;
  wire [3:0] p0_bit_slice_14911_comb;
  wire [3:0] p0_bit_slice_14912_comb;
  wire [3:0] p0_bit_slice_14913_comb;
  wire [3:0] p0_bit_slice_14914_comb;
  wire [3:0] p0_bit_slice_14915_comb;
  wire [3:0] p0_bit_slice_14916_comb;
  assign p0_array_index_14074_comb = arr5__2[sum__3[23:20]];
  assign p0_subst0__3_comb = arr7[sum__3[31:28]];
  assign p0_shifted__3_comb = {p0_array_index_14074_comb[0], arr4__3[sum__3[19:16]], arr3__4[sum__3[15:12]], arr2__5[sum__3[11:8]], arr1__6[sum__3[7:4]], arr0__7[sum__3[3:0]], p0_subst0__3_comb, arr6__1[sum__3[27:24]], p0_array_index_14074_comb[3:1]};
  assign p0_bit_slice_14199_comb = sum__7[23:20];
  assign p0_bit_slice_14200_comb = sum__7[19:16];
  assign p0_bit_slice_14201_comb = sum__7[15:12];
  assign p0_bit_slice_14202_comb = sum__7[11:8];
  assign p0_bit_slice_14203_comb = sum__7[7:4];
  assign p0_bit_slice_14204_comb = sum__7[3:0];
  assign p0_bit_slice_14205_comb = sum__7[31:28];
  assign p0_bit_slice_14206_comb = sum__7[27:24];
  assign p0_bit_slice_14556_comb = sum__18[23:20];
  assign p0_bit_slice_14557_comb = sum__18[19:16];
  assign p0_bit_slice_14558_comb = sum__18[15:12];
  assign p0_bit_slice_14559_comb = sum__18[11:8];
  assign p0_bit_slice_14560_comb = sum__18[7:4];
  assign p0_bit_slice_14561_comb = sum__18[3:0];
  assign p0_bit_slice_14562_comb = sum__18[31:28];
  assign p0_bit_slice_14563_comb = sum__18[27:24];
  assign p0_bit_slice_14909_comb = sum__29[23:20];
  assign p0_bit_slice_14910_comb = sum__29[19:16];
  assign p0_bit_slice_14911_comb = sum__29[15:12];
  assign p0_bit_slice_14912_comb = sum__29[11:8];
  assign p0_bit_slice_14913_comb = sum__29[7:4];
  assign p0_bit_slice_14914_comb = sum__29[3:0];
  assign p0_bit_slice_14915_comb = sum__29[31:28];
  assign p0_bit_slice_14916_comb = sum__29[27:24];

  // Registers for pipe stage 0:
  reg [63:0] p0__block;
  reg [255:0] p0_key;
  reg [3:0] p1_arr5__2[16];
  reg [3:0] p1_arr4__3[16];
  reg [3:0] p1_arr3__4[16];
  reg [3:0] p1_arr2__5[16];
  reg [3:0] p1_arr1__6[16];
  reg [3:0] p1_arr0__7[16];
  reg [3:0] p1_arr7[16];
  reg [3:0] p1_arr6__1[16];
  reg [31:0] p1_shifted__3;
  reg [3:0] p2_bit_slice_14199;
  reg [3:0] p2_bit_slice_14200;
  reg [3:0] p2_bit_slice_14201;
  reg [3:0] p2_bit_slice_14202;
  reg [3:0] p2_bit_slice_14203;
  reg [3:0] p2_bit_slice_14204;
  reg [3:0] p2_bit_slice_14205;
  reg [3:0] p2_bit_slice_14206;
  reg [3:0] p5_bit_slice_14556;
  reg [3:0] p5_bit_slice_14557;
  reg [3:0] p5_bit_slice_14558;
  reg [3:0] p5_bit_slice_14559;
  reg [3:0] p5_bit_slice_14560;
  reg [3:0] p5_bit_slice_14561;
  reg [3:0] p5_bit_slice_14562;
  reg [3:0] p5_bit_slice_14563;
  reg [3:0] p8_bit_slice_14909;
  reg [3:0] p8_bit_slice_14910;
  reg [3:0] p8_bit_slice_14911;
  reg [3:0] p8_bit_slice_14912;
  reg [3:0] p8_bit_slice_14913;
  reg [3:0] p8_bit_slice_14914;
  reg [3:0] p8_bit_slice_14915;
  reg [3:0] p8_bit_slice_14916;
  always_ff @ (posedge clk) begin
    p0__block <= _block;
    p0_key <= key;
    p1_arr5__2 <= arr5__2;
    p1_arr4__3 <= arr4__3;
    p1_arr3__4 <= arr3__4;
    p1_arr2__5 <= arr2__5;
    p1_arr1__6 <= arr1__6;
    p1_arr0__7 <= arr0__7;
    p1_arr7 <= arr7;
    p1_arr6__1 <= arr6__1;
    p1_shifted__3 <= p0_shifted__3_comb;
    p2_bit_slice_14199 <= p0_bit_slice_14199_comb;
    p2_bit_slice_14200 <= p0_bit_slice_14200_comb;
    p2_bit_slice_14201 <= p0_bit_slice_14201_comb;
    p2_bit_slice_14202 <= p0_bit_slice_14202_comb;
    p2_bit_slice_14203 <= p0_bit_slice_14203_comb;
    p2_bit_slice_14204 <= p0_bit_slice_14204_comb;
    p2_bit_slice_14205 <= p0_bit_slice_14205_comb;
    p2_bit_slice_14206 <= p0_bit_slice_14206_comb;
    p5_bit_slice_14556 <= p0_bit_slice_14556_comb;
    p5_bit_slice_14557 <= p0_bit_slice_14557_comb;
    p5_bit_slice_14558 <= p0_bit_slice_14558_comb;
    p5_bit_slice_14559 <= p0_bit_slice_14559_comb;
    p5_bit_slice_14560 <= p0_bit_slice_14560_comb;
    p5_bit_slice_14561 <= p0_bit_slice_14561_comb;
    p5_bit_slice_14562 <= p0_bit_slice_14562_comb;
    p5_bit_slice_14563 <= p0_bit_slice_14563_comb;
    p8_bit_slice_14909 <= p0_bit_slice_14909_comb;
    p8_bit_slice_14910 <= p0_bit_slice_14910_comb;
    p8_bit_slice_14911 <= p0_bit_slice_14911_comb;
    p8_bit_slice_14912 <= p0_bit_slice_14912_comb;
    p8_bit_slice_14913 <= p0_bit_slice_14913_comb;
    p8_bit_slice_14914 <= p0_bit_slice_14914_comb;
    p8_bit_slice_14915 <= p0_bit_slice_14915_comb;
    p8_bit_slice_14916 <= p0_bit_slice_14916_comb;
  end

  // ===== Pipe stage 1:
  wire [3:0] p1_array_index_14000_comb;
  wire [3:0] p1_array_index_14030_comb;
  wire [3:0] p1_subst0_comb;
  wire [3:0] p1_array_index_14052_comb;
  wire [3:0] p1_subst0__1_comb;
  wire [31:0] p1_currLeft_comb;
  wire [31:0] p1_shifted_comb;
  wire [3:0] p1_subst0__2_comb;
  wire [31:0] p1_currRight_comb;
  wire [31:0] p1_shifted__1_comb;
  wire [31:0] p1_oldRight__1_comb;
  wire [31:0] p1_shifted__2_comb;
  wire [31:0] p1_bit_slice_13996_comb;
  wire [31:0] p1_bit_slice_14027_comb;
  wire [31:0] p1_oldRight__2_comb;
  wire [31:0] p1_bit_slice_14049_comb;
  wire [31:0] p1_oldRight__3_comb;
  wire [31:0] p1_bit_slice_14071_comb;
  wire [31:0] p1_bit_slice_14092_comb;
  wire [31:0] p1_bit_slice_14093_comb;
  wire [31:0] p1_bit_slice_14094_comb;
  wire [31:0] p1_bit_slice_14095_comb;
  assign p1_array_index_14000_comb = arr5__2[sum[23:20]];
  assign p1_array_index_14030_comb = arr5__2[sum__1[23:20]];
  assign p1_subst0_comb = arr7[sum[31:28]];
  assign p1_array_index_14052_comb = arr5__2[sum__2[23:20]];
  assign p1_subst0__1_comb = arr7[sum__1[31:28]];
  assign p1_currLeft_comb = p0__block[63:32];
  assign p1_shifted_comb = {p1_array_index_14000_comb[0], arr4__3[sum[19:16]], arr3__4[sum[15:12]], arr2__5[sum[11:8]], arr1__6[sum[7:4]], arr0__7[sum[3:0]], p1_subst0_comb, arr6__1[sum[27:24]], p1_array_index_14000_comb[3:1]};
  assign p1_subst0__2_comb = arr7[sum__2[31:28]];
  assign p1_currRight_comb = p0__block[31:0];
  assign p1_shifted__1_comb = {p1_array_index_14030_comb[0], arr4__3[sum__1[19:16]], arr3__4[sum__1[15:12]], arr2__5[sum__1[11:8]], arr1__6[sum__1[7:4]], arr0__7[sum__1[3:0]], p1_subst0__1_comb, arr6__1[sum__1[27:24]], p1_array_index_14030_comb[3:1]};
  assign p1_oldRight__1_comb = p1_currLeft_comb ^ p1_shifted_comb;
  assign p1_shifted__2_comb = {p1_array_index_14052_comb[0], arr4__3[sum__2[19:16]], arr3__4[sum__2[15:12]], arr2__5[sum__2[11:8]], arr1__6[sum__2[7:4]], arr0__7[sum__2[3:0]], p1_subst0__2_comb, arr6__1[sum__2[27:24]], p1_array_index_14052_comb[3:1]};
  assign p1_bit_slice_13996_comb = p0_key[255:224];
  assign p1_bit_slice_14027_comb = p0_key[223:192];
  assign p1_oldRight__2_comb = p1_currRight_comb ^ p1_shifted__1_comb;
  assign p1_bit_slice_14049_comb = p0_key[191:160];
  assign p1_oldRight__3_comb = p1_oldRight__1_comb ^ p1_shifted__2_comb;
  assign p1_bit_slice_14071_comb = p0_key[159:128];
  assign p1_bit_slice_14092_comb = p0_key[127:96];
  assign p1_bit_slice_14093_comb = p0_key[95:64];
  assign p1_bit_slice_14094_comb = p0_key[63:32];
  assign p1_bit_slice_14095_comb = p0_key[31:0];

  // Registers for pipe stage 1:
  reg [31:0] p1_bit_slice_13996;
  reg [31:0] p1_bit_slice_14027;
  reg [31:0] p1_oldRight__2;
  reg [31:0] p1_bit_slice_14049;
  reg [31:0] p1_oldRight__3;
  reg [31:0] p1_bit_slice_14071;
  reg [31:0] p1_bit_slice_14092;
  reg [31:0] p1_bit_slice_14093;
  reg [31:0] p1_bit_slice_14094;
  reg [31:0] p1_bit_slice_14095;
  reg [3:0] p2_arr5__2[16];
  reg [3:0] p2_arr4__3[16];
  reg [3:0] p2_arr3__4[16];
  reg [3:0] p2_arr2__5[16];
  reg [3:0] p2_arr1__6[16];
  reg [3:0] p2_arr0__7[16];
  reg [3:0] p2_arr7[16];
  reg [3:0] p2_arr6__1[16];
  always_ff @ (posedge clk) begin
    p1_bit_slice_13996 <= p1_bit_slice_13996_comb;
    p1_bit_slice_14027 <= p1_bit_slice_14027_comb;
    p1_oldRight__2 <= p1_oldRight__2_comb;
    p1_bit_slice_14049 <= p1_bit_slice_14049_comb;
    p1_oldRight__3 <= p1_oldRight__3_comb;
    p1_bit_slice_14071 <= p1_bit_slice_14071_comb;
    p1_bit_slice_14092 <= p1_bit_slice_14092_comb;
    p1_bit_slice_14093 <= p1_bit_slice_14093_comb;
    p1_bit_slice_14094 <= p1_bit_slice_14094_comb;
    p1_bit_slice_14095 <= p1_bit_slice_14095_comb;
    p2_arr5__2 <= p1_arr5__2;
    p2_arr4__3 <= p1_arr4__3;
    p2_arr3__4 <= p1_arr3__4;
    p2_arr2__5 <= p1_arr2__5;
    p2_arr1__6 <= p1_arr1__6;
    p2_arr0__7 <= p1_arr0__7;
    p2_arr7 <= p1_arr7;
    p2_arr6__1 <= p1_arr6__1;
  end

  // ===== Pipe stage 2:
  wire [3:0] p2_array_index_14137_comb;
  wire [3:0] p2_array_index_14158_comb;
  wire [3:0] p2_subst0__4_comb;
  wire [3:0] p2_array_index_14179_comb;
  wire [3:0] p2_subst0__5_comb;
  wire [31:0] p2_shifted__4_comb;
  wire [3:0] p2_subst0__6_comb;
  wire [31:0] p2_oldRight__4_comb;
  wire [31:0] p2_shifted__5_comb;
  wire [31:0] p2_oldRight__5_comb;
  wire [31:0] p2_shifted__6_comb;
  wire [31:0] p2_oldRight__6_comb;
  wire [31:0] p2_oldRight__7_comb;
  assign p2_array_index_14137_comb = p1_arr5__2[sum__4[23:20]];
  assign p2_array_index_14158_comb = p1_arr5__2[sum__5[23:20]];
  assign p2_subst0__4_comb = p1_arr7[sum__4[31:28]];
  assign p2_array_index_14179_comb = p1_arr5__2[sum__6[23:20]];
  assign p2_subst0__5_comb = p1_arr7[sum__5[31:28]];
  assign p2_shifted__4_comb = {p2_array_index_14137_comb[0], p1_arr4__3[sum__4[19:16]], p1_arr3__4[sum__4[15:12]], p1_arr2__5[sum__4[11:8]], p1_arr1__6[sum__4[7:4]], p1_arr0__7[sum__4[3:0]], p2_subst0__4_comb, p1_arr6__1[sum__4[27:24]], p2_array_index_14137_comb[3:1]};
  assign p2_subst0__6_comb = p1_arr7[sum__6[31:28]];
  assign p2_oldRight__4_comb = p1_oldRight__2 ^ p1_shifted__3;
  assign p2_shifted__5_comb = {p2_array_index_14158_comb[0], p1_arr4__3[sum__5[19:16]], p1_arr3__4[sum__5[15:12]], p1_arr2__5[sum__5[11:8]], p1_arr1__6[sum__5[7:4]], p1_arr0__7[sum__5[3:0]], p2_subst0__5_comb, p1_arr6__1[sum__5[27:24]], p2_array_index_14158_comb[3:1]};
  assign p2_oldRight__5_comb = p1_oldRight__3 ^ p2_shifted__4_comb;
  assign p2_shifted__6_comb = {p2_array_index_14179_comb[0], p1_arr4__3[sum__6[19:16]], p1_arr3__4[sum__6[15:12]], p1_arr2__5[sum__6[11:8]], p1_arr1__6[sum__6[7:4]], p1_arr0__7[sum__6[3:0]], p2_subst0__6_comb, p1_arr6__1[sum__6[27:24]], p2_array_index_14179_comb[3:1]};
  assign p2_oldRight__6_comb = p2_oldRight__4_comb ^ p2_shifted__5_comb;
  assign p2_oldRight__7_comb = p2_oldRight__5_comb ^ p2_shifted__6_comb;

  // Registers for pipe stage 2:
  reg [31:0] p2_bit_slice_13996;
  reg [31:0] p2_bit_slice_14027;
  reg [31:0] p2_bit_slice_14049;
  reg [31:0] p2_bit_slice_14071;
  reg [31:0] p2_bit_slice_14092;
  reg [31:0] p2_bit_slice_14093;
  reg [31:0] p2_oldRight__6;
  reg [31:0] p2_bit_slice_14094;
  reg [31:0] p2_oldRight__7;
  reg [31:0] p2_bit_slice_14095;
  reg [3:0] p3_arr5__2[16];
  reg [3:0] p3_arr4__3[16];
  reg [3:0] p3_arr3__4[16];
  reg [3:0] p3_arr2__5[16];
  reg [3:0] p3_arr1__6[16];
  reg [3:0] p3_arr0__7[16];
  reg [3:0] p3_arr7[16];
  reg [3:0] p3_arr6__1[16];
  always_ff @ (posedge clk) begin
    p2_bit_slice_13996 <= p1_bit_slice_13996;
    p2_bit_slice_14027 <= p1_bit_slice_14027;
    p2_bit_slice_14049 <= p1_bit_slice_14049;
    p2_bit_slice_14071 <= p1_bit_slice_14071;
    p2_bit_slice_14092 <= p1_bit_slice_14092;
    p2_bit_slice_14093 <= p1_bit_slice_14093;
    p2_oldRight__6 <= p2_oldRight__6_comb;
    p2_bit_slice_14094 <= p1_bit_slice_14094;
    p2_oldRight__7 <= p2_oldRight__7_comb;
    p2_bit_slice_14095 <= p1_bit_slice_14095;
    p3_arr5__2 <= p2_arr5__2;
    p3_arr4__3 <= p2_arr4__3;
    p3_arr3__4 <= p2_arr3__4;
    p3_arr2__5 <= p2_arr2__5;
    p3_arr1__6 <= p2_arr1__6;
    p3_arr0__7 <= p2_arr0__7;
    p3_arr7 <= p2_arr7;
    p3_arr6__1 <= p2_arr6__1;
  end

  // ===== Pipe stage 3:
  wire [3:0] p3_array_index_14259_comb;
  wire [3:0] p3_array_index_14273_comb;
  wire [3:0] p3_subst0__7_comb;
  wire [3:0] p3_array_index_14294_comb;
  wire [3:0] p3_subst0__8_comb;
  wire [3:0] p3_array_index_14315_comb;
  wire [31:0] p3_shifted__7_comb;
  wire [3:0] p3_subst0__9_comb;
  wire [31:0] p3_shifted__8_comb;
  wire [3:0] p3_subst0__10_comb;
  wire [3:0] p3_array_index_14435_comb;
  wire [31:0] p3_oldRight__8_comb;
  wire [31:0] p3_shifted__9_comb;
  wire [31:0] p3_oldRight__9_comb;
  wire [31:0] p3_shifted__10_comb;
  wire [3:0] p3_subst0__14_comb;
  wire [31:0] p3_oldRight__10_comb;
  wire [31:0] p3_oldRight__11_comb;
  wire [31:0] p3_shifted__14_comb;
  assign p3_array_index_14259_comb = p2_arr5__2[p2_bit_slice_14199];
  assign p3_array_index_14273_comb = p2_arr5__2[sum__8[23:20]];
  assign p3_subst0__7_comb = p2_arr7[p2_bit_slice_14205];
  assign p3_array_index_14294_comb = p2_arr5__2[sum__9[23:20]];
  assign p3_subst0__8_comb = p2_arr7[sum__8[31:28]];
  assign p3_array_index_14315_comb = p2_arr5__2[sum__10[23:20]];
  assign p3_shifted__7_comb = {p3_array_index_14259_comb[0], p2_arr4__3[p2_bit_slice_14200], p2_arr3__4[p2_bit_slice_14201], p2_arr2__5[p2_bit_slice_14202], p2_arr1__6[p2_bit_slice_14203], p2_arr0__7[p2_bit_slice_14204], p3_subst0__7_comb, p2_arr6__1[p2_bit_slice_14206], p3_array_index_14259_comb[3:1]};
  assign p3_subst0__9_comb = p2_arr7[sum__9[31:28]];
  assign p3_shifted__8_comb = {p3_array_index_14273_comb[0], p2_arr4__3[sum__8[19:16]], p2_arr3__4[sum__8[15:12]], p2_arr2__5[sum__8[11:8]], p2_arr1__6[sum__8[7:4]], p2_arr0__7[sum__8[3:0]], p3_subst0__8_comb, p2_arr6__1[sum__8[27:24]], p3_array_index_14273_comb[3:1]};
  assign p3_subst0__10_comb = p2_arr7[sum__10[31:28]];
  assign p3_array_index_14435_comb = p3_arr5__2[sum__14[23:20]];
  assign p3_oldRight__8_comb = p2_oldRight__6 ^ p3_shifted__7_comb;
  assign p3_shifted__9_comb = {p3_array_index_14294_comb[0], p2_arr4__3[sum__9[19:16]], p2_arr3__4[sum__9[15:12]], p2_arr2__5[sum__9[11:8]], p2_arr1__6[sum__9[7:4]], p2_arr0__7[sum__9[3:0]], p3_subst0__9_comb, p2_arr6__1[sum__9[27:24]], p3_array_index_14294_comb[3:1]};
  assign p3_oldRight__9_comb = p2_oldRight__7 ^ p3_shifted__8_comb;
  assign p3_shifted__10_comb = {p3_array_index_14315_comb[0], p2_arr4__3[sum__10[19:16]], p2_arr3__4[sum__10[15:12]], p2_arr2__5[sum__10[11:8]], p2_arr1__6[sum__10[7:4]], p2_arr0__7[sum__10[3:0]], p3_subst0__10_comb, p2_arr6__1[sum__10[27:24]], p3_array_index_14315_comb[3:1]};
  assign p3_subst0__14_comb = p3_arr7[sum__14[31:28]];
  assign p3_oldRight__10_comb = p3_oldRight__8_comb ^ p3_shifted__9_comb;
  assign p3_oldRight__11_comb = p3_oldRight__9_comb ^ p3_shifted__10_comb;
  assign p3_shifted__14_comb = {p3_array_index_14435_comb[0], p3_arr4__3[sum__14[19:16]], p3_arr3__4[sum__14[15:12]], p3_arr2__5[sum__14[11:8]], p3_arr1__6[sum__14[7:4]], p3_arr0__7[sum__14[3:0]], p3_subst0__14_comb, p3_arr6__1[sum__14[27:24]], p3_array_index_14435_comb[3:1]};

  // Registers for pipe stage 3:
  reg [31:0] p3_bit_slice_13996;
  reg [31:0] p3_bit_slice_14027;
  reg [31:0] p3_bit_slice_14049;
  reg [31:0] p3_bit_slice_14071;
  reg [31:0] p3_bit_slice_14092;
  reg [31:0] p3_bit_slice_14093;
  reg [31:0] p3_bit_slice_14094;
  reg [31:0] p3_bit_slice_14095;
  reg [31:0] p3_oldRight__10;
  reg [31:0] p3_oldRight__11;
  reg [3:0] p4_arr5__2[16];
  reg [3:0] p4_arr4__3[16];
  reg [3:0] p4_arr3__4[16];
  reg [3:0] p4_arr2__5[16];
  reg [3:0] p4_arr1__6[16];
  reg [3:0] p4_arr0__7[16];
  reg [3:0] p4_arr7[16];
  reg [3:0] p4_arr6__1[16];
  reg [31:0] p4_shifted__14;
  always_ff @ (posedge clk) begin
    p3_bit_slice_13996 <= p2_bit_slice_13996;
    p3_bit_slice_14027 <= p2_bit_slice_14027;
    p3_bit_slice_14049 <= p2_bit_slice_14049;
    p3_bit_slice_14071 <= p2_bit_slice_14071;
    p3_bit_slice_14092 <= p2_bit_slice_14092;
    p3_bit_slice_14093 <= p2_bit_slice_14093;
    p3_bit_slice_14094 <= p2_bit_slice_14094;
    p3_bit_slice_14095 <= p2_bit_slice_14095;
    p3_oldRight__10 <= p3_oldRight__10_comb;
    p3_oldRight__11 <= p3_oldRight__11_comb;
    p4_arr5__2 <= p3_arr5__2;
    p4_arr4__3 <= p3_arr4__3;
    p4_arr3__4 <= p3_arr3__4;
    p4_arr2__5 <= p3_arr2__5;
    p4_arr1__6 <= p3_arr1__6;
    p4_arr0__7 <= p3_arr0__7;
    p4_arr7 <= p3_arr7;
    p4_arr6__1 <= p3_arr6__1;
    p4_shifted__14 <= p3_shifted__14_comb;
  end

  // ===== Pipe stage 4:
  wire [3:0] p4_array_index_14372_comb;
  wire [3:0] p4_array_index_14393_comb;
  wire [3:0] p4_subst0__11_comb;
  wire [3:0] p4_array_index_14414_comb;
  wire [3:0] p4_subst0__12_comb;
  wire [31:0] p4_shifted__11_comb;
  wire [3:0] p4_subst0__13_comb;
  wire [31:0] p4_shifted__12_comb;
  wire [31:0] p4_oldRight__12_comb;
  wire [31:0] p4_shifted__13_comb;
  wire [31:0] p4_oldRight__13_comb;
  wire [31:0] p4_oldRight__14_comb;
  assign p4_array_index_14372_comb = p3_arr5__2[sum__11[23:20]];
  assign p4_array_index_14393_comb = p3_arr5__2[sum__12[23:20]];
  assign p4_subst0__11_comb = p3_arr7[sum__11[31:28]];
  assign p4_array_index_14414_comb = p3_arr5__2[sum__13[23:20]];
  assign p4_subst0__12_comb = p3_arr7[sum__12[31:28]];
  assign p4_shifted__11_comb = {p4_array_index_14372_comb[0], p3_arr4__3[sum__11[19:16]], p3_arr3__4[sum__11[15:12]], p3_arr2__5[sum__11[11:8]], p3_arr1__6[sum__11[7:4]], p3_arr0__7[sum__11[3:0]], p4_subst0__11_comb, p3_arr6__1[sum__11[27:24]], p4_array_index_14372_comb[3:1]};
  assign p4_subst0__13_comb = p3_arr7[sum__13[31:28]];
  assign p4_shifted__12_comb = {p4_array_index_14393_comb[0], p3_arr4__3[sum__12[19:16]], p3_arr3__4[sum__12[15:12]], p3_arr2__5[sum__12[11:8]], p3_arr1__6[sum__12[7:4]], p3_arr0__7[sum__12[3:0]], p4_subst0__12_comb, p3_arr6__1[sum__12[27:24]], p4_array_index_14393_comb[3:1]};
  assign p4_oldRight__12_comb = p3_oldRight__10 ^ p4_shifted__11_comb;
  assign p4_shifted__13_comb = {p4_array_index_14414_comb[0], p3_arr4__3[sum__13[19:16]], p3_arr3__4[sum__13[15:12]], p3_arr2__5[sum__13[11:8]], p3_arr1__6[sum__13[7:4]], p3_arr0__7[sum__13[3:0]], p4_subst0__13_comb, p3_arr6__1[sum__13[27:24]], p4_array_index_14414_comb[3:1]};
  assign p4_oldRight__13_comb = p3_oldRight__11 ^ p4_shifted__12_comb;
  assign p4_oldRight__14_comb = p4_oldRight__12_comb ^ p4_shifted__13_comb;

  // Registers for pipe stage 4:
  reg [31:0] p4_bit_slice_13996;
  reg [31:0] p4_bit_slice_14027;
  reg [31:0] p4_bit_slice_14049;
  reg [31:0] p4_bit_slice_14071;
  reg [31:0] p4_bit_slice_14092;
  reg [31:0] p4_bit_slice_14093;
  reg [31:0] p4_bit_slice_14094;
  reg [31:0] p4_bit_slice_14095;
  reg [31:0] p4_oldRight__13;
  reg [31:0] p4_oldRight__14;
  reg [3:0] p5_arr5__2[16];
  reg [3:0] p5_arr4__3[16];
  reg [3:0] p5_arr3__4[16];
  reg [3:0] p5_arr2__5[16];
  reg [3:0] p5_arr1__6[16];
  reg [3:0] p5_arr0__7[16];
  reg [3:0] p5_arr7[16];
  reg [3:0] p5_arr6__1[16];
  always_ff @ (posedge clk) begin
    p4_bit_slice_13996 <= p3_bit_slice_13996;
    p4_bit_slice_14027 <= p3_bit_slice_14027;
    p4_bit_slice_14049 <= p3_bit_slice_14049;
    p4_bit_slice_14071 <= p3_bit_slice_14071;
    p4_bit_slice_14092 <= p3_bit_slice_14092;
    p4_bit_slice_14093 <= p3_bit_slice_14093;
    p4_bit_slice_14094 <= p3_bit_slice_14094;
    p4_bit_slice_14095 <= p3_bit_slice_14095;
    p4_oldRight__13 <= p4_oldRight__13_comb;
    p4_oldRight__14 <= p4_oldRight__14_comb;
    p5_arr5__2 <= p4_arr5__2;
    p5_arr4__3 <= p4_arr4__3;
    p5_arr3__4 <= p4_arr3__4;
    p5_arr2__5 <= p4_arr2__5;
    p5_arr1__6 <= p4_arr1__6;
    p5_arr0__7 <= p4_arr0__7;
    p5_arr7 <= p4_arr7;
    p5_arr6__1 <= p4_arr6__1;
  end

  // ===== Pipe stage 5:
  wire [3:0] p5_array_index_14494_comb;
  wire [3:0] p5_array_index_14515_comb;
  wire [3:0] p5_subst0__15_comb;
  wire [3:0] p5_array_index_14536_comb;
  wire [3:0] p5_subst0__16_comb;
  wire [31:0] p5_shifted__15_comb;
  wire [3:0] p5_subst0__17_comb;
  wire [31:0] p5_oldRight__15_comb;
  wire [31:0] p5_shifted__16_comb;
  wire [31:0] p5_oldRight__16_comb;
  wire [31:0] p5_shifted__17_comb;
  wire [31:0] p5_oldRight__17_comb;
  wire [31:0] p5_oldRight__18_comb;
  assign p5_array_index_14494_comb = p4_arr5__2[sum__15[23:20]];
  assign p5_array_index_14515_comb = p4_arr5__2[sum__16[23:20]];
  assign p5_subst0__15_comb = p4_arr7[sum__15[31:28]];
  assign p5_array_index_14536_comb = p4_arr5__2[sum__17[23:20]];
  assign p5_subst0__16_comb = p4_arr7[sum__16[31:28]];
  assign p5_shifted__15_comb = {p5_array_index_14494_comb[0], p4_arr4__3[sum__15[19:16]], p4_arr3__4[sum__15[15:12]], p4_arr2__5[sum__15[11:8]], p4_arr1__6[sum__15[7:4]], p4_arr0__7[sum__15[3:0]], p5_subst0__15_comb, p4_arr6__1[sum__15[27:24]], p5_array_index_14494_comb[3:1]};
  assign p5_subst0__17_comb = p4_arr7[sum__17[31:28]];
  assign p5_oldRight__15_comb = p4_oldRight__13 ^ p4_shifted__14;
  assign p5_shifted__16_comb = {p5_array_index_14515_comb[0], p4_arr4__3[sum__16[19:16]], p4_arr3__4[sum__16[15:12]], p4_arr2__5[sum__16[11:8]], p4_arr1__6[sum__16[7:4]], p4_arr0__7[sum__16[3:0]], p5_subst0__16_comb, p4_arr6__1[sum__16[27:24]], p5_array_index_14515_comb[3:1]};
  assign p5_oldRight__16_comb = p4_oldRight__14 ^ p5_shifted__15_comb;
  assign p5_shifted__17_comb = {p5_array_index_14536_comb[0], p4_arr4__3[sum__17[19:16]], p4_arr3__4[sum__17[15:12]], p4_arr2__5[sum__17[11:8]], p4_arr1__6[sum__17[7:4]], p4_arr0__7[sum__17[3:0]], p5_subst0__17_comb, p4_arr6__1[sum__17[27:24]], p5_array_index_14536_comb[3:1]};
  assign p5_oldRight__17_comb = p5_oldRight__15_comb ^ p5_shifted__16_comb;
  assign p5_oldRight__18_comb = p5_oldRight__16_comb ^ p5_shifted__17_comb;

  // Registers for pipe stage 5:
  reg [31:0] p5_bit_slice_13996;
  reg [31:0] p5_bit_slice_14027;
  reg [31:0] p5_bit_slice_14049;
  reg [31:0] p5_bit_slice_14071;
  reg [31:0] p5_bit_slice_14092;
  reg [31:0] p5_bit_slice_14093;
  reg [31:0] p5_bit_slice_14094;
  reg [31:0] p5_bit_slice_14095;
  reg [31:0] p5_oldRight__17;
  reg [31:0] p5_oldRight__18;
  reg [3:0] p6_arr5__2[16];
  reg [3:0] p6_arr4__3[16];
  reg [3:0] p6_arr3__4[16];
  reg [3:0] p6_arr2__5[16];
  reg [3:0] p6_arr1__6[16];
  reg [3:0] p6_arr0__7[16];
  reg [3:0] p6_arr7[16];
  reg [3:0] p6_arr6__1[16];
  always_ff @ (posedge clk) begin
    p5_bit_slice_13996 <= p4_bit_slice_13996;
    p5_bit_slice_14027 <= p4_bit_slice_14027;
    p5_bit_slice_14049 <= p4_bit_slice_14049;
    p5_bit_slice_14071 <= p4_bit_slice_14071;
    p5_bit_slice_14092 <= p4_bit_slice_14092;
    p5_bit_slice_14093 <= p4_bit_slice_14093;
    p5_bit_slice_14094 <= p4_bit_slice_14094;
    p5_bit_slice_14095 <= p4_bit_slice_14095;
    p5_oldRight__17 <= p5_oldRight__17_comb;
    p5_oldRight__18 <= p5_oldRight__18_comb;
    p6_arr5__2 <= p5_arr5__2;
    p6_arr4__3 <= p5_arr4__3;
    p6_arr3__4 <= p5_arr3__4;
    p6_arr2__5 <= p5_arr2__5;
    p6_arr1__6 <= p5_arr1__6;
    p6_arr0__7 <= p5_arr0__7;
    p6_arr7 <= p5_arr7;
    p6_arr6__1 <= p5_arr6__1;
  end

  // ===== Pipe stage 6:
  wire [3:0] p6_array_index_14616_comb;
  wire [3:0] p6_array_index_14630_comb;
  wire [3:0] p6_subst0__18_comb;
  wire [3:0] p6_array_index_14651_comb;
  wire [3:0] p6_subst0__19_comb;
  wire [3:0] p6_array_index_14672_comb;
  wire [31:0] p6_shifted__18_comb;
  wire [3:0] p6_subst0__20_comb;
  wire [31:0] p6_shifted__19_comb;
  wire [3:0] p6_subst0__21_comb;
  wire [3:0] p6_array_index_14792_comb;
  wire [31:0] p6_oldRight__19_comb;
  wire [31:0] p6_shifted__20_comb;
  wire [31:0] p6_oldRight__20_comb;
  wire [31:0] p6_shifted__21_comb;
  wire [3:0] p6_subst0__25_comb;
  wire [31:0] p6_oldRight__21_comb;
  wire [31:0] p6_oldRight__22_comb;
  wire [31:0] p6_shifted__25_comb;
  assign p6_array_index_14616_comb = p5_arr5__2[p5_bit_slice_14556];
  assign p6_array_index_14630_comb = p5_arr5__2[sum__19[23:20]];
  assign p6_subst0__18_comb = p5_arr7[p5_bit_slice_14562];
  assign p6_array_index_14651_comb = p5_arr5__2[sum__20[23:20]];
  assign p6_subst0__19_comb = p5_arr7[sum__19[31:28]];
  assign p6_array_index_14672_comb = p5_arr5__2[sum__21[23:20]];
  assign p6_shifted__18_comb = {p6_array_index_14616_comb[0], p5_arr4__3[p5_bit_slice_14557], p5_arr3__4[p5_bit_slice_14558], p5_arr2__5[p5_bit_slice_14559], p5_arr1__6[p5_bit_slice_14560], p5_arr0__7[p5_bit_slice_14561], p6_subst0__18_comb, p5_arr6__1[p5_bit_slice_14563], p6_array_index_14616_comb[3:1]};
  assign p6_subst0__20_comb = p5_arr7[sum__20[31:28]];
  assign p6_shifted__19_comb = {p6_array_index_14630_comb[0], p5_arr4__3[sum__19[19:16]], p5_arr3__4[sum__19[15:12]], p5_arr2__5[sum__19[11:8]], p5_arr1__6[sum__19[7:4]], p5_arr0__7[sum__19[3:0]], p6_subst0__19_comb, p5_arr6__1[sum__19[27:24]], p6_array_index_14630_comb[3:1]};
  assign p6_subst0__21_comb = p5_arr7[sum__21[31:28]];
  assign p6_array_index_14792_comb = p6_arr5__2[sum__25[23:20]];
  assign p6_oldRight__19_comb = p5_oldRight__17 ^ p6_shifted__18_comb;
  assign p6_shifted__20_comb = {p6_array_index_14651_comb[0], p5_arr4__3[sum__20[19:16]], p5_arr3__4[sum__20[15:12]], p5_arr2__5[sum__20[11:8]], p5_arr1__6[sum__20[7:4]], p5_arr0__7[sum__20[3:0]], p6_subst0__20_comb, p5_arr6__1[sum__20[27:24]], p6_array_index_14651_comb[3:1]};
  assign p6_oldRight__20_comb = p5_oldRight__18 ^ p6_shifted__19_comb;
  assign p6_shifted__21_comb = {p6_array_index_14672_comb[0], p5_arr4__3[sum__21[19:16]], p5_arr3__4[sum__21[15:12]], p5_arr2__5[sum__21[11:8]], p5_arr1__6[sum__21[7:4]], p5_arr0__7[sum__21[3:0]], p6_subst0__21_comb, p5_arr6__1[sum__21[27:24]], p6_array_index_14672_comb[3:1]};
  assign p6_subst0__25_comb = p6_arr7[sum__25[31:28]];
  assign p6_oldRight__21_comb = p6_oldRight__19_comb ^ p6_shifted__20_comb;
  assign p6_oldRight__22_comb = p6_oldRight__20_comb ^ p6_shifted__21_comb;
  assign p6_shifted__25_comb = {p6_array_index_14792_comb[0], p6_arr4__3[sum__25[19:16]], p6_arr3__4[sum__25[15:12]], p6_arr2__5[sum__25[11:8]], p6_arr1__6[sum__25[7:4]], p6_arr0__7[sum__25[3:0]], p6_subst0__25_comb, p6_arr6__1[sum__25[27:24]], p6_array_index_14792_comb[3:1]};

  // Registers for pipe stage 6:
  reg [31:0] p6_bit_slice_13996;
  reg [31:0] p6_bit_slice_14027;
  reg [31:0] p6_bit_slice_14049;
  reg [31:0] p6_bit_slice_14071;
  reg [31:0] p6_bit_slice_14092;
  reg [31:0] p6_bit_slice_14093;
  reg [31:0] p6_bit_slice_14094;
  reg [31:0] p6_bit_slice_14095;
  reg [31:0] p6_oldRight__21;
  reg [31:0] p6_oldRight__22;
  reg [3:0] p7_arr5__2[16];
  reg [3:0] p7_arr4__3[16];
  reg [3:0] p7_arr3__4[16];
  reg [3:0] p7_arr2__5[16];
  reg [3:0] p7_arr1__6[16];
  reg [3:0] p7_arr0__7[16];
  reg [3:0] p7_arr7[16];
  reg [3:0] p7_arr6__1[16];
  reg [31:0] p7_shifted__25;
  always_ff @ (posedge clk) begin
    p6_bit_slice_13996 <= p5_bit_slice_13996;
    p6_bit_slice_14027 <= p5_bit_slice_14027;
    p6_bit_slice_14049 <= p5_bit_slice_14049;
    p6_bit_slice_14071 <= p5_bit_slice_14071;
    p6_bit_slice_14092 <= p5_bit_slice_14092;
    p6_bit_slice_14093 <= p5_bit_slice_14093;
    p6_bit_slice_14094 <= p5_bit_slice_14094;
    p6_bit_slice_14095 <= p5_bit_slice_14095;
    p6_oldRight__21 <= p6_oldRight__21_comb;
    p6_oldRight__22 <= p6_oldRight__22_comb;
    p7_arr5__2 <= p6_arr5__2;
    p7_arr4__3 <= p6_arr4__3;
    p7_arr3__4 <= p6_arr3__4;
    p7_arr2__5 <= p6_arr2__5;
    p7_arr1__6 <= p6_arr1__6;
    p7_arr0__7 <= p6_arr0__7;
    p7_arr7 <= p6_arr7;
    p7_arr6__1 <= p6_arr6__1;
    p7_shifted__25 <= p6_shifted__25_comb;
  end

  // ===== Pipe stage 7:
  wire [3:0] p7_array_index_14729_comb;
  wire [3:0] p7_array_index_14750_comb;
  wire [3:0] p7_subst0__22_comb;
  wire [3:0] p7_array_index_14771_comb;
  wire [3:0] p7_subst0__23_comb;
  wire [31:0] p7_shifted__22_comb;
  wire [3:0] p7_subst0__24_comb;
  wire [31:0] p7_shifted__23_comb;
  wire [31:0] p7_oldRight__23_comb;
  wire [31:0] p7_shifted__24_comb;
  wire [31:0] p7_oldRight__24_comb;
  wire [31:0] p7_oldRight__25_comb;
  assign p7_array_index_14729_comb = p6_arr5__2[sum__22[23:20]];
  assign p7_array_index_14750_comb = p6_arr5__2[sum__23[23:20]];
  assign p7_subst0__22_comb = p6_arr7[sum__22[31:28]];
  assign p7_array_index_14771_comb = p6_arr5__2[sum__24[23:20]];
  assign p7_subst0__23_comb = p6_arr7[sum__23[31:28]];
  assign p7_shifted__22_comb = {p7_array_index_14729_comb[0], p6_arr4__3[sum__22[19:16]], p6_arr3__4[sum__22[15:12]], p6_arr2__5[sum__22[11:8]], p6_arr1__6[sum__22[7:4]], p6_arr0__7[sum__22[3:0]], p7_subst0__22_comb, p6_arr6__1[sum__22[27:24]], p7_array_index_14729_comb[3:1]};
  assign p7_subst0__24_comb = p6_arr7[sum__24[31:28]];
  assign p7_shifted__23_comb = {p7_array_index_14750_comb[0], p6_arr4__3[sum__23[19:16]], p6_arr3__4[sum__23[15:12]], p6_arr2__5[sum__23[11:8]], p6_arr1__6[sum__23[7:4]], p6_arr0__7[sum__23[3:0]], p7_subst0__23_comb, p6_arr6__1[sum__23[27:24]], p7_array_index_14750_comb[3:1]};
  assign p7_oldRight__23_comb = p6_oldRight__21 ^ p7_shifted__22_comb;
  assign p7_shifted__24_comb = {p7_array_index_14771_comb[0], p6_arr4__3[sum__24[19:16]], p6_arr3__4[sum__24[15:12]], p6_arr2__5[sum__24[11:8]], p6_arr1__6[sum__24[7:4]], p6_arr0__7[sum__24[3:0]], p7_subst0__24_comb, p6_arr6__1[sum__24[27:24]], p7_array_index_14771_comb[3:1]};
  assign p7_oldRight__24_comb = p6_oldRight__22 ^ p7_shifted__23_comb;
  assign p7_oldRight__25_comb = p7_oldRight__23_comb ^ p7_shifted__24_comb;

  // Registers for pipe stage 7:
  reg [31:0] p7_bit_slice_13996;
  reg [31:0] p7_bit_slice_14027;
  reg [31:0] p7_bit_slice_14049;
  reg [31:0] p7_bit_slice_14071;
  reg [31:0] p7_bit_slice_14092;
  reg [31:0] p7_bit_slice_14093;
  reg [31:0] p7_oldRight__24;
  reg [31:0] p7_oldRight__25;
  reg [3:0] p8_arr5__2[16];
  reg [3:0] p8_arr4__3[16];
  reg [3:0] p8_arr3__4[16];
  reg [3:0] p8_arr2__5[16];
  reg [3:0] p8_arr1__6[16];
  reg [3:0] p8_arr0__7[16];
  reg [3:0] p8_arr7[16];
  reg [3:0] p8_arr6__1[16];
  always_ff @ (posedge clk) begin
    p7_bit_slice_13996 <= p6_bit_slice_13996;
    p7_bit_slice_14027 <= p6_bit_slice_14027;
    p7_bit_slice_14049 <= p6_bit_slice_14049;
    p7_bit_slice_14071 <= p6_bit_slice_14071;
    p7_bit_slice_14092 <= p6_bit_slice_14092;
    p7_bit_slice_14093 <= p6_bit_slice_14093;
    p7_oldRight__24 <= p7_oldRight__24_comb;
    p7_oldRight__25 <= p7_oldRight__25_comb;
    p8_arr5__2 <= p7_arr5__2;
    p8_arr4__3 <= p7_arr4__3;
    p8_arr3__4 <= p7_arr3__4;
    p8_arr2__5 <= p7_arr2__5;
    p8_arr1__6 <= p7_arr1__6;
    p8_arr0__7 <= p7_arr0__7;
    p8_arr7 <= p7_arr7;
    p8_arr6__1 <= p7_arr6__1;
  end

  // ===== Pipe stage 8:
  wire [3:0] p8_array_index_14847_comb;
  wire [3:0] p8_array_index_14868_comb;
  wire [3:0] p8_subst0__26_comb;
  wire [3:0] p8_array_index_14889_comb;
  wire [3:0] p8_subst0__27_comb;
  wire [31:0] p8_shifted__26_comb;
  wire [3:0] p8_subst0__28_comb;
  wire [31:0] p8_oldRight__26_comb;
  wire [31:0] p8_shifted__27_comb;
  wire [31:0] p8_oldRight__27_comb;
  wire [31:0] p8_shifted__28_comb;
  wire [31:0] p8_oldRight__28_comb;
  wire [31:0] p8_oldRight__29_comb;
  assign p8_array_index_14847_comb = p7_arr5__2[sum__26[23:20]];
  assign p8_array_index_14868_comb = p7_arr5__2[sum__27[23:20]];
  assign p8_subst0__26_comb = p7_arr7[sum__26[31:28]];
  assign p8_array_index_14889_comb = p7_arr5__2[sum__28[23:20]];
  assign p8_subst0__27_comb = p7_arr7[sum__27[31:28]];
  assign p8_shifted__26_comb = {p8_array_index_14847_comb[0], p7_arr4__3[sum__26[19:16]], p7_arr3__4[sum__26[15:12]], p7_arr2__5[sum__26[11:8]], p7_arr1__6[sum__26[7:4]], p7_arr0__7[sum__26[3:0]], p8_subst0__26_comb, p7_arr6__1[sum__26[27:24]], p8_array_index_14847_comb[3:1]};
  assign p8_subst0__28_comb = p7_arr7[sum__28[31:28]];
  assign p8_oldRight__26_comb = p7_oldRight__24 ^ p7_shifted__25;
  assign p8_shifted__27_comb = {p8_array_index_14868_comb[0], p7_arr4__3[sum__27[19:16]], p7_arr3__4[sum__27[15:12]], p7_arr2__5[sum__27[11:8]], p7_arr1__6[sum__27[7:4]], p7_arr0__7[sum__27[3:0]], p8_subst0__27_comb, p7_arr6__1[sum__27[27:24]], p8_array_index_14868_comb[3:1]};
  assign p8_oldRight__27_comb = p7_oldRight__25 ^ p8_shifted__26_comb;
  assign p8_shifted__28_comb = {p8_array_index_14889_comb[0], p7_arr4__3[sum__28[19:16]], p7_arr3__4[sum__28[15:12]], p7_arr2__5[sum__28[11:8]], p7_arr1__6[sum__28[7:4]], p7_arr0__7[sum__28[3:0]], p8_subst0__28_comb, p7_arr6__1[sum__28[27:24]], p8_array_index_14889_comb[3:1]};
  assign p8_oldRight__28_comb = p8_oldRight__26_comb ^ p8_shifted__27_comb;
  assign p8_oldRight__29_comb = p8_oldRight__27_comb ^ p8_shifted__28_comb;

  // Registers for pipe stage 8:
  reg [31:0] p8_bit_slice_13996;
  reg [31:0] p8_bit_slice_14027;
  reg [31:0] p8_oldRight__28;
  reg [31:0] p8_oldRight__29;
  always_ff @ (posedge clk) begin
    p8_bit_slice_13996 <= p7_bit_slice_13996;
    p8_bit_slice_14027 <= p7_bit_slice_14027;
    p8_oldRight__28 <= p8_oldRight__28_comb;
    p8_oldRight__29 <= p8_oldRight__29_comb;
  end

  // ===== Pipe stage 9:
  wire [3:0] p9_array_index_14957_comb;
  wire [3:0] p9_subst0__29_comb;
  wire [3:0] p9_array_index_14992_comb;
  wire [3:0] p9_array_index_14971_comb;
  wire [31:0] p9_shifted__29_comb;
  wire [3:0] p9_subst0__31_comb;
  wire [3:0] p9_subst0__30_comb;
  wire [31:0] p9_oldRight__30_comb;
  wire [31:0] p9_shifted__31_comb;
  wire [31:0] p9_shifted__30_comb;
  wire [31:0] p9_resRight_comb;
  wire [31:0] p9_oldRight__31_comb;
  wire [63:0] p9_concat_15011_comb;
  assign p9_array_index_14957_comb = p8_arr5__2[p8_bit_slice_14909];
  assign p9_subst0__29_comb = p8_arr7[p8_bit_slice_14915];
  assign p9_array_index_14992_comb = p8_arr5__2[sum__31[23:20]];
  assign p9_array_index_14971_comb = p8_arr5__2[sum__30[23:20]];
  assign p9_shifted__29_comb = {p9_array_index_14957_comb[0], p8_arr4__3[p8_bit_slice_14910], p8_arr3__4[p8_bit_slice_14911], p8_arr2__5[p8_bit_slice_14912], p8_arr1__6[p8_bit_slice_14913], p8_arr0__7[p8_bit_slice_14914], p9_subst0__29_comb, p8_arr6__1[p8_bit_slice_14916], p9_array_index_14957_comb[3:1]};
  assign p9_subst0__31_comb = p8_arr7[sum__31[31:28]];
  assign p9_subst0__30_comb = p8_arr7[sum__30[31:28]];
  assign p9_oldRight__30_comb = p8_oldRight__28 ^ p9_shifted__29_comb;
  assign p9_shifted__31_comb = {p9_array_index_14992_comb[0], p8_arr4__3[sum__31[19:16]], p8_arr3__4[sum__31[15:12]], p8_arr2__5[sum__31[11:8]], p8_arr1__6[sum__31[7:4]], p8_arr0__7[sum__31[3:0]], p9_subst0__31_comb, p8_arr6__1[sum__31[27:24]], p9_array_index_14992_comb[3:1]};
  assign p9_shifted__30_comb = {p9_array_index_14971_comb[0], p8_arr4__3[sum__30[19:16]], p8_arr3__4[sum__30[15:12]], p8_arr2__5[sum__30[11:8]], p8_arr1__6[sum__30[7:4]], p8_arr0__7[sum__30[3:0]], p9_subst0__30_comb, p8_arr6__1[sum__30[27:24]], p9_array_index_14971_comb[3:1]};
  assign p9_resRight_comb = p9_oldRight__30_comb ^ p9_shifted__31_comb;
  assign p9_oldRight__31_comb = p8_oldRight__29 ^ p9_shifted__30_comb;
  assign p9_concat_15011_comb = {p9_resRight_comb, p9_oldRight__31_comb};

  // Registers for pipe stage 9:
  reg [63:0] p9_concat_15011;
  always_ff @ (posedge clk) begin
    p9_concat_15011 <= p9_concat_15011_comb;
  end

  // ===== Instantiations

  MagmaAdder __MagmaEncoder__MagmaAdder_sum_inst (
      .clk(clk),
      .left(p1_currRight_comb),
      .right(p1_bit_slice_13996_comb),
      .out(sum)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__1_inst (
      .clk(clk),
      .left(p1_oldRight__1_comb),
      .right(p1_bit_slice_14027_comb),
      .out(sum__1)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__2_inst (
      .clk(clk),
      .left(p1_oldRight__2_comb),
      .right(p1_bit_slice_14049_comb),
      .out(sum__2)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__3_inst (
      .clk(clk),
      .left(p1_oldRight__3_comb),
      .right(p1_bit_slice_14071_comb),
      .out(sum__3)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__4_inst (
      .clk(clk),
      .left(p2_oldRight__4_comb),
      .right(p1_bit_slice_14092),
      .out(sum__4)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__5_inst (
      .clk(clk),
      .left(p2_oldRight__5_comb),
      .right(p1_bit_slice_14093),
      .out(sum__5)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__6_inst (
      .clk(clk),
      .left(p2_oldRight__6_comb),
      .right(p1_bit_slice_14094),
      .out(sum__6)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__7_inst (
      .clk(clk),
      .left(p2_oldRight__7_comb),
      .right(p1_bit_slice_14095),
      .out(sum__7)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__8_inst (
      .clk(clk),
      .left(p3_oldRight__8_comb),
      .right(p2_bit_slice_13996),
      .out(sum__8)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__9_inst (
      .clk(clk),
      .left(p3_oldRight__9_comb),
      .right(p2_bit_slice_14027),
      .out(sum__9)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__10_inst (
      .clk(clk),
      .left(p3_oldRight__10_comb),
      .right(p2_bit_slice_14049),
      .out(sum__10)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__11_inst (
      .clk(clk),
      .left(p3_oldRight__11),
      .right(p3_bit_slice_14071),
      .out(sum__11)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__12_inst (
      .clk(clk),
      .left(p4_oldRight__12_comb),
      .right(p3_bit_slice_14092),
      .out(sum__12)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__13_inst (
      .clk(clk),
      .left(p4_oldRight__13_comb),
      .right(p3_bit_slice_14093),
      .out(sum__13)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__14_inst (
      .clk(clk),
      .left(p4_oldRight__14_comb),
      .right(p3_bit_slice_14094),
      .out(sum__14)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__15_inst (
      .clk(clk),
      .left(p5_oldRight__15_comb),
      .right(p4_bit_slice_14095),
      .out(sum__15)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__16_inst (
      .clk(clk),
      .left(p5_oldRight__16_comb),
      .right(p4_bit_slice_13996),
      .out(sum__16)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__17_inst (
      .clk(clk),
      .left(p5_oldRight__17_comb),
      .right(p4_bit_slice_14027),
      .out(sum__17)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__18_inst (
      .clk(clk),
      .left(p5_oldRight__18_comb),
      .right(p4_bit_slice_14049),
      .out(sum__18)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__19_inst (
      .clk(clk),
      .left(p6_oldRight__19_comb),
      .right(p5_bit_slice_14071),
      .out(sum__19)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__20_inst (
      .clk(clk),
      .left(p6_oldRight__20_comb),
      .right(p5_bit_slice_14092),
      .out(sum__20)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__21_inst (
      .clk(clk),
      .left(p6_oldRight__21_comb),
      .right(p5_bit_slice_14093),
      .out(sum__21)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__22_inst (
      .clk(clk),
      .left(p6_oldRight__22),
      .right(p6_bit_slice_14094),
      .out(sum__22)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__23_inst (
      .clk(clk),
      .left(p7_oldRight__23_comb),
      .right(p6_bit_slice_14095),
      .out(sum__23)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__24_inst (
      .clk(clk),
      .left(p7_oldRight__24_comb),
      .right(p6_bit_slice_14095),
      .out(sum__24)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__25_inst (
      .clk(clk),
      .left(p7_oldRight__25_comb),
      .right(p6_bit_slice_14094),
      .out(sum__25)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__26_inst (
      .clk(clk),
      .left(p8_oldRight__26_comb),
      .right(p7_bit_slice_14093),
      .out(sum__26)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__27_inst (
      .clk(clk),
      .left(p8_oldRight__27_comb),
      .right(p7_bit_slice_14092),
      .out(sum__27)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__28_inst (
      .clk(clk),
      .left(p8_oldRight__28_comb),
      .right(p7_bit_slice_14071),
      .out(sum__28)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__29_inst (
      .clk(clk),
      .left(p8_oldRight__29_comb),
      .right(p7_bit_slice_14049),
      .out(sum__29)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__30_inst (
      .clk(clk),
      .left(p9_oldRight__30_comb),
      .right(p8_bit_slice_14027),
      .out(sum__30)
  );

  MagmaAdder __MagmaEncoder__MagmaAdder_sum__31_inst (
      .clk(clk),
      .left(p9_oldRight__31_comb),
      .right(p8_bit_slice_13996),
      .out(sum__31)
  );
  assign out = p9_concat_15011;
endmodule
