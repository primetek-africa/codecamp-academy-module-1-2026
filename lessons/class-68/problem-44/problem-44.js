// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Declare the global variables
const correctPassword = "admin123";
let password; //Store the user input

do {
    // Request the user password
    password = prompt("Enter your password:");

    // Validate the user password
    if (password !== correctPassword) {
        alert("Incorrect password. try again.");
    }
} while (password !== correctPassword);

alert("Access granted!");

/*
========================================
SOLUTION: PASSWORD VERIFICATION PROGRAM
Using a do...while loop
========================================

DESKTOP TEST

Correct password stored in system:
correctPassword = "admin123"

ITERATION 1
-----------
User input:
password = "1234"

Check:
"1234" === "admin123" → false

alert →
"Incorrect password. Try again."

Loop continues


ITERATION 2
-----------
User input:
password = "1111"

Check:
"1111" === "admin123" → false

alert →
"Incorrect password. Try again."

Loop continues


ITERATION 3
-----------
User input:
password = "admin123"

Check:
"admin123" === "admin123" → true

Loop stops


PROGRAM END
-----------
alert →
"Access granted!"

========================================
*/