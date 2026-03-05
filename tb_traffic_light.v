module tb;

reg clk;
reg reset;
wire [2:0] light;

traffic_light_controller uut(
    .clk(clk),
    .reset(reset),
    .light(light)
);

// clock generation
always #5 clk = ~clk;

initial
begin
    $monitor("Time=%0t Light=%b", $time, light);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #100 $finish;
end

endmodule
