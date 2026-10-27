// Author: Cristian Camilo Cortes Ortiz

// Global variable to store the total points
let totalPoints = 0;

// Loop through the 5 leves
for (let level = 1; level <= 5; level++) {

    // Points earned in the current level
    let points = level * 10;

    // Add points to the total
    totalPoints = totalPoints + points;
}

// Print the final result
console.log("Total points earned: ", totalPoints);

/*
DESKTOP TEST (DRY RUN)

Initial values:
totalPoints = 0

-------------------------------------------------
Iteration 1
level = 1
points = level * 10 = 1 * 10 = 10
totalPoints = totalPoints + points
totalPoints = 0 + 10 = 10

-------------------------------------------------
Iteration 2
level = 2
points = 2 * 10 = 20
totalPoints = 10 + 20 = 30

-------------------------------------------------
Iteration 3
level = 3
points = 3 * 10 = 30
totalPoints = 30 + 30 = 60

-------------------------------------------------
Iteration 4
level = 4
points = 4 * 10 = 40
totalPoints = 60 + 40 = 100

-------------------------------------------------
Iteration 5
level = 5
points = 5 * 10 = 50
totalPoints = 100 + 50 = 150

Loop ends because level > 5

Final value:
totalPoints = 150
-------------------------------------------------

*/