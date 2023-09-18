module Mux_tb #(parameter N = 32, M = 5) ();
 reg [N-1:0] A;
 reg [M-1:0] S;
 wire Y;
 Mux DUT(A,S,Y);
 initial begin 
 A=32'd9944;
 for(int i=0;i<32;i++) begin
 S=i;#10;
 $display("A=%b,S=%b,Y=%b",A,S,Y);
 if(S==31) begin $display("Completed") ;$finish();end
 end
 end
endmodule