module bothside (
 in ,out,control);
    inout in;
    inout out;
    input control;

    
bufif1 b1 (out,in,control);
bufif0 b2  (in,out,control);

endmodule