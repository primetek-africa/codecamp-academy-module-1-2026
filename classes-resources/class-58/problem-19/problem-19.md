# 🧠 Programming Exercise: Command Line Menu with `switch`

## 📘 Introduction

In many command-line applications, users interact with programs by selecting options 
from a menu. Depending on the option chosen, the program performs a different action.

To manage multiple possible options efficiently, JavaScript provides the **`switch` 
statement**, which allows a program to execute different blocks of code depending 
on the value of a variable.

In this exercise, you will build a **simple command-line menu program** using 
**Node.js**. The program will display a set of options, ask the user to choose one, 
and then execute the corresponding action using a **`switch` statement**.

---

## 🎯 Problem Description

Create a **Node.js program** that simulates a simple system menu.

The program must ask the user to choose one of the following options:

| Option | Action |
|------|------|
| 1 | Show "Welcome to the system" |
| 2 | Show "System status: Running correctly" |
| 3 | Show "Goodbye!" |
| 4 | Show "Help: Contact the system administrator" |

Your program must evaluate the user's choice using a **`switch` statement** and 
display the corresponding message.

If the user enters a value that **does not exist in the menu**, the program must 
display an **error message indicating the option is invalid**.

---

## 📥 Input

The program should request the user input from the **terminal**.

Example prompt:

Select an option:

1 - Welcome message
2 - System status
3 - Exit
4 - Help

Enter your choice:

---

## 📤 Expected Output

Example executions:

Input: 1
Output: Welcome to the system

Input: 2
Output: System status: Running correctly

Input: 9
Output: Invalid option. Please select a valid menu option.

---

## ⚙️ Requirements

Your solution must:

- Be written in **JavaScript**
- Run using **Node.js**
- Use a **`switch` statement** to evaluate the selected option
- Include a **`default` case** for invalid options
- Display clear messages in the terminal

---

## 💡 Learning Objective

By completing this exercise, students will learn:

- How to build **interactive terminal programs with Node.js**
- How to control program flow using the **`switch` statement**
- How to handle **multiple possible user choices in a structured way**
