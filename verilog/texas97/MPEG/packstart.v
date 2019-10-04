
module test(clk, buffer);
   input clk;
   input buffer;
   
   
   
   reg start;
   wire [7:0] buffer;
   wire       stop;
   reg 	      enable;
   
   initial 
   begin
   start=1;
   end // initial begin

   initial 
   begin
     enable=0;
   end

   always @(posedge clk)
   begin
     enable = 0;
     start = 1;
    end

  // always  enable=0;
   fsm_for_pack_start mod3(clk, buffer,start,enable,stop);
   
endmodule // test

module fsm_for_pack_start(clk, one_byte,start,enable,stop);

input clk;
input one_byte;
input start;
input enable;
output stop;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;

reg[2:0] state;

initial 
	begin
	stop=0;
	state=3'b00;
	end


always @(posedge clk)
	begin
	if (enable && start==1) 
	begin
	case (state)
		3'b00:	begin
			case (one_byte)
			8'b00000000: begin
                                     state=3'b01;
			   end
			   
			default	   : state=3'b00;	
			endcase
			end
		
		3'b01:	begin
			case (one_byte)
			8'b00000000: state=3'b10;
			default	   : state=3'b00;	
			endcase
			end  

		3'b10:	begin
			case (one_byte)
			8'b10000000: state=3'b11;
			default	   : state=3'b00;	
			endcase
			end
		
		3'b11:	begin
			case (one_byte)
			8'b01011101: begin
				     stop=1;
				     state=3'b111;
				     end
			8'b00000000: state=3'b01;
			default	   : state=3'b00;	
			
                       endcase

			end  
	       3'b111: begin
		        if(start==0)
			   begin
			      stop=0;
			      state=0;
			   end // if (start==0)
	       end // case: 3'b111
	  
              endcase
	end
	
	   
	end // always @ (posedge enable)
   

endmodule	/* fsm_pack_head_start */














