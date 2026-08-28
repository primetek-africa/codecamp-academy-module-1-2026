// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variable to store the numbers
let number = 67543;
let originalNumber = number;
let reversed = 0;

// loop
for (; number > 0; number = Math.floor(number / 10)) {

    // Extract the last digit
    let digit = number % 10;

    // Append the digit to the reversed number
    reversed = reversed * 10 + digit;
}

// Display the numbers
console.log(`Original number: ${originalNumber}`);
console.log(`Reversed number: ${reversed}`);

/*
--------------------------------------------------
Desktop Test (Manual Verification)
--------------------------------------------------

Initial number = 48372

Iteration 1
digit = 48372 % 10 = 2
reversed = 0 * 10 + 2 = 2
number = 48372 / 10 = 4837

Iteration 2
digit = 4837 % 10 = 7
reversed = 2 * 10 + 7 = 27
number = 4837 / 10 = 483

Iteration 3
digit = 483 % 10 = 3
reversed = 27 * 10 + 3 = 273
number = 483 / 10 = 48

Iteration 4
digit = 48 % 10 = 8
reversed = 273 * 10 + 8 = 2738
number = 48 / 10 = 4

Iteration 5
digit = 4 % 10 = 4
reversed = 2738 * 10 + 4 = 27384
number = 4 / 10 = 0

Loop ends because number = 0

Expected Output:

Original number: 48372
Reversed number: 27384
--------------------------------------------------
*/