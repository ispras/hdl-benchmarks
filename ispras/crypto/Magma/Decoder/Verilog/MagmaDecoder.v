module permut(
    input wire [2:0] tabId,
    input wire [3:0] val,
    output wire [3:0] out
);

  `define C(ind, val) assign tab[ind] = val
  wire [3:0] tab [127:0];
  `C(0, 4'd12);   `C(1, 4'd4);    `C(2, 4'd6);    `C(3, 4'd2);
  `C(4, 4'd10);   `C(5, 4'd5);    `C(6, 4'd11);   `C(7, 4'd9);
  `C(8, 4'd14);   `C(9, 4'd8);    `C(10, 4'd13);  `C(11, 4'd7);
  `C(12, 4'd0);   `C(13, 4'd3);   `C(14, 4'd15);  `C(15, 4'd1);
  `C(16, 4'd6);   `C(17, 4'd8);   `C(18, 4'd2);   `C(19, 4'd3);
  `C(20, 4'd9);   `C(21, 4'd10);  `C(22, 4'd5);   `C(23, 4'd12);
  `C(24, 4'd1);   `C(25, 4'd14);  `C(26, 4'd4);   `C(27, 4'd7);
  `C(28, 4'd11);  `C(29, 4'd13);  `C(30, 4'd0);   `C(31, 4'd15);
  `C(32, 4'd11);  `C(33, 4'd3);   `C(34, 4'd5);   `C(35, 4'd8);
  `C(36, 4'd2);   `C(37, 4'd15);  `C(38, 4'd10);  `C(39, 4'd13);
  `C(40, 4'd14);  `C(41, 4'd1);   `C(42, 4'd7);   `C(43, 4'd4);
  `C(44, 4'd12);  `C(45, 4'd9);   `C(46, 4'd6);   `C(47, 4'd0);
  `C(48, 4'd12);  `C(49, 4'd8);   `C(50, 4'd2);   `C(51, 4'd1);
  `C(52, 4'd13);  `C(53, 4'd4);   `C(54, 4'd15);  `C(55, 4'd6);
  `C(56, 4'd7);   `C(57, 4'd0);   `C(58, 4'd10);  `C(59, 4'd5);
  `C(60, 4'd3);   `C(61, 4'd14);  `C(62, 4'd9);   `C(63, 4'd11);
  `C(64, 4'd7);   `C(65, 4'd15);  `C(66, 4'd5);   `C(67, 4'd10);
  `C(68, 4'd8);   `C(69, 4'd1);   `C(70, 4'd6);   `C(71, 4'd13);
  `C(72, 4'd0);   `C(73, 4'd9);   `C(74, 4'd3);   `C(75, 4'd14);
  `C(76, 4'd11);  `C(77, 4'd4);   `C(78, 4'd2);   `C(79, 4'd12);
  `C(80, 4'd5);   `C(81, 4'd13);  `C(82, 4'd15);  `C(83, 4'd6);
  `C(84, 4'd9);   `C(85, 4'd2);   `C(86, 4'd12);  `C(87, 4'd10);
  `C(88, 4'd11);  `C(89, 4'd7);   `C(90, 4'd8);   `C(91, 4'd1);
  `C(92, 4'd4);   `C(93, 4'd3);   `C(94, 4'd14);  `C(95, 4'd0);
  `C(96, 4'd8);   `C(97, 4'd14);  `C(98, 4'd2);   `C(99, 4'd5);
  `C(100, 4'd6);  `C(101, 4'd9);  `C(102, 4'd1);  `C(103, 4'd12);
  `C(104, 4'd15); `C(105, 4'd4);  `C(106, 4'd11); `C(107, 4'd0);
  `C(108, 4'd13); `C(109, 4'd10); `C(110, 4'd3);  `C(111, 4'd7);
  `C(112, 4'd1);  `C(113, 4'd7);  `C(114, 4'd14); `C(115, 4'd13);
  `C(116, 4'd0);  `C(117, 4'd5);  `C(118, 4'd8);  `C(119, 4'd3);
  `C(120, 4'd4);  `C(121, 4'd15); `C(122, 4'd10); `C(123, 4'd6);
  `C(124, 4'd9);  `C(125, 4'd12); `C(126, 4'd11); `C(127, 4'd2);

  assign out = tab[tabId *16 + val];
endmodule

module round(
    input wire [31:0] left,
    input wire [31:0] right,
    input wire [31:0] key,
    output wire [31:0] out_left,
    output wire [31:0] out_right
);

  wire [31:0] sum;
  assign sum = right + key;
  wire [31:0] subst;
  genvar i;
  generate
  for (i = 7; i >= 0; i = i - 1) begin
    permut inst(
       .tabId(i[2:0]),
       .val(sum[i * 4 + 3 : i * 4]),
       .out(subst[i * 4 + 3 : i * 4])
    );
  end
  endgenerate

  wire [31:0] shifted = {subst[20:0], subst[31:21]};
  assign out_left = right;
  assign out_right = left ^ shifted;
endmodule

module MagmaDecoder(
    input wire [63:0] encoded,
    input wire [255:0] key,
    output wire [63:0] block
);

  `define C(ind, val) assign keys[ind] = val
  wire [31:0] keys [7:0];
  `C(0, key[255:224]); `C(1, key[223:192]);
  `C(2, key[191:160]); `C(3, key[159:128]);
  `C(4, key[127:96]);  `C(5, key[95:64]);
  `C(6, key[63:32]);   `C(7, key[31:0]);

  wire [31:0] lefts [32:0];
  wire [31:0] rights [32:0];
  assign lefts[0] = encoded[63:32];
  assign rights[0] = encoded[31:0];

  genvar i;
  generate
  for (i = 0; i < 8; i = i + 1) begin
    round inst(
        .left(lefts[i]), .right(rights[i]), .key(keys[i]),
        .out_left(lefts[i + 1]), .out_right(rights[i + 1])
    );
  end
  endgenerate

  generate
  for (i = 8; i < 32; i = i + 1) begin
    round inst(
        .left(lefts[i]), .right(rights[i]), .key(keys[7 - (i % 8)]),
        .out_left(lefts[i + 1]), .out_right(rights[i + 1])
    );
  end
  endgenerate

  assign block = {rights[32], lefts[32]};
endmodule
