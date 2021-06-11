`include "design.v"

module test;
reg reset, clk, read_n , write_n;
wire  full, empty, invalid;
reg [7: 0] data_in;
wire  [7:0] data_out ;

fifo dut1( reset, clk, read_n , write_n ,  data_in, data_out , full , empty, invalid );    

always #5 clk=!clk;

initial begin
    $dumpfile("f.vcd");
    $dumpvars(0);
    rst;
    read;
    write(3);
    write(6);
    read;
    read;
    write(13);
    write(4);
    write(5);
    write(8);
    write(2);
    write(9);
    write(1);
    write(5);
    write(9);
    write(0);
    write(6);
    write(7);
    write(9);
    write(2);
    write(4);
    repeat(15)
    read;
    #10;
    $finish;
end





task initialise;
    begin
        @(negedge clk)
        clk=0;   
    end
endtask

task rst;
    begin
        clk=0;
        @(negedge clk) reset =1;
        write_n=0;
        read_n=0;
        @(negedge clk);
        reset =0;
    end
    
endtask

task read;
    begin
        read_n=1;
        @(posedge clk) ;
        #3 read_n=0;
    end

endtask

task write (input [7:0] wr_data);
    begin
        write_n=1;
        data_in =wr_data;
        @(posedge clk);
        #3;
        write_n=0;
     end
endtask


endmodule