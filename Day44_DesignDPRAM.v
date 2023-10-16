module SPRAM #(parameter AddrWidth=4,DataWidth=32,Depth=16)(clk,addr1,addr2,Wrdata1,Wrdata2,Rddata1,Rddata2,cs,wr1,rd1,wr2,rd2);
input clk;
input [AddrWidth-1:0] addr1;
input [AddrWidth-1:0] addr2;
input [DataWidth-1:0] Wrdata1;
input [DataWidth-1:0] Wrdata2;
output [DataWidth-1:0] Rddata1;
output [DataWidth-1:0] Rddata2;
input cs,wr1,rd1,wr2,rd2;
reg [DataWidth-1:0] temp1;
reg [DataWidth-1:0] temp2;
reg [DataWidth-1:0] mem [Depth];
always @(posedge clk) begin 
if(wr1&&cs) mem[addr1]<=Wrdata1;
end
always @(posedge clk) begin 
if(wr2&&cs) mem[addr2]<=Wrdata2;
end
always @(posedge clk) begin 
if(~wr1&&cs) temp1<= mem[addr1];
end
always @(posedge clk) begin 
if(~wr2&&cs) temp2<= mem[addr2];
end
assign Rddata1=((~wr1)&&rd1&&cs)?temp1:'hz;
assign Rddata2=((~wr2)&&rd2&&cs)?temp2:'hz;
endmodule