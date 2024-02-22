`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 10:12:49 PM
// Design Name: 
// Module Name: adder_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//adder (its very beautiful I know)
module adder_32bit(
    input a[31:0],
    input b[31:0],
    input cin,
    output reg[31:0] s,
    output reg cout 
    );
    always @ (a or b or cin) begin
        {cout, s} = a + b + cin;
    end
endmodule
