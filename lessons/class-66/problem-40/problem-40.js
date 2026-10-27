// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variable to store the largest prime number
let largestPrime = 0;

// Loop between 1 - 150
for (let i = 1; i <= 150; i++) {

    // local variable to store the divisor quantity
    let divisors = 0;

    // Count the number of divisors of i
    for (let j = 1; j <= i; j++) {

        if (i % j === 0) {
            divisors++
        }
    }

    // A prime number has exactly 2 divisors
    if (divisors === 2) {
        largestPrime = i;
    }
}

// Display the larges prime number
console.log(`Largest prime number between 1 and 150: ${largestPrime}`);

/*
-----------------------------------------------------
Desktop Test (Manual Verification)
-----------------------------------------------------

Prime numbers near the end of the range:

131 -> divisors: 1, 131
137 -> divisors: 1, 137
139 -> divisors: 1, 139
149 -> divisors: 1, 149

Step-by-step update of largestPrime:

i = 131 -> prime -> largestPrime = 131
i = 137 -> prime -> largestPrime = 137
i = 139 -> prime -> largestPrime = 139
i = 149 -> prime -> largestPrime = 149

Expected Output:

Largest prime number between 1 and 150: 149
-----------------------------------------------------
*/