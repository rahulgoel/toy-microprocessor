toy-microprocessor
==================

8 bit toy microprocessor

The purpose of this project was to design and lay out a simple 8-bit,  which performs the some basic  instructions like add, subtract,move ,jump,call etc. 
Memory :-
•	It is an array of length of 256 .
•	In each location there is an 16 bit opcode.
•	The first four bit represent the opcode, next two bit represent the destination register, next two bit represent the second register and the last 8 bit represent the memory address or the value of the constant depending on the opcode.
Opcodes:-
	0000 => move r1,r2;
Moves the value of the second register to the  first register.
	00001  => move r1,zz;
Moves the value of the constant to the register.

	0010 => add r1,r2;
Adds the value of the register r1 and r2 and stores back to the r1.

	0011  add r1,zz;
Adds the value of the first register and the constant and stores it back to the first register.
	0100=> sub r1,r2;
Subtracts the value of the second register from the first register.
	0101 => sub r1,zz;
Subtracts the value of the constant from the first register.

	0110=> jump 
Jumps to a particular location in the memory as per the value in the last 8 bit.
	0111=> return
Returns to the place in memory from where it is called.
	1000 => call
Call the location of the array according to the value of the last 8 bit

Registers:-
There are four register r0,r1,r2,r3 whose code is 00,01,10,11.

Execution Process:-
	The program control starts from the first location in the memory of the input block.
	The control read the opcode and perfoms the desired operation of add,sub,move and program counter move to the next memory location.
	If there is a function like jump,call,then the program push the last 8 bit of the 16 bit code to the stack and jumps to that memory location.
	This is done by the help of the jump wire that send the signal from the aftrinp block to the input block.
	Later if the opcode of returns come then the stack pop the last address and the program counter moves to that location.
	If the opcode of in,out come then the value in the memory of the aftrinp is shown.this is only a read only memory.
	The registers are updated at every stages.

