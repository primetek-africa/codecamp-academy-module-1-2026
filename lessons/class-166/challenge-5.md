# Code Challenge 5: Prime Delivery - Advanced MongoDB Queries
## PrimeTech.Africa - CodeCamp
## MongoDB_Course

---

# Project Scenario

In our previous activity, we created our collaborative MongoDB Atlas
environment and started building a real-world logistics database.

We are continuing the same project:

**Prime Delivery**

Prime Delivery is a logistics company that manages deliveries for
customers through an online platform.

The company needs MongoDB to store and analyze information about:

* Customers
* Drivers
* Vehicles
* Delivery orders
* Packages
* Locations
* Payments
* Delivery events

The database must allow the company to answer operational and business
questions about its deliveries.

For example:

* Which customers have placed orders?
* Which drivers are currently available?
* Which vehicles are being used?
* Which orders contain multiple packages?
* Which deliveries are delayed?
* Which payments have failed?
* Which delivery areas have the highest demand?
* Which drivers have completed the most deliveries?

Your task is to use MongoDB queries to answer these types of questions.

---

# Database

We will continue using:

```text
prime_delivery
```

The database will contain these collections:

```text
prime_delivery
|
├── customers
├── drivers
├── vehicles
├── orders
├── packages
├── locations
├── payments
└── delivery_events
```

The `customers` collection was created during the previous activity.

The remaining collections will be populated using the seed data below.

---

# Important

This is a shared MongoDB Atlas classroom project.

Do not execute destructive commands such as:

```javascript
db.dropDatabase()
```

or:

```javascript
db.collection.drop()
```

Do not delete or modify another student's data.

The objective of this activity is to practice **queries**, not to modify
the database.

---

# Part 1 - Database Setup

Select the database:

```javascript
use prime_delivery
```

Verify the available collections:

```javascript
show collections
```

After loading the seed data, you should have:

```text
customers
drivers
vehicles
orders
packages
locations
payments
delivery_events
```

---

# Part 2 - Seed Data

## 1. Customers

The `customers` collection was created during the previous activity.

If your classroom database already contains the customer from Code
Challenge 01, keep it.

For students who need the complete dataset, the following additional
customers can be inserted.

```javascript
db.customers.insertMany([
  {
    firstName: "Maria",
    lastName: "Johnson",
    email: "maria.johnson@example.com",
    phone: "+57 301 555 0102",
    active: true,
    createdAt: ISODate("2026-08-01T10:00:00Z")
  },
  {
    firstName: "James",
    lastName: "Wilson",
    email: "james.wilson@example.com",
    phone: "+57 302 555 0103",
    active: true,
    createdAt: ISODate("2026-08-03T14:30:00Z")
  },
  {
    firstName: "Sofia",
    lastName: "Martinez",
    email: "sofia.martinez@example.com",
    phone: "+57 303 555 0104",
    active: false,
    createdAt: ISODate("2026-08-05T09:15:00Z")
  },
  {
    firstName: "Daniel",
    lastName: "Brown",
    email: "daniel.brown@example.com",
    phone: "+57 304 555 0105",
    active: true,
    createdAt: ISODate("2026-08-08T16:45:00Z")
  },
  {
    firstName: "Laura",
    lastName: "Anderson",
    email: "laura.anderson@example.com",
    phone: "+57 305 555 0106",
    active: true,
    createdAt: ISODate("2026-08-10T11:20:00Z")
  },
  {
    firstName: "Robert",
    lastName: "Taylor",
    email: "robert.taylor@example.com",
    phone: "+57 306 555 0107",
    active: true,
    createdAt: ISODate("2026-08-12T13:10:00Z")
  },
  {
    firstName: "Emma",
    lastName: "Thomas",
    email: "emma.thomas@example.com",
    phone: "+57 307 555 0108",
    active: false,
    createdAt: ISODate("2026-08-15T08:40:00Z")
  }
])
```

---

# 2. Drivers

```javascript
db.drivers.insertMany([
  {
    firstName: "Michael",
    lastName: "Clark",
    phone: "+57 310 555 0201",
    licenseNumber: "DL-1001",
    status: "available",
    rating: 4.8,
    hireDate: ISODate("2024-02-15T00:00:00Z")
  },
  {
    firstName: "Sarah",
    lastName: "Lewis",
    phone: "+57 311 555 0202",
    licenseNumber: "DL-1002",
    status: "on_delivery",
    rating: 4.6,
    hireDate: ISODate("2023-07-20T00:00:00Z")
  },
  {
    firstName: "David",
    lastName: "Walker",
    phone: "+57 312 555 0203",
    licenseNumber: "DL-1003",
    status: "available",
    rating: 4.9,
    hireDate: ISODate("2022-11-10T00:00:00Z")
  },
  {
    firstName: "Jennifer",
    lastName: "Hall",
    phone: "+57 313 555 0204",
    licenseNumber: "DL-1004",
    status: "off_duty",
    rating: 4.5,
    hireDate: ISODate("2025-01-12T00:00:00Z")
  },
  {
    firstName: "Christopher",
    lastName: "Allen",
    phone: "+57 314 555 0205",
    licenseNumber: "DL-1005",
    status: "on_delivery",
    rating: 4.7,
    hireDate: ISODate("2024-09-01T00:00:00Z")
  },
  {
    firstName: "Jessica",
    lastName: "Young",
    phone: "+57 315 555 0206",
    licenseNumber: "DL-1006",
    status: "available",
    rating: 4.3,
    hireDate: ISODate("2025-04-18T00:00:00Z")
  }
])
```

---

# 3. Vehicles

```javascript
db.vehicles.insertMany([
  {
    plateNumber: "PRM001",
    type: "van",
    brand: "Ford",
    model: "Transit",
    year: 2024,
    capacityKg: 1200,
    status: "active",
    driverId: "DL-1001"
  },
  {
    plateNumber: "PRM002",
    type: "motorcycle",
    brand: "Honda",
    model: "CB300",
    year: 2023,
    capacityKg: 80,
    status: "active",
    driverId: "DL-1002"
  },
  {
    plateNumber: "PRM003",
    type: "van",
    brand: "Mercedes",
    model: "Sprinter",
    year: 2025,
    capacityKg: 1500,
    status: "active",
    driverId: "DL-1003"
  },
  {
    plateNumber: "PRM004",
    type: "truck",
    brand: "Isuzu",
    model: "N-Series",
    year: 2022,
    capacityKg: 3500,
    status: "maintenance",
    driverId: "DL-1004"
  },
  {
    plateNumber: "PRM005",
    type: "motorcycle",
    brand: "Yamaha",
    model: "MT-03",
    year: 2024,
    capacityKg: 90,
    status: "active",
    driverId: "DL-1005"
  },
  {
    plateNumber: "PRM006",
    type: "van",
    brand: "Renault",
    model: "Master",
    year: 2023,
    capacityKg: 1300,
    status: "active",
    driverId: "DL-1006"
  }
])
```

---

# 4. Locations

```javascript
db.locations.insertMany([
  {
    name: "Central Warehouse",
    type: "warehouse",
    city: "Cali",
    country: "Colombia",
    address: "100 Industrial Avenue",
    postalCode: "760001",
    coordinates: {
      latitude: 3.4516,
      longitude: -76.5320
    }
  },
  {
    name: "North Hub",
    type: "warehouse",
    city: "Palmira",
    country: "Colombia",
    address: "25 North Road",
    postalCode: "763531",
    coordinates: {
      latitude: 3.5394,
      longitude: -76.3036
    }
  },
  {
    name: "Customer Address 01",
    type: "delivery",
    city: "Cali",
    country: "Colombia",
    address: "45 Main Street",
    postalCode: "760002",
    coordinates: {
      latitude: 3.4372,
      longitude: -76.5225
    }
  },
  {
    name: "Customer Address 02",
    type: "delivery",
    city: "Cali",
    country: "Colombia",
    address: "78 Green Avenue",
    postalCode: "760003",
    coordinates: {
      latitude: 3.4219,
      longitude: -76.5200
    }
  },
  {
    name: "Customer Address 03",
    type: "delivery",
    city: "Palmira",
    country: "Colombia",
    address: "12 Central Road",
    postalCode: "763532",
    coordinates: {
      latitude: 3.5390,
      longitude: -76.2970
    }
  },
  {
    name: "Customer Address 04",
    type: "delivery",
    city: "Jamundi",
    country: "Colombia",
    address: "90 River Street",
    postalCode: "764001",
    coordinates: {
      latitude: 3.2607,
      longitude: -76.5370
    }
  }
])
```

---

# 5. Orders

Orders reference customers, drivers, and locations.

```javascript
db.orders.insertMany([
  {
    orderNumber: "ORD-1001",
    customerEmail: "carlos.mendoza@example.com",
    driverLicense: "DL-1001",
    origin: "Central Warehouse",
    destination: "Customer Address 01",
    status: "delivered",
    priority: "standard",
    totalAmount: 45.50,
    createdAt: ISODate("2026-08-20T09:00:00Z"),
    estimatedDelivery: ISODate("2026-08-20T16:00:00Z")
  },
  {
    orderNumber: "ORD-1002",
    customerEmail: "maria.johnson@example.com",
    driverLicense: "DL-1002",
    origin: "Central Warehouse",
    destination: "Customer Address 02",
    status: "in_transit",
    priority: "express",
    totalAmount: 85.00,
    createdAt: ISODate("2026-08-21T10:30:00Z"),
    estimatedDelivery: ISODate("2026-08-21T15:00:00Z")
  },
  {
    orderNumber: "ORD-1003",
    customerEmail: "james.wilson@example.com",
    driverLicense: "DL-1003",
    origin: "North Hub",
    destination: "Customer Address 03",
    status: "delivered",
    priority: "standard",
    totalAmount: 62.75,
    createdAt: ISODate("2026-08-21T08:15:00Z"),
    estimatedDelivery: ISODate("2026-08-21T17:00:00Z")
  },
  {
    orderNumber: "ORD-1004",
    customerEmail: "sofia.martinez@example.com",
    driverLicense: "DL-1005",
    origin: "Central Warehouse",
    destination: "Customer Address 04",
    status: "cancelled",
    priority: "standard",
    totalAmount: 38.00,
    createdAt: ISODate("2026-08-22T11:00:00Z"),
    estimatedDelivery: ISODate("2026-08-22T18:00:00Z")
  },
  {
    orderNumber: "ORD-1005",
    customerEmail: "daniel.brown@example.com",
    driverLicense: "DL-1006",
    origin: "North Hub",
    destination: "Customer Address 01",
    status: "pending",
    priority: "express",
    totalAmount: 110.25,
    createdAt: ISODate("2026-08-23T07:45:00Z"),
    estimatedDelivery: ISODate("2026-08-23T14:00:00Z")
  },
  {
    orderNumber: "ORD-1006",
    customerEmail: "laura.anderson@example.com",
    driverLicense: "DL-1001",
    origin: "Central Warehouse",
    destination: "Customer Address 02",
    status: "delivered",
    priority: "express",
    totalAmount: 125.00,
    createdAt: ISODate("2026-08-23T09:20:00Z"),
    estimatedDelivery: ISODate("2026-08-23T13:00:00Z")
  },
  {
    orderNumber: "ORD-1007",
    customerEmail: "robert.taylor@example.com",
    driverLicense: "DL-1005",
    origin: "Central Warehouse",
    destination: "Customer Address 03",
    status: "delayed",
    priority: "express",
    totalAmount: 95.75,
    createdAt: ISODate("2026-08-24T12:00:00Z"),
    estimatedDelivery: ISODate("2026-08-24T16:00:00Z")
  },
  {
    orderNumber: "ORD-1008",
    customerEmail: "emma.thomas@example.com",
    driverLicense: "DL-1003",
    origin: "North Hub",
    destination: "Customer Address 04",
    status: "delivered",
    priority: "standard",
    totalAmount: 55.50,
    createdAt: ISODate("2026-08-25T08:30:00Z"),
    estimatedDelivery: ISODate("2026-08-25T18:00:00Z")
  }
])
```

---

# 6. Packages

Each order can contain one or more packages.

```javascript
db.packages.insertMany([
  {
    trackingNumber: "PKG-1001",
    orderNumber: "ORD-1001",
    description: "Laptop accessories",
    weightKg: 4.5,
    category: "electronics",
    fragile: true,
    dimensions: {
      lengthCm: 40,
      widthCm: 30,
      heightCm: 15
    }
  },
  {
    trackingNumber: "PKG-1002",
    orderNumber: "ORD-1001",
    description: "Office supplies",
    weightKg: 2.0,
    category: "office",
    fragile: false,
    dimensions: {
      lengthCm: 35,
      widthCm: 25,
      heightCm: 20
    }
  },
  {
    trackingNumber: "PKG-1003",
    orderNumber: "ORD-1002",
    description: "Smartphone",
    weightKg: 0.8,
    category: "electronics",
    fragile: true,
    dimensions: {
      lengthCm: 20,
      widthCm: 12,
      heightCm: 8
    }
  },
  {
    trackingNumber: "PKG-1004",
    orderNumber: "ORD-1003",
    description: "Clothing",
    weightKg: 3.2,
    category: "fashion",
    fragile: false,
    dimensions: {
      lengthCm: 45,
      widthCm: 35,
      heightCm: 15
    }
  },
  {
    trackingNumber: "PKG-1005",
    orderNumber: "ORD-1004",
    description: "Kitchen equipment",
    weightKg: 7.5,
    category: "home",
    fragile: true,
    dimensions: {
      lengthCm: 50,
      widthCm: 40,
      heightCm: 30
    }
  },
  {
    trackingNumber: "PKG-1006",
    orderNumber: "ORD-1005",
    description: "Computer monitor",
    weightKg: 6.8,
    category: "electronics",
    fragile: true,
    dimensions: {
      lengthCm: 60,
      widthCm: 45,
      heightCm: 20
    }
  },
  {
    trackingNumber: "PKG-1007",
    orderNumber: "ORD-1006",
    description: "Books",
    weightKg: 8.5,
    category: "books",
    fragile: false,
    dimensions: {
      lengthCm: 45,
      widthCm: 35,
      heightCm: 25
    }
  },
  {
    trackingNumber: "PKG-1008",
    orderNumber: "ORD-1007",
    description: "Camera equipment",
    weightKg: 5.2,
    category: "electronics",
    fragile: true,
    dimensions: {
      lengthCm: 40,
      widthCm: 35,
      heightCm: 25
    }
  },
  {
    trackingNumber: "PKG-1009",
    orderNumber: "ORD-1008",
    description: "Sports equipment",
    weightKg: 9.5,
    category: "sports",
    fragile: false,
    dimensions: {
      lengthCm: 70,
      widthCm: 30,
      heightCm: 25
    }
  }
])
```

---

# 7. Payments

```javascript
db.payments.insertMany([
  {
    paymentId: "PAY-1001",
    orderNumber: "ORD-1001",
    method: "credit_card",
    amount: 45.50,
    status: "paid",
    paidAt: ISODate("2026-08-20T09:10:00Z")
  },
  {
    paymentId: "PAY-1002",
    orderNumber: "ORD-1002",
    method: "debit_card",
    amount: 85.00,
    status: "paid",
    paidAt: ISODate("2026-08-21T10:35:00Z")
  },
  {
    paymentId: "PAY-1003",
    orderNumber: "ORD-1003",
    method: "cash",
    amount: 62.75,
    status: "paid",
    paidAt: ISODate("2026-08-21T08:20:00Z")
  },
  {
    paymentId: "PAY-1004",
    orderNumber: "ORD-1004",
    method: "credit_card",
    amount: 38.00,
    status: "refunded",
    paidAt: ISODate("2026-08-22T11:05:00Z")
  },
  {
    paymentId: "PAY-1005",
    orderNumber: "ORD-1005",
    method: "digital_wallet",
    amount: 110.25,
    status: "pending",
    paidAt: null
  },
  {
    paymentId: "PAY-1006",
    orderNumber: "ORD-1006",
    method: "credit_card",
    amount: 125.00,
    status: "paid",
    paidAt: ISODate("2026-08-23T09:25:00Z")
  },
  {
    paymentId: "PAY-1007",
    orderNumber: "ORD-1007",
    method: "debit_card",
    amount: 95.75,
    status: "failed",
    paidAt: null
  },
  {
    paymentId: "PAY-1008",
    orderNumber: "ORD-1008",
    method: "digital_wallet",
    amount: 55.50,
    status: "paid",
    paidAt: ISODate("2026-08-25T08:35:00Z")
  }
])
```

---

# 8. Delivery Events

Delivery events represent the history of an order.

```javascript
db.delivery_events.insertMany([
  {
    orderNumber: "ORD-1001",
    status: "picked_up",
    location: "Central Warehouse",
    timestamp: ISODate("2026-08-20T10:00:00Z")
  },
  {
    orderNumber: "ORD-1001",
    status: "delivered",
    location: "Customer Address 01",
    timestamp: ISODate("2026-08-20T15:30:00Z")
  },
  {
    orderNumber: "ORD-1002",
    status: "picked_up",
    location: "Central Warehouse",
    timestamp: ISODate("2026-08-21T11:00:00Z")
  },
  {
    orderNumber: "ORD-1002",
    status: "in_transit",
    location: "Cali",
    timestamp: ISODate("2026-08-21T13:00:00Z")
  },
  {
    orderNumber: "ORD-1003",
    status: "picked_up",
    location: "North Hub",
    timestamp: ISODate("2026-08-21T09:00:00Z")
  },
  {
    orderNumber: "ORD-1003",
    status: "delivered",
    location: "Customer Address 03",
    timestamp: ISODate("2026-08-21T16:40:00Z")
  },
  {
    orderNumber: "ORD-1006",
    status: "picked_up",
    location: "Central Warehouse",
    timestamp: ISODate("2026-08-23T10:00:00Z")
  },
  {
    orderNumber: "ORD-1006",
    status: "delivered",
    location: "Customer Address 02",
    timestamp: ISODate("2026-08-23T12:30:00Z")
  },
  {
    orderNumber: "ORD-1007",
    status: "picked_up",
    location: "Central Warehouse",
    timestamp: ISODate("2026-08-24T13:00:00Z")
  },
  {
    orderNumber: "ORD-1007",
    status: "delayed",
    location: "Cali",
    timestamp: ISODate("2026-08-24T17:30:00Z")
  },
  {
    orderNumber: "ORD-1008",
    status: "picked_up",
    location: "North Hub",
    timestamp: ISODate("2026-08-25T09:00:00Z")
  },
  {
    orderNumber: "ORD-1008",
    status: "delivered",
    location: "Customer Address 04",
    timestamp: ISODate("2026-08-25T17:15:00Z")
  }
])
```

---

# Part 3 - Code Challenge

## Instructions

Write a MongoDB query to solve each problem.

Do not modify the documents unless explicitly requested.

For every challenge:

1. Identify the collection.
2. Identify the required fields.
3. Determine which operators are necessary.
4. Write the query.
5. Execute the query.
6. Verify that the result makes sense.

Try to solve the challenges independently before discussing solutions
with your classmates.

---

# Challenge 01 - Active Customers

Find all customers who are currently active.

Your query must use the `active` field.

---

# Challenge 02 - High-Value Orders

Find all orders where the total amount is greater than `80`.

Use an appropriate comparison operator.

---

# Challenge 03 - Express Orders

Find all orders where:

* The priority is `express`.
* The total amount is greater than `80`.

You must combine multiple conditions.

---

# Challenge 04 - Orders With Multiple Statuses

Find all orders whose status is either:

```text
delivered
delayed
```

Use a logical or array-based operator.

---

# Challenge 05 - Orders Outside a Price Range

Find orders whose total amount is:

* Greater than or equal to `50`.
* Less than or equal to `100`.

Return only:

```text
orderNumber
status
totalAmount
```

---

# Challenge 06 - Available Drivers

Find drivers whose status is either:

```text
available
```

or:

```text
on_delivery
```

Return:

```text
firstName
lastName
status
rating
```

---

# Challenge 07 - Highly Rated Drivers

Find drivers whose rating is greater than or equal to `4.7`.

Sort the results from the highest rating to the lowest rating.

---

# Challenge 08 - Active Vehicles

Find all vehicles that:

* Are currently active.
* Have a capacity greater than `1000 kg`.

Return the vehicle's:

```text
plateNumber
brand
model
capacityKg
```

---

# Challenge 09 - Fragile Packages

Find all packages that are:

* Fragile.
* Heavier than `5 kg`.

Return:

```text
trackingNumber
description
weightKg
category
```

---

# Challenge 10 - Electronics Packages

Find packages where the category is `electronics`.

Return only:

```text
trackingNumber
description
weightKg
fragile
```

Sort the results by `weightKg` from highest to lowest.

---

# Challenge 11 - Expensive Payments

Find payments where the amount is greater than `90`.

Exclude the following fields from the result:

```text
_id
```

---

# Challenge 12 - Unsuccessful Payments

Find payments whose status is either:

```text
pending
```

or:

```text
failed
```

Return:

```text
paymentId
orderNumber
amount
status
method
```

---

# Challenge 13 - Orders Created During a Date Range

Find all orders created between:

```text
2026-08-21
```

and:

```text
2026-08-24
```

Use MongoDB date comparison operators.

Return:

```text
orderNumber
customerEmail
createdAt
status
```

---

# Challenge 14 - Customers With Specific Names

Find customers whose first name is either:

```text
Maria
```

or:

```text
Laura
```

Use an appropriate MongoDB operator instead of writing two separate
queries.

---

# Challenge 15 - Packages Outside the Standard Weight

Find packages whose weight is:

* Less than `2 kg`.
* Or greater than `8 kg`.

Return:

```text
trackingNumber
description
weightKg
```

---

# Challenge 16 - Orders That Are Not Cancelled

Find all orders whose status is not:

```text
cancelled
```

Return:

```text
orderNumber
status
totalAmount
```

Sort the results by `totalAmount` from highest to lowest.

---

# Challenge 17 - Delivery Events After a Specific Time

Find delivery events that occurred after:

```text
2026-08-24T12:00:00Z
```

Return:

```text
orderNumber
status
location
timestamp
```

Sort them chronologically.

---

# Challenge 18 - Complex Order Filter

Find orders that satisfy **all** of the following conditions:

* Priority is `express`.
* Total amount is greater than `80`.
* Status is not `cancelled`.

Return:

```text
orderNumber
customerEmail
status
priority
totalAmount
```

Sort by `totalAmount` from highest to lowest.

---

# Challenge 19 - Complex Package Filter

Find packages that satisfy either of these conditions:

### Condition A

The package is fragile and weighs more than `5 kg`.

### Condition B

The package belongs to the `electronics` category and weighs less than
`2 kg`.

Return:

```text
trackingNumber
description
category
weightKg
fragile
```

This challenge requires combining logical and comparison operators.

---

# Challenge 20 - Prime Delivery Operations Report

Create a query that finds orders satisfying all of the following:

* The total amount is greater than `60`.
* The priority is either `standard` or `express`.
* The status is not `cancelled`.
* The order was created after August 20, 2026.

Return only:

```text
orderNumber
customerEmail
status
priority
totalAmount
createdAt
```

Sort the results by:

```text
totalAmount
```

from highest to lowest.

---

# Operators You May Need

The following operators may be useful during this activity:

## Comparison Operators

```text
$eq
$ne
$gt
$gte
$lt
$lte
$in
$nin
```

## Logical Operators

```text
$and
$or
$not
$nor
```

## Element Operators

```text
$exists
$type
```

## Array Operators

```text
$in
$nin
$all
$elemMatch
```

## Projection

You should also practice selecting which fields appear in the result.

For example:

```javascript
db.customers.find(
  { active: true },
  { _id: 0, firstName: 1, lastName: 1 }
)
```

## Sorting

You can sort results using:

```javascript
.sort({ totalAmount: -1 })
```

or:

```javascript
.sort({ totalAmount: 1 })
```

---

# Restrictions

For this Code Challenge:

* Do not use aggregation pipelines.
* Do not use `$lookup`.
* Do not update documents.
* Do not delete documents.
* Do not create additional collections.
* Do not drop the database.
* Do not copy another student's queries.

The objective is to demonstrate your understanding of MongoDB query
operators and document filtering.

---

# Expected Learning Outcomes

After completing this Code Challenge, you should be able to:

* Work with a multi-collection MongoDB database.
* Identify the appropriate collection for a query.
* Filter documents using comparison operators.
* Combine conditions with logical operators.
* Filter using `$in` and `$nin`.
* Exclude unwanted results with `$ne`.
* Work with MongoDB `Date` values.
* Query Boolean fields.
* Work with numerical ranges.
* Project specific fields.
* Sort query results.
* Combine multiple MongoDB operators in a single query.
* Interpret data from a realistic business scenario.

---

# Final Question

After completing the 20 challenges, answer the following question:

> Why might MongoDB be a good choice for a logistics platform such as
> Prime Delivery?

Your answer should consider:

* Flexible document structures.
* BSON data types.
* Relationships between data.
* Query capabilities.
* Scalability.
* The nature of logistics data.

Be prepared to explain your answer during the class discussion.
