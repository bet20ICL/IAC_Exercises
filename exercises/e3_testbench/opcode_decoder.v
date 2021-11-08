module opcode_decoder(
    input logic[5:0] opcode,
    output logic itype,
    output logic rtype,
    output logic jtype
);

    always_comb begin
        itype = 0;
        rtype = 0;
        jtype = 0;
        if (opcode == 0) begin
            rtype = 1;
        end
        else if (opcode == 2 || opcode == 3) begin
            jtype = 1;
        end
        else begin
            itype = 1;
        end
    end

endmodule