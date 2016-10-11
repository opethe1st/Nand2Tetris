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

// Put your code here.

(START)
    @8192 //the screen
    D=A   // store in D
    @count
    M=D     //count = 8192
    @KBD    //KGB
    D=M     
    @WHITE 
    D;JEQ   //move to White if KGB is zero.
    @BLACK
    0;JMP   //else move to black
    
(WHITE)
    @count
    D=M
    @SCREEN 
    A=A+D  //calculate pixel
    M=0   //set pixel to white
    @count
    M=M-1 //decrease count
    @KBD    //KGB
    D=M
    @START
    D;JGT
    @count
    D=M
    @WHITE
    D;JGE  //if count is greater than zero go to white
    @START  
    0;JMP   //else go to start and check if keyboard has been pressed again

(BLACK)
    @count
    D=M
    @SCREEN 
    A=A+D  //calculate pixel
    M=-1   //set pixel to white
    @count
    M=M-1 //decrease count
    @KBD    //KGB
    D=M
    @START
    D;JGT
    @count
    D=M
    @BLACK
    D;JGE  //if count is greater than zero go to black
    @START  
    0;JMP   //else go to start and check if keyboard has been pressed again