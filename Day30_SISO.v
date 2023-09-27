module SISO(
input SI,clk,rst,
output reg SO
);
always @(posedge clk or posedge rst) begin 
if(rst) SO=0;
else SO=SI;
end
endmodule

