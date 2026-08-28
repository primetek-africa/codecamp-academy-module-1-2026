# JavaScript Inheritance Challenge

## Problem: Vehicle Management System

A transportation company needs a system to represent different types of vehicles.

You have been hired as a software developer to model the system using 
**Object-Oriented Programming (OOP)** and **inheritance in JavaScript**.

### Requirements

1. Create a parent class called `Vehicle`.

2. The `Vehicle` class must have the following properties:

* `brand`
* `model`
* `year`

3. The `Vehicle` class must include the following method:

```js
showInformation()
```

This method must display all vehicle information in the console.

Example output:

```text
Brand: Honda
Model: Civic
Year: 2022
```

---

4. Create a child class called `Car` that inherits from `Vehicle`.

5. The `Car` class must add a new property:

* `numberOfDoors`

6. The `Car` class must include a method:

```js
startEngine()
```

Output example:

```text
The car engine has started.
```

---

7. Create another child class called `Motorcycle` that inherits from `Vehicle`.

8. The `Motorcycle` class must add a new property:

* `engineCapacity`

9. The `Motorcycle` class must include a method:

```js
doWheelie()
```

Output example:

```text
The motorcycle is doing a wheelie!
```

---

10. Create at least:

* One `Car` object
* One `Motorcycle` object

11. Test all inherited and custom methods.

---

## Expected Concepts to Practice

Students should practice:

* Classes
* Constructors
* Objects
* Inheritance with `extends`
* `super()` keyword
* Methods
* Method reuse
* Properties inheritance

---

## Expected Output

```text
CAR INFORMATION
Brand: Honda
Model: Civic
Year: 2022
The car engine has started.

MOTORCYCLE INFORMATION
Brand: Honda
Model: CBR600R
Year: 2024
The motorcycle is doing a wheelie!
```