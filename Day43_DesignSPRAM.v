module SPRAM #(parameter AddrWidth=4,DataWidth=32,Depth=16)(clk,addr,data,cs,wr,rd);
input clk;
input [AddrWidth-1:0] addr;
inout [DataWidth-1:0] data;
input cs,wr,rd;
reg [DataWidth-1:0] temp;
reg [DataWidth-1:0] mem [Depth];
always @(posedge clk) begin 
if(wr&&cs) mem[addr]<=data;
end
always @(posedge clk) begin 
if(~wr&&cs) temp<= mem[addr];
end
assign data=((~wr)&&rd&&cs)?temp:'hz;
endmodule