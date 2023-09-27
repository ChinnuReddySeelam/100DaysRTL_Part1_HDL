module sipot_tb;
reg clk;
reg rst;
reg si;
wire [3:0] po;
sipomod uut (.clk(clk),.rst(rst),.si(si),.po(po) );
initial begin
clk = 0;
rst = 0;
si = 0;
#5 rst=1'b1;
#5 rst=1'b0;
#10 si=1'b1;
#10 si=1'b0;
#10 si=1'b0;
#10 si=1'b1;
#10 si=1'b0;
end
always #5 clk = ~clk;
initial #120 $stop;
endmodule