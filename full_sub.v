`timescale 1ns / 1ps

module full_sub(dif,bout,a,b,bin);
	output dif,bout;
	input a,b,bin;

	assign dif = a ^ b ^ bin;
	assign bout = ((~a) & b) | (b & bin) | (bin & (~a));


endmodule
