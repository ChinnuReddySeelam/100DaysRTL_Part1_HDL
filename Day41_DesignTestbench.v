module mem_1MB_32bit_tb();
reg clk,wr,cs;
reg [6:0] addr;
reg [31:0] wr_data;
wire [31:0] rd_data;
mem_1MB_32bit dut(clk,wr,cs,addr,wr_data,rd_data);
always #5 clk=~clk;
initial clk=0;
initial begin
wr=1; cs=1; addr=7'd29; wr_data=32'd29;
#10;
wr=1; cs=1; addr=7'd27; wr_data=32'd27;
#10;
wr=1; cs=1; addr=7'd28; wr_data=32'd30;
#10;
wr=1; cs=1; addr=7'd19; wr_data=32'd15;
#10;
wr=0; cs=1; addr=7'd27;
#10;
wr_data=32'd0;
$display("addr=%d, data=%d\n", addr,rd_data);
wr=0; cs=1; addr=7'd28;
#10;
$display("addr=%d, data=%d\n", addr,rd_data);
$finish;
end
endmodule