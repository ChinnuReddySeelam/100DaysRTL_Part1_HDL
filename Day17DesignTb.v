module tb;
reg [7:0] water;
wire full,empty,half;
TankLevelIndicator DUT(water,full,empty,half);
initial begin 
$monitor("water=%b,full=%b,empty=%b,half=%b",water,full,empty,half);
water=8'b10000001;#10;
water=8'b00000000;#10;
water=8'b00010001;#10;
water=8'b00010001;#10;
water=8'b00010001;#10;
water=8'b001100001;#10;
for(int i=0;i<10;i++) begin 
water=$random();#10;
end
$finish;
end
endmodule