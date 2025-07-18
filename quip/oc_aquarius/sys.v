//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : System Resources
//------------------------------------------------------
// File        : sys.v
// Library     : none
// Description : Interrupt Control
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 15th February 2003
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

//======================================================
// SYS : System resources
//
//      [INTCTL] Interrupt Control (address0) 
//               permitted only 32bit access
//      bit31: Emulate NMI Interrupt     (Write Only)
//      bit30: Emulate IRQ Interrupt     (Write Only)
//      bit29: Emulate CPU Address Error (Write Only)
//      bit28: Emulate DMA Address Error (Write Only)
//      bit27: Emulate Manual Reset      (Write Only)                               
//      bit26: reserved

//      bit25: INTTMR OFF/ON             (0:OFF, 1:ON)
//      bit24: Address Break(NMI) OFF/ON (0:OFF, 1:ON)
                           
//      bit23: IRQ ILevel 3
//      bit22: IRQ ILevel 2
//      bit21: IRQ ILevel 1
//      bit20: IRQ ILevel 0

//      bit19: IRQ Vector 7
//      bit18: IRQ Vector 6
//      bit17: IRQ Vector 5
//      bit16: IRQ Vector 4
//      bit15: IRQ Vector 3
//      bit14: IRQ Vector 2
//      bit13: IRQ Vector 1
//      bit12: IRQ Vector 0

//      bit11: INTTMR11 (12 bit interval timer)
//      ...
//      bit 0: INTTMR00 (12 bit interval timer)
//
//      [BRKADR] Break Address (NMI) (address4)
//               permitted only 32bit access
//      bit31: BRKADR31 Break Address31
//      ...
//      bit00: BRKADR00 Break Address00
//======================================================

//*************************************************
// Module Definition
//*************************************************
module sys (
               CLK_SRC, CLK, SLP, WAKEUP, RST, 
               CE, WE, SEL, ACK, 
               DATI, DATO,
               EVENT_REQ,
               EVENT_ACK,
               EVENT_INFO,
               STB,
               ADR
           );

//-------------------
// Module I/O Signals
//-------------------
    input  CLK_SRC;      // non stop clock
    output CLK;          // internal system clock, which stops during sleep
    input  SLP;          // sleep request issued by SLEEP instruction
    input  WAKEUP;       // asynchronous wake up request 
    input  RST;          // reset
    input  CE;           // chip enable
    input  WE;           // write enable (read = 0, write = 1)
    input  ACK;          // wishbone acknowledge
    input  [3:0]SEL;     // data valid position
    input  [31:0] DATI;  // write data
    output [31:0] DATO;  // read data
    output [2:0] EVENT_REQ;   // event request
    input  EVENT_ACK;         // event acknowledge
    output [11:0] EVENT_INFO; // event information (ILEVEL[3:0],VECTOR[7:0])
    input  STB;          // address strobe
    input  [31:0] ADR;   // address

//-----------------
// Internal Signals
//-----------------
    wire   CLK;           // internal system clock, which stops during sleep
    reg    [25:0] INTCTL; // INTCTL register
    reg    [31:0] BRKADR; // BRKADR register
    reg    [31:0] DATO;   // wishbone data output
    reg    F_NMI;    // event flag
    reg    F_IRQ;    // event flag
    reg    F_CPUERR; // event flag
    reg    F_DMAERR; // event flag
    reg    F_MRES;   // event flag
    reg    [2:0]  EVENT_REQ;
    reg    [11:0] EVENT_INFO;
    reg    STOP_A;   // clock stop (asynchronous)
    reg    STOP_S;   // clock stop (synchronous)
    wire   CLR_STOP_A; // clease STOP_A
 
//--------------------------
// SLEEP and Wake Up Control
//--------------------------
//---- This clock gating should be specifically modified for your SoC.----
    clk_gate   CLK_GATE (.I(CLK_SRC), .C(STOP_S), .O(CLK));
//------------------------------------------------------------------------
    assign CLR_STOP_A = RST | WAKEUP;

    always @(posedge CLK or posedge CLR_STOP_A)
    begin
        if (CLR_STOP_A)
            STOP_A <= 1'b0;
        else if (SLP)
            STOP_A <= 1'b1;
    end

    always @(posedge CLK_SRC or posedge RST)
    begin
        if (RST)
            STOP_S <= 1'b0;
        else
            STOP_S <= STOP_A;
    end

//-----------------
// INTCTL Operation
//-----------------
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            INTCTL[25:12] <= 14'h0000;
        else if ((ADR[2] == 1'b0) & (CE == 1'b1) & (WE == 1'b1) & (ACK == 1'b1))
            INTCTL[25:12] <= DATI[25:12];
    end

    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            INTCTL[11:0] <= 12'hfff;
        else if ((ADR[2] == 1'b0) & (CE == 1'b1) & (WE == 1'b1) & (ACK == 1'b1))
            INTCTL[11:0] <= DATI[11:0];
        else if (INTCTL[25])
            INTCTL[11:0] <= INTCTL[11:0] - 1;
    end
    
//--------------
// Break Address
//--------------
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            BRKADR[31:0] <= 32'h00000000;
        else if ((ADR[2] == 1'b1) & (CE == 1'b1) & (WE == 1'b1) & (ACK == 1'b1))
            BRKADR[31:0] <= DATI[31:0];
    end

//---------------
// Read Operation
//---------------
    always @(CE or ADR or INTCTL or BRKADR) begin
        if (CE == 1'b1)
            begin
              if (ADR[2] == 1'b0)
                  DATO[31:0] <= {6'h00, INTCTL[25:0]};
              else
                  DATO[31:0] <= BRKADR[31:0]; 
            end
        else
            DATO[31:0] <= 32'h00000000;
    end

//-------------------
// Make Event Request
//-------------------
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            F_NMI <= 1'b0;
        else if ((~ADR[2] & CE & WE & SEL[3] & ACK & DATI[31])
                 | (INTCTL[24] & STB & ACK & (ADR[31:0] == BRKADR)))
            F_NMI <= 1'b1;
        else if (EVENT_ACK & (EVENT_REQ == `NMI))
            F_NMI <= 1'b0;
    end
       
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            F_IRQ <= 1'b0;
        else if ((INTCTL[11:0] == 12'h000)
               | (~ADR[2] & CE & WE & SEL[3] & ACK & DATI[30])) 
            F_IRQ <= 1'b1;
        else if (EVENT_ACK & (EVENT_REQ == `IRQ))
            F_IRQ <= 1'b0;
    end

    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            F_CPUERR <= 1'b0;
        else if ((STB & SEL[3] & SEL[2] & ~SEL[1] & ~SEL[0] & ACK & ADR[0]) 
               | (STB & ~SEL[3] & ~SEL[2] & SEL[1] & SEL[0] & ACK & ADR[0])
               | (STB & SEL[3] & SEL[2] & SEL[1] & SEL[0] & ACK & (ADR[1] | ADR[0]))
               | (~ADR[2] & CE & WE & SEL[3] & ACK & DATI[29])) 
            F_CPUERR <= 1'b1;
        else if (EVENT_ACK & (EVENT_REQ == `CPUERR))
            F_CPUERR <= 1'b0;
    end
       
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            F_DMAERR <= 1'b0;
        else if (~ADR[2] & CE & WE & SEL[3] & ACK & DATI[28])
            F_DMAERR <= 1'b1;
        else if (EVENT_ACK & (EVENT_REQ == `DMAERR))
            F_DMAERR <= 1'b0;
    end

    always @(posedge CLK or posedge RST)
    begin
        if  (RST)
            F_MRES <= 1'b0;
        else if (~ADR[2] & CE & WE & SEL[1] & ACK & DATI[27])
            F_MRES <= 1'b1;
        else if (EVENT_ACK & (EVENT_REQ == `MRES))
            F_MRES <= 1'b0;
    end

    always @(F_NMI or F_IRQ or F_CPUERR or F_DMAERR or F_MRES or INTCTL)
    begin
        if (F_MRES)
            begin
                EVENT_REQ <= `MRES;
                EVENT_INFO <= {4'b1111, 8'h02};
            end
        else if (F_DMAERR)
            begin
                EVENT_REQ <= `DMAERR;
                EVENT_INFO <= {4'b1111, 8'h0A};
            end
        else if (F_CPUERR)
            begin
                EVENT_REQ <= `CPUERR;
                EVENT_INFO <= {4'b1111, 8'h09};
            end
        else if (F_NMI)
            begin
                EVENT_REQ <= `NMI;
                EVENT_INFO <= {4'b1111, 8'h0B};
            end                               
        else if (F_IRQ)
            begin
                EVENT_REQ <= `IRQ;
                EVENT_INFO <= INTCTL[23:12];
            end
        else
            begin
                EVENT_REQ <= `NO_EVT;
                EVENT_INFO <= INTCTL[23:12];
            end
    end

//======================================================
  endmodule
//======================================================