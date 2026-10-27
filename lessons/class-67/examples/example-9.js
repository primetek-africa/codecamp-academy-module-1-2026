/*
PROBLEM 9 — FIND THE LARGEST DIGIT

Description:
Write a program that finds the largest digit inside a number.

Example:
Input: 47291
Output: Largest digit: 9

Requirements:
- Store a number in a variable.
- Use a while loop to examine each digit.
- Extract digits using the modulus operator (%).
- Compare each digit with the current largest digit.
- Update the largest digit if necessary.
- Remove digits one by one from the number.

Hint:
digit = number % 10
number = Math.floor(number / 10)
*/

console.log("*****************************");
console.log("Program - Start");
console.log("*****************************");

let number = 47291;
let largestDigit = 0;

while (number > 0) {

    let digit = number % 10;

    if (digit > largestDigit) {
        largestDigit = digit;
    }

    number = Math.floor(number / 10);
}

console.log(`Largest digit: ${largestDigit}`);

console.log("*****************************");
console.log("Program - Finish");
console.log("*****************************");
