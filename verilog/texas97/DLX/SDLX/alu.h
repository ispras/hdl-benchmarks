// ALUOp defines

`define ALUOPWIDTH      2
`define ALUO            `ALUOPWIDTH-1:0

`define MEMACC          2'b00
`define BRANCH          2'b01
`define RTYPE           2'b10
`define ITYPE           2'b11

// ALU actions

`define ALUCTRLWIDTH    3
`define ALUC            `ALUCTRLWIDTH-1:0

`define ALUAND          3'b000
`define ALUOR           3'b001
`define ALUADD          3'b010
`define ALUSUB          3'b011
`define ALUMUL          3'b100
`define ALUSHL          3'b101
`define ALUSHR          3'b110
