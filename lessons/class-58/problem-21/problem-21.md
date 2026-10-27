# Programming Exercise: Traffic Light Simulator with `switch`

## Introduction

In many programs, we need to execute different actions depending on the value of a variable. One way to handle multiple possible values is by using the **`switch` statement** in JavaScript.

The `switch` statement allows developers to compare a variable against several possible values and execute the corresponding block of code. This makes the code more readable when dealing with **multiple discrete options**.

In this exercise, you will simulate the behavior of a **traffic light system** using JavaScript.

---

## Problem Description

Create a program that evaluates the current **traffic light color** and prints the corresponding instruction.

The program will use a variable called:

```javascript
const light = "green";
```

**Possible traffic light values:**

Light   |   ColorDriver Action
red     |   Stop the vehicle
yellow	|   Prepare to stop
green	|   You can go

Your program must use a `switch` statement to determine the correct message.

If the variable contains a value that does not match any known traffic light color, the program must display a default message indicating an invalid light color.

---

## Input

The user should enter the value

## Expected Output

Examples:

light = "red"
Output: Stop the vehicle.

light = "green"
Output: You can go.

light = "blue"
Output: Invalid traffic light color.

---

Requirements

Your solution must:

- Create a flowchart
- Be written in JavaScript
- Use a switch statement
- Include a default case
- Display the result using `alert()`