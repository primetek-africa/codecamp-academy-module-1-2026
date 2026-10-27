## Problem: Find the Largest Prime Number in a Range

### Context
In programming, it is common to analyze numbers within a range and determine whether they satisfy certain mathematical properties. One important concept in computer science and mathematics is **prime numbers**.

This exercise will help you practice **nested `for` loops**, **conditional logic**, and **tracking the maximum value found during iteration**.

### Objective
Write a **Node.js program** that finds the **largest prime number between 1 and 150**.

A **prime number** is a number greater than **1** that has **only two divisors**:
- `1`
- The number itself

Examples of prime numbers:
- 2, 3, 5, 7, 11, 13, 17...

Examples of non-prime numbers:
- 4 → divisors: 1, 2, 4
- 6 → divisors: 1, 2, 3, 6
- 9 → divisors: 1, 3, 9

### Program Requirements

Your program must follow these rules:

- Use **JavaScript running with Node.js**
- Use a **`for` loop** to iterate through numbers from **1 to 150**
- For each number, determine whether it is **prime**
- Use another **`for` loop** to count its divisors
- Maintain a variable called **`largestPrime`** to store the largest prime found
- Do **not use arrays**
- Do **not request user input**

### Expected Console Output

Your program should print something similar to:

Largest prime number between 1 and 150: <result>

> Replace `<result>` with the correct number.

### Hint

Steps you might follow:

1. Iterate through numbers from **1 to 150**
2. For each number, count how many divisors it has
3. If the number has exactly **2 divisors**, it is **prime**
4. If it is prime and greater than the current stored value, update **`largestPrime`**

### Skills Practiced

- Nested `for` loops
- Prime number detection
- Conditional logic
- Tracking maximum values
- Algorithmic thinking