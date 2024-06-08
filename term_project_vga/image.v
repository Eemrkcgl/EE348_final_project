module image(
    input clk,
	 input rotate_right,
	 input rotate_left,
    input [9:0] h_count,
    input [9:0] v_count,
    
    output reg [7:0] o_red,
    output reg [7:0] o_green,
    output reg [7:0]  o_blue
);

	parameter image_height = 75;
	parameter image_width = 75;
	parameter start_x = 295;
	parameter start_y = 215;
	
	reg [3:0] angle_state = 0;
   reg [14:0] pixel_address;
   wire [2:0] pixel_data;

    // Synchronize rotate signals with the clock
    reg rotate_right_sync;
    reg rotate_left_sync;
    reg rotate_right_sync_prev;
    reg rotate_left_sync_prev;

    always @(posedge clk) begin
        rotate_right_sync <= rotate_right;
        rotate_left_sync <= rotate_left;
        rotate_right_sync_prev <= rotate_right_sync;
        rotate_left_sync_prev <= rotate_left_sync;
    end

    always @(posedge clk) begin
        if (rotate_left_sync && !rotate_left_sync_prev) begin
            angle_state <= angle_state - 1;
        end else if (rotate_right_sync && !rotate_right_sync_prev) begin
            angle_state <= angle_state + 1;
        end
    end
	
    image_memory img_mem (
        .address(pixel_address),
		  .state(angle_state),
        .clock(clk),
        .q(pixel_data)
    );

    always @(posedge clk) begin
        if (h_count >= start_x && h_count < start_x + image_width &&
            v_count >= start_y && v_count < start_y + image_height) begin
            
            pixel_address <= (v_count - start_y) * image_width + (h_count - start_x);
			
            o_red   <= {pixel_data[0], (pixel_data[0] == 1) ? 7'b1111111 : 7'b0000000};
            o_green <= {pixel_data[1], (pixel_data[1] == 1) ? 7'b1111111 : 7'b0000000};
            o_blue  <= {pixel_data[2], (pixel_data[2] == 1) ? 7'b1111111 : 7'b0000000};
				
        end else begin
            o_red   <= 1'b0;
            o_green <= 1'b0;
            o_blue  <= 1'b0;
        end
    end

endmodule
