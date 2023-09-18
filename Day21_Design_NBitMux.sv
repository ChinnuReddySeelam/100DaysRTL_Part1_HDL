module Mux #(parameter N = 32, M = 5) ( //M=log2(M)
    input [N-1:0] A, //Parallel Data  as input
    input [M-1:0] S,
    output reg Y // Serial Data as output
);
always @(*) begin 
for(int i=0;i<N;i++) begin
case (S) 
i:Y=A[i];
endcase
end
end
endmodule
