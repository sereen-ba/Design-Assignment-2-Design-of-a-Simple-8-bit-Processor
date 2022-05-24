`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:26:53 PM
// Design Name: 
// Module Name: testProc
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


module testProc;

	// Inputs
	reg [7:0] dataIn;
	reg [8:0] func;
	reg clock;

	// Outputs
	wire [7:0] dataOut;

	// Instantiate the Unit Under Test (UUT)
	simple8BitProcessor uut (
		.dataIn(dataIn), 
		.dataOut(dataOut), 
		.func(func), 
		.clock(clock)
	);
	
	always
		#5 clock = ~clock;

	initial begin
		// Initialize Inputs
		dataIn = 0;
		func = 0;
		clock = 0;

        
      @(negedge clock);
		dataIn = 2;
		func = 9'b000_001_000; //load R1, 2	r1	
		
		@(negedge clock);
		dataIn = 1;	
		func = 9'b000_000_000;	//load R0, 1 r0
		
		@(negedge clock);
		func = 9'b010_001_000;  // add R1,R0 =011 r1
		
		@(negedge clock);
		func = 9'b001_011_001;  // mov R3,R1 =011 r3 R3=R1 we are moving data from r1 to R3
		
		
		@(negedge clock);
		func = 9'b011_001_000;  // sub R1,R0 010
			@(negedge clock);
		dataIn = 1;	
		func = 9'b000_010_000;	//load R2, 1 r2->1
		
		@(negedge clock);
		func = 9'b100_001_010;  // and R1,R2 010&001=000 r1 //
		
		
		@(negedge clock);
		func = 9'b110_011_000;  // xor R3,R0 r3=011^001=010 r3
		
		@(negedge clock);
		func = 9'b101_011_000;  // or R3,R0	r0=010 or 001 = 011 r3
		
		@(negedge clock);
			dataIn = 0;
		func = 9'b111_000_011;  // store R3->dataout 011 // we are saving the data in r3
		// 3'b111: ctrlSignals = 6'b0000_01;//store r-> out
		#20
		$finish;

	end
      
endmodule
