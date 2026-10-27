/*
PROBLEM 1 — PRINT NUMBERS FROM 1 TO 10

Description:
Write a program that prints the numbers from 1 to 10 using a while loop.

Requirements:
- Start with a variable initialized to 1.
- Use a while loop that runs while the number is less than or equal to 10.
- Print each number to the console.
- Increase the number after each iteration.

Expected Output:
1
2
3
4
5
6
7
8
9
10
*/

console.log("Program - Start");

let number = 1;

while (number <= 10) {
    console.log(`The number is: ${number}`);
    number++
}

console.log("Program - Finish");
