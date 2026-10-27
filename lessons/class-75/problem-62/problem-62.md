# Programming Challenge: Diagonal Sum of a Matrix

## Problem Introduction

You are given a **square matrix** represented as a two-dimensional array. A 
square matrix has the same number of rows and columns.

The **main diagonal** of the matrix consists of elements where the row index 
and column index are equal.

Example:

```javascript
const matrix = [
  [5, 2, 3],
  [1, 4, 6],
  [7, 8, 9]
];
```

Main diagonal elements:

* matrix[0][0] = 5
* matrix[1][1] = 4
* matrix[2][2] = 9

---

## Task

Calculate the **sum of the main diagonal elements** of the matrix.

---

## Expected Output

```
Diagonal sum: 18
```

---

## Constraints

* Use loops to traverse the matrix
* Access elements using `array[row][column]`
* The matrix will always be square

---

## Learning Objective

* Understand indexed access patterns in matrices
* Practice working with positions where `row === column`
* Strengthen loop logic in multidimensional arrays
