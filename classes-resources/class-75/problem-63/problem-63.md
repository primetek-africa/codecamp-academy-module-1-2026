# Programming Challenge: Column with the Highest Sum

## Problem Introduction

You are given a **two-dimensional array** where each row represents a record and 
each column represents a specific category (for example: daily sales, test scores, 
or sensor readings).

Unlike previous problems focused on rows, this challenge focuses on analyzing **columns**.

---

## Example Input

```javascript
const data = [
  [5, 10, 15],
  [20, 5, 10],
  [10, 20, 5]
];
```

---

## Task

* Calculate the **sum of each column**
* Determine which column has the **highest total sum**
* Print:

  * The **column index**
  * The **sum of that column**

---

## Expected Output

```
Column with highest sum: 0
Highest sum: 35
```

---

## Constraints

* Use **nested loops**
* Access elements using `array[row][column]`
* Do not use advanced array methods like `flat()` or `reduce()`

---

## Learning Objective

* Understand column-wise traversal in multidimensional arrays
* Practice switching perspective from rows to columns
* Strengthen nested loop control and indexing logic
