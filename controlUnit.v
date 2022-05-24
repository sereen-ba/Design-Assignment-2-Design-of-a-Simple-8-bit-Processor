`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:22:32 PM
// Design Name: 
// Module Name: controlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controlUnit(
  input [2:0] opCode,
  output regWrite,
  output [2:0]AddSub,
  output [1:0] destSrc);
  
  reg [5:0] ctrlSignals;
  assign {regWrite, AddSub, destSrc} = ctrlSignals;

  always @(*)
    case(opCode)        // regWrite, AddSub, destSrc
      3'b000: ctrlSignals = 6'b1000_00; // load x ->r
      3'b001: ctrlSignals = 6'b1000_01; // move r->r
      3'b010: ctrlSignals = 6'b1001_10; // add
      3'b011: ctrlSignals = 6'b1101_10; // sub		
		3'b100: ctrlSignals = 6'b1010_10; //and
		3'b101: ctrlSignals = 6'b1011_10; // or
		3'b110: ctrlSignals = 6'b1100_10; // xor
		3'b111: ctrlSignals = 6'b0000_01;//store r-> out
      default:  ctrlSignals = 6'b0000_00;
    endcase
endmodule
