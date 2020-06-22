`timescale 1ns / 1ps


module seven_seg_controller(
input wire refresh_clock, // 100MHz
input wire [3:0] Ones,
input wire [3:0] Tens,
input wire [3:0] Hundreds,
output wire [3:0] anode, 
output wire [7:0] cathode
);

wire [1:0] refreshcounter; /* used to connect refreshcounter within this module
                              from RefreshCounter to anode_control & BCD_control */
wire [3:0] ONE_DIGIT; /* used to connect ONE_DIGIT from BCD_control to
                         BCD_to_Cathodes which selects correct segments on display */

//---------  Modules for 7 segment display --------------

RefreshCounter RefreshCounter_wrapper(
.refresh_clock   ( refresh_clock  ), // 10kHz
.refreshcounter  ( refreshcounter )  // [1:0]
);

anode_control anode_control_wrapper(
.refreshcounter  ( refreshcounter ), // [1:0]
.anode           ( anode          )  // [3:0]
);

BCD_control BCD_control_wrapper(
.digit1          ( Ones           ), // [3:0]...
.digit2          ( Tens           ),
.digit3          ( Hundreds       ), // ...[3:0]
.digit4          ( 4'b0           ), // set digit 4 to zero
.refreshcounter  ( refreshcounter ), // [1:0]
.ONE_DIGIT       ( ONE_DIGIT      )  // [3:0] the one digit that will be
);                                   // passed to anode & cathodes to be
                                     // displayed


BCD_to_Cathodes BCD_to_Cathodes_wrapper(
.digit           ( ONE_DIGIT      ),
.cathode         ( cathode        )
);

endmodule
