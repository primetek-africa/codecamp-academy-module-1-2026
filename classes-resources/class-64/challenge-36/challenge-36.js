// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

/*
DESKTOP TEST (DRY RUN)

Initial state:
evenCount = 0
oddCount = 0

-------------------------------------------------
Iteration 1
number = 1
1 % 2 !== 0 → odd
oddCount = 1
evenCount = 0

-------------------------------------------------
Iteration 2
number = 2
2 % 2 === 0 → even
evenCount = 1
oddCount = 1

-------------------------------------------------
Iteration 3
number = 3
3 % 2 !== 0 → odd
oddCount = 2
evenCount = 1

-------------------------------------------------
Iteration 4
number = 4
4 % 2 === 0 → even
evenCount = 2
oddCount = 2

-------------------------------------------------
Iteration 5
number = 5
oddCount = 3
evenCount = 2

Iteration 6
number = 6
evenCount = 3
oddCount = 3

Iteration 7
number = 7
oddCount = 4
evenCount = 3

Iteration 8
number = 8
evenCount = 4
oddCount = 4

Iteration 9
number = 9
oddCount = 5
evenCount = 4

Iteration 10
number = 10
evenCount = 5
oddCount = 5

-------------------------------------------------
Continuing pattern until 20...

Iteration 11 → oddCount = 6
Iteration 12 → evenCount = 6
Iteration 13 → oddCount = 7
Iteration 14 → evenCount = 7
Iteration 15 → oddCount = 8
Iteration 16 → evenCount = 8
Iteration 17 → oddCount = 9
Iteration 18 → evenCount = 9
Iteration 19 → oddCount = 10
Iteration 20 → evenCount = 10

-------------------------------------------------
Next iteration:
number = 21
Condition → 21 <= 20 → FALSE

Loop stops.

Final values:
evenCount = 10
oddCount = 10

Output:
Even numbers: 10
Odd numbers: 10
*/