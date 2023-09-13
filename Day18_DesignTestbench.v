module tb;
reg [7:0] Data_in;
wire OddParity,EvenParity;
ParityChecker DUT(Data_in,
EvenParity,OddParity);
initial begin 
$monitor("Data_in=%b,EvenParity=%b,OddParity=%b",Data_in,EvenParity,OddParity);
for(int i=0;i<10;i++) begin 
Data_in=$random();#10;
end
$finish;
end
endmodule