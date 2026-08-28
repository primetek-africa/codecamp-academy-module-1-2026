## Ternary Operator in JavaScript

The **ternary operator** is a short way to write a simple `if...else` conditional 
in JavaScript.

It evaluates a **condition** and returns **one of two values** depending on whether 
the condition is `true` or `false`.

### Syntax

```javascript
condition ? valueIfTrue : valueIfFalse;
```

Example with `if...else`

```javascript
let age = 20;
let message;

if (age >= 18) {
  message = "You are an adult";
} else {
  message = "You are a minor";
}
```

> Same Example with Ternary Operator

```javascript
let age = 20;

let message = age >= 18
  ? "You are an adult"
  : "You are a minor";
```

**How it Works**
1. The condition is evaluated.
2. If the condition is true, the expression returns the value after ?.
3. If the condition is false, it returns the value after :.

Example:

```javascript
let score = 75;

let result = score >= 60
  ? "Student passed"
  : "Student failed";

console.log(result);
```

**When to Use It**

Use the ternary operator when:

- The condition is simple
- You only have two possible results
- You want to assign a value based on a condition

> ⚠️ If the logic becomes complex, it is better to use `if...else` for readability.