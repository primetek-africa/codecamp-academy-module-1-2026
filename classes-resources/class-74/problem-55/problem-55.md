# Programming Challenge: Warehouse Inventory Grid

## Problem Introduction

A logistics company stores products in a warehouse organized in a **grid system**. 
Each row of the grid represents a **section of the warehouse**, and each column 
represents a **shelf** within that section.

The warehouse management software stores the quantity of products using a 
**two-dimensional array (multidimensional array)** where:

* Each **row** represents a warehouse section
* Each **column** represents a shelf
* Each value represents the **number of items stored on that shelf**

Example warehouse grid:

```javascript
const warehouse = [
  [12, 5, 8, 10],
  [7, 14, 3, 6],
  [9, 11, 2, 4],
  [6, 8, 13, 7]
];
```

Visual representation:

| Section | Shelf 0 | Shelf 1 | Shelf 2 | Shelf 3 |
| ------- | ------- | ------- | ------- | ------- |
| 0       | 12      | 5       | 8       | 10      |
| 1       | 7       | 14      | 3       | 6       |
| 2       | 9       | 11      | 2       | 4       |
| 3       | 6       | 8       | 13      | 7       |

---

# Your Tasks

Using **JavaScript** and working with the multidimensional array, solve the 
following problems.

## 1. Total Inventory

Calculate the **total number of items** stored in the entire warehouse.

---

## 2. Section Inventory

Calculate the **total number of items in each warehouse section**.

Example output:

```
Section 0: 35 items
Section 1: 30 items
Section 2: 26 items
Section 3: 34 items
```

---

## 3. Find the Shelf with the Highest Quantity

Determine the **highest number of items stored on any shelf** in the warehouse.

Example output:

```
Highest quantity on a shelf: 14
```

---

## 4. Count Low Stock Shelves

A shelf is considered **low stock** if it contains **fewer than 5 items**.

Count how many shelves in the warehouse have low stock.

---

## 5. Locate a Specific Shelf

Write a program that finds the **row and column** of a shelf containing exactly 
**13 items**.

Example output:

```
Item quantity 13 found at:
Section: 3
Shelf: 2
```

---

# Constraints

* You must use **nested loops** to traverse the multidimensional array.
* Do not convert the array into a one-dimensional array.
* Access elements using `array[row][column]`.

---

# Learning Objective

This exercise will help you practice:

* Working with **multidimensional arrays**
* Using **nested loops**
* Traversing **matrix-like data structures**
* Applying logic to **grid-based data**

These skills are essential when working with:

* game boards
* image grids
* spatial data
* matrix algorithms
