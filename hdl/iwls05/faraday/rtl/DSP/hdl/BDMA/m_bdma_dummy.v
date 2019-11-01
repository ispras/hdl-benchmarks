

`include "../../include/x_def.v"


module BDMA (/* ---------- Inputs : ---------- */
              BSreqx, BSack,
              X_MMAP, X_BMODE, T_ED[7:0], T_RSTn,
                        GRST, PM_bdry_sel,
              ENS12, ECS12, ENS13, ECS13,
                        ENS14, ECS14, ENS0,
              DSPCLK, CM_rd[23:0], PMDin[15:0],
                        DMDin[15:0],
              BOOT, GO_STEAL,
              BCNT_we, BCTL_we, BOVL_we, BIAD_we,
                        BEAD_we, selBCNT, selBCTL, selBOVL,
                        selBIAD, selBEAD,
`ifdef FD_DFT
             /* dft  */ SCAN_TEST,
`endif

             /* ---------- Outputs : --------- */
             /* pin  */
             /* auctl*/ BDMWR_cyc, BPMWR_cyc, BDMRD_cyc,
                        BPMRD_cyc, BSreq,
             /* emc  */ BDMAmode, BMpage[7:0], BEAD[13:0],
                        BWdataBUF[7:0], BDIR, BWRn,
                        BWend,
             /* idma */ BDMA_end, BDMA_boot, BCM_cyc, BCMRD_cyc,
                        BRdataBUF[23:0], BOVL[11:0], BM_cyc,
             /* core */ T_BDMA, BPM_cyc, BDM_cyc,
                        BIAD[13:0], BRST,
             /* rego */ BDMAmmio[15:0], bdmaDMD_oe, bdmaPMD_oe
             );

input [23:0] CM_rd;  // Global CM data bus
input [15:0] PMDin;  // Global PM data bus
input [15:0] DMDin;  // Global DM data bus
input [7:0]  T_ED;   // External data bus
input X_MMAP,        // MMAP pin determine if it is boot mode
      X_BMODE,       // BMODE pin determine whether IDMA or BDMA activated
      GO_STEAL,
      //MMR_web,
      PM_bdry_sel,
      T_RSTn,        // Global pin reset
      GRST,          // Global reset
      BSreqx,        // Indication of a byte transfer end
      BSack,
      ENS12,         // Indication of a byte transfering (next state)
      ECS12,
      ENS13,
      ECS13,
      ENS14,
      ECS14,
      ENS0,
      //PPclr_h,
      //GO_Ex,
      DSPCLK,        // Dsp operation clock
      BOOT,          // BOOT mode
      BCNT_we,       // Write strobe of BCNT(3FE4)
      BCTL_we,       // Write strobe of BCTL(3FE3)
      BOVL_we,       // Write strobe of BOVL(3FE9)
      BIAD_we,       // Write strobe of BIAD(3FE1)
      BEAD_we,       // Write strobe of BOVL(3FE2)
      selBCNT,       // Read strobe of BCNT
      selBCTL,       // Read strobe of BCTL
      selBOVL,       // Read strobe of BOVL
      selBIAD,       // Read strobe of BIAD
      selBEAD;       // Read strobe of BEAD

`ifdef FD_DFT
input SCAN_TEST;
`endif

output [23:0] BRdataBUF;    // BDMA read data buffer
output [7:0]  BWdataBUF;    // BDMA write data buffer
output [15:0] BDMAmmio;     // BDMA memory-mapped register
output [13:0] BEAD, BIAD;   // Boot ROM address bus
output [7:0]  BMpage;       // Page index of boot ROM
output [11:0] BOVL;
//output [4:0]  BMWAIT;

output BDMAmode,
       BDMA_boot,
       BDMA_end,
       BSreq,
       BDIR,
       BWRn,
       BDMWR_cyc,
       BPMWR_cyc,
       BDMRD_cyc,
       BPMRD_cyc,
       BCMRD_cyc,
       bdmaDMD_oe,
       bdmaPMD_oe,
       BCM_cyc,
       BPM_cyc,
       BDM_cyc,
       T_BDMA,
       BRST,
       BM_cyc,
       BWend;

assign BRdataBUF[23:0] = 24'b0; // BDMA read data buffer
assign BWdataBUF[7:0] = 8'b0;   // BDMA write data buffer
assign BDMAmmio[15:0] = 16'b0;  // BDMA memory-mapped register
assign BEAD[13:0] = 14'b0;
assign BIAD[13:0] = 14'b0;   	// Boot ROM address bus
assign BMpage[7:0] = 8'b0;      // Page index of boot ROM
assign BOVL[11:0] = 12'b0;

assign BDMAmode = 1'b0;
assign BDMA_boot = 1'b0;
assign BDMA_end = 1'b0;
assign BSreq = 1'b0;
assign BDIR = 1'b0;
assign BWRn = 1'b1;
assign BDMWR_cyc = 1'b0;
assign BPMWR_cyc = 1'b0;
assign BDMRD_cyc = 1'b0;
assign BPMRD_cyc = 1'b0;
assign BCMRD_cyc = 1'b0;
assign bdmaDMD_oe = 1'b0;
assign bdmaPMD_oe = 1'b0;
assign BCM_cyc = 1'b0;
assign BPM_cyc = 1'b0;
assign BDM_cyc = 1'b0;
assign T_BDMA = 1'b0;
assign BRST = 1'b0;
assign BM_cyc = 1'b0;
assign BWend = 1'b0;

endmodule




