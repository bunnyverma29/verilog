module fifo( reset, clk, read_n , write_n ,  data_in, data_out , full , empty, invalid );

input reset, clk, read_n , write_n;
output  full, empty;
output reg invalid;
input [7: 0] data_in;
output reg  [7:0] data_out ;

reg [7:0] mem [15:0];
reg [3:0] wr_pointer, rd_pointer ;
integer i;

assign full = (wr_pointer==15);
assign empty = (wr_pointer==0);
//assign invalid =  full & empty;


always @(posedge clk) begin
    if(reset)
        begin
            for ( i=0;i<16;i=i+1) mem[i] =0;
            rd_pointer=0;
            wr_pointer=0;
            data_out=0;
            invalid=0;
        end
    else if (read_n && !empty) 
        begin
            data_out <= mem [rd_pointer];
            rd_pointer<= rd_pointer+1;
            invalid=0;          
        end
    else if (write_n && !full) 
        begin
            mem [wr_pointer]<=data_in ;
            wr_pointer<= wr_pointer+1;
            invalid=0;
        end
    else invalid=1;
end
endmodule