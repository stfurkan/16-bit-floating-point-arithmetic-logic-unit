`timescale 1ns / 1ps
module packer(sr2d,ecd,mcd,std,out,status,valid);
	input sr2d;
	input[4:0] ecd;
	input[9:0] mcd;
	input[1:0] std;
	output[15:0] out;
	output[2:0] status;
	output reg valid;
	
	assign out = {sr2d,ecd,mcd[9:0]};
	assign status[2] = 0;
	assign status[1:0] = std;
	
	always@*
	begin
		if ( out == {sr2d,ecd,mcd[9:0]})
		valid <= 1;
	else 
		valid <= 0;
    end
	end

endmodule
