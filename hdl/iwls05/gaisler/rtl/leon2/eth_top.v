//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_clockgen.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_clockgen.v,v $
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/01 22:28:55  mohor
// This files (MIIM) are fully working. They were thoroughly tested. The testbench is not updated.
//
//


module eth_clockgen(Clk, Reset, Divider, MdcEn, MdcEn_n, Mdc);

parameter Tp=1;

input       Clk;              // Input clock (Host clock)
input       Reset;            // Reset signal
input [7:0] Divider;          // Divider (input clock will be divided by the Divider[7:0])

output      Mdc;              // Output clock
output      MdcEn;            // Enable signal is asserted for one Clk period before Mdc rises.
output      MdcEn_n;          // Enable signal is asserted for one Clk period before Mdc falls.

reg         Mdc;
reg   [7:0] Counter;

wire        CountEq0;
wire  [7:0] CounterPreset;
wire  [7:0] TempDivider;


assign TempDivider[7:0]   = (Divider[7:0]<2)? 8'h02 : Divider[7:0]; // If smaller than 2
assign CounterPreset[7:0] = (TempDivider[7:0]>>1) -1;               // We are counting half of period


// Counter counts half period
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    Counter[7:0] <= #Tp 8'h1;
  else
    begin
      if(CountEq0)
        begin
          Counter[7:0] <= #Tp CounterPreset[7:0];
        end
      else
        Counter[7:0] <= #Tp Counter - 8'h1;
    end
end


// Mdc is asserted every other half period
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    Mdc <= #Tp 1'b0;
  else
    begin
      if(CountEq0)
        Mdc <= #Tp ~Mdc;
    end
end


assign CountEq0 = Counter == 8'h0;
assign MdcEn = CountEq0 & ~Mdc;
assign MdcEn_n = CountEq0 & Mdc;

endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_crc.v                                                   ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_crc.v,v $
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/19 18:16:40  mohor
// TxClk changed to MTxClk (as discribed in the documentation).
// Crc changed so only one file can be used instead of two.
//
// Revision 1.2  2001/06/19 10:38:07  mohor
// Minor changes in header.
//
// Revision 1.1  2001/06/19 10:27:57  mohor
// TxEthMAC initial release.
//
//
//



module eth_crc (Clk, Reset, Data, Enable, Initialize, Crc, CrcError);


parameter Tp = 1;

input Clk;
input Reset;
input [3:0] Data;
input Enable;
input Initialize;

output [31:0] Crc;
output CrcError;

reg  [31:0] Crc;

wire [31:0] CrcNext;


assign CrcNext[0] = Enable & (Data[0] ^ Crc[28]); 
assign CrcNext[1] = Enable & (Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29]); 
assign CrcNext[2] = Enable & (Data[2] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[30]); 
assign CrcNext[3] = Enable & (Data[3] ^ Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30] ^ Crc[31]); 
assign CrcNext[4] = (Enable & (Data[3] ^ Data[2] ^ Data[0] ^ Crc[28] ^ Crc[30] ^ Crc[31])) ^ Crc[0]; 
assign CrcNext[5] = (Enable & (Data[3] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[31])) ^ Crc[1]; 
assign CrcNext[6] = (Enable & (Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30])) ^ Crc[ 2]; 
assign CrcNext[7] = (Enable & (Data[3] ^ Data[2] ^ Data[0] ^ Crc[28] ^ Crc[30] ^ Crc[31])) ^ Crc[3]; 
assign CrcNext[8] = (Enable & (Data[3] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[31])) ^ Crc[4]; 
assign CrcNext[9] = (Enable & (Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30])) ^ Crc[5]; 
assign CrcNext[10] = (Enable & (Data[3] ^ Data[2] ^ Data[0] ^ Crc[28] ^ Crc[30] ^ Crc[31])) ^ Crc[6]; 
assign CrcNext[11] = (Enable & (Data[3] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[31])) ^ Crc[7]; 
assign CrcNext[12] = (Enable & (Data[2] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[30])) ^ Crc[8]; 
assign CrcNext[13] = (Enable & (Data[3] ^ Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30] ^ Crc[31])) ^ Crc[9]; 
assign CrcNext[14] = (Enable & (Data[3] ^ Data[2] ^ Crc[30] ^ Crc[31])) ^ Crc[10]; 
assign CrcNext[15] = (Enable & (Data[3] ^ Crc[31])) ^ Crc[11]; 
assign CrcNext[16] = (Enable & (Data[0] ^ Crc[28])) ^ Crc[12]; 
assign CrcNext[17] = (Enable & (Data[1] ^ Crc[29])) ^ Crc[13]; 
assign CrcNext[18] = (Enable & (Data[2] ^ Crc[30])) ^ Crc[14]; 
assign CrcNext[19] = (Enable & (Data[3] ^ Crc[31])) ^ Crc[15]; 
assign CrcNext[20] = Crc[16]; 
assign CrcNext[21] = Crc[17]; 
assign CrcNext[22] = (Enable & (Data[0] ^ Crc[28])) ^ Crc[18]; 
assign CrcNext[23] = (Enable & (Data[1] ^ Data[0] ^ Crc[29] ^ Crc[28])) ^ Crc[19]; 
assign CrcNext[24] = (Enable & (Data[2] ^ Data[1] ^ Crc[30] ^ Crc[29])) ^ Crc[20]; 
assign CrcNext[25] = (Enable & (Data[3] ^ Data[2] ^ Crc[31] ^ Crc[30])) ^ Crc[21]; 
assign CrcNext[26] = (Enable & (Data[3] ^ Data[0] ^ Crc[31] ^ Crc[28])) ^ Crc[22]; 
assign CrcNext[27] = (Enable & (Data[1] ^ Crc[29])) ^ Crc[23]; 
assign CrcNext[28] = (Enable & (Data[2] ^ Crc[30])) ^ Crc[24]; 
assign CrcNext[29] = (Enable & (Data[3] ^ Crc[31])) ^ Crc[25]; 
assign CrcNext[30] = Crc[26]; 
assign CrcNext[31] = Crc[27]; 


always @ (posedge Clk or posedge Reset)
begin
  if (Reset)
    Crc <= #1 32'hffffffff;
  else
  if(Initialize)
    Crc <= #Tp 32'hffffffff;
  else
    Crc <= #Tp CrcNext;
end

assign CrcError = Crc[31:0] != 32'hc704dd7b;  // CRC not equal to magic number

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_fifo.v                                                  ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_fifo.v,v $
// Revision 1.3  2002/04/22 13:45:52  mohor
// Generic ram or Xilinx ram can be used in fifo (selectable by setting
// ETH_FIFO_XILINX in eth_defines.v).
//
// Revision 1.2  2002/03/25 13:33:04  mohor
// When clear and read/write are active at the same time, cnt and pointers are
// set to 1.
//
// Revision 1.1  2002/02/05 16:44:39  mohor
// Both rx and tx part are finished. Tested with wb_clk_i between 10 and 200
// MHz. Statuses, overrun, control frame transmission and reception still  need
// to be fixed.
//
//

//`include "eth_defines.v"

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_defines.v                                               ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is available in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_defines.v,v $
// Revision 1.29  2002/11/19 18:13:49  mohor
// r_MiiMRst is not used for resetting the MIIM module. wb_rst used instead.
//
// Revision 1.28  2002/11/15 14:27:15  mohor
// Since r_Rst bit is not used any more, default value is changed to 0xa000.
//
// Revision 1.27  2002/11/01 18:19:34  mohor
// Defines fixed to use generic RAM by default.
//
// Revision 1.26  2002/10/24 18:53:03  mohor
// fpga define added.
//
// Revision 1.3  2002/10/11 16:57:54  igorm
// eth_defines.v tagged with rel_5 used.
//
// Revision 1.25  2002/10/10 16:47:44  mohor
// Defines changed to have ETH_ prolog.
// ETH_WISHBONE_B# define added.
//
// Revision 1.24  2002/10/10 16:33:11  mohor
// Bist added.
//
// Revision 1.23  2002/09/23 18:22:48  mohor
// Virtual Silicon RAM might be used in the ASIC implementation of the ethernet
// core.
//
// Revision 1.22  2002/09/04 18:36:49  mohor
// Defines for control registers added (ETH_TXCTRL and ETH_RXCTRL).
//
// Revision 1.21  2002/08/16 22:09:47  mohor
// Defines for register width added. mii_rst signal in MIIMODER register
// changed.
//
// Revision 1.20  2002/08/14 19:31:48  mohor
// Register TX_BD_NUM is changed so it contains value of the Tx buffer descriptors. No
// need to multiply or devide any more.
//
// Revision 1.19  2002/07/23 15:28:31  mohor
// Ram , used for BDs changed from generic_spram to eth_spram_256x32.
//
// Revision 1.18  2002/05/03 10:15:50  mohor
// Outputs registered. Reset changed for eth_wishbone module.
//
// Revision 1.17  2002/04/24 08:52:19  mohor
// Compiler directives added. Tx and Rx fifo size incremented. A "late collision"
// bug fixed.
//
// Revision 1.16  2002/03/19 12:53:29  mohor
// Some defines that are used in testbench only were moved to tb_eth_defines.v
// file.
//
// Revision 1.15  2002/02/26 16:11:32  mohor
// Number of interrupts changed
//
// Revision 1.14  2002/02/16 14:03:44  mohor
// Registered trimmed. Unused registers removed.
//
// Revision 1.13  2002/02/16 13:06:33  mohor
// EXTERNAL_DMA used instead of WISHBONE_DMA.
//
// Revision 1.12  2002/02/15 10:58:31  mohor
// Changed that were lost with last update put back to the file.
//
// Revision 1.11  2002/02/14 20:19:41  billditt
// Modified for Address Checking,
// addition of eth_addrcheck.v
//
// Revision 1.10  2002/02/12 17:01:19  mohor
// HASH0 and HASH1 registers added. 

// Revision 1.9  2002/02/08 16:21:54  mohor
// Rx status is written back to the BD.
//
// Revision 1.8  2002/02/05 16:44:38  mohor
// Both rx and tx part are finished. Tested with wb_clk_i between 10 and 200
// MHz. Statuses, overrun, control frame transmission and reception still  need
// to be fixed.
//
// Revision 1.7  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.6  2001/12/05 15:00:16  mohor
// RX_BD_NUM changed to TX_BD_NUM (holds number of TX descriptors
// instead of the number of RX descriptors).
//
// Revision 1.5  2001/12/05 10:21:37  mohor
// ETH_RX_BD_ADR register deleted. ETH_RX_BD_NUM is used instead.
//
// Revision 1.4  2001/11/13 14:23:56  mohor
// Generic memory model is used. Defines are changed for the same reason.
//
// Revision 1.3  2001/10/18 12:07:11  mohor
// Status signals changed, Adress decoding changed, interrupt controller
// added.
//
// Revision 1.2  2001/09/24 15:02:56  mohor
// Defines changed (All precede with ETH_). Small changes because some
// tools generate warnings when two operands are together. Synchronization
// between two clocks domains in eth_wishbonedma.v is changed (due to ASIC
// demands).
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
//
//
//
//



//`define ETH_BIST                    // Bist for usage with Virtual Silicon RAMS


// Ethernet implemented in Xilinx Chips
//`define ETH_FIFO_XILINX             // Use Xilinx distributed ram for tx and rx fifo
//`define ETH_XILINX_RAMB4            // Selection of the used memory for Buffer descriptors
                                      // Core is going to be implemented in Virtex FPGA and contains Virtex 
                                      // specific elements. 

// Ethernet implemented in ASIC with Virtual Silicon RAMs
// `define ETH_VIRTUAL_SILICON_RAM     // Virtual Silicon RAMS used storing buffer decriptors (ASIC implementation)

`define ETH_MODER_ADR         8'h0    // 0x0 
`define ETH_INT_SOURCE_ADR    8'h1    // 0x4 
`define ETH_INT_MASK_ADR      8'h2    // 0x8 
`define ETH_IPGT_ADR          8'h3    // 0xC 
`define ETH_IPGR1_ADR         8'h4    // 0x10
`define ETH_IPGR2_ADR         8'h5    // 0x14
`define ETH_PACKETLEN_ADR     8'h6    // 0x18
`define ETH_COLLCONF_ADR      8'h7    // 0x1C
`define ETH_TX_BD_NUM_ADR     8'h8    // 0x20
`define ETH_CTRLMODER_ADR     8'h9    // 0x24
`define ETH_MIIMODER_ADR      8'hA    // 0x28
`define ETH_MIICOMMAND_ADR    8'hB    // 0x2C
`define ETH_MIIADDRESS_ADR    8'hC    // 0x30
`define ETH_MIITX_DATA_ADR    8'hD    // 0x34
`define ETH_MIIRX_DATA_ADR    8'hE    // 0x38
`define ETH_MIISTATUS_ADR     8'hF    // 0x3C
`define ETH_MAC_ADDR0_ADR     8'h10   // 0x40
`define ETH_MAC_ADDR1_ADR     8'h11   // 0x44
`define ETH_HASH0_ADR         8'h12   // 0x48
`define ETH_HASH1_ADR         8'h13   // 0x4C
`define ETH_TX_CTRL_ADR       8'h14   // 0x50
`define ETH_RX_CTRL_ADR       8'h15   // 0x54


`define ETH_MODER_DEF         17'h0A000
`define ETH_INT_MASK_DEF      7'h0
`define ETH_IPGT_DEF          7'h12
`define ETH_IPGR1_DEF         7'h0C
`define ETH_IPGR2_DEF         7'h12
`define ETH_PACKETLEN_DEF     32'h00400600
`define ETH_COLLCONF0_DEF     6'h3f
`define ETH_COLLCONF1_DEF     4'hF
`define ETH_TX_BD_NUM_DEF     8'h40
`define ETH_CTRLMODER_DEF     3'h0
`define ETH_MIIMODER_DEF      10'h064
`define ETH_MIIADDRESS0_DEF   5'h00
`define ETH_MIIADDRESS1_DEF   5'h00
`define ETH_MIITX_DATA_DEF    16'h0000
`define ETH_MIIRX_DATA_DEF    16'h0000
`define ETH_MIISTATUS_DEF     32'h00000000
`define ETH_MAC_ADDR0_DEF     32'h00000000
`define ETH_MAC_ADDR1_DEF     16'h0000
`define ETH_HASH0_DEF         32'h00000000
`define ETH_HASH1_DEF         32'h00000000
`define ETH_RX_CTRL_DEF       16'h0


`define ETH_MODER_WIDTH       17
`define ETH_INT_SOURCE_WIDTH  7
`define ETH_INT_MASK_WIDTH    7
`define ETH_IPGT_WIDTH        7
`define ETH_IPGR1_WIDTH       7
`define ETH_IPGR2_WIDTH       7
`define ETH_PACKETLEN_WIDTH   32
`define ETH_TX_BD_NUM_WIDTH   8
`define ETH_CTRLMODER_WIDTH   3
`define ETH_MIIMODER_WIDTH    9
`define ETH_MIITX_DATA_WIDTH  16
`define ETH_MIIRX_DATA_WIDTH  16
`define ETH_MIISTATUS_WIDTH   3
`define ETH_MAC_ADDR0_WIDTH   32
`define ETH_MAC_ADDR1_WIDTH   16
`define ETH_HASH0_WIDTH       32
`define ETH_HASH1_WIDTH       32
`define ETH_TX_CTRL_WIDTH     17
`define ETH_RX_CTRL_WIDTH     16


// Outputs are registered (uncomment when needed)
`define ETH_REGISTERED_OUTPUTS

// Settings for TX FIFO
//`define ETH_TX_FIFO_CNT_WIDTH  5
//`define ETH_TX_FIFO_DEPTH      16
`define ETH_TX_FIFO_DATA_WIDTH 32

// Settings for RX FIFO
//`define ETH_RX_FIFO_CNT_WIDTH  5
//`define ETH_RX_FIFO_DEPTH      16
`define ETH_RX_FIFO_DATA_WIDTH 32

// Burst length
//`define ETH_BURST_LENGTH       4    // Change also ETH_BURST_CNT_WIDTH
//`define ETH_BURST_CNT_WIDTH    3    // The counter must be width enough to count to ETH_BURST_LENGTH

// WISHBONE interface is Revision B3 compliant (uncomment when needed)
//`define ETH_WISHBONE_B3

//`include "timescale.v"
// `timescale 1ns / 1ns

module eth_fifo (data_in, data_out, clk, reset, write, read, clear, almost_full, full, almost_empty, empty, cnt);

parameter DATA_WIDTH    = 32;
parameter DEPTH         = 8;
parameter CNT_WIDTH     = 4;

parameter Tp            = 1;

input                     clk;
input                     reset;
input                     write;
input                     read;
input                     clear;
input   [DATA_WIDTH-1:0]  data_in;

output  [DATA_WIDTH-1:0]  data_out;
output                    almost_full;
output                    full;
output                    almost_empty;
output                    empty;
output  [CNT_WIDTH-1:0]   cnt;

`ifdef ETH_FIFO_XILINX
`else
  reg     [DATA_WIDTH-1:0]  fifo  [0:DEPTH-1];
`endif

reg     [CNT_WIDTH-1:0]   cnt;
reg     [CNT_WIDTH-2:0]   read_pointer;
reg     [CNT_WIDTH-2:0]   write_pointer;
wire    [CNT_WIDTH-2:0]   write_address;
wire    [CNT_WIDTH-2:0]   read_address;


always @ (posedge clk or posedge reset)
begin
  if(reset)
    cnt <=#Tp 0;
  else
  if(clear)
    cnt <=#Tp { {(CNT_WIDTH-1){1'b0}}, read^write};
  else
  if(read ^ write)
    if(read)
      cnt <=#Tp cnt - 1'b1;
    else
      cnt <=#Tp cnt + 1'b1;
end

always @ (posedge clk or posedge reset)
begin
  if(reset)
    read_pointer <=#Tp 0;
  else
  if(clear)
    read_pointer <=#Tp { {(CNT_WIDTH-2){1'b0}}, read};
  else
  if(read & ~empty)
    read_pointer <=#Tp read_pointer + 1'b1;
end

always @ (posedge clk or posedge reset)
begin
  if(reset)
    write_pointer <=#Tp 0;
  else
  if(clear)
    write_pointer <=#Tp { {(CNT_WIDTH-2){1'b0}}, write};
  else
  if(write & ~full)
    write_pointer <=#Tp write_pointer + 1'b1;
end

assign empty = ~(|cnt);
assign almost_empty = cnt == 1;
assign full  = cnt == DEPTH;
assign almost_full  = &cnt[CNT_WIDTH-2:0];



`ifdef ETH_FIFO_XILINX
  xilinx_dist_ram_16x32 fifo
  ( .data_out(data_out), 
    .we(write & ~full),
    .data_in(data_in),
    .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer),
    .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer),
    .wclk(clk)
  );
`else

assign read_address = ( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer);
assign write_address = (clear ? {CNT_WIDTH-1{1'b0}} : write_pointer);

  always @ (posedge clk)
  begin
   if(write & (clear |~full))
      fifo[write_address] <=#Tp data_in;
  end
  
  assign data_out = fifo[read_address];
`endif


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_receivecontrol.v                                        ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_receivecontrol.v,v $
// Revision 1.5  2003/01/22 13:49:26  tadejm
// When control packets were received, they were ignored in some cases.
//
// Revision 1.4  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.1  2001/07/03 12:51:54  mohor
// Initial release of the MAC Control module.
//
//
//
//
//




module eth_receivecontrol (MTxClk, MRxClk, TxReset, RxReset, RxData, RxValid, RxStartFrm, 
                           RxEndFrm, RxFlow, ReceiveEnd, MAC, DlyCrcEn, TxDoneIn, 
                           TxAbortIn, TxStartFrmOut, ReceivedLengthOK, ReceivedPacketGood, 
                           TxUsedDataOutDetected, Pause, ReceivedPauseFrm, AddressOK, 
                           RxStatusWriteLatched_sync2, r_PassAll, SetPauseTimer
                          );

parameter Tp = 1;


input       MTxClk;
input       MRxClk;
input       TxReset; 
input       RxReset; 
input [7:0] RxData;
input       RxValid;
input       RxStartFrm;
input       RxEndFrm;
input       RxFlow;
input       ReceiveEnd;
input [47:0]MAC;
input       DlyCrcEn;
input       TxDoneIn;
input       TxAbortIn;
input       TxStartFrmOut;
input       ReceivedLengthOK;
input       ReceivedPacketGood;
input       TxUsedDataOutDetected;
input       RxStatusWriteLatched_sync2;
input       r_PassAll;

output      Pause;
output      ReceivedPauseFrm;
output      AddressOK;
output      SetPauseTimer;


reg         Pause;
reg         AddressOK;                // Multicast or unicast address detected
reg         TypeLengthOK;             // Type/Length field contains 0x8808
reg         DetectionWindow;          // Detection of the PAUSE frame is possible within this window
reg         OpCodeOK;                 // PAUSE opcode detected (0x0001)
reg  [2:0]  DlyCrcCnt;
reg  [4:0]  ByteCnt;
reg [15:0]  AssembledTimerValue;
reg [15:0]  LatchedTimerValue;
reg         ReceivedPauseFrm;
reg         ReceivedPauseFrmWAddr;
reg         PauseTimerEq0_sync1;
reg         PauseTimerEq0_sync2;
reg [15:0]  PauseTimer;
reg         Divider2;
reg  [5:0]  SlotTimer;

wire [47:0] ReservedMulticast;        // 0x0180C2000001
wire [15:0] TypeLength;               // 0x8808
wire        ResetByteCnt;             // 
wire        IncrementByteCnt;         // 
wire        ByteCntEq0;               // ByteCnt = 0
wire        ByteCntEq1;               // ByteCnt = 1
wire        ByteCntEq2;               // ByteCnt = 2
wire        ByteCntEq3;               // ByteCnt = 3
wire        ByteCntEq4;               // ByteCnt = 4
wire        ByteCntEq5;               // ByteCnt = 5
wire        ByteCntEq12;              // ByteCnt = 12
wire        ByteCntEq13;              // ByteCnt = 13
wire        ByteCntEq14;              // ByteCnt = 14
wire        ByteCntEq15;              // ByteCnt = 15
wire        ByteCntEq16;              // ByteCnt = 16
wire        ByteCntEq17;              // ByteCnt = 17
wire        ByteCntEq18;              // ByteCnt = 18
wire        DecrementPauseTimer;      // 
wire        PauseTimerEq0;            // 
wire        ResetSlotTimer;           // 
wire        IncrementSlotTimer;       // 
wire        SlotFinished;             // 



// Reserved multicast address and Type/Length for PAUSE control
assign ReservedMulticast = 48'h0180C2000001;
assign TypeLength = 16'h8808;


// Address Detection (Multicast or unicast)
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    AddressOK <= #Tp 1'b0;
  else
  if(DetectionWindow & ByteCntEq0)
    AddressOK <= #Tp  RxData[7:0] == ReservedMulticast[47:40] | RxData[7:0] == MAC[47:40];
  else
  if(DetectionWindow & ByteCntEq1)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[39:32] | RxData[7:0] == MAC[39:32]) & AddressOK;
  else
  if(DetectionWindow & ByteCntEq2)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[31:24] | RxData[7:0] == MAC[31:24]) & AddressOK;
  else
  if(DetectionWindow & ByteCntEq3)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[23:16] | RxData[7:0] == MAC[23:16]) & AddressOK;
  else
  if(DetectionWindow & ByteCntEq4)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[15:8]  | RxData[7:0] == MAC[15:8])  & AddressOK;
  else
  if(DetectionWindow & ByteCntEq5)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[7:0]   | RxData[7:0] == MAC[7:0])   & AddressOK;
  else
  if(ReceiveEnd)
    AddressOK <= #Tp 1'b0;
end



// TypeLengthOK (Type/Length Control frame detected)
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    TypeLengthOK <= #Tp 1'b0;
  else
  if(DetectionWindow & ByteCntEq12)
    TypeLengthOK <= #Tp ByteCntEq12 & (RxData[7:0] == TypeLength[15:8]);
  else
  if(DetectionWindow & ByteCntEq13)
    TypeLengthOK <= #Tp ByteCntEq13 & (RxData[7:0] == TypeLength[7:0]) & TypeLengthOK;
  else
  if(ReceiveEnd)
    TypeLengthOK <= #Tp 1'b0;
end



// Latch Control Frame Opcode
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    OpCodeOK <= #Tp 1'b0;
  else
  if(ByteCntEq16)
    OpCodeOK <= #Tp 1'b0;
  else
    begin
      if(DetectionWindow & ByteCntEq14)
        OpCodeOK <= #Tp ByteCntEq14 & RxData[7:0] == 8'h00;
    
      if(DetectionWindow & ByteCntEq15)
        OpCodeOK <= #Tp ByteCntEq15 & RxData[7:0] == 8'h01 & OpCodeOK;
    end
end


// ReceivedPauseFrmWAddr (+Address Check)
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    ReceivedPauseFrmWAddr <= #Tp 1'b0;
  else
  if(ReceiveEnd)
    ReceivedPauseFrmWAddr <= #Tp 1'b0;
  else
  if(ByteCntEq16 & TypeLengthOK & OpCodeOK & AddressOK)
    ReceivedPauseFrmWAddr <= #Tp 1'b1;        
end



// Assembling 16-bit timer value from two 8-bit data
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    AssembledTimerValue[15:0] <= #Tp 16'h0;
  else
  if(RxStartFrm)
    AssembledTimerValue[15:0] <= #Tp 16'h0;
  else
    begin
      if(DetectionWindow & ByteCntEq16)
        AssembledTimerValue[15:8] <= #Tp RxData[7:0];
      if(DetectionWindow & ByteCntEq17)
        AssembledTimerValue[7:0] <= #Tp RxData[7:0];
    end
end


// Detection window (while PAUSE detection is possible)
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    DetectionWindow <= #Tp 1'b1;
  else
  if(ByteCntEq18)
    DetectionWindow <= #Tp 1'b0;
  else
  if(ReceiveEnd)
    DetectionWindow <= #Tp 1'b1;
end



// Latching Timer Value
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    LatchedTimerValue[15:0] <= #Tp 16'h0;
  else
  if(DetectionWindow &  ReceivedPauseFrmWAddr &  ByteCntEq18)
    LatchedTimerValue[15:0] <= #Tp AssembledTimerValue[15:0];
  else
  if(ReceiveEnd)
    LatchedTimerValue[15:0] <= #Tp 16'h0;
end



// Delayed CEC counter
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    DlyCrcCnt <= #Tp 3'h0;
  else
  if(RxValid & RxEndFrm)
    DlyCrcCnt <= #Tp 3'h0;
  else
  if(RxValid & ~RxEndFrm & ~DlyCrcCnt[2])
    DlyCrcCnt <= #Tp DlyCrcCnt + 1'b1;
end

             
assign ResetByteCnt = RxEndFrm;
assign IncrementByteCnt = RxValid & DetectionWindow & ~ByteCntEq18 & (~DlyCrcEn | DlyCrcEn & DlyCrcCnt[2]);


// Byte counter
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    ByteCnt[4:0] <= #Tp 5'h0;
  else
  if(ResetByteCnt)
    ByteCnt[4:0] <= #Tp 5'h0;
  else
  if(IncrementByteCnt)
    ByteCnt[4:0] <= #Tp ByteCnt[4:0] + 1'b1;
end


assign ByteCntEq0 = RxValid & ByteCnt[4:0] == 5'h0;
assign ByteCntEq1 = RxValid & ByteCnt[4:0] == 5'h1;
assign ByteCntEq2 = RxValid & ByteCnt[4:0] == 5'h2;
assign ByteCntEq3 = RxValid & ByteCnt[4:0] == 5'h3;
assign ByteCntEq4 = RxValid & ByteCnt[4:0] == 5'h4;
assign ByteCntEq5 = RxValid & ByteCnt[4:0] == 5'h5;
assign ByteCntEq12 = RxValid & ByteCnt[4:0] == 5'h0C;
assign ByteCntEq13 = RxValid & ByteCnt[4:0] == 5'h0D;
assign ByteCntEq14 = RxValid & ByteCnt[4:0] == 5'h0E;
assign ByteCntEq15 = RxValid & ByteCnt[4:0] == 5'h0F;
assign ByteCntEq16 = RxValid & ByteCnt[4:0] == 5'h10;
assign ByteCntEq17 = RxValid & ByteCnt[4:0] == 5'h11;
assign ByteCntEq18 = RxValid & ByteCnt[4:0] == 5'h12 & DetectionWindow;


assign SetPauseTimer = ReceiveEnd & ReceivedPauseFrmWAddr & ReceivedPacketGood & ReceivedLengthOK & RxFlow;
assign DecrementPauseTimer = SlotFinished & |PauseTimer;


// PauseTimer[15:0]
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    PauseTimer[15:0] <= #Tp 16'h0;
  else
  if(SetPauseTimer)
    PauseTimer[15:0] <= #Tp LatchedTimerValue[15:0];
  else
  if(DecrementPauseTimer)
    PauseTimer[15:0] <= #Tp PauseTimer[15:0] - 1'b1;
end

assign PauseTimerEq0 = ~(|PauseTimer[15:0]);



// Synchronization of the pause timer
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    begin
      PauseTimerEq0_sync1 <= #Tp 1'b1;
      PauseTimerEq0_sync2 <= #Tp 1'b1;
    end
  else
    begin
      PauseTimerEq0_sync1 <= #Tp PauseTimerEq0;
      PauseTimerEq0_sync2 <= #Tp PauseTimerEq0_sync1;
    end
end


// Pause signal generation
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    Pause <= #Tp 1'b0;
  else
  if((TxDoneIn | TxAbortIn | ~TxUsedDataOutDetected) & ~TxStartFrmOut)
    Pause <= #Tp RxFlow & ~PauseTimerEq0_sync2;
end


// Divider2 is used for incrementing the Slot timer every other clock
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    Divider2 <= #Tp 1'b0;
  else
  if(|PauseTimer[15:0] & RxFlow)
    Divider2 <= #Tp ~Divider2;
  else
    Divider2 <= #Tp 1'b0;
end


assign ResetSlotTimer = RxReset;
assign IncrementSlotTimer =  Pause & RxFlow & Divider2;


// SlotTimer
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    SlotTimer[5:0] <= #Tp 6'h0;
  else
  if(ResetSlotTimer)
    SlotTimer[5:0] <= #Tp 6'h0;
  else
  if(IncrementSlotTimer)
    SlotTimer[5:0] <= #Tp SlotTimer[5:0] + 1'b1;
end


assign SlotFinished = &SlotTimer[5:0] & IncrementSlotTimer;  // Slot is 512 bits (64 bytes)



// Pause Frame received
always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    ReceivedPauseFrm <=#Tp 1'b0;
  else
  if(RxStatusWriteLatched_sync2 & r_PassAll | ReceivedPauseFrm & (~r_PassAll))
    ReceivedPauseFrm <=#Tp 1'b0;
  else
  if(ByteCntEq16 & TypeLengthOK & OpCodeOK)
    ReceivedPauseFrm <=#Tp 1'b1;        
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_maccontrol.v                                            ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_maccontrol.v,v $
// Revision 1.7  2003/01/22 13:49:26  tadejm
// When control packets were received, they were ignored in some cases.
//
// Revision 1.6  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.5  2002/11/21 00:14:39  mohor
// TxDone and TxAbort changed so they're not propagated to the wishbone
// module when control frame is transmitted.
//
// Revision 1.4  2002/11/19 17:37:32  mohor
// When control frame (PAUSE) was sent, status was written in the
// eth_wishbone module and both TXB and TXC interrupts were set. Fixed.
// Only TXC interrupt is set.
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.1  2001/07/03 12:51:54  mohor
// Initial release of the MAC Control module.
//
//
//
//




module eth_maccontrol (MTxClk, MRxClk, TxReset, RxReset, TPauseRq, TxDataIn, TxStartFrmIn, TxUsedDataIn, 
                       TxEndFrmIn, TxDoneIn, TxAbortIn, RxData, RxValid, RxStartFrm, RxEndFrm, ReceiveEnd, 
                       ReceivedPacketGood, ReceivedLengthOK, TxFlow, RxFlow, DlyCrcEn, TxPauseTV, 
                       MAC, PadIn, PadOut, CrcEnIn, CrcEnOut, TxDataOut, TxStartFrmOut, TxEndFrmOut, 
                       TxDoneOut, TxAbortOut, TxUsedDataOut, WillSendControlFrame, TxCtrlEndFrm, 
                       ReceivedPauseFrm, ControlFrmAddressOK, SetPauseTimer, r_PassAll, RxStatusWriteLatched_sync2
                      );


parameter   Tp = 1;


input         MTxClk;                   // Transmit clock (from PHY)
input         MRxClk;                   // Receive clock (from PHY)
input         TxReset;                  // Transmit reset
input         RxReset;                  // Receive reset
input         TPauseRq;                 // Transmit control frame (from host)
input   [7:0] TxDataIn;                 // Transmit packet data byte (from host)
input         TxStartFrmIn;             // Transmit packet start frame input (from host)
input         TxUsedDataIn;             // Transmit packet used data (from TxEthMAC)
input         TxEndFrmIn;               // Transmit packet end frame input (from host)
input         TxDoneIn;                 // Transmit packet done (from TxEthMAC)
input         TxAbortIn;                // Transmit packet abort (input from TxEthMAC)
input         PadIn;                    // Padding (input from registers)
input         CrcEnIn;                  // Crc append (input from registers)
input   [7:0] RxData;                   // Receive Packet Data (from RxEthMAC)
input         RxValid;                  // Received a valid packet
input         RxStartFrm;               // Receive packet start frame (input from RxEthMAC)
input         RxEndFrm;                 // Receive packet end frame (input from RxEthMAC)
input         ReceiveEnd;               // End of receiving of the current packet (input from RxEthMAC)
input         ReceivedPacketGood;       // Received packet is good
input         ReceivedLengthOK;         // Length of the received packet is OK
input         TxFlow;                   // Tx flow control (from registers)
input         RxFlow;                   // Rx flow control (from registers)
input         DlyCrcEn;                 // Delayed CRC enabled (from registers)
input  [15:0] TxPauseTV;                // Transmit Pause Timer Value (from registers)
input  [47:0] MAC;                      // MAC address (from registers)
input         RxStatusWriteLatched_sync2;
input         r_PassAll;

output  [7:0] TxDataOut;                // Transmit Packet Data (to TxEthMAC)
output        TxStartFrmOut;            // Transmit packet start frame (output to TxEthMAC)
output        TxEndFrmOut;              // Transmit packet end frame (output to TxEthMAC)
output        TxDoneOut;                // Transmit packet done (to host)
output        TxAbortOut;               // Transmit packet aborted (to host)
output        TxUsedDataOut;            // Transmit packet used data (to host)
output        PadOut;                   // Padding (output to TxEthMAC)
output        CrcEnOut;                 // Crc append (output to TxEthMAC)
output        WillSendControlFrame;
output        TxCtrlEndFrm;
output        ReceivedPauseFrm;
output        ControlFrmAddressOK;
output        SetPauseTimer;

reg           TxUsedDataOutDetected;    
reg           TxAbortInLatched;         
reg           TxDoneInLatched;          
reg           MuxedDone;                
reg           MuxedAbort;               

wire          Pause;                    
wire          TxCtrlStartFrm;
wire    [7:0] ControlData;              
wire          CtrlMux;                  
wire          SendingCtrlFrm;           // Sending Control Frame (enables padding and CRC)
wire          BlockTxDone;


// Signal TxUsedDataOut was detected (a transfer is already in progress)
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxUsedDataOutDetected <= #Tp 1'b0;
  else
  if(TxDoneIn | TxAbortIn)
    TxUsedDataOutDetected <= #Tp 1'b0;
  else
  if(TxUsedDataOut)
    TxUsedDataOutDetected <= #Tp 1'b1;
end    


// Latching variables
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    begin
      TxAbortInLatched <= #Tp 1'b0;
      TxDoneInLatched  <= #Tp 1'b0;
    end
  else
    begin
      TxAbortInLatched <= #Tp TxAbortIn;
      TxDoneInLatched  <= #Tp TxDoneIn;
    end
end



// Generating muxed abort signal
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    MuxedAbort <= #Tp 1'b0;
  else
  if(TxStartFrmIn)
    MuxedAbort <= #Tp 1'b0;
  else
  if(TxAbortIn & ~TxAbortInLatched & TxUsedDataOutDetected)
    MuxedAbort <= #Tp 1'b1;
end


// Generating muxed done signal
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    MuxedDone <= #Tp 1'b0;
  else
  if(TxStartFrmIn)
    MuxedDone <= #Tp 1'b0;
  else
  if(TxDoneIn & (~TxDoneInLatched) & TxUsedDataOutDetected)
    MuxedDone <= #Tp 1'b1;
end


// TxDoneOut
assign TxDoneOut  = CtrlMux? ((~TxStartFrmIn) & (~BlockTxDone) & MuxedDone) : 
                             ((~TxStartFrmIn) & (~BlockTxDone) & TxDoneIn);

// TxAbortOut
assign TxAbortOut  = CtrlMux? ((~TxStartFrmIn) & (~BlockTxDone) & MuxedAbort) :
                              ((~TxStartFrmIn) & (~BlockTxDone) & TxAbortIn);

// TxUsedDataOut
assign TxUsedDataOut  = ~CtrlMux & TxUsedDataIn;

// TxStartFrmOut
assign TxStartFrmOut = CtrlMux? TxCtrlStartFrm : (TxStartFrmIn & ~Pause);


// TxEndFrmOut
assign TxEndFrmOut = CtrlMux? TxCtrlEndFrm : TxEndFrmIn;


// TxDataOut[7:0]
assign TxDataOut[7:0] = CtrlMux? ControlData[7:0] : TxDataIn[7:0];


// PadOut
assign PadOut = PadIn | SendingCtrlFrm;


// CrcEnOut
assign CrcEnOut = CrcEnIn | SendingCtrlFrm;



// Connecting receivecontrol module
eth_receivecontrol receivecontrol1 
(
 .MTxClk(MTxClk), .MRxClk(MRxClk), .TxReset(TxReset), .RxReset(RxReset), .RxData(RxData), 
 .RxValid(RxValid), .RxStartFrm(RxStartFrm), .RxEndFrm(RxEndFrm), .RxFlow(RxFlow), 
 .ReceiveEnd(ReceiveEnd), .MAC(MAC), .DlyCrcEn(DlyCrcEn), .TxDoneIn(TxDoneIn), 
 .TxAbortIn(TxAbortIn), .TxStartFrmOut(TxStartFrmOut), .ReceivedLengthOK(ReceivedLengthOK), 
 .ReceivedPacketGood(ReceivedPacketGood), .TxUsedDataOutDetected(TxUsedDataOutDetected), 
 .Pause(Pause), .ReceivedPauseFrm(ReceivedPauseFrm), .AddressOK(ControlFrmAddressOK), 
 .r_PassAll(r_PassAll), .RxStatusWriteLatched_sync2(RxStatusWriteLatched_sync2), .SetPauseTimer(SetPauseTimer)
);


eth_transmitcontrol transmitcontrol1
(
 .MTxClk(MTxClk), .TxReset(TxReset), .TxUsedDataIn(TxUsedDataIn), .TxUsedDataOut(TxUsedDataOut), 
 .TxDoneIn(TxDoneIn), .TxAbortIn(TxAbortIn), .TxStartFrmIn(TxStartFrmIn), .TPauseRq(TPauseRq), 
 .TxUsedDataOutDetected(TxUsedDataOutDetected), .TxFlow(TxFlow), .DlyCrcEn(DlyCrcEn), .TxPauseTV(TxPauseTV), 
 .MAC(MAC), .TxCtrlStartFrm(TxCtrlStartFrm), .TxCtrlEndFrm(TxCtrlEndFrm), .SendingCtrlFrm(SendingCtrlFrm), 
 .CtrlMux(CtrlMux), .ControlData(ControlData), .WillSendControlFrame(WillSendControlFrame), .BlockTxDone(BlockTxDone)
);



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_macstatus.v                                             ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is available in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_macstatus.v,v $
// Revision 1.15  2003/01/30 13:28:19  tadejm
// Defer indication changed.
//
// Revision 1.14  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.13  2002/11/13 22:30:58  tadejm
// Late collision is reported only when not in the full duplex.
// Sample is taken (for status) as soon as MRxDV is not valid (regardless
// of the received byte cnt).
//
// Revision 1.12  2002/09/12 14:50:16  mohor
// CarrierSenseLost bug fixed when operating in full duplex mode.
//
// Revision 1.11  2002/09/04 18:38:03  mohor
// CarrierSenseLost status is not set when working in loopback mode.
//
// Revision 1.10  2002/07/25 18:17:46  mohor
// InvalidSymbol generation changed.
//
// Revision 1.9  2002/04/22 13:51:44  mohor
// Short frame and ReceivedLengthOK were not detected correctly.
//
// Revision 1.8  2002/02/18 10:40:17  mohor
// Small fixes.
//
// Revision 1.7  2002/02/15 17:07:39  mohor
// Status was not written correctly when frames were discarted because of
// address mismatch.
//
// Revision 1.6  2002/02/11 09:18:21  mohor
// Tx status is written back to the BD.
//
// Revision 1.5  2002/02/08 16:21:54  mohor
// Rx status is written back to the BD.
//
// Revision 1.4  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.3  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
//
//
//
//



module eth_macstatus(
                      MRxClk, Reset, ReceivedLengthOK, ReceiveEnd, ReceivedPacketGood, RxCrcError, 
                      MRxErr, MRxDV, RxStateSFD, RxStateData, RxStatePreamble, RxStateIdle, Transmitting, 
                      RxByteCnt, RxByteCntEq0, RxByteCntGreat2, RxByteCntMaxFrame, 
                      InvalidSymbol, MRxD, LatchedCrcError, Collision, CollValid, RxLateCollision,
                      r_RecSmall, r_MinFL, r_MaxFL, ShortFrame, DribbleNibble, ReceivedPacketTooBig, r_HugEn,
                      LoadRxStatus, StartTxDone, StartTxAbort, RetryCnt, RetryCntLatched, MTxClk, MaxCollisionOccured, 
                      RetryLimit, LateCollision, LateCollLatched, DeferIndication, DeferLatched, TxStartFrm,
                      StatePreamble, StateData, CarrierSense, CarrierSenseLost, TxUsedData, LatchedMRxErr, Loopback, 
                      r_FullD
                    );



parameter Tp = 1;


input         MRxClk;
input         Reset;
input         RxCrcError;
input         MRxErr;
input         MRxDV;

input         RxStateSFD;
input   [1:0] RxStateData;
input         RxStatePreamble;
input         RxStateIdle;
input         Transmitting;
input  [15:0] RxByteCnt;
input         RxByteCntEq0;
input         RxByteCntGreat2;
input         RxByteCntMaxFrame;
input   [3:0] MRxD;
input         Collision;
input   [5:0] CollValid;
input         r_RecSmall;
input  [15:0] r_MinFL;
input  [15:0] r_MaxFL;
input         r_HugEn;
input         StartTxDone;
input         StartTxAbort;
input   [3:0] RetryCnt;
input         MTxClk;
input         MaxCollisionOccured;
input         LateCollision;
input         DeferIndication;
input         TxStartFrm;
input         StatePreamble;
input   [1:0] StateData;
input         CarrierSense;
input         TxUsedData;
input         Loopback;
input         r_FullD;


output        ReceivedLengthOK;
output        ReceiveEnd;
output        ReceivedPacketGood;
output        InvalidSymbol;
output        LatchedCrcError;
output        RxLateCollision;
output        ShortFrame;
output        DribbleNibble;
output        ReceivedPacketTooBig;
output        LoadRxStatus;
output  [3:0] RetryCntLatched;
output        RetryLimit;
output        LateCollLatched;
output        DeferLatched;
output        CarrierSenseLost;
output        LatchedMRxErr;


reg           ReceiveEnd;

reg           LatchedCrcError;
reg           LatchedMRxErr;
reg           LoadRxStatus;
reg           InvalidSymbol;
reg     [3:0] RetryCntLatched;
reg           RetryLimit;
reg           LateCollLatched;
reg           DeferLatched;
reg           CarrierSenseLost;

wire          TakeSample;
wire          SetInvalidSymbol; // Invalid symbol was received during reception in 100Mbps 

// Crc error
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedCrcError <=#Tp 1'b0;
  else
  if(RxStateSFD)
    LatchedCrcError <=#Tp 1'b0;
  else
  if(RxStateData[0])
    LatchedCrcError <=#Tp RxCrcError & ~RxByteCntEq0;
end


// LatchedMRxErr
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedMRxErr <=#Tp 1'b0;
  else
  if(MRxErr & MRxDV & (RxStatePreamble | RxStateSFD | (|RxStateData) | RxStateIdle & ~Transmitting))
    LatchedMRxErr <=#Tp 1'b1;
  else
    LatchedMRxErr <=#Tp 1'b0;
end


// ReceivedPacketGood
assign ReceivedPacketGood = ~LatchedCrcError;


// ReceivedLengthOK
assign ReceivedLengthOK = RxByteCnt[15:0] >= r_MinFL[15:0] & RxByteCnt[15:0] <= r_MaxFL[15:0];





// Time to take a sample
//assign TakeSample = |RxStateData     & ~MRxDV & RxByteCntGreat2  |
assign TakeSample = (|RxStateData)   & (~MRxDV)                    |
                      RxStateData[0] &   MRxDV & RxByteCntMaxFrame;


// LoadRxStatus
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LoadRxStatus <=#Tp 1'b0;
  else
    LoadRxStatus <=#Tp TakeSample;
end



// ReceiveEnd
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ReceiveEnd  <=#Tp 1'b0;
  else
    ReceiveEnd  <=#Tp LoadRxStatus;                     
end


// Invalid Symbol received during 100Mbps mode
assign SetInvalidSymbol = MRxDV & MRxErr & MRxD[3:0] == 4'he;


// InvalidSymbol
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    InvalidSymbol <=#Tp 1'b0;
  else
  if(LoadRxStatus & ~SetInvalidSymbol)
    InvalidSymbol <=#Tp 1'b0;
  else
  if(SetInvalidSymbol)
    InvalidSymbol <=#Tp 1'b1;
end


// Late Collision

reg RxLateCollision;
reg RxColWindow;
// Collision Window
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxLateCollision <=#Tp 1'b0;
  else
  if(LoadRxStatus)
    RxLateCollision <=#Tp 1'b0;
  else
  if(Collision & (~r_FullD) & (~RxColWindow | r_RecSmall))
    RxLateCollision <=#Tp 1'b1;
end

// Collision Window
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxColWindow <=#Tp 1'b1;
  else
  if(~Collision & RxByteCnt[5:0] == CollValid[5:0] & RxStateData[1])
    RxColWindow <=#Tp 1'b0;
  else
  if(RxStateIdle)
    RxColWindow <=#Tp 1'b1;
end


// ShortFrame
reg ShortFrame;
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShortFrame <=#Tp 1'b0;
  else
  if(LoadRxStatus)
    ShortFrame <=#Tp 1'b0;
  else
  if(TakeSample)
    ShortFrame <=#Tp RxByteCnt[15:0] < r_MinFL[15:0];
end


// DribbleNibble
reg DribbleNibble;
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    DribbleNibble <=#Tp 1'b0;
  else
  if(RxStateSFD)
    DribbleNibble <=#Tp 1'b0;
  else
  if(~MRxDV & RxStateData[1])
    DribbleNibble <=#Tp 1'b1;
end


reg ReceivedPacketTooBig;
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ReceivedPacketTooBig <=#Tp 1'b0;
  else
  if(LoadRxStatus)
    ReceivedPacketTooBig <=#Tp 1'b0;
  else
  if(TakeSample)
    ReceivedPacketTooBig <=#Tp ~r_HugEn & RxByteCnt[15:0] > r_MaxFL[15:0];
end



// Latched Retry counter for tx status
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RetryCntLatched <=#Tp 4'h0;
  else
  if(StartTxDone | StartTxAbort)
    RetryCntLatched <=#Tp RetryCnt;
end


// Latched Retransmission limit
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RetryLimit <=#Tp 4'h0;
  else
  if(StartTxDone | StartTxAbort)
    RetryLimit <=#Tp MaxCollisionOccured;
end


// Latched Late Collision
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    LateCollLatched <=#Tp 1'b0;
  else
  if(StartTxDone | StartTxAbort)
    LateCollLatched <=#Tp LateCollision;
end



// Latched Defer state
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    DeferLatched <=#Tp 1'b0;
  else
  if(DeferIndication & TxUsedData)
    DeferLatched <=#Tp 1'b1;
  else
  if(TxStartFrm)
    DeferLatched <=#Tp 1'b0;
end


// CarrierSenseLost
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    CarrierSenseLost <=#Tp 1'b0;
  else
  if((StatePreamble | (|StateData)) & ~CarrierSense & ~Loopback & ~Collision & ~r_FullD)
    CarrierSenseLost <=#Tp 1'b1;
  else
  if(TxStartFrm)
    CarrierSenseLost <=#Tp 1'b0;
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_miim.v                                                  ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_miim.v,v $
// Revision 1.4  2002/08/14 18:32:10  mohor
// - Busy signal was not set on time when scan status operation was performed
// and clock was divided with more than 2.
// - Nvalid remains valid two more clocks (was previously cleared too soon).
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.2  2001/08/02 09:25:31  mohor
// Unconnected signals are now connected.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/01 22:28:56  mohor
// This files (MIIM) are fully working. They were thoroughly tested. The testbench is not updated.
//
//



module eth_miim
(
  Clk,
  Reset,
  Divider,
  NoPre,
  CtrlData,
  Rgad,
  Fiad,
  WCtrlData,
  RStat,
  ScanStat,
  Mdi,
  Mdo,
  MdoEn,
  Mdc,
  Busy,
  Prsd,
  LinkFail,
  Nvalid,
  WCtrlDataStart,
  RStatStart,
  UpdateMIIRX_DATAReg
);



input         Clk;                // Host Clock
input         Reset;              // General Reset
input   [7:0] Divider;            // Divider for the host clock
input  [15:0] CtrlData;           // Control Data (to be written to the PHY reg.)
input   [4:0] Rgad;               // Register Address (within the PHY)
input   [4:0] Fiad;               // PHY Address
input         NoPre;              // No Preamble (no 32-bit preamble)
input         WCtrlData;          // Write Control Data operation
input         RStat;              // Read Status operation
input         ScanStat;           // Scan Status operation
input         Mdi;                // MII Management Data In

output        Mdc;                // MII Management Data Clock
output        Mdo;                // MII Management Data Output
output        MdoEn;              // MII Management Data Output Enable
output        Busy;               // Busy Signal
output        LinkFail;           // Link Integrity Signal
output        Nvalid;             // Invalid Status (qualifier for the valid scan result)

output [15:0] Prsd;               // Read Status Data (data read from the PHY)

output        WCtrlDataStart;     // This signals resets the WCTRLDATA bit in the MIIM Command register
output        RStatStart;         // This signal resets the RSTAT BIT in the MIIM Command register
output        UpdateMIIRX_DATAReg;// Updates MII RX_DATA register with read data

parameter Tp = 1;


reg           Nvalid;
reg           EndBusy_d;          // Pre-end Busy signal
reg           EndBusy;            // End Busy signal (stops the operation in progress)

reg           WCtrlData_q1;       // Write Control Data operation delayed 1 Clk cycle
reg           WCtrlData_q2;       // Write Control Data operation delayed 2 Clk cycles
reg           WCtrlData_q3;       // Write Control Data operation delayed 3 Clk cycles
reg           WCtrlDataStart;     // Start Write Control Data Command (positive edge detected)
reg           WCtrlDataStart_q;
reg           WCtrlDataStart_q1;  // Start Write Control Data Command delayed 1 Mdc cycle
reg           WCtrlDataStart_q2;  // Start Write Control Data Command delayed 2 Mdc cycles

reg           RStat_q1;           // Read Status operation delayed 1 Clk cycle
reg           RStat_q2;           // Read Status operation delayed 2 Clk cycles
reg           RStat_q3;           // Read Status operation delayed 3 Clk cycles
reg           RStatStart;         // Start Read Status Command (positive edge detected)
reg           RStatStart_q1;      // Start Read Status Command delayed 1 Mdc cycle
reg           RStatStart_q2;      // Start Read Status Command delayed 2 Mdc cycles

reg           ScanStat_q1;        // Scan Status operation delayed 1 cycle
reg           ScanStat_q2;        // Scan Status operation delayed 2 cycles
reg           SyncStatMdcEn;      // Scan Status operation delayed at least cycles and synchronized to MdcEn

wire          WriteDataOp;        // Write Data Operation (positive edge detected)
wire          ReadStatusOp;       // Read Status Operation (positive edge detected)
wire          ScanStatusOp;       // Scan Status Operation (positive edge detected)
wire          StartOp;            // Start Operation (start of any of the preceding operations)
wire          EndOp;              // End of Operation

reg           InProgress;         // Operation in progress
reg           InProgress_q1;      // Operation in progress delayed 1 Mdc cycle
reg           InProgress_q2;      // Operation in progress delayed 2 Mdc cycles
reg           InProgress_q3;      // Operation in progress delayed 3 Mdc cycles

reg           WriteOp;            // Write Operation Latch (When asserted, write operation is in progress)
reg     [6:0] BitCounter;         // Bit Counter


wire          MdcFrame;           // Frame window for limiting the Mdc
wire    [3:0] ByteSelect;         // Byte Select defines which byte (preamble, data, operation, etc.) is loaded and shifted through the shift register.
wire          MdcEn;              // MII Management Data Clock Enable signal is asserted for one Clk period before Mdc rises.
wire          ShiftedBit;         // This bit is output of the shift register and is connected to the Mdo signal


wire          LatchByte1_d2;
wire          LatchByte0_d2;
reg           LatchByte1_d;
reg           LatchByte0_d;
reg     [1:0] LatchByte;          // Latch Byte selects which part of Read Status Data is updated from the shift register

reg           UpdateMIIRX_DATAReg;// Updates MII RX_DATA register with read data





// Generation of the EndBusy signal. It is used for ending the MII Management operation.
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      EndBusy_d <= #Tp 1'b0;
      EndBusy <= #Tp 1'b0;
    end
  else
    begin
      EndBusy_d <= #Tp ~InProgress_q2 & InProgress_q3;
      EndBusy   <= #Tp EndBusy_d;
    end
end


// Update MII RX_DATA register
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    UpdateMIIRX_DATAReg <= #Tp 0;
  else
  if(EndBusy & ~WCtrlDataStart_q)
    UpdateMIIRX_DATAReg <= #Tp 1;
  else
    UpdateMIIRX_DATAReg <= #Tp 0;    
end



// Generation of the delayed signals used for positive edge triggering.
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      WCtrlData_q1 <= #Tp 1'b0;
      WCtrlData_q2 <= #Tp 1'b0;
      WCtrlData_q3 <= #Tp 1'b0;
      
      RStat_q1 <= #Tp 1'b0;
      RStat_q2 <= #Tp 1'b0;
      RStat_q3 <= #Tp 1'b0;

      ScanStat_q1  <= #Tp 1'b0;
      ScanStat_q2  <= #Tp 1'b0;
      SyncStatMdcEn <= #Tp 1'b0;
    end
  else
    begin
      WCtrlData_q1 <= #Tp WCtrlData;
      WCtrlData_q2 <= #Tp WCtrlData_q1;
      WCtrlData_q3 <= #Tp WCtrlData_q2;

      RStat_q1 <= #Tp RStat;
      RStat_q2 <= #Tp RStat_q1;
      RStat_q3 <= #Tp RStat_q2;

      ScanStat_q1  <= #Tp ScanStat;
      ScanStat_q2  <= #Tp ScanStat_q1;
      if(MdcEn)
        SyncStatMdcEn  <= #Tp ScanStat_q2;
    end
end


// Generation of the Start Commands (Write Control Data or Read Status)
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      WCtrlDataStart <= #Tp 1'b0;
      WCtrlDataStart_q <= #Tp 1'b0;
      RStatStart <= #Tp 1'b0;
    end
  else
    begin
      if(EndBusy)
        begin
          WCtrlDataStart <= #Tp 1'b0;
          RStatStart <= #Tp 1'b0;
        end
      else
        begin
          if(WCtrlData_q2 & ~WCtrlData_q3)
            WCtrlDataStart <= #Tp 1'b1;
          if(RStat_q2 & ~RStat_q3)
            RStatStart <= #Tp 1'b1;
          WCtrlDataStart_q <= #Tp WCtrlDataStart;
        end
    end
end 


// Generation of the Nvalid signal (indicates when the status is invalid)
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    Nvalid <= #Tp 1'b0;
  else
    begin
      if(~InProgress_q2 & InProgress_q3)
        begin
          Nvalid <= #Tp 1'b0;
        end
      else
        begin
          if(ScanStat_q2  & ~SyncStatMdcEn)
            Nvalid <= #Tp 1'b1;
        end
    end
end 

// Signals used for the generation of the Operation signals (positive edge)
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      WCtrlDataStart_q1 <= #Tp 1'b0;
      WCtrlDataStart_q2 <= #Tp 1'b0;

      RStatStart_q1 <= #Tp 1'b0;
      RStatStart_q2 <= #Tp 1'b0;

      InProgress_q1 <= #Tp 1'b0;
      InProgress_q2 <= #Tp 1'b0;
      InProgress_q3 <= #Tp 1'b0;

  	  LatchByte0_d <= #Tp 1'b0;
  	  LatchByte1_d <= #Tp 1'b0;

  	  LatchByte <= #Tp 2'b00;
    end
  else
    begin
      if(MdcEn)
        begin
          WCtrlDataStart_q1 <= #Tp WCtrlDataStart;
          WCtrlDataStart_q2 <= #Tp WCtrlDataStart_q1;

          RStatStart_q1 <= #Tp RStatStart;
          RStatStart_q2 <= #Tp RStatStart_q1;

          LatchByte[0] <= #Tp LatchByte0_d;
          LatchByte[1] <= #Tp LatchByte1_d;

          LatchByte0_d <= #Tp LatchByte0_d2;
          LatchByte1_d <= #Tp LatchByte1_d2;

          InProgress_q1 <= #Tp InProgress;
          InProgress_q2 <= #Tp InProgress_q1;
          InProgress_q3 <= #Tp InProgress_q2;
        end
    end
end 


// Generation of the Operation signals
assign WriteDataOp  = WCtrlDataStart_q1 & ~WCtrlDataStart_q2;    
assign ReadStatusOp = RStatStart_q1     & ~RStatStart_q2;
assign ScanStatusOp = SyncStatMdcEn     & ~InProgress & ~InProgress_q1 & ~InProgress_q2;
assign StartOp      = WriteDataOp | ReadStatusOp | ScanStatusOp;

// Busy
assign Busy = WCtrlData | WCtrlDataStart | RStat | RStatStart | SyncStatMdcEn | EndBusy | InProgress | InProgress_q3 | Nvalid;

// Generation of the InProgress signal (indicates when an operation is in progress)
// Generation of the WriteOp signal (indicates when a write is in progress)
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      InProgress <= #Tp 1'b0;
      WriteOp <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn)
        begin
          if(StartOp)
            begin
              if(~InProgress)
                WriteOp <= #Tp WriteDataOp;
              InProgress <= #Tp 1'b1;
            end
          else
            begin
              if(EndOp)
                begin
                  InProgress <= #Tp 1'b0;
                  WriteOp <= #Tp 1'b0;
                end
            end
        end
    end
end



// Bit Counter counts from 0 to 63 (from 32 to 63 when NoPre is asserted)
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    BitCounter[6:0] <= #Tp 7'h0;
  else
    begin
      if(MdcEn)
        begin
          if(InProgress)
            begin
              if(NoPre & ( BitCounter == 7'h0 ))
                BitCounter[6:0] <= #Tp 7'h21;
              else
                BitCounter[6:0] <= #Tp BitCounter[6:0] + 1'b1;
            end
          else
            BitCounter[6:0] <= #Tp 7'h0;
        end
    end
end


// Operation ends when the Bit Counter reaches 63
assign EndOp = BitCounter==63;

assign ByteSelect[0] = InProgress & ((NoPre & (BitCounter == 7'h0)) | (~NoPre & (BitCounter == 7'h20)));
assign ByteSelect[1] = InProgress & (BitCounter == 7'h28);
assign ByteSelect[2] = InProgress & WriteOp & (BitCounter == 7'h30);
assign ByteSelect[3] = InProgress & WriteOp & (BitCounter == 7'h38);


// Latch Byte selects which part of Read Status Data is updated from the shift register
assign LatchByte1_d2 = InProgress & ~WriteOp & BitCounter == 7'h37;
assign LatchByte0_d2 = InProgress & ~WriteOp & BitCounter == 7'h3F;


// Connecting the Clock Generator Module
eth_clockgen clkgen(.Clk(Clk), .Reset(Reset), .Divider(Divider[7:0]), .MdcEn(MdcEn), .MdcEn_n(MdcEn_n), .Mdc(Mdc) 
                   );

// Connecting the Shift Register Module
eth_shiftreg shftrg(.Clk(Clk), .Reset(Reset), .MdcEn_n(MdcEn_n), .Mdi(Mdi), .Fiad(Fiad), .Rgad(Rgad), 
                    .CtrlData(CtrlData), .WriteOp(WriteOp), .ByteSelect(ByteSelect), .LatchByte(LatchByte), 
                    .ShiftedBit(ShiftedBit), .Prsd(Prsd), .LinkFail(LinkFail)
                   );

// Connecting the Output Control Module
eth_outputcontrol outctrl(.Clk(Clk), .Reset(Reset), .MdcEn_n(MdcEn_n), .InProgress(InProgress), 
                          .ShiftedBit(ShiftedBit), .BitCounter(BitCounter), .WriteOp(WriteOp), .NoPre(NoPre), 
                          .Mdo(Mdo), .MdoEn(MdoEn)
                         );

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_outputcontrol.v                                         ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_outputcontrol.v,v $
// Revision 1.4  2002/07/09 20:11:59  mohor
// Comment removed.
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/01 22:28:56  mohor
// This files (MIIM) are fully working. They were thoroughly tested. The testbench is not updated.
//
//


module eth_outputcontrol(Clk, Reset, InProgress, ShiftedBit, BitCounter, WriteOp, NoPre, MdcEn_n, Mdo, MdoEn);

parameter Tp = 1;

input         Clk;                // Host Clock
input         Reset;              // General Reset
input         WriteOp;            // Write Operation Latch (When asserted, write operation is in progress)
input         NoPre;              // No Preamble (no 32-bit preamble)
input         InProgress;         // Operation in progress
input         ShiftedBit;         // This bit is output of the shift register and is connected to the Mdo signal
input   [6:0] BitCounter;         // Bit Counter
input         MdcEn_n;            // MII Management Data Clock Enable signal is asserted for one Clk period before Mdc falls.

output        Mdo;                // MII Management Data Output
output        MdoEn;              // MII Management Data Output Enable

wire          SerialEn;

reg           MdoEn_2d;
reg           MdoEn_d;
reg           MdoEn;

reg           Mdo_2d;
reg           Mdo_d;
reg           Mdo;                // MII Management Data Output



// Generation of the Serial Enable signal (enables the serialization of the data)
assign SerialEn =  WriteOp & InProgress & ( BitCounter>31 | ( ( BitCounter == 0 ) & NoPre ) )
                | ~WriteOp & InProgress & (( BitCounter>31 & BitCounter<46 ) | ( ( BitCounter == 0 ) & NoPre ));


// Generation of the MdoEn signal
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      MdoEn_2d <= #Tp 1'b0;
      MdoEn_d <= #Tp 1'b0;
      MdoEn <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn_n)
        begin
          MdoEn_2d <= #Tp SerialEn | InProgress & BitCounter<32;
          MdoEn_d <= #Tp MdoEn_2d;
          MdoEn <= #Tp MdoEn_d;
        end
    end
end


// Generation of the Mdo signal.
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      Mdo_2d <= #Tp 1'b0;
      Mdo_d <= #Tp 1'b0;
      Mdo <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn_n)
        begin
          Mdo_2d <= #Tp ~SerialEn & BitCounter<32;
          Mdo_d <= #Tp ShiftedBit | Mdo_2d;
          Mdo <= #Tp Mdo_d;
        end
    end
end



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_random.v                                                ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_random.v,v $
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/19 18:16:40  mohor
// TxClk changed to MTxClk (as discribed in the documentation).
// Crc changed so only one file can be used instead of two.
//
// Revision 1.2  2001/06/19 10:38:07  mohor
// Minor changes in header.
//
// Revision 1.1  2001/06/19 10:27:57  mohor
// TxEthMAC initial release.
//
//
//
//


module eth_random (MTxClk, Reset, StateJam, StateJam_q, RetryCnt, NibCnt, ByteCnt, 
                   RandomEq0, RandomEqByteCnt);

parameter Tp = 1;

input MTxClk;
input Reset;
input StateJam;
input StateJam_q;
input [3:0] RetryCnt;
input [15:0] NibCnt;
input [9:0] ByteCnt;
output RandomEq0;
output RandomEqByteCnt;

wire Feedback;
reg [9:0] x;
wire [9:0] Random;
reg  [9:0] RandomLatched;


always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    x[9:0] <= #Tp 0;
  else
    x[9:0] <= #Tp {x[8:0], Feedback};
end

assign Feedback = ~(x[2] ^ x[9]);

assign Random [0] = x[0];
assign Random [1] = (RetryCnt > 1) ? x[1] : 1'b0;
assign Random [2] = (RetryCnt > 2) ? x[2] : 1'b0;
assign Random [3] = (RetryCnt > 3) ? x[3] : 1'b0;
assign Random [4] = (RetryCnt > 4) ? x[4] : 1'b0;
assign Random [5] = (RetryCnt > 5) ? x[5] : 1'b0;
assign Random [6] = (RetryCnt > 6) ? x[6] : 1'b0;
assign Random [7] = (RetryCnt > 7) ? x[7] : 1'b0;
assign Random [8] = (RetryCnt > 8) ? x[8] : 1'b0;
assign Random [9] = (RetryCnt > 9) ? x[9] : 1'b0;


always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RandomLatched <= #Tp 10'h000;
  else
    begin
      if(StateJam & StateJam_q)
        RandomLatched <= #Tp Random;
    end
end

// Random Number == 0      IEEE 802.3 page 68. If 0 we go to defer and not to backoff.
assign RandomEq0 = RandomLatched == 10'h0; 

assign RandomEqByteCnt = ByteCnt[9:0] == RandomLatched & (&NibCnt[6:0]);

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_register.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_register.v,v $
// Revision 1.6  2002/08/16 22:10:12  mohor
// Synchronous reset added.
//
// Revision 1.5  2002/08/16 12:33:27  mohor
// Parameter ResetValue changed to capital letters.
//
// Revision 1.4  2002/02/26 16:18:08  mohor
// Reset values are passed to registers through parameters
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
//
//
//
//
//
//



module eth_register(DataIn, DataOut, Write, Clk, Reset, SyncReset);

parameter WIDTH = 8; // default parameter of the register width
parameter RESET_VALUE = 0;

input [WIDTH-1:0] DataIn;

input Write;
input Clk;
input Reset;
input SyncReset;

output [WIDTH-1:0] DataOut;
reg    [WIDTH-1:0] DataOut;



always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    DataOut<=#1 RESET_VALUE;
  else
  if(SyncReset)
    DataOut<=#1 RESET_VALUE;
  else
  if(Write)                         // write
    DataOut<=#1 DataIn;
end



endmodule   // Register
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_registers.v                                             ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_registers.v,v $
// Revision 1.24  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.23  2002/11/19 18:13:49  mohor
// r_MiiMRst is not used for resetting the MIIM module. wb_rst used instead.
//
// Revision 1.22  2002/11/14 18:37:20  mohor
// r_Rst signal does not reset any module any more and is removed from the design.
//
// Revision 1.21  2002/09/10 10:35:23  mohor
// Ethernet debug registers removed.
//
// Revision 1.20  2002/09/04 18:40:25  mohor
// ETH_TXCTRL and ETH_RXCTRL registers added. Interrupts related to
// the control frames connected.
//
// Revision 1.19  2002/08/19 16:01:40  mohor
// Only values smaller or equal to 0x80 can be written to TX_BD_NUM register.
// r_TxEn and r_RxEn depend on the limit values of the TX_BD_NUMOut.
//
// Revision 1.18  2002/08/16 22:28:23  mohor
// Syntax error fixed.
//
// Revision 1.17  2002/08/16 22:23:03  mohor
// Syntax error fixed.
//
// Revision 1.16  2002/08/16 22:14:22  mohor
// Synchronous reset added to all registers. Defines used for width. r_MiiMRst
// changed from bit position 10 to 9.
//
// Revision 1.15  2002/08/14 18:26:37  mohor
// LinkFailRegister is reflecting the status of the PHY's link fail status bit.
//
// Revision 1.14  2002/04/22 14:03:44  mohor
// Interrupts are visible in the ETH_INT_SOURCE regardless if they are enabled
// or not.
//
// Revision 1.13  2002/02/26 16:18:09  mohor
// Reset values are passed to registers through parameters
//
// Revision 1.12  2002/02/17 13:23:42  mohor
// Define missmatch fixed.
//
// Revision 1.11  2002/02/16 14:03:44  mohor
// Registered trimmed. Unused registers removed.
//
// Revision 1.10  2002/02/15 11:08:25  mohor
// File format fixed a bit.
//
// Revision 1.9  2002/02/14 20:19:41  billditt
// Modified for Address Checking,
// addition of eth_addrcheck.v
//
// Revision 1.8  2002/02/12 17:01:19  mohor
// HASH0 and HASH1 registers added. 

// Revision 1.7  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.6  2001/12/05 15:00:16  mohor
// RX_BD_NUM changed to TX_BD_NUM (holds number of TX descriptors
// instead of the number of RX descriptors).
//
// Revision 1.5  2001/12/05 10:22:19  mohor
// ETH_RX_BD_ADR register deleted. ETH_RX_BD_NUM is used instead.
//
// Revision 1.4  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.3  2001/10/18 12:07:11  mohor
// Status signals changed, Adress decoding changed, interrupt controller
// added.
//
// Revision 1.2  2001/09/24 15:02:56  mohor
// Defines changed (All precede with ETH_). Small changes because some
// tools generate warnings when two operands are together. Synchronization
// between two clocks domains in eth_wishbonedma.v is changed (due to ASIC
// demands).
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.2  2001/08/02 09:25:31  mohor
// Unconnected signals are now connected.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
//
//
//
//
//


module eth_registers( DataIn, Address, Rw, Cs, Clk, Reset, DataOut, 
                      r_RecSmall, r_Pad, r_HugEn, r_CrcEn, r_DlyCrcEn, 
                      r_FullD, r_ExDfrEn, r_NoBckof, r_LoopBck, r_IFG, 
                      r_Pro, r_Iam, r_Bro, r_NoPre, r_TxEn, r_RxEn, 
                      TxB_IRQ, TxE_IRQ, RxB_IRQ, RxE_IRQ, Busy_IRQ, 
                      r_IPGT, r_IPGR1, r_IPGR2, r_MinFL, r_MaxFL, r_MaxRet, 
                      r_CollValid, r_TxFlow, r_RxFlow, r_PassAll, 
                      r_MiiNoPre, r_ClkDiv, r_WCtrlData, r_RStat, r_ScanStat, 
                      r_RGAD, r_FIAD, r_CtrlData, NValid_stat, Busy_stat, 
                      LinkFail, r_MAC, WCtrlDataStart, RStatStart,
                      UpdateMIIRX_DATAReg, Prsd, r_TxBDNum, TX_BD_NUM_Wr, int_o,
                      r_HASH0, r_HASH1, r_TxPauseTV, r_TxPauseRq, RstTxPauseRq, TxCtrlEndFrm, 
                      StartTxDone, TxClk, RxClk, SetPauseTimer
                    );

parameter Tp = 1;

input [31:0] DataIn;
input [7:0] Address;

input Rw;
input Cs;
input Clk;
input Reset;

input WCtrlDataStart;
input RStatStart;

input UpdateMIIRX_DATAReg;
input [15:0] Prsd;

output [31:0] DataOut;
reg    [31:0] DataOut;

output r_RecSmall;
output r_Pad;
output r_HugEn;
output r_CrcEn;
output r_DlyCrcEn;
output r_FullD;
output r_ExDfrEn;
output r_NoBckof;
output r_LoopBck;
output r_IFG;
output r_Pro;
output r_Iam;
output r_Bro;
output r_NoPre;
output r_TxEn;
output r_RxEn;
output [31:0] r_HASH0;
output [31:0] r_HASH1;

input TxB_IRQ;
input TxE_IRQ;
input RxB_IRQ;
input RxE_IRQ;
input Busy_IRQ;

output [6:0] r_IPGT;

output [6:0] r_IPGR1;

output [6:0] r_IPGR2;

output [15:0] r_MinFL;
output [15:0] r_MaxFL;

output [3:0] r_MaxRet;
output [5:0] r_CollValid;

output r_TxFlow;
output r_RxFlow;
output r_PassAll;

output r_MiiNoPre;
output [7:0] r_ClkDiv;

output r_WCtrlData;
output r_RStat;
output r_ScanStat;

output [4:0] r_RGAD;
output [4:0] r_FIAD;

output [15:0]r_CtrlData;


input NValid_stat;
input Busy_stat;
input LinkFail;

output [47:0]r_MAC;
output [7:0] r_TxBDNum;
output       TX_BD_NUM_Wr;
output       int_o;
output [15:0]r_TxPauseTV;
output       r_TxPauseRq;
input        RstTxPauseRq;
input        TxCtrlEndFrm;
input        StartTxDone;
input        TxClk;
input        RxClk;
input        SetPauseTimer;

reg          irq_txb;
reg          irq_txe;
reg          irq_rxb;
reg          irq_rxe;
reg          irq_busy;
reg          irq_txc;
reg          irq_rxc;

reg SetTxCIrq_txclk;
reg SetTxCIrq_sync1, SetTxCIrq_sync2, SetTxCIrq_sync3;
reg SetTxCIrq;
reg ResetTxCIrq_sync1, ResetTxCIrq_sync2;

reg SetRxCIrq_rxclk;
reg SetRxCIrq_sync1, SetRxCIrq_sync2, SetRxCIrq_sync3;
reg SetRxCIrq;
reg ResetRxCIrq_sync1;
reg ResetRxCIrq_sync2;
reg ResetRxCIrq_sync3;

wire Write = Cs &  Rw;
wire Read  = Cs & ~Rw;

wire MODER_Wr       = (Address == `ETH_MODER_ADR       )  & Write;
wire INT_SOURCE_Wr  = (Address == `ETH_INT_SOURCE_ADR  )  & Write;
wire INT_MASK_Wr    = (Address == `ETH_INT_MASK_ADR    )  & Write;
wire IPGT_Wr        = (Address == `ETH_IPGT_ADR        )  & Write;
wire IPGR1_Wr       = (Address == `ETH_IPGR1_ADR       )  & Write;
wire IPGR2_Wr       = (Address == `ETH_IPGR2_ADR       )  & Write;
wire PACKETLEN_Wr   = (Address == `ETH_PACKETLEN_ADR   )  & Write;
wire COLLCONF_Wr    = (Address == `ETH_COLLCONF_ADR    )  & Write;
     
wire CTRLMODER_Wr   = (Address == `ETH_CTRLMODER_ADR   )  & Write;
wire MIIMODER_Wr    = (Address == `ETH_MIIMODER_ADR    )  & Write;
wire MIICOMMAND_Wr  = (Address == `ETH_MIICOMMAND_ADR  )  & Write;
wire MIIADDRESS_Wr  = (Address == `ETH_MIIADDRESS_ADR  )  & Write;
wire MIITX_DATA_Wr  = (Address == `ETH_MIITX_DATA_ADR  )  & Write;
wire MIIRX_DATA_Wr  = UpdateMIIRX_DATAReg;     
wire MAC_ADDR0_Wr   = (Address == `ETH_MAC_ADDR0_ADR   )  & Write;
wire MAC_ADDR1_Wr   = (Address == `ETH_MAC_ADDR1_ADR   )  & Write;
wire HASH0_Wr       = (Address == `ETH_HASH0_ADR       )  & Write;
wire HASH1_Wr       = (Address == `ETH_HASH1_ADR       )  & Write;
wire TXCTRL_Wr      = (Address == `ETH_TX_CTRL_ADR     )  & Write;
wire RXCTRL_Wr      = (Address == `ETH_RX_CTRL_ADR     )  & Write;
assign TX_BD_NUM_Wr = (Address == `ETH_TX_BD_NUM_ADR   )  & Write  & (DataIn<='h80);



wire [31:0] MODEROut;
wire [31:0] INT_SOURCEOut;
wire [31:0] INT_MASKOut;
wire [31:0] IPGTOut;
wire [31:0] IPGR1Out;
wire [31:0] IPGR2Out;
wire [31:0] PACKETLENOut;
wire [31:0] COLLCONFOut;
wire [31:0] CTRLMODEROut;
wire [31:0] MIIMODEROut;
wire [31:0] MIICOMMANDOut;
wire [31:0] MIIADDRESSOut;
wire [31:0] MIITX_DATAOut;
wire [31:0] MIIRX_DATAOut;
wire [31:0] MIISTATUSOut;
wire [31:0] MAC_ADDR0Out;
wire [31:0] MAC_ADDR1Out;
wire [31:0] TX_BD_NUMOut;
wire [31:0] HASH0Out;
wire [31:0] HASH1Out;
wire [31:0] TXCTRLOut;
wire [31:0] RXCTRLOut;


// MODER Register
eth_register #(`ETH_MODER_WIDTH, `ETH_MODER_DEF)        MODER
  (
   .DataIn    (DataIn[`ETH_MODER_WIDTH-1:0]),
   .DataOut   (MODEROut[`ETH_MODER_WIDTH-1:0]),
   .Write     (MODER_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MODEROut[31:`ETH_MODER_WIDTH] = 0;

// INT_MASK Register
eth_register #(`ETH_INT_MASK_WIDTH, `ETH_INT_MASK_DEF)  INT_MASK
  (
   .DataIn    (DataIn[`ETH_INT_MASK_WIDTH-1:0]),  
   .DataOut   (INT_MASKOut[`ETH_INT_MASK_WIDTH-1:0]),
   .Write     (INT_MASK_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign INT_MASKOut[31:`ETH_INT_MASK_WIDTH] = 0;

// IPGT Register
eth_register #(`ETH_IPGT_WIDTH, `ETH_IPGT_DEF)          IPGT
  (
   .DataIn    (DataIn[`ETH_IPGT_WIDTH-1:0]),
   .DataOut   (IPGTOut[`ETH_IPGT_WIDTH-1:0]),
   .Write     (IPGT_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign IPGTOut[31:`ETH_IPGT_WIDTH] = 0;

// IPGR1 Register
eth_register #(`ETH_IPGR1_WIDTH, `ETH_IPGR1_DEF)        IPGR1
  (
   .DataIn    (DataIn[`ETH_IPGR1_WIDTH-1:0]),
   .DataOut   (IPGR1Out[`ETH_IPGR1_WIDTH-1:0]),
   .Write     (IPGR1_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign IPGR1Out[31:`ETH_IPGR1_WIDTH] = 0;

// IPGR2 Register
eth_register #(`ETH_IPGR2_WIDTH, `ETH_IPGR2_DEF)        IPGR2
  (
   .DataIn    (DataIn[`ETH_IPGR2_WIDTH-1:0]),
   .DataOut   (IPGR2Out[`ETH_IPGR2_WIDTH-1:0]),
   .Write     (IPGR2_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign IPGR2Out[31:`ETH_IPGR2_WIDTH] = 0;

// PACKETLEN Register
eth_register #(`ETH_PACKETLEN_WIDTH, `ETH_PACKETLEN_DEF) PACKETLEN
  (
   .DataIn    (DataIn),
   .DataOut   (PACKETLENOut),
   .Write     (PACKETLEN_Wr),
   .Clk       (Clk), 
   .Reset     (Reset),
   .SyncReset (1'b0)
  );

// COLLCONF Register
eth_register #(6, `ETH_COLLCONF0_DEF)                   COLLCONF0
  (
   .DataIn    (DataIn[5:0]),
   .DataOut   (COLLCONFOut[5:0]),
   .Write     (COLLCONF_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign COLLCONFOut[15:6] = 0;

eth_register #(4, `ETH_COLLCONF1_DEF)                   COLLCONF1
  (
   .DataIn    (DataIn[19:16]),
   .DataOut   (COLLCONFOut[19:16]),
   .Write     (COLLCONF_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign COLLCONFOut[31:20] = 0;

// TX_BD_NUM Register
eth_register #(`ETH_TX_BD_NUM_WIDTH, `ETH_TX_BD_NUM_DEF) TX_BD_NUM
  (
   .DataIn    (DataIn[`ETH_TX_BD_NUM_WIDTH-1:0]),
   .DataOut   (TX_BD_NUMOut[`ETH_TX_BD_NUM_WIDTH-1:0]),
   .Write     (TX_BD_NUM_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign TX_BD_NUMOut[31:`ETH_TX_BD_NUM_WIDTH] = 0;

// CTRLMODER Register
eth_register #(`ETH_CTRLMODER_WIDTH, `ETH_CTRLMODER_DEF)  CTRLMODER2
  (
   .DataIn    (DataIn[`ETH_CTRLMODER_WIDTH-1:0]),
   .DataOut   (CTRLMODEROut[`ETH_CTRLMODER_WIDTH-1:0]),
   .Write     (CTRLMODER_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign CTRLMODEROut[31:`ETH_CTRLMODER_WIDTH] = 0;

// MIIMODER Register
eth_register #(`ETH_MIIMODER_WIDTH, `ETH_MIIMODER_DEF)    MIIMODER
  (
   .DataIn    (DataIn[`ETH_MIIMODER_WIDTH-1:0]),
   .DataOut   (MIIMODEROut[`ETH_MIIMODER_WIDTH-1:0]),
   .Write     (MIIMODER_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MIIMODEROut[31:`ETH_MIIMODER_WIDTH] = 0;

// MIICOMMAND Register
eth_register #(1, 0)                                      MIICOMMAND0
  (
   .DataIn    (DataIn[0]),
   .DataOut   (MIICOMMANDOut[0]),
   .Write     (MIICOMMAND_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );

eth_register #(1, 0)                                      MIICOMMAND1
  (
   .DataIn    (DataIn[1]),
   .DataOut   (MIICOMMANDOut[1]),
   .Write     (MIICOMMAND_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (RStatStart)
  );

eth_register #(1, 0)                                      MIICOMMAND2
  (
   .DataIn    (DataIn[2]),
   .DataOut   (MIICOMMANDOut[2]),
   .Write     (MIICOMMAND_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (WCtrlDataStart)
  );
assign MIICOMMANDOut[31:3] = 29'h0;

// MIIADDRESSRegister
eth_register #(5, `ETH_MIIADDRESS0_DEF)                   MIIADDRESS0
  (
   .DataIn    (DataIn[4:0]),
   .DataOut   (MIIADDRESSOut[4:0]),
   .Write     (MIIADDRESS_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MIIADDRESSOut[7:5] = 0;

eth_register #(5, `ETH_MIIADDRESS1_DEF)                   MIIADDRESS1
  (
   .DataIn    (DataIn[12:8]),
   .DataOut   (MIIADDRESSOut[12:8]),
   .Write     (MIIADDRESS_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MIIADDRESSOut[31:13] = 0;

// MIITX_DATA Register
eth_register #(`ETH_MIITX_DATA_WIDTH, `ETH_MIITX_DATA_DEF) MIITX_DATA
  (
   .DataIn    (DataIn[`ETH_MIITX_DATA_WIDTH-1:0]),
   .DataOut   (MIITX_DATAOut[`ETH_MIITX_DATA_WIDTH-1:0]), 
   .Write     (MIITX_DATA_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MIITX_DATAOut[31:`ETH_MIITX_DATA_WIDTH] = 0;

// MIIRX_DATA Register
eth_register #(`ETH_MIIRX_DATA_WIDTH, `ETH_MIIRX_DATA_DEF) MIIRX_DATA
  (
   .DataIn    (Prsd[`ETH_MIIRX_DATA_WIDTH-1:0]),
   .DataOut   (MIIRX_DATAOut[`ETH_MIIRX_DATA_WIDTH-1:0]),
   .Write     (MIIRX_DATA_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MIIRX_DATAOut[31:`ETH_MIIRX_DATA_WIDTH] = 0;

// MAC_ADDR0 Register
eth_register #(`ETH_MAC_ADDR0_WIDTH, `ETH_MAC_ADDR0_DEF)  MAC_ADDR0
  (
   .DataIn    (DataIn),
   .DataOut   (MAC_ADDR0Out),
   .Write     (MAC_ADDR0_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );

// MAC_ADDR1 Register
eth_register #(`ETH_MAC_ADDR1_WIDTH, `ETH_MAC_ADDR1_DEF)  MAC_ADDR1
  (
   .DataIn    (DataIn[`ETH_MAC_ADDR1_WIDTH-1:0]),
   .DataOut   (MAC_ADDR1Out[`ETH_MAC_ADDR1_WIDTH-1:0]),
   .Write     (MAC_ADDR1_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign MAC_ADDR1Out[31:`ETH_MAC_ADDR1_WIDTH] = 0;

// RXHASH0 Register
eth_register #(`ETH_HASH0_WIDTH, `ETH_HASH0_DEF)          RXHASH0
  (
   .DataIn    (DataIn),
   .DataOut   (HASH0Out),
   .Write     (HASH0_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );

// RXHASH1 Register
eth_register #(`ETH_HASH1_WIDTH, `ETH_HASH1_DEF)          RXHASH1
  (
   .DataIn    (DataIn),
   .DataOut   (HASH1Out),
   .Write     (HASH1_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );


// TXCTRL Register
eth_register #((`ETH_TX_CTRL_WIDTH-1), {(`ETH_TX_CTRL_WIDTH-1){1'b0}})      TXCTRL0
  (
   .DataIn    (DataIn[`ETH_TX_CTRL_WIDTH-2:0]),
   .DataOut   (TXCTRLOut[`ETH_TX_CTRL_WIDTH-2:0]),
   .Write     (TXCTRL_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );

eth_register #(1, 1'b0)                                   TXCTRL1     // Request bit is synchronously reset
  (
   .DataIn    (DataIn[16]),
   .DataOut   (TXCTRLOut[16]),
   .Write     (TXCTRL_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (RstTxPauseRq)
  );
assign TXCTRLOut[31:`ETH_TX_CTRL_WIDTH] = 0;


// RXCTRL Register
eth_register #(`ETH_RX_CTRL_WIDTH, `ETH_RX_CTRL_DEF)      RXCTRL
  (
   .DataIn    (DataIn[`ETH_RX_CTRL_WIDTH-1:0]),
   .DataOut   (RXCTRLOut[`ETH_RX_CTRL_WIDTH-1:0]),
   .Write     (RXCTRL_Wr),
   .Clk       (Clk),
   .Reset     (Reset),
   .SyncReset (1'b0)
  );
assign RXCTRLOut[31:`ETH_RX_CTRL_WIDTH] = 0;


// Reading data from registers
always @ (Address       or Read           or MODEROut       or INT_SOURCEOut  or
          INT_MASKOut   or IPGTOut        or IPGR1Out       or IPGR2Out       or
          PACKETLENOut  or COLLCONFOut    or CTRLMODEROut   or MIIMODEROut    or
          MIICOMMANDOut or MIIADDRESSOut  or MIITX_DATAOut  or MIIRX_DATAOut  or 
          MIISTATUSOut  or MAC_ADDR0Out   or MAC_ADDR1Out   or TX_BD_NUMOut   or
          HASH0Out      or HASH1Out       or TXCTRLOut      or RXCTRLOut
         )
begin
  if(Read)  // read
    begin
      case(Address)
        `ETH_MODER_ADR        :  DataOut<=MODEROut;
        `ETH_INT_SOURCE_ADR   :  DataOut<=INT_SOURCEOut;
        `ETH_INT_MASK_ADR     :  DataOut<=INT_MASKOut;
        `ETH_IPGT_ADR         :  DataOut<=IPGTOut;
        `ETH_IPGR1_ADR        :  DataOut<=IPGR1Out;
        `ETH_IPGR2_ADR        :  DataOut<=IPGR2Out;
        `ETH_PACKETLEN_ADR    :  DataOut<=PACKETLENOut;
        `ETH_COLLCONF_ADR     :  DataOut<=COLLCONFOut;
        `ETH_CTRLMODER_ADR    :  DataOut<=CTRLMODEROut;
        `ETH_MIIMODER_ADR     :  DataOut<=MIIMODEROut;
        `ETH_MIICOMMAND_ADR   :  DataOut<=MIICOMMANDOut;
        `ETH_MIIADDRESS_ADR   :  DataOut<=MIIADDRESSOut;
        `ETH_MIITX_DATA_ADR   :  DataOut<=MIITX_DATAOut;
        `ETH_MIIRX_DATA_ADR   :  DataOut<=MIIRX_DATAOut;
        `ETH_MIISTATUS_ADR    :  DataOut<=MIISTATUSOut;
        `ETH_MAC_ADDR0_ADR    :  DataOut<=MAC_ADDR0Out;
        `ETH_MAC_ADDR1_ADR    :  DataOut<=MAC_ADDR1Out;
        `ETH_TX_BD_NUM_ADR    :  DataOut<=TX_BD_NUMOut;
        `ETH_HASH0_ADR        :  DataOut<=HASH0Out;
        `ETH_HASH1_ADR        :  DataOut<=HASH1Out;
        `ETH_TX_CTRL_ADR      :  DataOut<=TXCTRLOut;
        `ETH_RX_CTRL_ADR      :  DataOut<=RXCTRLOut;

        default:             DataOut<=32'h0;
      endcase
    end
  else
    DataOut<=32'h0;
end


assign r_RecSmall         = MODEROut[16];
assign r_Pad              = MODEROut[15];
assign r_HugEn            = MODEROut[14];
assign r_CrcEn            = MODEROut[13];
assign r_DlyCrcEn         = MODEROut[12];
// assign r_Rst           = MODEROut[11];   This signal is not used any more
assign r_FullD            = MODEROut[10];
assign r_ExDfrEn          = MODEROut[9];
assign r_NoBckof          = MODEROut[8];
assign r_LoopBck          = MODEROut[7];
assign r_IFG              = MODEROut[6];
assign r_Pro              = MODEROut[5];
assign r_Iam              = MODEROut[4];
assign r_Bro              = MODEROut[3];
assign r_NoPre            = MODEROut[2];
assign r_TxEn             = MODEROut[1] & (TX_BD_NUMOut>0);     // Transmission is enabled when there is at least one TxBD.
assign r_RxEn             = MODEROut[0] & (TX_BD_NUMOut<'h80);  // Reception is enabled when there is  at least one RxBD.

assign r_IPGT[6:0]        = IPGTOut[6:0];

assign r_IPGR1[6:0]       = IPGR1Out[6:0];

assign r_IPGR2[6:0]       = IPGR2Out[6:0];

assign r_MinFL[15:0]      = PACKETLENOut[31:16];
assign r_MaxFL[15:0]      = PACKETLENOut[15:0];

assign r_MaxRet[3:0]      = COLLCONFOut[19:16];
assign r_CollValid[5:0]   = COLLCONFOut[5:0];

assign r_TxFlow           = CTRLMODEROut[2];
assign r_RxFlow           = CTRLMODEROut[1];
assign r_PassAll          = CTRLMODEROut[0];

assign r_MiiNoPre         = MIIMODEROut[8];
assign r_ClkDiv[7:0]      = MIIMODEROut[7:0];

assign r_WCtrlData        = MIICOMMANDOut[2];
assign r_RStat            = MIICOMMANDOut[1];
assign r_ScanStat         = MIICOMMANDOut[0];

assign r_RGAD[4:0]        = MIIADDRESSOut[12:8];
assign r_FIAD[4:0]        = MIIADDRESSOut[4:0];

assign r_CtrlData[15:0]   = MIITX_DATAOut[15:0];

assign MIISTATUSOut[31:`ETH_MIISTATUS_WIDTH] = 0; 
assign MIISTATUSOut[2]    = NValid_stat         ; 
assign MIISTATUSOut[1]    = Busy_stat           ; 
assign MIISTATUSOut[0]    = LinkFail            ; 

assign r_MAC[31:0]        = MAC_ADDR0Out[31:0];
assign r_MAC[47:32]       = MAC_ADDR1Out[15:0];
assign r_HASH1[31:0]      = HASH1Out;
assign r_HASH0[31:0]      = HASH0Out;

assign r_TxBDNum[7:0]     = TX_BD_NUMOut[7:0];

assign r_TxPauseTV[15:0]  = TXCTRLOut[15:0];
assign r_TxPauseRq        = TXCTRLOut[16];


// Synchronizing TxC Interrupt
always @ (posedge TxClk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_txclk <=#Tp 1'b0;
  else
  if(TxCtrlEndFrm & StartTxDone & r_TxFlow)
    SetTxCIrq_txclk <=#Tp 1'b1;
  else
  if(ResetTxCIrq_sync2)
    SetTxCIrq_txclk <=#Tp 1'b0;
end


always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_sync1 <=#Tp 1'b0;
  else
    SetTxCIrq_sync1 <=#Tp SetTxCIrq_txclk;
end
 
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)  
    SetTxCIrq_sync2 <=#Tp 1'b0;
  else
    SetTxCIrq_sync2 <=#Tp SetTxCIrq_sync1;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_sync3 <=#Tp 1'b0;
  else
    SetTxCIrq_sync3 <=#Tp SetTxCIrq_sync2;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq <=#Tp 1'b0;
  else
    SetTxCIrq <=#Tp SetTxCIrq_sync2 & ~SetTxCIrq_sync3;
end

always @ (posedge TxClk or posedge Reset)
begin
  if(Reset)
    ResetTxCIrq_sync1 <=#Tp 1'b0;
  else
    ResetTxCIrq_sync1 <=#Tp SetTxCIrq_sync2;
end

always @ (posedge TxClk or posedge Reset)
begin
  if(Reset)
    ResetTxCIrq_sync2 <=#Tp 1'b0;
  else
    ResetTxCIrq_sync2 <=#Tp SetTxCIrq_sync1;
end


// Synchronizing RxC Interrupt
always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_rxclk <=#Tp 1'b0;
  else
  if(SetPauseTimer & r_RxFlow)
    SetRxCIrq_rxclk <=#Tp 1'b1;
  else
  if(ResetRxCIrq_sync2 & (~ResetRxCIrq_sync3))
    SetRxCIrq_rxclk <=#Tp 1'b0;
end


always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_sync1 <=#Tp 1'b0;
  else
    SetRxCIrq_sync1 <=#Tp SetRxCIrq_rxclk;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_sync2 <=#Tp 1'b0;
  else
    SetRxCIrq_sync2 <=#Tp SetRxCIrq_sync1;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_sync3 <=#Tp 1'b0;
  else
    SetRxCIrq_sync3 <=#Tp SetRxCIrq_sync2;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq <=#Tp 1'b0;
  else
    SetRxCIrq <=#Tp SetRxCIrq_sync2 & ~SetRxCIrq_sync3;
end

always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    ResetRxCIrq_sync1 <=#Tp 1'b0;
  else
    ResetRxCIrq_sync1 <=#Tp SetRxCIrq_sync2;
end

always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    ResetRxCIrq_sync2 <=#Tp 1'b0;
  else
    ResetRxCIrq_sync2 <=#Tp ResetRxCIrq_sync1;
end

always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    ResetRxCIrq_sync3 <=#Tp 1'b0;
  else
    ResetRxCIrq_sync3 <=#Tp ResetRxCIrq_sync2;
end



// Interrupt generation
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_txb <= 1'b0;
  else
  if(TxB_IRQ)
    irq_txb <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[0])
    irq_txb <= #Tp 1'b0;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_txe <= 1'b0;
  else
  if(TxE_IRQ)
    irq_txe <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[1])
    irq_txe <= #Tp 1'b0;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_rxb <= 1'b0;
  else
  if(RxB_IRQ)
    irq_rxb <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[2])
    irq_rxb <= #Tp 1'b0;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_rxe <= 1'b0;
  else
  if(RxE_IRQ)
    irq_rxe <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[3])
    irq_rxe <= #Tp 1'b0;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_busy <= 1'b0;
  else
  if(Busy_IRQ)
    irq_busy <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[4])
    irq_busy <= #Tp 1'b0;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_txc <= 1'b0;
  else
  if(SetTxCIrq)
    irq_txc <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[5])
    irq_txc <= #Tp 1'b0;
end

always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_rxc <= 1'b0;
  else
  if(SetRxCIrq)
    irq_rxc <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr & DataIn[6])
    irq_rxc <= #Tp 1'b0;
end

// Generating interrupt signal
assign int_o = irq_txb  & INT_MASKOut[0] | 
               irq_txe  & INT_MASKOut[1] | 
               irq_rxb  & INT_MASKOut[2] | 
               irq_rxe  & INT_MASKOut[3] | 
               irq_busy & INT_MASKOut[4] | 
               irq_txc  & INT_MASKOut[5] | 
               irq_rxc  & INT_MASKOut[6] ;

// For reading interrupt status
assign INT_SOURCEOut = {{(32-`ETH_INT_SOURCE_WIDTH){1'b0}}, irq_rxc, irq_txc, irq_busy, irq_rxe, irq_rxb, irq_txe, irq_txb};



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_rxaddrcheck.v                                           ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/cores/ethmac/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Bill Dittenhofer (billditt@aol.com)                   ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_rxaddrcheck.v,v $
// Revision 1.9  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.8  2002/11/19 17:34:52  mohor
// AddressMiss status is connecting to the Rx BD. AddressMiss is identifying
// that a frame was received because of the promiscous mode.
//
// Revision 1.7  2002/09/04 18:41:06  mohor
// Bug when last byte of destination address was not checked fixed.
//
// Revision 1.6  2002/03/20 15:14:11  mohor
// When in promiscous mode some frames were not received correctly. Fixed.
//
// Revision 1.5  2002/03/02 21:06:32  mohor
// Log info was missing.
//
//
// Revision 1.1  2002/02/08 12:51:54  ditt
// Initial release of the ethernet addresscheck module.
//
//
//
//
//



module eth_rxaddrcheck(MRxClk,  Reset, RxData, Broadcast ,r_Bro ,r_Pro,
                       ByteCntEq2, ByteCntEq3, ByteCntEq4, ByteCntEq5,
                       ByteCntEq6, ByteCntEq7, HASH0, HASH1, 
                       CrcHash,    CrcHashGood, StateData, RxEndFrm,
                       Multicast, MAC, RxAbort, AddressMiss, PassAll,
                       ControlFrmAddressOK
                      );

parameter Tp = 1;

  input        MRxClk; 
  input        Reset; 
  input [7:0]  RxData; 
  input        Broadcast; 
  input        r_Bro; 
  input        r_Pro; 
  input        ByteCntEq2;
  input        ByteCntEq3;
  input        ByteCntEq4;
  input        ByteCntEq5;
  input        ByteCntEq6;
  input        ByteCntEq7;
  input [31:0] HASH0; 
  input [31:0] HASH1; 
  input [5:0]  CrcHash; 
  input        CrcHashGood; 
  input        Multicast; 
  input [47:0] MAC;
  input [1:0]  StateData;
  input        RxEndFrm;
  input        PassAll;
  input        ControlFrmAddressOK;
  
  output       RxAbort;
  output       AddressMiss;

 wire BroadcastOK;
 wire ByteCntEq2;
 wire ByteCntEq3;
 wire ByteCntEq4; 
 wire ByteCntEq5;
 wire RxAddressInvalid;
 wire RxCheckEn;
 wire HashBit;
 wire [31:0] IntHash;
 reg [7:0]  ByteHash;
 reg MulticastOK;
 reg UnicastOK;
 reg RxAbort;
 reg AddressMiss;
 
assign RxAddressInvalid = ~(UnicastOK | BroadcastOK | MulticastOK | r_Pro);
 
assign BroadcastOK = Broadcast & ~r_Bro;
 
assign RxCheckEn   = | StateData;
 
 // Address Error Reported at end of address cycle
 // RxAbort clears after one cycle
 
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbort <= #Tp 1'b0;
  else if(RxAddressInvalid & ByteCntEq7 & RxCheckEn)
    RxAbort <= #Tp 1'b1;
  else
    RxAbort <= #Tp 1'b0;
end
 

// This ff holds the "Address Miss" information that is written to the RX BD status.
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    AddressMiss <= #Tp 1'b0;
  else if(ByteCntEq7 & RxCheckEn)
    AddressMiss <= #Tp (~(UnicastOK | BroadcastOK | MulticastOK | (PassAll & ControlFrmAddressOK)));
end


// Hash Address Check, Multicast
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    MulticastOK <= #Tp 1'b0;
  else if(RxEndFrm | RxAbort)
    MulticastOK <= #Tp 1'b0;
  else if(CrcHashGood & Multicast)
    MulticastOK <= #Tp HashBit;
end
 
 
// Address Detection (unicast)
// start with ByteCntEq2 due to delay of addres from RxData
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    UnicastOK <= #Tp 1'b0;
  else
  if(RxCheckEn & ByteCntEq2)
    UnicastOK <= #Tp   RxData[7:0] == MAC[47:40];
  else
  if(RxCheckEn & ByteCntEq3)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[39:32]) & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq4)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[31:24]) & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq5)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[23:16]) & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq6)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[15:8])  & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq7)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[7:0])   & UnicastOK;
  else
  if(RxEndFrm | RxAbort)
    UnicastOK <= #Tp 1'b0;
end
   
assign IntHash = (CrcHash[5])? HASH1 : HASH0;
  
always@(CrcHash or IntHash)
begin
  case(CrcHash[4:3])
    2'b00: ByteHash = IntHash[7:0];
    2'b01: ByteHash = IntHash[15:8];
    2'b10: ByteHash = IntHash[23:16];
    2'b11: ByteHash = IntHash[31:24];
  endcase
end
      
assign HashBit = ByteHash[CrcHash[2:0]];


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_rxcounters.v                                            ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_rxcounters.v,v $
// Revision 1.5  2002/02/15 11:13:29  mohor
// Format of the file changed a bit.
//
// Revision 1.4  2002/02/14 20:19:41  billditt
// Modified for Address Checking,
// addition of eth_addrcheck.v
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.1  2001/06/27 21:26:19  mohor
// Initial release of the RxEthMAC module.
//
//
//
//
//
//



module eth_rxcounters (MRxClk, Reset, MRxDV, StateIdle, StateSFD, StateData, StateDrop, StatePreamble, 
                       MRxDEqD, DlyCrcEn, DlyCrcCnt, Transmitting, MaxFL, r_IFG, HugEn, IFGCounterEq24, 
                       ByteCntEq0, ByteCntEq1, ByteCntEq2,ByteCntEq3,ByteCntEq4,ByteCntEq5, ByteCntEq6,
                       ByteCntEq7, ByteCntGreat2, ByteCntSmall7, ByteCntMaxFrame, ByteCnt
                      );

parameter Tp = 1;

input         MRxClk;
input         Reset;
input         MRxDV;
input         StateSFD;
input [1:0]   StateData;
input         MRxDEqD;
input         StateIdle;
input         StateDrop;
input         DlyCrcEn;
input         StatePreamble;
input         Transmitting;
input         HugEn;
input [15:0]  MaxFL;
input         r_IFG;

output        IFGCounterEq24;           // IFG counter reaches 9600 ns (960 ns)
output [3:0]  DlyCrcCnt;                // Delayed CRC counter
output        ByteCntEq0;               // Byte counter = 0
output        ByteCntEq1;               // Byte counter = 1
output        ByteCntEq2;               // Byte counter = 2  
output        ByteCntEq3;               // Byte counter = 3  
output        ByteCntEq4;               // Byte counter = 4  
output        ByteCntEq5;               // Byte counter = 5  
output        ByteCntEq6;               // Byte counter = 6
output        ByteCntEq7;               // Byte counter = 7
output        ByteCntGreat2;            // Byte counter > 2
output        ByteCntSmall7;            // Byte counter < 7
output        ByteCntMaxFrame;          // Byte counter = MaxFL
output [15:0] ByteCnt;                  // Byte counter

wire          ResetByteCounter;
wire          IncrementByteCounter;
wire          ResetIFGCounter;
wire          IncrementIFGCounter;
wire          ByteCntMax;

reg   [15:0]  ByteCnt;
reg   [3:0]   DlyCrcCnt;
reg   [4:0]   IFGCounter;



assign ResetByteCounter = MRxDV & (StateSFD & MRxDEqD | StateData[0] & ByteCntMaxFrame);

assign IncrementByteCounter = ~ResetByteCounter & MRxDV & 
                              (StatePreamble | StateSFD | StateIdle & ~Transmitting |
                               StateData[1] & ~ByteCntMax & ~(DlyCrcEn & |DlyCrcCnt)
                              );


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ByteCnt[15:0] <= #Tp 11'h0;
  else
    begin
      if(ResetByteCounter)
        ByteCnt[15:0] <= #Tp 11'h0;
      else
      if(IncrementByteCounter)
        ByteCnt[15:0] <= #Tp ByteCnt[15:0] + 1'b1;
     end
end

assign ByteCntEq0       = ByteCnt == 16'h0;
assign ByteCntEq1       = ByteCnt == 16'h1;
assign ByteCntEq2       = ByteCnt == 16'h2; 
assign ByteCntEq3       = ByteCnt == 16'h3; 
assign ByteCntEq4       = ByteCnt == 16'h4; 
assign ByteCntEq5       = ByteCnt == 16'h5; 
assign ByteCntEq6       = ByteCnt == 16'h6;
assign ByteCntEq7       = ByteCnt == 16'h7;
assign ByteCntGreat2    = ByteCnt >  16'h2;
assign ByteCntSmall7    = ByteCnt <  16'h7;
assign ByteCntMax       = ByteCnt == 16'hffff;
assign ByteCntMaxFrame  = ByteCnt == MaxFL[15:0] & ~HugEn;



assign ResetIFGCounter = StateSFD  &  MRxDV & MRxDEqD | StateDrop;

assign IncrementIFGCounter = ~ResetIFGCounter & (StateDrop | StateIdle | StatePreamble | StateSFD) & ~IFGCounterEq24;

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    IFGCounter[4:0] <= #Tp 5'h0;
  else
    begin
      if(ResetIFGCounter)
        IFGCounter[4:0] <= #Tp 5'h0;
      else
      if(IncrementIFGCounter)
        IFGCounter[4:0] <= #Tp IFGCounter[4:0] + 1'b1; 
    end
end



assign IFGCounterEq24 = (IFGCounter[4:0] == 5'h18) | r_IFG; // 24*400 = 9600 ns or r_IFG is set to 1


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    DlyCrcCnt[3:0] <= #Tp 4'h0;
  else
    begin
      if(DlyCrcCnt[3:0] == 4'h9)
        DlyCrcCnt[3:0] <= #Tp 4'h0;
      else
      if(DlyCrcEn & StateSFD)
        DlyCrcCnt[3:0] <= #Tp 4'h1;
      else
      if(DlyCrcEn & (|DlyCrcCnt[3:0]))
        DlyCrcCnt[3:0] <= #Tp DlyCrcCnt[3:0] + 1'b1;
    end
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_rxstatem.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_rxstatem.v,v $
// Revision 1.6  2002/11/13 22:28:26  tadejm
// StartIdle state changed (not important the size of the packet).
// StartData1 activates only while ByteCnt is smaller than the MaxFrame.
//
// Revision 1.5  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.4  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.3  2001/10/18 12:07:11  mohor
// Status signals changed, Adress decoding changed, interrupt controller
// added.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.2  2001/07/03 12:55:41  mohor
// Minor changes because of the synthesys warnings.
//
//
// Revision 1.1  2001/06/27 21:26:19  mohor
// Initial release of the RxEthMAC module.
//
//
//
//




module eth_rxstatem (MRxClk, Reset, MRxDV, ByteCntEq0, ByteCntGreat2, Transmitting, MRxDEq5, MRxDEqD, 
                     IFGCounterEq24, ByteCntMaxFrame, StateData, StateIdle, StatePreamble, StateSFD, 
                     StateDrop
                    );

parameter Tp = 1;

input         MRxClk;
input         Reset;
input         MRxDV;
input         ByteCntEq0;
input         ByteCntGreat2;
input         MRxDEq5;
input         Transmitting;
input         MRxDEqD;
input         IFGCounterEq24;
input         ByteCntMaxFrame;

output [1:0]  StateData;
output        StateIdle;
output        StateDrop;
output        StatePreamble;
output        StateSFD;

reg           StateData0;
reg           StateData1;
reg           StateIdle;
reg           StateDrop;
reg           StatePreamble;
reg           StateSFD;

wire          StartIdle;
wire          StartDrop;
wire          StartData0;
wire          StartData1;
wire          StartPreamble;
wire          StartSFD;


// Defining the next state
assign StartIdle = ~MRxDV & (StateDrop | StatePreamble | StateSFD | (|StateData));

assign StartPreamble = MRxDV & ~MRxDEq5 & (StateIdle & ~Transmitting);

assign StartSFD = MRxDV & MRxDEq5 & (StateIdle & ~Transmitting | StatePreamble);

assign StartData0 = MRxDV & (StateSFD & MRxDEqD & IFGCounterEq24 | StateData1);

assign StartData1 = MRxDV & StateData0 & (~ByteCntMaxFrame);

assign StartDrop = MRxDV & (StateIdle & Transmitting | StateSFD & ~IFGCounterEq24 &  MRxDEqD 
                         |  StateData0 &  ByteCntMaxFrame
                           );

// Rx State Machine
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      StateIdle     <= #Tp 1'b0;
      StateDrop     <= #Tp 1'b1;
      StatePreamble <= #Tp 1'b0;
      StateSFD      <= #Tp 1'b0;
      StateData0    <= #Tp 1'b0;
      StateData1    <= #Tp 1'b0;
    end
  else
    begin
      if(StartPreamble | StartSFD | StartDrop)
        StateIdle <= #Tp 1'b0;
      else
      if(StartIdle)
        StateIdle <= #Tp 1'b1;

      if(StartIdle)
        StateDrop <= #Tp 1'b0;
      else
      if(StartDrop)
        StateDrop <= #Tp 1'b1;

      if(StartSFD | StartIdle | StartDrop)
        StatePreamble <= #Tp 1'b0;
      else
      if(StartPreamble)
        StatePreamble <= #Tp 1'b1;

      if(StartPreamble | StartIdle | StartData0 | StartDrop)
        StateSFD <= #Tp 1'b0;
      else
      if(StartSFD)
        StateSFD <= #Tp 1'b1;

      if(StartIdle | StartData1 | StartDrop)
        StateData0 <= #Tp 1'b0;
      else
      if(StartData0)
        StateData0 <= #Tp 1'b1;

      if(StartIdle | StartData0 | StartDrop)
        StateData1 <= #Tp 1'b0;
      else
      if(StartData1)
        StateData1 <= #Tp 1'b1;
    end
end

assign StateData[1:0] = {StateData1, StateData0};

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_rxethmac.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_rxethmac.v,v $
// Revision 1.10  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.9  2002/11/19 17:35:35  mohor
// AddressMiss status is connecting to the Rx BD. AddressMiss is identifying
// that a frame was received because of the promiscous mode.
//
// Revision 1.8  2002/02/16 07:15:27  mohor
// Testbench fixed, code simplified, unused signals removed.
//
// Revision 1.7  2002/02/15 13:44:28  mohor
// RxAbort is an output. No need to have is declared as wire.
//
// Revision 1.6  2002/02/15 11:17:48  mohor
// File format changed.
//
// Revision 1.5  2002/02/14 20:48:43  billditt
// Addition  of new module eth_addrcheck.v
//
// Revision 1.4  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.3  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.1  2001/06/27 21:26:19  mohor
// Initial release of the RxEthMAC module.
//
//
//
//
//



module eth_rxethmac (MRxClk, MRxDV, MRxD, Reset, Transmitting, MaxFL, r_IFG, HugEn, DlyCrcEn, 
                     RxData, RxValid, RxStartFrm, RxEndFrm, ByteCnt, ByteCntEq0, ByteCntGreat2, 
                     ByteCntMaxFrame, CrcError, StateIdle, StatePreamble, StateSFD, StateData,
                     MAC, r_Pro, r_Bro,r_HASH0, r_HASH1, RxAbort, AddressMiss, PassAll, ControlFrmAddressOK
                    );

parameter Tp = 1;



input         MRxClk;
input         MRxDV;
input   [3:0] MRxD;
input         Transmitting;
input         HugEn;
input         DlyCrcEn;
input  [15:0] MaxFL;
input         r_IFG;
input         Reset;
input  [47:0] MAC;     //  Station Address  
input         r_Bro;   //  broadcast disable
input         r_Pro;   //  promiscuous enable 
input [31:0]  r_HASH0; //  lower 4 bytes Hash Table
input [31:0]  r_HASH1; //  upper 4 bytes Hash Table
input         PassAll;
input         ControlFrmAddressOK;

output  [7:0] RxData;
output        RxValid;
output        RxStartFrm;
output        RxEndFrm;
output [15:0] ByteCnt;
output        ByteCntEq0;
output        ByteCntGreat2;
output        ByteCntMaxFrame;
output        CrcError;
output        StateIdle;
output        StatePreamble;
output        StateSFD;
output  [1:0] StateData;
output        RxAbort;
output        AddressMiss;

reg     [7:0] RxData;
reg           RxValid;
reg           RxStartFrm;
reg           RxEndFrm;
reg           Broadcast;
reg           Multicast;
reg     [8:0] CrcHash;
reg           CrcHashGood;
reg           DelayData;
reg     [3:0] LatchedNibble;
reg     [7:0] LatchedByte;
reg     [7:0] RxData_d;
reg           RxValid_d;
reg           RxStartFrm_d;
reg           RxEndFrm_d;

wire          MRxDEqD;
wire          MRxDEq5;
wire          StateDrop;
wire          ByteCntEq1;
wire          ByteCntEq2;
wire          ByteCntEq3;
wire          ByteCntEq4;
wire          ByteCntEq5;
wire          ByteCntEq6;
wire          ByteCntEq7;
wire          ByteCntSmall7;
wire   [31:0] Crc;
wire          Enable_Crc;
wire          Initialize_Crc;
wire    [3:0] Data_Crc;
wire          GenerateRxValid;
wire          GenerateRxStartFrm;
wire          GenerateRxEndFrm;
wire          DribbleRxEndFrm;
wire    [3:0] DlyCrcCnt;


assign MRxDEqD = MRxD == 4'hd;
assign MRxDEq5 = MRxD == 4'h5;


// Rx State Machine module
eth_rxstatem rxstatem1 (.MRxClk(MRxClk), .Reset(Reset), .MRxDV(MRxDV), .ByteCntEq0(ByteCntEq0), 
                        .ByteCntGreat2(ByteCntGreat2), .Transmitting(Transmitting), .MRxDEq5(MRxDEq5), 
                        .MRxDEqD(MRxDEqD), .IFGCounterEq24(IFGCounterEq24), .ByteCntMaxFrame(ByteCntMaxFrame), 
                        .StateData(StateData), .StateIdle(StateIdle), .StatePreamble(StatePreamble), 
                        .StateSFD(StateSFD), .StateDrop(StateDrop)
                       );


// Rx Counters module
eth_rxcounters rxcounters1 (.MRxClk(MRxClk), .Reset(Reset), .MRxDV(MRxDV), .StateIdle(StateIdle), 
                            .StateSFD(StateSFD), .StateData(StateData), .StateDrop(StateDrop), 
                            .StatePreamble(StatePreamble), .MRxDEqD(MRxDEqD), .DlyCrcEn(DlyCrcEn), 
                            .DlyCrcCnt(DlyCrcCnt), .Transmitting(Transmitting), .MaxFL(MaxFL), .r_IFG(r_IFG), 
                            .HugEn(HugEn), .IFGCounterEq24(IFGCounterEq24), .ByteCntEq0(ByteCntEq0), 
                            .ByteCntEq1(ByteCntEq1), .ByteCntEq2(ByteCntEq2), .ByteCntEq3(ByteCntEq3), 
                            .ByteCntEq4(ByteCntEq4), .ByteCntEq5(ByteCntEq5), .ByteCntEq6(ByteCntEq6), 
                            .ByteCntEq7(ByteCntEq7), .ByteCntGreat2(ByteCntGreat2), 
                            .ByteCntSmall7(ByteCntSmall7), .ByteCntMaxFrame(ByteCntMaxFrame), 
                            .ByteCnt(ByteCnt)
                           );

// Rx Address Check

eth_rxaddrcheck rxaddrcheck1
              (.MRxClk(MRxClk),         .Reset( Reset),             .RxData(RxData), 
               .Broadcast (Broadcast),  .r_Bro (r_Bro),             .r_Pro(r_Pro),
               .ByteCntEq6(ByteCntEq6), .ByteCntEq7(ByteCntEq7),    .ByteCntEq2(ByteCntEq2), 
               .ByteCntEq3(ByteCntEq3), .ByteCntEq4(ByteCntEq4),    .ByteCntEq5(ByteCntEq5), 
               .HASH0(r_HASH0),         .HASH1(r_HASH1),           
               .CrcHash(CrcHash[5:0]),  .CrcHashGood(CrcHashGood),  .StateData(StateData),
               .Multicast(Multicast),   .MAC(MAC),                  .RxAbort(RxAbort),
               .RxEndFrm(RxEndFrm),     .AddressMiss(AddressMiss),  .PassAll(PassAll),
               .ControlFrmAddressOK(ControlFrmAddressOK)
              );


assign Enable_Crc = MRxDV & (|StateData & ~ByteCntMaxFrame);
assign Initialize_Crc = StateSFD | DlyCrcEn & (|DlyCrcCnt[3:0]) & DlyCrcCnt[3:0] < 4'h9;

assign Data_Crc[0] = MRxD[3];
assign Data_Crc[1] = MRxD[2];
assign Data_Crc[2] = MRxD[1];
assign Data_Crc[3] = MRxD[0];


// Connecting module Crc
eth_crc crcrx (.Clk(MRxClk), .Reset(Reset), .Data(Data_Crc), .Enable(Enable_Crc), .Initialize(Initialize_Crc), 
               .Crc(Crc), .CrcError(CrcError)
              );



// Latching CRC for use in the hash table

always @ (posedge MRxClk)
begin
  CrcHashGood <= #Tp StateData[0] & ByteCntEq6;
end

always @ (posedge MRxClk)
begin
  if(Reset | StateIdle)
    CrcHash[8:0] <= #Tp 9'h0;
  else
  if(StateData[0] & ByteCntEq6)
    CrcHash[8:0] <= #Tp Crc[31:23];
end


// Output byte stream
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxData_d[7:0]      <= #Tp 8'h0;
      DelayData          <= #Tp 1'b0;
      LatchedNibble[3:0] <= #Tp 4'h0;
      LatchedByte[7:0]   <= #Tp 8'h0;
      RxData[7:0]        <= #Tp 8'h0;
    end
  else
    begin
      LatchedNibble[3:0] <= #Tp MRxD[3:0];                        // Latched nibble
      LatchedByte[7:0]   <= #Tp {MRxD[3:0], LatchedNibble[3:0]};  // Latched byte
      DelayData          <= #Tp StateData[0];

      if(GenerateRxValid)
        RxData_d[7:0] <= #Tp LatchedByte[7:0] & {8{|StateData}};  // Data goes through only in data state 
      else
      if(~DelayData)
        RxData_d[7:0] <= #Tp 8'h0;                                // Delaying data to be valid for two cycles. Zero when not active.

      RxData[7:0] <= #Tp RxData_d[7:0];                           // Output data byte
    end
end

    

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Broadcast <= #Tp 1'b0;
  else
    begin      
      if(StateData[0] & ~(&LatchedByte[7:0]) & ByteCntSmall7)
        Broadcast <= #Tp 1'b0;
      else
      if(StateData[0] & (&LatchedByte[7:0]) & ByteCntEq1)
        Broadcast <= #Tp 1'b1;
      else
      if(RxAbort | RxEndFrm)
        Broadcast <= #Tp 1'b0;
    end
end


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Multicast <= #Tp 1'b0;
  else
    begin      
      if(Reset)
        Multicast <= #Tp 1'b0;
      else
      if(StateData[0] & ByteCntEq1 & LatchedByte == 8'h01)
        Multicast <= #Tp 1'b1;
    else if(RxAbort | RxEndFrm)
      Multicast <= #Tp 1'b0;
    end
end


assign GenerateRxValid = StateData[0] & (~ByteCntEq0 | DlyCrcCnt >= 4'h3);

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxValid_d <= #Tp 1'b0;
      RxValid   <= #Tp 1'b0;
    end
  else
    begin
      RxValid_d <= #Tp GenerateRxValid;
      RxValid   <= #Tp RxValid_d;
    end
end


assign GenerateRxStartFrm = StateData[0] & (ByteCntEq1 & ~DlyCrcEn | DlyCrcCnt == 4'h3 & DlyCrcEn);

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxStartFrm_d <= #Tp 1'b0;
      RxStartFrm   <= #Tp 1'b0;
    end
  else
    begin
      RxStartFrm_d <= #Tp GenerateRxStartFrm;
      RxStartFrm   <= #Tp RxStartFrm_d;
    end
end


assign GenerateRxEndFrm = StateData[0] & (~MRxDV & ByteCntGreat2 | ByteCntMaxFrame);
assign DribbleRxEndFrm  = StateData[1] &  ~MRxDV & ByteCntGreat2;


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxEndFrm_d <= #Tp 1'b0;
      RxEndFrm   <= #Tp 1'b0;
    end
  else
    begin
      RxEndFrm_d <= #Tp GenerateRxEndFrm;
      RxEndFrm   <= #Tp RxEndFrm_d | DribbleRxEndFrm;
    end
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_shiftreg.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_shiftreg.v,v $
// Revision 1.5  2002/08/14 18:16:59  mohor
// LinkFail signal was not latching appropriate bit.
//
// Revision 1.4  2002/03/02 21:06:01  mohor
// LinkFail signal was not latching appropriate bit.
//
// Revision 1.3  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.2  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/01 22:28:56  mohor
// This files (MIIM) are fully working. They were thoroughly tested. The testbench is not updated.
//
//



module eth_shiftreg(Clk, Reset, MdcEn_n, Mdi, Fiad, Rgad, CtrlData, WriteOp, ByteSelect, 
                    LatchByte, ShiftedBit, Prsd, LinkFail);


parameter Tp=1;

input       Clk;              // Input clock (Host clock)
input       Reset;            // Reset signal
input       MdcEn_n;          // Enable signal is asserted for one Clk period before Mdc falls.
input       Mdi;              // MII input data
input [4:0] Fiad;             // PHY address
input [4:0] Rgad;             // Register address (within the selected PHY)
input [15:0]CtrlData;         // Control data (data to be written to the PHY)
input       WriteOp;          // The current operation is a PHY register write operation
input [3:0] ByteSelect;       // Byte select
input [1:0] LatchByte;        // Byte select for latching (read operation)

output      ShiftedBit;       // Bit shifted out of the shift register
output[15:0]Prsd;             // Read Status Data (data read from the PHY)
output      LinkFail;         // Link Integrity Signal

reg   [7:0] ShiftReg;         // Shift register for shifting the data in and out
reg   [15:0]Prsd;
reg         LinkFail;




// ShiftReg[7:0] :: Shift Register Data
always @ (posedge Clk or posedge Reset) 
begin
  if(Reset)
    begin
      ShiftReg[7:0] <= #Tp 8'h0;
      Prsd[15:0] <= #Tp 16'h0;
      LinkFail <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn_n)
        begin 
          if(|ByteSelect)
            begin
              case (ByteSelect[3:0])
                4'h1 :    ShiftReg[7:0] <= #Tp {2'b01, ~WriteOp, WriteOp, Fiad[4:1]};
                4'h2 :    ShiftReg[7:0] <= #Tp {Fiad[0], Rgad[4:0], 2'b10};
                4'h4 :    ShiftReg[7:0] <= #Tp CtrlData[15:8];
                4'h8 :    ShiftReg[7:0] <= #Tp CtrlData[7:0];
                default : ShiftReg[7:0] <= #Tp 8'h0;
              endcase
            end 
          else
            begin
              ShiftReg[7:0] <= #Tp {ShiftReg[6:0], Mdi};
              if(LatchByte[0])
                begin
                  Prsd[7:0] <= #Tp {ShiftReg[6:0], Mdi};
                  if(Rgad == 5'h01)
                    LinkFail <= #Tp ~ShiftReg[1];  // this is bit [2], because it is not shifted yet
                end
              else
                begin
                  if(LatchByte[1])
                    Prsd[15:8] <= #Tp {ShiftReg[6:0], Mdi};
                end
            end
        end
    end
end


assign ShiftedBit = ShiftReg[7];


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_spram_256x32.v                                          ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is available in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_spram_256x32.v,v $
// Revision 1.4  2002/10/18 17:04:20  tadejm
// Changed BIST scan signals.
//
// Revision 1.3  2002/10/10 16:29:30  mohor
// BIST added.
//
// Revision 1.2  2002/09/23 18:24:31  mohor
// ETH_VIRTUAL_SILICON_RAM supported (for ASIC implementation).
//
// Revision 1.1  2002/07/23 16:36:09  mohor
// ethernet spram added. So far a generic ram and xilinx RAMB4 are used.
//
//
//


module eth_spram_256x32(
	// Generic synchronous single-port RAM interface
	clk, rst, ce, we, oe, addr, di, do

`ifdef ETH_BIST
  ,
  // debug chain signals
  scanb_rst,      // bist scan reset
  scanb_clk,      // bist scan clock
  scanb_si,       // bist scan serial in
  scanb_so,       // bist scan serial out
  scanb_en        // bist scan shift enable
`endif



);

	//
	// Generic synchronous single-port RAM interface
	//
	input           clk;  // Clock, rising edge
	input           rst;  // Reset, active high
	input           ce;   // Chip enable input, active high
	input           we;   // Write enable input, active high
	input           oe;   // Output enable input, active high
	input  [7:0]    addr; // address bus inputs
	input  [31:0]   di;   // input data bus
	output [31:0]   do;   // output data bus


`ifdef ETH_BIST
  input   scanb_rst;      // bist scan reset
  input   scanb_clk;      // bist scan clock
  input   scanb_si;       // bist scan serial in
  output  scanb_so;       // bist scan serial out
  input   scanb_en;       // bist scan shift enable
`endif

`ifdef ETH_XILINX_RAMB4

    RAMB4_S16 ram0
    (
        .DO      (do[15:0]),
        .ADDR    (addr),
        .DI      (di[15:0]),
        .EN      (ce),
        .CLK     (clk),
        .WE      (we),
        .RST     (rst)
    );

    RAMB4_S16 ram1
    (
        .DO      (do[31:16]),
        .ADDR    (addr),
        .DI      (di[31:16]),
        .EN      (ce),
        .CLK     (clk),
        .WE      (we),
        .RST     (rst)
    );

`else   // !ETH_XILINX_RAMB4
`ifdef  ETH_VIRTUAL_SILICON_RAM
  `ifdef ETH_BIST
      vs_hdsp_256x32_bist ram0_bist
  `else
      vs_hdsp_256x32 ram0
  `endif
      (
        .CK         (clk),
        .CEN        (!ce),
        .WEN        (!we),
        .OEN        (!oe),
        .ADR        (addr),
        .DI         (di),
        .DOUT       (do)

      `ifdef ETH_BIST
        ,
        // debug chain signals
        .scanb_rst      (scanb_rst),
        .scanb_clk      (scanb_clk),
        .scanb_si       (scanb_si),
        .scanb_so       (scanb_so),
        .scanb_en       (scanb_en)
      `endif
      );

`else   // !ETH_VIRTUAL_SILICON_RAM

	//
	// Generic single-port synchronous RAM model
	//

	//
	// Generic RAM's registers and wires
	//
	reg  [31:0] mem [255:0];	// RAM content
	wire [31:0] q;          // RAM output
	reg  [7:0]  raddr;      // RAM read address
	//
	// Data output drivers
	//
	assign do = (oe & ce) ? q : {32{1'bz}};

	//
	// RAM read and write
	//

	// read operation
	always@(posedge clk)
	if (ce) // && !we)
		raddr <= #1 addr;    // read address needs to be registered to read clock

	assign #1 q = rst ? {32{1'b0}} : mem[raddr];

	// write operation
	always@(posedge clk)
		if (ce && we)
			mem[addr] <= #1 di;

	// Task prints range of memory
	// *** Remember that tasks are non reentrant, don't call this task in parallel for multiple instantiations. 
	task print_ram;
	input [7:0] start;
	input [7:0] finish;
	integer rnum;
  	begin
    		for (rnum=start;rnum<=finish;rnum=rnum+1)
      			$display("Addr %h = %h",rnum,mem[rnum]);
  	end
	endtask

`endif  // !ETH_VIRTUAL_SILICON_RAM
`endif  // !ETH_XILINX_RAMB4

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_txcounters.v                                            ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_txcounters.v,v $
// Revision 1.5  2002/04/22 14:54:14  mohor
// FCS should not be included in NibbleMinFl.
//
// Revision 1.4  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.3  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.4  2001/06/27 21:27:45  mohor
// Few typos fixed.
//
// Revision 1.2  2001/06/19 10:38:07  mohor
// Minor changes in header.
//
// Revision 1.1  2001/06/19 10:27:57  mohor
// TxEthMAC initial release.
//
//
//




module eth_txcounters (StatePreamble, StateIPG, StateData, StatePAD, StateFCS, StateJam, 
                       StateBackOff, StateDefer, StateIdle, StartDefer, StartIPG, StartFCS, 
                       StartJam, StartBackoff, TxStartFrm, MTxClk, Reset, MinFL, MaxFL, HugEn, 
                       ExDfrEn, PacketFinished_q, DlyCrcEn, StateSFD, ByteCnt, NibCnt, 
                       ExcessiveDefer, NibCntEq7, NibCntEq15, MaxFrame, NibbleMinFl, DlyCrcCnt
                      );

parameter Tp = 1;

input MTxClk;             // Tx clock
input Reset;              // Reset
input StatePreamble;      // Preamble state
input StateIPG;           // IPG state
input [1:0] StateData;    // Data state
input StatePAD;           // PAD state
input StateFCS;           // FCS state
input StateJam;           // Jam state
input StateBackOff;       // Backoff state
input StateDefer;         // Defer state
input StateIdle;          // Idle state
input StateSFD;           // SFD state
input StartDefer;         // Defer state will be activated in next clock
input StartIPG;           // IPG state will be activated in next clock
input StartFCS;           // FCS state will be activated in next clock
input StartJam;           // Jam state will be activated in next clock
input StartBackoff;       // Backoff state will be activated in next clock
input TxStartFrm;         // Tx start frame
input [15:0] MinFL;       // Minimum frame length (in bytes)
input [15:0] MaxFL;       // Miximum frame length (in bytes)
input HugEn;              // Pakets bigger then MaxFL enabled
input ExDfrEn;            // Excessive deferral enabled
input PacketFinished_q;             
input DlyCrcEn;           // Delayed CRC enabled

output [15:0] ByteCnt;    // Byte counter
output [15:0] NibCnt;     // Nibble counter
output ExcessiveDefer;    // Excessive Deferral occuring
output NibCntEq7;         // Nibble counter is equal to 7
output NibCntEq15;        // Nibble counter is equal to 15
output MaxFrame;          // Maximum frame occured
output NibbleMinFl;       // Nibble counter is greater than the minimum frame length
output [2:0] DlyCrcCnt;   // Delayed CRC Count

wire ExcessiveDeferCnt;
wire ResetNibCnt;
wire IncrementNibCnt;
wire ResetByteCnt;
wire IncrementByteCnt;
wire ByteCntMax;

reg [15:0] NibCnt;
reg [15:0] ByteCnt;
reg  [2:0] DlyCrcCnt;



assign IncrementNibCnt = StateIPG | StatePreamble | (|StateData) & ~|DlyCrcCnt[2:0] | StatePAD 
                       | StateFCS | StateJam | StateBackOff | StateDefer & ~ExcessiveDefer & TxStartFrm;


assign ResetNibCnt = StateDefer & ExcessiveDefer & ~TxStartFrm | StatePreamble & NibCntEq15 
                   | StateJam & NibCntEq7 | StateIdle | StartDefer | StartIPG | StartFCS | StartJam;

// Nibble Counter
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    NibCnt <= #Tp 16'h0;
  else
    begin
      if(ResetNibCnt)
        NibCnt <= #Tp 16'h0;
      else
      if(IncrementNibCnt)
        NibCnt <= #Tp NibCnt + 1'b1;
     end
end


assign NibCntEq7   = &NibCnt[2:0];
assign NibCntEq15  = &NibCnt[3:0];

assign NibbleMinFl = NibCnt >= (((MinFL-3'h4)<<1) -1);  // FCS should not be included in NibbleMinFl

assign ExcessiveDeferCnt = NibCnt[13:0] == 16'h17b7;

assign ExcessiveDefer  = NibCnt[13:0] == 16'h17b7 & ~ExDfrEn;   // 6071 nibbles

assign IncrementByteCnt = StateData[1] & ~ByteCntMax & ~|DlyCrcCnt[2:0] 
                        | StateBackOff & (&NibCnt[6:0])
                        | (StatePAD | StateFCS) & NibCnt[0] & ~ByteCntMax;

assign ResetByteCnt = StartBackoff | StateIdle & TxStartFrm | PacketFinished_q;


// Transmit Byte Counter
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ByteCnt[15:0] <= #Tp 16'h0;
  else
    begin
      if(ResetByteCnt)
        ByteCnt[15:0] <= #Tp 16'h0;
      else
      if(IncrementByteCnt)
        ByteCnt[15:0] <= #Tp ByteCnt[15:0] + 1'b1;
    end
end


assign MaxFrame = ByteCnt[15:0] == MaxFL[15:0] & ~HugEn;

assign ByteCntMax = &ByteCnt[15:0];


// Delayed CRC counter
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    DlyCrcCnt <= #Tp 3'h0;
  else
    begin        
      if(StateData[1] & DlyCrcCnt == 3'h4 | StartJam | PacketFinished_q)
        DlyCrcCnt <= #Tp 3'h0;
      else
      if(DlyCrcEn & (StateSFD | StateData[1] & (|DlyCrcCnt[2:0])))
        DlyCrcCnt <= #Tp DlyCrcCnt + 1'b1;
    end
end



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_txethmac.v                                              ////
///                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_txethmac.v,v $
// Revision 1.8  2003/01/30 13:33:24  mohor
// When padding was enabled and crc disabled, frame was not ended correctly.
//
// Revision 1.7  2002/02/26 16:24:01  mohor
// RetryCntLatched was unused and removed from design
//
// Revision 1.6  2002/02/22 12:56:35  mohor
// Retry is not activated when a Tx Underrun occured
//
// Revision 1.5  2002/02/11 09:18:22  mohor
// Tx status is written back to the BD.
//
// Revision 1.4  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.3  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/19 18:16:40  mohor
// TxClk changed to MTxClk (as discribed in the documentation).
// Crc changed so only one file can be used instead of two.
//
// Revision 1.2  2001/06/19 10:38:08  mohor
// Minor changes in header.
//
// Revision 1.1  2001/06/19 10:27:58  mohor
// TxEthMAC initial release.
//
//
//



module eth_txethmac (MTxClk, Reset, TxStartFrm, TxEndFrm, TxUnderRun, TxData, CarrierSense, 
                     Collision, Pad, CrcEn, FullD, HugEn, DlyCrcEn, MinFL, MaxFL, IPGT, 
                     IPGR1, IPGR2, CollValid, MaxRet, NoBckof, ExDfrEn, 
                     MTxD, MTxEn, MTxErr, TxDone, TxRetry, TxAbort, TxUsedData, WillTransmit, 
                     ResetCollision, RetryCnt, StartTxDone, StartTxAbort, MaxCollisionOccured,
                     LateCollision, DeferIndication, StatePreamble, StateData

                    );

parameter Tp = 1;


input MTxClk;                   // Transmit clock (from PHY)
input Reset;                    // Reset
input TxStartFrm;               // Transmit packet start frame
input TxEndFrm;                 // Transmit packet end frame
input TxUnderRun;               // Transmit packet under-run
input [7:0] TxData;             // Transmit packet data byte
input CarrierSense;             // Carrier sense (synchronized)
input Collision;                // Collision (synchronized)
input Pad;                      // Pad enable (from register)
input CrcEn;                    // Crc enable (from register)
input FullD;                    // Full duplex (from register)
input HugEn;                    // Huge packets enable (from register)
input DlyCrcEn;                 // Delayed Crc enabled (from register)
input [15:0] MinFL;             // Minimum frame length (from register)
input [15:0] MaxFL;             // Maximum frame length (from register)
input [6:0] IPGT;               // Back to back transmit inter packet gap parameter (from register)
input [6:0] IPGR1;              // Non back to back transmit inter packet gap parameter IPGR1 (from register)
input [6:0] IPGR2;              // Non back to back transmit inter packet gap parameter IPGR2 (from register)
input [5:0] CollValid;          // Valid collision window (from register)
input [3:0] MaxRet;             // Maximum retry number (from register)
input NoBckof;                  // No backoff (from register)
input ExDfrEn;                  // Excessive defferal enable (from register)

output [3:0] MTxD;              // Transmit nibble (to PHY)
output MTxEn;                   // Transmit enable (to PHY)
output MTxErr;                  // Transmit error (to PHY)
output TxDone;                  // Transmit packet done (to RISC)
output TxRetry;                 // Transmit packet retry (to RISC)
output TxAbort;                 // Transmit packet abort (to RISC)
output TxUsedData;              // Transmit packet used data (to RISC)
output WillTransmit;            // Will transmit (to RxEthMAC)
output ResetCollision;          // Reset Collision (for synchronizing collision)
output [3:0] RetryCnt;          // Latched Retry Counter for tx status purposes
output StartTxDone;
output StartTxAbort;
output MaxCollisionOccured;
output LateCollision;
output DeferIndication;
output StatePreamble;
output [1:0] StateData;

reg [3:0] MTxD;
reg MTxEn;
reg MTxErr;
reg TxDone;
reg TxRetry;
reg TxAbort;
reg TxUsedData;
reg WillTransmit;
reg ColWindow;
reg StopExcessiveDeferOccured;
reg [3:0] RetryCnt;
reg [3:0] MTxD_d;
reg StatusLatch;
reg PacketFinished_q;
reg PacketFinished;


wire ExcessiveDeferOccured;
wire StartIPG;
wire StartPreamble;
wire [1:0] StartData;
wire StartFCS;
wire StartJam;
wire StartDefer;
wire StartBackoff;
wire StateDefer;
wire StateIPG;
wire StateIdle;
wire StatePAD;
wire StateFCS;
wire StateJam;
wire StateBackOff;
wire StateSFD;
wire StartTxRetry;
wire UnderRun;
wire TooBig;
wire [31:0] Crc;
wire CrcError;
wire [2:0] DlyCrcCnt;
wire [15:0] NibCnt;
wire NibCntEq7;
wire NibCntEq15;
wire NibbleMinFl;
wire ExcessiveDefer;
wire [15:0] ByteCnt;
wire MaxFrame;
wire RetryMax;
wire RandomEq0;
wire RandomEqByteCnt;
wire PacketFinished_d;


assign ResetCollision = ~(StatePreamble | (|StateData) | StatePAD | StateFCS);

assign ExcessiveDeferOccured = TxStartFrm & StateDefer & ExcessiveDefer & ~StopExcessiveDeferOccured;

assign StartTxDone = ~Collision & (StateFCS & NibCntEq7 | StateData[1] & TxEndFrm & (~Pad | Pad & NibbleMinFl) & ~CrcEn);

assign UnderRun = StateData[0] & TxUnderRun & ~Collision;

assign TooBig = ~Collision & MaxFrame & (StateData[0] & ~TxUnderRun | StateFCS);

// assign StartTxRetry = StartJam & (ColWindow & ~RetryMax);
assign StartTxRetry = StartJam & (ColWindow & ~RetryMax) & ~UnderRun;

assign LateCollision = StartJam & ~ColWindow & ~UnderRun;

assign MaxCollisionOccured = StartJam & ColWindow & RetryMax;

assign StateSFD = StatePreamble & NibCntEq15;

assign StartTxAbort = TooBig | UnderRun | ExcessiveDeferOccured | LateCollision | MaxCollisionOccured;


// StopExcessiveDeferOccured
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    StopExcessiveDeferOccured <= #Tp 1'b0;
  else
    begin
      if(~TxStartFrm)
        StopExcessiveDeferOccured <= #Tp 1'b0;
      else
      if(ExcessiveDeferOccured)
        StopExcessiveDeferOccured <= #Tp 1'b1;
    end
end


// Collision Window
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ColWindow <= #Tp 1'b1;
  else
    begin  
      if(~Collision & ByteCnt[5:0] == CollValid[5:0] & (StateData[1] | StatePAD & NibCnt[0] | StateFCS & NibCnt[0]))
        ColWindow <= #Tp 1'b0;
      else
      if(StateIdle | StateIPG)
        ColWindow <= #Tp 1'b1;
    end
end


// Start Window
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    StatusLatch <= #Tp 1'b0;
  else
    begin
      if(~TxStartFrm)
        StatusLatch <= #Tp 1'b0;
      else
      if(ExcessiveDeferOccured | StateIdle)
        StatusLatch <= #Tp 1'b1;
     end
end


// Transmit packet used data
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxUsedData <= #Tp 1'b0;
  else
    TxUsedData <= #Tp |StartData;
end


// Transmit packet done
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxDone <= #Tp 1'b0;
  else
    begin
      if(TxStartFrm & ~StatusLatch)
        TxDone <= #Tp 1'b0;
      else
      if(StartTxDone)
        TxDone <= #Tp 1'b1;
    end
end


// Transmit packet retry
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxRetry <= #Tp 1'b0;
  else
    begin
      if(TxStartFrm & ~StatusLatch)
        TxRetry <= #Tp 1'b0;
      else
      if(StartTxRetry)
        TxRetry <= #Tp 1'b1;
     end
end                                    


// Transmit packet abort
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxAbort <= #Tp 1'b0;
  else
    begin
      if(TxStartFrm & ~StatusLatch & ~ExcessiveDeferOccured)
        TxAbort <= #Tp 1'b0;
      else
      if(StartTxAbort)
        TxAbort <= #Tp 1'b1;
    end
end


// Retry counter
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RetryCnt[3:0] <= #Tp 4'h0;
  else
    begin
      if(ExcessiveDeferOccured | UnderRun | TooBig | StartTxDone | TxUnderRun 
          | StateJam & NibCntEq7 & (~ColWindow | RetryMax))
        RetryCnt[3:0] <= #Tp 4'h0;
      else
      if(StateJam & NibCntEq7 & ColWindow & (RandomEq0 | NoBckof) | StateBackOff & RandomEqByteCnt)
        RetryCnt[3:0] <= #Tp RetryCnt[3:0] + 1'b1;
    end
end


assign RetryMax = RetryCnt[3:0] == MaxRet[3:0];


// Transmit nibble
always @ (StatePreamble or StateData or StateData or StateFCS or StateJam or StateSFD or TxData or 
          Crc or NibCnt or NibCntEq15)
begin
  if(StateData[0])
    MTxD_d[3:0] = TxData[3:0];                                  // Lower nibble
  else
  if(StateData[1])
    MTxD_d[3:0] = TxData[7:4];                                  // Higher nibble
  else
  if(StateFCS)
    MTxD_d[3:0] = {~Crc[28], ~Crc[29], ~Crc[30], ~Crc[31]};     // Crc
  else
  if(StateJam)
    MTxD_d[3:0] = 4'h9;                                         // Jam pattern
  else
  if(StatePreamble)
    if(NibCntEq15)
      MTxD_d[3:0] = 4'hd;                                       // SFD
    else
      MTxD_d[3:0] = 4'h5;                                       // Preamble
  else
    MTxD_d[3:0] = 4'h0;
end


// Transmit Enable
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    MTxEn <= #Tp 1'b0;
  else
    MTxEn <= #Tp StatePreamble | (|StateData) | StatePAD | StateFCS | StateJam;
end


// Transmit nibble
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    MTxD[3:0] <= #Tp 4'h0;
  else
    MTxD[3:0] <= #Tp MTxD_d[3:0];
end


// Transmit error
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    MTxErr <= #Tp 1'b0;
  else
    MTxErr <= #Tp TooBig | UnderRun;
end


// WillTransmit
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    WillTransmit <= #Tp  1'b0;
  else
    WillTransmit <= #Tp StartPreamble | StatePreamble | (|StateData) | StatePAD | StateFCS | StateJam;
end


assign PacketFinished_d = StartTxDone | TooBig | UnderRun | LateCollision | MaxCollisionOccured | ExcessiveDeferOccured;


// Packet finished
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    begin
      PacketFinished <= #Tp 1'b0;
      PacketFinished_q  <= #Tp 1'b0;
    end
  else
    begin
      PacketFinished <= #Tp PacketFinished_d;
      PacketFinished_q  <= #Tp PacketFinished;
    end
end


// Connecting module Counters
eth_txcounters txcounters1 (.StatePreamble(StatePreamble), .StateIPG(StateIPG), .StateData(StateData), 
                            .StatePAD(StatePAD), .StateFCS(StateFCS), .StateJam(StateJam), .StateBackOff(StateBackOff), 
                            .StateDefer(StateDefer), .StateIdle(StateIdle), .StartDefer(StartDefer), .StartIPG(StartIPG), 
                            .StartFCS(StartFCS), .StartJam(StartJam), .TxStartFrm(TxStartFrm), .MTxClk(MTxClk), 
                            .Reset(Reset), .MinFL(MinFL), .MaxFL(MaxFL), .HugEn(HugEn), .ExDfrEn(ExDfrEn), 
                            .PacketFinished_q(PacketFinished_q), .DlyCrcEn(DlyCrcEn), .StartBackoff(StartBackoff), 
                            .StateSFD(StateSFD), .ByteCnt(ByteCnt), .NibCnt(NibCnt), .ExcessiveDefer(ExcessiveDefer), 
                            .NibCntEq7(NibCntEq7), .NibCntEq15(NibCntEq15), .MaxFrame(MaxFrame), .NibbleMinFl(NibbleMinFl), 
                            .DlyCrcCnt(DlyCrcCnt)
                           );


// Connecting module StateM
eth_txstatem txstatem1 (.MTxClk(MTxClk), .Reset(Reset), .ExcessiveDefer(ExcessiveDefer), .CarrierSense(CarrierSense), 
                        .NibCnt(NibCnt[6:0]), .IPGT(IPGT), .IPGR1(IPGR1), .IPGR2(IPGR2), .FullD(FullD), 
                        .TxStartFrm(TxStartFrm), .TxEndFrm(TxEndFrm), .TxUnderRun(TxUnderRun), .Collision(Collision), 
                        .UnderRun(UnderRun), .StartTxDone(StartTxDone), .TooBig(TooBig), .NibCntEq7(NibCntEq7), 
                        .NibCntEq15(NibCntEq15), .MaxFrame(MaxFrame), .Pad(Pad), .CrcEn(CrcEn), 
                        .NibbleMinFl(NibbleMinFl), .RandomEq0(RandomEq0), .ColWindow(ColWindow), .RetryMax(RetryMax), 
                        .NoBckof(NoBckof), .RandomEqByteCnt(RandomEqByteCnt), .StateIdle(StateIdle), 
                        .StateIPG(StateIPG), .StatePreamble(StatePreamble), .StateData(StateData), .StatePAD(StatePAD), 
                        .StateFCS(StateFCS), .StateJam(StateJam), .StateJam_q(StateJam_q), .StateBackOff(StateBackOff), 
                        .StateDefer(StateDefer), .StartFCS(StartFCS), .StartJam(StartJam), .StartBackoff(StartBackoff), 
                        .StartDefer(StartDefer), .DeferIndication(DeferIndication), .StartPreamble(StartPreamble), .StartData(StartData), .StartIPG(StartIPG)
                       );


wire Enable_Crc;
wire [3:0] Data_Crc;
wire Initialize_Crc;

assign Enable_Crc = ~StateFCS;

assign Data_Crc[0] = StateData[0]? TxData[3] : StateData[1]? TxData[7] : 1'b0;
assign Data_Crc[1] = StateData[0]? TxData[2] : StateData[1]? TxData[6] : 1'b0;
assign Data_Crc[2] = StateData[0]? TxData[1] : StateData[1]? TxData[5] : 1'b0;
assign Data_Crc[3] = StateData[0]? TxData[0] : StateData[1]? TxData[4] : 1'b0;

assign Initialize_Crc = StateIdle | StatePreamble | (|DlyCrcCnt);


// Connecting module Crc
eth_crc txcrc (.Clk(MTxClk), .Reset(Reset), .Data(Data_Crc), .Enable(Enable_Crc), .Initialize(Initialize_Crc), 
               .Crc(Crc), .CrcError(CrcError)
              );


// Connecting module Random
eth_random random1 (.MTxClk(MTxClk), .Reset(Reset), .StateJam(StateJam), .StateJam_q(StateJam_q), .RetryCnt(RetryCnt), 
                    .NibCnt(NibCnt), .ByteCnt(ByteCnt[9:0]), .RandomEq0(RandomEq0), .RandomEqByteCnt(RandomEqByteCnt));




endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_txstatem.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Novan Hartadi (novan@vlsi.itb.ac.id)                  ////
////      - Mahmud Galela (mgalela@vlsi.itb.ac.id)                ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_txstatem.v,v $
// Revision 1.6  2003/01/30 13:29:08  tadejm
// Defer indication changed.
//
// Revision 1.5  2002/10/30 12:54:50  mohor
// State machine goes from idle to the defer state when CarrierSense is 1. FCS (CRC appending) fixed to check the CrcEn bit also when padding is necessery.
//
// Revision 1.4  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.3  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.3  2001/06/19 18:16:40  mohor
// TxClk changed to MTxClk (as discribed in the documentation).
// Crc changed so only one file can be used instead of two.
//
// Revision 1.2  2001/06/19 10:38:07  mohor
// Minor changes in header.
//
// Revision 1.1  2001/06/19 10:27:57  mohor
// TxEthMAC initial release.
//
//
//
//




module eth_txstatem  (MTxClk, Reset, ExcessiveDefer, CarrierSense, NibCnt, IPGT, IPGR1, 
                      IPGR2, FullD, TxStartFrm, TxEndFrm, TxUnderRun, Collision, UnderRun, 
                      StartTxDone, TooBig, NibCntEq7, NibCntEq15, MaxFrame, Pad, CrcEn, 
                      NibbleMinFl, RandomEq0, ColWindow, RetryMax, NoBckof, RandomEqByteCnt,
                      StateIdle, StateIPG, StatePreamble, StateData, StatePAD, StateFCS, 
                      StateJam, StateJam_q, StateBackOff, StateDefer, StartFCS, StartJam, 
                      StartBackoff, StartDefer, DeferIndication, StartPreamble, StartData, StartIPG
                     );

parameter Tp = 1;

input MTxClk;
input Reset;
input ExcessiveDefer;
input CarrierSense;
input [6:0] NibCnt;
input [6:0] IPGT;
input [6:0] IPGR1;
input [6:0] IPGR2;
input FullD;
input TxStartFrm;
input TxEndFrm;
input TxUnderRun;
input Collision;
input UnderRun;
input StartTxDone; 
input TooBig;
input NibCntEq7;
input NibCntEq15;
input MaxFrame;
input Pad;
input CrcEn;
input NibbleMinFl;
input RandomEq0;
input ColWindow;
input RetryMax;
input NoBckof;
input RandomEqByteCnt;


output StateIdle;         // Idle state
output StateIPG;          // IPG state
output StatePreamble;     // Preamble state
output [1:0] StateData;   // Data state
output StatePAD;          // PAD state
output StateFCS;          // FCS state
output StateJam;          // Jam state
output StateJam_q;        // Delayed Jam state
output StateBackOff;      // Backoff state
output StateDefer;        // Defer state

output StartFCS;          // FCS state will be activated in next clock
output StartJam;          // Jam state will be activated in next clock
output StartBackoff;      // Backoff state will be activated in next clock
output StartDefer;        // Defer state will be activated in next clock
output DeferIndication;
output StartPreamble;     // Preamble state will be activated in next clock
output [1:0] StartData;   // Data state will be activated in next clock
output StartIPG;          // IPG state will be activated in next clock

wire StartIdle;           // Idle state will be activated in next clock
wire StartPAD;            // PAD state will be activated in next clock


reg StateIdle;
reg StateIPG;
reg StatePreamble;
reg [1:0] StateData;
reg StatePAD;
reg StateFCS;
reg StateJam;
reg StateJam_q;
reg StateBackOff;
reg StateDefer;
reg Rule1;


// Defining the next state
assign StartIPG = StateDefer & ~ExcessiveDefer & ~CarrierSense;

assign StartIdle = StateIPG & (Rule1 & NibCnt[6:0] >= IPGT | ~Rule1 & NibCnt[6:0] >= IPGR2);

assign StartPreamble = StateIdle & TxStartFrm & ~CarrierSense;

assign StartData[0] = ~Collision & (StatePreamble & NibCntEq15 | StateData[1] & ~TxEndFrm);

assign StartData[1] = ~Collision & StateData[0] & ~TxUnderRun & ~MaxFrame;

assign StartPAD = ~Collision & StateData[1] & TxEndFrm & Pad & ~NibbleMinFl;

assign StartFCS = ~Collision & StateData[1] & TxEndFrm & (~Pad | Pad & NibbleMinFl) & CrcEn
                | ~Collision & StatePAD & NibbleMinFl & CrcEn;

assign StartJam = (Collision | UnderRun) & ((StatePreamble & NibCntEq15) | (|StateData[1:0]) | StatePAD | StateFCS);

assign StartBackoff = StateJam & ~RandomEq0 & ColWindow & ~RetryMax & NibCntEq7 & ~NoBckof;

assign StartDefer = StateIPG & ~Rule1 & CarrierSense & NibCnt[6:0] <= IPGR1 & NibCnt[6:0] != IPGR2
                  | StateIdle & CarrierSense 
                  | StateJam & NibCntEq7 & (NoBckof | RandomEq0 | ~ColWindow | RetryMax)
                  | StateBackOff & (TxUnderRun | RandomEqByteCnt)
                  | StartTxDone | TooBig;

assign DeferIndication = StateIdle & CarrierSense;

// Tx State Machine
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    begin
      StateIPG        <= #Tp 1'b0;
      StateIdle       <= #Tp 1'b0;
      StatePreamble   <= #Tp 1'b0;
      StateData[1:0]  <= #Tp 2'b0;
      StatePAD        <= #Tp 1'b0;
      StateFCS        <= #Tp 1'b0;
      StateJam        <= #Tp 1'b0;
      StateJam_q      <= #Tp 1'b0;
      StateBackOff    <= #Tp 1'b0;
      StateDefer      <= #Tp 1'b1;
    end
  else
    begin
      StateData[1:0] <= #Tp StartData[1:0];
      StateJam_q <= #Tp StateJam;

      if(StartDefer | StartIdle)
        StateIPG <= #Tp 1'b0;
      else
      if(StartIPG)
        StateIPG <= #Tp 1'b1;

      if(StartDefer | StartPreamble)
        StateIdle <= #Tp 1'b0;
      else
      if(StartIdle)
        StateIdle <= #Tp 1'b1;

      if(StartData[0] | StartJam)
        StatePreamble <= #Tp 1'b0;
      else
      if(StartPreamble)
        StatePreamble <= #Tp 1'b1;

      if(StartFCS | StartJam)
        StatePAD <= #Tp 1'b0;
      else
      if(StartPAD)
        StatePAD <= #Tp 1'b1;

      if(StartJam | StartDefer)
        StateFCS <= #Tp 1'b0;
      else
      if(StartFCS)
        StateFCS <= #Tp 1'b1;

      if(StartBackoff | StartDefer)
        StateJam <= #Tp 1'b0;
      else
      if(StartJam)
        StateJam <= #Tp 1'b1;

      if(StartDefer)
        StateBackOff <= #Tp 1'b0;
      else
      if(StartBackoff)
        StateBackOff <= #Tp 1'b1;

      if(StartIPG)
        StateDefer <= #Tp 1'b0;
      else
      if(StartDefer)
        StateDefer <= #Tp 1'b1;
    end
end


// This sections defines which interpack gap rule to use
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    Rule1 <= #Tp 1'b0;
  else
    begin
      if(StateIdle | StateBackOff)
        Rule1 <= #Tp 1'b0;
      else
      if(StatePreamble | FullD)
        Rule1 <= #Tp 1'b1;
    end
end



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_wishbone.v                                              ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is available in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_wishbone.v,v $
// Revision 1.52  2003/01/30 14:51:31  mohor
// Reset has priority in some flipflops.
//
// Revision 1.51  2003/01/30 13:36:22  mohor
// A new bug (entered with previous update) fixed. When abort occured sometimes
// data transmission was blocked.
//
// Revision 1.50  2003/01/22 13:49:26  tadejm
// When control packets were received, they were ignored in some cases.
//
// Revision 1.49  2003/01/21 12:09:40  mohor
// When receiving normal data frame and RxFlow control was switched on, RXB
// interrupt was not set.
//
// Revision 1.48  2003/01/20 12:05:26  mohor
// When in full duplex, transmit was sometimes blocked. Fixed.
//
// Revision 1.47  2002/11/22 13:26:21  mohor
// Registers RxStatusWrite_rck and RxStatusWriteLatched were not used
// anywhere. Removed.
//
// Revision 1.46  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.45  2002/11/19 17:33:34  mohor
// AddressMiss status is connecting to the Rx BD. AddressMiss is identifying
// that a frame was received because of the promiscous mode.
//
// Revision 1.44  2002/11/13 22:21:40  tadejm
// RxError is not generated when small frame reception is enabled and small
// frames are received.
//
// Revision 1.43  2002/10/18 20:53:34  mohor
// case changed to casex.
//
// Revision 1.42  2002/10/18 17:04:20  tadejm
// Changed BIST scan signals.
//
// Revision 1.41  2002/10/18 15:42:09  tadejm
// Igor added WB burst support and repaired BUG when handling TX under-run and retry.
//
// Revision 1.40  2002/10/14 16:07:02  mohor
// TxStatus is written after last access to the TX fifo is finished (in case of abort
// or retry). TxDone is fixed.
//
// Revision 1.39  2002/10/11 15:35:20  mohor
// txfifo_cnt and rxfifo_cnt counters width is defined in the eth_define.v file,
// TxDone and TxRetry are generated after the current WISHBONE access is
// finished.
//
// Revision 1.38  2002/10/10 16:29:30  mohor
// BIST added.
//
// Revision 1.37  2002/09/11 14:18:46  mohor
// Sometimes both RxB_IRQ and RxE_IRQ were activated. Bug fixed.
//
// Revision 1.36  2002/09/10 13:48:46  mohor
// Reception is possible after RxPointer is read and not after BD is read. For
// that reason RxBDReady is changed to RxReady.
// Busy_IRQ interrupt connected. When there is no RxBD ready and frame
// comes, interrupt is generated.
//
// Revision 1.35  2002/09/10 10:35:23  mohor
// Ethernet debug registers removed.
//
// Revision 1.34  2002/09/08 16:31:49  mohor
// Async reset for WB_ACK_O removed (when core was in reset, it was
// impossible to access BDs).
// RxPointers and TxPointers names changed to be more descriptive.
// TxUnderRun synchronized.
//
// Revision 1.33  2002/09/04 18:47:57  mohor
// Debug registers reg1, 2, 3, 4 connected. Synchronization of many signals
// changed (bugs fixed). Access to un-alligned buffers fixed. RxAbort signal
// was not used OK.
//
// Revision 1.32  2002/08/14 19:31:48  mohor
// Register TX_BD_NUM is changed so it contains value of the Tx buffer descriptors. No
// need to multiply or devide any more.
//
// Revision 1.31  2002/07/25 18:29:01  mohor
// WriteRxDataToMemory signal changed so end of frame (when last word is
// written to fifo) is changed.
//
// Revision 1.30  2002/07/23 15:28:31  mohor
// Ram , used for BDs changed from generic_spram to eth_spram_256x32.
//
// Revision 1.29  2002/07/20 00:41:32  mohor
// ShiftEnded synchronization changed.
//
// Revision 1.28  2002/07/18 16:11:46  mohor
// RxBDAddress takes `ETH_TX_BD_NUM_DEF value after reset.
//
// Revision 1.27  2002/07/11 02:53:20  mohor
// RxPointer bug fixed.
//
// Revision 1.26  2002/07/10 13:12:38  mohor
// Previous bug wasn't succesfully removed. Now fixed.
//
// Revision 1.25  2002/07/09 23:53:24  mohor
// Master state machine had a bug when switching from master write to
// master read.
//
// Revision 1.24  2002/07/09 20:44:41  mohor
// m_wb_cyc_o signal released after every single transfer.
//
// Revision 1.23  2002/05/03 10:15:50  mohor
// Outputs registered. Reset changed for eth_wishbone module.
//
// Revision 1.22  2002/04/24 08:52:19  mohor
// Compiler directives added. Tx and Rx fifo size incremented. A "late collision"
// bug fixed.
//
// Revision 1.21  2002/03/29 16:18:11  lampret
// Small typo fixed.
//
// Revision 1.20  2002/03/25 16:19:12  mohor
// Any address can be used for Tx and Rx BD pointers. Address does not need
// to be aligned.
//
// Revision 1.19  2002/03/19 12:51:50  mohor
// Comments in Slovene language removed.
//
// Revision 1.18  2002/03/19 12:46:52  mohor
// casex changed with case, fifo reset changed.
//
// Revision 1.17  2002/03/09 16:08:45  mohor
// rx_fifo was not always cleared ok. Fixed.
//
// Revision 1.16  2002/03/09 13:51:20  mohor
// Status was not latched correctly sometimes. Fixed.
//
// Revision 1.15  2002/03/08 06:56:46  mohor
// Big Endian problem when sending frames fixed.
//
// Revision 1.14  2002/03/02 19:12:40  mohor
// Byte ordering changed (Big Endian used). casex changed with case because
// Xilinx Foundation had problems. Tested in HW. It WORKS.
//
// Revision 1.13  2002/02/26 16:59:55  mohor
// Small fixes for external/internal DMA missmatches.
//
// Revision 1.12  2002/02/26 16:22:07  mohor
// Interrupts changed
//
// Revision 1.11  2002/02/15 17:07:39  mohor
// Status was not written correctly when frames were discarted because of
// address mismatch.
//
// Revision 1.10  2002/02/15 12:17:39  mohor
// RxStartFrm cleared when abort or retry comes.
//
// Revision 1.9  2002/02/15 11:59:10  mohor
// Changes that were lost when updating from 1.5 to 1.8 fixed.
//
// Revision 1.8  2002/02/14 20:54:33  billditt
// Addition  of new module eth_addrcheck.v
//
// Revision 1.7  2002/02/12 17:03:47  mohor
// RxOverRun added to statuses.
//
// Revision 1.6  2002/02/11 09:18:22  mohor
// Tx status is written back to the BD.
//
// Revision 1.5  2002/02/08 16:21:54  mohor
// Rx status is written back to the BD.
//
// Revision 1.4  2002/02/06 14:10:21  mohor
// non-DMA host interface added. Select the right configutation in eth_defines.
//
// Revision 1.3  2002/02/05 16:44:39  mohor
// Both rx and tx part are finished. Tested with wb_clk_i between 10 and 200
// MHz. Statuses, overrun, control frame transmission and reception still  need
// to be fixed.
//
// Revision 1.2  2002/02/01 12:46:51  mohor
// Tx part finished. TxStatus needs to be fixed. Pause request needs to be
// added.
//
// Revision 1.1  2002/01/23 10:47:59  mohor
// Initial version. Equals to eth_wishbonedma.v at this moment.
//
//
//


module eth_wishbone
   (

    // WISHBONE common
    WB_CLK_I, WB_DAT_I, WB_DAT_O, 

    // WISHBONE slave
 		WB_ADR_I, WB_WE_I, WB_ACK_O, 
    BDCs, 

    Reset, 

    // WISHBONE master
    m_wb_adr_o, m_wb_sel_o, m_wb_we_o, 
    m_wb_dat_o, m_wb_dat_i, m_wb_cyc_o, 
    m_wb_stb_o, m_wb_ack_i, m_wb_err_i, 

`ifdef ETH_WISHBONE_B3
    m_wb_cti_o, m_wb_bte_o, 
`endif

    //TX
    MTxClk, TxStartFrm, TxEndFrm, TxUsedData, TxData, 
    TxRetry, TxAbort, TxUnderRun, TxDone, PerPacketCrcEn, 
    PerPacketPad, 

    //RX
    MRxClk, RxData, RxValid, RxStartFrm, RxEndFrm, RxAbort, RxStatusWriteLatched_sync2, 
    
    // Register
    r_TxEn, r_RxEn, r_TxBDNum, TX_BD_NUM_Wr, r_RxFlow, r_PassAll, 

    // Interrupts
    TxB_IRQ, TxE_IRQ, RxB_IRQ, RxE_IRQ, Busy_IRQ, 
    
    // Rx Status
    InvalidSymbol, LatchedCrcError, RxLateCollision, ShortFrame, DribbleNibble,
    ReceivedPacketTooBig, RxLength, LoadRxStatus, ReceivedPacketGood, AddressMiss, 
    ReceivedPauseFrm, 
    
    // Tx Status
    RetryCntLatched, RetryLimit, LateCollLatched, DeferLatched, CarrierSenseLost

    // Bist
`ifdef ETH_BIST
    ,
    // debug chain signals
    scanb_rst,      // bist scan reset
    scanb_clk,      // bist scan clock
    scanb_si,       // bist scan serial in
    scanb_so,       // bist scan serial out
    scanb_en        // bist scan shift enable
`endif
    


		);


parameter Tp = 1;


// WISHBONE common
input           WB_CLK_I;       // WISHBONE clock
input  [31:0]   WB_DAT_I;       // WISHBONE data input
output [31:0]   WB_DAT_O;       // WISHBONE data output

// WISHBONE slave
input   [9:2]   WB_ADR_I;       // WISHBONE address input
input           WB_WE_I;        // WISHBONE write enable input
input           BDCs;           // Buffer descriptors are selected
output          WB_ACK_O;       // WISHBONE acknowledge output

// WISHBONE master
output  [31:0]  m_wb_adr_o;     // 
output   [3:0]  m_wb_sel_o;     // 
output          m_wb_we_o;      // 
output  [31:0]  m_wb_dat_o;     // 
output          m_wb_cyc_o;     // 
output          m_wb_stb_o;     // 
input   [31:0]  m_wb_dat_i;     // 
input           m_wb_ack_i;     // 
input           m_wb_err_i;     // 

`ifdef ETH_WISHBONE_B3
output   [2:0]  m_wb_cti_o;     // Cycle Type Identifier
output   [1:0]  m_wb_bte_o;     // Burst Type Extension
reg      [2:0]  m_wb_cti_o;     // Cycle Type Identifier
`endif

input           Reset;       // Reset signal

// Rx Status signals
input           InvalidSymbol;    // Invalid symbol was received during reception in 100 Mbps mode
input           LatchedCrcError;  // CRC error
input           RxLateCollision;  // Late collision occured while receiving frame
input           ShortFrame;       // Frame shorter then the minimum size (r_MinFL) was received while small packets are enabled (r_RecSmall)
input           DribbleNibble;    // Extra nibble received
input           ReceivedPacketTooBig;// Received packet is bigger than r_MaxFL
input    [15:0] RxLength;         // Length of the incoming frame
input           LoadRxStatus;     // Rx status was loaded
input           ReceivedPacketGood;// Received packet's length and CRC are good
input           AddressMiss;      // When a packet is received AddressMiss status is written to the Rx BD
input           r_RxFlow;
input           r_PassAll;
input           ReceivedPauseFrm;

// Tx Status signals
input     [3:0] RetryCntLatched;  // Latched Retry Counter
input           RetryLimit;       // Retry limit reached (Retry Max value + 1 attempts were made)
input           LateCollLatched;  // Late collision occured
input           DeferLatched;     // Defer indication (Frame was defered before sucessfully sent)
input           CarrierSenseLost; // Carrier Sense was lost during the frame transmission

// Tx
input           MTxClk;         // Transmit clock (from PHY)
input           TxUsedData;     // Transmit packet used data
input           TxRetry;        // Transmit packet retry
input           TxAbort;        // Transmit packet abort
input           TxDone;         // Transmission ended
output          TxStartFrm;     // Transmit packet start frame
output          TxEndFrm;       // Transmit packet end frame
output  [7:0]   TxData;         // Transmit packet data byte
output          TxUnderRun;     // Transmit packet under-run
output          PerPacketCrcEn; // Per packet crc enable
output          PerPacketPad;   // Per packet pading

// Rx
input           MRxClk;         // Receive clock (from PHY)
input   [7:0]   RxData;         // Received data byte (from PHY)
input           RxValid;        // 
input           RxStartFrm;     // 
input           RxEndFrm;       // 
input           RxAbort;        // This signal is set when address doesn't match.
output          RxStatusWriteLatched_sync2;

//Register
input           r_TxEn;         // Transmit enable
input           r_RxEn;         // Receive enable
input   [7:0]   r_TxBDNum;      // Receive buffer descriptor number
input           TX_BD_NUM_Wr;   // RxBDNumber written

// Interrupts
output TxB_IRQ;
output TxE_IRQ;
output RxB_IRQ;
output RxE_IRQ;
output Busy_IRQ;


// Bist
`ifdef ETH_BIST
input   scanb_rst;      // bist scan reset
input   scanb_clk;      // bist scan clock
input   scanb_si;       // bist scan serial in
output  scanb_so;       // bist scan serial out
input   scanb_en;       // bist scan shift enable
`endif

reg TxB_IRQ;
reg TxE_IRQ;
reg RxB_IRQ;
reg RxE_IRQ;

reg             TxStartFrm;
reg             TxEndFrm;
reg     [7:0]   TxData;

reg             TxUnderRun;
reg             TxUnderRun_wb;

reg             TxBDRead;
wire            TxStatusWrite;

reg     [1:0]   TxValidBytesLatched;

reg    [15:0]   TxLength;
reg    [15:0]   LatchedTxLength;
reg   [14:11]   TxStatus;

reg   [14:13]   RxStatus;

reg             TxStartFrm_wb;
reg             TxRetry_wb;
reg             TxAbort_wb;
reg             TxDone_wb;

reg             TxDone_wb_q;
reg             TxAbort_wb_q;
reg             TxRetry_wb_q;
reg             TxRetryPacket;
reg             TxRetryPacket_NotCleared;
reg             TxDonePacket;
reg             TxDonePacket_NotCleared;
reg             TxAbortPacket;
reg             TxAbortPacket_NotCleared;
reg             RxBDReady;
reg             RxReady;
reg             TxBDReady;

reg             RxBDRead;

reg    [31:0]   TxDataLatched;
reg     [1:0]   TxByteCnt;
reg             LastWord;
reg             ReadTxDataFromFifo_tck;

reg             BlockingTxStatusWrite;
reg             BlockingTxBDRead;

reg             Flop;

reg     [7:0]   TxBDAddress;
reg     [7:0]   RxBDAddress;

reg             TxRetrySync1;
reg             TxAbortSync1;
reg             TxDoneSync1;

reg             TxAbort_q;
reg             TxRetry_q;
reg             TxUsedData_q;

reg    [31:0]   RxDataLatched2;

reg    [31:8]   RxDataLatched1;     // Big Endian Byte Ordering

reg     [1:0]   RxValidBytes;
reg     [1:0]   RxByteCnt;
reg             LastByteIn;
reg             ShiftWillEnd;

reg             WriteRxDataToFifo;
reg    [15:0]   LatchedRxLength;
reg             RxAbortLatched;

reg             ShiftEnded;
reg             RxOverrun;

reg             BDWrite;                    // BD Write Enable for access from WISHBONE side
reg             BDRead;                     // BD Read access from WISHBONE side
wire   [31:0]   RxBDDataIn;                 // Rx BD data in
wire   [31:0]   TxBDDataIn;                 // Tx BD data in

reg             TxEndFrm_wb;

wire            TxRetryPulse;
wire            TxDonePulse;
wire            TxAbortPulse;

wire            StartRxBDRead;

wire            StartTxBDRead;

wire            TxIRQEn;
wire            WrapTxStatusBit;

wire            RxIRQEn;
wire            WrapRxStatusBit;

wire    [1:0]   TxValidBytes;

wire    [7:0]   TempTxBDAddress;
wire    [7:0]   TempRxBDAddress;

wire            RxStatusWrite;

reg             WB_ACK_O;

wire    [8:0]   RxStatusIn;
reg     [8:0]   RxStatusInLatched;

reg WbEn, WbEn_q;
reg RxEn, RxEn_q;
reg TxEn, TxEn_q;

wire ram_ce;
wire ram_we;
wire ram_oe;
reg [7:0]   ram_addr;
reg [31:0]  ram_di;
wire [31:0] ram_do;

wire StartTxPointerRead;
reg  TxPointerRead;
reg TxEn_needed;
reg RxEn_needed;

wire StartRxPointerRead;
reg RxPointerRead; 

`ifdef ETH_WISHBONE_B3
assign m_wb_bte_o = 2'b00;    // Linear burst
`endif


always @ (posedge WB_CLK_I)
begin
  WB_ACK_O <=#Tp BDWrite & WbEn & WbEn_q | BDRead & WbEn & ~WbEn_q;
end

assign WB_DAT_O = ram_do;

// Generic synchronous single-port RAM interface
eth_spram_256x32 bd_ram (
	.clk(WB_CLK_I), .rst(Reset), .ce(ram_ce), .we(ram_we), .oe(ram_oe), .addr(ram_addr), .di(ram_di), .do(ram_do)
`ifdef ETH_BIST
  ,
  .scanb_rst      (scanb_rst),
  .scanb_clk      (scanb_clk),
  .scanb_si       (scanb_si),
  .scanb_so       (scanb_so),
  .scanb_en       (scanb_en)
`endif
);

assign ram_ce = 1'b1;
assign ram_we = BDWrite & WbEn & WbEn_q | TxStatusWrite | RxStatusWrite;
assign ram_oe = BDRead & WbEn & WbEn_q | TxEn & TxEn_q & (TxBDRead | TxPointerRead) | RxEn & RxEn_q & (RxBDRead | RxPointerRead);


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxEn_needed <=#Tp 1'b0;
  else
  if(~TxBDReady & r_TxEn & WbEn & ~WbEn_q)
    TxEn_needed <=#Tp 1'b1;
  else
  if(TxPointerRead & TxEn & TxEn_q)
    TxEn_needed <=#Tp 1'b0;
end

// Enabling access to the RAM for three devices.
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      WbEn <=#Tp 1'b1;
      RxEn <=#Tp 1'b0;
      TxEn <=#Tp 1'b0;
      ram_addr <=#Tp 8'h0;
      ram_di <=#Tp 32'h0;
      BDRead <=#Tp 1'b0;
      BDWrite <=#Tp 1'b0;
    end
  else
    begin
      // Switching between three stages depends on enable signals
      case ({WbEn_q, RxEn_q, TxEn_q, RxEn_needed, TxEn_needed})  // synopsys parallel_case
        5'b100_10, 5'b100_11 :
          begin
            WbEn <=#Tp 1'b0;
            RxEn <=#Tp 1'b1;  // wb access stage and r_RxEn is enabled
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp RxBDAddress + RxPointerRead;
            ram_di <=#Tp RxBDDataIn;
          end
        5'b100_01 :
          begin
            WbEn <=#Tp 1'b0;
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b1;  // wb access stage, r_RxEn is disabled but r_TxEn is enabled
            ram_addr <=#Tp TxBDAddress + TxPointerRead;
            ram_di <=#Tp TxBDDataIn;
          end
        5'b010_00, 5'b010_10 :
          begin
            WbEn <=#Tp 1'b1;  // RxEn access stage and r_TxEn is disabled
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp WB_ADR_I[9:2];
            ram_di <=#Tp WB_DAT_I;
            BDWrite <=#Tp BDCs & WB_WE_I;
            BDRead <=#Tp BDCs & ~WB_WE_I;
          end
        5'b010_01, 5'b010_11 :
          begin
            WbEn <=#Tp 1'b0;
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b1;  // RxEn access stage and r_TxEn is enabled
            ram_addr <=#Tp TxBDAddress + TxPointerRead;
            ram_di <=#Tp TxBDDataIn;
          end
        5'b001_00, 5'b001_01, 5'b001_10, 5'b001_11 :
          begin
            WbEn <=#Tp 1'b1;  // TxEn access stage (we always go to wb access stage)
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp WB_ADR_I[9:2];
            ram_di <=#Tp WB_DAT_I;
            BDWrite <=#Tp BDCs & WB_WE_I;
            BDRead <=#Tp BDCs & ~WB_WE_I;
          end
        5'b100_00 :
          begin
            WbEn <=#Tp 1'b0;  // WbEn access stage and there is no need for other stages. WbEn needs to be switched off for a bit
          end
        5'b000_00 :
          begin
            WbEn <=#Tp 1'b1;  // Idle state. We go to WbEn access stage.
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp WB_ADR_I[9:2];
            ram_di <=#Tp WB_DAT_I;
            BDWrite <=#Tp BDCs & WB_WE_I;
            BDRead <=#Tp BDCs & ~WB_WE_I;
          end
      endcase
    end
end


// Delayed stage signals
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      WbEn_q <=#Tp 1'b0;
      RxEn_q <=#Tp 1'b0;
      TxEn_q <=#Tp 1'b0;
    end
  else
    begin
      WbEn_q <=#Tp WbEn;
      RxEn_q <=#Tp RxEn;
      TxEn_q <=#Tp TxEn;
    end
end

// Changes for tx occur every second clock. Flop is used for this manner.
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    Flop <=#Tp 1'b0;
  else
  if(TxDone | TxAbort | TxRetry_q)
    Flop <=#Tp 1'b0;
  else
  if(TxUsedData)
    Flop <=#Tp ~Flop;
end

wire ResetTxBDReady;
assign ResetTxBDReady = TxDonePulse | TxAbortPulse | TxRetryPulse;

// Latching READY status of the Tx buffer descriptor
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxBDReady <=#Tp 1'b0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    TxBDReady <=#Tp ram_do[15] & (ram_do[31:16] > 4); // TxBDReady is sampled only once at the beginning.
  else                                                // Only packets larger then 4 bytes are transmitted.
  if(ResetTxBDReady)
    TxBDReady <=#Tp 1'b0;
end


// Reading the Tx buffer descriptor
assign StartTxBDRead = (TxRetryPacket_NotCleared | TxStatusWrite) & ~BlockingTxBDRead & ~TxBDReady;

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxBDRead <=#Tp 1'b1;
  else
  if(StartTxBDRead)
    TxBDRead <=#Tp 1'b1;
  else
  if(TxBDReady)
    TxBDRead <=#Tp 1'b0;
end


// Reading Tx BD pointer
assign StartTxPointerRead = TxBDRead & TxBDReady;

// Reading Tx BD Pointer
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerRead <=#Tp 1'b0;
  else
  if(StartTxPointerRead)
    TxPointerRead <=#Tp 1'b1;
  else
  if(TxEn_q)
    TxPointerRead <=#Tp 1'b0;
end


// Writing status back to the Tx buffer descriptor
assign TxStatusWrite = (TxDonePacket_NotCleared | TxAbortPacket_NotCleared) & TxEn & TxEn_q & ~BlockingTxStatusWrite;



// Status writing must occur only once. Meanwhile it is blocked.
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockingTxStatusWrite <=#Tp 1'b0;
  else
  if(~TxDone_wb & ~TxAbort_wb)
    BlockingTxStatusWrite <=#Tp 1'b0;
  else
  if(TxStatusWrite)
    BlockingTxStatusWrite <=#Tp 1'b1;
end


reg BlockingTxStatusWrite_sync1;
reg BlockingTxStatusWrite_sync2;

// Synchronizing BlockingTxStatusWrite to MTxClk
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    BlockingTxStatusWrite_sync1 <=#Tp 1'b0;
  else
    BlockingTxStatusWrite_sync1 <=#Tp BlockingTxStatusWrite;
end

// Synchronizing BlockingTxStatusWrite to MTxClk
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    BlockingTxStatusWrite_sync2 <=#Tp 1'b0;
  else
    BlockingTxStatusWrite_sync2 <=#Tp BlockingTxStatusWrite_sync1;
end


// TxBDRead state is activated only once. 
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockingTxBDRead <=#Tp 1'b0;
  else
  if(StartTxBDRead)
    BlockingTxBDRead <=#Tp 1'b1;
  else
  if(~StartTxBDRead & ~TxBDReady)
    BlockingTxBDRead <=#Tp 1'b0;
end


// Latching status from the tx buffer descriptor
// Data is avaliable one cycle after the access is started (at that time signal TxEn is not active)
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStatus <=#Tp 4'h0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    TxStatus <=#Tp ram_do[14:11];
end

reg ReadTxDataFromMemory;
wire WriteRxDataToMemory;

reg MasterWbTX;
reg MasterWbRX;

reg [31:0] m_wb_adr_o;
reg        m_wb_cyc_o;
reg        m_wb_stb_o;
reg  [3:0] m_wb_sel_o;
reg        m_wb_we_o;

wire TxLengthEq0;
wire TxLengthLt4;

reg BlockingIncrementTxPointer;
reg [31:2] TxPointerMSB;
reg [1:0]  TxPointerLSB;
reg [1:0]  TxPointerLSB_rst;
reg [31:2] RxPointerMSB;
reg [1:0]  RxPointerLSB_rst;

wire RxBurstAcc;
wire RxWordAcc;
wire RxHalfAcc;
wire RxByteAcc;

//Latching length from the buffer descriptor;
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxLength <=#Tp 16'h0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    TxLength <=#Tp ram_do[31:16];
  else
  if(MasterWbTX & m_wb_ack_i)
    begin
      if(TxLengthLt4)
        TxLength <=#Tp 16'h0;
      else
      if(TxPointerLSB_rst==2'h0)
        TxLength <=#Tp TxLength - 3'h4;    // Length is subtracted at the data request
      else
      if(TxPointerLSB_rst==2'h1)
        TxLength <=#Tp TxLength - 3'h3;    // Length is subtracted at the data request
      else
      if(TxPointerLSB_rst==2'h2)
        TxLength <=#Tp TxLength - 3'h2;    // Length is subtracted at the data request
      else
      if(TxPointerLSB_rst==2'h3)
        TxLength <=#Tp TxLength - 3'h1;    // Length is subtracted at the data request
    end
end



//Latching length from the buffer descriptor;
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    LatchedTxLength <=#Tp 16'h0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    LatchedTxLength <=#Tp ram_do[31:16];
end

assign TxLengthEq0 = TxLength == 0;
assign TxLengthLt4 = TxLength < 4;

reg cyc_cleared;
reg IncrTxPointer;


// Latching Tx buffer pointer from buffer descriptor. Only 30 MSB bits are latched
// because TxPointerMSB is only used for word-aligned accesses.
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerMSB <=#Tp 30'h0;
  else
  if(TxEn & TxEn_q & TxPointerRead)
    TxPointerMSB <=#Tp ram_do[31:2];
  else
  if(IncrTxPointer & ~BlockingIncrementTxPointer)
    TxPointerMSB <=#Tp TxPointerMSB + 1'b1;     // TxPointer is word-aligned
end


// Latching 2 MSB bits of the buffer descriptor. Since word accesses are performed,
// valid data does not necesserly start at byte 0 (could be byte 0, 1, 2 or 3). This
// signals are used for proper selection of the start byte (TxData and TxByteCnt) are
// set by this two bits.
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerLSB[1:0] <=#Tp 0;
  else
  if(TxEn & TxEn_q & TxPointerRead)
    TxPointerLSB[1:0] <=#Tp ram_do[1:0];
end


// Latching 2 MSB bits of the buffer descriptor. 
// After the read access, TxLength needs to be decremented for the number of the valid
// bytes (1 to 4 bytes are valid in the first word). After the first read all bytes are 
// valid so this two bits are reset to zero. 
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerLSB_rst[1:0] <=#Tp 0;
  else
  if(TxEn & TxEn_q & TxPointerRead)
    TxPointerLSB_rst[1:0] <=#Tp ram_do[1:0];
  else
  if(MasterWbTX & m_wb_ack_i)                 // After first access pointer is word alligned
    TxPointerLSB_rst[1:0] <=#Tp 0;
end


reg  [3:0] RxByteSel;
wire MasterAccessFinished;


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockingIncrementTxPointer <=#Tp 0;
  else
  if(MasterAccessFinished)
    BlockingIncrementTxPointer <=#Tp 0;
  else
  if(IncrTxPointer)
    BlockingIncrementTxPointer <=#Tp 1'b1;
end


wire TxBufferAlmostFull;
wire TxBufferFull;
wire TxBufferEmpty;
wire TxBufferAlmostEmpty;
wire SetReadTxDataFromMemory;

reg BlockReadTxDataFromMemory;

assign SetReadTxDataFromMemory = TxEn & TxEn_q & TxPointerRead;

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromMemory <=#Tp 1'b0;
  else
  if(TxLengthEq0 | TxAbortPulse | TxRetryPulse)
    ReadTxDataFromMemory <=#Tp 1'b0;
  else
  if(SetReadTxDataFromMemory)
    ReadTxDataFromMemory <=#Tp 1'b1;
end

reg tx_burst_en;
reg rx_burst_en;

wire ReadTxDataFromMemory_2 = ReadTxDataFromMemory & ~BlockReadTxDataFromMemory;
wire tx_burst = ReadTxDataFromMemory_2 & tx_burst_en;

wire [31:0] TxData_wb;
wire ReadTxDataFromFifo_wb;

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockReadTxDataFromMemory <=#Tp 1'b0;
  else
  if((TxBufferAlmostFull | TxLength <= 4)& MasterWbTX & (~cyc_cleared) & (!(TxAbortPacket_NotCleared | TxRetryPacket_NotCleared)))
    BlockReadTxDataFromMemory <=#Tp 1'b1;
  else
  if(ReadTxDataFromFifo_wb | TxDonePacket | TxAbortPacket | TxRetryPacket)
    BlockReadTxDataFromMemory <=#Tp 1'b0;
end


assign MasterAccessFinished = m_wb_ack_i | m_wb_err_i;
wire [`ETH_TX_FIFO_CNT_WIDTH-1:0] txfifo_cnt;
wire [`ETH_RX_FIFO_CNT_WIDTH-1:0] rxfifo_cnt;
reg  [`ETH_BURST_CNT_WIDTH-1:0] tx_burst_cnt;
reg  [`ETH_BURST_CNT_WIDTH-1:0] rx_burst_cnt;

wire rx_burst;
wire enough_data_in_rxfifo_for_burst;
wire enough_data_in_rxfifo_for_burst_plus1;

// Enabling master wishbone access to the memory for two devices TX and RX.
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      MasterWbTX <=#Tp 1'b0;
      MasterWbRX <=#Tp 1'b0;
      m_wb_adr_o <=#Tp 32'h0;
      m_wb_cyc_o <=#Tp 1'b0;
      m_wb_stb_o <=#Tp 1'b0;
      m_wb_we_o  <=#Tp 1'b0;
      m_wb_sel_o <=#Tp 4'h0;
      cyc_cleared<=#Tp 1'b0;
      tx_burst_cnt<=#Tp 0;
      rx_burst_cnt<=#Tp 0;
      IncrTxPointer<=#Tp 1'b0;
      tx_burst_en<=#Tp 1'b1;
      rx_burst_en<=#Tp 1'b0;
      `ifdef ETH_WISHBONE_B3
        m_wb_cti_o <=#Tp 3'b0;
      `endif
    end
  else
    begin
      // Switching between two stages depends on enable signals
      casex ({MasterWbTX, MasterWbRX, ReadTxDataFromMemory_2, WriteRxDataToMemory, MasterAccessFinished, cyc_cleared, tx_burst, rx_burst})  // synopsys parallel_case
        8'b00_10_00_10,             // Idle and MRB needed
        8'b10_1x_10_1x,             // MRB continues
        8'b10_10_01_10,             // Clear (previously MR) and MRB needed
        8'b01_1x_01_1x :            // Clear (previously MW) and MRB needed
          begin
            MasterWbTX <=#Tp 1'b1;  // tx burst
            MasterWbRX <=#Tp 1'b0;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_stb_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b0;
            m_wb_sel_o <=#Tp 4'hf;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b1;
            tx_burst_cnt <=#Tp tx_burst_cnt+1;
            if(tx_burst_cnt==0)
              m_wb_adr_o <=#Tp {TxPointerMSB, 2'h0};
            else
              m_wb_adr_o <=#Tp m_wb_adr_o+3'h4;

            if(tx_burst_cnt==(`ETH_BURST_LENGTH-1))
              begin
                tx_burst_en<=#Tp 1'b0;
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b111;
              `endif
              end
            else
              begin
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b010;
              `endif
              end
          end
        8'b00_x1_00_x1,             // Idle and MWB needed
        8'b01_x1_10_x1,             // MWB continues
        8'b01_01_01_01,             // Clear (previously MW) and MWB needed
        8'b10_x1_01_x1 :            // Clear (previously MR) and MWB needed
          begin
            MasterWbTX <=#Tp 1'b0;  // rx burst
            MasterWbRX <=#Tp 1'b1;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_stb_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b1;
            m_wb_sel_o <=#Tp RxByteSel;
            IncrTxPointer<=#Tp 1'b0;
            cyc_cleared<=#Tp 1'b0;
            rx_burst_cnt <=#Tp rx_burst_cnt+1;

            if(rx_burst_cnt==0)
              m_wb_adr_o <=#Tp {RxPointerMSB, 2'h0};
            else
              m_wb_adr_o <=#Tp m_wb_adr_o+3'h4;

            if(rx_burst_cnt==(`ETH_BURST_LENGTH-1))
              begin
                rx_burst_en<=#Tp 1'b0;
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b111;
              `endif
              end
            else
              begin
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b010;
              `endif
              end
          end
        8'b00_x1_00_x0 :            // idle and MW is needed (data write to rx buffer)
          begin
            MasterWbTX <=#Tp 1'b0;
            MasterWbRX <=#Tp 1'b1;
            m_wb_adr_o <=#Tp {RxPointerMSB, 2'h0};
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_stb_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b1;
            m_wb_sel_o <=#Tp RxByteSel;
            IncrTxPointer<=#Tp 1'b0;
          end
        8'b00_10_00_00 :            // idle and MR is needed (data read from tx buffer)
          begin
            MasterWbTX <=#Tp 1'b1;
            MasterWbRX <=#Tp 1'b0;
            m_wb_adr_o <=#Tp {TxPointerMSB, 2'h0};
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_stb_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b0;
            m_wb_sel_o <=#Tp 4'hf;
            IncrTxPointer<=#Tp 1'b1;
          end
        8'b10_10_01_00,             // MR and MR is needed (data read from tx buffer)
        8'b01_1x_01_0x  :           // MW and MR is needed (data read from tx buffer)
          begin
            MasterWbTX <=#Tp 1'b1;
            MasterWbRX <=#Tp 1'b0;
            m_wb_adr_o <=#Tp {TxPointerMSB, 2'h0};
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_stb_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b0;
            m_wb_sel_o <=#Tp 4'hf;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b1;
          end
        8'b01_01_01_00,             // MW and MW needed (data write to rx buffer)
        8'b10_x1_01_x0  :           // MR and MW is needed (data write to rx buffer)
          begin
            MasterWbTX <=#Tp 1'b0;
            MasterWbRX <=#Tp 1'b1;
            m_wb_adr_o <=#Tp {RxPointerMSB, 2'h0};
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_stb_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b1;
            m_wb_sel_o <=#Tp RxByteSel;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b0;
          end
        8'b01_01_10_00,             // MW and MW needed (cycle is cleared between previous and next access)
        8'b01_1x_10_x0,             // MW and MW or MR or MRB needed (cycle is cleared between previous and next access)
        8'b10_10_10_00,             // MR and MR needed (cycle is cleared between previous and next access)
        8'b10_x1_10_0x :            // MR and MR or MW or MWB (cycle is cleared between previous and next access)
          begin
            m_wb_cyc_o <=#Tp 1'b0;  // whatever and master read or write is needed. We need to clear m_wb_cyc_o before next access is started
            m_wb_stb_o <=#Tp 1'b0;
            cyc_cleared<=#Tp 1'b1;
            IncrTxPointer<=#Tp 1'b0;
            tx_burst_cnt<=#Tp 0;
            tx_burst_en<=#Tp txfifo_cnt<(`ETH_TX_FIFO_DEPTH-`ETH_BURST_LENGTH) & (TxLength>(`ETH_BURST_LENGTH*4+4));
            rx_burst_cnt<=#Tp 0;
            rx_burst_en<=#Tp MasterWbRX ? enough_data_in_rxfifo_for_burst_plus1 : enough_data_in_rxfifo_for_burst;  // Counter is not decremented, yet, so plus1 is used.
            `ifdef ETH_WISHBONE_B3
              m_wb_cti_o <=#Tp 3'b0;
            `endif
          end
        8'bxx_00_10_00,             // whatever and no master read or write is needed (ack or err comes finishing previous access)
        8'bxx_00_01_00 :            // Between cyc_cleared request was cleared
          begin
            MasterWbTX <=#Tp 1'b0;
            MasterWbRX <=#Tp 1'b0;
            m_wb_cyc_o <=#Tp 1'b0;
            m_wb_stb_o <=#Tp 1'b0;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b0;
            rx_burst_cnt<=#Tp 0;
            rx_burst_en<=#Tp MasterWbRX ? enough_data_in_rxfifo_for_burst_plus1 : enough_data_in_rxfifo_for_burst;  // Counter is not decremented, yet, so plus1 is used.
            `ifdef ETH_WISHBONE_B3
              m_wb_cti_o <=#Tp 3'b0;
            `endif
          end
        8'b00_00_00_00:             // whatever and no master read or write is needed (ack or err comes finishing previous access)
          begin
            tx_burst_cnt<=#Tp 0;
            tx_burst_en<=#Tp txfifo_cnt<(`ETH_TX_FIFO_DEPTH-`ETH_BURST_LENGTH) & (TxLength>(`ETH_BURST_LENGTH*4+4));
          end
        default:                    // Don't touch
          begin
            MasterWbTX <=#Tp MasterWbTX;
            MasterWbRX <=#Tp MasterWbRX;
            m_wb_cyc_o <=#Tp m_wb_cyc_o;
            m_wb_stb_o <=#Tp m_wb_stb_o;
            m_wb_sel_o <=#Tp m_wb_sel_o;
            IncrTxPointer<=#Tp IncrTxPointer;
          end
      endcase
    end
end


wire TxFifoClear;

assign TxFifoClear = (TxAbortPacket | TxRetryPacket);

eth_fifo #(`ETH_TX_FIFO_DATA_WIDTH, `ETH_TX_FIFO_DEPTH, `ETH_TX_FIFO_CNT_WIDTH)
tx_fifo ( .data_in(m_wb_dat_i),                             .data_out(TxData_wb), 
          .clk(WB_CLK_I),                                   .reset(Reset), 
          .write(MasterWbTX & m_wb_ack_i),                  .read(ReadTxDataFromFifo_wb & ~TxBufferEmpty),
          .clear(TxFifoClear),                              .full(TxBufferFull), 
          .almost_full(TxBufferAlmostFull),                 .almost_empty(TxBufferAlmostEmpty), 
          .empty(TxBufferEmpty),                            .cnt(txfifo_cnt)
        );


reg StartOccured;
reg TxStartFrm_sync1;
reg TxStartFrm_sync2;
reg TxStartFrm_syncb1;
reg TxStartFrm_syncb2;



// Start: Generation of the TxStartFrm_wb which is then synchronized to the MTxClk
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStartFrm_wb <=#Tp 1'b0;
  else
  if(TxBDReady & ~StartOccured & (TxBufferFull | TxLengthEq0))
    TxStartFrm_wb <=#Tp 1'b1;
  else
  if(TxStartFrm_syncb2)
    TxStartFrm_wb <=#Tp 1'b0;
end

// StartOccured: TxStartFrm_wb occurs only ones at the beginning. Then it's blocked.
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    StartOccured <=#Tp 1'b0;
  else
  if(TxStartFrm_wb)
    StartOccured <=#Tp 1'b1;
  else
  if(ResetTxBDReady)
    StartOccured <=#Tp 1'b0;
end

// Synchronizing TxStartFrm_wb to MTxClk
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxStartFrm_sync1 <=#Tp 1'b0;
  else
    TxStartFrm_sync1 <=#Tp TxStartFrm_wb;
end

always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxStartFrm_sync2 <=#Tp 1'b0;
  else
    TxStartFrm_sync2 <=#Tp TxStartFrm_sync1;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStartFrm_syncb1 <=#Tp 1'b0;
  else
    TxStartFrm_syncb1 <=#Tp TxStartFrm_sync2;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStartFrm_syncb2 <=#Tp 1'b0;
  else
    TxStartFrm_syncb2 <=#Tp TxStartFrm_syncb1;
end

always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxStartFrm <=#Tp 1'b0;
  else
  if(TxStartFrm_sync2)
    TxStartFrm <=#Tp 1'b1;
  else
  if(TxUsedData_q | ~TxStartFrm_sync2 & (TxRetry & (~TxRetry_q) | TxAbort & (~TxAbort_q)))
    TxStartFrm <=#Tp 1'b0;
end
// End: Generation of the TxStartFrm_wb which is then synchronized to the MTxClk


// TxEndFrm_wb: indicator of the end of frame
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxEndFrm_wb <=#Tp 1'b0;
  else
  if(TxLengthEq0 & TxBufferAlmostEmpty & TxUsedData)
    TxEndFrm_wb <=#Tp 1'b1;
  else
  if(TxRetryPulse | TxDonePulse | TxAbortPulse)
    TxEndFrm_wb <=#Tp 1'b0;
end


// Marks which bytes are valid within the word.
assign TxValidBytes = TxLengthLt4 ? TxLength[1:0] : 2'b0;

reg LatchValidBytes;
reg LatchValidBytes_q;

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    LatchValidBytes <=#Tp 1'b0;
  else
  if(TxLengthLt4 & TxBDReady)
    LatchValidBytes <=#Tp 1'b1;
  else
    LatchValidBytes <=#Tp 1'b0;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    LatchValidBytes_q <=#Tp 1'b0;
  else
    LatchValidBytes_q <=#Tp LatchValidBytes;
end


// Latching valid bytes
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxValidBytesLatched <=#Tp 2'h0;
  else
  if(LatchValidBytes & ~LatchValidBytes_q)
    TxValidBytesLatched <=#Tp TxValidBytes;
  else
  if(TxRetryPulse | TxDonePulse | TxAbortPulse)
    TxValidBytesLatched <=#Tp 2'h0;
end


assign TxIRQEn          = TxStatus[14];
assign WrapTxStatusBit  = TxStatus[13];
assign PerPacketPad     = TxStatus[12];
assign PerPacketCrcEn   = TxStatus[11];


assign RxIRQEn         = RxStatus[14];
assign WrapRxStatusBit = RxStatus[13];


// Temporary Tx and Rx buffer descriptor address 
assign TempTxBDAddress[7:0] = {8{ TxStatusWrite     & ~WrapTxStatusBit}} & (TxBDAddress + 2'h2) ; // Tx BD increment or wrap (last BD)
assign TempRxBDAddress[7:0] = {8{ WrapRxStatusBit}} & (r_TxBDNum<<1)     | // Using first Rx BD
                              {8{~WrapRxStatusBit}} & (RxBDAddress + 2'h2) ; // Using next Rx BD (incremenrement address)


// Latching Tx buffer descriptor address
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxBDAddress <=#Tp 8'h0;
  else
  if(TxStatusWrite)
    TxBDAddress <=#Tp TempTxBDAddress;
end


// Latching Rx buffer descriptor address
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxBDAddress <=#Tp `ETH_TX_BD_NUM_DEF<<1;
  else
  if(TX_BD_NUM_Wr)                        // When r_TxBDNum is updated, RxBDAddress is also
    RxBDAddress <=#Tp WB_DAT_I[7:0]<<1;
  else
  if(RxStatusWrite)
    RxBDAddress <=#Tp TempRxBDAddress;
end

wire [8:0] TxStatusInLatched = {TxUnderRun, RetryCntLatched[3:0], RetryLimit, LateCollLatched, DeferLatched, CarrierSenseLost};

assign RxBDDataIn = {LatchedRxLength, 1'b0, RxStatus, 4'h0, RxStatusInLatched};
assign TxBDDataIn = {LatchedTxLength, 1'b0, TxStatus, 2'h0, TxStatusInLatched};


// Signals used for various purposes
assign TxRetryPulse   = TxRetry_wb   & ~TxRetry_wb_q;
assign TxDonePulse    = TxDone_wb    & ~TxDone_wb_q;
assign TxAbortPulse   = TxAbort_wb   & ~TxAbort_wb_q;



// Generating delayed signals
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    begin
      TxAbort_q      <=#Tp 1'b0;
      TxRetry_q      <=#Tp 1'b0;
      TxUsedData_q   <=#Tp 1'b0;
    end
  else
    begin
      TxAbort_q      <=#Tp TxAbort;
      TxRetry_q      <=#Tp TxRetry;
      TxUsedData_q   <=#Tp TxUsedData;
    end
end

// Generating delayed signals
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      TxDone_wb_q   <=#Tp 1'b0;
      TxAbort_wb_q  <=#Tp 1'b0;
      TxRetry_wb_q  <=#Tp 1'b0;
    end
  else
    begin
      TxDone_wb_q   <=#Tp TxDone_wb;
      TxAbort_wb_q  <=#Tp TxAbort_wb;
      TxRetry_wb_q  <=#Tp TxRetry_wb;
    end
end


reg TxAbortPacketBlocked;
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortPacket <=#Tp 1'b0;
  else
  if(TxAbort_wb & (~tx_burst_en) & MasterWbTX & MasterAccessFinished & (~TxAbortPacketBlocked) |
     TxAbort_wb & (~MasterWbTX) & (~TxAbortPacketBlocked))
    TxAbortPacket <=#Tp 1'b1;
  else
    TxAbortPacket <=#Tp 1'b0;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortPacket_NotCleared <=#Tp 1'b0;
  else
  if(TxEn & TxEn_q & TxAbortPacket_NotCleared)
    TxAbortPacket_NotCleared <=#Tp 1'b0;
  else
  if(TxAbort_wb & (~tx_burst_en) & MasterWbTX & MasterAccessFinished & (~TxAbortPacketBlocked) |
     TxAbort_wb & (~MasterWbTX) & (~TxAbortPacketBlocked))
    TxAbortPacket_NotCleared <=#Tp 1'b1;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortPacketBlocked <=#Tp 1'b0;
  else
  if(!TxAbort_wb & TxAbort_wb_q)
    TxAbortPacketBlocked <=#Tp 1'b0;
  else
  if(TxAbortPacket)
    TxAbortPacketBlocked <=#Tp 1'b1;
end


reg TxRetryPacketBlocked;
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetryPacket <=#Tp 1'b0;
  else
  if(TxRetry_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & !TxRetryPacketBlocked | 
     TxRetry_wb & !MasterWbTX & !TxRetryPacketBlocked)
    TxRetryPacket <=#Tp 1'b1;
  else
    TxRetryPacket <=#Tp 1'b0;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetryPacket_NotCleared <=#Tp 1'b0;
  else
  if(StartTxBDRead)
    TxRetryPacket_NotCleared <=#Tp 1'b0;
  else
  if(TxRetry_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & !TxRetryPacketBlocked | 
     TxRetry_wb & !MasterWbTX & !TxRetryPacketBlocked)
    TxRetryPacket_NotCleared <=#Tp 1'b1;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetryPacketBlocked <=#Tp 1'b0;
  else
  if(!TxRetry_wb & TxRetry_wb_q)
    TxRetryPacketBlocked <=#Tp 1'b0;
  else
  if(TxRetryPacket)
    TxRetryPacketBlocked <=#Tp 1'b1;
end


reg TxDonePacketBlocked;
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDonePacket <=#Tp 1'b0;
  else
  if(TxDone_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & !TxDonePacketBlocked | 
     TxDone_wb & !MasterWbTX & !TxDonePacketBlocked)
    TxDonePacket <=#Tp 1'b1;
  else
    TxDonePacket <=#Tp 1'b0;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDonePacket_NotCleared <=#Tp 1'b0;
  else
  if(TxEn & TxEn_q & TxDonePacket_NotCleared)
    TxDonePacket_NotCleared <=#Tp 1'b0;
  else
  if(TxDone_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & (~TxDonePacketBlocked) | 
     TxDone_wb & !MasterWbTX & (~TxDonePacketBlocked))
    TxDonePacket_NotCleared <=#Tp 1'b1;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDonePacketBlocked <=#Tp 1'b0;
  else
  if(!TxDone_wb & TxDone_wb_q)
    TxDonePacketBlocked <=#Tp 1'b0;
  else
  if(TxDonePacket)
    TxDonePacketBlocked <=#Tp 1'b1;
end


// Indication of the last word
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    LastWord <=#Tp 1'b0;
  else
  if((TxEndFrm | TxAbort | TxRetry) & Flop)
    LastWord <=#Tp 1'b0;
  else
  if(TxUsedData & Flop & TxByteCnt == 2'h3)
    LastWord <=#Tp TxEndFrm_wb;
end


// Tx end frame generation
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxEndFrm <=#Tp 1'b0;
  else
  if(Flop & TxEndFrm | TxAbort | TxRetry_q)
    TxEndFrm <=#Tp 1'b0;        
  else
  if(Flop & LastWord)
    begin
      case (TxValidBytesLatched)  // synopsys parallel_case
        1 : TxEndFrm <=#Tp TxByteCnt == 2'h0;
        2 : TxEndFrm <=#Tp TxByteCnt == 2'h1;
        3 : TxEndFrm <=#Tp TxByteCnt == 2'h2;
        0 : TxEndFrm <=#Tp TxByteCnt == 2'h3;
        default : TxEndFrm <=#Tp 1'b0;
      endcase
    end
end


// Tx data selection (latching)
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxData <=#Tp 0;
  else
  if(TxStartFrm_sync2 & ~TxStartFrm)
    case(TxPointerLSB)  // synopsys parallel_case
      2'h0 : TxData <=#Tp TxData_wb[31:24];                  // Big Endian Byte Ordering
      2'h1 : TxData <=#Tp TxData_wb[23:16];                  // Big Endian Byte Ordering
      2'h2 : TxData <=#Tp TxData_wb[15:08];                  // Big Endian Byte Ordering
      2'h3 : TxData <=#Tp TxData_wb[07:00];                  // Big Endian Byte Ordering
    endcase
  else
  if(TxStartFrm & TxUsedData & TxPointerLSB==2'h3)
    TxData <=#Tp TxData_wb[31:24];                           // Big Endian Byte Ordering
  else
  if(TxUsedData & Flop)
    begin
      case(TxByteCnt)  // synopsys parallel_case
        0 : TxData <=#Tp TxDataLatched[31:24];               // Big Endian Byte Ordering
        1 : TxData <=#Tp TxDataLatched[23:16];
        2 : TxData <=#Tp TxDataLatched[15:8];
        3 : TxData <=#Tp TxDataLatched[7:0];
      endcase
    end
end


// Latching tx data
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxDataLatched[31:0] <=#Tp 32'h0;
  else
 if(TxStartFrm_sync2 & ~TxStartFrm | TxUsedData & Flop & TxByteCnt == 2'h3 | TxStartFrm & TxUsedData & Flop & TxByteCnt == 2'h0)
    TxDataLatched[31:0] <=#Tp TxData_wb[31:0];
end


// Tx under run
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxUnderRun_wb <=#Tp 1'b0;
  else
  if(TxAbortPulse)
    TxUnderRun_wb <=#Tp 1'b0;
  else
  if(TxBufferEmpty & ReadTxDataFromFifo_wb)
    TxUnderRun_wb <=#Tp 1'b1;
end


reg TxUnderRun_sync1;

// Tx under run
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxUnderRun_sync1 <=#Tp 1'b0;
  else
  if(TxUnderRun_wb)
    TxUnderRun_sync1 <=#Tp 1'b1;
  else
  if(BlockingTxStatusWrite_sync2)
    TxUnderRun_sync1 <=#Tp 1'b0;
end

// Tx under run
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxUnderRun <=#Tp 1'b0;
  else
  if(BlockingTxStatusWrite_sync2)
    TxUnderRun <=#Tp 1'b0;
  else
  if(TxUnderRun_sync1)
    TxUnderRun <=#Tp 1'b1;
end


// Tx Byte counter
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxByteCnt <=#Tp 2'h0;
  else
  if(TxAbort_q | TxRetry_q)
    TxByteCnt <=#Tp 2'h0;
  else
  if(TxStartFrm & ~TxUsedData)
    case(TxPointerLSB)  // synopsys parallel_case
      2'h0 : TxByteCnt <=#Tp 2'h1;
      2'h1 : TxByteCnt <=#Tp 2'h2;
      2'h2 : TxByteCnt <=#Tp 2'h3;
      2'h3 : TxByteCnt <=#Tp 2'h0;
    endcase
  else
  if(TxUsedData & Flop)
    TxByteCnt <=#Tp TxByteCnt + 1'b1;
end


// Start: Generation of the ReadTxDataFromFifo_tck signal and synchronization to the WB_CLK_I
reg ReadTxDataFromFifo_sync1;
reg ReadTxDataFromFifo_sync2;
reg ReadTxDataFromFifo_sync3;
reg ReadTxDataFromFifo_syncb1;
reg ReadTxDataFromFifo_syncb2;
reg ReadTxDataFromFifo_syncb3;


always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_tck <=#Tp 1'b0;
  else
  if(TxStartFrm_sync2 & ~TxStartFrm | TxUsedData & Flop & TxByteCnt == 2'h3 & ~LastWord | TxStartFrm & TxUsedData & Flop & TxByteCnt == 2'h0)
     ReadTxDataFromFifo_tck <=#Tp 1'b1;
  else
  if(ReadTxDataFromFifo_syncb2 & ~ReadTxDataFromFifo_syncb3)
    ReadTxDataFromFifo_tck <=#Tp 1'b0;
end

// Synchronizing TxStartFrm_wb to MTxClk
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_sync1 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_sync1 <=#Tp ReadTxDataFromFifo_tck;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_sync2 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_sync2 <=#Tp ReadTxDataFromFifo_sync1;
end

always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_syncb1 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_syncb1 <=#Tp ReadTxDataFromFifo_sync2;
end

always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_syncb2 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_syncb2 <=#Tp ReadTxDataFromFifo_syncb1;
end

always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_syncb3 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_syncb3 <=#Tp ReadTxDataFromFifo_syncb2;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_sync3 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_sync3 <=#Tp ReadTxDataFromFifo_sync2;
end

assign ReadTxDataFromFifo_wb = ReadTxDataFromFifo_sync2 & ~ReadTxDataFromFifo_sync3;
// End: Generation of the ReadTxDataFromFifo_tck signal and synchronization to the WB_CLK_I


// Synchronizing TxRetry signal (synchronized to WISHBONE clock)
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetrySync1 <=#Tp 1'b0;
  else
    TxRetrySync1 <=#Tp TxRetry;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetry_wb <=#Tp 1'b0;
  else
    TxRetry_wb <=#Tp TxRetrySync1;
end


// Synchronized TxDone_wb signal (synchronized to WISHBONE clock)
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDoneSync1 <=#Tp 1'b0;
  else
    TxDoneSync1 <=#Tp TxDone;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDone_wb <=#Tp 1'b0;
  else
    TxDone_wb <=#Tp TxDoneSync1;
end

// Synchronizing TxAbort signal (synchronized to WISHBONE clock)
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortSync1 <=#Tp 1'b0;
  else
    TxAbortSync1 <=#Tp TxAbort;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbort_wb <=#Tp 1'b0;
  else
    TxAbort_wb <=#Tp TxAbortSync1;
end


reg RxAbortSync1;
reg RxAbortSync2;
reg RxAbortSync3;
reg RxAbortSync4;
reg RxAbortSyncb1;
reg RxAbortSyncb2;

assign StartRxBDRead = RxStatusWrite | RxAbortSync3 & ~RxAbortSync4;

// Reading the Rx buffer descriptor
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxBDRead <=#Tp 1'b1;
  else
  if(StartRxBDRead & ~RxReady)
    RxBDRead <=#Tp 1'b1;
  else
  if(RxBDReady)
    RxBDRead <=#Tp 1'b0;
end


// Reading of the next receive buffer descriptor starts after reception status is
// written to the previous one.

// Latching READY status of the Rx buffer descriptor
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxBDReady <=#Tp 1'b0;
  else
  if(RxPointerRead)
    RxBDReady <=#Tp 1'b0;
  else
  if(RxEn & RxEn_q & RxBDRead)
    RxBDReady <=#Tp ram_do[15]; // RxBDReady is sampled only once at the beginning
end

// Latching Rx buffer descriptor status
// Data is avaliable one cycle after the access is started (at that time signal RxEn is not active)
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxStatus <=#Tp 2'h0;
  else
  if(RxEn & RxEn_q & RxBDRead)
    RxStatus <=#Tp ram_do[14:13];
end


// RxReady generation
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxReady <=#Tp 1'b0;
  else
  if(ShiftEnded | RxAbortSync2 & ~RxAbortSync3)
    RxReady <=#Tp 1'b0;
  else
  if(RxEn & RxEn_q & RxPointerRead)
    RxReady <=#Tp 1'b1;
end


// Reading Rx BD pointer


assign StartRxPointerRead = RxBDRead & RxBDReady;

// Reading Tx BD Pointer
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxPointerRead <=#Tp 1'b0;
  else
  if(StartRxPointerRead)
    RxPointerRead <=#Tp 1'b1;
  else
  if(RxEn & RxEn_q)
    RxPointerRead <=#Tp 1'b0;
end


//Latching Rx buffer pointer from buffer descriptor;
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxPointerMSB <=#Tp 30'h0;
  else
  if(RxEn & RxEn_q & RxPointerRead)
    RxPointerMSB <=#Tp ram_do[31:2];
  else
  if(MasterWbRX & m_wb_ack_i)
      RxPointerMSB <=#Tp RxPointerMSB + 1; // Word access  (always word access. m_wb_sel_o are used for selecting bytes)
end


//Latching last addresses from buffer descriptor (used as byte-half-word indicator);
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxPointerLSB_rst[1:0] <=#Tp 0;
  else
  if(MasterWbRX & m_wb_ack_i)                 // After first write all RxByteSel are active
    RxPointerLSB_rst[1:0] <=#Tp 0;
  else
  if(RxEn & RxEn_q & RxPointerRead)
    RxPointerLSB_rst[1:0] <=#Tp ram_do[1:0];
end


always @ (RxPointerLSB_rst)
begin
  case(RxPointerLSB_rst[1:0])  // synopsys parallel_case
    2'h0 : RxByteSel[3:0] = 4'hf;
    2'h1 : RxByteSel[3:0] = 4'h7;
    2'h2 : RxByteSel[3:0] = 4'h3;
    2'h3 : RxByteSel[3:0] = 4'h1;
  endcase
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxEn_needed <=#Tp 1'b0;
  else
  if(~RxReady & r_RxEn & WbEn & ~WbEn_q)
    RxEn_needed <=#Tp 1'b1;
  else
  if(RxPointerRead & RxEn & RxEn_q)
    RxEn_needed <=#Tp 1'b0;
end


// Reception status is written back to the buffer descriptor after the end of frame is detected.
assign RxStatusWrite = ShiftEnded & RxEn & RxEn_q;

reg RxEnableWindow;

// Indicating that last byte is being reveived
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LastByteIn <=#Tp 1'b0;
  else
  if(ShiftWillEnd & (&RxByteCnt) | RxAbort)
    LastByteIn <=#Tp 1'b0;
  else
  if(RxValid & RxReady & RxEndFrm & ~(&RxByteCnt) & RxEnableWindow)
    LastByteIn <=#Tp 1'b1;
end

reg ShiftEnded_rck;
reg ShiftEndedSync1;
reg ShiftEndedSync2;
reg ShiftEndedSync3;
reg ShiftEndedSync_c1;
reg ShiftEndedSync_c2;

wire StartShiftWillEnd;
assign StartShiftWillEnd = LastByteIn  | RxValid & RxEndFrm & (&RxByteCnt) & RxEnableWindow;

// Indicating that data reception will end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftWillEnd <=#Tp 1'b0;
  else
  if(ShiftEnded_rck | RxAbort)
    ShiftWillEnd <=#Tp 1'b0;
  else
  if(StartShiftWillEnd)
    ShiftWillEnd <=#Tp 1'b1;
end



// Receive byte counter
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxByteCnt <=#Tp 2'h0;
  else
  if(ShiftEnded_rck | RxAbort)
    RxByteCnt <=#Tp 2'h0;
  else
  if(RxValid & RxStartFrm & RxReady)
    case(RxPointerLSB_rst)  // synopsys parallel_case
      2'h0 : RxByteCnt <=#Tp 2'h1;
      2'h1 : RxByteCnt <=#Tp 2'h2;
      2'h2 : RxByteCnt <=#Tp 2'h3;
      2'h3 : RxByteCnt <=#Tp 2'h0;
    endcase
  else
  if(RxValid & RxEnableWindow & RxReady | LastByteIn)
    RxByteCnt <=#Tp RxByteCnt + 1'b1;
end


// Indicates how many bytes are valid within the last word
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxValidBytes <=#Tp 2'h1;
  else
  if(RxValid & RxStartFrm)
    case(RxPointerLSB_rst)  // synopsys parallel_case
      2'h0 : RxValidBytes <=#Tp 2'h1;
      2'h1 : RxValidBytes <=#Tp 2'h2;
      2'h2 : RxValidBytes <=#Tp 2'h3;
      2'h3 : RxValidBytes <=#Tp 2'h0;
    endcase
  else
  if(RxValid & ~LastByteIn & ~RxStartFrm & RxEnableWindow)
    RxValidBytes <=#Tp RxValidBytes + 1;
end


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxDataLatched1       <=#Tp 24'h0;
  else
  if(RxValid & RxReady & ~LastByteIn)
    if(RxStartFrm)
    begin
      case(RxPointerLSB_rst)     // synopsys parallel_case
        2'h0:        RxDataLatched1[31:24] <=#Tp RxData;            // Big Endian Byte Ordering
        2'h1:        RxDataLatched1[23:16] <=#Tp RxData;
        2'h2:        RxDataLatched1[15:8]  <=#Tp RxData;
        2'h3:        RxDataLatched1        <=#Tp RxDataLatched1;
      endcase
    end
    else if (RxEnableWindow)
    begin
      case(RxByteCnt)     // synopsys parallel_case
        2'h0:        RxDataLatched1[31:24] <=#Tp RxData;            // Big Endian Byte Ordering
        2'h1:        RxDataLatched1[23:16] <=#Tp RxData;
        2'h2:        RxDataLatched1[15:8]  <=#Tp RxData;
        2'h3:        RxDataLatched1        <=#Tp RxDataLatched1;
      endcase
    end
end

wire SetWriteRxDataToFifo;

// Assembling data that will be written to the rx_fifo
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxDataLatched2 <=#Tp 32'h0;
  else
  if(SetWriteRxDataToFifo & ~ShiftWillEnd)
    RxDataLatched2 <=#Tp {RxDataLatched1[31:8], RxData};              // Big Endian Byte Ordering
  else
  if(SetWriteRxDataToFifo & ShiftWillEnd)
    case(RxValidBytes)  // synopsys parallel_case
      0 : RxDataLatched2 <=#Tp {RxDataLatched1[31:8],  RxData};       // Big Endian Byte Ordering
      1 : RxDataLatched2 <=#Tp {RxDataLatched1[31:24], 24'h0};
      2 : RxDataLatched2 <=#Tp {RxDataLatched1[31:16], 16'h0};
      3 : RxDataLatched2 <=#Tp {RxDataLatched1[31:8],   8'h0};
    endcase
end


reg WriteRxDataToFifoSync1;
reg WriteRxDataToFifoSync2;
reg WriteRxDataToFifoSync3;


// Indicating start of the reception process
assign SetWriteRxDataToFifo = (RxValid & RxReady & ~RxStartFrm & RxEnableWindow & (&RxByteCnt)) | 
                              (RxValid & RxReady &  RxStartFrm & (&RxPointerLSB_rst))           | 
                              (ShiftWillEnd & LastByteIn & (&RxByteCnt));

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifo <=#Tp 1'b0;
  else
  if(SetWriteRxDataToFifo & ~RxAbort)
    WriteRxDataToFifo <=#Tp 1'b1;
  else
  if(WriteRxDataToFifoSync2 | RxAbort)
    WriteRxDataToFifo <=#Tp 1'b0;
end



always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifoSync1 <=#Tp 1'b0;
  else
  if(WriteRxDataToFifo)
    WriteRxDataToFifoSync1 <=#Tp 1'b1;
  else
    WriteRxDataToFifoSync1 <=#Tp 1'b0;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifoSync2 <=#Tp 1'b0;
  else
    WriteRxDataToFifoSync2 <=#Tp WriteRxDataToFifoSync1;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifoSync3 <=#Tp 1'b0;
  else
    WriteRxDataToFifoSync3 <=#Tp WriteRxDataToFifoSync2;
end

wire WriteRxDataToFifo_wb;
assign WriteRxDataToFifo_wb = WriteRxDataToFifoSync2 & ~WriteRxDataToFifoSync3;


reg LatchedRxStartFrm;
reg SyncRxStartFrm;
reg SyncRxStartFrm_q;
reg SyncRxStartFrm_q2;
wire RxFifoReset;

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedRxStartFrm <=#Tp 0;
  else
  if(RxStartFrm & ~SyncRxStartFrm_q)
    LatchedRxStartFrm <=#Tp 1;
  else
  if(SyncRxStartFrm_q)
    LatchedRxStartFrm <=#Tp 0;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    SyncRxStartFrm <=#Tp 0;
  else
  if(LatchedRxStartFrm)
    SyncRxStartFrm <=#Tp 1;
  else
    SyncRxStartFrm <=#Tp 0;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    SyncRxStartFrm_q <=#Tp 0;
  else
    SyncRxStartFrm_q <=#Tp SyncRxStartFrm;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    SyncRxStartFrm_q2 <=#Tp 0;
  else
    SyncRxStartFrm_q2 <=#Tp SyncRxStartFrm_q;
end


assign RxFifoReset = SyncRxStartFrm_q & ~SyncRxStartFrm_q2;


eth_fifo #(`ETH_RX_FIFO_DATA_WIDTH, `ETH_RX_FIFO_DEPTH, `ETH_RX_FIFO_CNT_WIDTH)
rx_fifo (.data_in(RxDataLatched2),                      .data_out(m_wb_dat_o), 
         .clk(WB_CLK_I),                                .reset(Reset), 
         .write(WriteRxDataToFifo_wb & ~RxBufferFull),  .read(MasterWbRX & m_wb_ack_i), 
         .clear(RxFifoReset),                           .full(RxBufferFull), 
         .almost_full(),                                .almost_empty(RxBufferAlmostEmpty), 
         .empty(RxBufferEmpty),                         .cnt(rxfifo_cnt)
        );

assign enough_data_in_rxfifo_for_burst = rxfifo_cnt>=`ETH_BURST_LENGTH;
assign enough_data_in_rxfifo_for_burst_plus1 = rxfifo_cnt>`ETH_BURST_LENGTH;
assign WriteRxDataToMemory = ~RxBufferEmpty;
assign rx_burst = rx_burst_en & WriteRxDataToMemory;


// Generation of the end-of-frame signal
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftEnded_rck <=#Tp 1'b0;
  else
  if(~RxAbort & SetWriteRxDataToFifo & StartShiftWillEnd)
    ShiftEnded_rck <=#Tp 1'b1;
  else
  if(RxAbort | ShiftEndedSync_c1 & ShiftEndedSync_c2)
    ShiftEnded_rck <=#Tp 1'b0;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync1 <=#Tp 1'b0;
  else
    ShiftEndedSync1 <=#Tp ShiftEnded_rck;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync2 <=#Tp 1'b0;
  else
    ShiftEndedSync2 <=#Tp ShiftEndedSync1;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync3 <=#Tp 1'b0;
  else
  if(ShiftEndedSync1 & ~ShiftEndedSync2)
    ShiftEndedSync3 <=#Tp 1'b1;
  else
  if(ShiftEnded)
    ShiftEndedSync3 <=#Tp 1'b0;
end

// Generation of the end-of-frame signal
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEnded <=#Tp 1'b0;
  else
  if(ShiftEndedSync3 & MasterWbRX & m_wb_ack_i & RxBufferAlmostEmpty & ~ShiftEnded)
    ShiftEnded <=#Tp 1'b1;
  else
  if(RxStatusWrite)
    ShiftEnded <=#Tp 1'b0;
end

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync_c1 <=#Tp 1'b0;
  else
    ShiftEndedSync_c1 <=#Tp ShiftEndedSync2;
end

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync_c2 <=#Tp 1'b0;
  else
    ShiftEndedSync_c2 <=#Tp ShiftEndedSync_c1;
end

// Generation of the end-of-frame signal
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxEnableWindow <=#Tp 1'b0;
  else
  if(RxStartFrm)
    RxEnableWindow <=#Tp 1'b1;
  else
  if(RxEndFrm | RxAbort)
    RxEnableWindow <=#Tp 1'b0;
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync1 <=#Tp 1'b0;
  else
    RxAbortSync1 <=#Tp RxAbortLatched;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync2 <=#Tp 1'b0;
  else
    RxAbortSync2 <=#Tp RxAbortSync1;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync3 <=#Tp 1'b0;
  else
    RxAbortSync3 <=#Tp RxAbortSync2;
end

always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync4 <=#Tp 1'b0;
  else
    RxAbortSync4 <=#Tp RxAbortSync3;
end

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbortSyncb1 <=#Tp 1'b0;
  else
    RxAbortSyncb1 <=#Tp RxAbortSync2;
end

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbortSyncb2 <=#Tp 1'b0;
  else
    RxAbortSyncb2 <=#Tp RxAbortSyncb1;
end


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbortLatched <=#Tp 1'b0;
  else
  if(RxAbortSyncb2)
    RxAbortLatched <=#Tp 1'b0;
  else
  if(RxAbort)
    RxAbortLatched <=#Tp 1'b1;
end


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedRxLength[15:0] <=#Tp 16'h0;
  else
  if(LoadRxStatus)
    LatchedRxLength[15:0] <=#Tp RxLength[15:0];
end


assign RxStatusIn = {ReceivedPauseFrm, AddressMiss, RxOverrun, InvalidSymbol, DribbleNibble, ReceivedPacketTooBig, ShortFrame, LatchedCrcError, RxLateCollision};

always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxStatusInLatched <=#Tp 'h0;
  else
  if(LoadRxStatus)
    RxStatusInLatched <=#Tp RxStatusIn;
end


// Rx overrun
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxOverrun <=#Tp 1'b0;
  else
  if(RxStatusWrite)
    RxOverrun <=#Tp 1'b0;
  else
  if(RxBufferFull & WriteRxDataToFifo_wb)
    RxOverrun <=#Tp 1'b1;
end



wire TxError;
assign TxError = TxUnderRun | RetryLimit | LateCollLatched | CarrierSenseLost;

wire RxError;

// ShortFrame (RxStatusInLatched[2]) can not set an error because short frames
// are aborted when signal r_RecSmall is set to 0 in MODER register. 
// AddressMiss is identifying that a frame was received because of the promiscous
// mode and is not an error
assign RxError = (|RxStatusInLatched[6:3]) | (|RxStatusInLatched[1:0]);



reg RxStatusWriteLatched;
reg RxStatusWriteLatched_sync1;
reg RxStatusWriteLatched_sync2;
reg RxStatusWriteLatched_syncb1;
reg RxStatusWriteLatched_syncb2;


// Latching and synchronizing RxStatusWrite signal. This signal is used for clearing the ReceivedPauseFrm signal
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxStatusWriteLatched <=#Tp 1'b0;
  else
  if(RxStatusWriteLatched_syncb2)
    RxStatusWriteLatched <=#Tp 1'b0;        
  else
  if(RxStatusWrite)
    RxStatusWriteLatched <=#Tp 1'b1;
end


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxStatusWriteLatched_sync1 <=#Tp 1'b0;
      RxStatusWriteLatched_sync2 <=#Tp 1'b0;
    end
  else
    begin
      RxStatusWriteLatched_sync1 <=#Tp RxStatusWriteLatched;
      RxStatusWriteLatched_sync2 <=#Tp RxStatusWriteLatched_sync1;
    end
end


always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      RxStatusWriteLatched_syncb1 <=#Tp 1'b0;
      RxStatusWriteLatched_syncb2 <=#Tp 1'b0;
    end
  else
    begin
      RxStatusWriteLatched_syncb1 <=#Tp RxStatusWriteLatched_sync2;
      RxStatusWriteLatched_syncb2 <=#Tp RxStatusWriteLatched_syncb1;
    end
end



// Tx Done Interrupt
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxB_IRQ <=#Tp 1'b0;
  else
  if(TxStatusWrite & TxIRQEn)
    TxB_IRQ <=#Tp ~TxError;
  else
    TxB_IRQ <=#Tp 1'b0;
end


// Tx Error Interrupt
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxE_IRQ <=#Tp 1'b0;
  else
  if(TxStatusWrite & TxIRQEn)
    TxE_IRQ <=#Tp TxError;
  else
    TxE_IRQ <=#Tp 1'b0;
end


// Rx Done Interrupt
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxB_IRQ <=#Tp 1'b0;
  else
  if(RxStatusWrite & RxIRQEn & ReceivedPacketGood & (~ReceivedPauseFrm | ReceivedPauseFrm & r_PassAll & (~r_RxFlow)))
    RxB_IRQ <=#Tp (~RxError);
  else
    RxB_IRQ <=#Tp 1'b0;
end


// Rx Error Interrupt
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxE_IRQ <=#Tp 1'b0;
  else
  if(RxStatusWrite & RxIRQEn & (~ReceivedPauseFrm | ReceivedPauseFrm & r_PassAll & (~r_RxFlow)))
    RxE_IRQ <=#Tp RxError;
  else
    RxE_IRQ <=#Tp 1'b0;
end


// Busy Interrupt

reg Busy_IRQ_rck;
reg Busy_IRQ_sync1;
reg Busy_IRQ_sync2;
reg Busy_IRQ_sync3;
reg Busy_IRQ_syncb1;
reg Busy_IRQ_syncb2;


always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Busy_IRQ_rck <=#Tp 1'b0;
  else
  if(RxValid & RxStartFrm & ~RxReady)
    Busy_IRQ_rck <=#Tp 1'b1;
  else
  if(Busy_IRQ_syncb2)
    Busy_IRQ_rck <=#Tp 1'b0;
end

always @ (posedge WB_CLK_I)
begin
    Busy_IRQ_sync1 <=#Tp Busy_IRQ_rck;
    Busy_IRQ_sync2 <=#Tp Busy_IRQ_sync1;
    Busy_IRQ_sync3 <=#Tp Busy_IRQ_sync2;
end

always @ (posedge MRxClk)
begin
    Busy_IRQ_syncb1 <=#Tp Busy_IRQ_sync2;
    Busy_IRQ_syncb2 <=#Tp Busy_IRQ_syncb1;
end

assign Busy_IRQ = Busy_IRQ_sync2 & ~Busy_IRQ_sync3;


         


endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_transmitcontrol.v                                       ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_transmitcontrol.v,v $
// Revision 1.6  2002/11/21 00:16:14  mohor
// When TxUsedData and CtrlMux occur at the same time, byte counter needs
// to be incremented by 2. Signal IncrementByteCntBy2 added for that reason.
//
// Revision 1.5  2002/11/19 17:37:32  mohor
// When control frame (PAUSE) was sent, status was written in the
// eth_wishbone module and both TXB and TXC interrupts were set. Fixed.
// Only TXC interrupt is set.
//
// Revision 1.4  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.3  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.2  2001/09/11 14:17:00  mohor
// Few little NCSIM warnings fixed.
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
// Revision 1.1  2001/07/03 12:51:54  mohor
// Initial release of the MAC Control module.
//
//
//
//
//
//


module eth_transmitcontrol (MTxClk, TxReset, TxUsedDataIn, TxUsedDataOut, TxDoneIn, TxAbortIn, 
                            TxStartFrmIn, TPauseRq, TxUsedDataOutDetected, TxFlow, DlyCrcEn, 
                            TxPauseTV, MAC, TxCtrlStartFrm, TxCtrlEndFrm, SendingCtrlFrm, CtrlMux, 
                            ControlData, WillSendControlFrame, BlockTxDone
                           );

parameter Tp = 1;


input         MTxClk;
input         TxReset;
input         TxUsedDataIn;
input         TxUsedDataOut;
input         TxDoneIn;
input         TxAbortIn;
input         TxStartFrmIn;
input         TPauseRq;
input         TxUsedDataOutDetected;
input         TxFlow;
input         DlyCrcEn;
input  [15:0] TxPauseTV;
input  [47:0] MAC;

output        TxCtrlStartFrm;
output        TxCtrlEndFrm;
output        SendingCtrlFrm;
output        CtrlMux;
output [7:0]  ControlData;
output        WillSendControlFrame;
output        BlockTxDone;

reg           SendingCtrlFrm;
reg           CtrlMux;
reg           WillSendControlFrame;
reg    [3:0]  DlyCrcCnt;
reg    [5:0]  ByteCnt;
reg           ControlEnd_q;
reg    [7:0]  MuxedCtrlData;
reg           TxCtrlStartFrm;
reg           TxCtrlStartFrm_q;
reg           TxCtrlEndFrm;
reg    [7:0]  ControlData;
reg           TxUsedDataIn_q;
reg           BlockTxDone;

wire          IncrementDlyCrcCnt;
wire          ResetByteCnt;
wire          IncrementByteCnt;
wire          ControlEnd;
wire          IncrementByteCntBy2;
wire          EnableCnt;


// A command for Sending the control frame is active (latched)
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    WillSendControlFrame <= #Tp 1'b0;
  else
  if(TxCtrlEndFrm & CtrlMux)
    WillSendControlFrame <= #Tp 1'b0;
  else
  if(TPauseRq & TxFlow)
    WillSendControlFrame <= #Tp 1'b1;
end


// Generation of the transmit control packet start frame
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxCtrlStartFrm <= #Tp 1'b0;
  else
  if(TxUsedDataIn_q & CtrlMux)
    TxCtrlStartFrm <= #Tp 1'b0;
  else
  if(WillSendControlFrame & ~TxUsedDataOut & (TxDoneIn | TxAbortIn | TxStartFrmIn | (~TxUsedDataOutDetected)))
    TxCtrlStartFrm <= #Tp 1'b1;
end



// Generation of the transmit control packet end frame
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxCtrlEndFrm <= #Tp 1'b0;
  else
  if(ControlEnd | ControlEnd_q)
    TxCtrlEndFrm <= #Tp 1'b1;
  else
    TxCtrlEndFrm <= #Tp 1'b0;
end


// Generation of the multiplexer signal (controls muxes for switching between
// normal and control packets)
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    CtrlMux <= #Tp 1'b0;
  else
  if(WillSendControlFrame & ~TxUsedDataOut)
    CtrlMux <= #Tp 1'b1;
  else
  if(TxDoneIn)
    CtrlMux <= #Tp 1'b0;
end



// Generation of the Sending Control Frame signal (enables padding and CRC)
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    SendingCtrlFrm <= #Tp 1'b0;
  else
  if(WillSendControlFrame & TxCtrlStartFrm)
    SendingCtrlFrm <= #Tp 1'b1;
  else
  if(TxDoneIn)
    SendingCtrlFrm <= #Tp 1'b0;
end


always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxUsedDataIn_q <= #Tp 1'b0;
  else
    TxUsedDataIn_q <= #Tp TxUsedDataIn;
end



// Generation of the signal that will block sending the Done signal to the eth_wishbone module
// While sending the control frame
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    BlockTxDone <= #Tp 1'b0;
  else
  if(TxCtrlStartFrm)
    BlockTxDone <= #Tp 1'b1;
  else
  if(TxStartFrmIn)
    BlockTxDone <= #Tp 1'b0;
end


always @ (posedge MTxClk)
begin
  ControlEnd_q     <= #Tp ControlEnd;
  TxCtrlStartFrm_q <= #Tp TxCtrlStartFrm;
end


assign IncrementDlyCrcCnt = CtrlMux & TxUsedDataIn &  ~DlyCrcCnt[2];


// Delayed CRC counter
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    DlyCrcCnt <= #Tp 4'h0;
  else
  if(ResetByteCnt)
    DlyCrcCnt <= #Tp 4'h0;
  else
  if(IncrementDlyCrcCnt)
    DlyCrcCnt <= #Tp DlyCrcCnt + 1'b1;
end

             
assign ResetByteCnt = TxReset | (~TxCtrlStartFrm & (TxDoneIn | TxAbortIn));
assign IncrementByteCnt = CtrlMux & (TxCtrlStartFrm & ~TxCtrlStartFrm_q & ~TxUsedDataIn | TxUsedDataIn & ~ControlEnd);
assign IncrementByteCntBy2 = CtrlMux & TxCtrlStartFrm & (~TxCtrlStartFrm_q) & TxUsedDataIn;     // When TxUsedDataIn and CtrlMux are set at the same time

assign EnableCnt = (~DlyCrcEn | DlyCrcEn & (&DlyCrcCnt[1:0]));
// Byte counter
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    ByteCnt <= #Tp 6'h0;
  else
  if(ResetByteCnt)
    ByteCnt <= #Tp 6'h0;
  else
  if(IncrementByteCntBy2 & EnableCnt)
    ByteCnt <= #Tp (ByteCnt[5:0] ) + 2'h2;
  else
  if(IncrementByteCnt & EnableCnt)
    ByteCnt <= #Tp (ByteCnt[5:0] ) + 1'b1;
end


assign ControlEnd = ByteCnt[5:0] == 6'h22;


// Control data generation (goes to the TxEthMAC module)
always @ (ByteCnt or DlyCrcEn or MAC or TxPauseTV or DlyCrcCnt)
begin
  case(ByteCnt)
    6'h0:    if(~DlyCrcEn | DlyCrcEn & (&DlyCrcCnt[1:0]))
               MuxedCtrlData[7:0] = 8'h01;                   // Reserved Multicast Address
             else
						 	 MuxedCtrlData[7:0] = 8'h0;
    6'h2:      MuxedCtrlData[7:0] = 8'h80;
    6'h4:      MuxedCtrlData[7:0] = 8'hC2;
    6'h6:      MuxedCtrlData[7:0] = 8'h00;
    6'h8:      MuxedCtrlData[7:0] = 8'h00;
    6'hA:      MuxedCtrlData[7:0] = 8'h01;
    6'hC:      MuxedCtrlData[7:0] = MAC[47:40];
    6'hE:      MuxedCtrlData[7:0] = MAC[39:32];
    6'h10:     MuxedCtrlData[7:0] = MAC[31:24];
    6'h12:     MuxedCtrlData[7:0] = MAC[23:16];
    6'h14:     MuxedCtrlData[7:0] = MAC[15:8];
    6'h16:     MuxedCtrlData[7:0] = MAC[7:0];
    6'h18:     MuxedCtrlData[7:0] = 8'h88;                   // Type/Length
    6'h1A:     MuxedCtrlData[7:0] = 8'h08;
    6'h1C:     MuxedCtrlData[7:0] = 8'h00;                   // Opcode
    6'h1E:     MuxedCtrlData[7:0] = 8'h01;
    6'h20:     MuxedCtrlData[7:0] = TxPauseTV[15:8];         // Pause timer value
    6'h22:     MuxedCtrlData[7:0] = TxPauseTV[7:0];
    default:   MuxedCtrlData[7:0] = 8'h0;
  endcase
end


// Latched Control data
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    ControlData[7:0] <= #Tp 8'h0;
  else
  if(~ByteCnt[0])
    ControlData[7:0] <= #Tp MuxedCtrlData[7:0];
end



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_top.v                                                   ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/projects/ethmac/                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  All additional information is available in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: eth_top.v,v $
// Revision 1.46  2003/01/30 13:30:22  tadejm
// Defer indication changed.
//
// Revision 1.45  2003/01/22 13:49:26  tadejm
// When control packets were received, they were ignored in some cases.
//
// Revision 1.44  2003/01/21 12:09:40  mohor
// When receiving normal data frame and RxFlow control was switched on, RXB
// interrupt was not set.
//
// Revision 1.43  2002/11/22 01:57:06  mohor
// Rx Flow control fixed. CF flag added to the RX buffer descriptor. RxAbort
// synchronized.
//
// Revision 1.42  2002/11/21 00:09:19  mohor
// TPauseRq synchronized to tx_clk.
//
// Revision 1.41  2002/11/19 18:13:49  mohor
// r_MiiMRst is not used for resetting the MIIM module. wb_rst used instead.
//
// Revision 1.40  2002/11/19 17:34:25  mohor
// AddressMiss status is connecting to the Rx BD. AddressMiss is identifying
// that a frame was received because of the promiscous mode.
//
// Revision 1.39  2002/11/18 17:31:55  mohor
// wb_rst_i is used for MIIM reset.
//
// Revision 1.38  2002/11/14 18:37:20  mohor
// r_Rst signal does not reset any module any more and is removed from the design.
//
// Revision 1.37  2002/11/13 22:25:36  tadejm
// All modules are reset with wb_rst instead of the r_Rst. Exception is MII module.
//
// Revision 1.36  2002/10/18 17:04:20  tadejm
// Changed BIST scan signals.
//
// Revision 1.35  2002/10/11 13:36:58  mohor
// Typo error fixed. (When using Bist)
//
// Revision 1.34  2002/10/10 16:49:50  mohor
// Signals for WISHBONE B3 compliant interface added.
//
// Revision 1.33  2002/10/10 16:29:30  mohor
// BIST added.
//
// Revision 1.32  2002/09/20 17:12:58  mohor
// CsMiss added. When address between 0x800 and 0xfff is accessed within
// Ethernet Core, error acknowledge is generated.
//
// Revision 1.31  2002/09/12 14:50:17  mohor
// CarrierSenseLost bug fixed when operating in full duplex mode.
//
// Revision 1.30  2002/09/10 10:35:23  mohor
// Ethernet debug registers removed.
//
// Revision 1.29  2002/09/09 13:03:13  mohor
// Error acknowledge is generated when accessing BDs and RST bit in the
// MODER register (r_Rst) is set.
//
// Revision 1.28  2002/09/04 18:44:10  mohor
// Signals related to the control frames connected. Debug registers reg1, 2, 3, 4
// connected.
//
// Revision 1.27  2002/07/25 18:15:37  mohor
// RxAbort changed. Packets received with MRxErr (from PHY) are also
// aborted.
//
// Revision 1.26  2002/07/17 18:51:50  mohor
// EXTERNAL_DMA removed. External DMA not supported.
//
// Revision 1.25  2002/05/03 10:15:50  mohor
// Outputs registered. Reset changed for eth_wishbone module.
//
// Revision 1.24  2002/04/22 14:15:42  mohor
// Wishbone signals are registered when ETH_REGISTERED_OUTPUTS is
// selected in eth_defines.v
//
// Revision 1.23  2002/03/25 13:33:53  mohor
// md_padoen_o changed to md_padoe_o. Signal was always active high, just
// name was incorrect.
//
// Revision 1.22  2002/02/26 16:59:54  mohor
// Small fixes for external/internal DMA missmatches.
//
// Revision 1.21  2002/02/26 16:21:00  mohor
// Interrupts changed in the top file
//
// Revision 1.20  2002/02/18 10:40:17  mohor
// Small fixes.
//
// Revision 1.19  2002/02/16 14:03:44  mohor
// Registered trimmed. Unused registers removed.
//
// Revision 1.18  2002/02/16 13:06:33  mohor
// EXTERNAL_DMA used instead of WISHBONE_DMA.
//
// Revision 1.17  2002/02/16 07:15:27  mohor
// Testbench fixed, code simplified, unused signals removed.
//
// Revision 1.16  2002/02/15 13:49:39  mohor
// RxAbort is connected differently.
//
// Revision 1.15  2002/02/15 11:38:26  mohor
// Changes that were lost when updating from 1.11 to 1.14 fixed.
//
// Revision 1.14  2002/02/14 20:19:11  billditt
// Modified for Address Checking,
// addition of eth_addrcheck.v
//
// Revision 1.13  2002/02/12 17:03:03  mohor
// HASH0 and HASH1 registers added. Registers address width was
// changed to 8 bits.
//
// Revision 1.12  2002/02/11 09:18:22  mohor
// Tx status is written back to the BD.
//
// Revision 1.11  2002/02/08 16:21:54  mohor
// Rx status is written back to the BD.
//
// Revision 1.10  2002/02/06 14:10:21  mohor
// non-DMA host interface added. Select the right configutation in eth_defines.
//
// Revision 1.9  2002/01/23 10:28:16  mohor
// Link in the header changed.
//
// Revision 1.8  2001/12/05 15:00:16  mohor
// RX_BD_NUM changed to TX_BD_NUM (holds number of TX descriptors
// instead of the number of RX descriptors).
//
// Revision 1.7  2001/12/05 10:45:59  mohor
// ETH_RX_BD_ADR register deleted. ETH_RX_BD_NUM is used instead.
//
// Revision 1.6  2001/10/19 11:24:29  mohor
// Number of addresses (wb_adr_i) minimized.
//
// Revision 1.5  2001/10/19 08:43:51  mohor
// eth_timescale.v changed to timescale.v This is done because of the
// simulation of the few cores in a one joined project.
//
// Revision 1.4  2001/10/18 12:07:11  mohor
// Status signals changed, Adress decoding changed, interrupt controller
// added.
//
// Revision 1.3  2001/09/24 15:02:56  mohor
// Defines changed (All precede with ETH_). Small changes because some
// tools generate warnings when two operands are together. Synchronization
// between two clocks domains in eth_wishbonedma.v is changed (due to ASIC
// demands).
//
// Revision 1.2  2001/08/15 14:03:59  mohor
// Signal names changed on the top level for easier pad insertion (ASIC).
//
// Revision 1.1  2001/08/06 14:44:29  mohor
// A define FPGA added to select between Artisan RAM (for ASIC) and Block Ram (For Virtex).
// Include files fixed to contain no path.
// File names and module names changed ta have a eth_ prologue in the name.
// File eth_timescale.v is used to define timescale
// All pin names on the top module are changed to contain _I, _O or _OE at the end.
// Bidirectional signal MDIO is changed to three signals (Mdc_O, Mdi_I, Mdo_O
// and Mdo_OE. The bidirectional signal must be created on the top level. This
// is done due to the ASIC tools.
//
// Revision 1.2  2001/08/02 09:25:31  mohor
// Unconnected signals are now connected.
//
// Revision 1.1  2001/07/30 21:23:42  mohor
// Directory structure changed. Files checked and joind together.
//
//
//
// 



module eth_top
(
  // WISHBONE common
  wb_clk_i, wb_rst_i, wb_dat_i, wb_dat_o, 

  // WISHBONE slave
  wb_adr_i, wb_sel_i, wb_we_i, wb_cyc_i, wb_stb_i, wb_ack_o, wb_err_o, 

  // WISHBONE master
  m_wb_adr_o, m_wb_sel_o, m_wb_we_o, 
  m_wb_dat_o, m_wb_dat_i, m_wb_cyc_o, 
  m_wb_stb_o, m_wb_ack_i, m_wb_err_i, 

`ifdef ETH_WISHBONE_B3
  m_wb_cti_o, m_wb_bte_o, 
`endif

  //TX
  mtx_clk_pad_i, mtxd_pad_o, mtxen_pad_o, mtxerr_pad_o,

  //RX
  mrx_clk_pad_i, mrxd_pad_i, mrxdv_pad_i, mrxerr_pad_i, mcoll_pad_i, mcrs_pad_i, 
  
  // MIIM
  mdc_pad_o, md_pad_i, md_pad_o, md_padoe_o,

  int_o

  // Bist
`ifdef ETH_BIST
  ,
  // debug chain signals
  scanb_rst,      // bist scan reset
  scanb_clk,      // bist scan clock
  scanb_si,       // bist scan serial in
  scanb_so,       // bist scan serial out
  scanb_en        // bist scan shift enable
`endif

);


parameter Tp = 1;


// WISHBONE common
input           wb_clk_i;     // WISHBONE clock
input           wb_rst_i;     // WISHBONE reset
input   [31:0]  wb_dat_i;     // WISHBONE data input
output  [31:0]  wb_dat_o;     // WISHBONE data output
output          wb_err_o;     // WISHBONE error output

// WISHBONE slave
input   [11:2]  wb_adr_i;     // WISHBONE address input
input    [3:0]  wb_sel_i;     // WISHBONE byte select input
input           wb_we_i;      // WISHBONE write enable input
input           wb_cyc_i;     // WISHBONE cycle input
input           wb_stb_i;     // WISHBONE strobe input
output          wb_ack_o;     // WISHBONE acknowledge output

// WISHBONE master
output  [31:0]  m_wb_adr_o;
output   [3:0]  m_wb_sel_o;
output          m_wb_we_o;
input   [31:0]  m_wb_dat_i;
output  [31:0]  m_wb_dat_o;
output          m_wb_cyc_o;
output          m_wb_stb_o;
input           m_wb_ack_i;
input           m_wb_err_i;

`ifdef ETH_WISHBONE_B3
output   [2:0]  m_wb_cti_o;   // Cycle Type Identifier
output   [1:0]  m_wb_bte_o;   // Burst Type Extension
`endif

// Tx
input           mtx_clk_pad_i; // Transmit clock (from PHY)
output   [3:0]  mtxd_pad_o;    // Transmit nibble (to PHY)
output          mtxen_pad_o;   // Transmit enable (to PHY)
output          mtxerr_pad_o;  // Transmit error (to PHY)

// Rx
input           mrx_clk_pad_i; // Receive clock (from PHY)
input    [3:0]  mrxd_pad_i;    // Receive nibble (from PHY)
input           mrxdv_pad_i;   // Receive data valid (from PHY)
input           mrxerr_pad_i;  // Receive data error (from PHY)

// Common Tx and Rx
input           mcoll_pad_i;   // Collision (from PHY)
input           mcrs_pad_i;    // Carrier sense (from PHY)

// MII Management interface
input           md_pad_i;      // MII data input (from I/O cell)
output          mdc_pad_o;     // MII Management data clock (to PHY)
output          md_pad_o;      // MII data output (to I/O cell)
output          md_padoe_o;    // MII data output enable (to I/O cell)

output          int_o;         // Interrupt output

// Bist
`ifdef ETH_BIST
input   scanb_rst;      // bist scan reset
input   scanb_clk;      // bist scan clock
input   scanb_si;       // bist scan serial in
output  scanb_so;       // bist scan serial out
input   scanb_en;       // bist scan shift enable
`endif

wire     [7:0]  r_ClkDiv;
wire            r_MiiNoPre;
wire    [15:0]  r_CtrlData;
wire     [4:0]  r_FIAD;
wire     [4:0]  r_RGAD;
wire            r_WCtrlData;
wire            r_RStat;
wire            r_ScanStat;
wire            NValid_stat;
wire            Busy_stat;
wire            LinkFail;
wire    [15:0]  Prsd;             // Read Status Data (data read from the PHY)
wire            WCtrlDataStart;
wire            RStatStart;
wire            UpdateMIIRX_DATAReg;

wire            TxStartFrm;
wire            TxEndFrm;
wire            TxUsedData;
wire     [7:0]  TxData;
wire            TxRetry;
wire            TxAbort;
wire            TxUnderRun;
wire            TxDone;
wire     [5:0]  CollValid;


reg             WillSendControlFrame_sync1;
reg             WillSendControlFrame_sync2;
reg             WillSendControlFrame_sync3;
reg             RstTxPauseRq;

reg             TxPauseRq_sync1;
reg             TxPauseRq_sync2;
reg             TxPauseRq_sync3;
reg             TPauseRq;


// Connecting Miim module
eth_miim miim1
(
  .Clk(wb_clk_i),                         .Reset(wb_rst_i),                   .Divider(r_ClkDiv), 
  .NoPre(r_MiiNoPre),                     .CtrlData(r_CtrlData),              .Rgad(r_RGAD), 
  .Fiad(r_FIAD),                          .WCtrlData(r_WCtrlData),            .RStat(r_RStat), 
  .ScanStat(r_ScanStat),                  .Mdi(md_pad_i),                     .Mdo(md_pad_o), 
  .MdoEn(md_padoe_o),                     .Mdc(mdc_pad_o),                    .Busy(Busy_stat), 
  .Prsd(Prsd),                            .LinkFail(LinkFail),                .Nvalid(NValid_stat), 
  .WCtrlDataStart(WCtrlDataStart),        .RStatStart(RStatStart),            .UpdateMIIRX_DATAReg(UpdateMIIRX_DATAReg)
);




wire        RegCs;          // Connected to registers
wire [31:0] RegDataOut;     // Multiplexed to wb_dat_o
wire        r_RecSmall;     // Receive small frames
wire        r_LoopBck;      // Loopback
wire        r_TxEn;         // Tx Enable
wire        r_RxEn;         // Rx Enable

wire        MRxDV_Lb;       // Muxed MII receive data valid
wire        MRxErr_Lb;      // Muxed MII Receive Error
wire  [3:0] MRxD_Lb;        // Muxed MII Receive Data
wire        Transmitting;   // Indication that TxEthMAC is transmitting
wire        r_HugEn;        // Huge packet enable
wire        r_DlyCrcEn;     // Delayed CRC enabled
wire [15:0] r_MaxFL;        // Maximum frame length

wire [15:0] r_MinFL;        // Minimum frame length
wire        ShortFrame;
wire        DribbleNibble;  // Extra nibble received
wire        ReceivedPacketTooBig; // Received packet is too big
wire [47:0] r_MAC;          // MAC address
wire        LoadRxStatus;   // Rx status was loaded
wire [31:0] r_HASH0;        // HASH table, lower 4 bytes
wire [31:0] r_HASH1;        // HASH table, upper 4 bytes
wire  [7:0] r_TxBDNum;      // Receive buffer descriptor number
wire  [6:0] r_IPGT;         // 
wire  [6:0] r_IPGR1;        // 
wire  [6:0] r_IPGR2;        // 
wire  [5:0] r_CollValid;    // 
wire [15:0] r_TxPauseTV;    // Transmit PAUSE value
wire        r_TxPauseRq;    // Transmit PAUSE request

wire  [3:0] r_MaxRet;       //
wire        r_NoBckof;      // 
wire        r_ExDfrEn;      // 
wire        TX_BD_NUM_Wr;   // Write enable that writes RX_BD_NUM to the registers.
wire        r_TxFlow;       // Tx flow control enable
wire        r_IFG;          // Minimum interframe gap for incoming packets

wire        TxB_IRQ;        // Interrupt Tx Buffer
wire        TxE_IRQ;        // Interrupt Tx Error
wire        RxB_IRQ;        // Interrupt Rx Buffer
wire        RxE_IRQ;        // Interrupt Rx Error
wire        Busy_IRQ;       // Interrupt Busy (lack of buffers)

wire        DWord;
wire        BDAck;
wire [31:0] BD_WB_DAT_O;    // wb_dat_o that comes from the Wishbone module (for buffer descriptors read/write)
wire        BDCs;           // Buffer descriptor CS
wire        CsMiss;         // When access to the address between 0x800 and 0xfff occurs, acknowledge is set
                            // but data is not valid.

wire        temp_wb_ack_o;
wire [31:0] temp_wb_dat_o;
wire        temp_wb_err_o;

`ifdef ETH_REGISTERED_OUTPUTS
  reg         temp_wb_ack_o_reg;
  reg [31:0]  temp_wb_dat_o_reg;
  reg         temp_wb_err_o_reg;
`endif

assign DWord = &wb_sel_i;
assign RegCs = wb_stb_i & wb_cyc_i & DWord & ~wb_adr_i[11] & ~wb_adr_i[10];   // 0x0   - 0x3FF
assign BDCs  = wb_stb_i & wb_cyc_i & DWord & ~wb_adr_i[11] &  wb_adr_i[10];   // 0x400 - 0x7FF
assign CsMiss = wb_stb_i & wb_cyc_i & DWord & wb_adr_i[11];                   // 0x800 - 0xfFF
assign temp_wb_ack_o = RegCs | BDAck;
assign temp_wb_dat_o = (RegCs & ~wb_we_i)? RegDataOut : BD_WB_DAT_O;
assign temp_wb_err_o = wb_stb_i & wb_cyc_i & (~DWord | CsMiss);

`ifdef ETH_REGISTERED_OUTPUTS
  assign wb_ack_o = temp_wb_ack_o_reg;
  assign wb_dat_o[31:0] = temp_wb_dat_o_reg;
  assign wb_err_o = temp_wb_err_o_reg;
`else
  assign wb_ack_o = temp_wb_ack_o;
  assign wb_dat_o[31:0] = temp_wb_dat_o;
  assign wb_err_o = temp_wb_err_o;
`endif



`ifdef ETH_REGISTERED_OUTPUTS
  always @ (posedge wb_clk_i or posedge wb_rst_i)
  begin
    if(wb_rst_i)
      begin
        temp_wb_ack_o_reg <=#Tp 1'b0;
        temp_wb_dat_o_reg <=#Tp 32'h0;
        temp_wb_err_o_reg <=#Tp 1'b0;
      end
    else
      begin
        temp_wb_ack_o_reg <=#Tp temp_wb_ack_o & ~temp_wb_ack_o_reg;
        temp_wb_dat_o_reg <=#Tp temp_wb_dat_o;
        temp_wb_err_o_reg <=#Tp temp_wb_err_o & ~temp_wb_err_o_reg;
      end
  end
`endif


// Connecting Ethernet registers
eth_registers ethreg1
(
  .DataIn(wb_dat_i),                      .Address(wb_adr_i[9:2]),                    .Rw(wb_we_i), 
  .Cs(RegCs),                             .Clk(wb_clk_i),                             .Reset(wb_rst_i), 
  .DataOut(RegDataOut),                   .r_RecSmall(r_RecSmall), 
  .r_Pad(r_Pad),                          .r_HugEn(r_HugEn),                          .r_CrcEn(r_CrcEn), 
  .r_DlyCrcEn(r_DlyCrcEn),                .r_FullD(r_FullD), 
  .r_ExDfrEn(r_ExDfrEn),                  .r_NoBckof(r_NoBckof),                      .r_LoopBck(r_LoopBck), 
  .r_IFG(r_IFG),                          .r_Pro(r_Pro),                              .r_Iam(), 
  .r_Bro(r_Bro),                          .r_NoPre(r_NoPre),                          .r_TxEn(r_TxEn), 
  .r_RxEn(r_RxEn),                        .Busy_IRQ(Busy_IRQ),                        .RxE_IRQ(RxE_IRQ), 
  .RxB_IRQ(RxB_IRQ),                      .TxE_IRQ(TxE_IRQ),                          .TxB_IRQ(TxB_IRQ), 
  .r_IPGT(r_IPGT), 
  .r_IPGR1(r_IPGR1),                      .r_IPGR2(r_IPGR2),                          .r_MinFL(r_MinFL), 
  .r_MaxFL(r_MaxFL),                      .r_MaxRet(r_MaxRet),                        .r_CollValid(r_CollValid), 
  .r_TxFlow(r_TxFlow),                    .r_RxFlow(r_RxFlow),                        .r_PassAll(r_PassAll), 
  .r_MiiNoPre(r_MiiNoPre),                .r_ClkDiv(r_ClkDiv), 
  .r_WCtrlData(r_WCtrlData),              .r_RStat(r_RStat),                          .r_ScanStat(r_ScanStat), 
  .r_RGAD(r_RGAD),                        .r_FIAD(r_FIAD),                            .r_CtrlData(r_CtrlData), 
  .NValid_stat(NValid_stat),              .Busy_stat(Busy_stat),                   
  .LinkFail(LinkFail),                    .r_MAC(r_MAC),                              .WCtrlDataStart(WCtrlDataStart),
  .RStatStart(RStatStart),                .UpdateMIIRX_DATAReg(UpdateMIIRX_DATAReg),  .Prsd(Prsd), 
  .r_TxBDNum(r_TxBDNum),                  .TX_BD_NUM_Wr(TX_BD_NUM_Wr),                .int_o(int_o),
  .r_HASH0(r_HASH0),                      .r_HASH1(r_HASH1),                          .r_TxPauseRq(r_TxPauseRq), 
  .r_TxPauseTV(r_TxPauseTV),              .RstTxPauseRq(RstTxPauseRq),                .TxCtrlEndFrm(TxCtrlEndFrm), 
  .StartTxDone(StartTxDone),              .TxClk(mtx_clk_pad_i),                      .RxClk(mrx_clk_pad_i), 
  .SetPauseTimer(SetPauseTimer)
  
);



wire  [7:0] RxData;
wire        RxValid;
wire        RxStartFrm;
wire        RxEndFrm;
wire        RxAbort;

wire        WillTransmit;            // Will transmit (to RxEthMAC)
wire        ResetCollision;          // Reset Collision (for synchronizing collision)
wire  [7:0] TxDataOut;               // Transmit Packet Data (to TxEthMAC)
wire        WillSendControlFrame;
wire        ReceiveEnd;
wire        ReceivedPacketGood;
wire        ReceivedLengthOK;
wire        InvalidSymbol;
wire        LatchedCrcError;
wire        RxLateCollision;
wire  [3:0] RetryCntLatched;   
wire  [3:0] RetryCnt;   
wire        StartTxAbort;   
wire        MaxCollisionOccured;   
wire        RetryLimit;   
wire        StatePreamble;   
wire  [1:0] StateData; 

// Connecting MACControl
eth_maccontrol maccontrol1
(
  .MTxClk(mtx_clk_pad_i),                       .TPauseRq(TPauseRq), 
  .TxPauseTV(r_TxPauseTV),                      .TxDataIn(TxData), 
  .TxStartFrmIn(TxStartFrm),                    .TxEndFrmIn(TxEndFrm), 
  .TxUsedDataIn(TxUsedDataIn),                  .TxDoneIn(TxDoneIn), 
  .TxAbortIn(TxAbortIn),                        .MRxClk(mrx_clk_pad_i), 
  .RxData(RxData),                              .RxValid(RxValid), 
  .RxStartFrm(RxStartFrm),                      .RxEndFrm(RxEndFrm),
  .ReceiveEnd(ReceiveEnd),                      .ReceivedPacketGood(ReceivedPacketGood),
  .TxFlow(r_TxFlow), 
  .RxFlow(r_RxFlow),                            .DlyCrcEn(r_DlyCrcEn),
  .MAC(r_MAC),                                  .PadIn(r_Pad | PerPacketPad), 
  .PadOut(PadOut),                              .CrcEnIn(r_CrcEn | PerPacketCrcEn), 
  .CrcEnOut(CrcEnOut),                          .TxReset(wb_rst_i), 
  .RxReset(wb_rst_i),                           .ReceivedLengthOK(ReceivedLengthOK),
  .TxDataOut(TxDataOut),                        .TxStartFrmOut(TxStartFrmOut), 
  .TxEndFrmOut(TxEndFrmOut),                    .TxUsedDataOut(TxUsedData), 
  .TxDoneOut(TxDone),                           .TxAbortOut(TxAbort), 
  .WillSendControlFrame(WillSendControlFrame),  .TxCtrlEndFrm(TxCtrlEndFrm), 
  .ReceivedPauseFrm(ReceivedPauseFrm),          .ControlFrmAddressOK(ControlFrmAddressOK),
  .SetPauseTimer(SetPauseTimer),
  .RxStatusWriteLatched_sync2(RxStatusWriteLatched_sync2),                .r_PassAll(r_PassAll)
);



wire TxCarrierSense;          // Synchronized CarrierSense (to Tx clock)
wire Collision;               // Synchronized Collision

reg CarrierSense_Tx1;
reg CarrierSense_Tx2;
reg Collision_Tx1;
reg Collision_Tx2;

reg RxEnSync;                 // Synchronized Receive Enable
reg CarrierSense_Rx1;
reg RxCarrierSense;           // Synchronized CarrierSense (to Rx clock)
reg WillTransmit_q;
reg WillTransmit_q2;



// Muxed MII receive data valid
assign MRxDV_Lb = r_LoopBck? mtxen_pad_o : mrxdv_pad_i & RxEnSync;

// Muxed MII Receive Error
assign MRxErr_Lb = r_LoopBck? mtxerr_pad_o : mrxerr_pad_i & RxEnSync;

// Muxed MII Receive Data
assign MRxD_Lb[3:0] = r_LoopBck? mtxd_pad_o[3:0] : mrxd_pad_i[3:0];



// Connecting TxEthMAC
eth_txethmac txethmac1
(
  .MTxClk(mtx_clk_pad_i),             .Reset(wb_rst_i),                   .CarrierSense(TxCarrierSense), 
  .Collision(Collision),              .TxData(TxDataOut),                 .TxStartFrm(TxStartFrmOut), 
  .TxUnderRun(TxUnderRun),            .TxEndFrm(TxEndFrmOut),             .Pad(PadOut),  
  .MinFL(r_MinFL),                    .CrcEn(CrcEnOut),                   .FullD(r_FullD), 
  .HugEn(r_HugEn),                    .DlyCrcEn(r_DlyCrcEn),              .IPGT(r_IPGT), 
  .IPGR1(r_IPGR1),                    .IPGR2(r_IPGR2),                    .CollValid(r_CollValid), 
  .MaxRet(r_MaxRet),                  .NoBckof(r_NoBckof),                .ExDfrEn(r_ExDfrEn), 
  .MaxFL(r_MaxFL),                    .MTxEn(mtxen_pad_o),                .MTxD(mtxd_pad_o), 
  .MTxErr(mtxerr_pad_o),              .TxUsedData(TxUsedDataIn),          .TxDone(TxDoneIn), 
  .TxRetry(TxRetry),                  .TxAbort(TxAbortIn),                .WillTransmit(WillTransmit), 
  .ResetCollision(ResetCollision),    .RetryCnt(RetryCnt),                .StartTxDone(StartTxDone), 
  .StartTxAbort(StartTxAbort),        .MaxCollisionOccured(MaxCollisionOccured), .LateCollision(LateCollision),   
  .DeferIndication(DeferIndication),  .StatePreamble(StatePreamble),      .StateData(StateData)   
);




wire  [15:0]  RxByteCnt;
wire          RxByteCntEq0;
wire          RxByteCntGreat2;
wire          RxByteCntMaxFrame;
wire          RxCrcError;
wire          RxStateIdle;
wire          RxStatePreamble;
wire          RxStateSFD;
wire   [1:0]  RxStateData;
wire          AddressMiss;



// Connecting RxEthMAC
eth_rxethmac rxethmac1
(
  .MRxClk(mrx_clk_pad_i),               .MRxDV(MRxDV_Lb),                     .MRxD(MRxD_Lb),
  .Transmitting(Transmitting),          .HugEn(r_HugEn),                      .DlyCrcEn(r_DlyCrcEn), 
  .MaxFL(r_MaxFL),                      .r_IFG(r_IFG),                        .Reset(wb_rst_i),
  .RxData(RxData),                      .RxValid(RxValid),                    .RxStartFrm(RxStartFrm), 
  .RxEndFrm(RxEndFrm),                  .ByteCnt(RxByteCnt), 
  .ByteCntEq0(RxByteCntEq0),            .ByteCntGreat2(RxByteCntGreat2),      .ByteCntMaxFrame(RxByteCntMaxFrame), 
  .CrcError(RxCrcError),                .StateIdle(RxStateIdle),              .StatePreamble(RxStatePreamble), 
  .StateSFD(RxStateSFD),                .StateData(RxStateData),
  .MAC(r_MAC),                          .r_Pro(r_Pro),                        .r_Bro(r_Bro),
  .r_HASH0(r_HASH0),                    .r_HASH1(r_HASH1),                    .RxAbort(RxAbort), 
  .AddressMiss(AddressMiss),            .PassAll(r_PassAll),                  .ControlFrmAddressOK(ControlFrmAddressOK)
);


// MII Carrier Sense Synchronization
always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      CarrierSense_Tx1 <= #Tp 1'b0;
      CarrierSense_Tx2 <= #Tp 1'b0;
    end
  else
    begin
      CarrierSense_Tx1 <= #Tp mcrs_pad_i;
      CarrierSense_Tx2 <= #Tp CarrierSense_Tx1;
    end
end

assign TxCarrierSense = ~r_FullD & CarrierSense_Tx2;


// MII Collision Synchronization
always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      Collision_Tx1 <= #Tp 1'b0;
      Collision_Tx2 <= #Tp 1'b0;
    end
  else
    begin
      Collision_Tx1 <= #Tp mcoll_pad_i;
      if(ResetCollision)
        Collision_Tx2 <= #Tp 1'b0;
      else
      if(Collision_Tx1)
        Collision_Tx2 <= #Tp 1'b1;
    end
end


// Synchronized Collision
assign Collision = ~r_FullD & Collision_Tx2;



// Carrier sense is synchronized to receive clock.
always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      CarrierSense_Rx1 <= #Tp 1'h0;
      RxCarrierSense <= #Tp 1'h0;
    end
  else
    begin
      CarrierSense_Rx1 <= #Tp mcrs_pad_i;
      RxCarrierSense <= #Tp CarrierSense_Rx1;
    end
end


// Delayed WillTransmit
always @ (posedge mrx_clk_pad_i)
begin
  WillTransmit_q <= #Tp WillTransmit;
  WillTransmit_q2 <= #Tp WillTransmit_q;
end 


assign Transmitting = ~r_FullD & WillTransmit_q2;



// Synchronized Receive Enable
always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    RxEnSync <= #Tp 1'b0;
  else
  if(~RxCarrierSense | RxCarrierSense & Transmitting)
    RxEnSync <= #Tp r_RxEn;
end 



// Synchronizing WillSendControlFrame to WB_CLK;
always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    WillSendControlFrame_sync1 <= 1'b0;
  else
    WillSendControlFrame_sync1 <=#Tp WillSendControlFrame;
end

always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    WillSendControlFrame_sync2 <= 1'b0;
  else
    WillSendControlFrame_sync2 <=#Tp WillSendControlFrame_sync1;
end

always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    WillSendControlFrame_sync3 <= 1'b0;
  else
    WillSendControlFrame_sync3 <=#Tp WillSendControlFrame_sync2;
end

always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    RstTxPauseRq <= 1'b0;
  else
    RstTxPauseRq <=#Tp WillSendControlFrame_sync2 & ~WillSendControlFrame_sync3;
end




// TX Pause request Synchronization
always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      TxPauseRq_sync1 <= #Tp 1'b0;
      TxPauseRq_sync2 <= #Tp 1'b0;
      TxPauseRq_sync3 <= #Tp 1'b0;
    end
  else
    begin
      TxPauseRq_sync1 <= #Tp (r_TxPauseRq & r_TxFlow);
      TxPauseRq_sync2 <= #Tp TxPauseRq_sync1;
      TxPauseRq_sync3 <= #Tp TxPauseRq_sync2;
    end
end


always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    TPauseRq <= #Tp 1'b0;
  else
    TPauseRq <= #Tp TxPauseRq_sync2 & (~TxPauseRq_sync3);
end


wire LatchedMRxErr;
reg RxAbort_latch;
reg RxAbort_sync1;
reg RxAbort_sync2;
reg RxAbort_wb;
reg RxAbortRst_sync1;
reg RxAbortRst;

// Synchronizing RxAbort to the WISHBONE clock
always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    RxAbort_latch <= #Tp 1'b0;
  else if(RxAbort | (ShortFrame & ~r_RecSmall) | LatchedMRxErr & ~InvalidSymbol | (ReceivedPauseFrm & (~r_PassAll)))
    RxAbort_latch <= #Tp 1'b1;
  else if(RxAbortRst)
    RxAbort_latch <= #Tp 1'b0;
end

always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      RxAbort_sync1 <= #Tp 1'b0;
      RxAbort_wb    <= #Tp 1'b0;
      RxAbort_wb    <= #Tp 1'b0;
    end
  else
    begin
      RxAbort_sync1 <= #Tp RxAbort_latch;
      RxAbort_wb    <= #Tp RxAbort_sync1;
    end
end

always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      RxAbortRst_sync1 <= #Tp 1'b0;
      RxAbortRst       <= #Tp 1'b0;
    end
  else
    begin
      RxAbortRst_sync1 <= #Tp RxAbort_wb;
      RxAbortRst       <= #Tp RxAbortRst_sync1;
    end
end



// Connecting Wishbone module
eth_wishbone wishbone
(
  .WB_CLK_I(wb_clk_i),                .WB_DAT_I(wb_dat_i), 
  .WB_DAT_O(BD_WB_DAT_O), 

  // WISHBONE slave
  .WB_ADR_I(wb_adr_i[9:2]),           .WB_WE_I(wb_we_i), 
  .BDCs(BDCs),                        .WB_ACK_O(BDAck), 

  .Reset(wb_rst_i), 

  // WISHBONE master
  .m_wb_adr_o(m_wb_adr_o),            .m_wb_sel_o(m_wb_sel_o),                  .m_wb_we_o(m_wb_we_o), 
  .m_wb_dat_i(m_wb_dat_i),            .m_wb_dat_o(m_wb_dat_o),                  .m_wb_cyc_o(m_wb_cyc_o), 
  .m_wb_stb_o(m_wb_stb_o),            .m_wb_ack_i(m_wb_ack_i),                  .m_wb_err_i(m_wb_err_i), 
  
`ifdef ETH_WISHBONE_B3
  .m_wb_cti_o(m_wb_cti_o),            .m_wb_bte_o(m_wb_bte_o), 
`endif
  

    //TX
  .MTxClk(mtx_clk_pad_i),             .TxStartFrm(TxStartFrm),                  .TxEndFrm(TxEndFrm), 
  .TxUsedData(TxUsedData),            .TxData(TxData), 
  .TxRetry(TxRetry),                  .TxAbort(TxAbort),                        .TxUnderRun(TxUnderRun), 
  .TxDone(TxDone), 
  .PerPacketCrcEn(PerPacketCrcEn),    .PerPacketPad(PerPacketPad), 

  // Register
  .r_TxEn(r_TxEn),                    .r_RxEn(r_RxEn),                          .r_TxBDNum(r_TxBDNum), 
  .TX_BD_NUM_Wr(TX_BD_NUM_Wr),        .r_RxFlow(r_RxFlow),                      .r_PassAll(r_PassAll), 

  //RX
  .MRxClk(mrx_clk_pad_i),             .RxData(RxData),                          .RxValid(RxValid), 
  .RxStartFrm(RxStartFrm),            .RxEndFrm(RxEndFrm),                      
  .Busy_IRQ(Busy_IRQ),                .RxE_IRQ(RxE_IRQ),                        .RxB_IRQ(RxB_IRQ), 
  .TxE_IRQ(TxE_IRQ),                  .TxB_IRQ(TxB_IRQ), 

  .RxAbort(RxAbort_wb),               .RxStatusWriteLatched_sync2(RxStatusWriteLatched_sync2), 

  .InvalidSymbol(InvalidSymbol),      .LatchedCrcError(LatchedCrcError),        .RxLength(RxByteCnt),
  .RxLateCollision(RxLateCollision),  .ShortFrame(ShortFrame),                  .DribbleNibble(DribbleNibble),
  .ReceivedPacketTooBig(ReceivedPacketTooBig), .LoadRxStatus(LoadRxStatus),     .RetryCntLatched(RetryCntLatched),
  .RetryLimit(RetryLimit),            .LateCollLatched(LateCollLatched),        .DeferLatched(DeferLatched),   
  .CarrierSenseLost(CarrierSenseLost),.ReceivedPacketGood(ReceivedPacketGood),  .AddressMiss(AddressMiss),
  .ReceivedPauseFrm(ReceivedPauseFrm)
  
`ifdef ETH_BIST
  ,
  .scanb_rst      (scanb_rst),
  .scanb_clk      (scanb_clk),
  .scanb_si       (scanb_si),
  .scanb_so       (scanb_so),
  .scanb_en       (scanb_en)
`endif
);



// Connecting MacStatus module
eth_macstatus macstatus1 
(
  .MRxClk(mrx_clk_pad_i),             .Reset(wb_rst_i),
  .ReceiveEnd(ReceiveEnd),            .ReceivedPacketGood(ReceivedPacketGood),     .ReceivedLengthOK(ReceivedLengthOK), 
  .RxCrcError(RxCrcError),            .MRxErr(MRxErr_Lb),                          .MRxDV(MRxDV_Lb), 
  .RxStateSFD(RxStateSFD),            .RxStateData(RxStateData),                   .RxStatePreamble(RxStatePreamble), 
  .RxStateIdle(RxStateIdle),          .Transmitting(Transmitting),                 .RxByteCnt(RxByteCnt), 
  .RxByteCntEq0(RxByteCntEq0),        .RxByteCntGreat2(RxByteCntGreat2),           .RxByteCntMaxFrame(RxByteCntMaxFrame), 
  .InvalidSymbol(InvalidSymbol),
  .MRxD(MRxD_Lb),                     .LatchedCrcError(LatchedCrcError),           .Collision(mcoll_pad_i),
  .CollValid(r_CollValid),            .RxLateCollision(RxLateCollision),           .r_RecSmall(r_RecSmall),
  .r_MinFL(r_MinFL),                  .r_MaxFL(r_MaxFL),                           .ShortFrame(ShortFrame),
  .DribbleNibble(DribbleNibble),      .ReceivedPacketTooBig(ReceivedPacketTooBig), .r_HugEn(r_HugEn),
  .LoadRxStatus(LoadRxStatus),        .RetryCnt(RetryCnt),                         .StartTxDone(StartTxDone),
  .StartTxAbort(StartTxAbort),        .RetryCntLatched(RetryCntLatched),           .MTxClk(mtx_clk_pad_i),
  .MaxCollisionOccured(MaxCollisionOccured), .RetryLimit(RetryLimit),              .LateCollision(LateCollision),
  .LateCollLatched(LateCollLatched),  .DeferIndication(DeferIndication),           .DeferLatched(DeferLatched),
  .TxStartFrm(TxStartFrmOut),         .StatePreamble(StatePreamble),               .StateData(StateData),
  .CarrierSense(CarrierSense_Tx2),    .CarrierSenseLost(CarrierSenseLost),         .TxUsedData(TxUsedDataIn),
  .LatchedMRxErr(LatchedMRxErr),      .Loopback(r_LoopBck),                        .r_FullD(r_FullD)
);


endmodule
