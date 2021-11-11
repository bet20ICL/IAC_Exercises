module e8_waveforms();

    logic[4:0] a, b;
    logic[2:0] x, y;

    integer i;
    integer ii;

    f func(.a(a), .b(b), .x(x), .y(y));

    initial begin
        $dumpfile("e8_waveforms.vcd");
        $dumpvars(0, e8_waveforms);
        #1;
        for(i = 0; i < 6'b100000; i++) begin
            a = i;
            for(ii = 0; ii < 6'b100000; ii++) begin
                b = ii;
                #1;
            end
        end   
        $finish();
    end

endmodule