module RRA(clk,rst,req,grant);
input clk,rst;input [3:0] req;output reg [3:0] grant;
reg [2:0] ps,ns;
parameter state1=3'd1,state2=3'd2,state3=3'd3,state4=3'd4;
always @(*) begin 
case (ps)
state1:ns<=state2;
state2:ns<=state3;
state3:ns<=state4;
state4:ns<=state1;
endcase
end
always @(posedge clk or posedge rst) begin 
if(rst) ps<=state1; else ps<=ns; end
always @(posedge clk or posedge rst) begin 
if (rst) ps<=state1; else begin
case (ps)
state1:begin if(req[0])grant<=4'b0001;
             else grant<=4'b0000;
       end
state2:begin if(req[1])grant<=4'b0010;
             else grant<=4'b0000;
             end
state3:begin if(req[2])grant<=4'b0100;
             else grant<=4'b0000;
       end
state4:begin if(req[0])grant<=4'b1000;
             else grant<=4'b0000;
       end
endcase
end
end
endmodule