module main(clock,reset);

input clock;
input reset;

reg impl_PC_valid;

wire impl_flush;
assign impl_flush = 0;

always @(posedge clock) begin
 if(reset)
  impl_PC_valid <= 1;
 else if(impl_flush)
  impl_PC_valid <= 0;
end
endmodule
