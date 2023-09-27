module usr_shift_reg_tb();
reg clk,rst,lrbar,lcbar;
reg [3:0]i;
wire [3:0]y;
usr_shift_reg_bl dut(clk,rst,lrbar,lcbar,i,y);
initial clk=0;
always #5 clk=~clk;
initial begin 
i=4'b1011;
rst=1; 
lrbar=0;lcbar=0; #10;
rst=0; #40;
rst=1; 
lrbar=0;lcbar=1; #10;
rst=0; #40;
rst=1; 
lrbar=1;lcbar=0; #10;
rst=0; #40;
rst=1; 
lrbar=1;lcbar=1; #10;
rst=0; #40;
$finish;
end
endmodule