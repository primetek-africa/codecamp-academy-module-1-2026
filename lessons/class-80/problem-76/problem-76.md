# Practice Problem: Order Processing with Arrow Functions

## Problem Description

You are building a small feature for an e-commerce platform. The system receives 
a list of orders, where each order contains:

* `id`: Order identifier
* `customer`: Customer name
* `total`: Total amount of the order
* `status`: Either "completed" or "pending"

### Your Tasks

Using **arrow functions**, complete the following operations:

1. Create a new array containing only the **completed orders**.
2. From those completed orders, extract only the **total values**.
3. Calculate the **sum of all completed order totals**.
4. Create a new array with a simplified structure:

   ```javascript
   { id, customer }
   ```

   for completed orders only.

---

## Input Data

```javascript
const orders = [
  { id: 1, customer: "Alice", total: 120, status: "completed" },
  { id: 2, customer: "Bob", total: 80, status: "pending" },
  { id: 3, customer: "Charlie", total: 200, status: "completed" },
  { id: 4, customer: "Diana", total: 50, status: "pending" },
  { id: 5, customer: "Eve", total: 300, status: "completed" }
];
```

---

## Expected Learning Objectives

* Practice arrow function syntax
* Use `filter`, `map`, and `reduce`
* Understand functional programming patterns in JavaScript

---

## Expected Output

```javascript
Completed Orders: [
  { id: 1, customer: "Alice", total: 120, status: "completed" },
  { id: 3, customer: "Charlie", total: 200, status: "completed" },
  { id: 5, customer: "Eve", total: 300, status: "completed" }
]

Totals: [120, 200, 300]

Total Revenue: 620

Simplified Orders: [
  { id: 1, customer: "Alice" },
  { id: 3, customer: "Charlie" },
  { id: 5, customer: "Eve" }
]
```