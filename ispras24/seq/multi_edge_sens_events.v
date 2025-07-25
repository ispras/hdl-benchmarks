module multi_edge_sens_events(clk, rst_n, s_p_flag_out);

  input wire clk;
  input wire rst_n;
  output reg s_p_flag_out;

  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      s_p_flag_out <= 0;
    else
      s_p_flag_out <= 1'b1;
  end

endmodule
