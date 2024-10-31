// Parameter declaration

`define BYTE            3:0
`define DATAWIDTH       4
`define ADDRWIDTH       4
`define DATA            `DATAWIDTH-1:0
`define ADDR            `ADDRWIDTH-1:0
`define REGWIDTH        3
`define RDDR            `REGWIDTH-1:0
`define MAXREGS         1<<`REGWIDTH
`define MEMSIZE         4
`define DATAWIDTH1      32
`define DATA1           `DATAWIDTH1-1:0 

`define CLOCKPERIOD     20


// Instruction fields
`define EX_OPCODE       ID_EX_IR[31:26]

// I-Type Instruction
`define IRS             IF_ID_IR[23:21]
`define IRD             MEM_WB_IR[18:16]
`define IMM             IF_ID_IR[1:0]

// R-Type Instruction
`define RRS1            IF_ID_IR[23:21]
`define RRS2            IF_ID_IR[18:16]
`define RRD             MEM_WB_IR[13:11]
`define SHAMT           ID_EX_IR[7:6]
`define EX_FUNC         ID_EX_IR[5:0]

// J-Type Instruction
`define OFFSET          IF_ID_IR[1:0]

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

// Control fields
`define WB_RegRW        MEM_WB_WBCTRL[2]
`define WB_RegDst       MEM_WB_WBCTRL[1]
`define WB_WBSel        MEM_WB_WBCTRL[0]

`define MEM_MemRW       EX_MEM_MEMCTRL[2]
`define MEM_JmpE        EX_MEM_MEMCTRL[1]
`define MEM_BraE        EX_MEM_MEMCTRL[0]

`define EX_ALUOp        ID_EX_EXCTRL[4:3]
`define EX_ZSel         ID_EX_EXCTRL[2]
`define EX_ALUInA       ID_EX_EXCTRL[1]
`define EX_ALUInB       ID_EX_EXCTRL[0]

// Execution steps
`define IDLE    0
`define IF      1
`define ID      2
`define EX      3
`define MEM     4
`define WB      5




// Miscellaneous
/*
`define TRUE            1
`define FALSE           0

`define LEFT            1
`define RIGHT           0
*/










