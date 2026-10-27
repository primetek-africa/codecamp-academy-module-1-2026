# Algorithm Exercise: Bank Loan Approval System

You are building a **loan approval system for a bank**.

The system must determine whether a customer can receive a loan and calculate the 
**maximum loan amount** based on:

- Age
- Monthly salary
- Employment status
- Credit score

---

## Basic Requirements

To apply for a loan, the customer must meet these minimum conditions:

- Age must be **between 18 and 65**
- Monthly salary must be **greater than 0**

If these conditions are not met, the program must output:

> Invalid applicant data.

---

## Employment Status

The customer must specify their employment status:

- `employed`
- `self-employed`
- `unemployed`

If the value is not one of these options, show:

> Invalid employment status.

---

## Employment Rule

Additional rules apply depending on employment status.

### Employed

If the customer is **employed**, they qualify normally based on the credit score.

---

### Self-Employed

If the customer is **self-employed**:

- Loan amount is reduced by **20%**

---

### Unemployed

If the customer is **unemployed**:

> Loan rejected

---

## Final Loan Amount

If the loan is approved:

Loan Amount = salary × multiplier

If the applicant is **self-employed**, reduce the loan by **20%**.

---

## Output Examples

**Example**

age = 30
salary = 2000
employment = employed
creditScore = 720

Loan approved.
Maximum loan amount: $6000

---

## Your Tasks

Students must:

1. Create the **algorithm in JavaScript**
2. Design the **flowchart diagram**
3. Use **nested conditionals (`if`, `else if`, `else`)**
4. Validate all inputs
5. Calculate the **maximum loan amount if approved**

---

## Learning Goals

This exercise helps you practice:

- Nested conditional logic
- Input validation
- Business rule implementation
- Algorithm design