module tb;
parameter NumPorts=4;
reg clk,rst;
reg [NumPorts-1:0] req;   
wire [NumPorts-1:0] grant;
RRA DUT(clk,rst,req,grant);
always #5 clk=~clk;
initial begin clk=0;rst=1;#10;rst=0; end
initial begin
#10;req=4'b1001;#40;
req=4'b1111;#40;
$finish();
end
endmodule