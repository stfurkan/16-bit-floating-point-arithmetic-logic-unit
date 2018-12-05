`timescale 1ns / 1ps

module ex_check(sr1d,ed,mnd,sr2,ec,mc,st);
	input sr1d;
	input[4:0] ed;
	input[10:0] mnd;
	output sr2;
	output reg[4:0] ec;
	output reg[9:0] mc;
	output reg[1:0] st;
	
	assign sr2 = sr1d;
	//assign ec = ed;
	//assign mc = mnd[9:0];
	
	always @(ed or mnd)
		begin
			
			if(ed==31)
				begin
					st<= 2'b01; //overflow
					ec<=5'b11110;
					mc<=10'b1111111111;
				end
			else if(ed==1)
				begin
					st<=2'b10; //underflow
					ec<=ed;
					mc<=mnd[9:0]; // underflow ciktisi nasil olmali ?
				end
			else if(ed==0 && mnd==0)
				begin
					st<=2'b00; //result zero
					ec<=5'b00000;
					mc<=10'b0000000000;
				end
			else
				begin
					st<=2'b11; //normal operation
					ec<=ed;
					mc<=mnd[9:0];
				end
			
		end
		


endmodule