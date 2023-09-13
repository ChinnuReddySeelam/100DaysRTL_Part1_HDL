module ParityChecker(
input [7:0]Data_in,
output EvenParity,OddParity
);
assign OddParity=^(Data_in);
assign EvenParity=~^(Data_in);
endmodule