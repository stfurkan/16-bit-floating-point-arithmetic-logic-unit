`timescale 1ns / 1ps

module add_sub(sc1d,sc2d,e3d,mc1d,mc2d,sr,e5,mf,add_sub,if_equal);
	input sc1d;
	input sc2d;
	input[4:0] e3d;
	//input[4:0] e4d;
	input[10:0] mc1d;
	input[10:0] mc2d;
	input add_sub;
   output reg sr;
	output [4:0] e5;
	output reg[11:0] mf;
	input if_equal;

   wire [12:0]temp_mc1d;
	wire [12:0]temp_mc2d;
	
	assign temp_mc1d[12:11]=2'b00;
	assign temp_mc2d[12:11]=2'b00;
		
	assign temp_mc1d[10:0]=mc1d;
	assign temp_mc2d[10:0]=mc2d;

   reg [12:0]temp_a;
	reg [12:0]temp_b;
	wire [12:0]temp_sum;
	wire [12:0]comp_temp_sum;

	always @(sc1d or temp_mc1d)
		begin
			if(sc1d==1)
				begin
				  temp_a= ~temp_mc1d+1;
				end
			else
			  begin
				  temp_a= temp_mc1d;
			end
		end
   
   always @(sc2d or temp_mc2d)
		begin
			if(sc2d==1)
				begin
				  temp_b= ~temp_mc2d+1;
				end
			else
			  begin
				  temp_b= temp_mc2d;
			end
		end
		
   ripple_add_sub addsub(temp_a,temp_b,temp_sum,add_sub);
	
	assign comp_temp_sum=~temp_sum[12:0]+1;

	assign e5=e3d;
	
	always @(temp_sum or comp_temp_sum or add_sub or if_equal or sc1d)
		begin
			if(add_sub==1 && if_equal==1)
				begin
				  sr=sc1d;
				  mf=12'b000000000000;
				end
			else if(temp_sum[12]==0)
				begin
				  sr=0;
				  mf=temp_sum[11:0];
				end
			else begin
				  sr=1;
				  mf=comp_temp_sum[11:0];
			end
		end

endmodule
