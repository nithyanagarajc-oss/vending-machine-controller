module vending_machine (
    input        clk,
    input        reset,
    input        coin5,
    input        coin10,
    output reg   dispense,
    output reg   change
);

    reg [4:0] amount;
    reg [4:0] next_amount;

    always @(posedge clk or posedge reset) begin
        if (reset)
            amount <= 5'd0;
        else
            amount <= next_amount;
    end

    always @(*) begin
        dispense   = 1'b0;
        change     = 1'b0;
        next_amount = amount;

        if (coin5) begin
            next_amount = amount + 5'd5;
        end
        else if (coin10) begin
            next_amount = amount + 5'd10;
        end

        if ((amount + 5) >= 15 && coin5) begin
            dispense = 1'b1;
            if ((amount + 5) > 15)
                change = 1'b1;
            next_amount = 5'd0;
        end
        else if ((amount + 10) >= 15 && coin10) begin
            dispense = 1'b1;
            if ((amount + 10) > 15)
                change = 1'b1;
            next_amount = 5'd0;
        end
    end

endmodule