module cmos_inverter_tb;
reg in; //Input signal.
wire out; //Output signal.
initial begin
  in = 0; //Initialize input signal to low.
end
always #10 in = ~in; //Toggle input signal every 10 time units.
cmos_inverter inverter(in, out); //Instantiate CMOS inverter module.
always @(out) begin
  if (out) $display("Output is high.");
  else $display("Output is low.");
end
endmodule