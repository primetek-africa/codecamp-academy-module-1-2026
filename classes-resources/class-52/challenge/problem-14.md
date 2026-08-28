# Programming Exercise: University Course Grading System

## Problem Description

You are developing a **grading system for a university course**.

The system must determine whether a student:

- **Passes the course**
- **Fails the course**
- Must take a **remedial exam**

The decision depends on:

- The student's **final grade**
- The **attendance percentage**
- Whether the student completed the **final project**

---

## Course Rules

### Grade Evaluation

| Grade | Status |
|------|------|
| 90 – 100 | Excellent |
| 70 – 89 | Pass |
| 50 – 69 | Remedial Exam |
| 0 – 49 | Fail |

---

## Attendance Requirement

To pass the course, the student must have **at least 75% attendance**.

If attendance is **below 75%**, the student **automatically fails**, regardless 
of grade.

---

## Final Project Rule

If the student:

- Has a grade between **70 and 89**
- But **did not submit the final project**

> Then the student must take a **remedial exam**.

---

## Validation Rules

Your program must validate:

- Grade must be between **0 and 100**
- Attendance must be between **0 and 100**
- Final project must be **yes** or **no**

If the data is invalid, display:

> Invalid input detected.

---

## Expected Output

Example:

Student grade: 82
Attendance: 90%
Final project submitted: yes

Result: PASS
Performance level: Good

Use **nested conditionals** to determine:

- Pass
- Fail
- Remedial exam

---

### JavaScript Implementation

Your program must:

- Request the inputs
- Validate the data
- Apply the logic using nested conditionals
- Display the result

---

## Hint

You may structure your algorithm like this:

```
IF attendance < 75
FAIL
ELSE
IF grade >= 90
EXCELLENT
ELSE IF grade >= 70
CHECK PROJECT
```

> Then apply another nested conditional for the project requirement.