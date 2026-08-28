/*
PROBLEM 7 — REVERSE A NUMBER

Description:
Write a program that reverses the digits of a number 
using a while loop.

Example:
Input: 12345
Output: 54321

Requirements:
- Store a number in a variable.
- Use a while loop that runs while the number is greater than 0.
- Extract the last digit using the modulus operator (%).
- Build the reversed number step by step.
- Remove the last digit from the original number each iteration.

Hint:
lastDigit = number % 10
number = Math.floor(number / 10)
*/

console.log("*****************************");
console.log("Program - Start");
console.log("*****************************");

let number = 12345;
let reversed = 0;

console.log(`Original number is: ${number}`);

while (number > 0) {

    let lastDigit = number % 10;

    reversed = reversed * 10 + lastDigit;

    number = Math.floor(number / 10);
}

console.log(`Reversed number is: ${reversed}`);

console.log("*****************************");
console.log("Program - Finish");
console.log("*****************************");
