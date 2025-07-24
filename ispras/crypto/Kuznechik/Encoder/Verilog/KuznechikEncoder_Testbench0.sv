//===----------------------------------------------------------------------===//
//
// Part of the Utopia HLS Project, under the Apache License v2.0
// SPDX-License-Identifier: Apache-2.0
// Copyright 2025 ISP RAS (http://www.ispras.ru)
//
//===----------------------------------------------------------------------===//

// Total: 0 stages.

`timescale 1s/1s

module KuznechikEncoder_test0();

  localparam CIRCUIT_LATENCY = 0;

  reg [127:0] block;
  reg [255:0] key;
  reg [127:0] encoded;
  reg [127:0] expected;
  reg clk;

  KuznechikEncoder inst (
    .block(block),
    .key(key),
    .encoded(encoded)//,
    //.clk (clk)
  );

  initial clk = 0;

  always #1 clk = ~clk;

  initial begin

    @(negedge clk);
    $display("[KuznechikEncoder: test 0] Input ready.");
    
    block = 128'h1122334455667700ffeeddccbbaa9988;
    key = 256'h8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef;
    expected = 128'h7f679d90bebc24305a468d42b9d4edcd;
    $display("Input: [%0x], key: [%0x]", block, key);
  end

  initial begin
    // Wait for the first output.
    #(2*CIRCUIT_LATENCY+3);

    $dumpfile("KuznechikEncoder_test0.vcd");
    $dumpvars(0, KuznechikEncoder_test0);
    $display("[KuznechikEncoder: test 0] Started...");

    $display("Output: %0h", encoded);
    if (expected == encoded) begin
      $display("GOOD: %0h == %0h", expected, encoded);
    end else begin
      $display("BAD: %0h != %0h", expected, encoded);
      $display("[KuznechikEncoder: test 0] Stopped.");
      $finish;
    end

    $display("[KuznechikEncoder: test 0] Stopped.");
    $finish;
  end

endmodule
