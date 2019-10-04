/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Model of a puzzle played on a square board with five rows of five holes.
// Initially, pegs are placed in 23 holes, leaving the hole in the center
// and the one in the lower right corner empty.
// Each move consist in removing one peg by jumping over it with another peg.
// A valid move required the jumping peg to be adjacent to the one to be
// removed and the hole on the other side to be empty.
// The objective is to remove all pegs except one.

// The game board is modeled as a linear array with 25 locations.  A move is
// specified by an initial position and a direction.  The model executes
// only legal moves.  A move is legal if the initial hole exists and is
// occupied, there is an occupied hole adjecent to the initial one in the
// specified direction, and there is an empty hole on the other side of it.

module field5(clk,from,dir,cnt);
    input clk;
    input [4:0] from;
    input [1:0] dir;
    output [4:0] cnt;		// number of pegs on the board
    parameter 	 U = 0;		// upward
    parameter 	 D = 1;		// downward
    parameter 	 L = 2;		// left   
    parameter 	 R = 3;		// right  
    integer 	 i;

    reg 	 board [0:24];

    initial begin
       for (i = 0; i < 25; i = i + 1)
	  board[i] = 1;
	board[12] = 0;
	board[24] = 0;
    end

    // Compute the residue of a 5-bit number mod 5.
    function [2:0] resMod5;
	input [4:0] n;
	begin: _resMod5
	    case (n)
	      0,5,10,15,20,25,30:  resMod5 = 0;
	      1,6,11,16,21,26,31:  resMod5 = 1;
	      2,7,12,17,22,27:     resMod5 = 2;
	      3,8,13,18,23,28:     resMod5 = 3;
	      default:             resMod5 = 4;
	    endcase // case(n)
	end
    endfunction // resMod5

    always @ (posedge clk)
      if (from < 25 && board[from] == 1)
	case (dir)
	  L:
	    if (resMod5(from) > 1)
	      if (board[from - 1] == 1 && board[from - 2] == 0) begin
		  board[from] <= 0;
		  board[from - 1] <= 0;
		  board[from - 2] <= 1;
	      end
	  R:
	    if (resMod5(from) < 3)
	      if (board[from + 1] == 1 && board[from + 2] == 0) begin
		  board[from] <= 0;
		  board[from + 1] <= 0;
		  board[from + 2] <= 1;
	      end
	  U:
	    if (from < 15)
	      if (board[from + 5] == 1 && board[from + 10] == 0) begin
		  board[from] <= 0;
		  board[from + 5] <= 0;
		  board[from + 10] <= 1;
	      end
	  D:
	    if (from > 9)
	      if (board[from - 5] == 1 && board[from - 10] == 0) begin
		  board[from] <= 0;
		  board[from - 5] <= 0;
		  board[from - 10] <= 1;
	      end
	endcase

    assign cnt = {4'b0,board[0]} + {4'b0,board[1]} + {4'b0,board[2]} +
		 {4'b0,board[3]} + {4'b0,board[4]} + {4'b0,board[5]} +
		 {4'b0,board[6]} + {4'b0,board[7]} + {4'b0,board[8]} +
		 {4'b0,board[9]} + {4'b0,board[10]} + {4'b0,board[11]} +
		 {4'b0,board[12]} + {4'b0,board[13]} + {4'b0,board[14]} +
		 {4'b0,board[15]} + {4'b0,board[16]} + {4'b0,board[17]} +
		 {4'b0,board[18]} + {4'b0,board[19]} + {4'b0,board[20]} +
		 {4'b0,board[21]} + {4'b0,board[22]} + {4'b0,board[23]} +
		 {4'b0,board[24]};

//invariant property
	assert property (cnt!=5'd1);

endmodule // field5
