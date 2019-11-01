module mega01( clk, in, out );
   input clk;
   input in;
   output out; 
   reg [2:0] rin; 
   always @(posedge clk)
   begin
      rin <= { rin[1], rin[0], in };
   end
   reg rout;
   always @(posedge clk)
   begin
      rout <= rin[1] && !rin[2];
   end
   assign out = rout;
endmodule
module mega02( clk, out );
   input clk;
   output [1:0] out;
   reg [1:0] r;
   always @(posedge clk) r <= r + 2'b01;
   assign out = r;
endmodule
module mod1 (clock, reset, out);
	parameter WIDTH = 36;
	parameter SEED  = 1;
	input clock;
	input reset;
	output [WIDTH-1:0] out;
	parameter NUMT = 4;
	parameter MIN_M    = 5;
	parameter MAX_M    = 32;
	parameter M = (WIDTH < MIN_M) ? MIN_M : ((WIDTH > MAX_M) ? MAX_M : WIDTH);
	parameter WEA = (WIDTH < MIN_M) ? MIN_M : WIDTH;
	reg [WEA:0] n100;
   reg wrse;
	integer set[MIN_M*NUMT:(MAX_M+1)*NUMT-1];
	always begin
		
		
		
		
		
		set[5*NUMT+0] = 5;
		set[5*NUMT+1] = 4;
		set[5*NUMT+2] = 3;
		set[5*NUMT+3] = 2;
		
		set[6*NUMT+0] = 6;
		set[6*NUMT+1] = 5;
		set[6*NUMT+2] = 4;
		set[6*NUMT+3] = 1;
		
		set[7*NUMT+0] = 7;
		set[7*NUMT+1] = 6;
		set[7*NUMT+2] = 5;
		set[7*NUMT+3] = 4;
		
		set[8*NUMT+0] = 8;
		set[8*NUMT+1] = 7;
		set[8*NUMT+2] = 6;
		set[8*NUMT+3] = 1;
		
		set[9*NUMT+0] = 9;
		set[9*NUMT+1] = 8;
		set[9*NUMT+2] = 7;
		set[9*NUMT+3] = 2;
		
		set[10*NUMT+0] = 10;
		set[10*NUMT+1] = 9;
		set[10*NUMT+2] = 8;
		set[10*NUMT+3] = 5;
		
		set[11*NUMT+0] = 11;
		set[11*NUMT+1] = 10;
		set[11*NUMT+2] = 9;
		set[11*NUMT+3] = 7;
		
		set[12*NUMT+0] = 12;
		set[12*NUMT+1] = 11;
		set[12*NUMT+2] = 10;
		set[12*NUMT+3] = 4;
		
		set[13*NUMT+0] = 13;
		set[13*NUMT+1] = 12;
		set[13*NUMT+2] = 11;
		set[13*NUMT+3] = 8;
		
		set[14*NUMT+0] = 14;
		set[14*NUMT+1] = 13;
		set[14*NUMT+2] = 12;
		set[14*NUMT+3] = 2;
		
		set[15*NUMT+0] = 15;
		set[15*NUMT+1] = 14;
		set[15*NUMT+2] = 13;
		set[15*NUMT+3] = 11;
		
		set[16*NUMT+0] = 16;
		set[16*NUMT+1] = 15;
		set[16*NUMT+2] = 13;
		set[16*NUMT+3] = 4;
		
		set[17*NUMT+0] = 17;
		set[17*NUMT+1] = 16;
		set[17*NUMT+2] = 15;
		set[17*NUMT+3] = 14;
		
		set[18*NUMT+0] = 18;
		set[18*NUMT+1] = 17;
		set[18*NUMT+2] = 16;
		set[18*NUMT+3] = 13;
		
		set[19*NUMT+0] = 19;
		set[19*NUMT+1] = 18;
		set[19*NUMT+2] = 17;
		set[19*NUMT+3] = 14;
		
		set[20*NUMT+0] = 20;
		set[20*NUMT+1] = 19;
		set[20*NUMT+2] = 16;
		set[20*NUMT+3] = 14;
		
		set[21*NUMT+0] = 21;
		set[21*NUMT+1] = 20;
		set[21*NUMT+2] = 19;
		set[21*NUMT+3] = 16;
		
		set[22*NUMT+0] = 22;
		set[22*NUMT+1] = 21;
		set[22*NUMT+2] = 20;
		set[22*NUMT+3] = 11;
		
		set[23*NUMT+0] = 23;
		set[23*NUMT+1] = 22;
		set[23*NUMT+2] = 21;
		set[23*NUMT+3] = 16;
		
		set[24*NUMT+0] = 24;
		set[24*NUMT+1] = 23;
		set[24*NUMT+2] = 22;
		set[24*NUMT+3] = 17;
		
		set[25*NUMT+0] = 25;
		set[25*NUMT+1] = 24;
		set[25*NUMT+2] = 23;
		set[25*NUMT+3] = 22;
		
		set[26*NUMT+0] = 26;
		set[26*NUMT+1] = 25;
		set[26*NUMT+2] = 24;
		set[26*NUMT+3] = 20;
		
		set[27*NUMT+0] = 27;
		set[27*NUMT+1] = 26;
		set[27*NUMT+2] = 25;
		set[27*NUMT+3] = 22;
		
		set[28*NUMT+0] = 28;
		set[28*NUMT+1] = 27;
		set[28*NUMT+2] = 26;
		set[28*NUMT+3] = 16;
		
		set[29*NUMT+0] = 29;
		set[29*NUMT+1] = 28;
		set[29*NUMT+2] = 27;
		set[29*NUMT+3] = 25;
		
		set[30*NUMT+0] = 30;
		set[30*NUMT+1] = 29;
		set[30*NUMT+2] = 28;
		set[30*NUMT+3] = 7;
		
		set[31*NUMT+0] = 31;
		set[31*NUMT+1] = 30;
		set[31*NUMT+2] = 29;
		set[31*NUMT+3] = 28;
		
		set[32*NUMT+0] = 32;
		set[32*NUMT+1] = 31;
		set[32*NUMT+2] = 30;
		set[32*NUMT+3] = 10;
   end
	always @(posedge clock) begin
		
		
		
      if ( reset ) begin
         wrse <= 1'b1;
         n100 <= 0;
      end else begin
         if ( wrse) begin
            wrse <= 1'b0;
            n100[0] <= 1'b0;
            n100[WEA:1] <= SEED;
         end else begin
            n100[1] <= n100[set[M*NUMT+0]] ^
                           n100[set[M*NUMT+1]] ^
                           n100[set[M*NUMT+2]] ^
                           n100[set[M*NUMT+3]];
            n100[WEA:2] <= n100[WEA-1:1];
         end
	  	end
	end
	assign out = n100[WIDTH:1];
endmodule
module radar20(
		n101,
		clock,
		n102,
		mode);
	input	n101;
	input	clock;
	input	n102;
	output	[2-1:0]	mode;
	wire	state = ~n101;
	wire	enable = ~n102;
	
	wire [1:0] inter01_a;
	mega02 inst1_4( .clk(state), .out(inter01_a) );
	assign mode[1] = inter01_a[0] ^ inter01_a[1];
	wire n104;
	mega01 pulse( clock, enable, n104 );
	
	wire [181:0] odp;
	mod1 wrapper_lfsr_0(
		.clock(clock),
		.reset( n104 ),
		.out( odp[181:150] ) );
		defparam wrapper_lfsr_0.WIDTH = 32;
		defparam wrapper_lfsr_0.SEED = 32'h15e0321;
	mod1 wrapper_lfsr_1(
		.clock(clock),
		.reset( n104 ),
		.out( odp[149:118] ) );
		defparam wrapper_lfsr_1.WIDTH = 32;
		defparam wrapper_lfsr_1.SEED = 32'h8b9aead1;
	mod1 wrapper_lfsr_2(
		.clock(clock),
		.reset( n104 ),
		.out( odp[117:86] ) );
		defparam wrapper_lfsr_2.WIDTH = 32;
		defparam wrapper_lfsr_2.SEED = 32'h7da6649f;
	mod1 wrapper_lfsr_3(
		.clock(clock),
		.reset( n104 ),
		.out( odp[85:54] ) );
		defparam wrapper_lfsr_3.WIDTH = 32;
		defparam wrapper_lfsr_3.SEED = 32'h3ea03bb9;
	mod1 wrapper_lfsr_4(
		.clock(clock),
		.reset( n104 ),
		.out( odp[53:22] ) );
		defparam wrapper_lfsr_4.WIDTH = 32;
		defparam wrapper_lfsr_4.SEED = 32'h7b820dd3;
	mod1 wrapper_lfsr_5(
		.clock(clock),
		.reset( n104 ),
		.out( odp[21:0] ) );
		defparam wrapper_lfsr_5.WIDTH = 22;
		defparam wrapper_lfsr_5.SEED = 22'h32e9fd;
	
	
	reg inter02_a;
	reg  inter03_a;
	wire inter04_a;
	reg  inter05_a;
	wire inter07_a;
	reg  inter08_a;
	wire inter09_a;
	reg  [3:0] inter10_a;
	wire [3:0] inter11_a;
	reg  inter12_a;
	wire inter13_a;
	reg  [7:0] inter14_a;
	wire [7:0] inter15_a;
	reg  inter16_a;
	wire inter17_a;
	reg  inter18_a;
	wire inter19_a;
	reg  inter20_a;
	wire inter21_a;
	reg  inter22_a;
	wire inter23_a;
	reg  inter24_a;
	wire inter25_a;
	reg  inter26_a;
	wire inter27_a;
	
	
	reg  [11:0] inter28_a;
	wire [11:0] inter29_a;
	reg  [31:0] inter30_a;
	wire [31:0] inter31_a;
	reg  [31:0] inter32_a;
	wire [31:0] inter33_a;
	always @(posedge clock)
		if ( n104 ) begin
			inter03_a <= inter04_a;
			inter05_a <= inter07_a;
			inter08_a <= inter09_a;
			inter10_a <= inter11_a;
			inter12_a <= inter13_a;
			inter14_a <= inter15_a;
			inter16_a <= inter17_a;
			inter18_a <= inter19_a;
			inter20_a <= inter21_a;
			inter22_a <= inter23_a;
			inter24_a <= inter25_a;
			inter26_a <= inter27_a;
			inter28_a <= inter29_a;
			inter30_a <= inter31_a;
			inter32_a <= inter33_a;
			inter02_a <= inter03_a
				^ inter05_a
				^ inter08_a
				^ inter10_a[0]
				^ inter10_a[1]
				^ inter10_a[2]
				^ inter10_a[3]
				^ inter12_a
				^ inter14_a[0]
				^ inter14_a[1]
				^ inter14_a[2]
				^ inter14_a[3]
				^ inter14_a[4]
				^ inter14_a[5]
				^ inter14_a[6]
				^ inter14_a[7]
				^ inter16_a
				^ inter18_a
				^ inter20_a
				^ inter22_a
				^ inter24_a
				^ inter26_a
				^ inter28_a[0]
				^ inter28_a[1]
				^ inter28_a[2]
				^ inter28_a[3]
				^ inter28_a[4]
				^ inter28_a[5]
				^ inter28_a[6]
				^ inter28_a[7]
				^ inter28_a[8]
				^ inter28_a[9]
				^ inter28_a[10]
				^ inter28_a[11]/*
				^ inter28_a[12]
				^ inter28_a[13]
				^ inter28_a[14]
				^ inter28_a[15]
				^ inter28_a[16]
				^ inter28_a[17]
				^ inter28_a[18]
				^ inter28_a[19]*/
				^ inter30_a[0]
				^ inter30_a[1]
				^ inter30_a[2]
				^ inter30_a[3]
				^ inter30_a[4]
				^ inter30_a[5]
				^ inter30_a[6]
				^ inter30_a[7]
				^ inter30_a[8]
				^ inter30_a[9]
				^ inter30_a[10]
				^ inter30_a[11]
				^ inter30_a[12]
				^ inter30_a[13]
				^ inter30_a[14]
				^ inter30_a[15]
				^ inter30_a[16]
				^ inter30_a[17]
				^ inter30_a[18]
				^ inter30_a[19]
				^ inter30_a[20]
				^ inter30_a[21]
				^ inter30_a[22]
				^ inter30_a[23]
				^ inter30_a[24]
				^ inter30_a[25]
				^ inter30_a[26]
				^ inter30_a[27]
				^ inter30_a[28]
				^ inter30_a[29]
				^ inter30_a[30]
				^ inter30_a[31]
				^ inter32_a[0]
				^ inter32_a[1]
				^ inter32_a[2]
				^ inter32_a[3]
				^ inter32_a[4]
				^ inter32_a[5]
				^ inter32_a[6]
				^ inter32_a[7]
				^ inter32_a[8]
				^ inter32_a[9]
				^ inter32_a[10]
				^ inter32_a[11]
				^ inter32_a[12]
				^ inter32_a[13]
				^ inter32_a[14]
				^ inter32_a[15]
				^ inter32_a[16]
				^ inter32_a[17]
				^ inter32_a[18]
				^ inter32_a[19]
				^ inter32_a[20]
				^ inter32_a[21]
				^ inter32_a[22]
				^ inter32_a[23]
				^ inter32_a[24]
				^ inter32_a[25]
				^ inter32_a[26]
				^ inter32_a[27]
				^ inter32_a[28]
				^ inter32_a[29]
				^ inter32_a[30]
				^ inter32_a[31];
				
				
		end
	assign mode[0] = inter02_a || odp[0];
	
	reg  [2:0] interss;
	always @(posedge clock)
	begin
		if (n104 == 1) interss = 3'b000;
		else interss = interss + 3'b001;
	end
	
	/*
	reg XXXXctrl;
	always @(posedge clock)
	begin
		if (n104 == 1) XXXXctrl = 0;
		else if (VA == 5'b01000 && n1051 == 4'b0010 && n1052 == 4'b0000) XXXXctrl = 1;
		else XXXXctrl = 0;
	end
	*/
	
	wire [7:0] XXXXinput;
	assign XXXXinput[7] = (~n104) ? odp[167] : 1'bz;
	assign XXXXinput[6] = (~n104) ? odp[166] : 1'bz;
	assign XXXXinput[5] = (~n104) ? odp[165] : 1'bz;
	assign XXXXinput[4] = (~n104) ? odp[164] : 1'bz;
	assign XXXXinput[3] = (~n104) ? odp[163] : 1'bz;
	assign XXXXinput[2] = (~n104) ? odp[162] : 1'bz;
	assign XXXXinput[1] = (~n104) ? odp[161] : 1'bz;
	assign XXXXinput[0] = (~n104) ? odp[160] : 1'bz;
	/*
	TRI n1037(.in(odp[167]), .oe(~n104), .out(XXXXinput[7]));
	TRI n1036(.in(odp[166]), .oe(~n104), .out(XXXXinput[6]));
	TRI n1035(.in(odp[165]), .oe(~n104), .out(XXXXinput[5]));
	TRI n1034(.in(odp[164]), .oe(~n104), .out(XXXXinput[4]));
	TRI n1033(.in(odp[163]), .oe(~n104), .out(XXXXinput[3]));
	TRI n1032(.in(odp[162]), .oe(~n104), .out(XXXXinput[2]));
	TRI n1031(.in(odp[161]), .oe(~n104), .out(XXXXinput[1]));
	TRI n1030(.in(odp[160]), .oe(~n104), .out(XXXXinput[0]));
	*/
	reg [4:0] VA;
	reg [3:0] n1051;
	reg [3:0] n1052;
	reg [4:0] n114;
	reg [23:0] n106;
	reg [1:0] n113;
	reg [8:0] n1132;
	reg [2:0] n107;
	reg [3:0] n108;
	reg [3:0] n109;
	reg [4:0] n110;
	reg n111;
	reg vxi2c;
	
	wire [31:0] n112;
	assign n112[31] = (~vxi2c) ? n1051[3] : 1'bz;
	assign n112[30] = (~vxi2c) ? n1051[2] : 1'bz;
	assign n112[29] = (~vxi2c) ? n1051[1] : 1'bz;
	assign n112[28] = (~vxi2c) ? n1051[0] : 1'bz;
	assign n112[27] = (~vxi2c) ? n1052[3] : 1'bz;
	assign n112[26] = (~vxi2c) ? n1052[2] : 1'bz;
	assign n112[25] = (~vxi2c) ? n1052[1] : 1'bz;
	assign n112[24] = (~vxi2c) ? n1052[0] : 1'bz;
	assign n112[23] = (~vxi2c) ? n106[23] : 1'bz;
	assign n112[22] = (~vxi2c) ? n106[22] : 1'bz;
	assign n112[21] = (~vxi2c) ? n106[21] : 1'bz;
	assign n112[20] = (~vxi2c) ? n106[20] : 1'bz;
	assign n112[19] = (~vxi2c) ? n106[19] : 1'bz;
	assign n112[18] = (~vxi2c) ? n106[18] : 1'bz;
	assign n112[17] = (~vxi2c) ? n106[17] : 1'bz;
	assign n112[16] = (~vxi2c) ? n106[16] : 1'bz;
	assign n112[15] = (~vxi2c) ? n106[15] : 1'bz;
	assign n112[14] = (~vxi2c) ? n106[14] : 1'bz;
	assign n112[13] = (~vxi2c) ? n106[13] : 1'bz;
	assign n112[12] = (~vxi2c) ? n106[12] : 1'bz;
	assign n112[11] = (~vxi2c) ? n106[11] : 1'bz;
	assign n112[10] = (~vxi2c) ? n106[10] : 1'bz;
	assign n112[9] = (~vxi2c) ? n106[9] : 1'bz;
	assign n112[8] = (~vxi2c) ? n106[8] : 1'bz;
	assign n112[7] = (~vxi2c) ? n106[7] : 1'bz;
	assign n112[6] = (~vxi2c) ? n106[6] : 1'bz;
	assign n112[5] = (~vxi2c) ? n106[5] : 1'bz;
	assign n112[4] = (~vxi2c) ? n106[4] : 1'bz;
	assign n112[3] = (~vxi2c) ? n106[3] : 1'bz;
	assign n112[2] = (~vxi2c) ? n106[2] : 1'bz;
	assign n112[1] = (~vxi2c) ? n106[1] : 1'bz;
	assign n112[0] = (~vxi2c) ? n106[0] : 1'bz;
	/*
	TRI tri31(.in(n1051[3]), .oe(~vxi2c), .out(n112[31]));
	TRI tri30(.in(n1051[2]), .oe(~vxi2c), .out(n112[30]));
	TRI tri29(.in(n1051[1]), .oe(~vxi2c), .out(n112[29]));
	TRI tri28(.in(n1051[0]), .oe(~vxi2c), .out(n112[28]));
	TRI tri27(.in(n1052[3]), .oe(~vxi2c), .out(n112[27]));
	TRI tri26(.in(n1052[2]), .oe(~vxi2c), .out(n112[26]));
	TRI tri25(.in(n1052[1]), .oe(~vxi2c), .out(n112[25]));
	TRI tri24(.in(n1052[0]), .oe(~vxi2c), .out(n112[24]));
	TRI tri23(.in(n106[23]), .oe(~vxi2c), .out(n112[23]));
	TRI tri22(.in(n106[22]), .oe(~vxi2c), .out(n112[22]));
	TRI tri21(.in(n106[21]), .oe(~vxi2c), .out(n112[21]));
	TRI tri20(.in(n106[20]), .oe(~vxi2c), .out(n112[20]));
	TRI tri19(.in(n106[19]), .oe(~vxi2c), .out(n112[19]));
	TRI tri18(.in(n106[18]), .oe(~vxi2c), .out(n112[18]));
	TRI tri17(.in(n106[17]), .oe(~vxi2c), .out(n112[17]));
	TRI tri16(.in(n106[16]), .oe(~vxi2c), .out(n112[16]));
	TRI tri15(.in(n106[15]), .oe(~vxi2c), .out(n112[15]));
	TRI tri14(.in(n106[14]), .oe(~vxi2c), .out(n112[14]));
	TRI tri13(.in(n106[13]), .oe(~vxi2c), .out(n112[13]));
	TRI tri12(.in(n106[12]), .oe(~vxi2c), .out(n112[12]));
	TRI tri11(.in(n106[11]), .oe(~vxi2c), .out(n112[11]));
	TRI tri10(.in(n106[10]), .oe(~vxi2c), .out(n112[10]));
	TRI tri09(.in(n106[9]), .oe(~vxi2c), .out(n112[9]));
	TRI tri08(.in(n106[8]), .oe(~vxi2c), .out(n112[8]));
	TRI tri07(.in(n106[7]), .oe(~vxi2c), .out(n112[7]));
	TRI tri06(.in(n106[6]), .oe(~vxi2c), .out(n112[6]));
	TRI tri05(.in(n106[5]), .oe(~vxi2c), .out(n112[5]));
	TRI tri04(.in(n106[4]), .oe(~vxi2c), .out(n112[4]));
	TRI tri03(.in(n106[3]), .oe(~vxi2c), .out(n112[3]));
	TRI tri02(.in(n106[2]), .oe(~vxi2c), .out(n112[2]));
	TRI tri01(.in(n106[1]), .oe(~vxi2c), .out(n112[1]));
	TRI tri00(.in(n106[0]), .oe(~vxi2c), .out(n112[0]));
	*/
		
	always @(posedge clock)
	begin
		if (n104 == 1)
		begin
			n1051 = 4'b0000;
			n1052 = 4'b0000;
			n114 = 0;
			n113 = 2'b00;
			n1132 = 9'b000000000;
			n111 = 1'b0;
			n107 = 3'b000;
			n108 = 4'b0000;
			n109 = 4'b0000;
			n110 = 5'b00000;
		end
		else
		begin
			case(n114)
				
				
				0:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000000;
						n1051 = 4'b0111;
						n1052 = 4'b1101;
						
						if (n113 == 2'b01)
						begin
							n113 = 2'b00;
							n114 = 1;
						end
						else
						begin
							n113 = n113 + 2'b01;
							n114 = 0;
						end
					end
				
				
				1:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000000;
						n1051 = 4'b0111;
						n1052 = 4'b1110;
						n114 = 2;
					end
				
				
				2:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000000;
						n1051 = 4'b0110;
						n1052 = 4'b0010;
						
						if (n113 == 2'b01)
						begin
							n113 = 2'b00;
							n114 = 3;
						end
						else
						begin
							n113 = n113 + 2'b01;
							n114 = 2;
						end
					end
					
				
				
				3:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000000;
						n1051 = 4'b0110;
						n1052 = 4'b0011;
						n114 = 4;
					end
				
				
				
				4:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000001;
						n111 = 1'b1;
						n1051 = 4'b0111;
						n1052 = 4'b1100;
						
						if (n113 == 2'b01)
						begin
							n113 = 2'b00;
							n114 = 5;
						end
						else
						begin
							n113 = n113 + 2'b01;
							n114 = 4;
						end
					end
				
	            5:	begin
						vxi2c = 1'b0;
						VA = 5'b10000;
						n106 = 24'b111111111111111111111111;
						n1051 = 4'b1111;
						n1052 = 4'b1111;
						
						if (n113 == 2'b01)
						begin
							n113 = 2'b00;
							n114 = 6;
						end
						else
						begin
							n113 = n113 + 2'b01;
							n114 = 5;
						end
	            	end
	
				
				6:	begin
						vxi2c = 1'b0;
						VA = 5'b10010;
						n106 = 24'b111111111111111111111111;
						n114 = 7;
					end
				
				
				
				
				
				
				
				7:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						
						n106 = 24'b000000000000001100111111;
						n1051 = 4'b0111;
						if (n113 == 2'b00)	n1052 = 4'b0011;
						else if (n113 == 2'b01) n1052 = 4'b0100;
						else if (n113 == 2'b10) n1052 = 4'b0100;
						else
						begin
							n1052 = 4'b0101;
							n114 = 8;
						end
						n113 = n113 + 2'b01;
					end
				
				
				
				
				
				8:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000000;
						n1051 = 4'b0111;
						if (n113 == 2'b00) n1052 = 4'b1001;
						else if (n113 == 2'b01) n1052 = 4'b1010;
						else if (n113 == 2'b10) n1052 = 4'b1010;
						else 
						begin
							n1052 = 4'b1011;
							n114 = 9;
						end
						n113 = n113 + 2'b01;
					end
				
				
				9:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b111111111111111111111111;
						n1051 = 4'b0010;
						n1052 = 4'b0000;
						n114 = 10;
					end
				
				10:	begin
						vxi2c = 1'b1;
						VA = 5'b01010;
						n114 = 11;
					end
					
				
				11:	begin
						vxi2c = 1'b1;
						VA = 5'b01110;
						
						if (n113 == 2'b01)
						begin
							n113 = 2'b00;
							n114 = 12;
						end
						else
						begin
							n113 = n113 + 2'b01;
						end
					end
					
				
				
				
				
				12:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						
						n106[23] = odp[159];
						n106[22:20] = n107;
						n106[19:16] = n108;
						n106[15:0] = odp[151:136];
						
						n1051 = 4'b0111;
						if (n113 == 2'b00)	n1052 = 4'b0000;
						else if (n113 == 2'b01) n1052 = 4'b0001;
						else if (n113 == 2'b10) n1052 = 4'b0001;
						else
						begin
							n1052 = 4'b0010;
							if (n107 == 3'b111)
							begin
								n108 = n108 + 4'b0001;
							end
							n107 = n107 + 3'b001;
							n114 = 13;
						end
						n113 = n113 + 2'b01;
					end
				
				
				
				
				
				13:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106[23:20] = n109;
						n106[19:15] = n110;
						n106[14:0] = odp[150:136];
						
						n1051 = 4'b0111;
						if (n113 == 2'b00)	n1052 = 4'b0110;
						else if (n113 == 2'b01) n1052 = 4'b0111;
						else if (n113 == 2'b10) n1052 = 4'b0111;
						else 
						begin
							n1052 = 4'b1000;
							
							if (n109[0] == 1'b1)
							begin
								n110 = n110 + 5'b00001;
							end
							n109 = n109 + 4'b0001;
														
							if (n1132 == 9'b111111111) n114 = 14;
							else n114 = 12;
						end
						n113 = n113 + 2'b01;
						n1132 =n1132 + 9'b000000001;
					end
				
				14:	begin
						vxi2c = 1'b1;
						VA = 5'b01100;
						n114 = 15;
					end
				
				
				15:	begin
						vxi2c = 1'b1;
						VA = 5'b10011;
						n114 = 16;
					end
				
				
				
				
				
				16:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						n106 = 24'b000000000000000000000000;
						n1051 = 4'b0110;
						if (n113 == 2'b00) n1052 = 4'b0000;
						if (n113 == 2'b01) n1052 = 4'b0000;
						if (n113 == 2'b10) n1052 = 4'b0000;
						else
						begin
							n1052 = 4'b0001;
							
							if (n1132 == 9'b111111111) n114 = 17;
							else n114 = 16;
						end
						n113 = n113 + 2'b01;
						n1132 =n1132 + 9'b000000001;
					end
					
				
				
				
				17:	begin
						vxi2c = 1'b0;
						VA = 5'b01000;
						if (n111 == 1'b0)
						begin
							n111 = 1'b1;
							n106 = 24'b000000000000000000000001;
						end
						else
						begin
							n111 = 1'b0;
							n106 = 24'b000000000000000000000000;
						end						
						n1132 = 9'b000000000;
						n1051 = 4'b0111;
						n1052 = 4'b1100;
						n114 = 15;
					end
					
				default: begin
						n114 = 11;
					end
        	endcase
		end
	end
	obj_q obj_q (
		
		.CLKSOURCE0 (clock),
		.CLKSOURCE1 (clock),
		.DATA0 ({
			 odp[0],
			 odp[1],
			 odp[2],
			 odp[3],
			 odp[4],
			 odp[5],
			 odp[6],
			 odp[7],
			 odp[8],
			 odp[9],
			 odp[10],
			 odp[11],
			 odp[12],
			 odp[13],
			 odp[14],
			 odp[15]
			}),
		.DATA1 ({
			 odp[16],
			 odp[17],
			 odp[18],
			 odp[19],
			 odp[20],
			 odp[21],
			 odp[22],
			 odp[23],
			 odp[24],
			 odp[25],
			 odp[26],
			 odp[27],
			 odp[28],
			 odp[29],
			 odp[30],
			 odp[31]
			}),
		.DATA2 ({
			 odp[32],
			 odp[33],
			 odp[34],
			 odp[35],
			 odp[36],
			 odp[37],
			 odp[38],
			 odp[39],
			 odp[40],
			 odp[41],
			 odp[42],
			 odp[43],
			 odp[44],
			 odp[45],
			 odp[46],
			 odp[47]
			}),
		.DATA3 ({
			 odp[48],
			 odp[49],
			 odp[50],
			 odp[51],
			 odp[52],
			 odp[53],
			 odp[54],
			 odp[55],
			 odp[56],
			 odp[57],
			 odp[58],
			 odp[59],
			 odp[60],
			 odp[61],
			 odp[62],
			 odp[63]
			}),
		.DATA4 ({
			 odp[64],
			 odp[65],
			 odp[66],
			 odp[67],
			 odp[68],
			 odp[69],
			 odp[70],
			 odp[71],
			 odp[72],
			 odp[73],
			 odp[74],
			 odp[75],
			 odp[76],
			 odp[77],
			 odp[78],
			 odp[79]
			}),
		.DATA5 ({
			 odp[80],
			 odp[81],
			 odp[82],
			 odp[83],
			 odp[84],
			 odp[85],
			 odp[86],
			 odp[87],
			 odp[88],
			 odp[89],
			 odp[90],
			 odp[91],
			 odp[92],
			 odp[93],
			 odp[94],
			 odp[95]
			}),
		.DATA6 ({
			 odp[96],
			 odp[97],
			 odp[98],
			 odp[99],
			 odp[100],
			 odp[101],
			 odp[102],
			 odp[103],
			 odp[104],
			 odp[105],
			 odp[106],
			 odp[107],
			 odp[108],
			 odp[109],
			 odp[110],
			 odp[111]
			}),
		.DATA7 ({
			 odp[112],
			 odp[113],
			 odp[114],
			 odp[115],
			 odp[116],
			 odp[117],
			 odp[118],
			 odp[119],
			 odp[120],
			 odp[121],
			 odp[122],
			 odp[123],
			 odp[124],
			 odp[125],
			 odp[126],
			 odp[127]
			}),
		.DATA08 (n112),
		.WEC1 (XXXXinput),
		.DATA10 (VA),
		.VXI2C (vxi2c),
		.DATA12 (clock),
		.DATA13 (interss[1]),
		.DATA14 (interss[0]),
		.DATA15 (interss[0]),
		.VXI2D (~clock),
		.VXI2E (~clock),
		
		.DATA18( inter04_a ),
		.DATA19( inter07_a ),
		.DATA20( inter09_a ),
		.WEC4( inter11_a ),
		.WEC8( inter13_a ),
		.WEC5( inter15_a ),
		.DATA24( inter17_a ),
		.WEC6( inter19_a ),
		.WEC2( inter21_a ),
		.WEC7( inter23_a ),
		.WEC3( inter25_a ),
		.DATA29( inter27_a ),
		.pr4( inter29_a ),
		.vxi2b( inter31_a ),
		.vxi2a( inter33_a )
	);
endmodule
