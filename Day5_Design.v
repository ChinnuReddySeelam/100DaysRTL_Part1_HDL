module FA(
        input a,b,cin,
        output C,S
        );
            assign {C,S}=a+b+cin;
endmodule
module RCA( 
        input [3:0] A,B,
        input Cin,
        output [4:0] result
          );
          wire carry;
          wire [3:0]sum;
          wire carry1,carry2,carry3,carry4;
          FA FA1(A[0],B[0],Cin,carry1,sum[0]);
          FA FA2(A[1],B[1],carry1,carry2,sum[1]);
          FA FA3(A[2],B[2],carry2,carry3,sum[2]);
          FA FA4(A[3],B[3],carry3,carry,sum[3]);
 
          assign result={carry,sum};
 endmodule