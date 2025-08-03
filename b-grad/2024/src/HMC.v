`define READ_A 2'b00
`define READ_B 2'b01
`define MULT 2'b10
`define DONE 2'b11

module HMC (
    input               clk1,
    input               clk2,
    input               rst,
    input      [1023:0] rom_data,
    output reg [   7:0] rom_addr,
    output reg          done
);

  reg [15:0] u_mem0[1023:0];
  reg [15:0] u_mem1[1023:0];
  reg [15:0] u_mem2[1023:0];
  reg [15:0] u_mem3[1023:0];
  reg [15:0] u_mem4[1023:0];
  reg [15:0] u_mem5[1023:0];
  reg [15:0] u_mem6[1023:0];
  reg [15:0] u_mem7[1023:0];
  reg [15:0] u_mem8[1023:0];
  reg [15:0] u_mem9[1023:0];
  reg [15:0] u_mem10[1023:0];
  reg [15:0] u_mem11[1023:0];
  reg [15:0] u_mem12[1023:0];
  reg [15:0] u_mem13[1023:0];
  reg [15:0] u_mem14[1023:0];
  reg [15:0] u_mem15[1023:0];

  reg [1:0] state;
  reg [1:0] next_state;

  always @(*) begin
    case (state)
      `READ_A: begin
        rom_addr   <= rom_addr + 8'd128;
        next_state <= `READ_B;
      end
      `READ_B: begin
        rom_addr <= rom_addr + 8'd1;
        if (rom_addr == 8'd255) begin
          next_state <= `MULT;
        end else begin
          next_state <= `READ_B;
        end
      end
      `MULT: begin

      end
      `DONE: begin
      end
    endcase
  end

  always @(posedge clk1 or posedge rst) begin
    if (rst) begin
      state <= `READ_A;
    end else begin
      state <= next_state;
    end
  end




endmodule
