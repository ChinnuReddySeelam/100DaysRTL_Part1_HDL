module FA(input a,b,cin,output C,S);
        assign {C,S}=a+b+cin;
endmodule
module CLHA(input [3:0] A,B,output [4:0] result);
          wire [4:0] Ci;
          wire [3:0] Gi,Pi;
          wire [3:0] Sum;
          //Full adders
          FA FA1(A[0],B[0],Ci[0],carry,Sum[0]);
          FA FA2(A[1],B[1],Ci[1],carry,Sum[1]);
          FA FA3(A[2],B[2],Ci[2],carry,Sum[2]);
          FA FA4(A[3],B[3],Ci[3],carry,Sum[3]);
          //carry propagate terms
          assign Pi[0]=A[0]|B[0];
          assign Pi[1]=A[1]|B[1];
          assign Pi[2]=A[2]|B[2];
          assign Pi[3]=A[3]|B[3];
          //carry generate terms
          assign Gi[0]=A[0]&B[0];
          assign Gi[1]=A[1]&B[1];
          assign Gi[2]=A[2]&B[2];
          assign Gi[3]=A[3]&B[3];
          //Carry terms
          assign Ci[0]=1'b0;
          assign Ci[1]=Gi[0] | (Ci[0] & Pi[0]);
          assign Ci[2]=Gi[1] | (Ci[1] & Pi[1]);
          assign Ci[3]=Gi[2] | (Ci[2] & Pi[2]);
          assign Ci[4]=Gi[3] | (Ci[3] & Pi[3]);
          //Result
          assign result={Ci[4],Sum};
 endmodule