module fadd1(
    input logic a, input logic b,
    input logic cin, output logic cout,
    output logic r
);

    logic c;
    bxor xor1(.a(a), .b(b), .r(c));
    bxor xor2(.a(c), .b(cin), .r(r)); 

    logic d;
    band and1(.a(a), .b(b), .r(d));
    logic e;
    band and2(.a(c), .b(cin), .r(e));
    bor or1(.a(d), .b(e), .r(cout));

endmodule

module fadd2(
    input logic[1:0] a, input logic[1:0] b,
    input logic cin, output logic cout,
    output logic[1:0] r
);

    logic c1;
    fadd1 add1(.a(a[0]), .b(b[0]), .cin(cin), .r(r[0]), .cout(c1));
    fadd1 add2(.a(a[1]), .b(b[1]), .cin(c1), .r(r[1]), .cout(cout));

endmodule

module fadd4(
    input logic[3:0] a, input logic[3:0] b,
    output logic[3:0] r
);

    logic cin = 0;
    logic c1;
    fadd2 add1(.a(a[1:0]), .b(b[1:0]), .cin(cin), .r(r[1:0]), .cout(c1));
    logic c2;
    fadd2 add2(.a(a[3:2]), .b(b[3:2]), .cin(c1), .r(r[3:2]), .cout(c2));

endmodule