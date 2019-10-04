
// Parameter declaration

`define BYTE            1:0
`define DATAWIDTH       2
`define ADDRWIDTH       2
`define DATA            `DATAWIDTH-1:0
`define ADDR            `ADDRWIDTH-1:0
`define REGWIDTH        4
`define RDDR            `REGWIDTH-1:0
`define MAXREGS         1<<`REGWIDTH
`define IMEMSIZE         4
`define DMEMSIZE        4
`define DATAWIDTH1      32
`define DATA1           `DATAWIDTH1-1:0
`define CLOCKPERIOD     20

// Instruction fields

`define OPCODE          IR[31:26]

// I-Type Instruction
`define IRS             IR[23:21]
`define IRD             IR[18:16]
`define IMM             IR[1:0]

// R-Type Instruction
`define RRS1            IR[23:21]
`define RRS2            IR[18:16]
`define RRD             IR[13:11]
`define SHAMT           IR[7:6]
`define FUNC            IR[5:0]

// J-Type Instruction
`define OFFSET          IR[1:0]

// Address modes

`define DSPLTYPE        0
`define IMMTYPE         1

// OPcode map

// OPcodes
`define NOP     00000000000000000000000000000000

`define FSEL    6'b000000
`define J       6'b000010
`define BEQZ    6'b000100
`define BNEZ    6'b000101
`define ADDI    6'b001000
`define LW      6'b100011
`define SW      6'b101011
`define HLT     6'b001101

// func
`define AND     6'b100100
`define OR      6'b100101
`define SLL     6'b000000
`define SRL     6'b000010
`define ADD     6'b100000
`define SUB     6'b100010
`define MUL     6'b011000

// Execution steps

`define IDLE    0
`define IF      1
`define ID      2
`define EX      3
`define MEM     4
`define WB      5

// Miscellaneous

`define TRUE            1
`define FALSE           0

`define LEFT            1
`define RIGHT           0

`define DB_ON           debug = 1
`define DB_OFF          debug = 0









