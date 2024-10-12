`define AND_A 7'b0001000
`define OR_b 7'b1100000
`define ADD_C 7'b0110001
`define NAND_d 7'b1000010
`define NOR_E 7'b0110000
`define SUB_F 7'b0111000
`define SLT_G 7'b0100001
`define EQUAL 7'b1110110
`define EMPTY 7'b1111111

module display_op
(
input [3:0] in,
output [6:0] out
);

reg [6:0] result;
assign out = result;
always_comb
begin
    case (in)
        4'b0000: result = `AND_A;
        4'b0001: result = `OR_b;
        4'b0010: result = `ADD_C;
        4'b0011: result = `EQUAL;
        4'b0100: result = `NAND_d;
        4'b0101: result = `NOR_E;
        4'b0110: result = `SUB_F;
        4'b0111: result = `SLT_G;
        4'b1111: result = `EMPTY;
        default: result = `EMPTY;
    endcase
end

endmodule
