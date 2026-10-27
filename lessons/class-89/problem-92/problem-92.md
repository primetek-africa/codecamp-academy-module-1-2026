# Intermediate OOP Code Challenge: Library Book Borrowing System

## Problem Introduction

A local library is developing a **Book Borrowing System** to help librarians 
manage books, register users, and control the borrowing process.

As a software engineer, your task is to design a system using 
**Object-Oriented Programming (OOP)** principles in **JavaScript**, applying:

* Public methods
* Private methods
* Protected methods (by convention)
* Static methods
* Encapsulation
* Inheritance

You must create a class architecture that simulates how a real library manages 
books and student borrowing.

This challenge is slightly easier than a professional enterprise system, but 
still requires students to think about **business logic**, **object relationships**, 
and **method accessibility**.

---

# System Requirements

## 1. Create a Parent Class: `User`

The class should contain:

### Properties

* `fullName`
* `studentId`

### Protected Method (Convention)

Create a protected method:

```javascript
_generateBorrowCode()
```

Requirements:

Generate a borrowing code in the format:

```text
BRW-4582
```

This method should only be used internally or by child classes.

---

## 2. Create a Child Class: `Student`

The class should inherit from `User`.

### Additional Properties

* `borrowedBooks` → empty array by default

---

## 3. Create Private Methods

### `#validateBook(book)`

Requirements:

Return `true` only if:

* Book title exists.
* Author exists.
* Number of copies is greater than 0.

Otherwise return `false`.

---

## 4. Create Public Methods

### `borrowBook(title, author, copies)`

Requirements:

### Step 1

Validate book information using:

```javascript
#validateBook()
```

### Step 2

Generate borrow code using:

```javascript
_generateBorrowCode()
```

### Step 3

Create borrowed book object:

```javascript
{
    borrowCode,
    title,
    author,
    borrowDate
}
```

### Step 4

Store borrowed book in:

```javascript
borrowedBooks
```

### Step 5

Return success message.

---

### `returnBook(borrowCode)`

Requirements:

* Search for borrowed book by code.
* Remove it from borrowed books.
* Return success message.
* If not found, return an error message.

---

### `showBorrowedBooks()`

Return all borrowed books.

---

## 5. Create Static Method

### `static calculateLateFee(daysLate)`

Requirements:

Business rule:

```text
$2 for each late day
```

Example:

```javascript
Student.calculateLateFee(5)
```

Output:

```text
10
```

---

## Expected Concepts to Apply

Students must correctly apply:

* Classes
* Constructors
* Inheritance (`extends`)
* Public methods
* Private methods (`#`)
* Protected methods (`_`)
* Static methods
* Arrays of objects
* Encapsulation
* Basic business logic
* Object state management

---

# Reflection Questions

1. Why should `#validateBook()` be private?

2. Why is `_generateBorrowCode()` protected instead of public?

3. Why is `calculateLateFee()` static?

4. What OOP principle is demonstrated by hiding validation logic?

5. How does inheritance reduce duplicated code?

6. What object state changes occur during borrowing and returning?

7. How does this challenge simulate a real library system?
