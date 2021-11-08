module e1_truthtable_tb(
);
    logic [2:0] a;
    logic [3:0] b;
    logic x;
    logic [2:0] y;

    initial begin
        a=1;
        b=1;
        #1;
        assert(x==0);
        assert(y==3);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);

        a=1;
        b=3;
        #1;
        assert(x==0);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);

        a=7;
        b=2;
        #1;
        assert(x==1);
        assert(y==2);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);

        a=4;
        b=1;
        #1;
        assert(x==0);
        assert(y==2);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);

        a=6;
        b=1;
        #1;
        assert(x==0);
        assert(y==2);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);

        a=4;
        b=4;
        #1;
        assert(x==1);
        assert(y==0);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);

        a=6;
        b=4;
        #1;
        assert(x==1);
        assert(y==0);
        $display("a = %d b = %d; x = %d y = %d", a, b, x, y);


    end

    e1_truthtable dut(
        .a(a),
        .b(b),
        .x(x),
        .y(y)
    );

endmodule