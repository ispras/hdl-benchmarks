# frisc.pat: no memory version, i.e., external memory is simulated by
#	manually supplying the corresponding data
#
# memory map:
#
#	pc (p) : 		starts 000F (Hex)
#	stack (s) :		starts 00FF (Hex)
#	interrupt service:	starts 0FFF (Hex)
#
# This test executes the  following assembly program:
#
#	612F
#	106E
#	IRQ
#				a	b
#				----	-----
#	a <= mem[a]		612F	
#	a = a >> 1		B097
#	a++			C097
#	b = !(a & b)			FFFF
#	a = b			FFFF
#	b <= mem[s]			1234
#	s--
#	a <= mem[a]		5678
#	b = b+a				68AC
#	a = b			68AC
#	b <= mem[s]			0000
#	s--
#
# IRQ:
#
# 	increment SP to 10FF
# 	mem[SP] <= B
# 	B = A; SP++ to 20FF
# 	mem[SP] <= B
# 	B = M; A = PC (400F) ; M = SP+1 
# 	PC = mem[2]
# 	IACK = 1 
# 	IACK = 0
#
# 
# (These conventions apply only to MERCURY simulations)
# convention: all inputs to the processor change when CLK signal is low
# and these are sampled by the processor in the following rising edge of CLK
#
#
#
#	               +-------------+                     +-------------
#	              /               \                   /
#	             /                 \                 /
#	            /^                  \               /
#	-^--------+/ |                   +-------------+
#        |           |
# inputs change      sampled
#
# Note for ariadne simulations CLK EN RESET signals are ignored
# a "-" implies input driver for that signal is disabled
#
#.inputs CLK EN RESET reset[0:0] irq[0:0] data[0:0] data[1:1] data[2:2] data[3:3] data[4:4] data[5:5] data[6:6] data[7:7] data[8:8] data[9:9] data[10:10] data[11:11] data[12:12] data[13:13] data[14:14] data[15:15] ;
##
#111 00 ---- ---- ---- ----;
#010 00 ---- ---- ---- ----;
#110 00 ---- ---- ---- ----;
#010 00 ---- ---- ---- ----;
#110 00 ---- ---- ---- ----;
## reset start
#010 10 ---- ---- ---- ----;
#110 10 0000 0000 0000 0000;
#010 10 0000 0000 0000 0000;
## rd = 1 in this clock
#110 10 0000 0000 0000 0000;
## reset end
#010 00 0000 0000 0000 1111;
## rd = 0 in this clock
#110 00 0000 0000 0000 1111;
#010 00 0000 0000 0000 1111;
## rd = 1 now for address = 1
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 1111 1111;
## rd = 0 
#110 00 0000 0000 1111 1111;
#010 00 0000 0000 1111 1111;
## now reset is sampled low
## rd = 1 address = p
## opcode = 6 ; load a = 000F; next opcode = F ; shr 1; incr a
#110 00 0000 0000 0000 0000;
#010 00 0110 1000 0100 1111;
## rd = 0
#110 00 0110 1000 0100 1111;
#010 00 0110 1000 0100 1111;
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 0000 1111;
#110 00 0000 0000 0000 1111;
#010 00 0000 0000 0000 1111;
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 0000 0000;
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 0000 0000;
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 0000 0000;
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 0000 0000;
#110 00 0000 0000 0000 0000;
#010 00 0000 0000 0000 0000;
#
############################################################################
# pattern file for ARIADNE
############################################################################
#
# memory contents: (all in Hex) <lsb:msb>
#
# 0000		000F (PC)
# 1000		00FF (SP)
# 2000		0FFF (Starting Address for interrupt service routine)
# 000F		612F
#
# This test program loads the PC and STACK pointer, fetches an instruction
# that contains four successive opcodes as follows:
#
#	a <= mem[0000] = 000F
#	shr 1
#	a++
#	b = !(a & b)
#	a = b
#	b <= mem[s]
#	s--
#	a <= mem[a]
#	b = b+a
#	a = b
#	b <= mem[s]
#	s--
#
# expected results: 
#
# load PC = 000F; SP = 00FF; 
# load I = 612F; 
# increment PC = 100F
# execute first opcode (6) : load A = 612F; shift out first byte from I
# execute second opcode (12): a = a << 1 => a = B097
# execute third opcode (F): a++ => a = C097
#
# interrupt processing:
#
# 	increment SP to 10FF
# 	mem[SP] <= B
# 	B = A; SP++ to 20FF
# 	mem[SP] <= B
# 	B = M; A = PC (400F) ; M = SP+1 
# 	PC = mem[2]
# 	IACK = 1 
# 	IACK = 0
#
#
.inputs CLK EN RESET reset[0:0] irq[0:0] data[0:0] data[1:1] data[2:2] data[3:3] data[4:4] data[5:5] data[6:6] data[7:7] data[8:8] data[9:9] data[10:10] data[11:11] data[12:12] data[13:13] data[14:14] data[15:15] ;
#
1 10 00 0000 0000 0000 0000;
1 10 00 ---- ---- ---- ----;
# reset sequence
# rd = 1 
# rd = 0 ; data = 000F
# rd = 1 ; address = 1
# rd = 0 ; data = 00FF
1 10 10 ---- ---- ---- ----;
1 10 10 0000 0000 0000 1111;
1 10 10 ---- ---- ---- ----;
1 10 10 0000 0000 1111 1111;
# reset end
1 10 00 ---- ---- ---- ----;
# rd = 1 ; address = p = 000F
# rd = 0 ; data = 612F
1 10 00 ---- ---- ---- ----;
1 10 00 0110 1000 0100 1111;
#
# now Instr Reg has 3 instructions to work on
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
# another 3 instructions 
1 10 00 1000 0000 0110 0111;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 1000 0100 1100 0010;
1 10 00 ---- ---- ---- ----;
1 10 00 1010 0110 1110 0001;
1 10 00 ---- ---- ---- ----;
1 10 00 0000 0000 0000 0000;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
# let us now raise the interrupt request
1 10 01 ---- ---- ---- ----;
1 10 01 ---- ---- ---- ----;
1 10 01 ---- ---- ---- ----;
1 10 01 ---- ---- ---- ----;
1 10 01 ---- ---- ---- ----;
1 10 01 ---- ---- ---- ----;
1 10 01 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
1 10 00 ---- ---- ---- ----;
