`timescale 1ns / 1ps

module dff2bit (clk,rst,d,q);
  input clk;
  input rst;
  input[1:0] d;
  output reg[1:0] q;

  always @(posedge clk)
		begin
		  if(rst==1) 
			begin
				q<=0;
			end
		  else 
			begin 
				q<=d;
			end
		end

endmodule
