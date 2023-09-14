module Tb;
reg [3:0] Data_in;
wire [1:0] CountOfOnes;
wire [1:0] CountOfZeros;
wire [1:0] CountOfXandZ;
BinaryDigitCounter DUT(Data_in,CountOfOnes,CountOfZeros,CountOfXandZ);
initial begin 
for(int i=0;i<10;i++) begin 
$monitor("Data_in=%b,CountOfOnes=%b,CountOfZeros=%b,CountOfXandZ=%b",Data_in,CountOfOnes,CountOfZeros,CountOfXandZ);
Data_in=$random();#10;
end
Data_in=4'b1xZ0;#10;
Data_in=4'bxzxx;#10;
Data_in=4'bzxz0;#10;
Data_in=4'bxxxx;#10;
$finish();
end
endmodule