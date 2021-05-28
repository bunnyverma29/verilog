`include "lifo.v"
module lifo_tb();

reg  clk,rst,read_write_bar;
wire [7:0] read_data; 
reg [7:0] write_data;
wire error;
wire full,empty;
integer i,j,k;

lifo dut(clk,
        rst,
        read_write_bar,
        read_data,
        write_data,
        full,
        empty,
        error);

always #5 clk= ~clk;


initial begin
    clk=0;
    $dumpfile("lifo.vcd");
    $dumpvars(0);
    reset;
    write; 
    repeat(25)
    @(posedge clk ) read;
    $finish;
end

task reset;
begin
@(negedge clk) rst=1;
@(negedge clk) rst=0;
end
endtask

task read; begin
    read_write_bar=1;
end
endtask

task write; begin
    for (i=0;i<15;i=i+1) begin
        read_write_bar=0;
         write_data<=i;
        @(posedge clk);
        end
end
endtask

endmodule