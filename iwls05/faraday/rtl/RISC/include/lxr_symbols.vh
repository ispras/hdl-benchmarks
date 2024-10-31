











































































































`ifdef LXR_SYMBOLS_ 
`else 
`define LXR_SYMBOLS_ 


`define CP0_CVSTAG_ALPHA " M" 
`define CP0_CVSTAG_NUM 16'd392 

`define VPP_EJTAG 

`define TestBase 32'h40400000 
`define MapBase 32'h00800000 
`define MapTop 32'h008fffff 
`define MapTo 32'h40400000 

`define SCAN_OBSRV_WIDTH 1:0 


`define CcntlDInval 0 
`define CcntlIInval 1 
`define CcntlILockOn 2 
`define CcntlILockMode 3 

`define DInval_ CcntlWB[0] 
`define IInval_ CcntlWB[1] 
`define ILockOn_ CcntlWB[2] 
`define ILockMode_ CcntlWB[3] 

`define CEOP_PutC 6'b111100 

`define CEOP_Lxr0 6'b110111 
`define CEOP_Lxr0_PutC 1 
`define CEOP_Lxr0_Clock 10 
`define CEOP_Lxr0_Dhry 1000 
`define CEOP_Lxr0_PTrace 1001 
`define CEOP_Lxr0_Stop 1002 
`define CEOP_Lxr0_TraceAll 1003 
`define CEOP_Lxr0_TraceI 1004 
`define CEOP_Lxr0_TraceD 1005 
`define CEOP_Lxr0_TraceS 1006 
`define CEOP_Lxr0_Exception 1007 
`define CEOP_Lxr0_Continue 1008 
`define CEOP_Lxr0_Finish 1009 

`define LBC_SMUX 6 
`define LBC_NSMUX `LBC_SMUX-1 

`define LM_BASE_LO 10 
`define LM_TOP_HI 15 
`define LM_BASE_RANGE 31:`LM_BASE_LO 
`define LM_TOP_RANGE `LM_TOP_HI:4 
`define LM_BASE_WIDTH 22 
`define LM_TOP_WIDTH 12 
`define BaseLo `LM_BASE_LO 
`define TopHi `LM_TOP_HI 
`define BaseRange `LM_BASE_RANGE 
`define TopRange `LM_TOP_RANGE 

`define RF_IF_MODULE rf_if 
`define REGFILE_MODULE regfile 

`define DmuxModuleName dmux 
`define RegfileModuleName regfile 

`define MonTraceI 0 
`define MonTraceD 1 
`define MonTraceS 2 
`define MonTraceReset 3 
`define MonTraceC0 4 
`define MonTraceXCPN 5 
`define MonTraceRegWrite 6 
`define MonTraceMemWrite 7 
`define MonTraceMemRead 8 
`define MonTracePCTrace 9 
`define MonTraceDisasm 10 
`define MonTraceStall 11 
`define MonTraceStats 12 
`define MonTraceRalu 13 
`define MonTraceLbus 14 
`define MonTraceHi 14 

`define MonPath testbed. 

`define VPP_LMON_TOP 

`define LbcDisable 1'b0 


`define LBA_EB_XCVR 1'b0 







`define LBA_EB_ADDR28 2'b00 



`define LBATestBase 32'h0080_0000 

`define LBATestBase1 32'h00c0_0000 












`define LBA_TSTSET_EN 1'b1 





`define GBWrRdyPER0 (23*2*`BUSCLK) 
`define GBWrRdyPER1 (43*2*`BUSCLK) 


`define EBRuptSetPer (93*2*`SYSCLK) 


`define LBC_EJUMBILICAL_WIDTH (32*3)+6 
`define EJ_LBCUMBILICAL_WIDTH (32*3)+5 


`define VPP_1PIPE 


`define RESET_D1_SD_N_ RESET_D1_R_N 









`define VPP_PRODUCT_LX4180 
`define CP0_PROCESSOR_ID 32'h0000c101 




`define VPP_POP_TESTBED_LMON 
`define RALU_READA_RANGE 9:0 
`define RALU_READB_RANGE 9:0 
`define RALU_WRITEC_RANGE 31:1 

`define SYSCLK 5000 
`define VPP_PRODUCT_RTL 
`define VPP_BOARD_SCAN 
`define CHIP_MODULE_NAME_ chip 




`define VPP_TECH_FARADAY_UMC25 




`define Lx2Parent TC.lx_test_chip 
`define TESTENV_EB 
`define MEM_PATH topsys.EB.memstub. 











`define VPP_SYNC_RESET 
`define negedge_RESETI_N_ 
`define negedge_RESET_D2_R_N_ 
`define negedge_RESET_D2_XR_N_ 
`define negedge_RESET_D2_BR_N_ 
`define negedge_RESET_D2_LR_N_ 
`define negedge_RESET_D2_JR_N_ 
`define negedge_RESET_D2_IR_N_ 
`define negedge_RESET_D2_OR_N_ 
`define negedge_RESET_N_ 
`define negedge_RESET2_N_ 
`define negedge_RESET_R_N_ 
`define negedge_ResetN_R_ 
`define negedge_Reset_N_ 
`define negedge_Reset_R_N_ 
`define negedge_TRESET_N_ 




`define LX_RESET_D1_R_N_ RESET_D1_R_N 
`define LX_RESET_D1_BR_N_ RESET_D1_BR_N 
`define LX_RESET_D1_C1_R_N_ RESET_D1_C1_R_N 
`define LX_RESET_D1_C1_BR_N_ RESET_D1_C1_BR_N 
`define LX_RESET_PWRON_D1_LR_N_ RESET_PWRON_D1_LR_N 
`define LX_RESET_PWRON_C1_N_ RESET_PWRON_C1_N 
`define RESET_D2_R_N_ RESET_D2_R_N 
`define RESET_D2_BR_N_ RESET_D2_BR_N 
`define RESET_D2_LR_N_ RESET_D2_LR_N 
`define RESET_D2_JR_N_ RESET_D2_JR_N 
`define RESET_D2_IR_N_ RESET_D2_IR_N 
`define RESET_D2_OR_N_ RESET_D2_OR_N 
`define VPP_LOCAL_RESET 
`define VPP_SAMPLED_RESET 




`define VPP_POP_SLEEP 
`define VPP_EXPORT_CFG_SLEEPENABLE 
`define CFG_SLEEPENABLE_ CFG_SLEEPENABLE 




`define VPP_EXPORT_LX2_SYSCLK 
`define VPP_EXPORT_LX2_SYSCLKF 
`define VPP_EXPORT_LX2_BUSCLK 
`define VPP_EXPORT_LX2_BUSCLKF 
`define LX2_SYSCLK_ SYSCLK 
`define LX2_BUSCLK_ BUSCLK 
`define LX2_SYSCLKF_ SYSCLKF 
`define LX2_BUSCLKF_ BUSCLKF 
`define LX2_JTAG_CLOCK_ JTAG_CLOCK 








`define VPP_BUS_MUX 
`define VPP_INST_MUX 
`define VPP_DATA_MUX 

`define VPP_InstUpSeg0 
`define VPP_InstUpSeg1 

`define InstUpSeg0 InstStoW 
`define InstUpSeg1 InstWtoC 

`define InstSUpOut InstStoW 
`define InstWUpIn InstStoW 
`define InstWUpOut InstWtoC 
`define InstCUpIn InstWtoC 
`define InstCUpOut InstIF 
`define InstPUpIn InstIF 

`define VPP_DataUpSeg0 
`define VPP_DataUpSeg1 
`define VPP_DataUpSeg2 
`define VPP_DataUpSeg3 
`define VPP_DataUpSeg4 
`define VPP_DataUpSeg5 

`define DataUpSeg0 DataStoW 
`define DataUpSeg1 DataWtoC 
`define DataUpSeg2 DataCtoC1 
`define DataUpSeg3 DataC1toC2 
`define DataUpSeg4 DataC2toC3 
`define DataUpSeg5 DataC3toP 

`define DataSUpOut DataStoW 
`define DataWUpIn DataStoW 
`define DataWUpOut DataWtoC 
`define DataCUpIn DataWtoC 
`define DataCUpOut DataCtoC1 
`define DataC1UpIn DataCtoC1 
`define DataC1UpOut DataC1toC2 
`define DataC2UpIn DataC1toC2 
`define DataC2UpOut DataC2toC3 
`define DataC3UpIn DataC2toC3 
`define DataC3UpOut DataC3toP 
`define DataPUpIn DataC3toP 

`define VPP_DataDownSeg0 
`define VPP_DataDownSeg1 
`define VPP_DataDownSeg2 
`define VPP_DataDownSeg3 
`define VPP_DataDownSeg4 
`define VPP_DataDownSeg5 

`define DataDownSeg0 DataPtoC3 
`define DataDownSeg1 DataC3toC2 
`define DataDownSeg2 DataC2toC1 
`define DataDownSeg3 DataC1toC 
`define DataDownSeg4 DataCtoW 
`define DataDownSeg5 DataWtoS 

`define DataPDownOut DataPtoC3 
`define DataC3DownIn DataPtoC3 
`define DataC3DownOut DataC3toC2 
`define DataC2DownIn DataC3toC2 
`define DataC2DownOut DataC2toC1 
`define DataC1DownIn DataC2toC1 
`define DataC1DownOut DataC1toC 
`define DataCDownIn DataC1toC 
`define DataCDownOut DataCtoW 
`define DataWDownIn DataCtoW 
`define DataWDownOut DataWtoS 
`define DataSDownIn DataWtoS 




`define VPP_POP_CI1 
`define VPP_EXPORT_CI1 
`define CpCond1 CpCond1 




`define VPP_POP_CI2 
`define VPP_EXPORT_CI2 
`define CpCond2 CpCond2 




`define VPP_POP_CI3 
`define VPP_EXPORT_CI3 
`define CpCond3 CpCond3 




`define Ce0ModuleName macw 
`define VPP_POP_CE0 
`define VPP_POP_CE0_MAC 
`define MAC_RES_E_ MAC_RES_E 
`define MAC_HALT_E_R_ MAC_HALT_E_R 
`define MAC_SEL_E_R_ MAC_SEL_E_R 
`define HlEnable 1'b0 
`define MacEnable 1'b1 
`define VPP_UNIMAC 




`define VPP_EXPORT_CE1 
`define CE1_RES_E_ CE1_RES_E 
`define CE1_HALT_E_R_ CE1_HALT_E_R 
`define CE1_SEL_E_R_ CE1_SEL_E_R 








`define VPP_M16 
`define CFG_INST16MEN 1'b1 
































`define VPP_EXPORT_CFG_MEMSEQUENTIAL 




`define VPP_EXPORT_CFG_MEMZEROFIRST 




`define VPP_EXPORT_CFG_MEMFULLWORD 




`define VPP_POP_LBC 







`define VPP_EXPORT_LBUS 




`define LBC_WRITES 16 
`define LBC_NWRITES `LBC_WRITES-1 




`define LBC_READS 8 
`define LBC_NREADS `LBC_READS-1 




`define VPP_EXPORT_CFG_LBCWBDISABLE 




`define BUSCLK_ BUSCLK 
`define LX1_BUSCLK_ BUSCLK 
`define VPP_EXPORT_CFG_LBCSYNCMODE 




`define LBC_COE 10 




`define LBC_TOE 1 




`define LBC_XOE 1 




`define LBC_DOE 8 




`define LINE_ADDR_HI 3 
`define LINE_SIZE 4 
`define LINE_CTR_FIRST 2'b00 
`define LINE_CTR_LAST 2'b11 
`define LINE_CTR_ONE 2'b01 




`define VPP_POP_ICACHE_LX2 
`define VPP_POP_ICACHE_LX1 
`define VPP_POP_ICACHE 
`define IC_MISS_R_ IC_MISS_R 
`define IC_VAL_ IC_VAL 
`define IC_ADDR_HI 10 
`define IC_TAG_EXTRA_SIZE 1 
`define IC_TAG_EXTRA_USED 0 
`define IC_TAG_RD_FILL_ , 1'b1 
`define IC_TAG_MASK 1'b1 
`define VPP_IC_EXTRA_UNUSED 
`define IC_DATA_RAM_ tsyncram_512x32 
`define IC_TAG0_RAM_ tsyncram_128x22 




`define VPP_POP_DCACHE_LX2 
`define VPP_POP_DCACHE_LX1 
`define VPP_POP_DCACHE 
`define DC_MISS_R_ DC_MISS_R 
`define DC_VAL_ DC_VAL 
`define DC_ADDR_HI 10 
`define DC_TAG_EXTRA_SIZE 1 
`define DC_TAG_EXTRA_USED 0 
`define DC_TAG_RD_FILL_ , 1'b1 
`define DC_TAG_MASK 1'b1 
`define VPP_DC_EXTRA_UNUSED 
`define DC_DATA_RAM_ tsyncram_512x32 
`define DC_TAG_RAM_ tsyncram_128x22 





`define CFG_IRAMISROM_ 1'b0 
`define VPP_POP_IRAM_LX2 
`define VPP_POP_IRAM_LX1 
`define VPP_POP_IRAM 
`define IW_MISS_R_ IW_MISS_R 
`define IW_VAL_ IW_VAL 
`define IW_ACK_ IW_ACK 
`define InstOEWS InstOEWS 
`define IW_DATA_RAM_ tsyncram_512x32 
`define VPP_POP_IRAM_VAL_LX2 
`define VPP_POP_IRAM_VAL 
`define IW_VAL_HI 31 
`define IW_VAL_RAM_ tsyncram_4x32 
`define CFG_IWBASE 32'h40000000 
`define CFG_IWTOP 32'h400007ff 
`define IW_ADDR_HI 15 
`define IWR_ADDR_HI 10 









`define VPP_POP_DRAM_LX2 
`define VPP_POP_DRAM_LX1 
`define VPP_POP_DRAM 
`define DW_MISS_R_ 1'b0 
`define DW_VAL_ DW_VAL 
`define DW_ACK_ DW_ACK 
`define DW_DATA_RAM_ tsyncram_512x32 
`define CFG_DWBASE 32'h40010000 
`define CFG_DWTOP 32'h400107ff 
`define DW_ADDR_HI 15 
`define DWR_ADDR_HI 10 




`define VPP_EXPORT_RANGE 
`define CFG_DWBASE_ CFG_DWBASE 
`define CFG_DWTOP_ CFG_DWTOP 
`define CFG_IWBASE_ CFG_IWBASE 
`define CFG_IWTOP_ CFG_IWTOP 




`define EXT_ICREQRAM_R_ EXT_ICREQRAM_R 
`define EXT_DCREQRAM_R_ EXT_DCREQRAM_R 
`define VPP_EXPORT_LMI_RAM_ARB 
`define EXT_IWREQRAM_R_ EXT_IWREQRAM_R 
`define EXT_DWREQRAM_R_ EXT_DWREQRAM_R 


















`define VPP_POP_JTAG 
`define VPP_EXPORT_JTAG 







`define LX_JTAG_ID {4'b0010, 16'h4180, 11'b110} 




`define EJC_ECRPRRST_R_ EJC_ECRPRRST_R 
`define VPP_POP_EJTAG 




`define VPP_POP_PMATCH 
`define EJTAG_RTL_PROCS 4 




`define VPP_POP_IMATCH 
`define VPP_POP_LMI_WATCH 
`define EJTAG_RTL_INSTS 4 




`define VPP_POP_DMATCH 
`define VPP_POP_LMI_WATCH 
`define EJTAG_RTL_DATAS 4 




`define EJTAG_COE 10 




`define EJTAG_TOE 1 




`define EJTAG_XOE 1 




`define EJTAG_DOE 8 




`define VPP_EXPORT_PCTRACE 




`define VPP_EXPORT_CFG_EJTNMINUS1 




`define VPP_EXPORT_CFG_EJTMLOG2 




`define VPP_EXPORT_CFG_EJTBIT0M16 




`define CFG_SEN 1'b0 
`define CFG_SEN_ 1'b0 
`define CFG_SEN_N 1'b1 
`define CFG_TMODE 1'b0 
`define CFG_TMODE_ 1'b0 
`define CFG_TMODE_N 1'b1 
`define CFG_RTMODE 1'b0 




`define VPP_SCAN_MIX_CLOCKS 




`define SCAN_CHAIN_LXR_SEL_ 3'b100 
`define CFG_SCAN_LXR_RANGE_ 3:0 
`define VPP_SCAN_LXR_WIDTH_4 
`define CFG_LXR_SIN_ {4'h0, SIN} 
`define CFG_LXR_SOUT_ {NC_SCAN[3:0], SOUT} 

























`define LX0_MODULE lx0 
`define Lx0Hier lx0 












`define KSEG2_UC_BITS 31:24 
`define KSEG2_UC_VALUE 8'b1111_1111 







`define CFG_LINEADDRFILTER_ 1'b1 



`define CFGEXP_SLEEPENABLE 1'b1 
`define CFGEXP_MEMSEQUENTIAL 1'b1 
`define CFGEXP_MEMZEROFIRST 1'b0 
`define CFGEXP_MEMFULLWORD 1'b0 
`define CFGEXP_LBCWBDISABLE 1'b0 
`define CFGEXP_LBCSYNCMODE 1'b0 
`define CFGEXP_EJTNMINUS1 2'b00 
`define CFGEXP_EJTMLOG2 2'b00 
`define CFGEXP_EJTBIT0M16 1'b0 





`define HALT_DRV_COUNT 3 
`define HALT_DRV_RANGE 2:0 
`define HALT_SIG_COUNT 14 
`define HALT_SIG_RANGE 13:0 

`define HL_HALT_E_INDEX 13 
`define MAC_HALT_E_INDEX 12 
`define CE1_HALT_E_INDEX 11 
`define RALU_HALT_E_INDEX 10 
`define JPT_HALT_M_INDEX 9 
`define DC_HALT_M_INDEX 8 
`define DC_HALT_W_INDEX 7 
`define DW_HALT_W_INDEX 6 
`define DT_HALT_W_INDEX 5 
`define CBUS_HALT_W_INDEX 4 
`define IC_HALT_S_INDEX 3 
`define IW_HALT_S_INDEX 2 
`define IT_HALT_S_INDEX 1 
`define SL_HALT_W_INDEX 0 


`define HL_HALT_E_MASK 14'b10000000000000 
`define MAC_HALT_E_MASK 14'b01000000000000 
`define CE1_HALT_E_MASK 14'b00100000000000 
`define RALU_HALT_E_MASK 14'b00010000000000 
`define JPT_HALT_M_MASK 14'b00001000000000 
`define DC_HALT_M_MASK 14'b00000100000000 
`define DC_HALT_W_MASK 14'b00000010000000 
`define DW_HALT_W_MASK 14'b00000001000000 
`define DT_HALT_W_MASK 14'b00000000100000 
`define CBUS_HALT_W_MASK 14'b00000000010000 
`define IC_HALT_S_MASK 14'b00000000001000 
`define IW_HALT_S_MASK 14'b00000000000100 
`define IT_HALT_S_MASK 14'b00000000000010 
`define SL_HALT_W_MASK 14'b00000000000001 

`define HALT_OBS_LBC_ { HL_HALT_E_R[1] , MAC_HALT_E_R[1] , CE1_HALT_E_R[1] , RALU_HALT_E_R[1] , JPT_HALT_M_R[1] , DC_HALT_M_R[1] , DC_HALT_W_R[1] , DW_HALT_W_R[1] , 1'b0 , CBUS_HALT_W_R[1] , IC_HALT_S_R[1] , IW_HALT_S_R[1] , 1'b0 , SL_HALT_W_R[1] } 
`define HALT_OBS_CE0_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_CE1_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_COP1_ { HL_HALT_E_R[1] , MAC_HALT_E_R[1] , CE1_HALT_E_R[1] , RALU_HALT_E_R[1] , JPT_HALT_M_R[1] , DC_HALT_M_R[1] , DC_HALT_W_R[1] , DW_HALT_W_R[1] , 1'b0 , CBUS_HALT_W_R[1] , IC_HALT_S_R[1] , IW_HALT_S_R[1] , 1'b0 , SL_HALT_W_R[1] } 
`define HALT_OBS_COP2_ { HL_HALT_E_R[1] , MAC_HALT_E_R[1] , CE1_HALT_E_R[1] , RALU_HALT_E_R[1] , JPT_HALT_M_R[1] , DC_HALT_M_R[1] , DC_HALT_W_R[1] , DW_HALT_W_R[1] , 1'b0 , CBUS_HALT_W_R[1] , IC_HALT_S_R[1] , IW_HALT_S_R[1] , 1'b0 , SL_HALT_W_R[1] } 
`define HALT_OBS_COP3_ { HL_HALT_E_R[1] , MAC_HALT_E_R[1] , CE1_HALT_E_R[1] , RALU_HALT_E_R[1] , JPT_HALT_M_R[1] , DC_HALT_M_R[1] , DC_HALT_W_R[1] , DW_HALT_W_R[1] , 1'b0 , CBUS_HALT_W_R[1] , IC_HALT_S_R[1] , IW_HALT_S_R[1] , 1'b0 , SL_HALT_W_R[1] } 
`define HALT_OBS_CORE_ { HL_HALT_E_R[0] , MAC_HALT_E_R[0] , CE1_HALT_E_R[0] , RALU_HALT_E_R[0] , JPT_HALT_M_R[0] , DC_HALT_M_R[0] , DC_HALT_W_R[0] , DW_HALT_W_R[0] , 1'b0 , CBUS_HALT_W_R[0] , IC_HALT_S_R[0] , IW_HALT_S_R[0] , 1'b0 , SL_HALT_W_R[0] } 
`define HALT_OBS_DC_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_DW_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_DT_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_IC_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_IW_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_IT_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_LMIE_ { HL_HALT_E_R[1] , MAC_HALT_E_R[1] , CE1_HALT_E_R[1] , RALU_HALT_E_R[1] , JPT_HALT_M_R[1] , DC_HALT_M_R[1] , DC_HALT_W_R[1] , DW_HALT_W_R[1] , 1'b0 , CBUS_HALT_W_R[1] , IC_HALT_S_R[1] , IW_HALT_S_R[1] , 1'b0 , SL_HALT_W_R[1] } 
`define HALT_OBS_SL_ { HL_HALT_E_R[2] , MAC_HALT_E_R[2] , CE1_HALT_E_R[2] , RALU_HALT_E_R[2] , JPT_HALT_M_R[2] , DC_HALT_M_R[2] , DC_HALT_W_R[2] , DW_HALT_W_R[2] , 1'b0 , CBUS_HALT_W_R[2] , IC_HALT_S_R[2] , IW_HALT_S_R[2] , 1'b0 , SL_HALT_W_R[2] } 
`define HALT_OBS_LMON0_ { `LxrPath0 HL_HALT_E_R[2] , `LxrPath0 MAC_HALT_E_R[2] , `LxrPath0 CE1_HALT_E_R[2] , `LxrPath0 RALU_HALT_E_R[2] , `LxrPath0 JPT_HALT_M_R[2] , `LxrPath0 DC_HALT_M_R[2] , `LxrPath0 DC_HALT_W_R[2] , `LxrPath0 DW_HALT_W_R[2] , 1'b0 , `LxrPath0 CBUS_HALT_W_R[2] , `LxrPath0 IC_HALT_S_R[2] , `LxrPath0 IW_HALT_S_R[2] , 1'b0 , `LxrPath0 SL_HALT_W_R[2] } 
`define HALT_OBS_LMON1_ { `LxrPath1 HL_HALT_E_R[2] , `LxrPath1 MAC_HALT_E_R[2] , `LxrPath1 CE1_HALT_E_R[2] , `LxrPath1 RALU_HALT_E_R[2] , `LxrPath1 JPT_HALT_M_R[2] , `LxrPath1 DC_HALT_M_R[2] , `LxrPath1 DC_HALT_W_R[2] , `LxrPath1 DW_HALT_W_R[2] , 1'b0 , `LxrPath1 CBUS_HALT_W_R[2] , `LxrPath1 IC_HALT_S_R[2] , `LxrPath1 IW_HALT_S_R[2] , 1'b0 , `LxrPath1 SL_HALT_W_R[2] } 
`define HALT_OBS_LMONG0_ { `LxrPath0 \HL_HALT_E_R[2] , `LxrPath0 MAC_HALT_E_R[2] , `LxrPath0 CE1_HALT_E_R[2] , `LxrPath0 \RALU_HALT_E_R[2] , `LxrPath0 \JPT_HALT_M_R[2] , `LxrPath0 \DC_HALT_M_R[2] , `LxrPath0 \DC_HALT_W_R[2] , `LxrPath0 \DW_HALT_W_R[2] , 1'b0 , `LxrPath0 \CBUS_HALT_W_R[2] , `LxrPath0 \IC_HALT_S_R[2] , `LxrPath0 \IW_HALT_S_R[2] , 1'b0 , `LxrPath0 \SL_HALT_W_R[2] } 
`define HALT_OBS_LMONG1_ { `LxrPath1 \HL_HALT_E_R[2] , `LxrPath1 MAC_HALT_E_R[2] , `LxrPath1 CE1_HALT_E_R[2] , `LxrPath1 \RALU_HALT_E_R[2] , `LxrPath1 \JPT_HALT_M_R[2] , `LxrPath1 \DC_HALT_M_R[2] , `LxrPath1 \DC_HALT_W_R[2] , `LxrPath1 \DW_HALT_W_R[2] , 1'b0 , `LxrPath1 \CBUS_HALT_W_R[2] , `LxrPath1 \IC_HALT_S_R[2] , `LxrPath1 \IW_HALT_S_R[2] , 1'b0 , `LxrPath1 \SL_HALT_W_R[2] } 











`ifdef RTL_MON 
`ifdef LOCAL_MON 
`else 
`define LOCAL_MON 
`endif 
`endif 




`ifdef LxrPath0 
`define LxrPath1 `LxrPath0 
`define ChipPath1 `ChipPath0 
`define LBusPath1 `LBusPath0 
`else 
`ifdef TESTENV_CHIP 
`define LxrPath0 topsys.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define LxrPath1 topsys.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define ChipPath0 topsys.`Lx2Parent. 
`define ChipPath1 topsys.`Lx2Parent. 
`define LBusPath0 topsys. 
`define LBusPath1 topsys. 
`else 
`ifdef CL01_LBA_EB_ARBGNT 
`define LxrPath0 topsys.EB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define LxrPath1 topsys.EB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define ChipPath0 topsys.EB.`Lx2Parent. 
`define ChipPath1 topsys.EB.`Lx2Parent. 
`define LBusPath0 topsys.EB. 
`define LBusPath1 topsys.EB. 
`else 
`ifdef CL10_LBA_EB_ARBGNT 
`define LxrPath0 topsys.PB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define LxrPath1 topsys.PB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define ChipPath0 topsys.PB.`Lx2Parent. 
`define ChipPath1 topsys.PB.`Lx2Parent. 
`define LBusPath0 topsys.PB. 
`define LBusPath1 topsys.PB. 
`else 
`ifdef CL11_LBA_EB_ARBGNT 
`define LxrPath0 topsys.EB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define LxrPath1 topsys.PB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define ChipPath0 topsys.EB.`Lx2Parent. 
`define ChipPath1 topsys.PB.`Lx2Parent. 
`define LBusPath0 topsys.EB. 
`define LBusPath1 topsys.PB. 
`else 
`define LxrPath0 topsys.EB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define LxrPath1 topsys.EB.`Lx2Parent.lx2.lx1.`Lx0Hier. 
`define ChipPath0 topsys.EB.`Lx2Parent. 
`define ChipPath1 topsys.EB.`Lx2Parent. 
`define LBusPath0 topsys.EB. 
`define LBusPath1 topsys.EB. 
`endif 
`endif 
`endif 
`endif 
`endif 

`ifdef BUSCLK 
`else 
`define BUSCLK (1*`SYSCLK) 
`endif 
`ifdef CLD_BusClkRatio1to1 
`define BUSCLK (1*`SYSCLK) 
`endif 
`ifdef CLD_BusClkRatio1Plus7 
`define BUSCLK (1*`SYSCLK + 7) 
`endif 
`ifdef CLD_BusClkRatio1Minus11 
`define BUSCLK (1*`SYSCLK - 11) 
`endif 
`ifdef CLD_BusClkRatio3to1 
`define BUSCLK (3*`SYSCLK) 
`endif 
`ifdef CLD_BusClkRatio3Plus9 
`define BUSCLK (3*`SYSCLK + 9) 
`endif 
`ifdef CLD_BusClkRatio3Minus9 
`define BUSCLK (3*`SYSCLK - 9) 
`endif 
`ifdef CLD_BusClkRatio5Plus15 
`define BUSCLK (5*`SYSCLK + 15) 
`endif 
`ifdef CLD_BusClkRatio7Minus17 
`define BUSCLK (7*`SYSCLK - 17) 
`endif 


`ifdef LBA_EB_ARBGNT 
`else 
`define LBA_EB_ARBGNT 2'b01 
`define VPP_POP_EB_TC 
`endif 

`ifdef CL0_LBC_WBDISABLE 
`define LbcWBDisable 1'b0 
`endif 

`ifdef CL1_LBC_WBDISABLE 
`define LbcWBDisable 1'b1 
`endif 




`define LBA_PB_ADDR28 ~`LBA_EB_ADDR28 


`endif 




