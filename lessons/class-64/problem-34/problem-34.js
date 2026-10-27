// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Global variable to store the total sum
let totalSum = 0;

// Loop from 1 to 20
for (let number = 1; number <= 20; number++) {
    
    if(number % 3 === 0) {

        console.log("Multiple of 3: ", number);

        // Add the number to the total sum
        totalSum = totalSum + number
    }
}

// Print the final sum
console.log("Total sum: ", totalSum);

/*
DESKTOP TEST (DRY RUN)

Initial state:
totalSum = 0

-------------------------------------------------
Iteration 1
number = 1
1 % 3 !== 0 → not a multiple of 3
totalSum remains 0

-------------------------------------------------
Iteration 2
number = 2
2 % 3 !== 0 → not a multiple of 3
totalSum remains 0

-------------------------------------------------
Iteration 3
number = 3
3 % 3 === 0 → multiple of 3
Print → Multiple of 3: 3
totalSum = 0 + 3 = 3

-------------------------------------------------
Iteration 4
number = 4
4 % 3 !== 0
totalSum remains 3

-------------------------------------------------
Iteration 5
number = 5
5 % 3 !== 0
totalSum remains 3

-------------------------------------------------
Iteration 6
number = 6
6 % 3 === 0 → multiple of 3
Print → Multiple of 3: 6
totalSum = 3 + 6 = 9

-------------------------------------------------
Iteration 7
number = 7
7 % 3 !== 0
totalSum remains 9

-------------------------------------------------
Iteration 8
number = 8
8 % 3 !== 0
totalSum remains 9

-------------------------------------------------
Iteration 9
number = 9
9 % 3 === 0 → multiple of 3
Print → Multiple of 3: 9
totalSum = 9 + 9 = 18

-------------------------------------------------
Iteration 10
number = 10
10 % 3 !== 0
totalSum remains 18

-------------------------------------------------
Iteration 11
number = 11
11 % 3 !== 0
totalSum remains 18

-------------------------------------------------
Iteration 12
number = 12
12 % 3 === 0
Print → Multiple of 3: 12
totalSum = 18 + 12 = 30

-------------------------------------------------
Iteration 13
number = 13
13 % 3 !== 0
totalSum remains 30

-------------------------------------------------
Iteration 14
number = 14
14 % 3 !== 0
totalSum remains 30

-------------------------------------------------
Iteration 15
number = 15
15 % 3 === 0
Print → Multiple of 3: 15
totalSum = 30 + 15 = 45

-------------------------------------------------
Iteration 16
number = 16
16 % 3 !== 0
totalSum remains 45

-------------------------------------------------
Iteration 17
number = 17
17 % 3 !== 0
totalSum remains 45

-------------------------------------------------
Iteration 18
number = 18
18 % 3 === 0
Print → Multiple of 3: 18
totalSum = 45 + 18 = 63

-------------------------------------------------
Iteration 19
number = 19
19 % 3 !== 0
totalSum remains 63

-------------------------------------------------
Iteration 20
number = 20
20 % 3 !== 0
totalSum remains 63

-------------------------------------------------
Next iteration:
number = 21
Condition → 21 <= 20 → FALSE
Loop stops.

Final result:
Total sum = 63

-------------------------------------------------
*/