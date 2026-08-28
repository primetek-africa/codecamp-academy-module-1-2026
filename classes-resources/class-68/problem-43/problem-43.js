// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variables
let count = 0;
let continueInput; // "yes" or "no"

// Do - while statement
do {

    // Ask the user to enter a number
    let number = parseFloat(prompt("Enter a number:"));

    // Increase the counter
    count++;

    // Ask the user if they want to continue
    continueInput = prompt("Do you want to enter another number? (yes/no)");
} while (continueInput.toLowerCase() === "yes");

// Show the final result
alert("You entered " + count + " numbers.");

/*
========================================
SOLUTION: NUMBER COUNTER PROGRAM
Using a do...while loop
========================================

DESKTOP TEST

Initial state:
count = 0

ITERATION 1
-----------
User enters number: 5
count = 1

User answer: "yes"

ITERATION 2
-----------
User enters number: 10
count = 2

User answer: "yes"

ITERATION 3
-----------
User enters number: 7
count = 3

User answer: "no"

Loop stops

Final result:
"You entered 3 numbers."

========================================
*/