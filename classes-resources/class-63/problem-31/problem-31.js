// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Loop from 1 to 5
for (let number = 1; number <= 5; number++) {

    // Calculate the square of the number
    let square = number * number;

    // Print the result
    console.log("Number: ", number, " - Squared: ", square);
}

/*
DESKTOP TEST (DRY RUN)

Loop condition: number <= 5

-------------------------------------------------
Iteration 1
number = 1
square = 1 * 1 = 1
Output → Number: 1 Square: 1

-------------------------------------------------
Iteration 2
number = 2
square = 2 * 2 = 4
Output → Number: 2 Square: 4

-------------------------------------------------
Iteration 3
number = 3
square = 3 * 3 = 9
Output → Number: 3 Square: 9

-------------------------------------------------
Iteration 4
number = 4
square = 4 * 4 = 16
Output → Number: 4 Square: 16

-------------------------------------------------
Iteration 5
number = 5
square = 5 * 5 = 25
Output → Number: 5 Square: 25

-------------------------------------------------
Next iteration
number = 6
Condition → 6 <= 5 → FALSE

Loop stops.

Final output printed in console:
Number: 1 Square: 1
Number: 2 Square: 4
Number: 3 Square: 9
Number: 4 Square: 16
Number: 5 Square: 25
-------------------------------------------------

*/