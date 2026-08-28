# Programming Exercise: Food Delivery Order

## Problem Description

A small restaurant wants to create a program that calculates the **final cost of 
a food order** depending on the **type of meal** and whether the customer wants 
**home delivery**.

The program must apply the following rules.

---

## Meal Prices

Meal | Price
burger | $8
pizza | $10
salad | $7

---

## Additional Rules

1. If the customer selects **home delivery**, an additional **$3 delivery fee** 
is added.

2. If the meal is **pizza** and the customer chooses delivery, the delivery fee 
becomes **$2 instead of $3** (special promotion).

3. If the meal entered is not **burger**, **pizza**, or **salad**, the program 
must display:

> Invalid meal option.

---

## Inputs

Your program must ask the user for:

- The **meal type** (`burger`, `pizza`, or `salad`)
- Whether they want **delivery** (`yes` or `no`)

Example:

```
Enter meal type:
pizza

Delivery? (yes/no)
yes
```

---

## Expected Output Example

Total price: $12

---

## Your Tasks

1. Create the **algorithm in JavaScript**.
2. Use **nested conditionals**.
3. Draw the **flowchart of the algorithm**.
4. Test the program with different inputs.