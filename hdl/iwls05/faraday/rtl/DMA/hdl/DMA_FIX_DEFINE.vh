























`define DMA_CHNO_WIDTH ((`DMA_MAX_CHNO >4) ? 3 : ((`DMA_MAX_CHNO >2) ? 2 : 1)) 
`define DMA_FF_CNT_WIDTH (`DMA_FF_ADD_WIDTH+1) 
`define DMA_FF_DEP (1<<`DMA_FF_ADD_WIDTH) 







`define DMA_CHBUSY 8 
`define DMA_CSR_BREN 3 
`define DMA_CSR_M1END 2 
`define DMA_CSR_M0END 1 
`define DMA_CSR_DMAEN 0 

`define DMA_CHCSR_INTTC 31 
`define DMA_CHCSR_RMOD 24 
`define DMA_CHCSR_PRI 23:22 
`define DMA_CHCSR_PR3 21 
`define DMA_CHCSR_PR2 20 
`define DMA_CHCSR_PR1 19 
`define DMA_CHCSR_SSZ 18:16 
`define DMA_CHCSR_ABT 15 
`define DMA_CHCSR_ALD 14 
`define DMA_CHCSR_SWID 13:11 
`define DMA_CHCSR_DWID 10:8 
`define DMA_CHCSR_MOD 7 
`define DMA_CHCSR_INCS 6 
`define DMA_CHCSR_DECS 5 
`define DMA_CHCSR_INCD 4 
`define DMA_CHCSR_DECD 3 
`define DMA_CHCSR_SRC 2 
`define DMA_CHCSR_DST 1 
`define DMA_CHCSR_EN 0 
`define DMA_CHLLP_SRC 0 

`define DMA_CHCFG_INTTC 0 
`define DMA_CHCFG_INTERR 1 

`define DMA_CHCFG_INTABT 2 


`define DMA_CSR_WIDTH 8 
`define DMA_CHCSR_WIDTH 32 
`define DMA_CHCFG_WIDTH 32 
`define DMA_CHSZ_WIDTH 12 


`define DMA_HDATA_WIDTH 32 
`define DMA_HADDR_WIDTH 32 
`define DMA_HSIZE_WIDTH 3 
`define DMA_HPROT_WIDTH 4 
`define DMA_HRESP_WIDTH 2 
`define DMA_HTRANS_WIDTH 2 
`define DMA_HBURST_WIDTH 3 



`define DMA_HTRANS_IDLE 2'b00 
`define DMA_HTRANS_BUSY 2'b01 
`define DMA_HTRANS_NONSEQ 2'b10 
`define DMA_HTRANS_SEQ 2'b11 


`define DMA_DRW_READ 1'b0 
`define DMA_DRW_WRITE 1'b1 


`define DMA_HBURST_SINGLE 3'b000 
`define DMA_HBURST_INCR 3'b001 
`define DMA_HBURST_WRAP4 3'b010 
`define DMA_HBURST_INCR4 3'b011 
`define DMA_HBURST_WRAP8 3'b100 
`define DMA_HBURST_INCR8 3'b101 
`define DMA_HBURST_WRAP16 3'b110 
`define DMA_HBURST_INCR16 3'b111 


`define DMA_HRESP_OK 2'b00 
`define DMA_HRESP_ERROR 2'b01 
`define DMA_HRESP_RETRY 2'b10 
`define DMA_HRESP_SPLIT 2'b11 


`define DMA_HSIZE_BYTE 3'b000 
`define DMA_HSIZE_HALFWORD 3'b001 
`define DMA_HSIZE_WORD 3'b010 



`define DMA_BSTCNT_WIDTH 9 




`define DMA_M1SLV_NO 16 


`define DMA_M1SNO_WIDTH ((`DMA_M1SLV_NO>8)?4:((`DMA_M1SLV_NO>4)?3:((`DMA_M1SLV_NO>2)?2:1))) 


`define DMA_PRI_LEVEL 4 
`define DMA_PRI_WIDTH (`DMA_PRI_LEVEL>2)? 2 : 1 


