module testbench;
reg [3:0] data_in;
reg en;
wire [3:0] BinaryCode,GrayCode;
B_G DUT(data_in,en,BinaryCode,GrayCode);
initial begin
en=0;data_in=1100;#20;
en=1;data_in=1100;#20;

$finish;
end
endmodule