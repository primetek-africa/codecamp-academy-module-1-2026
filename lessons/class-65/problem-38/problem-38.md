## Problem: Sum of Special Multiples in a Range

### Context

In many programming tasks, we need to **iterate through a sequence of numbers**, 
apply **conditions**, and **accumulate results**. This exercise will help you 
practice using **`for` loops**, **conditional statements**, and **basic arithmetic
operations** in **JavaScript running with Node.js**.

### Objective

Write a **Node.js program** that iterates through a range of numbers and calculates 
the **sum of all numbers between 1 and 200 that are multiples of both 3 and 5**.

A number is considered a **multiple of both 3 and 5** if it can be **divided 
evenly by both numbers**. For example:

* 15 is a multiple of 3 and 5
* 30 is a multiple of 3 and 5
* 45 is a multiple of 3 and 5

These numbers should be included in the sum.

### Program Requirements

Your program must follow these rules:

* Use **JavaScript running in Node.js**.
* Use a **`for` loop** to iterate from **1 to 200**.
* Use a **conditional statement (`if`)** to check whether a number is a **multiple of both 3 and 5**.
* Maintain a variable called **`sum`** that accumulates the total.
* Do **not use arrays**.
* Do **not request user input** (no `prompt`, `readline`, etc.).
* At the end of the program, **print the final result to the console**.

### Expected Console Output

Your program should print a message similar to this:

```
Total sum of numbers between 1 and 200 that are multiples of both 3 and 5: <result>
```

Replace `<result>` with the calculated value.

### Hint

A number that is divisible by **both 3 and 5** is also divisible by **15**.
This can simplify your conditional check.

### Skills Practiced

* `for` loop iteration
* Conditional logic with `if`
* Arithmetic operators (`%` modulus)
* Accumulator variables
* Console output in Node.js
