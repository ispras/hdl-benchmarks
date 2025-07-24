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

module MagmaEncoder_test0();

  localparam CIRCUIT_LATENCY = 0;

  reg [63:0] block;
  reg [255:0] key;
  reg [63:0] encoded;
  reg [63:0] expected;
  reg clk;

  MagmaEncoder inst (
    .block(block),
    .key(key),
    .encoded(encoded)//,
    //.clk (clk)
  );

  initial clk = 0;

  always #1 clk = ~clk;

  initial begin

    @(negedge clk);
    $display("[MagmaEncoder: test 0] Input ready.");
    
    block = 64'hfedcba9876543210;
    key = 256'hffeeddccbbaa99887766554433221100f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff;
    expected = 64'h4ee901e5c2d8ca3d;
    $display("Input: [%0x], key: [%0x]", block, key);
  end

  initial begin
    // Wait for the first output.
    #(2*CIRCUIT_LATENCY+3);

    $dumpfile("MagmaEncoder_test0.vcd");
    $dumpvars(0, MagmaEncoder_test0);
    $display("[MagmaEncoder: test 0] Started...");

    $display("Output: %0h", encoded);
    if (expected == encoded) begin
      $display("GOOD: %0h == %0h", expected, encoded);
    end else begin
      $display("BAD: %0h != %0h", expected, encoded);
      $display("[MagmaEncoder: test 0] Stopped.");
      $finish;
    end

    $display("[MagmaEncoder: test 0] Stopped.");
    $finish;
  end

endmodule
