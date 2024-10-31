//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : General Registers in Data Path Unit
//------------------------------------------------------
// File        : register.v
// Library     : none
// Description : General Registers in Data Path.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 22nd February 2003
// Creator         : Thorn Aitch
// Description     : Initial Design				  
//------------------------------------------------------
// Revision Number : 2
// Date of Change  : 30th April 2003
// Modifier        : Thorn Aitch
// Description     : Release Version 1.0
//======================================================
// Copyright (C) 2002-2003, Thorn Aitch
//
// Designs can be altered while keeping list of
// modifications "the same as in GNU" No money can
// be earned by selling the designs themselves, but
// anyone can get money by selling the implementation
// of the design, such as ICs based on some cores, 
// boards based on some schematics or Layouts, and
// even GUI interfaces to text mode drivers.
// "The same as GPL SW" Any update to the design
// should be documented and returned to the design. 
// Any derivative work based on the IP should be free
// under OpenIP License. Derivative work means any
// update, change or improvement on the design. 
// Any work based on the design can be either made
// free under OpenIP license or protected by any other
// license. Work based on the design means any work uses
// the OpenIP Licensed core as a building black without
// changing anything on it with any other blocks to
// produce larger design.  There is NO WARRANTY on the
// functionality or performance of the design on the
// real hardware implementation.
// On the other hand, the SuperH-2 ISA (Instruction Set
// Architecture) executed by Aquarius is rigidly
// the property of Renesas Corp. Then you have all 
// responsibility to judge if there are not any 
// infringements to Renesas's rights regarding your 
// Aquarius adoption into your design. 
// By adopting Aquarius, the user assumes all 
// responsibility for its use.
// This project may cause any damages around you, for 
// example, loss of properties, data, money, profits,
// life, or business etc. By adopting this source, 
// the user assumes all responsibility for its use.
//======================================================

`include "timescale.v"
`include "defines.v"

//*************************************************
// Module Definition
//*************************************************
module register(
    // system signal
    CLK, SLOT,
    // general register strobe and the number
    WRREG_Z,  WRREG_W,
    REGNUM_X, REGNUM_Y, REGNUM_Z, REGNUM_W,
    // input & outout
    REG_X, REG_Y, REG_0, ZBUS, WBUS
    );

//-------------------
// Module I/O Signals
//-------------------
    input  CLK;            // clock
    input  SLOT;           // cpu pipe slot

    input  WRREG_Z;        // write Rn from Z-bus
    input  WRREG_W;        // write Rn from W-bus

    input [3:0] REGNUM_X;  // register number to read to X-bus
    input [3:0] REGNUM_Y;  // register number to read to Y-bus
    input [3:0] REGNUM_Z;  // register number to write from Z-bus
    input [3:0] REGNUM_W;  // register number to write from W-bus

    output [31:0] REG_X;   // register output to X-BUS
    output [31:0] REG_Y;   // register output to Y-BUS
    output [31:0] REG_0;   // R0 value
    input  [31:0] ZBUS;    // Z-BUS
    input  [31:0] WBUS;    // W-BUS

//-----------------
// Internal Signals
//-----------------
    reg  [31:0] REG[0:15]; // General Register
    wire [31:0] REG_X;     // register out toward X
    wire [31:0] REG_Y;     // register out toward Y
    wire [31:0] REG_0;     // R0 value

//-----------------
// General Register
//-----------------
    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            //if (WRREG_Z & WRREG_W)     //WBUS has the higher priority than ZBUS.
            //    REG[REGNUM_W] <= WBUS;
            // WRREG_W  WRREG_Z REGNUM_W==REGNUM_Z : Operation
            // 0        0       *                  : No operation
            // 1        0       *                  : REG[REGNUM_W] <= WBUS;
            // 0        1       *                  : REG[REGNUM_Z] <= ZBUS;
            // 1        1       0                  : REG[REGNUM_W] <= WBUS; REG[REGNUM_Z] <= ZBUS;
            // 1        1       1                  : REG[REGNUM_Z] <= ZBUS;
                 if ( (WRREG_W) & ~(WRREG_Z))
                     REG[REGNUM_W] <= WBUS;
            else if (~(WRREG_W) &  (WRREG_Z))
                    REG[REGNUM_Z] <= ZBUS;
            else if ( (WRREG_W) &  (WRREG_Z) & ~(REGNUM_W==REGNUM_Z))
                begin
                    REG[REGNUM_W] <= WBUS;
                    REG[REGNUM_Z] <= ZBUS;
                end
            else if ( (WRREG_W) &  (WRREG_Z) &  (REGNUM_W==REGNUM_Z))
                    REG[REGNUM_Z] <= ZBUS;
        end
    end

    assign REG_X[31:0] = REG[REGNUM_X];
    assign REG_Y[31:0] = REG[REGNUM_Y];
    assign REG_0[31:0] = REG[4'h0];

//======================================================
  endmodule
//======================================================