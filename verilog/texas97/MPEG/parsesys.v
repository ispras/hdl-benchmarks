module parse_system_header(one_byte,start,enable,stop,syshead_len_reg,rate_bnd_reg,flag_reg,resvd_byte_reg);

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
   reg monitor;
   
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
	stop=0;
	syshead_len_reg=0;
	rate_bnd_reg=0;
	flag_reg=0;
	resvd_byte_reg=0;
	count=3'b000;
	count1=0;
	flag=0;
	   monitor=0;
	   
	for (i=0;i< 8;i=i+1)
		Mem[i]=0;
	stream_temp=0;
	   stream_temp1 = 0;
	   
	stream_id_temp=0;
	end


   
always @(posedge enable)
   begin
//       $monitor("%0d     %b   %b  %b %b  %b   %b  %b  %b",$time,clk,enable,one_byte,start,stop,count,flag,count1);
      monitor=start;
      
if ((start==1)&&(flag==0))
	begin
	case (count)
		3'b000: begin
			syshead_len_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		3'b001: begin
			syshead_len_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b010: begin
			rate_bnd_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
                3'b011: begin
			rate_bnd_reg[15:8]=one_byte[7:0];
			//count=count+1;
		   count=count+1;
		   
			end
		3'b100: //begin
			begin
		        rate_bnd_reg[23:16]=one_byte[7:0];		   
			count=count+1;
			end
		3'b101: begin
		//	flag_reg[7:0]=one_byte[7:0];
		   flag_reg[7:0]=one_byte[7:0];
		   
			count=count+1;
			end
		3'b110: begin
			flag_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b111: begin
			resvd_byte_reg[7:0]=one_byte[7:0];
			flag=1;
			count=3'b000;
			end
	endcase // case(count)
	end // if ((start==1)&&(flag==0))
   
	if ((start==1)&&(flag==1))
	   begin
	      
		case(count1)
		2'b00:	begin
                           count1=2'b11;
		   // need to wait till next enable signal to check for stream id.
		        end // case: 2'b00
		  
		2'b01:	begin
			stream_temp[7:0]=one_byte[7:0];
		 	count1=count1+1;
			end
		2'b10:	begin
			stream_temp[15:8]=one_byte[7:0];
		 	count1=0;
		        stream_temp1[7:0] = stream_temp;
		   
			case (stream_id_temp)

			8'b11000000: 
			             begin
					Mem[0]=stream_temp1;
					stop=1;flag=0;
				     end // case: 8'b00000011
			  
			8'b11000001: begin
			             Mem[1]=stream_temp1;
			             stop=1;
			             flag=0;
			             end
			   
			8'b11000010: begin
			             Mem[2]=stream_temp1;
			             stop=1;flag=0;
			   
			             end
			8'b11000011: begin
			             Mem[3]=stream_temp1;
			             stop=1;
			             flag=0;
			             end
			8'b11100000: begin
			             Mem[4]=stream_temp1;
			             flag=0;
			             stop=1;
			             end
			8'b11100001: begin
                                     Mem[5]=stream_temp1;
			             stop=1;
			             flag=0;
			             end   
			8'b11100010: begin
			             Mem[6]=stream_temp1;
			             flag=0;
			             stop=1;
			             end   
			8'b11100011: begin
			             Mem[7]=stream_temp1;
			             flag=0;
			             stop=1;
			             end
			   
			endcase // case(stream_id_temp)
		   
		end // case: 2'b10
		  
		2'b11 : begin
		         if (one_byte[7:7]==1)
			    begin
			       stream_id_temp[7:0]=one_byte[7:0];
		 	       count1=2'b01;
			    end // if (one_byte[7:7]==1)
	     
		           else begin
			         stop=1;
			         count1=2'b00;
			   end // else: !if(one_byte[7:7]==1)
		   
			      
		        end
		  
		  
		endcase // case(count1)
		 
	      
	   end // if ((start==1)&&(flag==1))
   
	   
   if (start==0) stop=0;
   
   end // always @ (posedge enable)
   
endmodule



