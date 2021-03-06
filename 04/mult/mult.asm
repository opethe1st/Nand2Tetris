// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R2
    M=0 //initialize sum to zero
    @R0
    D=M;
    @END
    D;JEQ // is R0 zero? if zero go to end
(LOOP)
    @R1
    D=M;  //save R1 in D
    @R2
    M=M+D //save R2+D in R2
    @R0
    M=M-1; //decrease R0
    D=M
    @END
    D;JEQ
    @LOOP
    0;JMP    
(END)
    @END
    0;JMP
