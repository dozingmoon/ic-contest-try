`timescale 1ns / 1ps
module Host;
  reg clk1, clk2, rst;
  reg [1023:0] rom_data;
  wire [   7:0] rom_addr;
  wire done;

  reg [1023:0]rom_256x1024 [255:0];
  // lower is A, upper is B

  // read file
  initial begin
    $readmemh("src/ROM_PAT0.dat", rom_256x1024,0);
    $readmemh("src/ROM_PAT1.dat", rom_256x1024, 128);
    $display("%h", rom_256x1024[128][7:0]);
  end

  initial begin
    clk1 = 1;
    clk2 = 1;
    rst  = 0;
    #10 rst = 1;
    #100 rst = 0;
  end



endmodule
