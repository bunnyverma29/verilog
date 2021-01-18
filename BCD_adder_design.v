`timescale 1ns / 1ps
module bcdadder(x, y, cin, sum, cout) ;
input [ 3:0] x, y;
input cin;
output [ 3:0] sum;
output cout;

reg [4:0] sum_temp;
reg [3:0] sum;
reg cout;

always @(x,y,cin)
begin
assign sum_temp=x+y+cin;
if(sum_temp > 9)     
   begin
	assign sum_temp=sum_temp + 6;
	assign cout=1;
	assign sum=sum_temp[3:0];
	end
else   
     begin
	  assign cout=0;
	  assign sum=sum_temp[3:0];
end

end
endmodule
