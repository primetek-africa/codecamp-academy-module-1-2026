# Programming Challenge: Daily Expense Analysis

## Problem Introduction

You are building a simple personal finance tool that helps users analyze their 
daily expenses.

The application stores expenses in a **one-dimensional array**, where each 
element represents the amount of money spent in a single day.

---

## Example Input

```javascript
const expenses = [45, 20, 35, 60, 15, 80, 25];
```

Each value represents the amount spent on a given day.

---

## Task

Analyze the expenses and determine:

1. The **total amount spent**
2. The **average daily expense**
3. The **day with the highest expense** (index and value)

---

## Expected Output

```
Total spent: 280
Average expense: 40.00
Highest expense on day: 5
Amount: 80
```

---

## Constraints

* Use a **single loop** to traverse the array
* Do not use advanced array methods like `reduce()` or `Math.max()`
* Access elements using `array[index]`

---

## Learning Objective

* Practice iterating through one-dimensional arrays
* Perform aggregation (sum and average)
* Track maximum values and their indices
* Strengthen fundamental loop logic
