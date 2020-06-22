`timescale 1ns / 1ps

module BCD_to_Cathodes(
input [3:0] digit,
output reg [7:0] cathode = 0
);

always@(digit) begin
   case(digit) /* each "place" in the 8-bit number represents a segment of the display,
                  refer to the basys manual (or any manual since all 7 segement 
                  displays work the same) to see why the order of the low active bits
                  below yield the associated numbers */
       4'd0:
          cathode = 8'b11000000; // zero, LSB is A and proceeds to G and then DP (MSB) 
       4'd1:
          cathode = 8'b11111001; // one
       4'd2:
          cathode = 8'b10100100; // two
       4'd3:
          cathode = 8'b10110000; // three
       4'd4:
          cathode = 8'b10011001; // four
       4'd5:
          cathode = 8'b10010010; // five
       4'd6:
          cathode = 8'b10010010; // six
       4'd7:
          cathode = 8'b11111000; // seven
       4'd8:
          cathode = 8'b10000000; // eight
       4'd9:
          cathode = 8'b10010000; // nine
       default
          cathode = 8'b11111111; // any other cathode will display nothing, all high active
   endcase
end

endmodule
