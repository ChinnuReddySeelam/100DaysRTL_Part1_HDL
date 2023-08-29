module Testbench();
wire div2,div4,div16,div8;
reg rst,clk,en;
ClockDividerBy2n dut(rst,clk,en,div2,div4,div16,div8);
initial clk=0;
always #5 clk=~clk;
initial begin
rst=1;#10;rst=0;#10;
en=0;#10;
en=1;#200;
end
endmodule