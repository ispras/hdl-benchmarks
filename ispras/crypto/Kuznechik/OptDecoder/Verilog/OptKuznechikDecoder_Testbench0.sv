//===----------------------------------------------------------------------===//
//
// Part of the Utopia HLS Project, under the Apache License v2.0
// SPDX-License-Identifier: Apache-2.0
// Copyright 2025 ISP RAS (http://www.ispras.ru)
//
//===----------------------------------------------------------------------===//

// Total: 0 stages.

`timescale 1s/1s

module OptKuznechikDecoder_test0();

  localparam CIRCUIT_LATENCY = 0;

  reg [127:0] encoded;
  reg [255:0] key;
  reg [127:0] block;
  reg [127:0] expected;
  reg clk;

  OptKuznechikDecoder inst (
    .encoded(encoded),
    .key(key),
    .block(block)
//    .clk (clk)
  );

  initial clk = 0;

  always #1 clk = ~clk;

  initial begin

    @(negedge clk);
    $display("[OptKuznechikDecoder: test 0] Input ready.");
    
    encoded = 128'h7f679d90bebc24305a468d42b9d4edcd;
    key = 256'h8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef;
    expected = 128'h1122334455667700ffeeddccbbaa9988;
    $display("Input: [%0x], key: [%0x]", encoded, key);
  end

  initial begin
    // Wait for the first output.
    #(2*CIRCUIT_LATENCY+3);

    $dumpfile("OptKuznechikDecoder_test0.vcd");
    $dumpvars(0, OptKuznechikDecoder_test0);
    $display("[OptKuznechikDecoder: test 0] Started...");

    $display("Output: %0h", block);
    if (expected == block) begin
      $display("GOOD: %0h == %0h", expected, block);
    end else begin
      $display("BAD: %0h != %0h", expected, block);
      $display("[OptKuznechikDecoder: test 0] Stopped.");
      $finish;
    end

    $display("[OptKuznechikDecoder: test 0] Stopped.");
    $finish;
  end

endmodule
