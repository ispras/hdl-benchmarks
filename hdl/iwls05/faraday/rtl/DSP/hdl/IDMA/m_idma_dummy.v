

`include "x_def.v"


module IDMA  (/* -------- Inputs : --------- */
              /* pin  */ X_IRDn, X_IWRn, X_ISn, X_IAL, X_BMODE, X_MMAP,
                         selECM, PM_bdry_sel,
              /* clkc */ STBY, Awake_h,
              /* core */ T_RSTn, GRST, DSPCLK, GO_Fx, GO_Ex, IDLE_ST_h,
                         ICE_ST_h, ICE_ST, DMDin[15:0],PMOVL_dsp[7:0],
                         DMOVL_dsp[3:0], CMAin[13:12], redoIF_h,
              /* memc */ DWWAIT[2:0], DRWAIT[2:0], DCTL_wei, DOVL_wei,
                         MMR_web,
              /* auto */ STEAL, DSack, DSreqx,
              /* sice */ IDR[23:0], accCM_R, accCM_E, wrCM_R,
              /* bdma */ BDMA_end, BDMA_boot, BCMRD_cyc,
                         BOVL[11:0], BRdataBUF[23:0], BCM_cyc,
                         BSreqx, BM_cyc, ECYC,
`ifdef FD_DFT
             /* dft  */ SCAN_TEST,
`endif


              /* -------- Outputs : -------- */
              /* pin  */ IACKn,
              /* core */ BOOT, DCTL[14:0], DOVL[11:0],
              /* memc */ PMOVL[3:0], DMOVL[3:0],
              /* rego */ idmaDMD_oe, idmaPMD_oe, idmaPMD_do[15:0],
              /* auto */ DSreq, DWRcyc, PWRcyc, DRDcyc, PRDcyc,
              /* CM   */ CM_cs, CM_web, CM_oe,
                         CMo_cs0, CMo_cs1, CMo_cs2, CMo_cs3, CMo_cs4,
                         CMo_cs5, CMo_cs6, CMo_cs7,
                         CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3,
                         CMo_oe4, CMo_oe5, CMo_oe6, CMo_oe7,

              /* -------- Inouts : -------- */
              /* pin  */ T_IAD[15:0], IAD_do[15:0], IAD_oe,
              /* core */ PMDin[15:0], CM_rd[23:0], CM_wd[23:0],
              /* bdma */ GO_STEAL);

input [23:0] BRdataBUF;
input [11:0] BOVL;
input BDMA_end,
      PM_bdry_sel,
      BDMA_boot,
      BCMRD_cyc,
      BCM_cyc,
      BSreqx,
      BM_cyc,
      ECYC;

input  [23:0] CM_rd;

input  [15:0] PMDin;


input [15:0] DMDin,
             T_IAD;
input [7:0]  PMOVL_dsp;
input [3:0]  DMOVL_dsp;
input [2:0]  DWWAIT,
             DRWAIT;
input [23:0] IDR;
input [13:12] CMAin;
input T_RSTn,
      GRST,
      DSPCLK,
      selECM,
      STBY,
      Awake_h,
      X_BMODE,
      X_MMAP,
      X_IRDn,
      X_IWRn,
      X_ISn,
      X_IAL,
      redoIF_h,
      GO_Fx,
      GO_Ex,
      IDLE_ST_h,
      ICE_ST_h,
      ICE_ST,
      DCTL_wei,
      DOVL_wei,
      STEAL,
      DSack,
      DSreqx,
      accCM_R, accCM_E,
      wrCM_R,
      MMR_web;

`ifdef FD_DFT
input SCAN_TEST;
`endif


output [15:0] idmaPMD_do,
              IAD_do;
output [14:0] DCTL;
output [11:0] DOVL;
output [3:0]  PMOVL,
              DMOVL;
output BOOT,
       IACKn,
       DSreq,
       DWRcyc,
       PWRcyc,
       DRDcyc,
       PRDcyc,
       CM_web,
       CM_oe,
       CMo_oe0, CMo_oe1,
       CMo_oe2, CMo_oe3,
       CMo_oe4, CMo_oe5,
       CMo_oe6, CMo_oe7,
       CM_cs,
       CMo_cs0, CMo_cs1,
       CMo_cs2, CMo_cs3,
       CMo_cs4, CMo_cs5,
       CMo_cs6, CMo_cs7,
       idmaDMD_oe,
       idmaPMD_oe,
       IAD_oe,
       GO_STEAL;

output [23:0] CM_wd;




assign  idmaPMD_do[15:0] = 16'b0;
assign  IAD_do[15:0] = 16'b0;		// output part of IDMA D/A bus
assign  DCTL[14:0] = 15'b0;		// IDMA control register
assign  DOVL[11:0] = 12'b0;		// IDMA overlay register
assign  IACKn = 1'b1;			// IDMA access ready acknowledge
assign  DSreq = 1'b0;			// IDMA STEAL cycle request
assign  DWRcyc = 1'b0;			// IDMA DM write (hidden) cycle
assign  PWRcyc = 1'b0;			// IDMA PM write (hidden) cycle
assign  DRDcyc = 1'b0;			// IDMA DM read (hidden) cycle
assign  PRDcyc = 1'b0;			// IDMA PM read (hidden) cycle
assign  idmaDMD_oe = 1'b0;		// idmaPMD_do output to PMD bus in IDMA DM-WR
assign  idmaPMD_oe = 1'b0;		// idmaPMD_do output to PMD bus in IDMA PM-WR
assign  IAD_oe = 1'b0;		        // output-enable of IDMA D/A bus


wire [3:0]  CMOVL;		// index of CM overlay during IDMA or DSP mode

wire GO_CMA;			// enable issuing new CMA
wire CM_we_h, GO_STEAL, BOOT;

wire [15:0] DTMP_H;
wire [7:0]  DTMP_L;

wire CMcs_en, CMcs_nx, CMcs0_nx, CMcs1_nx, CMcs2_nx,
     CMcs3_nx, CMcs4_nx, CMcs5_nx, CMcs6_nx, CMcs7_nx, GO_CMcs;

reg CM_oe, CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3,
    CMo_oe4, CMo_oe5, CMo_oe6, CMo_oe7;

reg RST;

//Reset synchronization

always @(posedge DSPCLK) RST  <= #`db GRST;

//BOOT request

     assign  #`da BOOT = BDMA_boot && !RST;


//Overlay value from BDMA module and instruction.

     assign #`da CMOVL[3:0] = BSreqx  ? BOVL[3:0]  : PMOVL_dsp[3:0];

     assign #`da PMOVL[3:0] = BSreqx  ? BOVL[11:8] : PMOVL_dsp[7:4];

     assign #`da DMOVL[3:0] = BSreqx  ? BOVL[7:4]  : DMOVL_dsp[3:0];


//CM related signals

     assign #`da GO_STEAL = GO_Ex || STEAL || BOOT || STBY || BM_cyc && ECYC;

     assign #`da CMcs_en = !(IDLE_ST_h && !Awake_h && !(DSreqx || BSreqx) ||
                             ICE_ST_h && !(accCM_R || accCM_E))
                             && !selECM ;

     assign #`da GO_CMA = GO_Fx || STEAL || STBY || BOOT || redoIF_h || BM_cyc && ECYC;

     assign #`da GO_CMcs = GO_CMA || IDLE_ST_h || ICE_ST_h;

wire CM_rgn, CMo_rgn;


     assign #`da CM_rgn  = PM_bdry_sel ?  (CMAin[13:12] == 2'b00) :     //4K CM boundry
                                          (CMAin[13] == 1'b0);          //8K CM boundry

     assign #`da CMo_rgn = PM_bdry_sel ?  (CMAin[13:12] == 2'b01) :     //4K CMo boundry
                                          (CMAin[13:12] == 2'b10);      //8K CMo boundry


     assign #`da CMcs_nx  = CM_rgn && CMcs_en;
     assign #`da CMcs0_nx = (CMo_rgn && (CMOVL[3:0] == 4'h0)) && CMcs_en;
     assign #`da CMcs1_nx = (CMo_rgn && (CMOVL[3:0] == 4'h1)) && CMcs_en;
     assign #`da CMcs2_nx = (CMo_rgn && (CMOVL[3:0] == 4'h2)) && CMcs_en;
     assign #`da CMcs3_nx = (CMo_rgn && (CMOVL[3:0] == 4'h3)) && CMcs_en;
     assign #`da CMcs4_nx = (CMo_rgn && (CMOVL[3:0] == 4'h4)) && CMcs_en;
     assign #`da CMcs5_nx = (CMo_rgn && (CMOVL[3:0] == 4'h5)) && CMcs_en;
     assign #`da CMcs6_nx = (CMo_rgn && (CMOVL[3:0] == 4'h6)) && CMcs_en;
     assign #`da CMcs7_nx = (CMo_rgn && (CMOVL[3:0] == 4'h7)) && CMcs_en;


     assign #`da CM_cs   = CMcs_nx  && GO_CMcs ;
     assign #`da CMo_cs0 = CMcs0_nx && GO_CMcs ;
     assign #`da CMo_cs1 = CMcs1_nx && GO_CMcs ;
     assign #`da CMo_cs2 = CMcs2_nx && GO_CMcs ;
     assign #`da CMo_cs3 = CMcs3_nx && GO_CMcs ;
     assign #`da CMo_cs4 = CMcs4_nx && GO_CMcs ;
     assign #`da CMo_cs5 = CMcs5_nx && GO_CMcs ;
     assign #`da CMo_cs6 = CMcs6_nx && GO_CMcs ;
     assign #`da CMo_cs7 = CMcs7_nx && GO_CMcs ;


// Output enables of PM-Code memories :

     always @(posedge DSPCLK)
     begin
        CM_oe   <=#`db CMcs_nx  && GO_CMcs;
        CMo_oe0 <=#`db CMcs0_nx && GO_CMcs;
        CMo_oe1 <=#`db CMcs1_nx && GO_CMcs;
        CMo_oe2 <=#`db CMcs2_nx && GO_CMcs;
        CMo_oe3 <=#`db CMcs3_nx && GO_CMcs;
        CMo_oe4 <=#`db CMcs4_nx && GO_CMcs;
        CMo_oe5 <=#`db CMcs5_nx && GO_CMcs;
        CMo_oe6 <=#`db CMcs6_nx && GO_CMcs;
        CMo_oe7 <=#`db CMcs7_nx && GO_CMcs;
     end

// Data output to PM-Code memory :

     assign #`da CM_wd[23:0] = DSreqx ? {DTMP_H[15:0], DTMP_L[7:0]} :
                               BSreqx && BCMRD_cyc ? BRdataBUF[23:0] : IDR[23:0];


// CM write enable from IDMA port :

     assign #`da CM_we_h = ICE_ST_h ? wrCM_R && GO_Ex
                                    : GO_STEAL && (BCMRD_cyc && BSreqx);

     assign #`d0 CM_web = !CM_we_h;             // for Sync-RAM


endmodule
