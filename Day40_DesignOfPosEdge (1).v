module PositiveEdgeDetector(
input clk,
input sig,//Sample signal which we want to detect the posedge 
output PosEdgeSig
);
reg sigd;
always @(posedge clk) begin  // To delay the signal
sigd<=sig;
end
assign PosEdgeSig=(sig && ~sigd); 
endmodule