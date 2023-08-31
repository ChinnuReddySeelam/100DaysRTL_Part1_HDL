//Author:- Chinna Venkata Narayana Reddy
//Date:-28/08/2023
module ClockDividerBy3n(
    input rst, clk,
    output fby3,fby5,fby9
);
reg [3:0] count,dout;
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 0;
        else begin
            if (count == 4'd15)
                count <= 0;
            else
                count <= count + 1;
        end
        end
    always @(negedge clk) begin
    if(rst)
     dout<=0;
    else
     dout<=count;
    end
    assign fby3=count[0]||dout[0];
    assign fby5=count[1]||dout[1];
    assign fby9=count[2]||dout[2];
endmodule

