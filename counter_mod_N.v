`timescale 1ns / 1ps
module counter(clear,clock, count );
parameter mod =5;

input clear,clock;
output [0:3] count; 
reg [0:3] count;

always @(posedge clock,clear)
begin
  if (clear)
  	begin
    count <=0;
  	end
  else if(count==mod-1)
  	begin
  	count <=0;
  	end
  else
  	begin
    count <= count+1;
	end
end
endmodule
