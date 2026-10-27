// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variable to store the largest number
let largest = 0;

// loop from 1 to 10
for (let number = 1; number <= 10; number++) {

    // Compare the current number with the largest value
    if (number > largest) {
        largest = number;
    }
}

// Print the result
console.log("Largest number: ", largest);

/*
DESKTOP TEST (DRY RUN)

Initial state:
largest = 0

-------------------------------------------------
Iteration 1
number = 1
1 > 0 → TRUE
largest = 1

-------------------------------------------------
Iteration 2
number = 2
2 > 1 → TRUE
largest = 2

-------------------------------------------------
Iteration 3
number = 3
3 > 2 → TRUE
largest = 3

-------------------------------------------------
Iteration 4
number = 4
4 > 3 → TRUE
largest = 4

-------------------------------------------------
Iteration 5
number = 5
5 > 4 → TRUE
largest = 5

-------------------------------------------------
Iteration 6
number = 6
6 > 5 → TRUE
largest = 6

-------------------------------------------------
Iteration 7
number = 7
7 > 6 → TRUE
largest = 7

-------------------------------------------------
Iteration 8
number = 8
8 > 7 → TRUE
largest = 8

-------------------------------------------------
Iteration 9
number = 9
9 > 8 → TRUE
largest = 9

-------------------------------------------------
Iteration 10
number = 10
10 > 9 → TRUE
largest = 10

-------------------------------------------------
Next iteration:
number = 11
Condition → 11 <= 10 → FALSE

Loop stops.

Final value:
largest = 10

Output:
Largest number: 10
-------------------------------------------------

*/