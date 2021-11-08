module e1_truthtable(
    input logic[2:0] a,
    input logic[3:0] b,
    output logic x,
    output logic[2:0] y
);

    always @(*) begin
        if(a == 1) begin
            if(b == 1) begin
                x = 0;
                y = 3;
            end
            else if(b == 3) begin
                x = 0;
            end
        end
        else if(a[0] == 0 && a[2] == 1) begin
            if(b == 1) begin
                x = 0;
                y = 2;
            end
            else if(b == 4) begin
                x = 1;
                y = 0;
            end
        end
        else if(a == 7 && b == 2) begin
            x = 1;
            y = 2;
        end
    end
endmodule