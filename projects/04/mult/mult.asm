// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Load R0 into D
// While R1 is > 0, R1 -> R1-- and R0 -> R0 + R0
// If R1 eq 0, set R2 to R0 and go to final loop

    @R2
    M=0 // clear contents

    @R0
    D=M // D=R0
    @END
    D;JEQ // If R0 = 0, jump to result

    @R1
    D=M // D=R1
    @END
    D;JEQ // If R1 = 0, jump to result
(LOOP)
    @1
    D=D-A // D=D-1
    @R1
    M=D  //R1 = R1--
    @R0
    D=M   // load R0 into D
    @R2
    M=D+M // R2 = R0 + R2

    @R1
    D=M // D=R1
    @END
    D;JEQ // If R1 has been decremented to 0, jump to result

    @LOOP
    0;JMP // Goto LOOP
(END)
    @END
    0;JMP // Infinite loop