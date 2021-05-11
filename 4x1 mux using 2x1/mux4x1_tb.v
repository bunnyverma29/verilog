module mux4x1_tb ();

reg [3:0] input_bus ;
reg [1:0] sel;
wire y;
integer i,j;
    mux4x1 uut (input_bus[0],input_bus[1],input_bus[2],input_bus[3],sel,y);
    

initial begin
    $dumpfile("mux4x1.vcd");
    $dumpvars(1);

    for (i=0;i<16;i=i+1) begin
        for(j=0;j<4;j=j+1) begin
            input_bus=i;
            sel=j;
            #20;
        end
    end
end

    
endmodule