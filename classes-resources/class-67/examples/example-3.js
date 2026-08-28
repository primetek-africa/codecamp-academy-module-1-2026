/*
PROBLEM 3 — COUNTDOWN FROM 10 TO 1

Description:
Write a program that prints a countdown from 10 to 1 using a while loop.

Requirements:
- Start with a variable equal to 10.
- Use a while loop that runs while the number is greater than or equal to 1.
- Print the number in each iteration.
- Decrease the number by 1 each time.

Expected Output:
10
9
8
7
6
5
4
3
2
1
*/

console.log("**********************************");
console.log("Program - Start");
console.log("**********************************");

let countdown = 10;

while (countdown >= 1) {
    console.log(`The countdown: ${countdown}`);
    countdown--;
}

console.log("**********************************");
console.log("Program - Finish");
console.log("**********************************");