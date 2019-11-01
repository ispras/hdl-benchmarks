
// TOP MODULE
module fir_8x  ( resetb, fir_8x_in, fir_8x_out, fir_8x_bit, p2 );

// INPUTS
input		 resetb; 	
input 	[18:0]	 fir_8x_in; 	
input  	[1:0]    fir_8x_bit;     
input  		 p2;     

// OUTPUTS

output	[18:0]	 fir_8x_out;


reg   	[18:0]	 del_fir_8x_in; 
reg   	[19:0]	 sum; 

wire    [18:0]   sum_shift;
wire             carry;
wire    [18:0]   fir_data;
reg     [18:0]   fir_8x_out;



// MAIN CODE
always @(negedge resetb or posedge p2)
begin
  if (~resetb) 
      del_fir_8x_in <= 19'b0;
  else begin
      if (fir_8x_bit[1] & fir_8x_bit[0])
          del_fir_8x_in <= fir_8x_in;
  end
end

always @(negedge resetb or posedge p2)
begin
  if (~resetb) 
      sum <= 20'b0;
  else begin
      if (fir_8x_bit[1] & fir_8x_bit[0])
          sum <= {fir_8x_in[18],fir_8x_in} + {del_fir_8x_in[18],del_fir_8x_in};
  end
end

assign sum_shift = {sum[19],sum[19:1]};

assign carry = sum[19] | sum[0];

assign fir_data =  carry ? sum_shift + 1 : sum_shift;


always @(negedge resetb or posedge p2)
begin
  if (~resetb)
      fir_8x_out <=  19'b0;
  else
      if (fir_8x_bit[1] & fir_8x_bit[0])
          fir_8x_out <=  del_fir_8x_in;
      else if (fir_8x_bit[1] & !fir_8x_bit[0])
          fir_8x_out <=  fir_data;
end

endmodule // fir_8x
