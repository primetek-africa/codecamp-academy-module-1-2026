# Challenge: Library Management System

## Problem Description

A small digital library needs a simple system to manage its books using 
JavaScript.

Each book must contain:

* Title
* Author
* Publication year
* Number of pages
* Availability status
* Genres

Your task is to create a small library management system using:

* Objects
* Arrays
* Functions

The goal of this challenge is to practice how these three concepts work together 
in real-world programming scenarios.

---

# Requirements

## Step 1 — Create the Library

Create an array called `library` containing at least 5 book objects.

Each object should follow this structure:

```javascript
{
  title: "Book title",
  author: "Author name",
  year: 2020,
  pages: 350,
  available: true,
  genres: ["Technology", "Programming"]
}
```

---

## Step 2 — Create Functions

Create the following functions:

### 1. Display All Books

Create a function that prints the title and author of every book.

---

### 2. Get Available Books

Create a function that returns only the books currently available.

---

### 3. Find a Book by Title

Create a function that receives a title as parameter and returns the matching book.

---

### 4. Calculate Total Pages

Create a function that calculates the total number of pages of all books.

---

### 5. Add a New Book

Create a function that adds a new book object into the library array.

---

# Expected Learning Objectives

By completing this challenge, students will practice:

* Creating and manipulating objects
* Working with arrays
* Declaring and using functions
* Traversing arrays using loops and array methods
* Structuring data like real-world systems

---

# Example Output

```javascript
Clean Code - Robert C. Martin
The Pragmatic Programmer - Andrew Hunt
Atomic Habits - James Clear
JavaScript: The Good Parts - Douglas Crockford
Design Patterns - Erich Gamma

Available Books:
[
  { ... },
  { ... },
  { ... }
]

Find Book:
{
  title: 'Clean Code',
  author: 'Robert C. Martin',
  year: 2008,
  pages: 464,
  available: true,
  genres: [ 'Programming', 'Software Engineering' ]
}

Total Pages:
1707
```

---

# Important Note

Focus on writing:

* Clean code
* Descriptive variable names
* Well-structured objects
* Reusable functions

This challenge simulates how real applications organize and process information.