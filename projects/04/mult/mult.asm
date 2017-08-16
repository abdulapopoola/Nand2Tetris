// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Pseudo code
// Set R2 to 0
// Check if R0 or R1 is zero; if so go to end of program immediately
// While R1 is > 0, R1 -> R1-- and R2 -> R0 + R0
// If R1 eq 0, go to end of program

    @R2
    M=0 // initialize R2 = 0

    @R0
    D=M // D=R0
    @END
    D;JEQ // If R0 = 0, jump to result

(LOOP)

    @R1
    D=M // D=R1
    @END
    D;JEQ // If R1 = 0, jump to result

    @1
    D=D-A // D=D-1
    @R1
    M=D  //R1 = R1-1
    @R0
    D=M   // load R0 into D
    @R2
    M=D+M // R2 = R0 + R2

    @LOOP
    0;JMP // Goto LOOP
(END)
    @END
    0;JMP // Infinite loop