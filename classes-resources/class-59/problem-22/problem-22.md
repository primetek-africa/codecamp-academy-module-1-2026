# Programming Exercise: User Role Permissions with `switch`

## Introduction

In many software systems, users have different **roles** that determine what actions 
they are allowed to perform. For example, an administrator may have full access to 
the system, while a regular user may only be able to view certain information.

When a program needs to execute different actions depending on the value of a variable, 
JavaScript provides the **`switch` statement**. This control structure allows developers 
to handle multiple possible cases in a clean and organized way.

In this exercise, you will simulate a **simple permission system** based on user 
roles using **JavaScript and Node.js**.

---

## Problem Description

Create a program that determines what permission a user has based on their **role**.

The program contains a variable called `role`:

```javascript
const role = "admin";
```

---

## Possible roles in the system:

Role    |   Permission
admin   |   Full access to the system
editor	|   Can edit content
viewer	|   Can only view content

Your program must use a `switch **statement** to determine the correct message 
based on the value of role.

If the value of role does not match any known role, the program must display a 
message indicating that the role is invalid or not recognized.

---

## Input

The program will use a predefined variable:

```javascript
const role = "editor";
```

---
## Expected Output

Examples:

```
role = "admin"
Output: Full access to the system.
```

```
role = "editor"
Output: Can edit content.
```

```
role = "guest"
Output: Unknown role.
```

---

## Requirements

Your solution must:

- Create a flowchart
- Be written in JavaScript
- Run using Node.js
- Use a switch statement
- Include a default case
- Display the result using console.log()