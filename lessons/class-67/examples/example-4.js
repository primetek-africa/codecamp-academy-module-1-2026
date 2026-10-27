/*
PROBLEM 4 — PRINT EVEN NUMBERS FROM 1 TO 20

Description:
Write a program that prints only the even numbers 
between 1 and 20 using a while loop.

Requirements:
- Start with a number equal to 1.
- Use a while loop that runs while the number is less than or equal to 20.
- Check if the number is even.
- If it is even, print it to the console.
- Increase the number by 1 in each iteration.

Hint:
A number is even if number % 2 === 0

Expected Output:
2
4
6
8
10
12
14
16
18
20
*/

console.log("****************************");
console.log("Program - Start");
console.log("****************************");

let number = 1;

while (number <= 20) {
    if (number % 2 === 0) {
        console.log(number);
    }

    number++
}

console.log("****************************");
console.log("Program - Finish");
console.log("****************************");