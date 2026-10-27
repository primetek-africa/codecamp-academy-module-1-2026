// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Step 1: Declare the global variables
const CORRECT_PASSWORD = "Codecamp-2026";
let enteredPassword = "";
let attemptCount = "";

// Step 2: Display the system header
alert("-----ADMINISTRATION PANEL SYSTEM-----");
alert("---------LOGIN  VERIFICATION---------");

// Step 3: Ask the user fpr the fist password attempt
enteredPassword = prompt("Enter the system password:");

// Step 4: Password verification process
while (enteredPassword !== CORRECT_PASSWORD) {
    attemptCount++;
    alert("attempt #" + attemptCount);
    alert("Access denied. Incorrect password.");

    // Ask the user for another password
    enteredPassword = prompt("Incorrect password. Try again:");
}

// Step 5: Count the successful attempt
attemptCount++;

// Step 6: Access granted
alert("attempt #" + attemptCount);
alert("Access granted. Welcome to the system.");

/*
Desktop Test (Example Execution)

Assume the correct password is:
CORRECT_PASSWORD = "CodeCamp123"


Initial Values
------------------------------------
enteredPassword = ""
attemptCount = 0


User Input #1
------------------------------------
User enters: "1234"

Condition check:
enteredPassword !== CORRECT_PASSWORD
"1234" !== "CodeCamp123" → TRUE

Loop executes:
attemptCount = 1

Output:
Attempt #1
Access denied. Incorrect password.


User Input #2
------------------------------------
User enters: "password"

Condition check:
"password" !== "CodeCamp123" → TRUE

Loop executes:
attemptCount = 2

Output:
Attempt #2
Access denied. Incorrect password.


User Input #3
------------------------------------
User enters: "CodeCamp123"

Condition check:
"CodeCamp123" !== "CodeCamp123" → FALSE

Loop stops


Final State
------------------------------------
attemptCount = 3

Output:
Attempt #3
Access granted. Welcome to the system.
*/