// Author: Cristian Camilo Cortes O

// Global variable to store the sum of even numbers
let sumEven = 0;

// Loop from 1 to 10
for(let  i = 1; i <= 10; i++) {

    // Check if the number is even
    if(i % 2 === 0) {
        sumEven = sumEven + i;
    }
}

// Print the final result
console.log("Sum of even numbers is: ", sumEven);


/*
DESKTOP TEST (DRY RUN)

Initial state:
sumEven = 0

-------------------------------------------------
Iteration 1
i = 1
1 % 2 !== 0 → number is NOT even
sumEven remains 0

-------------------------------------------------
Iteration 2
i = 2
2 % 2 === 0 → number is even
sumEven = sumEven + 2
sumEven = 0 + 2 = 2

-------------------------------------------------
Iteration 3
i = 3
3 % 2 !== 0 → number is NOT even
sumEven remains 2

-------------------------------------------------
Iteration 4
i = 4
4 % 2 === 0 → number is even
sumEven = 2 + 4 = 6

-------------------------------------------------
Iteration 5
i = 5
5 % 2 !== 0 → number is NOT even
sumEven remains 6

-------------------------------------------------
Iteration 6
i = 6
6 % 2 === 0 → number is even
sumEven = 6 + 6 = 12

-------------------------------------------------
Iteration 7
i = 7
7 % 2 !== 0 → number is NOT even
sumEven remains 12

-------------------------------------------------
Iteration 8
i = 8
8 % 2 === 0 → number is even
sumEven = 12 + 8 = 20

-------------------------------------------------
Iteration 9
i = 9
9 % 2 !== 0 → number is NOT even
sumEven remains 20

-------------------------------------------------
Iteration 10
i = 10
10 % 2 === 0 → number is even
sumEven = 20 + 10 = 30

Loop ends because i > 10

Final value:
sumEven = 30
-------------------------------------------------

*/
