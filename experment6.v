`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 23:00:43
// Design Name: 
// Module Name: experiment3
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

module and_gate(A,B,C);
    
    //Inputs
    input A,B;
    
    //Outputs
    output C;
    assign C = A&B;

endmodule

module or_gate(A,B,C);
    
    //Inputs
    input A,B;
    
    //Outputs
    output C;
    assign C = A | B;

endmodule

module not_gate(A,B);
    
    //Inputs
    input A;
    
    //Outputs
    output B;
    assign B = ~A;

endmodule

module xor_gate(A,B,C);
    
    //Inputs
    input A,B;
    
    //Outputs
    output C;
    assign C = ~A&B | A&~B;

endmodule

module nand_gate(A,B,C);
    
    //Inputs
    input A,B;
    
    //Outputs
    output C;
    assign C = ~(A&B);

endmodule

module three_state_buffer(x, e, o);
    
    //Inputs
    input x;
    input e;
    
    //Outputs
    output o;

    assign o = e ? x : 1'bz;

endmodule

module three_state_buffer_8(x, e, o);
    
    //Inputs
    input [7:0] x;
    input e;
    
    //Outputs
    output [7:0] o;

    three_state_buffer buffer1(x[0],e,o[0]);
    three_state_buffer buffer2(x[1],e,o[1]);
    three_state_buffer buffer3(x[2],e,o[2]);
    three_state_buffer buffer4(x[3],e,o[3]);
    three_state_buffer buffer5(x[4],e,o[4]);
    three_state_buffer buffer6(x[5],e,o[5]);
    three_state_buffer buffer7(x[6],e,o[6]);
    three_state_buffer buffer8(x[7],e,o[7]);

endmodule

// part1

module bus_8_bit(data1,data2,select,o);
    
    //Inputs
    input [7:0] data1;
    input [7:0] data2;
    input       select;

    //Outputs
    output [7:0] o;

    // Intermediate Wires
        wire notSelect;
        wire o1;
        wire o2;
    
    not_gate not1(select,notSelect);

    three_state_buffer_8 buffer1(data1[7:0],notSelect,o1[7:0]);
    three_state_buffer_8 buffer2(data2[7:0],select,o2[7:0]);

    assign o[7:0] = select ? o2[7:0] : o1[7:0];

endmodule

// part2

module bus_8_bit_2r(data1,data2,select,o);
    
    //Inputs
    input [7:0] data1;
    input [7:0] data2;
    input       select;

    //Outputs
    output [7:0] o1;
    output [7:0] o2;

    // Intermediate Wires
        wire notSelect;
        wire [7:0] wo;
    
    not_gate not1(select,notSelect);
    
    bus_8_bit bus1(data1[7:0],data2[7:0],select,wo[7:0]);
    three_state_buffer_8 buffer1(wo[7:0],notSelect,o1[7:0]);
    three_state_buffer_8 buffer2(wo[7:0],select,o2[7:0]);

endmodule

// part3

module bus_8_bit_m(data,reset,select,renable,wenable,clock,o);
    
    //Inputs
    input [7:0] data;
    input reset,select,renable,wenable,clock;

    //Outputs
    output reg [7:0] o;

    // Intermediate Wires
        wire [7:0] stored;
        wire [7:0] wo;

    always @(posedge clock) begin
        if (wenable && select) begin
            stored <= data;
        end
    end

    always @(negedge reset) begin
        stored <= 8'b0;
    end

    always @(posedge renable && posedge select) begin
        assign o <= stored;
    end

    always @(!(posedge renable && posedge select)) begin
        assign o <= 8'bz;
    end

endmodule

