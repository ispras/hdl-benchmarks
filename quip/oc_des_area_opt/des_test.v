/////////////////////////////////////////////////////////////////////
////                                                             ////
////  DES TEST BENCH                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          russelmann@hotmail.com                             ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    russelmann@hotmail.com                   ////
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
module test;

reg		clk;
reg	[191:0]	x[64:0];

reg	[191:0]	tmp;

reg	[3:0]	cnt;
integer		select;

wire	[63:0]	desOut;
wire	[63:0]	des_in;
wire	[63:0]	exp_out;

wire	[55:0]	key;
wire	[7:0]	key0, key1, key2, key3, key4, key5, key6, key7;

initial
   begin
	clk=0;
	//            Key            Test data           Out data
	x[00]=192'h0000000000000000_0000000000000000_8CA64DE9C1B123A7;
	x[01]=192'hFFFFFFFFFFFFFFFF_FFFFFFFFFFFFFFFF_7359B2163E4EDC58;
	x[02]=192'h3000000000000000_1000000000000001_958E6E627A05557B;
	x[03]=192'h1111111111111111_1111111111111111_F40379AB9E0EC533;
	x[04]=192'h0123456789ABCDEF_1111111111111111_17668DFC7292532D;
	x[05]=192'h1111111111111111_0123456789ABCDEF_8A5AE1F81AB8F2DD;
	x[06]=192'h0000000000000000_0000000000000000_8CA64DE9C1B123A7;
	x[07]=192'hFEDCBA9876543210_0123456789ABCDEF_ED39D950FA74BCC4;
	x[08]=192'h7CA110454A1A6E57_01A1D6D039776742_690F5B0D9A26939B;
	x[09]=192'h0131D9619DC1376E_5CD54CA83DEF57DA_7A389D10354BD271;
	x[10]=192'h07A1133E4A0B2686_0248D43806F67172_868EBB51CAB4599A;
	x[011]=192'h3849674C2602319E_51454B582DDF440A_7178876E01F19B2A;
	x[012]=192'h04B915BA43FEB5B6_42FD443059577FA2_AF37FB421F8C4095;
	x[013]=192'h0113B970FD34F2CE_059B5E0851CF143A_86A560F10EC6D85B;
	x[014]=192'h0170F175468FB5E6_0756D8E0774761D2_0CD3DA020021DC09;
	x[015]=192'h43297FAD38E373FE_762514B829BF486A_EA676B2CB7DB2B7A;
	x[016]=192'h07A7137045DA2A16_3BDD119049372802_DFD64A815CAF1A0F;
	x[017]=192'h04689104C2FD3B2F_26955F6835AF609A_5C513C9C4886C088;
	x[018]=192'h37D06BB516CB7546_164D5E404F275232_0A2AEEAE3FF4AB77;
	x[019]=192'h1F08260D1AC2465E_6B056E18759F5CCA_EF1BF03E5DFA575A;
	x[020]=192'h584023641ABA6176_004BD6EF09176062_88BF0DB6D70DEE56;
	x[021]=192'h025816164629B007_480D39006EE762F2_A1F9915541020B56;
	x[022]=192'h49793EBC79B3258F_437540C8698F3CFA_6FBF1CAFCFFD0556;
	x[023]=192'h4FB05E1515AB73A7_072D43A077075292_2F22E49BAB7CA1AC;
	x[024]=192'h49E95D6D4CA229BF_02FE55778117F12A_5A6B612CC26CCE4A;
	x[025]=192'h018310DC409B26D6_1D9D5C5018F728C2_5F4C038ED12B2E41;
	x[026]=192'h1C587F1C13924FEF_305532286D6F295A_63FAC0D034D9F793;
	x[027]=192'h0101010101010101_0123456789ABCDEF_617B3A0CE8F07100;
	x[028]=192'h1F1F1F1F0E0E0E0E_0123456789ABCDEF_DB958605F8C8C606;
	x[029]=192'hE0FEE0FEF1FEF1FE_0123456789ABCDEF_EDBFD1C66C29CCC7;
	x[030]=192'h0000000000000000_FFFFFFFFFFFFFFFF_355550B2150E2451;
	x[031]=192'hFFFFFFFFFFFFFFFF_0000000000000000_CAAAAF4DEAF1DBAE;
	x[032]=192'h0123456789ABCDEF_0000000000000000_D5D44FF720683D0D;
	x[033]=192'hFEDCBA9876543210_FFFFFFFFFFFFFFFF_2A2BB008DF97C2F2;

	@(posedge clk);

	$display("\n\nStarting DES Test ...\n");
	
	for(select=0;select<34;select=select+1)
	   begin
	   	tmp=x[select];
		for(cnt=0;cnt<15;cnt=cnt+1)	@(posedge clk);

		#10;
		if(desOut !== exp_out)
			$display("ERROR: (%0d) Expected %x Got %x", select, exp_out, desOut);

		@(posedge clk);
	   end
	$display("\nDES Test Done ...\n\n");
	
	$finish;
   end // end of innitial

always #100 clk=~clk;

assign	key = {key7[7:1],key6[7:1],key5[7:1],key4[7:1],key3[7:1],key2[7:1],key1[7:1],key0[7:1] };
assign	key7 = tmp[191:184];
assign	key6 = tmp[183:176];
assign	key5 = tmp[175:168];
assign	key4 = tmp[167:160];
assign	key3 = tmp[159:152];
assign	key2 = tmp[151:144];
assign	key1 = tmp[143:136];
assign	key0 = tmp[135:128];
assign	des_in = tmp[127:64];
assign	exp_out = tmp[63:0];


oc_des_area_opt u0( .desOut(desOut), .desIn(des_in), .key(key), .roundSel(cnt), .clk(clk));

endmodule
