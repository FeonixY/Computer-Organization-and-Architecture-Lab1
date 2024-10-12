module bin2bcd
(
input wire [31:0] data,
output reg [3:0] unit,
output reg [3:0] ten
);

assign unit = data % 10;
assign ten = (data / 10) % 10;

endmodule
