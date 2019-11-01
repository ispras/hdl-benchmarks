module main(one_byte,start,enable,stop,syshead_len_reg,rate_bnd_reg,flag_reg,resvd_byte_reg);

//input clk;
input one_byte;
input start;
input enable;
output stop;
output syshead_len_reg;
output rate_bnd_reg;
output flag_reg;
output resvd_byte_reg;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;
reg[15:0] syshead_len_reg;
reg[23:0] rate_bnd_reg;
reg[15:0] flag_reg;
reg[7:0] resvd_byte_reg;

reg[2:0] count;
reg flag;
reg[1:0] count1;

reg[23:0] Mem[0:7];
reg[7:0] stream_id_temp;
reg[15:0] stream_temp;
reg [23:0] stream_temp1;
   
integer i;

initial
	begin
	
//	for (i=0;i< 8;i=i+1)
//		Mem[i]=0;
	Mem[0]=0;
	Mem[1]=0;
	Mem[2]=0;
	Mem[3]=0;
	Mem[4]=0;
	Mem[5]=0;
	Mem[6]=0;
	Mem[7]=0;

	stream_temp=0;
	stream_temp1 = 0;
	   
	stream_id_temp=0;
	end
   
always @(posedge enable)
   begin
      	   
   if (start==0) stop=0;
   
   end // always @ (posedge enable)
   
endmodule
