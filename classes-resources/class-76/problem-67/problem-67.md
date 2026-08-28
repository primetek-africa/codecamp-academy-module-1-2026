# Programming Challenge: Low Stock Inventory Checker

## Problem Introduction

You are developing a basic inventory system for a small store. The system keeps 
track of the **quantity of items in stock** using a **one-dimensional array**, 
where each element represents the number of units available for a specific product.

Each index corresponds to a product ID.

---

## Example Input

```javascript
const inventory = [12, 3, 25, 0, 7, 2, 18];
```

---

## Task

A product is considered **low stock** if its quantity is **less than 5 units**.

Using JavaScript, analyze the inventory and:

1. Count how many products are **low stock**
2. Print the **product ID (index)** and its **quantity** for each low stock item

---

## Expected Output

```
Low stock items: 3
Product 1 → 3 units
Product 3 → 0 units
Product 5 → 2 units
```

---

## Requirements

* Use a **single loop**
* Do not use functions
* Do not use advanced array methods (`filter`, `map`, `reduce`)
* Access elements using `array[index]`

---

## Learning Objectives

* Practice iterating over arrays
* Apply conditional logic based on thresholds
* Track counts and positions simultaneously
* Understand basic inventory monitoring logic

---

## Hint

Check each quantity against the threshold (`< 5`) and keep a counter for low stock items.
