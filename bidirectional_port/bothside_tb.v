`include "bothside.v"

module bothside_tb_in ();
wire in;
wire out;
reg control;
reg a,b;
integer i=0;
bothside dut (in,out,control);

assign in = control ? a:1'bz;
assign out = control ?1'bz :b;

initial begin
    $dumpfile("file.vcd");
    $dumpvars(0);
    #10;

    while (i<8) begin
        {control,a,b}=i;
        #5;
        i=i+1;
        $display("For control %b , in= %b   ,out= %b",control,in,out);
        if (i==7)$finish;
    end
end
endmodule