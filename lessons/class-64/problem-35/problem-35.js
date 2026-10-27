// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Outer loop controls the table number (1 to 5)
for (let table = 1; table <= 5; table++) {

    console.log("*****************************************");
    console.log("Multiplication table of: ", table);
    console.log("*****************************************");

    // Inner loop controls the multiplication values (1 to 10)
    for (let i = 1; i <= 10; i++) {

        let result = table * i;

        console.log(table + " * " + i + " = " + result);
        
    }
}

/*
DESKTOP TEST (DRY RUN)

Initial state:
table = 1

-------------------------------------------------
OUTER LOOP → Iteration 1
table = 1
Print → "Multiplication Table of 1"

INNER LOOP STARTS

i = 1 → result = 1 * 1 = 1
Print → 1 x 1 = 1

i = 2 → result = 1 * 2 = 2
Print → 1 x 2 = 2

i = 3 → result = 1 * 3 = 3
Print → 1 x 3 = 3

...

i = 10 → result = 1 * 10 = 10
Print → 1 x 10 = 10

INNER LOOP ENDS (i becomes 11 → condition false)

-------------------------------------------------
OUTER LOOP → Iteration 2
table = 2
Print → "Multiplication Table of 2"

INNER LOOP STARTS

i = 1 → result = 2 * 1 = 2
Print → 2 x 1 = 2

i = 2 → result = 2 * 2 = 4
Print → 2 x 2 = 4

...

i = 10 → result = 2 * 10 = 20
Print → 2 x 10 = 20

INNER LOOP ENDS

-------------------------------------------------
OUTER LOOP → Iteration 3
table = 3
Print → "Multiplication Table of 3"

INNER LOOP runs again from i = 1 to 10
Results:
3 x 1 = 3
3 x 2 = 6
...
3 x 10 = 30

-------------------------------------------------
OUTER LOOP → Iteration 4
table = 4

INNER LOOP results:
4 x 1 = 4
...
4 x 10 = 40

-------------------------------------------------
OUTER LOOP → Iteration 5
table = 5

INNER LOOP results:
5 x 1 = 5
...
5 x 10 = 50

-------------------------------------------------
Next iteration:
table = 6
Condition → 6 <= 5 → FALSE

OUTER LOOP STOPS

FINAL RESULT:
Multiplication tables from 1 to 5 printed,
each with multiplications from 1 to 10.

-------------------------------------------------
*/