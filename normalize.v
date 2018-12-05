`timescale 1ns / 1ps

module normalize(srd,e5d,mfd,sr1,en,mn,if_equal,add_sub,if_zero);
	input srd;
	input[4:0] e5d;
	input[11:0] mfd;
	output  sr1;
	output reg [4:0] en;
	output reg [10:0] mn;
	input if_equal;
	input add_sub;
	input[1:0] if_zero;
	
	//reg [10:0]temp_mn;
	//assign temp_mn=mfd[11:1];
	assign sr1 = srd;
	
	
	always @(mfd or e5d or if_equal or add_sub or if_zero)
		begin
			if(if_equal==1 && add_sub==1)
				begin
					mn <= mfd[10:0];
					en <= e5d;
				end
			else if(if_zero==2'b11 && add_sub ==0)
				begin
					mn <= mfd[10:0];
					en <= e5d;
				end
			else if(mfd[11]==1)
				begin
				  mn <= mfd[11:1];
				  en <= e5d+1;
				end
			else if(mfd[10]==1)
				begin
				  mn <= mfd[10:0];
				  en <= e5d;
				end
			else if(mfd[9]==1)
				begin
				  mn <= mfd[10:0]<<1;
				  en <= e5d-1;
				end
			else if(mfd[8]==1)
				begin
				  mn <= mfd[10:0]<<2;
				  en <= e5d-2;
				end
			else if(mfd[7]==1)
				begin
				  mn <= mfd[10:0]<<3;
				  en <= e5d-3;
				end
			else if(mfd[6]==1)
				begin
				  mn <= mfd[10:0]<<4;
				  en <= e5d-4;
				end
			else if(mfd[5]==1)
				begin
				  mn <= mfd[10:0]<<5;
				  en <= e5d-5;
				end
			else if(mfd[4]==1)
				begin
				  mn <= mfd[10:0]<<6;
				  en <= e5d-6;
				end
			else if(mfd[3]==1)
				begin
				  mn <= mfd[10:0]<<7;
				  en <= e5d-7;
				end
			else if(mfd[2]==1)
				begin
				  mn <= mfd[10:0]<<8;
				  en <= e5d-8;
				end
			else if(mfd[1]==1)
				begin
				  mn <= mfd[10:0]<<9;
				  en <= e5d-9;
				end
			else
				begin
				  mn <= mfd[10:0]<<10;
				  en <= e5d-10;
				end
			
		end
	
	  
	
endmodule
