`timescale 1ns / 1ps
`define CYCLE 10
module Host;
  reg clk1, clk2, rst;
  reg [1023:0] rom_data;
  wire [   7:0] rom_addr;
  wire done;

  reg [1023:0]rom_256x1024 [255:0];
  reg [15:0]golden [15:0][1023:0];
  // lower is A, upper is B

  integer i, count;

  HMC u_HMC (
      .clk1(clk1),
      .clk2(clk2),
      .rst(rst),
      .rom_data(rom_data),
      .rom_addr(rom_addr),
      .done(done)
  );
  // read file
  initial begin
    $readmemh("src/ROM_PAT0.dat", rom_256x1024, 0);
    $readmemh("src/ROM_PAT1.dat", rom_256x1024, 128);
    $readmemh("src/GOLD0.dat", golden);
  end

  initial begin
    count = 0;

    clk1  = 1;
    clk2  = 1;
    rst   = 0;
    #10 rst = 1;
    #100 rst = 0;
    wait (done == 1'b1);

    // compare
    for (i = 0; i < 1024; i = i + 1)
    if( u_HMC.u_mem0[i]!==golden[0][i]||
        u_HMC.u_mem1[i]!==golden[1][i]||
        u_HMC.u_mem2[i]!==golden[2][i]||
        u_HMC.u_mem3[i]!==golden[3][i]||
        u_HMC.u_mem4[i]!==golden[4][i]||
        u_HMC.u_mem5[i]!==golden[5][i]||
        u_HMC.u_mem6[i]!==golden[6][i]||
        u_HMC.u_mem7[i]!==golden[7][i]||
        u_HMC.u_mem8[i]!==golden[8][i]||
        u_HMC.u_mem9[i]!==golden[9][i]||
        u_HMC.u_mem10[i]!==golden[10][i]||
        u_HMC.u_mem11[i]!==golden[11][i]||
        u_HMC.u_mem12[i]!==golden[12][i]||
        u_HMC.u_mem13[i]!==golden[13][i]||
        u_HMC.u_mem14[i]!==golden[14][i]||
        u_HMC.u_mem15[i]!==golden[15][i]
        )
      count = count + 1;

    if (count != 0) $display("Incorrect");
    else $display("Correct");
  end

  always @(rom_addr) #(`CYCLE) rom_data = rom_256x1024[rom_addr];
  always @(*) #(`CYCLE/2) clk1 = ~clk1;
  always @(*) #(`CYCLE/2) clk2 = ~clk2;



endmodule
