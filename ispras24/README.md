# ISPRAS'24

This test suite comprises of a set of tests written on Verilog divided into the combinational logic (`comb`) and
sequential logic (`seq`). These tests were used for testing of Verilog-to-netlist translator. Test suite includes
Verilog examples for the following operations and primitives:

* arithmetic:
  * power (`**`);
  * subtraction (`-`);
  * division (`/`);
  * mod (`%`);
  * addition (`+`);
  * multiplication (`*`);
  * negative sign (`-`);
  * positive sign (`+`).
* logical:
  * AND (`&&`);
  * OR (`||`);
  * XOR (`^^`);
  * NOT (`!`).
* multiplexers and demultiplexers:
  * demultiplexer (`demux`);
  * multiplexer (`mux`) (fully and partially connected);
  * parallel multiplexer (`pmux`);
  * bitwise multiplexer (`bmux`).
* bitwise:
  * AND (`&`);
  * OR (`|`);
  * XOR (`^`);
  * XNOR (`~^`, `^~`);
  * NOT (`~`);
  * NAND (`~&`);
  * NOR (`~|`).
* assignment (`assign`);
* reduction:
  * AND (`&`);
  * OR (`|`);
  * XOR (`^`);
  * XNOR (`~^`, `^~`);
  * NAND (`~&`);
  * NOR (`~|`).
* shifts:
  * shift left (`<<`);
  * shift right (`>>`);
  * arithmetic shift left (`<<<`);
  * arithmetic shift right (`>>>`).
* comparison:
  * equal (`==`);
  * not equal (`!=`);
  * greater than (`>`);
  * greater than or equal (`>=`);
  * less than (`<`);
  * less than or equal (`<=`).
* look ahead and carry (`lcu`).
* hard block instantiations:
  * defined;
  * undefined.

* latch (`Dlatch`);
* Set-Reset latch (`DlatchSR`);
* asynchronous reset latch (`ADLatch`);
* finite state machine (`FSM`);
* D Flip-Flop (`DFF`);
* asynchronous data load D Flip-Flop (`ALDFF`);
* asynchronous data load D Flip-Flop with enable-input (`ALDFFE`);
* asynchronous reset D Flip-Flop (`ADFF`);
* asynchronous reset D Flip-Flop with enable-input (`ADFFE`);
* D Flip-Flop with enable-input (`DFFE`);
* Set-Reset D Flip-Flop (`DFFSR`);
* Set-Reset D Flip-Flop with enable-input (`DFFSRE`);
* synchronous Set D Flip-Flop (`SDFF`);
* synchronous Set D Flip-Flop with enable-input (`SDFFE`);
* synchronous Set D Flip-Flop with enable-clock (`SDFFCE`).
