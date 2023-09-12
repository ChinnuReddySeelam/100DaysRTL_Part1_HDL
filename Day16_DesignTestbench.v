module tb;
reg [3:0] data_in;
wire a,b,c,d,e,f,g;
BCD_SevenSegment DUT(data_in,
a,b,c,d,e,f,g);
initial begin 
for(int i=0;i<10;i++) begin
data_in=$urandom_range(9);#5;
$display("data_in=%d,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b",data_in,a,b,c,d,e,f,g);
#10;
end
$finish;
end
endmodule