`timescale 1ns / 1ps

module unpack(a,b,s1,s2,e1,e2,m1,m2,if_equal,if_zero);
	input[15:0] a;
	input[15:0] b;
	output s1;
	output s2;
	output[4:0] e1;
	output[4:0] e2;
	output[10:0] m1;
	output[10:0] m2;
	output reg if_equal;
	output reg [1:0] if_zero;
	
	assign s1 = a[15];
	assign s2 = b[15];
	assign e1 = a[14:10];
	assign e2 = b[14:10];
	assign m1[10] = 1'b1;
	assign m1[9:0] = a[9:0];
	assign m2[10] = 1'b1;
	assign m2[9:0] = b[9:0];
	
	always @(a or b)
		begin
			if (a==b) 
				begin
					if_equal <= 1'b1;
				end 
			else 
				begin
					if_equal <= 1'b0;
				end
		end
		
	always @(a or b)
		begin
			if (a[14:0]==0 && b[14:0]==0) 
				begin
					if_zero[0] <= 1'b1;
					if_zero[1] <= 1'b1;
				end 
			else if (a[14:0]==0)
				begin
					if_zero[0] <= 1'b1;
					if_zero[1] <= 1'b0;
				end
			else if (b[14:0]==0)
				begin
					if_zero[0] <= 1'b0;
					if_zero[1] <= 1'b1;
				end
			else
				begin
					if_zero[0] <= 1'b0;
					if_zero[1] <= 1'b0;
				end
		end


endmodule
