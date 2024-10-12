`define MAX_WIDTH 32
`define OP_WIDTH 3
`define AND `OP_WIDTH'b000
`define OR `OP_WIDTH'b001
`define ADD `OP_WIDTH'b010
`define NAND `OP_WIDTH'b100
`define NOR `OP_WIDTH'b101
`define SUB `OP_WIDTH'b110
`define SLT `OP_WIDTH'b111

module alu
(
input [`MAX_WIDTH - 1:0] in1,
input [`MAX_WIDTH - 1:0] in2,
input [`OP_WIDTH - 1:0] op,
output reg [`MAX_WIDTH - 1:0] out,
output reg OF, CF, ZF, SF
);
reg [`MAX_WIDTH:0] temp_out;

assign out = temp_out[`MAX_WIDTH - 1:0];
always_comb
begin
    case (op)
        `AND:
        begin
            temp_out = in1 & in2;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `OR:
        begin
            temp_out = in1 | in2;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `ADD:
        begin
            temp_out = in1 + in2;
            OF = (in1[`MAX_WIDTH - 1] & in2[`MAX_WIDTH - 1] & ~out[`MAX_WIDTH - 1]) | (~in1[`MAX_WIDTH - 1] & ~in2[`MAX_WIDTH - 1] & out[`MAX_WIDTH - 1]);
            CF = temp_out[`MAX_WIDTH];
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `NAND:
        begin
            temp_out = in1 & ~in2;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `NOR:
        begin
            temp_out = in1 | ~in2;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `SUB:
        begin
            temp_out = in1 - in2;
            OF = (in1[`MAX_WIDTH - 1] & ~in2[`MAX_WIDTH - 1] & ~out[`MAX_WIDTH - 1]) | (~in1[`MAX_WIDTH - 1] & ~in2[`MAX_WIDTH - 1] & out[`MAX_WIDTH - 1]);
            CF = temp_out[`MAX_WIDTH];
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `SLT:
        begin
            temp_out = in1 < in2 ? 1 : 0;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = 0;
        end
        default:
        begin
            temp_out = 0;
            OF = 0;
            CF = 0;
            ZF = 0;
            SF = 0;
        end
    endcase
end

endmodule

