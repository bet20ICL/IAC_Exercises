module fadd4 (
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [3:0] r
);
    logic [3:0] c;

    fadd fadd0(
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),
        .sum(r[0]),
        .cout(c[0])
    );

    fadd fadd1(
        .a(a[1]),
        .b(b[1]),
        .cin(c[0]),
        .sum(r[1]),
        .cout(c[1])
    );

    fadd fadd2(
        .a(a[2]),
        .b(b[2]),
        .cin(c[1]),
        .sum(r[2]),
        .cout(c[2])
    );

    fadd fadd3(
        .a(a[3]),
        .b(b[3]),
        .cin(c[2]),
        .sum(r[3]),
        .cout(c[3])
    );
endmodule