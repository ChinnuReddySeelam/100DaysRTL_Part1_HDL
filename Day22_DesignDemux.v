module Mux #(parameter N = 32, M = 5) ( //M=log2(M)
    input  A, //Parallel Data  as input
    input [M-1:0] S,
    output reg [N-1:0] Y // Serial Data as output
);
always @(*) begin 
for(int i=0;i<N;i++) begin
for (int j=0;j<N;j++) begin  
case(S) 
i:begin 
        Y[j]=0;
        if(i==j) Y[i]=A;
  end 
endcase
end
end
end
endmodule
