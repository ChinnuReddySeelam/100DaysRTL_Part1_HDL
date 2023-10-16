module NegativeEdgeDetector(
input clk,
input sig,//Sample signal which we want to detect the posedge 
output negEdgeSig
);
reg sigd;
always @(posedge clk) begin  // To delay the signal
sigd<=sig;
end
assign negEdgeSig=(~sig && sigd); 
endmodule