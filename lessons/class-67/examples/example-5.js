/*
PROBLEM 5 — MULTIPLICATION TABLE OF 5

Description:
Write a program that prints the multiplication table of 
the number 5 from 1 to 10 using a while loop.

Requirements:
- Start with a counter at 1.
- Use a while loop that runs until the counter reaches 10.
- Multiply 5 by the counter.
- Print the result in the following format:

5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
...

Expected Output:
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
...
5 x 10 = 50
*/

console.log("*****************************");
console.log("Program - Start");
console.log("*****************************");


let counter = 1;

while (counter <= 10) {

    let result = 5 * counter

    console.log(`5 * ${counter} = ${result}`);
    
    counter++;
}

console.log("*****************************");
console.log("Program - Finish");
console.log("*****************************");