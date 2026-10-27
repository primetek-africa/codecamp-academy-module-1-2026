# Code Challenge 05 - Solution

# PrimeTech.Africa - CodeCamp
## MongoDB_Course
## Prime Delivery

### MongoDB Playground - Visual Studio Code

---

# Instructions

This file contains the solutions for the 20 MongoDB query challenges.

The queries are designed to be executed inside a MongoDB Playground in
Visual Studio Code.

Before running the queries, make sure that the MongoDB extension is
installed and that you are connected to the classroom MongoDB Atlas
deployment.

---

# Database

We will use:

```javascript
use("prime_delivery");
```

---

# Challenge 01

## Active Customers

Find all customers who are currently active.

### Solution

```javascript
use("prime_delivery");

db.customers.find({
  active: true
});
```

### Concepts

* Boolean values
* Equality filtering
* `find()`

---

# Challenge 02

## High-Value Orders

Find all orders where the total amount is greater than `80`.

### Solution

```javascript
use("prime_delivery");

db.orders.find({
  totalAmount: {
    $gt: 80
  }
});
```

### Concepts

* Comparison operators
* `$gt`
* Numeric filtering

---

# Challenge 03

## Express Orders

Find orders where:

* Priority is `express`.
* Total amount is greater than `80`.

### Solution

```javascript
use("prime_delivery");

db.orders.find({
  priority: "express",
  totalAmount: {
    $gt: 80
  }
});
```

### Concepts

* Multiple query conditions
* Implicit `$and`
* `$gt`

MongoDB automatically treats multiple fields in the same query document
as an AND condition.

---

# Challenge 04

## Orders With Multiple Statuses

Find orders whose status is either `delivered` or `delayed`.

### Solution

```javascript
use("prime_delivery");

db.orders.find({
  status: {
    $in: ["delivered", "delayed"]
  }
});
```

### Concepts

* `$in`
* Multiple possible values
* Equality filtering

---

# Challenge 05

## Orders Outside a Price Range

Find orders whose total amount is between `50` and `100`, inclusive.

Return only:

* `orderNumber`
* `status`
* `totalAmount`

### Solution

```javascript
use("prime_delivery");

db.orders.find(
  {
    totalAmount: {
      $gte: 50,
      $lte: 100
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    status: 1,
    totalAmount: 1
  }
);
```

### Concepts

* `$gte`
* `$lte`
* Range queries
* Projection

---

# Challenge 06

## Available or Active Drivers

Find drivers whose status is either `available` or `on_delivery`.

Return:

* `firstName`
* `lastName`
* `status`
* `rating`

### Solution

```javascript
use("prime_delivery");

db.drivers.find(
  {
    status: {
      $in: ["available", "on_delivery"]
    }
  },
  {
    _id: 0,
    firstName: 1,
    lastName: 1,
    status: 1,
    rating: 1
  }
);
```

### Concepts

* `$in`
* Projection
* Multiple values

---

# Challenge 07

## Highly Rated Drivers

Find drivers whose rating is greater than or equal to `4.7`.

Sort from highest rating to lowest.

### Solution

```javascript
use("prime_delivery");

db.drivers.find({
  rating: {
    $gte: 4.7
  }
}).sort({
  rating: -1
});
```

### Concepts

* `$gte`
* Sorting
* Descending order

---

# Challenge 08

## Active Vehicles

Find vehicles that:

* Are active.
* Have a capacity greater than `1000 kg`.

Return:

* `plateNumber`
* `brand`
* `model`
* `capacityKg`

### Solution

```javascript
use("prime_delivery");

db.vehicles.find(
  {
    status: "active",
    capacityKg: {
      $gt: 1000
    }
  },
  {
    _id: 0,
    plateNumber: 1,
    brand: 1,
    model: 1,
    capacityKg: 1
  }
);
```

### Concepts

* Multiple conditions
* `$gt`
* Projection

---

# Challenge 09

## Fragile Packages

Find packages that are:

* Fragile.
* Heavier than `5 kg`.

Return:

* `trackingNumber`
* `description`
* `weightKg`
* `category`

### Solution

```javascript
use("prime_delivery");

db.packages.find(
  {
    fragile: true,
    weightKg: {
      $gt: 5
    }
  },
  {
    _id: 0,
    trackingNumber: 1,
    description: 1,
    weightKg: 1,
    category: 1
  }
);
```

### Concepts

* Boolean filtering
* `$gt`
* Projection

---

# Challenge 10

## Electronics Packages

Find all packages in the `electronics` category.

Sort them from heaviest to lightest.

### Solution

```javascript
use("prime_delivery");

db.packages.find(
  {
    category: "electronics"
  },
  {
    _id: 0,
    trackingNumber: 1,
    description: 1,
    weightKg: 1,
    fragile: 1
  }
).sort({
  weightKg: -1
});
```

### Concepts

* Equality filtering
* Projection
* Sorting
* Descending order

---

# Challenge 11

## Expensive Payments

Find payments where the amount is greater than `90`.

Exclude `_id`.

### Solution

```javascript
use("prime_delivery");

db.payments.find(
  {
    amount: {
      $gt: 90
    }
  },
  {
    _id: 0
  }
);
```

### Concepts

* `$gt`
* Projection
* Excluding fields

---

# Challenge 12

## Unsuccessful Payments

Find payments whose status is either:

* `pending`
* `failed`

Return:

* `paymentId`
* `orderNumber`
* `amount`
* `status`
* `method`

### Solution

```javascript
use("prime_delivery");

db.payments.find(
  {
    status: {
      $in: ["pending", "failed"]
    }
  },
  {
    _id: 0,
    paymentId: 1,
    orderNumber: 1,
    amount: 1,
    status: 1,
    method: 1
  }
);
```

### Concepts

* `$in`
* Projection
* Multiple possible values

---

# Challenge 13

## Orders Created During a Date Range

Find orders created between August 21 and August 24, 2026.

### Solution

```javascript
use("prime_delivery");

db.orders.find(
  {
    createdAt: {
      $gte: ISODate("2026-08-21T00:00:00Z"),
      $lte: ISODate("2026-08-24T23:59:59Z")
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    customerEmail: 1,
    createdAt: 1,
    status: 1
  }
);
```

### Concepts

* Date values
* `$gte`
* `$lte`
* Projection

---

# Challenge 14

## Customers With Specific Names

Find customers whose first name is either `Maria` or `Laura`.

### Solution

```javascript
use("prime_delivery");

db.customers.find({
  firstName: {
    $in: ["Maria", "Laura"]
  }
});
```

### Concepts

* `$in`
* String filtering

---

# Challenge 15

## Packages Outside the Standard Weight

Find packages where:

* Weight is less than `2 kg`.
* OR weight is greater than `8 kg`.

### Solution

```javascript
use("prime_delivery");

db.packages.find({
  $or: [
    {
      weightKg: {
        $lt: 2
      }
    },
    {
      weightKg: {
        $gt: 8
      }
    }
  ]
});
```

### Concepts

* `$or`
* `$lt`
* `$gt`

---

# Challenge 16

## Orders That Are Not Cancelled

Find all orders whose status is not `cancelled`.

Sort from the highest total amount to the lowest.

### Solution

```javascript
use("prime_delivery");

db.orders.find(
  {
    status: {
      $ne: "cancelled"
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    status: 1,
    totalAmount: 1
  }
).sort({
  totalAmount: -1
});
```

### Concepts

* `$ne`
* Projection
* Sorting

---

# Challenge 17

## Delivery Events After a Specific Time

Find delivery events after:

```text
2026-08-24T12:00:00Z
```

Sort them chronologically.

### Solution

```javascript
use("prime_delivery");

db.delivery_events.find(
  {
    timestamp: {
      $gt: ISODate("2026-08-24T12:00:00Z")
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    status: 1,
    location: 1,
    timestamp: 1
  }
).sort({
  timestamp: 1
});
```

### Concepts

* Date filtering
* `$gt`
* Projection
* Ascending sorting

---

# Challenge 18

## Complex Order Filter

Find orders that satisfy all of these conditions:

* Priority is `express`.
* Total amount is greater than `80`.
* Status is not `cancelled`.

### Solution

```javascript
use("prime_delivery");

db.orders.find(
  {
    priority: "express",
    totalAmount: {
      $gt: 80
    },
    status: {
      $ne: "cancelled"
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    customerEmail: 1,
    status: 1,
    priority: 1,
    totalAmount: 1
  }
).sort({
  totalAmount: -1
});
```

### Concepts

* Implicit `$and`
* `$gt`
* `$ne`
* Projection
* Sorting

---

# Challenge 19

## Complex Package Filter

Find packages satisfying either:

### Condition A

The package is fragile and weighs more than `5 kg`.

### Condition B

The package is electronics and weighs less than `2 kg`.

### Solution

```javascript
use("prime_delivery");

db.packages.find(
  {
    $or: [
      {
        fragile: true,
        weightKg: {
          $gt: 5
        }
      },
      {
        category: "electronics",
        weightKg: {
          $lt: 2
        }
      }
    ]
  },
  {
    _id: 0,
    trackingNumber: 1,
    description: 1,
    category: 1,
    weightKg: 1,
    fragile: 1
  }
);
```

### Concepts

* `$or`
* Implicit `$and`
* `$gt`
* `$lt`
* Projection

---

# Challenge 20

## Prime Delivery Operations Report

Find orders where:

* Total amount is greater than `60`.
* Priority is `standard` or `express`.
* Status is not `cancelled`.
* Order was created after August 20, 2026.

Return:

* `orderNumber`
* `customerEmail`
* `status`
* `priority`
* `totalAmount`
* `createdAt`

Sort by `totalAmount` from highest to lowest.

### Solution

```javascript
use("prime_delivery");

db.orders.find(
  {
    totalAmount: {
      $gt: 60
    },
    priority: {
      $in: ["standard", "express"]
    },
    status: {
      $ne: "cancelled"
    },
    createdAt: {
      $gt: ISODate("2026-08-20T00:00:00Z")
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    customerEmail: 1,
    status: 1,
    priority: 1,
    totalAmount: 1,
    createdAt: 1
  }
).sort({
  totalAmount: -1
});
```

### Concepts

This is the most comprehensive query in the challenge.

It combines:

* `$gt`
* `$in`
* `$ne`
* Date comparison
* Projection
* Sorting
* Multiple conditions

---

# Complete Playground Version

The following version contains all 20 solutions in one MongoDB
Playground file.

```javascript
use("prime_delivery");

// Challenge 01
db.customers.find({
  active: true
});

// Challenge 02
db.orders.find({
  totalAmount: {
    $gt: 80
  }
});

// Challenge 03
db.orders.find({
  priority: "express",
  totalAmount: {
    $gt: 80
  }
});

// Challenge 04
db.orders.find({
  status: {
    $in: ["delivered", "delayed"]
  }
});

// Challenge 05
db.orders.find(
  {
    totalAmount: {
      $gte: 50,
      $lte: 100
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    status: 1,
    totalAmount: 1
  }
);

// Challenge 06
db.drivers.find(
  {
    status: {
      $in: ["available", "on_delivery"]
    }
  },
  {
    _id: 0,
    firstName: 1,
    lastName: 1,
    status: 1,
    rating: 1
  }
);

// Challenge 07
db.drivers.find({
  rating: {
    $gte: 4.7
  }
}).sort({
  rating: -1
});

// Challenge 08
db.vehicles.find(
  {
    status: "active",
    capacityKg: {
      $gt: 1000
    }
  },
  {
    _id: 0,
    plateNumber: 1,
    brand: 1,
    model: 1,
    capacityKg: 1
  }
);

// Challenge 09
db.packages.find(
  {
    fragile: true,
    weightKg: {
      $gt: 5
    }
  },
  {
    _id: 0,
    trackingNumber: 1,
    description: 1,
    weightKg: 1,
    category: 1
  }
);

// Challenge 10
db.packages.find(
  {
    category: "electronics"
  },
  {
    _id: 0,
    trackingNumber: 1,
    description: 1,
    weightKg: 1,
    fragile: 1
  }
).sort({
  weightKg: -1
});

// Challenge 11
db.payments.find(
  {
    amount: {
      $gt: 90
    }
  },
  {
    _id: 0
  }
);

// Challenge 12
db.payments.find(
  {
    status: {
      $in: ["pending", "failed"]
    }
  },
  {
    _id: 0,
    paymentId: 1,
    orderNumber: 1,
    amount: 1,
    status: 1,
    method: 1
  }
);

// Challenge 13
db.orders.find(
  {
    createdAt: {
      $gte: ISODate("2026-08-21T00:00:00Z"),
      $lte: ISODate("2026-08-24T23:59:59Z")
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    customerEmail: 1,
    createdAt: 1,
    status: 1
  }
);

// Challenge 14
db.customers.find({
  firstName: {
    $in: ["Maria", "Laura"]
  }
});

// Challenge 15
db.packages.find({
  $or: [
    {
      weightKg: {
        $lt: 2
      }
    },
    {
      weightKg: {
        $gt: 8
      }
    }
  ]
});

// Challenge 16
db.orders.find(
  {
    status: {
      $ne: "cancelled"
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    status: 1,
    totalAmount: 1
  }
).sort({
  totalAmount: -1
});

// Challenge 17
db.delivery_events.find(
  {
    timestamp: {
      $gt: ISODate("2026-08-24T12:00:00Z")
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    status: 1,
    location: 1,
    timestamp: 1
  }
).sort({
  timestamp: 1
});

// Challenge 18
db.orders.find(
  {
    priority: "express",
    totalAmount: {
      $gt: 80
    },
    status: {
      $ne: "cancelled"
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    customerEmail: 1,
    status: 1,
    priority: 1,
    totalAmount: 1
  }
).sort({
  totalAmount: -1
});

// Challenge 19
db.packages.find(
  {
    $or: [
      {
        fragile: true,
        weightKg: {
          $gt: 5
        }
      },
      {
        category: "electronics",
        weightKg: {
          $lt: 2
        }
      }
    ]
  },
  {
    _id: 0,
    trackingNumber: 1,
    description: 1,
    category: 1,
    weightKg: 1,
    fragile: 1
  }
);

// Challenge 20
db.orders.find(
  {
    totalAmount: {
      $gt: 60
    },
    priority: {
      $in: ["standard", "express"]
    },
    status: {
      $ne: "cancelled"
    },
    createdAt: {
      $gt: ISODate("2026-08-20T00:00:00Z")
    }
  },
  {
    _id: 0,
    orderNumber: 1,
    customerEmail: 1,
    status: 1,
    priority: 1,
    totalAmount: 1,
    createdAt: 1
  }
).sort({
  totalAmount: -1
});
```

---

# Recommended VS Code Workflow

Create a file such as:

```text
challenge-05-solution.mongodb
```

Open the file in Visual Studio Code with the MongoDB extension installed.

At the top of the Playground, select:

```javascript
use("prime_delivery");
```

Then execute each challenge individually.

For example, highlight:

```javascript
db.orders.find({
  totalAmount: {
    $gt: 80
  }
});
```

and execute the selected code.

This is preferable during class because students can see the relationship
between:

```text
Problem
   |
   v
Collection
   |
   v
Filter
   |
   v
Operator
   |
   v
Result
```

rather than simply executing all 20 queries simultaneously.

---

# Instructor Recommendation

For the classroom feedback session, do not immediately show the complete
query.

Instead, ask students to identify the four components first:

```text
1. Which collection?
2. Which field?
3. Which condition?
4. Which operator?
```

For example, for Challenge 19:

```text
Which collection?
    |
    v
packages

Which conditions?
    |
    +--> fragile AND weight > 5
    |
    +--> electronics AND weight < 2

What combines the two groups?
    |
    v
$or
```

This encourages students to understand the logic of MongoDB queries rather
than memorize syntax.
