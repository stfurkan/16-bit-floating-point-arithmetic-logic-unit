`timescale 1ns / 1ps
module comp_shift(s1d,s2d,e1d,e2d,m1d,m2d,sc1,sc2,e3,mc1,mc2);
	input s1d;
	input s2d;
	input[4:0] e1d;
	input[4:0] e2d;
	input[10:0] m1d;
	input[10:0] m2d;
	output sc1;
	output sc2;
	output reg[4:0] e3;
	//output reg[4:0] e4;
	output reg[10:0] mc1;
	output reg[10:0] mc2;
	
wire [5:0]temp_e1;
wire [5:0]temp_e2;
wire [5:0]temp_e1_e2;

assign sc1=s1d;
assign sc2=s2d;

assign temp_e1[5]=1'b0;
assign temp_e1[4:0]=e1d;

assign temp_e2[5]=1'b0;
assign temp_e2[4:0]=e2d;

assign temp_e1_e2=temp_e1+~temp_e2+1;

			
	always @(temp_e1_e2 or e1d or e2d)
		begin
			if (temp_e1_e2==0) 
				begin
					e3<=e1d;
					//e4<=e2d;
				end 
			else if(temp_e1_e2[5]==1)
				begin
					e3<=e2d;
					//e4<=e2d;
				end
			else
				begin
					e3<=e1d;
					//e4<=e1d;
				end
		end
		
	always @(temp_e1_e2 or m1d or m2d)
		begin
			if (temp_e1_e2[5]==0) begin 		
		     case(temp_e1_e2) 
             0 : begin mc1=m1d; mc2=m2d; end
             1 : begin mc1=m1d; mc2={1'b0,m2d[10:1]}; end
             2 : begin mc1=m1d; mc2={1'b0,1'b0,m2d[10:2]}; end 
             3 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,m2d[10:3]}; end 
             4 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,m2d[10:4]}; end 
             5 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,1'b0,m2d[10:5]}; end 
             6 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m2d[10:6]}; end 
             7 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m2d[10:7]}; end 
             8 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m2d[10:8]}; end 
             9 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m2d[10:9]}; end 
             10 : begin mc1=m1d; mc2={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m2d[10]}; end 
             default : begin mc1=m1d; mc2=11'b00000000000; end 
           endcase 
			end
			else begin 		
		     case(temp_e1_e2) 
             0 : begin mc2=m2d; mc1=m1d; end
             63 : begin mc2=m2d; mc1={1'b0,m1d[10:1]}; end
             62 : begin mc2=m2d; mc1={1'b0,1'b0,m1d[10:2]}; end 
             61 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,m1d[10:3]}; end 
             60 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,m1d[10:4]}; end 
             59 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,1'b0,m1d[10:5]}; end 
             58 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m1d[10:6]}; end 
             57 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m1d[10:7]}; end 
             56 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m1d[10:8]}; end 
             55 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m1d[10:9]}; end 
             54 : begin mc2=m2d; mc1={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m1d[10]}; end 
             default : begin mc2=m2d; mc1=11'b00000000000; end 
           endcase 
			end
		end
			
endmodule
