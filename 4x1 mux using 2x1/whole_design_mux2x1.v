module whole_design_mux2x1 (i0,i1,i2,i3,sel,y);
input i0,i1,i2,i3;
input [1:0] sel;
output y;
wire t1,t2;  
    mux2x1 dut1 (i0,i1,sel[0],t1);
    mux2x1 dut2 (i2,i3,sel[0],t2);
    mux2x1 dut3 (t1,t2,sel[1],y);
endmodule




module mux2x1 ( I0,I1,Sel,Y);

 input I0,I1,Sel;
 output Y;

assign Y=Sel ?I1:I0;

endmodule

