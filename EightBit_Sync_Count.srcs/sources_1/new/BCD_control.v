`timescale 1ns / 1ps


// This module selects which digit will be passed to the anode & cathode
module BCD_control(
input [3:0] digit1, // rightmost digit
input [3:0] digit2,
input [3:0] digit3,
input [3:0] digit4, // leftmost digit
input [1:0] refreshcounter,
output reg [3:0] ONE_DIGIT = 0 // choose which input digit to display
);

always@(refreshcounter) begin
    case(refreshcounter) // the value of refreshcounter selects which 'case' is true
        2'd0: // case 1
            ONE_DIGIT = digit1; // digit 1 ON (rightmost digit)...
        2'd1: // case 2... etc
            ONE_DIGIT = digit2; 
        2'd2:
            ONE_DIGIT = digit3;
        2'd3:
            ONE_DIGIT = digit4; // ... digit 4 ON (leftmost digit)
    endcase
end

endmodule
