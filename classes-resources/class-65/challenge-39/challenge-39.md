## Problem: Count Numbers With Exactly 3 Divisors

### Context
When working with loops, programmers often need to **analyze numbers and apply
mathematical rules**. In this exercise, you will practice using **nested `for` 
loops**, **conditional logic**, and **counters** in JavaScript.

### Objective
Write a **Node.js program** that counts how many numbers between **1 and 100** 
have **exactly 3 divisors**.

A **divisor** of a number is any integer that divides the number 
**without leaving a remainder**.

Example:
- The number **4** has divisors: `1, 2, 4` → **3 divisors**
- The number **9** has divisors: `1, 3, 9` → **3 divisors**
- The number **16** has divisors: `1, 2, 4, 8, 16` → **5 divisors**

Only numbers with **exactly 3 divisors** should be counted.

### Program Requirements

Your program must follow these rules:

- Use **JavaScript with Node.js**
- Use **`for` loops** to iterate through numbers
- Use another **`for` loop** to count the divisors of each number
- Maintain a variable called **`count`** to store how many numbers meet the condition
- Do **not use arrays**
- Do **not request user input**
- Print the result to the console

### Expected Console Output

Total numbers between 1 and 100 with exactly 3 divisors: <result>

> Replace `<result>` with the calculated value.

### Hint

For each number:
1. Check all numbers from `1` to the number itself
2. Count how many divisors it has
3. If the number has **exactly 3 divisors**, increase the counter

### Skills Practiced
- Nested `for` loops
- Modulus operator `%`
- Counters and accumulators
- Algorithmic thinking