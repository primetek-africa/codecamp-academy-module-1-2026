// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variable to store the counter result
let count = 0;

// Loop between 1 - 100
for (let i = 1; i <= 100; i++) {

    // Scope variable no calculate the divisors
    let divisors = 0;

    // Check how many divisors the number has
    for (let j = 1; j <= i; j++) {

        if (i % j === 0) {
            divisors++
        }
    }

    // If the numbers has exactly 3 divisors, increase the counter
    if (divisors === 3) {
        console.log(`The number ${i} has only 3 divisors`);
        count++;
    }
}

// Display the result
console.log(`Total numbers between 1 - 100 with exactly 3 divisors: ${count}`);

/*
----------------------------------------------------------------
Desktop Test (Manual Verification)
----------------------------------------------------------------


Numbers that have exactly 3 divisors between 1 and 100:

4  -> divisors: 1, 2, 4
9  -> divisors: 1, 3, 9
25 -> divisors: 1, 5, 25
49 -> divisors: 1, 7, 49

Step-by-step:

i = 4  -> divisors = 3 -> count = 1
i = 9  -> divisors = 3 -> count = 2
i = 25 -> divisors = 3 -> count = 3
i = 49 -> divisors = 3 -> count = 4

Expected Output:

Total numbers between 1 and 100 with exactly 3 divisors: 4

----------------------------------------------------------------
Note:
Numbers with exactly 3 divisors are always the square of a prime number.
----------------------------------------------------------------
*/