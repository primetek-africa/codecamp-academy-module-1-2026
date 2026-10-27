# Advanced OOP Code Challenge: Freight & Logistics Shipping Cost Management System

## Problem Introduction

An international logistics company is developing a 
**Freight & Logistics Shipping Cost Management System** to manage customer 
shipments, calculate transportation costs, estimate delivery expenses, apply 
discounts, and manage shipment history.

As a software engineer, your task is to design a software system using 
**Object-Oriented Programming (OOP)** principles in **JavaScript**.

This exercise reinforces **all fundamental OOP concepts** while increasing 
difficulty through 
**mathematical calculations, business rules, and shipment management logic**.

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

A logistics company transports packages between cities and countries.

The system must:

* Register shipping customers.
* Create shipments.
* Calculate shipping costs.
* Calculate insurance costs.
* Apply membership discounts.
* Calculate late delivery penalties.
* Display shipment history.

The company uses different pricing rules depending on:

* Package weight
* Distance
* Shipping priority
* Insurance
* Membership level

---

# System Requirements

## 1. Create a Parent Class: `Person`

The class must contain:

### Properties

* `fullName`
* `customerId`
* `country`

### Protected Method (Convention)

Create:

```javascript
_generateShipmentCode()
```

Requirements:

Generate a random shipment code.

Example:

```text
SHP-5821
```

This method should only be used internally or by child classes.

---

## 2. Create a Child Class: `Customer`

The class must inherit from `Person`.

### Additional Properties

* `membershipLevel`

  * standard
  * premium
  * vip

* `shipments` → empty array by default

---

## 3. Create Private Methods

### `#validateShipment(shipment)`

Return `true` only if:

* Package name exists.
* Weight is greater than 0.
* Distance is greater than 0.
* Base shipping price is greater than 0.

Otherwise return `false`.

---

### `#calculateDiscount(total)`

Apply discounts:

| Membership | Discount |
| ---------- | -------- |
| standard   | 0%       |
| premium    | 10%      |
| vip        | 20%      |

Return final discounted amount.

---

## 4. Create Public Methods

### `createShipment(packageName, weight, distance, basePricePerKm, shippingPriority, insured)`

Requirements:

### Step 1

Validate shipment using:

```javascript
#validateShipment()
```

### Step 2

Calculate:

## Distance Cost

Formula:

```text
distanceCost = distance × basePricePerKm
```

## Weight Cost

Formula:

```text
weightCost = weight × 2
```

($2 per kilogram)

## Priority Cost

Business rule:

| Priority | Extra Charge |
| -------- | ------------ |
| standard | $0           |
| express  | $50          |
| urgent   | $100         |

## Insurance Cost

If insured:

```text
10% of subtotal
```

Otherwise:

```text
$0
```

## Subtotal

Formula:

```text
subtotal = distanceCost + weightCost + priorityCost + insuranceCost
```

### Step 3

Apply membership discount using:

```javascript
#calculateDiscount()
```

### Step 4

Generate shipment code using:

```javascript
_generateShipmentCode()
```

### Step 5

Create shipment object:

```javascript
{
    shipmentCode,
    packageName,
    weight,
    distance,
    shippingPriority,
    insured,
    totalCost,
    createdAt
}
```

### Step 6

Store shipment in:

```javascript
shipments
```

### Step 7

Return shipment summary.

---

### `reportLateDelivery(shipmentCode, daysLate)`

Requirements:

Penalty rule:

```text
$25 per late day
```

Return:

```javascript
{
    shipmentCode,
    daysLate,
    penalty
}
```

If shipment does not exist, return an error message.

---

### `showShipmentHistory()`

Return all shipments.

---

## 5. Create Static Methods

### `static convertKilogramsToPounds(kg)`

Formula:

```text
pounds = kg × 2.20462
```

---

### `static calculateAverageShippingCost(costs)`

Requirements:

Receive an array of shipping costs.

Example:

```javascript
[100, 250, 180, 300]
```

Return average cost.

---

# Concepts Reinforced

This exercise reinforces:

* Abstraction
* Encapsulation
* Inheritance
* Public methods
* Private methods
* Protected methods
* Static methods
* Constructors
* Arrays of objects
* Business rules
* Mathematical operations
* Real-world logistics calculations
* State management
* Validation logic
