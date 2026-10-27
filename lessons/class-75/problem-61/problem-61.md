# Programming Challenge: Highest Scoring Student

## Problem Introduction

A teacher stores students' test scores in a **two-dimensional array**. Each row 
represents a **student**, and each column represents a **test score**.

Example data:

```javascript
const scores = [
  [80, 75, 90],
  [60, 85, 70],
  [95, 88, 92]
];
```

---

## Task

Determine which **student has the highest average score**.

* Calculate the average score for each student
* Identify the student with the highest average
* Print the student index and their average

---

## Expected Output

```
Top student: 2
Highest average: 91.67
```

---

## Constraints

* Use **nested loops**
* Access elements using `array[row][column]`
* Round the final average to **2 decimal places**

---

## Learning Objective

* Combine aggregation (average calculation) with comparison logic
* Practice tracking maximum values in multidimensional arrays
* Strengthen problem-solving with nested loops
