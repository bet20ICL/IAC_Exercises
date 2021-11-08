module fadd4_tb();

    logic[3:0] a;
    logic[3:0] b;
    logic[3:0] s;

    fadd4 dut(.a(a), .b(b), .r(s));
    initial begin
        a = 1;
        b = 0;
        #1;
        $display("a=%b, b=%b, r=%b", a, b, s);
        assert(s == a+b) else $fatal(1);

        a = 1;
        b = 2;
        #1;
        $display("a=%b, b=%b, r=%b", a, b, s);
        assert(s == a+b) else $fatal(1);

        a = 2;
        b = 2;
        #1;
        $display("a=%b, b=%b, r=%b", a, b, s);
        assert(s == a+b) else $fatal(1);

        a = 4;
        b = 4;
        #1;
        $display("a=%b, b=%b, r=%b", a, b, s);
        assert(s == a+b) else $fatal(1);

        a = 3;
        b = 4;
        #1;
        $display("a=%b, b=%b, r=%b", a, b, s);
        assert(s == a+b) else $fatal(1);
        $finish;
    end

endmodule