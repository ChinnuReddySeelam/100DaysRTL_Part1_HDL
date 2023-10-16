module FPA #(parameter NumPorts=4)(req,grant);
  input [NumPorts-1:0] req;
  output [NumPorts-1:0] grant;
assign grant[3]=req[3];
genvar i;
  for(i=2; i>=0; i=i-1) begin
    assign grant[i] = req[i] && (~(|(req[3:i+1])));
  end
endmodule