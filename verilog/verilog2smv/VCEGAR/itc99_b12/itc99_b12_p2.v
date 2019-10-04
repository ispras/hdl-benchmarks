/*
 *
 * Taken from VCEGAR benchmarks -- http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz
 * Modified by Ahmed Irfan <irfan@fbk.eu>
 *
 */ 

// Verilog translation of the original b12 circuit from the ITC99
// benchmark set.

// Author: Fabio Somenzi <Fabio@Colorado.EDU>

//typedef enum {G0, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G10a, G11,
//	      G12, Ea, E0, E1, K0, K1, K2, K3, K4, K5, K6, W0, W1} Gamma;


`define G0 5'b00000
`define G1 5'b00001
`define G2 5'b00010
`define G3 5'b00011
`define G4 5'b00100
`define G5 5'b00101
`define G6 5'b00110
`define G7 5'b00111
`define G8 5'b01000
`define G9 5'b01001
`define G10 5'b01010
`define G10a 5'b01011
`define G11 5'b01100
`define G12 5'b01101
`define Ea 5'b01110
`define E0 5'b01111
`define E1 5'b10000
`define K0 5'b10001
`define K1 5'b10010
`define K2 5'b10011
`define K3 5'b10100
`define K4 5'b10101
`define K5 5'b10110
`define K6 5'b10111
`define W0 5'b11000
`define W1 5'b11001





module main(clock, start, k, nloss, nl, speaker);
    input        clock;
    input 	 start;
    input [3:0]  k;
    output 	 nloss;
    output [3:0] nl;
    output 	 speaker;

    parameter 	 RED    = 0;
    parameter 	 GREEN  = 1;
    parameter 	 YELLOW = 2;
    parameter 	 BLUE   = 3;

    parameter 	 LED_OFF = 1'b0;
    parameter 	 LED_ON  = 1'b1;

    parameter 	 PLAY_OFF = 1'b0;
    parameter 	 PLAY_ON  = 1'b1;

    parameter 	 KEY_ON = 1;

    parameter 	 NUM_KEY   = 4;
    parameter 	 COD_COLOR = 2;
    parameter 	 COD_SOUND = 3;

    parameter 	 S_WIN  = 4;
    parameter 	 S_LOSS = 5;

    parameter 	 SIZE_ADDRESS = 5;
    parameter 	 SIZE_MEM     = 32;

    parameter 	 COUNT_KEY = 33;
    parameter 	 COUNT_SEQ = 33;
    parameter 	 DEC_SEQ   = 1;
    parameter 	 COUNT_FIN = 8;

    parameter 	 ERROR_TONE  = 1;
    parameter 	 RED_TONE    = 2;
    parameter 	 GREEN_TONE  = 3; 
    parameter 	 YELLOW_TONE = 4;
    parameter 	 BLUE_TONE   = 5;
    parameter 	 WIN_TONE    = 6;

    reg 	 speaker, nloss;
    reg [3:0] 	 nl;
    reg 	 wr;
    reg [4:0] 	 address;
    reg [1:0] 	 data_in, data_out, num;
    reg [2:0] 	 sound;
    reg 	 play;

    reg 	 s;
    reg [2:0] 	 counter;

    initial begin
	s = 0;
	speaker = 0;
	counter = 0;
    end

    wire [2:0] counterp1;
    assign     counterp1 = counter + 1;

    always @ (posedge clock) begin
	if (play) begin
	    case (sound)
              0: begin
                if (counter > RED_TONE) begin
                    s = ~s;
                    speaker = s;
                    counter = 0;
                end else begin
                   counter = counterp1;
                end
	      end
              1: begin
                  if (counter > GREEN_TONE) begin
                      s = ~s;
                      speaker = s;
                      counter = 0;
                  end else begin
                      counter = counterp1;
                  end
	      end
              2: begin
                  if (counter > YELLOW_TONE) begin
                      s = ~s;
                      speaker = s;
                      counter = 0;
                  end else begin
                      counter = counterp1;
                  end
	      end
              3: begin
                  if (counter > BLUE_TONE) begin
                      s = ~s;
                      speaker = s;
                      counter = 0;
                  end else begin
                      counter = counterp1;
                  end
	      end
              S_WIN: begin
                  if (counter > WIN_TONE) begin
                      s = ~s;
                      speaker = s;
                      counter = 0;
                  end else begin
                      counter = counterp1;
                  end
	      end
              S_LOSS: begin
                  if (counter > ERROR_TONE) begin
                      s = ~s;
                      speaker = s;
                      counter = 0;
                  end else begin
                      counter = counterp1;
                  end
	      end
              default: begin
                  counter = 0;
	      end
            endcase
	end else begin
            counter = 0;
            speaker = 0;
	end
    end

    initial begin
	num = 0;
    end

    always @ (posedge clock) begin
	num = num + 1;
    end

    reg [1:0] memory[0:31];
    integer   i;

    initial begin
	data_out = 0;
	//for (i = 0; i < 32; i = i + 1)
	  memory[0] = 0;
	  memory[1] = 0;
	memory[2] = 0;
	  memory[3] = 0;
	memory[4] = 0;
	  memory[5] = 0;
	memory[6] = 0;
	  memory[7] = 0;
	memory[8] = 0;
	  memory[9] = 0;
	memory[10] = 0;
	  memory[11] = 0;
	memory[12] = 0;
	  memory[13] = 0;
	memory[14] = 0;
	  memory[15] = 0;
	memory[16] = 0;
	  memory[17] = 0;
	memory[18] = 0;
	  memory[19] = 0;
	memory[20] = 0;
	  memory[21] = 0;
	memory[22] = 0;
	  memory[23] = 0;
	memory[24] = 0;
	  memory[25] = 0;
	memory[26] = 0;
	  memory[27] = 0;
	memory[28] = 0;
	  memory[29] = 0;
	memory[30] = 0;
	  memory[31] = 0;

    end

    always @ (posedge clock) begin
	data_out = memory[address];
	if (wr)
          memory[address] = data_in;
    end

    reg [4:0] gamma;
    reg [1:0] ind;
    reg [4:0] scan, max;
    reg [5:0] timebase, count;

    wire [5:0] countm1;
    assign     countm1 = count - 1;

    initial begin
	nloss = LED_OFF;
	nl = {4{LED_OFF}};
	play = PLAY_OFF;
	wr = 0;
	scan = 0;
	max = 0;
	ind = 0;
	timebase = 0;
	count = 0;
	sound = 0;
	address = 0;
	data_in = 0;
	gamma = `G0;
    end
    
    always @ (posedge clock) begin
	if (start)
	  gamma = `G1;
	case (gamma)
	  `G0: begin
	      gamma = `G0;
	  end
	  `G1: begin
              nloss = LED_OFF;
              nl = {4{LED_OFF}};
              play = PLAY_OFF;
              wr = 0;
              max = 0;
              timebase = COUNT_SEQ;
              gamma = `G2;
	  end
	  `G2: begin
              scan = 0;
              wr = 1;
              address = max;
              data_in = num;
              gamma = `G3;
	  end
          `G3: begin
              wr = 0;
              address = scan;
              gamma = `G4;
	  end
          `G4: begin
              gamma = `G5;
	  end
	  `G5: begin
	      case (data_out)
		0: nl[0] = LED_ON;
		1: nl[1] = LED_ON;
		2: nl[2] = LED_ON;
		3: nl[3] = LED_ON;
	      endcase
              count = timebase;
              play = PLAY_ON;
              sound = {1'b0, data_out};
              gamma = `G6;
	  end
          `G6: begin
              if (count == 0) begin
		  nl = {4{LED_OFF}};
		  play = PLAY_OFF;
		  count = timebase;
		  gamma = `G7;
              end else begin
		  count = countm1;
		  gamma = `G6;
              end
	  end
          `G7: begin
              if (count == 0) begin
		  if (scan != max) begin
		      scan = scan + 1;
		      gamma = `G3;
		  end else begin
		      scan = 0;
		      gamma = `G8;
		  end
              end else begin
		  count = countm1;
		  gamma = `G7;
              end
	  end
          `G8: begin
              count = COUNT_KEY;
              address = scan;
              gamma = `G9;
	  end
	  `G9: begin
              gamma = `G10;
	  end
          `G10: begin
              if (count == 0) begin
		  nloss = LED_ON;
		  max = 0;
		  gamma = `K0;
              end else begin
		  count = countm1;
		  if (k[0] == KEY_ON) begin
		      ind = 0;
		      sound = 0;
		      play = PLAY_ON;
		      count = timebase;
		      if (data_out == 0) begin
			  gamma = `G10a;
		      end else begin
			  nloss = LED_ON;
			  gamma = `Ea;
		      end
		  end else if (k[1] == KEY_ON) begin
		      ind = 1;
		      sound = 1;
		      play = PLAY_ON;
		      count = timebase;
		      if (data_out == 1) begin
			  gamma = `G10a;
		      end else begin
			  nloss = LED_ON;
			  gamma = `Ea;
		      end
		  end else if (k[2] == KEY_ON) begin
		      ind = 2;
		      sound = 2;
		      play = PLAY_ON;
		      count = timebase;
		      if (data_out == 2) begin
			  gamma = `G10a;
		      end else begin
			  nloss = LED_ON;
			  gamma = `Ea;
		      end
		  end else if (k[3] == KEY_ON) begin
		      ind = 3;
		      sound = 3;
		      play = PLAY_ON;
		      count = timebase;
		      if (data_out == 3) begin
			  gamma = `G10a;
		      end else begin
			  nloss = LED_ON;
			  gamma = `Ea;
		      end
		  end else begin
		      gamma = `G10;
		  end
              end
	  end
          `G10a: begin
	      case (ind)
		0: nl[0] = LED_ON;
		1: nl[1] = LED_ON;
		2: nl[2] = LED_ON;
		3: nl[3] = LED_ON;
	      endcase
              gamma = `G11;
	  end
          `G11: begin
              if (count == 0) begin
		  nl = {4{LED_OFF}};
		  play = PLAY_OFF;
		  count = timebase;      // attiva contatore LED spento
		  gamma = `G12;           // stato FSM
              end else begin
		  count = countm1;       // decrementa contatore
		  gamma = `G11;           // stato FSM
              end
	  end
          `G12: begin
              if (count == 0) begin       // controlla se fine conteggio
		  if (scan != max) begin  // controlla se sequenza non finita
		      scan = scan + 1;    // incrementa indirizzo
		      gamma = `G8;         // stato FSM
		  end else if (max != (SIZE_MEM - 1)) begin
		      // controlla se memoria non e' esaurita
		      max = max + 1;      // incrementa registro massima sequenza
		      timebase = timebase - DEC_SEQ; // decremento prossima sequenza
		      gamma = `G2;         // stato FSM
		  end else begin
		      play = PLAY_ON;     // attiva il suono
		      sound = S_WIN;      // comunica il codice del suono
		      count = COUNT_FIN;  // attiva contatore fine suono
		      gamma = `W0;         // stato FSM
		  end
              end else begin
		  count = countm1;        // decrementa contatore
		  gamma = `G12;            // stato FSM
              end
	  end
          `Ea: begin
	      case (ind)                  // attiva LED tasto
		0: nl[0] = LED_ON;
		1: nl[1] = LED_ON;
		2: nl[2] = LED_ON;
		3: nl[3] = LED_ON;
	      endcase
              gamma = `E0;                 // stato FSM
	  end
          `E0: begin
              if (count == 0) begin       // controlla se fine conteggio
		  nl = {4{LED_OFF}};      // spegne LED tasti
		  play = PLAY_OFF;        // disattiva il suono
		  count = timebase;       // attiva contatore LED spento
		  gamma = `E1;             // stato FSM
              end else begin
		  count = countm1;        // decrementa contatore
		  gamma = `E0;             // stato FSM
              end
	  end
          `E1: begin
              if (count == 0) begin       // controlla se fine conteggio
		  max = 0;                // azzera registro massima sequenza
		  gamma = `K0;             // stato FSM
              end else begin
		  count = countm1;        // decrementa contatore
		  gamma = `E1;             // stato FSM
              end
	  end
          `K0: begin
              address = max;    // indirizza ultimo integer range 3 downto 0e
              gamma = `K1;       // stato FSM
	  end
          `K1: begin           // serve per dare tempo per leggere la memoria
              gamma = `K2;     // stato FSM
	  end
          `K2: begin
	      case (data_out)           // attiva LED tasto
		0: nl[0] = LED_ON;
		1: nl[1] = LED_ON;
		2: nl[2] = LED_ON;
		3: nl[3] = LED_ON;
	      endcase
              play = PLAY_ON;           // attiva suono
              sound = {1'b0, data_out}; // comunica il codice del suono
              count = timebase;         // attiva contatore LED acceso
              gamma = `K3;               // stato FSM
	  end
          `K3: begin
              if (count == 0) begin     // controlla se fine conteggio
		  nl = {4{LED_OFF}};    // spegne LED tasti
		  play = PLAY_OFF;      // disattiva il suono
		  count = timebase;     // attiva contatore LED spento
		  gamma = `K4;           // stato FSM
              end else begin
		  count = countm1;      // decrementa contatore
		  gamma = `K3;           // stato FSM
              end
	  end
          `K4: begin
              if (count == 0) begin          // controlla se fine conteggio
		  if (max != scan) begin     // controlla se fine lista
		      max = max + 1;         // incrementa indirizzo
		      gamma = `K0;            // stato FSM
		  end else begin
		      case (data_out)        // attiva LED tasto
			0: nl[0] = LED_ON;
			1: nl[1] = LED_ON;
			2: nl[2] = LED_ON;
			3: nl[3] = LED_ON;
		      endcase
		      play = PLAY_ON;        // attiva suono
		      sound = S_LOSS;        // codice suono perdita
		      count = COUNT_FIN;     // attiva contatore LED acceso
		      gamma = `K5;            // stato FSM
		  end
              end else begin
		  count = countm1;           // decrementa contatore
		  gamma = `K4;                // stato FSM
              end
	  end
          `K5: begin
              if (count == 0) begin          // controlla se fine conteggio
		  nl = {4{LED_OFF}};         // spegne LED tasti
		  play = PLAY_OFF;           // disattiva il suono
		  count = COUNT_FIN;         // attiva contatore LED spento
		  gamma = `K6;                // stato FSM
              end else begin
		  count = countm1;           // decrementa contatore
		  gamma = `K5;                // stato FSM
              end
	  end
          `K6: begin
              if (count == 0) begin          // controlla se fine conteggio
		  case (data_out)            // attiva LED tasto
		    0: nl[0] = LED_ON;
		    1: nl[1] = LED_ON;
		    2: nl[2] = LED_ON;
		    3: nl[3] = LED_ON;
		  endcase
		  play = PLAY_ON;            // attiva suono
		  sound = S_LOSS;            // codice suono perdita
		  count = COUNT_FIN;         // attiva contatore LED acceso
		  gamma = `K5;                // stato FSM
              end else begin
		  count = countm1;           // decrementa contatore
		  gamma = `K6;                // stato FSM
              end
	  end
          `W0: begin
              if (count == 0) begin          // controlla se fine conteggio
		  nl = {4{LED_ON}};          // attiva tutti i LED
		  play = PLAY_OFF;           // disattiva il suono
		  count = COUNT_FIN;         // attiva contatore LED acceso
		  gamma = `W1;                // stato FSM
              end else begin
		  count = countm1;           // decrementa contatore
		  gamma = `W0;                // stato FSM
              end
	  end
          `W1: begin
              if (count == 0) begin          // controlla se fine conteggio
		  nl = {4{LED_OFF}};         // disattiva tutti i LED
		  play = PLAY_ON;            // attiva il suono
		  sound = S_WIN;             // comunica il codice del suono
		  count = COUNT_FIN;         // attiva contatore LED spento
		  gamma = `W0;                // stato FSM
              end else begin
		  count = countm1;           // decrementa contatore
		  gamma = `W1;                // stato FSM
              end
	  end
	endcase
    end

//   assert property (~(counter[2:0]==0 &  play==1) | (speaker == s));

   assert property (~(nloss==0) | (~(nl[3:0]==15)));
   
endmodule // b12
