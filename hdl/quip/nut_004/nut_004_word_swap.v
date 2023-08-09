/////////////////////////////////////////////////////////////////
// Altera Corporation
// 
// Param comb WORD_SWAPPER helper circuit.
//   Exchanges the A and B words of IN to make OUT.
/////////////////////////////////////////////////////////////////
module nut_004_word_swap (data_in,index_a,index_b,data_out);

parameter WORD_LEN = 3;
parameter NUM_WORDS = 5;

input [WORD_LEN-1:0] index_a;
input [WORD_LEN-1:0] index_b;
input [WORD_LEN*NUM_WORDS-1:0] data_in;
output [WORD_LEN*NUM_WORDS-1:0] data_out;
reg [WORD_LEN*NUM_WORDS-1:0] data_out;

reg [WORD_LEN-1:0] work [NUM_WORDS-1:0];
reg [WORD_LEN-1:0] work_prime [NUM_WORDS-1:0];
wire [WORD_LEN-1:0] capped_a;
wire [WORD_LEN-1:0] capped_b;

assign capped_a = (index_a < NUM_WORDS ? index_a : 0);
assign capped_b = (index_b < NUM_WORDS ? index_b : 0);
genvar n;

generate
for (n=0; n<NUM_WORDS; n=n+1)
  begin : swapz

    // Move inputs into working array
    always @(data_in) begin  
      work[n] = data_in[n*WORD_LEN+WORD_LEN-1:n*WORD_LEN];
    end

    // Copy work to work prime with a swap of 2 words
    always @(*) begin
      if (n == capped_a) work_prime[n] = work[capped_b];
	  else if (n == capped_b) work_prime[n] = work[capped_a];
  	  else work_prime[n] = work[n];
    end

    // Copy workprime back to the outputs
    always @(*) begin 
      data_out[n*WORD_LEN+WORD_LEN-1:n*WORD_LEN] = work_prime[n];
    end
  end
endgenerate
endmodule

