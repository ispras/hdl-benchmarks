module MCLK_Delay (MCLK, MCLK_1delay, MCLK_2delay);
input              MCLK;
output             MCLK_1delay;
output             MCLK_2delay;

wire   MCLK_1delay, MCLK_2delay;

DELD uclk_1ely (.O (MCLK_1delay), .I (MCLK));
DELD uclk_2ely (.O (MCLK_2delay), .I (MCLK_1delay));

endmodule          // MCLK_Delay


