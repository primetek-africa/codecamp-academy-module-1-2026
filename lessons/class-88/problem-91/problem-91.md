# Advanced OOP Code Challenge: Airline Flight Reservation System

## Problem Description

An international airline company is developing a **Flight Reservation System** 
to manage passengers, book flights, calculate ticket prices, assign seats, and 
track reservations.

As a software engineer, your task is to design a professional system using 
**Object-Oriented Programming (OOP)** principles in **JavaScript**, applying 
advanced concepts such as:

* Public methods
* Private methods
* Protected methods (convention)
* Static methods
* Encapsulation
* Inheritance
* Business rules
* Validation logic
* State management
* Arrays of objects

You must create a class architecture that simulates how a real airline 
reservation system works.

---

# System Requirements

## 1. Create a Parent Class: `Person`

The class should contain:

### Properties

* `fullName`
* `passportNumber`
* `nationality`

### Protected Method (Convention)

Create a protected method:

```javascript
_generateReservationCode()
```

Requirements:

Generate a reservation code in the format:

```text
FLY-48291
```

This method should only be used internally or by child classes.

---

## 2. Create a Child Class: `Passenger`

The class should inherit from `Person`.

### Additional Properties

* `ticketClass`

  * economy
  * business
  * firstClass

* `reservations` → empty array by default

---

## 3. Create Private Methods

### `#validateFlightData(flight)`

Requirements:

Return `true` only if:

* Destination exists.
* Origin exists.
* Base price is greater than 0.
* Available seats are greater than 0.

Otherwise return `false`.

---

### `#calculateTicketPrice(basePrice)`

Requirements:

Apply ticket multipliers:

| Ticket Class | Multiplier |
| ------------ | ---------- |
| economy      | x1         |
| business     | x1.8       |
| firstClass   | x2.5       |

Return final ticket price.

---

## 4. Create Public Methods

### `bookFlight(origin, destination, basePrice, availableSeats)`

Requirements:

### Step 1

Validate flight data using:

```javascript
#validateFlightData()
```

### Step 2

Verify seats are available.

### Step 3

Calculate final ticket price using:

```javascript
#calculateTicketPrice()
```

### Step 4

Generate reservation code using:

```javascript
_generateReservationCode()
```

### Step 5

Automatically assign a random seat.

Seat examples:

```text
14A
22F
5C
```

### Step 6

Create reservation object:

```javascript
{
    reservationCode,
    origin,
    destination,
    ticketClass,
    seatNumber,
    finalPrice,
    createdAt
}
```

### Step 7

Store reservation in:

```javascript
reservations
```

### Step 8

Return reservation summary.

---

### `cancelReservation(reservationCode)`

Requirements:

* Search reservation by code.
* Remove reservation.
* Return success message.
* If reservation does not exist, return error message.

---

### `showReservations()`

Return all reservations.

---

## 5. Create Static Methods

### `static calculateBaggageFee(weight)`

Requirements:

Business rules:

| Weight  | Fee  |
| ------- | ---- |
| 0–20kg  | $0   |
| 21–30kg | $50  |
| >30kg   | $100 |

Return baggage fee.

---

### `static convertHoursToMinutes(hours)`

Requirements:

Convert flight duration to minutes.

Example:

```javascript
Passenger.convertHoursToMinutes(3)
```

Output:

```text
180
```

---

## Expected Concepts to Apply

Students must correctly apply:

* Classes
* Constructors
* Inheritance (`extends`)
* Public methods
* Private methods (`#`)
* Protected methods (`_`)
* Static methods
* Validation logic
* Business logic
* Arrays of objects
* State management
* Object composition
* Random generation

---

# Reflection Questions

1. Why should `#validateFlightData()` be private?

2. Why is `_generateReservationCode()` protected instead of public?

3. Why is seat assignment generated automatically?

4. What OOP principle is demonstrated by hiding price calculations?

5. Why are static methods useful in airline systems?

6. How does state management appear in this exercise?

7. What business rules are implemented in this system?

8. How does this challenge resemble a real airline reservation platform?
