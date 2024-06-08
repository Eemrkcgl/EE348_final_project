module image_memory (
    input clock,
    input [3:0] state,
    input [18:0] address,
    output reg [2:0] q
);

    reg [2:0] ss_0  [0:5624];
    reg [2:0] ss_1  [0:5624];
    reg [2:0] ss_2  [0:5624];
    reg [2:0] ss_3  [0:5624];
    reg [2:0] ss_4  [0:5624];
    reg [2:0] ss_5  [0:5624];
    reg [2:0] ss_6  [0:5624];
    reg [2:0] ss_7  [0:5624];
    reg [2:0] ss_8  [0:5624];
    reg [2:0] ss_9  [0:5624];
    reg [2:0] ss_10 [0:5624];
    reg [2:0] ss_11 [0:5624];
    reg [2:0] ss_12 [0:5624];
    reg [2:0] ss_13 [0:5624];
    reg [2:0] ss_14 [0:5624];
    reg [2:0] ss_15 [0:5624];

    initial begin
        $readmemh("./ss_images/ss_0..txt", ss_0);
        $readmemh("./ss_images/ss_1..txt", ss_1);
        $readmemh("./ss_images/ss_2..txt", ss_2);
        $readmemh("./ss_images/ss_3..txt", ss_3);
        $readmemh("./ss_images/ss_4..txt", ss_4);
        $readmemh("./ss_images/ss_5..txt", ss_5);
        $readmemh("./ss_images/ss_6..txt", ss_6);
        $readmemh("./ss_images/ss_7..txt", ss_7);
        $readmemh("./ss_images/ss_8..txt", ss_8);
        $readmemh("./ss_images/ss_9..txt", ss_9);
        $readmemh("./ss_images/ss_10..txt", ss_10);
        $readmemh("./ss_images/ss_11..txt", ss_11);
        $readmemh("./ss_images/ss_12..txt", ss_12);
        $readmemh("./ss_images/ss_13..txt", ss_13);
        $readmemh("./ss_images/ss_14..txt", ss_14);
        $readmemh("./ss_images/ss_15..txt", ss_15);
		  
    end

    always @(posedge clock) begin
        case(state)
            4'd0: q <= ss_0[address];
            4'd1: q <= ss_1[address];
            4'd2: q <= ss_2[address];
            4'd3: q <= ss_3[address];
            4'd4: q <= ss_4[address];
            4'd5: q <= ss_5[address];
            4'd6: q <= ss_6[address];
            4'd7: q <= ss_7[address];
            4'd8: q <= ss_8[address];
            4'd9: q <= ss_9[address];
            4'd10: q <= ss_10[address];
            4'd11: q <= ss_11[address];
            4'd12: q <= ss_12[address];
            4'd13: q <= ss_13[address];
            4'd14: q <= ss_14[address];
            4'd15: q <= ss_15[address];
        endcase
    end

endmodule
