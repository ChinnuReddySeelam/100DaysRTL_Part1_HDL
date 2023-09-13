module TankLevelIndicator(input [7:0] water, 
output reg full,empty,half);
always @(*) begin 
if(water[7]) begin  // Tank level is Full
full=1;empty=0;half=0; 
end
else if (water[6]|water[5]) begin  // Tank level is about to full
full=1;empty=0;half=1;
end
else if (water[4]) begin  // Tank is half
full=0;empty=0;half=1;
end
else if (water[3]|water[2]|water[1]|water[0]) begin // Tank level is between Half or Empty
full=0;empty=1;half=1;
end
else begin //Tank level is empty
full=0;empty=0;half=0;
end
end
endmodule