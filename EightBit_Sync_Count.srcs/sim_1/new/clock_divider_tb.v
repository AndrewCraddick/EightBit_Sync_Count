`timescale 1ns / 1ps

module clock_divider_tb;
reg clock = 0; // 100MHz
wire divided_clock;

// wrapper (this connects two modules together, data types must
// be connected appropriatedly, ie wire=>wire, reg=>reg
clock_divider UUT (
.clock(clock),
.divided_clock(divided_clock)
);
always #5 clock = ~clock; // every 10ns the clock flips which
// simulates the 100Mhz master clock of the FPGA board since
// 10ns = 100MHz

endmodule
