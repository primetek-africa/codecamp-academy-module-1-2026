## Exercise: Convert `if...else` to Ternary Operator

Below you will find five examples using `if...else`.

Your task is to **rewrite each example using the ternary operator (`? :`)**.

---

### Exercise 1 — Password Validation

```javascript
let passwordLength = 10;
let validation;

if (passwordLength >= 8) {
  validation = "Strong password";
} else {
  validation = "Password too short";
}
```

Convert this code to use a **ternary operator**.

---

### Exercise 2 — Free Shipping

```javascript
let purchaseAmount = 120;
let shipping;

if (purchaseAmount >= 100) {
  shipping = "Free shipping";
} else {
  shipping = "Shipping cost applies";
}
```

Rewrite this logic using a **ternary operator**.

---

### Exercise 3 — Access Permission

```javascript
let hasPermission = false;
let access;

if (hasPermission) {
  access = "Access granted";
} else {
  access = "Access denied";
}
```

Rewrite this algorithm using the **ternary operator**.

---

### Exercise 4 — Battery Status

```javascript
let batteryLevel = 15;
let status;

if (batteryLevel <= 20) {
  status = "Low battery";
} else {
  status = "Battery level OK";
}
```

Rewrite this algorithm using a **ternary operator**.

---

## Exercise 5 — Online Status

```javascript
let isOnline = false;
let connection;

if (isOnline) {
  connection = "User is online";
} else {
  connection = "User is offline";
}
```

Convert this conditional using the **ternary operator**.

---

### Reminder: Ternary Operator Syntax

```javascript
condition ? valueIfTrue : valueIfFalse;
```