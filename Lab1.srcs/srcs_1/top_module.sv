module top_module
(
input CLK100MHZ,
input [3:0] num1,
input [3:0] num2,
input [2:0] op,
output [7:0] AN,
output [6:0] A2G,
output OF_LED, CF_LED, ZF_LED, SF_LED
);

reg [31:0] in1, in2, out;

assign in1 = {28'b0,num1};
assign in2 = {28'b0,num2};
alu alu(in1, in2, op, out, OF_LED, CF_LED, ZF_LED, SF_LED);
display display(CLK100MHZ, in1, in2, out, op, AN, A2G);

endmodule
