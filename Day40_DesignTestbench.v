module tb;
reg clk,sig;
wire negEdgeSig;
negtiveEdgeDetector DUT(clk,sig,negEdgeSig);
initial begin clk=0;sig=0; end
always #5 clk=~clk;
always #20 sig=~sig;
initial #300 $finish ;
endmodule