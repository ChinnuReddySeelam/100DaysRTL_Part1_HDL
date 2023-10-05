module Counter(input rst,clk,en,udbar,ld,input [3:0] ld_val,output  reg [3:0]  cnt);
always @(posedge clk)
begin
if (rst) cnt<=0;
else
begin
if(en) begin
if (ld) cnt<=ld_val;
else begin
if (udbar) cnt<=cnt+1;
else cnt<=cnt-1;
end
end
end
end
endmodule