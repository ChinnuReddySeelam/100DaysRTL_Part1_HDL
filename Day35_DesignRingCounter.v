module Ringcounter(Count,clk,rst);
input clk,rst;
output [3:0] Count;
wire [3:0] temp ; 
d_ff D3(temp[3],clk,~temp[0],rst);
d_ff D2(temp[2],clk,temp[3],rst);
d_ff D1(temp[1],clk,temp[2],rst);
d_ff_d D0(temp[0],clk,temp[1],rst);
assign Count=temp;
endmodule
module d_ff(q,clk,D,rst);
input clk,rst,D;
output reg q;
always @ (posedge clk or posedge rst) begin 
if (rst) q<=0;
else q<=D ; 
end
endmodule
module d_ff_d(q,clk,D,rst);
input clk,rst,D;
output reg q;
always @ (posedge clk or posedge rst) begin 
if (rst) q<=1;
else q<=D ; 
end
endmodule