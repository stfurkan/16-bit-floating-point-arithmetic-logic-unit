`timescale 1ns / 1ps

module full_add(sum,cout,a,b,cin);
	output sum,cout;
   input a,b,cin;
	
	assign sum = cin ^ a ^ b;
	assign cout = ~cin & a & b | cin & (a | b );

endmodule
