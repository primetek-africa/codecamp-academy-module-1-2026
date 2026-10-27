# Exercise: Employee Bonus Evaluation

## Description

A company wants to determine the **annual bonus** for its employees based on their **years of experience** and their **performance score**.

Create a program that asks the user to enter:

- Years of experience
- Performance score (0–100)

The program must determine the **type of bonus** the employee receives.

---

## Inputs

- Years of experience
- Performance score (0 - 100)

---

## Rules

- If the performance score is **less than 0 or greater than 100** → print **"Invalid performance score"**.
- If the years of experience is **negative** → print **"Invalid years of experience"**.
- If the employee has **5 or more years of experience AND a performance score of 85 or higher** → **"Full Bonus"**.
- If the employee has **3 or more years of experience AND a performance score of 70 or higher** → **"Partial Bonus"**.
- If the employee has **less than 3 years of experience but a performance score of 90 or higher** → **"Special Recognition Bonus"**.
- Otherwise → **"No Bonus"**.

---

## Example Input

Years of experience: 6  
Performance score: 88

---

## Output

Full Bonus