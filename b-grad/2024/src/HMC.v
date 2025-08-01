module HMC (
    input               clk1,
    input               clk2,
    input               rst,
    input      [1023:0] rom_data,
    output reg [   7:0] rom_addr,
    output reg          done
);

always@(posedge rst)begin
  rom_addr<=8'd0;
  done<=1'b0;
end


endmodule
