# Programming Challenge: Password Verification System

## Problem Overview

A simple security system requires a user to enter the correct password before 
gaining access. The system must continue asking for the password until the correct 
one is entered.

Your task is to design a program that repeatedly requests a password and verifies 
whether it matches the correct one. If the password is incorrect, the system should 
continue asking for it. Once the correct password is entered, the system grants 
access and stops the process.

This exercise focuses on using the **`while` statement** to control repetition 
when the number of attempts is not known in advance.

## Scenario

A system administrator has configured the correct password for the system.

The program should simulate a login process where the user enters a password. 
If the password does not match the correct one, the system should deny access and 
request the password again.

The process must continue until the correct password is entered.

## Requirements

Your program should:

- Define a variable that stores the **correct password**.
- Simulate a user entering a password.
- Compare the entered password with the correct password.
- If the password is incorrect, display a message indicating that access is denied.
- Continue requesting the password while it is incorrect.
- When the correct password is entered, display a message indicating that access has been granted.

## Learning Objective

The goal of this exercise is to practice:

- Analyzing a problem before writing code
- Identifying conditions for repetition
- Designing an algorithm using a **flowchart**
- Implementing a **`while` loop** in JavaScript

## Instructions

1. Analyze the problem carefully.
2. Identify the main components:
   - Correct password
   - User input password
   - Validation condition
3. Design the algorithm using a **flowchart**.
4. Implement the solution in **JavaScript** using a `while` loop.
5. Test the program to confirm that the system only stops when the correct password is entered.

## Expected Outcome

The program should simulate a login process that continues asking for the password 
until the correct one is provided, at which point access is granted.