`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:25:13 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] parmA,
    input [7:0] parmB,
    input [2:0]AddSub,
    output reg [7:0] result
    );

	always @(*) 
	case(AddSub)
	3'b001:  result = parmA + parmB; // add
	3'b101:  result = parmA - parmB; //Sub
	3'b010:  result = parmA & parmB;//and
	3'b011:  result = parmA | parmB;//or
	3'b100:  result = parmA ^ parmB; //xor
	default:  result = 8'h000; 
	endcase


endmodule
