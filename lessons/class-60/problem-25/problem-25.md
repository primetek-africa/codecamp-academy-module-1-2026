# Problem: Basic Math Operation Selector (Using `switch` in JavaScript)

## Introduction

In many programs, the computer needs to choose between different actions depending 
on a numeric option selected by the user. One common way to implement this type of 
control flow is by using the **`switch` statement**.

In this exercise, you will practice using the `switch` statement in **JavaScript** 
to select and execute different **mathematical operations** based on a numeric code.

This exercise will help you:

- Understand how a **`switch` statement** works.
- Use **numeric cases instead of text comparisons**.
- Apply **basic arithmetic operations** in JavaScript.
- Write clean and readable control flow logic.

---

## Problem Description

A small calculator program receives two numbers and a numeric code representing 
the operation to perform.

Your program must use a **`switch` statement** to determine which mathematical 
operation should be applied.

### Operation Codes

| Code | Operation |
|-----|-----------|
| 1 | Addition |
| 2 | Subtraction |
| 3 | Multiplication |
| 4 | Division |

If the operation code does **not match any valid option**, the program should 
display an error message.

---

## Given Variables

The program already defines the following variables:

```javascript
const num1 = 20;
const num2 = 5;
const operation = 3;
```

- `num1` → first number
- `num2` → second number
- `operation` → numeric code that determines the math operation

---

## Expected Behavior

Your program must:

1. Use a `switch` statement based on the `operation` variable.
2. Perform the correct mathematical operation using `num1` and `num2`.
3. Display the result.
4. Handle invalid operation codes using the `default` case.

---

## Example

If:

```
num1 = 20
num2 = 5
operation = 3
```

The program should perform:

```
20 * 5 = 100
```

Output:

```
Result: 100
```

---

## Requirements

- Create a flowchart 
- Use a switch statement.
- The operation must be selected only by the numeric code.
- Display the final result.