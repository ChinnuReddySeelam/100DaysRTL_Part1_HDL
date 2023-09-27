module tb;
reg clk,rst;
reg SI;
wire SO;
register_4bit DUT(SI,clk,rst,SO);
initial begin clk=0;rst=1; end
always #5 clk=~clk;
initial begin 
#10;SI=0;
#10;SI=1;
#20;SI=0;
#20;SI=1;
$finish();
end
endmodule