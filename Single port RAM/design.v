module RAM ();

input we_in ,clk, enable_in ;
input [7:0] addr_in ;
inout [7:0] data;
reg [7:0] mem [15:0];

always @(posedge clk) begin
    if (we_in & enable_in )
        mem [addr_in]<=data ;
    // // if (!we_in & enable_in)
    // //     data <= mem[addr_in];
end
    assign data = (!we_in & enable_in) ? mem [addr_in] : 8'bz;

endmodule