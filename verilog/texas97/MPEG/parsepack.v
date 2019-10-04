/*
 * 
 * This module parses the 8 bytes in the pack header after the pack_start_code
 * scr_reg holds the 33 bit scr value,4 bits for byte alignment and
 * 3 marker bits.
 * mux_rate_reg holds the 22 bit mux_rate and 2 marker bits.
 * when this is done `stop' is set to 1
 *
 */

 
module parse_pack_header(one_byte,start,enable,stop,scr_reg,mux_rate_reg);

input one_byte;
input start;
input enable;
output stop;
output scr_reg;
output mux_rate_reg;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;
reg[39:0] scr_reg;
reg[23:0] mux_rate_reg;
   reg 	  monitor;
   
reg[3:0] count;


initial
	begin
	stop=0;
	scr_reg=0;
	mux_rate_reg=0;
	count=4'b000;
	   monitor=0;
	   
/*...check maybe change these initial values later....*/
	end

   
always @(posedge enable)
   begin
   monitor=start;
   
if (start==1)
   begin
      
	case (count)
		4'b000: begin
			scr_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		4'b001: begin
			scr_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		4'b010: begin
			scr_reg[23:16]=one_byte[7:0];
			count=count+1;
			end
                4'b011: begin
			scr_reg[31:24]=one_byte[7:0];
			count=count+1;
			end
		4'b100: begin
			scr_reg[39:32]=one_byte[7:0];
			count=count+1;
			end
		4'b101: begin
			mux_rate_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		4'b110: begin
			mux_rate_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		4'b111: begin
			mux_rate_reg[23:16]=one_byte[7:0];
			stop=1;
			count=4'b1111;
		end // case: 4'b111
	        4'b1111: begin
		         if (start==0)
			    begin
                             stop=0;
			       count=0;
			    end // if (start==0)
		   end
		   
	endcase
	end // if (start==1)
   

   end // always @ (posedge enable)
   
   

endmodule


