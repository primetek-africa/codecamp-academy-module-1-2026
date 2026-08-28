# Programming Exercise: Access Control System

## Problem Description

You are developing a **simple access control system** for a technology building.

The system must determine whether a person is **allowed to enter the building** 
based on:

- Their **age**
- Whether they have an **access card**

---

## Access Rules

1. A person must be **18 years old or older** to enter the building.

2. If the person is **18 or older**, the system must check if they **have an access card**.

3. Access is granted **only if the person has an access card**.

---

## Inputs

Your program must ask the user for:

- Age
- Access card (`yes` or `no`)

---

## Validation Rules

Your program must validate:

- Age cannot be negative
- Age cannot be greater than **120**
- Access card must be **yes** or **no**

If the input is invalid, display:

> Invalid input detected.

---

## Expected Output

**Example:**

Age: 25
Access card: yes

Access granted.

---

## Student Tasks

Students must create:

### Flowchart

Create a **flowchart diagram** showing the decision process.

## 💡 Hint

Your algorithm may follow this logic:

```
IF age >= 18
CHECK access card
ELSE
ACCESS DENIED
```

Then apply **another conditional** for the access card.