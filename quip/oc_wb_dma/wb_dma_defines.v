/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE DMA Definitions                                   ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/wb_dma/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: wb_dma_defines.v,v 1.2 2001/08/15 05:40:30 rudi Exp $
//
//  $Date:   22 Sep 2004 19:16:44  $
//  $Revision:   1.0  $
//  $Author:   kbrunham  $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log:   /pvcs/designs/hdl/oc_wb_dma/wb_dma_defines.v__  $
// 
//    Rev 1.0   22 Sep 2004 19:16:44   kbrunham
// initial version 
// TO, Wed Sep 22 03:16:16 2004
// 
//    Rev 1.0   25 Jun 2003 13:07:34   jpierri
// Initial revision.
//               Revision 1.2  2001/08/15 05:40:30  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//               - Added Section 3.10, describing DMA restart.
//
//               Revision 1.1  2001/07/29 08:57:02  rudi
//
//
//               1) Changed Directory Structure
//               2) Added restart signal (REST)
//
//               Revision 1.2  2001/06/05 10:22:37  rudi
//
//
//               - Added Support of up to 31 channels
//               - Added support for 2,4 and 8 priority levels
//               - Now can have up to 31 channels
//               - Added many configuration items
//               - Changed reset to async
//
//               Revision 1.1.1.1  2001/03/19 13:11:09  rudi
//               Initial Release
//
//
//

`timescale 1ns / 10ps

// Identify how many channels are in this implementation
`define WDMA_CH_COUNT	4

`define WDMA_HAVE_CH1	1
`define WDMA_HAVE_CH2	1
`define WDMA_HAVE_CH3	1

/*
`define WDMA_HAVE_CH4	1
`define WDMA_HAVE_CH5	1
`define WDMA_HAVE_CH6	1
`define WDMA_HAVE_CH7	1
`define WDMA_HAVE_CH8	1
`define WDMA_HAVE_CH9	1
`define WDMA_HAVE_CH10	1
`define WDMA_HAVE_CH11	1
`define WDMA_HAVE_CH12	1
`define WDMA_HAVE_CH13	1
`define WDMA_HAVE_CH14	1
`define WDMA_HAVE_CH15	1
`define WDMA_HAVE_CH16	1
`define WDMA_HAVE_CH17	1
`define WDMA_HAVE_CH18	1
`define WDMA_HAVE_CH19	1
`define WDMA_HAVE_CH20	1
`define WDMA_HAVE_CH21	1
`define WDMA_HAVE_CH22	1
`define WDMA_HAVE_CH23	1
`define WDMA_HAVE_CH24	1
`define WDMA_HAVE_CH25	1
`define WDMA_HAVE_CH26	1
`define WDMA_HAVE_CH27	1
`define WDMA_HAVE_CH28	1
`define WDMA_HAVE_CH29	1
`define WDMA_HAVE_CH30	1
*/

`define WDMA_HAVE_ARS0		1
`define WDMA_HAVE_ARS1		1
`define WDMA_HAVE_ARS2		1
`define WDMA_HAVE_ARS3		1
`define WDMA_HAVE_ARS4		1
`define WDMA_HAVE_ARS5		1
`define WDMA_HAVE_ARS6		1
`define WDMA_HAVE_ARS7		1
`define WDMA_HAVE_ARS8		1
`define WDMA_HAVE_ARS9		1
`define WDMA_HAVE_ARS10		1
`define WDMA_HAVE_ARS11		1
`define WDMA_HAVE_ARS12		1
`define WDMA_HAVE_ARS13		1
`define WDMA_HAVE_ARS14		1
`define WDMA_HAVE_ARS15		1
`define WDMA_HAVE_ARS16		1
`define WDMA_HAVE_ARS17		1
`define WDMA_HAVE_ARS18		1
`define WDMA_HAVE_ARS19		1
`define WDMA_HAVE_ARS20		1
`define WDMA_HAVE_ARS21		1
`define WDMA_HAVE_ARS22		1
`define WDMA_HAVE_ARS23		1
`define WDMA_HAVE_ARS24		1
`define WDMA_HAVE_ARS25		1
`define WDMA_HAVE_ARS26		1
`define WDMA_HAVE_ARS27		1
`define WDMA_HAVE_ARS28		1
`define WDMA_HAVE_ARS29		1
`define WDMA_HAVE_ARS30		1

`define WDMA_HAVE_ED0		1
`define WDMA_HAVE_ED1		1
`define WDMA_HAVE_ED2		1
`define WDMA_HAVE_ED3		1
`define WDMA_HAVE_ED4		1
`define WDMA_HAVE_ED5		1
`define WDMA_HAVE_ED6		1
`define WDMA_HAVE_ED7		1
`define WDMA_HAVE_ED8		1
`define WDMA_HAVE_ED9		1
`define WDMA_HAVE_ED10		1
`define WDMA_HAVE_ED11		1
`define WDMA_HAVE_ED12		1
`define WDMA_HAVE_ED13		1
`define WDMA_HAVE_ED14		1
`define WDMA_HAVE_ED15		1
`define WDMA_HAVE_ED16		1
`define WDMA_HAVE_ED17		1
`define WDMA_HAVE_ED18		1
`define WDMA_HAVE_ED19		1
`define WDMA_HAVE_ED20		1
`define WDMA_HAVE_ED21		1
`define WDMA_HAVE_ED22		1
`define WDMA_HAVE_ED23		1
`define WDMA_HAVE_ED24		1
`define WDMA_HAVE_ED25		1
`define WDMA_HAVE_ED26		1
`define WDMA_HAVE_ED27		1
`define WDMA_HAVE_ED28		1
`define WDMA_HAVE_ED29		1
`define WDMA_HAVE_ED30		1

`define WDMA_HAVE_CBUF0		1
`define WDMA_HAVE_CBUF1		1
`define WDMA_HAVE_CBUF2		1
`define WDMA_HAVE_CBUF3		1
`define WDMA_HAVE_CBUF4		1
`define WDMA_HAVE_CBUF5		1
`define WDMA_HAVE_CBUF6		1
`define WDMA_HAVE_CBUF7		1
`define WDMA_HAVE_CBUF8		1
`define WDMA_HAVE_CBUF9		1
`define WDMA_HAVE_CBUF10	1
`define WDMA_HAVE_CBUF11	1
`define WDMA_HAVE_CBUF12	1
`define WDMA_HAVE_CBUF13	1
`define WDMA_HAVE_CBUF14	1
`define WDMA_HAVE_CBUF15	1
`define WDMA_HAVE_CBUF16	1
`define WDMA_HAVE_CBUF17	1
`define WDMA_HAVE_CBUF18	1
`define WDMA_HAVE_CBUF19	1
`define WDMA_HAVE_CBUF20	1
`define WDMA_HAVE_CBUF21	1
`define WDMA_HAVE_CBUF22	1
`define WDMA_HAVE_CBUF23	1
`define WDMA_HAVE_CBUF24	1
`define WDMA_HAVE_CBUF25	1
`define WDMA_HAVE_CBUF26	1
`define WDMA_HAVE_CBUF27	1
`define WDMA_HAVE_CBUF28	1
`define WDMA_HAVE_CBUF29	1
`define WDMA_HAVE_CBUF30	1

// The two define statements below select the number of priorities
// that the DMA engine supports.
// if WDMA_PRI_8 is defined, 8 levels of priorities are supported. If
// WDMA_PRI_4 is defined then 4 levels of priorities are supported.
// If neither is defined then two levels of priorities are supported.
// WDMA_PRI_4 and WDMA_PRI_8 should never be both defined at the same
// time.

//`define WDMA_PRI_8	1
`define WDMA_PRI_4	1

// This define selects how the slave interface determines if
// the internal register file or pass through mode are selected.
// This should be a simple address decoder. "wb_addr_i" is the
// WISHBONE address bus (32 bits wide).
// NOTE: The entire pass-through mode is implemented in combinatorial
// logic only. So the more address lines we look at and compare here
// the higher will be the initial delay when pass-through mode is selected.
// Here we look at the top 8 address bit. If they are all 1, the
// register file is selected. Use this with caution !!!
`define	WDMA_REG_SEL		(wb_addr_i[31:24] == 8'hff)


// CSR Bits
`define	WDMA_CH_EN		0
`define	WDMA_DST_SEL		1
`define	WDMA_SRC_SEL		2
`define	WDMA_INC_DST		3
`define	WDMA_INC_SRC		4
`define	WDMA_MODE		5
`define	WDMA_ARS		6
`define WDMA_USE_ED		7
`define WDMA_WRB		8
`define	WDMA_STOP		9
`define	WDMA_BUSY		10
`define	WDMA_DONE		11
`define	WDMA_ERR		12
`define WDMA_ED_EOL		20

