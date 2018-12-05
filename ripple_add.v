`timescale 1ns / 1ps

module ripple_add(sum,a,b,cin);
	output [12:0] sum;
   input [12:0] a,b;
	input cin;
	wire [11:0] c;
	
	full_add FA0(sum[0],c[0],a[0],b[0],cin),
				FA1(sum[1],c[1],a[1],b[1],c[0]),
				FA2(sum[2],c[2],a[2],b[2],c[1]),
				FA3(sum[3],c[3],a[3],b[3],c[2]),
				FA4(sum[4],c[4],a[4],b[4],c[3]),
				FA5(sum[5],c[5],a[5],b[5],c[4]),
				FA6(sum[6],c[6],a[6],b[6],c[5]),
				FA7(sum[7],c[7],a[7],b[7],c[6]),
				FA8(sum[8],c[8],a[8],b[8],c[7]),
				FA9(sum[9],c[9],a[9],b[9],c[8]),
				FA10(sum[10],c[10],a[10],b[10],c[9]),
				FA11(sum[11],c[11],a[11],b[11],c[10]);
				
	assign sum[12] = a[12] ^ b[12] ^ c[11];
				
endmodule
