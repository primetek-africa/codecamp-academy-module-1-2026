# Programming Exercise: Gym Membership Access

## Problem Description

A gym wants to create a small program that determines whether a person can 
**enter the gym** and what **price they must pay** depending on their **membership 
type** and whether they want **personal trainer access**.

---

## Membership Types

Membership | Base Price
basic | $20
premium | $35

---

## Additional Rules

1. If the membership is **premium**, the customer can access the **personal trainer 
for free**.

2. If the membership is **basic** and the customer wants a **personal trainer**, 
an additional **$10 fee** is added.

3. If the user enters a membership type different from **basic** or **premium**, 
the program must display:

> Invalid membership type.

---

## Inputs

Your program must ask the user for:

- The **membership type** (`basic` or `premium`)
- Whether they want **personal trainer access** (`yes` or `no`)

Example:

```
Enter membership type:
basic

Personal trainer? (yes/no)
yes
```
---

## Expected Output Example

> Total membership cost: $30

---

## Your Tasks

1. Create the **algorithm in JavaScript**.
2. Use **nested conditionals**.
3. Draw the **flowchart of the algorithm**.
4. Test your program with different inputs.
