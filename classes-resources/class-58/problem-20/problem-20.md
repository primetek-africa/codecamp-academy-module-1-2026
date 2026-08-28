# Programming Exercise: Server Response Status with `switch`

## Introduction

In many backend systems, servers respond to client requests using **status codes** that indicate the result of an operation. These codes help developers understand whether a request was successful, failed, or requires further action.

When a program needs to perform different actions depending on the value of a variable, JavaScript provides the **`switch` statement**, which allows the program to evaluate multiple possible cases in a clear and organized way.

In this exercise, you will simulate a **basic server response system** using 
Node.js and the `switch` statement.

---

## Problem Description

Create a program that evaluates a **status code** and prints the corresponding message.

The program will use a variable called `statusCode`, which represents the response of a server.

Possible status codes:

Status Code | Meaning
200 | Request successful
400 | Bad request
401 | Unauthorized access
404 | Resource not found
500 | Internal server error

Your program must use a **`switch` statement** to determine which message should 
be displayed.

If the `statusCode` does **not match any known code**, the program must display 
a **default message** indicating an unknown status code.

---

## Input

The program will use a predefined variable in the code:

```javascript
const statusCode = 404;
```

---
## Expected Output

Examples:

statusCode = 200
Output: Request successful.

statusCode = 500
Output: Internal server error.

statusCode = 123
Output: Unknown status code.

---

## Requirements

Your solution must:

- Create a flowchart
- Be written in JavaScript
- Run using Node.js
- Use a switch statement
- Include a default case
- Print the corresponding message using `console.log()`