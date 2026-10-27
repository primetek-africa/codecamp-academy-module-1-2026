# Problem: Gym Membership Payment Calculator (Using switch in JavaScript)

## Introduction

Many programs must apply different calculations depending on a selected category. 
A common way to implement this type of logic in JavaScript is by using a 
**`switch` statement**.

In this exercise, you will create a small program that calculates the 
**total cost of a gym membership** depending on the **type of membership plan**
selected.

Each membership plan has a **different monthly price**, and the program must 
calculate the **total payment based on the number of months**.

This exercise will help you practice:

- Using **`switch` statements with numeric cases**
- Applying **basic multiplication operations**
- Writing **structured decision logic**

---

## Problem Description

A gym offers different membership plans. Each plan has a different **monthly cost**.

Your program must calculate the **total membership cost** based on the selected 
**plan code** and the **number of months**.

### Membership Plans

| Code | Plan | Monthly Cost |
|-----|------|--------------|
| 1 | Basic | $25 |
| 2 | Standard | $40 |
| 3 | Premium | $60 |
| 4 | VIP | $90 |

If the plan code does **not match any valid option**, the program should display 
an error message.

---

## Given Variables

```javascript
const months = 6;
const plan = 3;
```

- `months` → number of months the membership will last
- `plan` → numeric code representing the membership plan

---

## Expected Behavior

Your program must:

Use a switch statement based on plan.
Determine the monthly cost.
Calculate the total membership payment.
Print the result using console.log().
Handle invalid codes using the default case.

---

## Example

If:

```
months = 6
plan = 3
```

> Monthly cost = $60

**6 * 60 = 360**

**Output:**

Total Membership Cost: $360 USD

---

## Requirements

- Use a switch statement
- Do not use if / else
- Do not request CLI input
- The plan must be selected only by the numeric code
- Print the result with `console.log()`