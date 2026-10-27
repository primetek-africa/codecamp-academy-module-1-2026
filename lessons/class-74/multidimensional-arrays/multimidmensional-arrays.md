# Multidimensional Arrays in JavaScript

## Introduction

Multidimensional arrays are an important data structure used to represent complex 
collections of data organized in rows and columns. They are frequently used in 
areas such as data processing, game development, image manipulation, and 
algorithm design.

In JavaScript, multidimensional arrays are implemented using 
**arrays inside other arrays**. Each element of the main array can contain another 
array, forming a structure that can represent tables, matrices, or grids.

Understanding how to work with multidimensional arrays is essential for solving 
problems involving spatial data, matrix operations, and grid-based algorithms.

---

# 1. What is a Multidimensional Array?

A **multidimensional array** is an array where each element is itself another array.

The most common type is the **two-dimensional array**, which can be visualized 
as a table with rows and columns.

Example:

```javascript
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];
```

Structure:

* The outer array contains three elements.
* Each element is another array.
* Each inner array represents a **row** of the matrix.

---

# 2. Visual Representation

A two-dimensional array can be visualized as a grid:

| Row | 0 | 1 | 2 |
| --- | - | - | - |
| 0   | 1 | 2 | 3 |
| 1   | 4 | 5 | 6 |
| 2   | 7 | 8 | 9 |

Indexes:

* The **first index** represents the row.
* The **second index** represents the column.

Example:

```javascript
matrix[row][column]
```

Example accesses:

```javascript
matrix[0][0] // 1
matrix[1][2] // 6
matrix[2][1] // 8
```

---

# 3. Accessing Elements

To access elements in a multidimensional array, you chain indices.

```javascript
const numbers = [
  [10, 20],
  [30, 40]
];

console.log(numbers[0][1]); // 20
console.log(numbers[1][0]); // 30
```

Explanation:

1. `numbers[0]` returns `[10, 20]`
2. `numbers[0][1]` returns `20`

---

# 4. Modifying Elements

You can modify values by targeting their position in the structure.

```javascript
const grid = [
  [1, 2],
  [3, 4]
];

grid[0][1] = 99;

console.log(grid);
```

Output:

```
[
  [1, 99],
  [3, 4]
]
```

---

# 5. Iterating Through Multidimensional Arrays

To traverse a multidimensional array, **nested loops** are commonly used.

```javascript
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

for (let i = 0; i < matrix.length; i++) {
  for (let j = 0; j < matrix[i].length; j++) {
    console.log(matrix[i][j]);
  }
}
```

Explanation:

* The outer loop iterates through rows.
* The inner loop iterates through columns.

---

# 6. Using `for...of` Loops

Another way to iterate through multidimensional arrays is using `for...of`.

```javascript
for (const row of matrix) {
  for (const value of row) {
    console.log(value);
  }
}
```

This approach improves readability when the index itself is not required.

---

# 7. Creating Multidimensional Arrays Dynamically

You can generate matrices programmatically.

Example: Create a 3x3 grid.

```javascript
const grid = [];

for (let i = 0; i < 3; i++) {
  const row = [];

  for (let j = 0; j < 3; j++) {
    row.push(0);
  }

  grid.push(row);
}

console.log(grid);
```

Output:

```
[
 [0,0,0],
 [0,0,0],
 [0,0,0]
]
```

---

# 8. Real-World Use Cases

Multidimensional arrays are widely used in many domains of computing.

## Data Tables

```javascript
const students = [
  ['Alice', 90],
  ['Bob', 85],
  ['Charlie', 92]
];
```

## Game Boards

```javascript
const ticTacToe = [
  ['X', 'O', 'X'],
  ['O', 'X', 'O'],
  ['O', 'X', 'X']
];
```

## Pixel Grids

Images can be represented as grids of pixels.

```javascript
const image = [
  [255, 120, 0],
  [80, 200, 60],
  [30, 40, 50]
];
```

---

# 9. Three-Dimensional Arrays

A **three-dimensional array** is an array containing two-dimensional arrays.

Example:

```javascript
const cube = [
  [
    [1,2],
    [3,4]
  ],
  [
    [5,6],
    [7,8]
  ]
];
```

Access example:

```javascript
cube[0][1][1]; // 4
```

These structures are used in:

* 3D simulations
* volumetric data
* scientific computing

---

# 10. Common Operations

## Count total elements

```javascript
let count = 0;

for (const row of matrix) {
  count += row.length;
}

console.log(count);
```

## Sum all values

```javascript
let sum = 0;

for (const row of matrix) {
  for (const value of row) {
    sum += value;
  }
}

console.log(sum);
```

---

# 11. Practice Exercises

## Exercise 1

Print every value in the matrix.

```javascript
const matrix = [
  [2,4,6],
  [1,3,5],
  [7,9,11]
];
```

---

## Exercise 2

Calculate the **sum of all numbers** in the matrix.

---

## Exercise 3

Find the **largest number** in the matrix.

---

## Exercise 4

Count how many numbers are **even**.

---

## Exercise 5

Print the matrix **row by row**.

Example output:

```
2 4 6
1 3 5
7 9 11
```

---

# Key Takeaways

* Multidimensional arrays are arrays that contain other arrays.
* The most common structure is the **two-dimensional array**.
* Elements are accessed using multiple indices: `array[row][column]`.
* Nested loops are typically required to traverse them.
* They are widely used in algorithms, games, simulations, and data processing.
