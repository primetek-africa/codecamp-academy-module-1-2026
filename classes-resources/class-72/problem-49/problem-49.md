# Challenge: Warehouse Inventory Manager

## Introduction

In this challenge, you will simulate a **small warehouse inventory system** using 
JavaScript arrays. Arrays are commonly used in real applications to store collections
of data such as products, users, transactions, or messages.

A warehouse system must constantly **add products, remove products, check inventory 
size, and inspect specific items**. In this exercise, you will manipulate an array
representing the warehouse inventory and perform several operations that resemble 
real-world product management.

This challenge will require you to use multiple 
**fundamental array methods and properties**, including:

- `length`
- `push()`
- `pop()`
- `shift()`
- `unshift()`
- Accessing elements by index
- Iterating through arrays with loops
- Conditional statements

---

## Problem Description

A warehouse currently stores the following products:

```javascript
let inventory = ["Laptop", "Mouse", "Keyboard", "Monitor", "USB Cable"];
```

## Write a program that performs the following operations:

1. Print the total number of products in the inventory.
2. Add two new products to the inventory: `"Webcam"` and `"Headphones"`.
3. Remove the last product from the inventory.
4. Remove the first product from the inventory.
5. Add a new product `"Tablet"` to the beginning of the inventory.
6. Print the second product in the inventory.
7. Check if the inventory has more than 5 products and print a message:
    - `"Warehouse is well stocked"` if true
    - `"Warehouse needs more products"` if false
8. Print all products in the inventory with their position number, starting from 1.

Example output format:
```
1 - Tablet
2 - Mouse
3 - Keyboard
```

---

## Goal of the Exercise

By completing this challenge, you will practice:

- Managing arrays dynamically
- Using several important array methods
- Working with indexes
- Using loops with arrays
- Combining arrays with conditional logic