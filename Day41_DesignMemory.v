module mem_1MB_32bit(
input clk,wr,cs,
input [6:0] addr,
input [31:0] wr_data,
output reg [31:0] rd_data);
reg [31:0] mem[0:127];
always @(posedge clk) begin
if(cs&wr)
mem[addr]<=wr_data;
end
always @(posedge clk)
begin
if(cs&(~wr))
rd_data<=mem[addr];
end
endmodule