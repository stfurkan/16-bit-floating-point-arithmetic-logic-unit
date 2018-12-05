`timescale 1ns / 1ps

module dff (clk,rst,d,q);
  input clk;
  input rst;
  input d;
  output reg q;

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
