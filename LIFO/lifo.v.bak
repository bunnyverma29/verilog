module lifo (clk,rst,read_write_bar,read_data,write_data,full,empty,error);

input  clk,rst;
input read_write_bar;
output reg [7:0] read_data; 
input [7:0] write_data;
output  error;
output full,empty;
reg [7:0] mem_fifo [15:0];
reg [3:0] addr;

assign full =(addr==4'b1111);
assign empty =(addr==4'b0000);
assign error = ( ( read_write_bar==1 && empty==0)||( read_write_bar==0 && full==0) ) ?0:1;

always @ (posedge clk) begin
    if (rst==1) begin
        addr<=4'b0000;
    end
    
    else if ( read_write_bar==1 && empty==0) begin :read
        read_data <=  mem_fifo[addr];
        addr<=addr-1;
    end

    else if  ( read_write_bar==0 && full==0) begin :write
      mem_fifo[addr]<=  write_data ;
        addr<=addr+1;   
    end

end   
endmodule
