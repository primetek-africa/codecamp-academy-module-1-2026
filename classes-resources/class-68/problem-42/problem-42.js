// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variables
let balance = 500; // Balance variable
let continueTransaction; // "yes" || "no"

// Do - While statement
do {

    alert("Current balance: $" + balance);

    // Ask the user for the withdrawal amount
    let withdrawal = parseInt(
        prompt("Enter the amount you want to withdraw:")
    );

    // validate the withdrawal
    if (withdrawal > balance) {
        alert("Insufficient funds. Your balance is $" + balance);
    } else if (withdrawal <= 0 || isNaN(withdrawal)) {
        alert("Invalid amount. Please enter a valid number.");
    } else {
        balance = balance - withdrawal;
        alert("Withdrawal successful. \nRemaining balance: $" + balance);
    }

    // If the balance reaches zero, stop automatically
    if (balance === 0) {
        alert("Your balance is now $0. No more withdrawals are possible.");
        break;
    }

    // Ask the user if they want another transaction
    continueTransaction = prompt("Do you want another withdrawal? (yes/no)");
} while (continueTransaction.toLowerCase() === "yes");

alert("Session finished.\nFinal balance: $" = balance);


/*
========================================
DESKTOP TEST (STEP-BY-STEP SIMULATION)
ATM WITHDRAWAL PROGRAM
========================================

Initial State
-------------
balance = 500
continueTransaction = undefined


ITERATION 1
-----------
alert → "Current balance: $500"

User input (prompt):
withdrawal = 200

Condition check:
200 > 500 → false
200 <= 0 → false
isNaN(200) → false

Valid withdrawal

balance = 500 - 200
balance = 300

alert →
"Withdrawal successful.
Remaining balance: $300"

balance === 0 ?
300 === 0 → false

prompt →
"Do you want to make another withdrawal?"

User enters:
continueTransaction = "yes"

Loop condition:
continueTransaction.toLowerCase() === "yes"
"yes" === "yes" → true



ITERATION 2
-----------
alert → "Current balance: $300"

User input:
withdrawal = 300

Condition check:
300 > 300 → false
300 <= 0 → false
isNaN(300) → false

Valid withdrawal

balance = 300 - 300
balance = 0

alert →
"Withdrawal successful.
Remaining balance: $0"

balance === 0 ?
0 === 0 → true

alert →
"Your balance is now $0. No more withdrawals are possible."

break → exit loop

========================================
PROGRAM END
========================================
alert →
"Session finished.
Final balance: $0"
========================================
*/