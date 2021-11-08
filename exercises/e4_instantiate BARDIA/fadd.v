module fadd (
    input logic a,
    input logic b,
    input cin,
    output sum,
    output cout
);
    logic p, q, r, s, t, u ;

    bxor p1(
        .a(a),
        .b(b),
        .r(p)
    );

    bxor q1(
        .a(p),
        .b(cin),
        .r(r)
    );

    assign sum = r;

    band s1(
        .a(cin),
        .b(p),
        .r(s)
    );

    band t1(
        .a(a),
        .b(b),
        .r(t)
    );

    bor u1(
        .a(t),
        .b(s),
        .r(u)
    );

    assign cout = u;

endmodule




