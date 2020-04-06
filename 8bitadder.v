module fulladder(Sum,Co,A,B,Ci);
	input A,B,Ci;
	output Sum,Co;
	wire 	S1,S2,S3;
		xor (Sum,A,B,Ci);
		and (S1,A,B);
		xor (S2,A,B);
		and	(S3,Ci,S2);
		or  (Co,S1,S3);
endmodule		

module bitfulladder(Sum,Co,A,B,Ci);
	input [7:0] A,B;
	input Ci;
	output [7:0]Sum,Co;
		fulladder	UO(Sum[0],Co[0],A[0],B[0],Ci);
		fulladder	U1(Sum[1],Co[1],A[1],B[1],Co[0]);
		fulladder 	U2(Sum[2],Co[2],A[2],B[2],Co[1]);
		fulladder	U3(Sum[3],Co[3],A[3],B[3],Co[2]);
		fulladder	U4(Sum[4],Co[4],A[4],B[4],Co[3]);
		fulladder	U5(Sum[5],Co[5],A[5],B[5],Co[4]);
		fulladder	U6(Sum[6],Co[6],A[6],B[6],Co[5]);
		fulladder	U7(Sum[7],Co[7],A[7],B[7],Co[6]);
endmodule
