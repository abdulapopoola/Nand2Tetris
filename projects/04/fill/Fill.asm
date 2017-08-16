// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Pseudo code.
// Check if key is pressed by reading keyboard memory map
// if non zero, go to darken loop
// if zero, go to brighten loop
// darken loop, set all screen to -1 (2's complement for setting all bits to 1s)
// lighten loop, set all screen to 0

(KEYLISTENER)

    @KBD // Since screen is contiguous with kbd, paint from down up
    D=A
    @address
    M=D-1 // start from address just above
(DARKENLOOP)
    @address
    A=M  //retrieve next address from @address
    M=-1 // paint section dark
    @address
    M=A-1
    D=A-SCREEN // Find next index
    @DARKENLOOP
    D;JGT
    @INFINITE_LOOP
    0;JMP

(LIGTHENLOOP)
    @address
    A=M  //retrieve next address from @address
    M=0 // paint section white
    @address
    M=A-1
    D=A-SCREEN // Find next index
    @LIGTHENLOOP
    D;JGT

(INFINITE_LOOP)
   @INFINITE_LOOP
   0;JMP


