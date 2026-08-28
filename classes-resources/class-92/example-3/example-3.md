# Beginner DOM Example: Dynamic To-Do List

## Problem Description

A productivity company wants to create a very simple **To-Do List webpage** 
where users can write tasks and add them dynamically to the screen.

The objective is to allow users to type a task into an input field and display 
it in a list when clicking a button.

### Requirements

When the user clicks the **Add Task** button:

1. Read the text entered in the input field.
2. Create a new list item dynamically.
3. Add the new task to the task list.
4. Clear the input field after adding the task.
5. Prevent empty tasks from being added.

This example helps students practice several DOM concepts in one small project.

### Concepts Students Will Learn

* Selecting DOM elements
* Reading user input with `.value`
* Creating elements using `createElement()`
* Adding elements with `appendChild()`
* Updating the DOM dynamically
* Basic conditional validation
* Event listeners using `addEventListener()`

---

# Project Structure

```txt
project-folder/
│── index.html
│── style.css
│── app.js
```

---

# DOM Concepts Practiced

| Concept          | Example              |
| ---------------- | -------------------- |
| DOM Selection    | `getElementById()`   |
| Input Reading    | `.value`             |
| Event Handling   | `addEventListener()` |
| Dynamic Elements | `createElement()`    |
| DOM Updates      | `appendChild()`      |
| Validation       | `if` statement       |