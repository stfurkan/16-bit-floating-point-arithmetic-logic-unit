`timescale 1ns / 1ps

module half_add(sum,c,a,b);
	output sum,c;
	input a,b;
	
	xor(sum,a,b);
	and(c,a,b);


endmodule
