# Programming Challenge: Temperature Grid

## Problem

A weather station records the **temperature readings** of different regions 
during the day. The data is stored in a **two-dimensional array**, where:

- Each **row** represents a region
- Each **column** represents a temperature reading taken during the day

Example data:

```javascript
const temperatures = [
  [22, 25, 24],
  [30, 28, 27],
  [19, 21, 20]
];
```
---

## Task

Find and print the lowest temperature recorded in the entire grid.

Example output:

```
Lowest temperature: 19
```

---

## Constraints

Use nested loops
Access elements using `array[row][column]`