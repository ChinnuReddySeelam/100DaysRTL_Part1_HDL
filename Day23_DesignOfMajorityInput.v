module MajorityInputCircuit(
input [4:0] A,
output Y
);
wire [11:0]W;
and G1(W[0],A[0],A[1],A[2]);
and G2(W[1],A[0],A[1],A[3]);
and G3(W[2],A[0],A[1],A[4]);
and G4(W[3],A[0],A[2],A[3]);
and G5(W[4],A[0],A[2],A[4]);
and G6(W[5],A[0],A[3],A[4]);
and G7(W[6],A[1],A[2],A[3]);
and G8(W[7],A[1],A[2],A[4]);
and G9(W[8],A[1],A[3],A[4]);
and G10(W[9],A[2],A[3],A[4]);
or G11(W[10],W[0],W[1],W[2],W[3],W[4]);
or G12(W[11],W[5],W[6],W[7],W[8],W[9]);
assign Y=W[10] | W [11];
endmodule