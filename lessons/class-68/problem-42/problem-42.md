# Programming Challenge: ATM Withdrawal Simulation (Using `do...while`)

## Problem Introduction

In this challenge, you will design and implement a simple **ATM withdrawal simulation**. 
The goal is to practice **problem analysis, algorithm design, and control flow 
using the `do...while` loop** in JavaScript.

Imagine an ATM system where a user wants to withdraw money from their bank account. 
The system must repeatedly ask the user how much money they want to withdraw until 
they choose to stop or until the account balance reaches zero.

The key idea is that **the withdrawal process must run at least once**, which makes 
the **`do...while` loop** an appropriate control structure for this problem.

---

## Learning Objectives

By completing this challenge, you will practice:

- Analyzing a programming problem
- Identifying **inputs, outputs, and constraints**
- Designing a **solution using a flowchart**
- Implementing the algorithm using **JavaScript**
- Applying the **`do...while` iteration statement**

---

## Scenario

You are building a simple ATM system with the following conditions:

- The ATM starts with an **initial account balance of $500**.
- The system must **ask the user how much money they want to withdraw**.
- If the withdrawal amount is **greater than the available balance**, the system 
must display a message indicating **insufficient funds**.
- If the withdrawal is valid, the system subtracts the amount from the balance and 
shows the **remaining balance**.
- After each transaction, the system asks the user **if they want to perform another withdrawal**.
- The program continues running **until the user decides to stop or the balance becomes $0**.

---

## Your Tasks

### Analyze the Problem

Identify:

- **Inputs**
- **Outputs**
- **Conditions**
- **Loop termination condition**

---

### Design the Algorithm

Create a **flowchart** that represents the logic of the ATM withdrawal process.  
Your flowchart should include:

- Start and End nodes
- User input
- Decision conditions
- Loop structure
- Balance updates

---

### Implement the Solution

Write a **JavaScript program** that implements the algorithm using a **`do...while` 
loop**.

Your program should:

- Initialize the account balance
- Ask for withdrawal amounts
- Validate the withdrawal
- Update and display the balance
- Ask the user if they want another transaction

---

## Important Constraints

- The loop **must be implemented using `do...while`**
- The balance **cannot go below zero**
- The program **must run at least once**

---

## Example Interaction (Conceptual)

```
Current balance: $500
Enter withdrawal amount: 100
Withdrawal successful.
Remaining balance: $400
```

> Do you want to make another withdrawal? (yes/no)

---

## Expected Outcome

At the end of this challenge, you should have:

1. A **problem analysis**
2. A **flowchart**
3. A **JavaScript implementation using `do...while`**

---

Good luck and think like a **software engineer**:  
**Analyze → Design → Implement**