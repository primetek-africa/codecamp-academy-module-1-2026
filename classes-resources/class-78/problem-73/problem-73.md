# Problem: Loan Monthly Payment Calculator

## Objective
Develop a function that calculates the fixed monthly payment for a loan using the 
compound interest formula.

## Scenario
You are working as a software engineer for a bank. The system must calculate how 
much a customer needs to pay every month when they take out a loan.

The bank applies compound interest, and the monthly payment is calculated using the standard amortization formula:

    M = P * [ r(1 + r)^n ] / [ (1 + r)^n - 1 ]

Where:
- `M` is the monthly payment
- `P` is the loan principal (amount borrowed)
- `r` is the monthly interest rate (annual rate / 12)
- `n` is the total number of payments (months)

## Requirements
1. Create a function named `calculateMonthlyPayment`.
2. The function must receive:
   - `principal` (number) → total loan amount
   - `annualRate` (number) → annual interest rate (e.g., 0.12 for 12%)
   - `years` (number) → duration of the loan in years

3. The function should:
   - Convert the annual rate to a monthly rate
   - Calculate the total number of payments
   - Apply the formula
   - Return the monthly payment

4. The function must return:
   - A number representing the monthly payment

## Example

### Input:
principal = 10000  
annualRate = 0.12  
years = 1  

### Output:
monthlyPayment ≈ 888.49