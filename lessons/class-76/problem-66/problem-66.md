# Programming Challenge: Sensor Alert Detection

## Problem Introduction

You are building a monitoring system for an IoT device that records 
**temperature readings** every hour.

The system stores the readings in a **one-dimensional array**, where each element 
represents the temperature recorded at a specific hour.

---

## Example Input

```javascript
const readings = [22, 25, 27, 31, 29, 35, 28, 26];
```

---

## Task

A **temperature alert** should be triggered when the reading is 
**greater than or equal to 30°C**.

Using JavaScript, analyze the readings and:

1. Count how many **alerts** occurred
2. Print the **hour (index)** and the **temperature** for each alert

---

## Expected Output

```
Alerts detected: 2
Hour 3 → 31°C
Hour 5 → 35°C
```

---

## Requirements

* Use a **single loop**
* Do not use functions
* Do not use advanced array methods (`filter`, `map`, `reduce`)
* Access elements using `array[index]`

---

## Learning Objectives

* Practice iterating over arrays
* Apply conditional logic with thresholds
* Track counts and positions simultaneously
* Work with real-world monitoring scenarios

---

## Hint

Check each value against the threshold (`>= 30`) and keep a counter for alerts.
