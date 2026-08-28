# Programming Challenge: Weekly Expense Report (With Day Names)

## Problem Introduction

You are building an improved version of a personal finance tool that analyzes a 
user's **weekly expenses**.

The application stores expenses in a **one-dimensional array**, where each element 
represents the amount of money spent on a specific day of the week.

The index of the array corresponds to a day:

* `0` → Monday
* `1` → Tuesday
* `2` → Wednesday
* `3` → Thursday
* `4` → Friday
* `5` → Saturday
* `6` → Sunday

---

## Example Input

```javascript
const expenses = [45, 20, 35, 60, 15, 80, 25];
```

---

## Task

Using JavaScript, analyze the weekly expenses and:

1. Calculate the **total amount spent** during the week
2. Calculate the **average daily expense**
3. Find the **day with the highest expense**
4. Display the **name of the day** (not the index) using a `switch` statement

---

## Expected Output

```
Total spent: 280
Average expense: 40.00
Highest expense on: Saturday
Amount: 80
```

---

## Requirements

* Use a **single loop** to traverse the array
* Do **not** use functions
* Use a `switch` statement to map the index to the day name
* Access elements using `array[index]`

---

## Learning Objectives

* Practice iterating through one-dimensional arrays
* Perform aggregation (sum and average)
* Track maximum values and their indices
* Use `switch` statements for control flow
* Map numeric indices to meaningful real-world values

---

## Hint

After finding the index of the highest expense, use a `switch` statement to 
convert the index into a day name.
