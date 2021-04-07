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

//part1

module SRLatch (S,R,Q,Qn);
    //inputs
    input S;
    input R;
    //outputs
    output Q;
    output Qn;
 
    nand_gate nand1(S,Qn,Q);
    nand_gate nand2(R,Q,Qn);

endmodule

//part2

module SRLatchEnable (S,R,E,Q,Qn);
    //inputs
    input S;
    input R;
    input E;
    //outputs
    output Q;
    output Qn;

    // Intermediate Wires

        wire SE;
        wire RE;

    nand_gate nand1(S,E,SE);
    nand_gate nand2(R,E,RE);

    SRLatch srlatch1(SE,RE,Q,Qn);
    
endmodule

//part3

module Dlatch (D,Clock,Q,QN);
    //inputs
    input D;
    input Clock;
    //outputs
    output Q;
    output QN;

    // Intermediate Wires
    wire Dnot;

    nand_gate nandgate1(D,D,Dnot);

    SRLatchEnable srlatchenable1(D,Dnot,Clock,Q,QN);

endmodule

module DFlipFlop (D,Clock,Q,QN);
    
    //inputs
    input D;
    input Clock;
    //outputs
    output Q;
    output QN;

    // Intermediate Wires
    wire Clocknot;
    wire DQ;
    wire DQN;

    nand_gate nand1(Clock,Clock,Clocknot);

    Dlatch dlatch1(D,Clocknot,DQ,DQN);
    Dlatch dlatch2(DQ,Clock,Q,QN);

endmodule

//part4

module shift_reg16 ( A, clk, load, shift_out );
    
    //Inputs
    input [15:0] A;
    input clk;
    input load;

    //Outputs
    output shift_out;

    reg [15:0] B;
    reg [15:0] temp;

    assign shift_out = temp[0];
    always @(posedge clk)
    begin
        if(load == 1)
        begin
            temp[0] = A[0];
            temp[1] = A[1];
            temp[2] = A[2];
            temp[3] = A[3];
            temp[4] = A[4];
            temp[5] = A[5];
            temp[6] = A[6];
            temp[7] = A[7];
            temp[8] = A[8];
            temp[9] = A[9];
            temp[10] = A[10];
            temp[11] = A[11];
            temp[12] = A[12];
            temp[13] = A[13];
            temp[14] = A[14];
            temp[15] = A[15];
        end
        else
        begin
            B[0] = temp[15];
            B[15] = temp[14];
            B[14] = temp[13];
            B[13] = temp[12];
            B[12] = temp[11];
            B[11] = temp[10];
            B[10] = temp[9];
            B[9] = temp[8];
            B[8] = temp[7];
            B[7] = temp[6];
            B[6] = temp[5];
            B[5] = temp[4];
            B[4] = temp[3];
            B[3] = temp[2];
            B[1] = temp[1];
            B[1] = temp[0];
            temp[0]=B[0];
            temp[1]=B[1];
            temp[2]=B[2];
            temp[3]=B[3];
            temp[4]=B[4];
            temp[5]=B[5];
            temp[6]=B[6];
            temp[7]=B[7];
            temp[8]=B[8];
            temp[9]=B[9];
            temp[10]=B[10];
            temp[11]=B[11];
            temp[12]=B[12];
            temp[13]=B[13];
            temp[14]=B[14];
            temp[15]=B[15];
        end
    end
endmodule
// main function

module experiment4(SS,SR,SQ,SQn,SES,SER,SEE,SEQ,SEQn,D,Clock,DQ,DQn,I,clk,load,shift_out);

    //inputs
    input SS,SR,SES,SER,SEE,D,Clock,clk,load;
    input [15:0] I;
    //outputs
    output SQ,SQn,SEQ,SEQn,DQ,DQn,shift_out;

    SRLatch srlatch(SS,SR,SQ,SQn);
    SRLatchEnable srlatchenable(SES,SER,SEE,SEQ,SEQn);
    DFlipFlop dflipflop(D,Clock,DQ,DQn);
    shift_reg16 shiftreg16(I,clk,load,shift_out);

endmodule