`timescale 1ns / 1ps

module ripple_sub(dif,bout,a,b,bin);
	output [10:0] dif;
   output bout;
   input [10:0] a,b;
	input bin;
	wire [9:0] bx;


	full_sub FS1(dif[0],bx[0],a[0],b[0],bin),
				FS2(dif[1],bx[1],a[1],b[1],bx[0]),
            FS3(dif[2],bx[2],a[2],b[2],bx[1]),
            FS4(dif[3],bx[3],a[3],b[3],bx[2]),
				FS5(dif[4],bx[4],a[4],b[4],bx[3]),
				FS6(dif[5],bx[5],a[5],b[5],bx[4]),
				FS7(dif[6],bx[6],a[6],b[6],bx[5]),
				FS8(dif[7],bx[7],a[7],b[7],bx[6]),
				FS9(dif[8],bx[8],a[8],b[8],bx[7]),
				FS10(dif[9],bx[9],a[9],b[9],bx[8]),
				FS11(dif[10],bout,a[10],b[10],bx[9]);


endmodule
