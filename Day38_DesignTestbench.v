module Counter_tb();
reg rst,clk,en,udbar,ld;
reg [3:0] ld_val;
initial ld_val=0;
wire [3:0] cnt;
Counter dut(rst,clk,en,udbar,ld,ld_val,cnt);
always #5 clk=~clk;
initial clk=0;
initial begin
rst =1; #10; rst=0; #10;
en=1; udbar=1; ld=0; #10;
#200;
en=0; #10;
#50;
en=1; #10;
#50;
rst=1; #10;
#20;
rst=0; #10;
#50;
udbar=0; #100;
udbar=1; #50;
ld=1; ld_val=4'b1001; #10;
ld=0; #100;
$finish();
end
endmodule