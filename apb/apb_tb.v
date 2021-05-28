`include "apb.v"
module test ();

reg clk,preset;
reg  psel0,penable,pwrite;
reg [7:0]  pwdata;
reg [7:0] paddr;
wire pready,pslverr;
wire [7:0] prdata;

apb_slave dut (
                clk,
                preset,
                psel0,
                penable,
                pwrite,
                pwdata,
                paddr, 
                pready,
                pslverr,
                prdata );

always #2 clk=~clk;

initial begin
    reset;
    write1;
    write2;
    read1;
    read2;  
    $finish;
end

initial begin
    $dumpfile("apb.vcd");
    $dumpvars(0);
end

 task reset;
begin
    clk=0;
    preset =0;
    psel0=0;
    penable=0;
    pwrite=0;
    pwdata=0;
    paddr=0;
    #1;
    preset=1;
    #2;
    preset=0;
    #1;
end
endtask

//wrute to 25 addres
  task write2 ; 
  begin 
    paddr=25;
    pwrite=1;
    psel0=1;
    #2;
    penable=1;
    pwdata=78;
    #17;
    psel0=0;
    #6;
  end
  endtask

//read from 25 addres
task read2 ;
begin
    paddr=25;
    pwrite=0;
    psel0=1;
    #2;
    penable=1;
    pwdata=8'bx;
    #17;
    psel0=0;
    #6;
end
endtask
//write from 35 addres
task write1 ;
begin
    paddr=35;
    pwrite=1;
    psel0=1;
    #2;
    penable=1;
    pwdata=56;
    #17;
    psel0=0;
    #6;
end
endtask

//read from 35 addres
task read1;
begin
    paddr=35;
    pwrite=0;
    psel0=1;
    #2;
    penable=1;
    pwdata=8'bx;
    #17;
    psel0=0;
    #6;
end
endtask   
endmodule