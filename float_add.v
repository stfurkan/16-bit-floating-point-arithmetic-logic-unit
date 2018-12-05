`timescale 1ns / 1ps
module float_add(a,b,add_sub,clk,rst,out,status,valid);
	input[15:0] a;
	input[15:0] b;
	input add_sub;
	input clk;
	input rst;
	output[15:0] out;
	output[2:0] status;
	output valid;
	
	wire s1,s2;
	wire[4:0] e1,e2;
	wire[10:0] m1,m2;
	wire if_equal;
	wire[1:0] if_zero;
	
	unpack upck(a,b,s1,s2,e1,e2,m1,m2,if_equal,if_zero);

	wire s1d,sc1,sc1d;
	wire s2d,sc2,sc2d;
	wire[4:0] e1d,e3,e3d;
	wire[4:0] e2d;
	//wire[4:0] e4,e4d;
	wire[10:0] m1d,mc1,mc1d;
	wire[10:0] m2d,mc2,mc2d;
	
	wire sr,srd,sr1,sr1d,sr2,sr2d;
	wire[4:0] e5,e5d,en,ed,ec,ecd;
	wire[11:0] mf,mfd;
	wire[10:0] mn,mnd;

	wire[9:0] mc,mcd;
	
	wire[1:0] st,std;
	
	dff dff1(clk,rst,s1,s1d);
	dff dff2(clk,rst,s2,s2d);
	
	dff5bit dff3(clk,rst,e1,e1d);
	dff5bit dff4(clk,rst,e2,e2d);
	
	dff11bit dff5(clk,rst,m1,m1d);
	dff11bit dff6(clk,rst,m2,m2d);
	
	comp_shift cmpshift(s1d,s2d,e1d,e2d,m1d,m2d,sc1,sc2,e3,mc1,mc2);
	
	dff dff7(clk,rst,sc1,sc1d);
	dff dff8(clk,rst,sc2,sc2d);
	dff5bit dff9(clk,rst,e3,e3d);
	//dff5bit dff10(clk,rst,e4,e4d);
	dff11bit dff11(clk,rst,mc1,mc1d);
	dff11bit dff12(clk,rst,mc2,mc2d);
	
	add_sub addsub(sc1d,sc2d,e3d,mc1d,mc2d,sr,e5,mf,add_sub,if_equal);
	
	dff dff13(clk,rst,sr,srd);
	dff5bit dff14(clk,rst,e5,e5d);
	dff12bit dff15(clk,rst,mf,mfd);
	
	normalize norma(srd,e5d,mfd,sr1,en,mn,if_equal,add_sub,if_zero);
	
	dff dff16(clk,rst,sr1,sr1d);
	dff5bit dff17(clk,rst,en,ed);
	dff11bit dff18(clk,rst,mn,mnd);
	
	ex_check excheck(sr1d,ed,mnd,sr2,ec,mc,st);
	
	dff dff19(clk,rst,sr2,sr2d);
	dff5bit dff20(clk,rst,ec,ecd);
	dff10bit dff21(clk,rst,mc,mcd);
	dff2bit dff22(clk,rst,st,std);
	
	packer pack(sr2d,ecd,mcd,std,out,status,valid);
	

endmodule
