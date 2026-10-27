## Problem: Reverse the Digits of a Number Using Iteration

### Context
Many programming tasks involve **manipulating numbers digit by digit**. This exercise will help you practice **`for` iterations**, **integer division**, and 
the **modulus operator (`%`)** to extract and reconstruct digits.

This type of logic is commonly used in **data processing, encryption basics, and algorithmic challenges**.

### Objective
Write a **Node.js program** that **reverses the digits of a number** using a `for` loop.

The program must start with a predefined number and compute a new number where the **digits appear in reverse order**.

Example:

```
Original number: 48372
Reversed number: 27384
```

### Program Requirements

Your program must follow these rules:

- Use **JavaScript running in Node.js**
- Use a **`for` loop** to process the number digit by digit
- Use the **modulus operator `%`** to extract the last digit
- Use **integer division (`Math.floor`)** to remove the last digit
- Build the reversed number step by step using a variable called **`reversed`**
- The initial number must be stored in a variable called **`number`**
- Do **not use arrays**
- Do **not request user input**

Example initial value:

```javascript
let number = 48372;
```

## Expected Console Output

Your program should print something similar to:

```
Original number: 48372
Reversed number: 27384
```

## Hint

Think about the following steps:

1. Extract the last digit using % 10
2. Add it to the reversed number
3. Remove the last digit using `Math.floor(number / 10)`
4. Repeat until the number becomes 0

## Skills Practiced

- Iteration with for
- Modulus operator %
- Integer division
- Numeric digit manipulation
- Building values iteratively