`timescale 1ns / 1ps

module ripple_add_sub(
    input [12:0] a,
    input [12:0] b,
    output [12:0] sum,
    input add_sub
    );

reg [12:0]b_twos_complement;

//assign b_twos_complement=(~add_sub & b) | (add_sub & ~b);

always @(add_sub or b)
		begin
			if(add_sub==1)
				begin
				  b_twos_complement = ~b;
				end
			else
			  begin
				  b_twos_complement = b;
			end
		end


ripple_add RCAS(sum,a,b_twos_complement,add_sub);

endmodule
