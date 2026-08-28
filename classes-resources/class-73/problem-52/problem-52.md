# Challenge: Library Book Manager

## Introduction

In this challenge, you will build a **Library Book Manager** using JavaScript 
arrays. Libraries and digital catalog systems often maintain lists of books that 
must be updated, analyzed, and organized.

This exercise focuses on practicing **array manipulation and data processing** 
using loops and conditional logic. You will modify a list of books, search within 
the array, and generate useful information about the library collection.

Compared to previous exercises, this challenge requires you to:

* Modify the array multiple times
* Search for specific values
* Count elements that satisfy conditions
* Display structured information

---

## Problem Description

A small library stores the following books in its catalog:

```javascript
let books = [
  "The Hobbit",
  "1984",
  "To Kill a Mockingbird",
  "The Great Gatsby",
  "Moby Dick"
];
```

Write a JavaScript program that performs the following tasks.

---

### Tasks

1. Print the **total number of books** in the library.
2. Add two new books to the catalog:

   * "Brave New World"
   * "The Catcher in the Rye"
3. Remove the **first book** from the catalog.
4. Check if the book **"1984"** exists in the catalog.

   * If it exists, print: `Book found in the catalog`.
   * If not, print: `Book not found`.
5. Print all books in the catalog using a loop with the format:

```
1 - Book title
2 - Book title
...
```

6. Count how many books contain the word **"The"** in the title.
7. Print the number of books that contain **"The"**.

---

## Expected Output Structure

```
Total books: ...
Book found in the catalog
Books in the library:
1 - ...
2 - ...
...
Books containing "The": ...
```

---

## Hints

Hint 1

Use the `length` property to determine the total number of books.

Hint 2

Use `push()` to add new books to the catalog.

Hint 3

Use `shift()` to remove the first book.

Hint 4

To check if a book exists, you can compare each element during a loop.

Hint 5

To check if a title contains the word "The", you may use:

```javascript
book.includes("The")
```
