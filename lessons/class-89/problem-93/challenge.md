# Final OOP Code Challenge: Smart University Campus Management System

## Challenge Introduction

A modern university is developing a **Smart Campus Management System** to manage students, course enrollments, virtual classrooms, and academic activities.

As a software engineer, your mission is to design a professional software system using **Object-Oriented Programming (OOP)** in **JavaScript**.

This challenge is designed to evaluate all concepts studied in previous exercises.

Students must apply:

* Classes and objects
* Constructors
* Inheritance (`extends`)
* Public methods
* Private methods (`#`)
* Protected methods (`_`)
* Static methods
* Encapsulation
* Arrays of objects
* Validation logic
* Business rules
* State management
* Object composition
* Method responsibility

This challenge simulates a real-world university software system and requires students to think like software engineers.

---

# Problem Description

The university needs a system to manage students and course enrollments.

Each student can:

* Register in the university.
* Enroll in courses.
* Drop courses.
* View enrolled courses.
* Calculate tuition costs.

The system must also enforce academic business rules.

---

# System Requirements

## 1. Create a Parent Class: `Person`

The class must contain:

### Properties

* `fullName`
* `email`
* `identificationNumber`

### Protected Method (Convention)

Create a protected method:

```javascript
_generateStudentCode()
```

Requirements:

* Generate a random student code.
* Format:

```text
STD-5821
```

This method should only be used internally or by child classes.

---

## 2. Create a Child Class: `Student`

The class should inherit from `Person`.

### Additional Properties

* `studentCode`
* `career`
* `semester`
* `courses` → empty array by default
* `isRegistered` → false by default

---

## 3. Create Private Methods

### `#validateCourse(course)`

Requirements:

Return `true` only if:

* Course name exists.
* Credits are greater than 0.
* Teacher name exists.

Otherwise return `false`.

---

### `#calculateTuition()`

Requirements:

Each academic credit costs:

```text
$120
```

The method should:

* Calculate total credits.
* Multiply by the cost per credit.
* Return total tuition cost.

This method must only be used internally.

---

## 4. Create Public Methods

### `registerStudent()`

Requirements:

* Generate student code using:

```javascript
_generateStudentCode()
```

* Change:

```javascript
isRegistered = true
```

* Return success message.

---

### `enrollCourse(courseName, credits, teacher)`

Requirements:

### Step 1

Validate course using:

```javascript
#validateCourse()
```

### Step 2

Verify student is registered.

### Step 3

Create course object:

```javascript
{
    courseName,
    credits,
    teacher,
    enrolledAt
}
```

### Step 4

Store course in:

```javascript
courses
```

### Step 5

Return success message.

---

### `dropCourse(courseName)`

Requirements:

* Remove course by name.
* Return success message.
* If not found, return error message.

---

### `showCourses()`

Return all enrolled courses.

---

### `showStudentInformation()`

Return all student information inside an object.

---

### `showTuitionCost()`

Requirements:

Use:

```javascript
#calculateTuition()
```

Return tuition cost.

---

## 5. Create Static Methods

### `static convertCreditsToHours(credits)`

Requirements:

Business rule:

```text
1 credit = 48 academic hours
```

Example:

```javascript
Student.convertCreditsToHours(3)
```

Output:

```text
144
```

---

### `static calculateAverageGrade(grades)`

Requirements:

Receive an array of grades.

Example:

```javascript
[4.5, 3.8, 4.2]
```

Return the average.

---

# Expected Concepts to Apply

Students must correctly apply:

* Classes
* Constructors
* Inheritance
* Public methods
* Private methods (`#`)
* Protected methods (`_`)
* Static methods
* Arrays of objects
* Encapsulation
* Validation logic
* Business rules
* State management
* Object composition
* Loops or array methods (`reduce`, `findIndex`, etc.)

---

# Important Rules

1. Do NOT expose private logic outside the class.

2. Use encapsulation correctly.

3. Keep methods responsible for one task.

4. Use inheritance correctly.

5. Use at least one array method (`reduce`, `findIndex`, `filter`, etc.).

6. Follow clean code practices.

7. Test the system by creating at least **two student objects**.

---

# Hints

### Hint 1

You may use:

```javascript
Math.floor(Math.random() * 9000) + 1000
```

for random student codes.

### Hint 2

To calculate total credits:

```javascript
reduce()
```

may be helpful.

### Hint 3

To remove a course:

```javascript
findIndex()
```

can help identify the course position.

### Hint 4

Remember:

Private methods can only be accessed inside the class.

Example:

```javascript
this.#methodName()
```

---

## Deliverables

Students must submit:

1. UML class diagram.
2. JavaScript solution.
3. Test cases.
4. Console output examples.
5. Short explanation of where they applied:

* Public methods
* Private methods
* Protected methods
* Static methods
* Encapsulation
* Inheritance
