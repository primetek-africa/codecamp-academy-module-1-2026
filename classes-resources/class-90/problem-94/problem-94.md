# Advanced OOP Code Challenge: Vehicle Rental Cost Management System

## Problem Introduction

A transportation company is developing a **Vehicle Rental Cost Management System** 
to manage customer rentals, calculate rental prices, fuel costs, discounts, 
penalties, and estimated trip expenses.

As a software engineer, your task is to design a software system using 
**Object-Oriented Programming (OOP)** principles in **JavaScript**.

This exercise is intended to reinforce **all fundamental OOP concepts** 
while introducing **mathematical operations and business calculations** to 
slightly increase the difficulty.

Students must apply:

* Classes and objects
* Constructors
* Inheritance (`extends`)
* Encapsulation
* Public methods
* Private methods (`#`)
* Protected methods (`_`)
* Static methods
* Arrays of objects
* Validation logic
* Business rules
* State management
* Mathematical operations

---

# Problem Description

A vehicle rental company rents cars to customers.

The system must:

* Register customers.
* Rent vehicles.
* Calculate trip fuel costs.
* Calculate rental cost.
* Apply membership discounts.
* Calculate late return penalties.
* Display rental history.

The company uses different pricing rules depending on rental conditions.

---

# System Requirements

## 1. Create a Parent Class: `Person`

The class must contain:

### Properties

* `fullName`
* `driverLicense`
* `phoneNumber`

### Protected Method (Convention)

Create:

```javascript
_generateRentalCode()
```

Requirements:

Generate a random rental code.

Example:

```text
RNT-5832
```

This method should only be used internally or by child classes.

---

## 2. Create a Child Class: `Customer`

The class must inherit from `Person`.

### Additional Properties

* `membershipLevel`

  * basic
  * premium
  * vip

* `rentals` → empty array by default

---

## 3. Create Private Methods

### `#validateRental(vehicle)`

Return `true` only if:

* Vehicle name exists.
* Daily rental price is greater than 0.
* Rental days are greater than 0.
* Fuel efficiency is greater than 0.

Otherwise return `false`.

---

### `#calculateDiscount(total)`

Apply discounts:

| Membership | Discount |
| ---------- | -------- |
| basic      | 0%       |
| premium    | 10%      |
| vip        | 20%      |

Return final discounted amount.

---

## 4. Create Public Methods

### `rentVehicle(vehicleName, dailyPrice, rentalDays, kilometers, fuelEfficiency, fuelPrice)`

Requirements:

### Step 1

Validate rental using:

```javascript
#validateRental()
```

### Step 2

Calculate:

## Rental Cost

Formula:

```text
rentalCost = dailyPrice × rentalDays
```

## Fuel Consumption

Formula:

```text
fuelUsed = kilometers ÷ fuelEfficiency
```

## Fuel Cost

Formula:

```text
fuelCost = fuelUsed × fuelPrice
```

## Subtotal

Formula:

```text
subtotal = rentalCost + fuelCost
```

### Step 3

Apply membership discount using:

```javascript
#calculateDiscount()
```

### Step 4

Generate rental code using:

```javascript
_generateRentalCode()
```

### Step 5

Create rental object:

```javascript
{
    rentalCode,
    vehicleName,
    rentalDays,
    kilometers,
    rentalCost,
    fuelCost,
    totalCost,
    createdAt
}
```

### Step 6

Store rental in:

```javascript
rentals
```

### Step 7

Return rental summary.

---

### `returnVehicle(rentalCode, daysLate)`

Requirements:

Calculate penalty:

```text
$50 for every late day
```

Return total penalty.

If rental code does not exist, return an error message.

---

### `showRentalHistory()`

Return all rentals.

---

## 5. Create Static Methods

### `static convertKilometersToMiles(km)`

Formula:

```text
miles = km × 0.621371
```

---

### `static calculateAverageFuelConsumption(consumptions)`

Requirements:

Receive an array of numbers.

Example:

```javascript
[12, 14, 10, 16]
```

Return average fuel efficiency.

---

# Concepts Reinforced

This exercise reinforces:

* Abstraction
* Encapsulation
* Inheritance
* Polymorphism readiness
* Public methods
* Private methods
* Protected methods
* Static methods
* Constructors
* Arrays of objects
* Business rules
* Mathematical formulas
* Real-world calculations
* State management
* Validation logic
