# Programming Challenge: Number Guess Counter (Using `do...while`)

## Problem Overview

In this challenge, you will create a simple program that counts how many numbers 
a user enters before deciding to stop.  

The program will repeatedly ask the user to enter a number and keep track of how 
many numbers have been entered. After each number, the system will ask the user 
if they want to continue or stop.

This problem is ideal for practicing the **`do...while` loop**, since the program 
must **run at least once** before checking if the user wants to continue.

---

## Learning Objectives

By completing this exercise, you will practice:

- Understanding how a **`do...while` loop** works
- Designing a simple algorithm
- Counting iterations in a loop
- Handling user input with `prompt()`
- Displaying messages with `alert()`

---

## Scenario

You are building a simple counter program with the following behavior:

- The program asks the user to **enter a number**.
- Each time the user enters a number, the program **increases a counter**.
- After entering the number, the program asks the user if they want to **continue entering numbers**.
- If the user answers **"yes"**, the program repeats the process.
- If the user answers **"no"**, the program stops.
- At the end, the program displays **how many numbers were entered in total**.

---

## Your Tasks

### Analyze the Problem

Identify:

- Inputs
- Outputs
- Variables required
- Loop termination condition

---

### Design the Algorithm

Create a **flowchart** representing the logic of the program.

Your flowchart should include:

- Start and End
- User input
- Counter update
- Decision to continue
- Loop structure

---

### Implement the Solution

Write a JavaScript program that:

- Uses a **`do...while` loop**
- Uses `prompt()` to ask the user for numbers
- Uses `alert()` to display the final result
- Counts how many numbers were entered

---

## Constraints

- You **must use a `do...while` loop**
- The program **must execute at least once**
- The counter must increase **every time the user enters a number**

---

## Example Interaction

```
Enter a number: 5
Do you want to enter another number? (yes/no)

Enter a number: 10
Do you want to enter another number? (yes/no)

Enter a number: 7
Do you want to enter another number? (yes/no)

Result:
You entered 3 numbers.
```
---

## Expected Result

At the end of the exercise you should have:

- Problem analysis
- Flowchart
- JavaScript implementation using **`do...while`**