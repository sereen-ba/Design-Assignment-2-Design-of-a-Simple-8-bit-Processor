`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:21:40 PM
// Design Name: 
// Module Name: simple8BitProc
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


module simple8BitProcessor(
    input  [7:0] dataIn,
    output [7:0] dataOut,
	 input  [8:0] func,
	 input  clock
    );
	// 000 000 000
	// 876 543 210
	 
	 wire [2:0] opCode = func[8:6];//8 7 6
	 wire [2:0] Rx = func[5:3]; //5 4 3 
	 wire [2:0] Ry = func[2:0]; //2 1 0

	 wire [1:0] destSrc;
	 wire regWrite;
	 wire [2:0] AddSub;
	 
	 controlUnit CU(opCode, regWrite, AddSub, destSrc);
	 dataPath    DP(dataIn, Rx, Ry, dataOut, AddSub, destSrc, regWrite, clock);

endmodule
