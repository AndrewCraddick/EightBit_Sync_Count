`timescale 1ns / 1ps


module Binary_to_BCD_tb();
reg clock = 0;
reg [7:0] eight_bit_value;
wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;

Binary_to_BCD UUT (clock, eight_bit_value, ones, tens, hundreds);

always #1 clock = ~clock;
initial begin
   eight_bit_value = 0;
   # 25 eight_bit_value = 10;
   # 300 eight_bit_value = 248;
   # 300 eight_bit_value = 139;
 //# 500 $finish;
end

endmodule
