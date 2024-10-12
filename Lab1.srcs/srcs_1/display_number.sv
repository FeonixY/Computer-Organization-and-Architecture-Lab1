`define X0 7'b0000001
`define X1 7'b1001111
`define X2 7'b0010010
`define X3 7'b0000110
`define X4 7'b1001100
`define X5 7'b0100100
`define X6 7'b0100000
`define X7 7'b0001111
`define X8 7'b0000000
`define X9 7'b0000100

module display_number
(
input [3:0] in,
output [6:0] out
);

reg [6:0] result;
assign out = result;
always_comb
begin
    case (in)
        4'b0000: result = `X0;
        4'b0001: result = `X1;
        4'b0010: result = `X2;
        4'b0011: result = `X3;
        4'b0100: result = `X4;
        4'b0101: result = `X5;
        4'b0110: result = `X6;
        4'b0111: result = `X7;
        4'b1000: result = `X8;
        4'b1001: result = `X9;
        4'b1111: result = 7'b1111111;
        default: result = 7'b1111111;
    endcase
end

endmodule