# Problem: Salary Adjustment System (Using switch in JavaScript)

## Introduction

In many real-world systems, programs must apply different calculations depending 
on a selected numeric option. A common way to organize this type of logic is by 
using a **`switch` statement**.

In this exercise, you will build a small program in **JavaScript** that calculates 
an employee's **new salary after a percentage adjustment**. The adjustment depends 
on a **numeric code representing the employee category**.

The program already defines the required variables, and your task is to implement 
the decision logic using a **`switch` statement**.

This exercise helps you practice:

- Using **`switch` with numeric options**
- Performing **mathematical calculations**
- Writing **clean conditional logic**

---

## Problem Description

A company adjusts employee salaries depending on their **category code**.

Each category applies a **different percentage increase** to the base salary.

### Category Codes

| Code | Category | Salary Increase |
|-----|----------|----------------|
| 1 | Junior | 5% increase |
| 2 | Mid-level | 10% increase |
| 3 | Senior | 15% increase |
| 4 | Lead | 20% increase |

If the category code does **not match any valid option**, the program should 
display an error message.

---

## Given Variables

```javascript
const salary = 2000;
const category = 3;
```

- `salary` → employee's current salary
- `category` → numeric code representing the employee category

---

## Expected Behavior

Your program must:

1. Use a switch statement based on the category variable.
2. Calculate the new salary after the percentage increase.
3. Print the new salary using `console.log()`.
4. Handle invalid category codes using the default case.

---

## Example

If:

```
salary = 2000
category = 3
```

> The salary increase is 15%.

```
2000 + (2000 * 0.15) = 2300

```

**Output:**

```
New Salary: 2300
```

---

## Requirements

- Use a switch statement
- Do not use `if / else`
- Do not request CLI input
- The category must be selected only by the numeric code
- Print the result with `console.log()`