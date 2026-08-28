/*
PROBLEM 8 — COUNT MULTIPLES OF 3

Description:
Write a program that counts how many numbers between 1 and 30
are multiples of 3.

Requirements:
- Use a counter variable starting at 1.
- Use a while loop that runs until the counter reaches 30.
- Check if the number is divisible by 3.
- If it is, increase a variable that stores the count.
- Print the total number of multiples at the end.

Hint:
A number is a multiple of 3 if number % 3 === 0
*/

console.log("*****************************");
console.log("Program - Start");
console.log("*****************************");

let number = 1;
let count = 0;

while (number <= 30) {

    if(number % 3 === 0) {
        count++;
    }

    number++;
}

console.log(`The total multiples of 3: ${count}`);

console.log("*****************************");
console.log("Program - Start");
console.log("*****************************");
