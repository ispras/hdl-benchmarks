// This file has been automatically generated by Utopia HLS at 16-5-2025 18:22:51.

module __FIFO_IN_64_OUT_64_1 (input [63:0] arg1, output [63:0] res1, input clk);
  reg [63:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_64_OUT_64_1

module __FIFO_IN_32_OUT_32_9 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[8:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 8; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[8];
endmodule // __FIFO_IN_32_OUT_32_9

module __FIFO_IN_21_OUT_21_1 (input [20:0] arg1, output [20:0] res1, input clk);
  reg [20:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_21_OUT_21_1

module __FIFO_IN_11_OUT_11_1 (input [10:0] arg1, output [10:0] res1, input clk);
  reg [10:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_11_OUT_11_1

module __FIFO_IN_32_OUT_32_8 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[7:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 7; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[7];
endmodule // __FIFO_IN_32_OUT_32_8

module __FIFO_IN_24_OUT_24_1 (input [23:0] arg1, output [23:0] res1, input clk);
  reg [23:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_24_OUT_24_1

module __FIFO_IN_32_OUT_32_7 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[6:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 6; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[6];
endmodule // __FIFO_IN_32_OUT_32_7

module __FIFO_IN_12_OUT_12_1 (input [11:0] arg1, output [11:0] res1, input clk);
  reg [11:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_12_OUT_12_1

module __FIFO_IN_32_OUT_32_6 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[5:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 5; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[5];
endmodule // __FIFO_IN_32_OUT_32_6

module __FIFO_IN_32_OUT_32_5 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[4:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 4; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[4];
endmodule // __FIFO_IN_32_OUT_32_5

module __FIFO_IN_32_OUT_32_4 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[3:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 3; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[3];
endmodule // __FIFO_IN_32_OUT_32_4

module __FIFO_IN_32_OUT_32_3 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[2:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 2; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[2];
endmodule // __FIFO_IN_32_OUT_32_3

module __FIFO_IN_20_OUT_20_1 (input [19:0] arg1, output [19:0] res1, input clk);
  reg [19:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_20_OUT_20_1

module __FIFO_IN_32_OUT_32_2 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[1:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 1; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[1];
endmodule // __FIFO_IN_32_OUT_32_2

module __FIFO_IN_4_OUT_4_1 (input [3:0] arg1, output [3:0] res1, input clk);
  reg [3:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_4_OUT_4_1

module __FIFO_IN_8_OUT_8_1 (input [7:0] arg1, output [7:0] res1, input clk);
  reg [7:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_8_OUT_8_1

module __FIFO_IN_32_OUT_32_1 (input [31:0] arg1, output [31:0] res1, input clk);
  reg [31:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_32_OUT_32_1


module __CAST_IN_bits_32_OUT_fix_0_32_0_0 (input [31:0] arg1, output [31:0] res1, input clk);
  wire [31:0] cat;

  assign cat = {{0{1'h0}}, arg1};
  assign res1 = cat[31:0];
endmodule // __CAST_IN_bits_32_OUT_fix_0_32_0_0



module __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0 (input [31:0] arg1, input [31:0] arg2, output [31:0] res1, input clk);
  wire [31:0] r;
  wire [31:0] cat;

  wire [31:0] arg1_prepared;
  wire [31:0] arg2_prepared;

  assign arg1_prepared = {{0{1'h0}}, arg1};
  assign arg2_prepared = {{0{1'h0}}, arg2};

  assign r = arg1_prepared + arg2_prepared;

  assign cat = {{0{1'h0}}, r};
  assign res1 = cat[31:0];
endmodule // __ADD_IN_fix_0_32_0_IN_fix_0_32_0_OUT_fix_0_32_0_0



