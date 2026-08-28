# Challenge: Daily Task Scheduler

## Introduction

In this challenge, you will simulate a **daily task scheduler** using JavaScript 
arrays. Many productivity applications store and organize tasks that users plan 
to complete during the day. These systems allow tasks to be added, reordered,
completed, and reviewed.

Your goal is to manage a list of tasks and update it as tasks are completed or 
new tasks are added. This exercise focuses on **array manipulation, searching, 
and modifying elements inside an array**.

Unlike previous exercises that focused on numerical analysis, this challenge 
focuses on **managing and updating items inside an array**.

---

## Problem Description

A productivity application stores a user's daily tasks in the following array:

```javascript
let tasks = ["Check emails", "Write report", "Attend meeting", "Review code"];
```

Write a JavaScript program that performs the following tasks.

---

## Tasks

1. Print the **total number of tasks** in the list.
2. Add a new task **"Plan tomorrow's work"** to the end of the list.
3. Insert a new task **"Morning exercise"** at the **beginning** of the list.
4. Find the position of the task **"Attend meeting"** in the list.
5. Mark **"Attend meeting"** as completed by replacing it with **"Attend meeting (Completed)"**.
6. Remove the task **"Check emails"** from the list.
7. Print all remaining tasks using the format:

```
Task 1: ...
Task 2: ...
...
```

8. Check if the task **"Review code"** still exists in the list.

* If it exists, print: `Task still pending`.
* If it does not exist, print: `Task completed or removed`.

---

## Expected Output Structure

```
Total tasks: ...
Position of 'Attend meeting': ...
Tasks for today:
Task 1: ...
Task 2: ...
...

Task still pending
```

---

## Hints

Hint 1

Use the `length` property to count the tasks.

Hint 2

Use `push()` to add a task to the end of the list.

Hint 3

Use `unshift()` to add a task to the beginning of the list.

Hint 4

Use `indexOf()` to find the position of a task in the array.

Hint 5

To replace an element in an array, you can assign a new value using its index.

Hint 6

Use `splice()` to remove a specific task from the array.

Hint 7

Use `includes()` to check if a task exists in the array.
