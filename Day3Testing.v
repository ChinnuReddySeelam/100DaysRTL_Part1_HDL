module Testbench();
wire fby3,fby5,fby9;
reg rst,clk;
ClockDividerBy3n dut(rst,clk,fby3,fby5,fby9);
initial clk=0;
always #5 clk=~clk;
initial begin
rst=1;#10;rst=0;#200;
end
endmodule