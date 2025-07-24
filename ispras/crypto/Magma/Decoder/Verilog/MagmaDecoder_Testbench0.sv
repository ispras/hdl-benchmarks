//===----------------------------------------------------------------------===//
//
// Part of the Utopia HLS Project, under the Apache License v2.0
// SPDX-License-Identifier: Apache-2.0
// Copyright 2025 ISP RAS (http://www.ispras.ru)
//
//===----------------------------------------------------------------------===//

// Addition (integer): 2 stages each.
// Total: 64 stages.

`timescale 1s/1s

module MagmaDecoder_test0();

  localparam CIRCUIT_LATENCY = 0;

  reg [63:0] encoded;
  reg [255:0] key;
  reg [63:0] block;
  reg [63:0] expected;
  reg clk;

  MagmaDecoder inst (
    .encoded(encoded),
    .key(key),
    .block(block)//,
    //.clk (clk)
  );

  initial clk = 0;

  always #1 clk = ~clk;

  initial begin

    @(negedge clk);
    $display("[MagmaDecoder: test 0] Input ready.");
    
    encoded = 64'h4ee901e5c2d8ca3d;
    key = 256'hffeeddccbbaa99887766554433221100f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff;
    expected = 64'hfedcba9876543210;
    $display("Input: [%0x], key: [%0x]", block, key);
  end

  initial begin
    // Wait for the first output.
    #(2*CIRCUIT_LATENCY+3);

    $dumpfile("MagmaDecoder_test0.vcd");
    $dumpvars(0, MagmaDecoder_test0);
    $display("[MagmaDecoder: test 0] Started...");

    $display("Output: %0h", block);
    if (expected == block) begin
      $display("GOOD: %0h == %0h", expected, block);
    end else begin
      $display("BAD: %0h != %0h", expected, block);
      $display("[MagmaDecoder: test 0] Stopped.");
      $finish;
    end

    $display("[MagmaDecoder: test 0] Stopped.");
    $finish;
  end

endmodule
