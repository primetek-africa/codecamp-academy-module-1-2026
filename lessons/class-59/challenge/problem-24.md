# Programming Exercise: Movie Rating Classification

## Introduction

In many applications, programs must classify information based on predefined 
categories. For example, movie platforms often display ratings that indicate 
whether a movie is appropriate for certain audiences.

To handle multiple possible values efficiently, JavaScript provides the **`switch` 
statement**, which allows a program to execute different blocks of code depending 
on the value of a variable.

In this exercise, you will create a program that interprets a **movie rating code** 
and prints a description of the rating.

---

## Problem Description

Create a program that evaluates a variable called `rating` and prints a message 
describing the movie classification.

The program contains the following variable:

```javascript
const rating = "PG";
```

**Possible movie ratings:**

Rating	|   Meaning
G	    |   General audiences
PG	    |   Parental guidance suggested
PG-13	|   Parents strongly cautioned
R	    |   Restricted
NC-17	|   Adults only

Your program must use a switch statement to determine the correct description for 
the rating.

If the value of rating does not match any known rating, the program must display 
a message indicating the rating is invalid.

---

## Input

The program uses a predefined variable:

```javascript
const rating = "PG";
```

> Students can change the value to test different cases.

---

## Expected Output

Examples:

```
rating = "G"
Output: General audiences.
```

```
rating = "PG"
Output: Parental guidance suggested.
```

```
rating = "X"
Output: Invalid movie rating.
```

---

Requirements

Your solution must:

- Create the flowchart
- Be written in JavaScript
- Run using Node.js
- Use a switch statement
- Include a default case
- Display the result using `console.log()`