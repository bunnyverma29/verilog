module adder_16 (clk,A,B,SUM,Cout);
    input clk;
    input [7:0] A,B;
    output [7:0] SUM;
    output Cout;
    
    reg  CARRYi;
    wire  CARRYo;

assign {CARRYo,SUM[3:0]}= A[3:0] + B[3:0];
assign {Cout,SUM[7:4]}= A[7:4] + B[7:4]+ CARRYi;

always @(posedge clk) begin
    CARRYi<=CARRYo;
end
endmodule