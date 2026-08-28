**code Challenge:**

# Algorithm Exercise: Movie Theater Ticket System

You are building a **ticket pricing system for a movie theater**.
The program must calculate the **final price for multiple tickets** based on:

- Age
- Student status
- Day of the week
- Number of tickets

## Base Ticket Price

The normal ticket price is **$12 per ticket**.

## Age Discounts (Per Ticket)

If the customer is **under 12 years old**:

Ticket price becomes **$6**

If the customer is **65 years or older**:

Ticket price becomes **$7**

If the customer is between **12 and 64 years old**:

Ticket price remains **$12**

## Student Discount

If the person **is a student AND age is between 12 and 25**, apply:

**$3 discount per ticket**

## Day of the Week Discount

If the day is **Wednesday**, apply:

**$2 additional discount per ticket**

## Number of Tickets

The user must also enter **how many tickets they want to buy**.

The program must calculate:

**Final Total Price = final_ticket_price × number_of_tickets**

## Invalid Data

If:

- Age is **less than 0**
- Age is **greater than 120**
- Number of tickets is **less than 1**

The program should output:

## :receipt: Final Output Examples

**Example 1**

age = 10
isStudent = no
day = monday
tickets = 2

Final price per ticket = $6
Total price = $12

## Your Tasks

Students must:

1. Create the **algorithm in JavaScript**

2. Design the **flowchart diagram**

3. Use **nested conditionals (`if`, `else if`, `else`)**

4. Calculate:

- price per ticket
- total price

## Learning Goal

This exercise helps you practice:

- Nested conditionals
- Algorithm decomposition
- Input validation
- Multi-step calculations
