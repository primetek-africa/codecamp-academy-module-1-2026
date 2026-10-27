# Exercise: Gym Membership Discount

## Description

A gym wants to determine the **discount** a customer receives when purchasing a membership.  
The discount depends on the **customer's age** and whether they are a **student**.

## Inputs

- Customer age
- Student status (yes or no)

## Rules

- If the age is **less than 0** → print **"Invalid age"**.

- If the customer is **under 18**:
  - If the customer **is a student** → **"50% discount"**
  - Otherwise → **"30% discount"**

- If the customer is **18 or older**:
  - If the customer **is a student** → **"20% discount"**
  - Otherwise → **"No discount"**

## Example Input

Age: 16  
Student: yes

## Output

50% discount