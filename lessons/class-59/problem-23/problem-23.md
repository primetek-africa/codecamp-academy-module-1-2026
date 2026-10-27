# Programming Exercise: Shipping Cost Calculator

## Introduction

In many e-commerce systems, the **shipping cost of an order** depends on multiple 
factors, such as the shipping method and the destination region.

To manage several possible options in a structured way, JavaScript provides the 
**`switch` statement**, which allows a program to execute different blocks of code 
depending on the value of a variable.

In this exercise, you will build a **shipping cost calculator** that determines 
the price of shipping based on the **shipping method** and the **destination region**.

---

## Problem Description

Create a program that calculates the **shipping cost** of a package.

The program contains two variables:

```javascript
const shippingMethod = "express";
const region = "international";
```

---

Shipping methods available:

Method      |   Description
standard	|   Standard delivery
express	    |   Faster delivery
overnight	|   Next-day delivery

---

Regions available:

Region	        |   Description
local	        |   Same city
national	    |   Same country
international	|   Outside the country

---

Shipping costs:

**Standard Shipping**

Region	        |   Cost
local	        |   $5
national	    |   $10
international	|   $20

**Express Shipping**

Region	        |   Cost
local	        |   $10
national	    |   $20
international	|   $40

**Overnight Shipping**

Region	        |   Cost
local	        |   $20
national	    |   $35
international	|   $60

---

**Your program must:**

Use a switch statement to evaluate the shipping method.
Inside each case, determine the correct cost depending on the region.
Display the final shipping cost.

If the shipping method or region is invalid, the program should display an error message.

---

## Input

The program will use predefined variables:

```javascript
const shippingMethod = "express";
const region = "national";
```

Students may change these values to test different scenarios.

---

## Expected Output

Examples:

```
shippingMethod = "standard"
region = "local"

Output: Shipping cost: $5
```

```
shippingMethod = "overnight"
region = "national"

Output: Shipping cost: $35
```

```
shippingMethod = "fast"
region = "local"

Output: Invalid shipping method.
```

---

## Requirements

Your solution must:

- Create a flowchart
- Be written in JavaScript
- Run using Node.js
- Use at least one switch statement
- Handle invalid values
- Print the result using `console.log()`