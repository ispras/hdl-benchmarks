// This file has been automatically generated by Utopia HLS at 9-6-2025 21:46:32.

module __FIFO_IN_128_OUT_128_9 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[8:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 8; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[8];
endmodule // __FIFO_IN_128_OUT_128_9

module __FIFO_IN_128_OUT_128_8 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[7:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 7; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[7];
endmodule // __FIFO_IN_128_OUT_128_8

module __FIFO_IN_128_OUT_128_7 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[6:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 6; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[6];
endmodule // __FIFO_IN_128_OUT_128_7

module __FIFO_IN_128_OUT_128_6 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[5:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 5; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[5];
endmodule // __FIFO_IN_128_OUT_128_6

module __FIFO_IN_128_OUT_128_5 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[4:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 4; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[4];
endmodule // __FIFO_IN_128_OUT_128_5

module __FIFO_IN_128_OUT_128_4 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[3:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 3; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[3];
endmodule // __FIFO_IN_128_OUT_128_4

module __FIFO_IN_128_OUT_128_3 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[2:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 2; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[2];
endmodule // __FIFO_IN_128_OUT_128_3

module __FIFO_IN_128_OUT_128_2 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[1:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 1; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[1];
endmodule // __FIFO_IN_128_OUT_128_2

module __FIFO_IN_128_OUT_128_1 (input [127:0] arg1, output [127:0] res1, input clk);
  reg [127:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_128_OUT_128_1

module __FIFO_IN_120_OUT_120_1 (input [119:0] arg1, output [119:0] res1, input clk);
  reg [119:0] r[0:0];

  integer i;
  always @ (posedge clk) begin
    for (i = 0; i != 0; i = i - 1) begin
      r[i] <= r[i - 1];
    end
    r[0] <= arg1;
  end
  assign res1 = r[0];
endmodule // __FIFO_IN_120_OUT_120_1

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






