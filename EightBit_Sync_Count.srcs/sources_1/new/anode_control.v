`timescale 1ns / 1ps

module anode_control(
input [1:0] refreshcounter, // 10kHz, this is 1ms refresh period for all 4 digits
output reg [3:0] anode = 0 /* We describe the state of each digit with a 4-bit binary
                              number & begin with all digits set to 0 */
);

always@(refreshcounter) begin // execute when refreshcounter changes
    /* Here we choose which digit to turn on, these are LOW ACTIVE digits so
       a 0 corresponds to being ON. */
    case(refreshcounter) // the value of refreshcounter selects which 'case' is true
        2'b00: // case 1
            anode = 4'b1110; // digit 1 ON (rightmost digit)
        2'b01: // case 2... etc
            anode = 4'b1101; // digit 2 ON
        2'b10:
            anode = 4'b1011; // digit 3 ON
        2'b11:
            anode = 4'b0111; // digit 4 ON (leftmost digit)
    endcase
end

endmodule
