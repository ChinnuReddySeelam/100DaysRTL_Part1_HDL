module Multiplier_4bit(input [3:0] A,B,output [7:0] result);wire [7:0] M [3:0];wire [7:0] S [1:0];assign M[0]=({4{A[0]}})&B[3:0];assign M[1]=({4{A[1]}})&B[3:0];assign M[2]=({4{A[2]}})&B[3:0];assign M[3]=({4{A[3]}})&B[3:0];assign S[0]=(M[0])+(M[1]<<1);assign S[1]=(S[0])+(M[2]<<2);assign result=(S[1])+(M[3]<<3);endmodule