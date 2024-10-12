module display
(
input clk,
input [31:0] num1,
input [31:0] num2,
input [31:0] result,
input [2:0] op,
output reg [7:0] AN,
output reg [6:0] A2G
);

reg [19:0] clkdiv;
reg [2:0] s;
reg [3:0] temp_num, temp_op;
reg [3:0] num1_unit, num1_ten, num2_unit, num2_ten, result_unit, result_ten;
reg [6:0] A2G_num, A2G_op;

bin2bcd bin2bcd_num1(num1, num1_unit, num1_ten);
bin2bcd bin2bcd_num2(num2, num2_unit, num2_ten);
bin2bcd bin2bcd_result(result, result_unit, result_ten);

always @(posedge clk)
    clkdiv <= clkdiv + 1;
assign s = clkdiv[19:17];
always_comb 
    case(s)
        0:
        begin
            AN = 8'b01111111;
            temp_num = num1_ten;
            temp_op = 4'b1111;
        end
        1:
        begin
            AN = 8'b10111111;
            temp_num = num1_unit;
            temp_op = 4'b1111;
        end
        2:
        begin
            AN = 8'b11011111;
            temp_num = 4'b1111;
            temp_op = {1'b0,op};
        end
        3:
        begin
            AN = 8'b11101111;
            temp_num = num2_ten;
            temp_op = 4'b1111;
        end
        4:
        begin
            AN = 8'b11110111;
            temp_num = num2_unit;
            temp_op = 4'b1111;
        end
        5:
        begin
            AN = 8'b11111011;
            temp_num = 4'b1111;
            temp_op = 4'b0011;
        end
        6:
        begin
            AN = 8'b11111101;
            temp_num = result_ten;
            temp_op = 4'b1111;
        end
        7:
        begin
            AN = 8'b11111110;
            temp_num = result_unit;
            temp_op = 4'b1111;
        end
        default:
        begin
            AN = 8'b00000000;
            temp_num = 4'b1111;
            temp_op = 4'b1111;
        end
    endcase

display_number display_number(temp_num, A2G_num);
display_op display_op(temp_op, A2G_op);

always @(posedge clkdiv)
    if (A2G_num == 7'b1111111)
        A2G <= A2G_op;
    else if (A2G_op == 7'b1111111)
        A2G <= A2G_num;
    else
        A2G <= 7'b1111111;

endmodule
