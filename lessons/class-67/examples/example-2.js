/*
PROBLEM 2 — SUM NUMBERS FROM 1 TO 5

Description:
Write a program that calculates the sum of the numbers 
from 1 to 5 using a while loop.

Requirements:
- Create a variable to store the total sum.
- Start a counter at 1.
- Use a while loop that runs until the counter reaches 5.
- Add the counter value to the total during each iteration.
- Print the final result.

Expected Output:
Total Sum: 15
*/

let counter = 1;
let sum = 0;

console.log("Program - Start");

while (counter <= 5) {
    // sum = sum + counter;
    sum += counter;
    counter++;
}

console.log(`
**************************************
The total of the sum: ${sum}
**************************************
`);

console.log("Program - Finish");
