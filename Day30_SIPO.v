module sipomod(clk,rst, si, po);
input clk, si,rst;
output reg [3:0] po;
reg [3:0] tmp;
always @(posedge clk ) begin
if (rst)
tmp <= 4'b0000;
else
tmp <= tmp << 1;
tmp[0] <= si;
po = tmp;
end
endmodule