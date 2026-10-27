# Code Challenge 2: Payment Management Models

## Challenge Introduction

In this challenge, you will apply the Sequelize concepts covered in class to 
create three new models for our backend application.

The database design represents the payment side of the hotel booking system.

Your objective is to translate the relational database structure into Sequelize 
models while preserving its data types, constraints, naming conventions, and relationships.

You will create the following models:

- `payment_status`
- `payment_method`
- `payment`

The challenge requires you to analyze the database diagram and determine how 
each table should be represented using Sequelize.

---

## Database Structure

### 1. Payment Status

The `payment_status` table represents the current state of a payment.

Examples of possible statuses include:

- PENDING
- PAID
- FAILED
- REFUNDED

The table contains the following fields:

| Field      | Type        | Constraints                |
| ---------- | ----------- | -------------------------- |
| id         | INTEGER     | PK, NN, UQ, auto-increment |
| name       | VARCHAR(30) | NN, UQ                     |
| created_at | TIMESTAMP   | NN                         |
| updated_at | TIMESTAMP   |                            |

Your model must use camelCase properties while correctly mapping them to the 
database column names.

For example:

```text
createdAt -> created_at
updatedAt -> updated_at
```

### 2. Payment Method

The `payment_method` table defines the ways a guest or staff member can pay for a booking.

Examples include:

- Credit Card
- Debit Card
- Cash
- Bank Transfer
- Digital Wallet

The table contains the following fields:

| Field      | Type        | Constraints                |
| ---------- | ----------- | -------------------------- |
| id         | INTEGER     | PK, NN, UQ, auto-increment |
| name       | VARCHAR(30) | NN, UQ                     |
| created_at | TIMESTAMP   | NN                         |
| updated_at | TIMESTAMP   |                            |

The JavaScript properties should use camelCase.

For example:

```text
createdAt -> created_at
updatedAt -> updated_at
```

### 3. Payment

The `payment` table represents an individual payment transaction tied to a booking.

The table contains the following fields:

| Field        | Type          | Constraints                |
| ------------ | ------------- | -------------------------- |
| id           | INTEGER       | PK, NN, UQ, auto-increment |
| booking_id   | INTEGER       | FK, NN                     |
| amount       | NUMERIC(10,2) | NN, CHECK                  |
| method       | INTEGER       | FK, NN, CHECK              |
| status       | INTEGER       | FK, NN                     |
| paid_at      | TIMESTAMP     | NN                         |
| processed_by | INTEGER       | FK, NN                     |
| created_at   | TIMESTAMP     | NN                         |
| updated_at   | TIMESTAMP     |                            |

The `booking_id` column references the `booking` table.

The `method` column references the `payment_method` table.

The `status` column references the `payment_status` table.

The `processed_by` column references the `user` table (the staff member who processed the payment).

The relationships are:

```text
booking         1 -------- 1   payment
payment_method  1 -------- N   payment
payment_status  1 -------- N   payment
user            1 -------- N   payment
```

This means that each booking has exactly one payment, while one payment method or 
one payment status can be assigned to many payments. Likewise, one staff user 
(`processed_by`) can process many payments.

---

## Your Challenge

Create the following three Sequelize models:

```text
paymentStatus.js
paymentMethod.js
payment.js
```

Place the files in the appropriate `models` directory of the project.

You must follow the same architecture and conventions used by the existing Sequelize models.

### Requirement 1: Create the `payment_status` Model

Create a Sequelize model representing the `payment_status` table.

The model must:

- Import the Sequelize database connection.
- Import `DataTypes` from Sequelize.
- Define a `table` constant.
- Use `sequelize.define()`.
- Configure `id` as the primary key.
- Configure `id` as auto-increment.
- Make `name` required.
- Make `name` unique.
- Limit `name` to 30 characters.
- Configure `createdAt` as `created_at`.
- Configure `updatedAt` as `updated_at`.
- Enable Sequelize timestamps.

### Requirement 2: Create the `payment_method` Model

Create a Sequelize model representing the `payment_method` table.

The model must:

- Configure the primary key.
- Configure automatic ID generation.
- Make `name` required.
- Make `name` unique.
- Limit `name` to 30 characters.
- Configure the timestamp fields.
- Map JavaScript names to database column names.
- Enable Sequelize timestamps.

The following mapping must be respected:

```text
createdAt -> created_at
updatedAt -> updated_at
```

### Requirement 3: Create the `payment` Model

Create a Sequelize model representing the `payment` table.

The model must:

- Configure the primary key.
- Configure automatic ID generation.
- Add the booking foreign key (`bookingId`).
- Make `bookingId` required.
- Add the `amount` field as a decimal with 2 decimal places of precision.
- Make `amount` required.
- Add the payment method foreign key (`method`).
- Make `method` required.
- Add the payment status foreign key (`status`).
- Make `status` required.
- Add the `paidAt` field as a timestamp/date.
- Make `paidAt` required.
- Add the processed-by foreign key (`processedBy`), referencing the user who handled the payment.
- Make `processedBy` required.
- Configure the timestamp fields.
- Configure the appropriate table name.
- Configure the appropriate model name.

The foreign keys must reference:

```text
payment.bookingId    -> booking.id
payment.method       -> payment_method.id
payment.status       -> payment_status.id
payment.processedBy  -> user.id
```

---

## Database Constraints

An important objective of this challenge is understanding that Sequelize models 
should represent more than just the database columns.

They should also represent important database constraints.

### Primary Keys

Every model must have an `id` primary key.

```text
id -> INTEGER -> PRIMARY KEY -> AUTO INCREMENT
```

### Unique Values

The following fields must be unique:

```text
payment_status.name
payment_method.name
```

This prevents duplicate records that should represent different entities.

### Required Values

Fields marked as NN in the database diagram must not accept NULL.

Use the appropriate Sequelize configuration to enforce this requirement.

### Foreign Keys

The `payment` model contains four foreign keys:

```text
bookingId
method
status
processedBy
```

They must reference the appropriate primary keys, as described above.

### Validation Requirements

The database diagram contains a CHECK constraint on the `amount` field.

Your implementation should prevent invalid values from being stored.

#### Payment Amount

A payment amount must be a positive value greater than zero.

```text
amount > 0
```

Use Sequelize validation mechanisms to represent this rule.

The objective is to understand that validation can be implemented at the model 
level while database constraints provide an additional layer of data integrity.

### Timestamp Configuration

The database uses snake_case column names:

```text
created_at
updated_at
```

Sequelize commonly uses camelCase property names:

```text
createdAt
updatedAt
```

Your models must correctly map these two naming conventions.

For example:

```text
createdAt -> created_at
updatedAt -> updated_at
```

Use Sequelize's built-in timestamp functionality instead of creating unnecessary 
custom timestamp fields.

---

## Expected Relationships

After creating the models, you should be able to identify the following relationships:

```text
payment_method
    |
    | 1
    |
    | N
    v
  payment
```

And:

```text
payment_status
    |
    | 1
    |
    | N
    v
  payment
```

And:

```text
booking
    |
    | 1
    |
    | 1
    v
  payment
```

At this stage, focus on correctly defining the models and their foreign key references.

The Sequelize associations such as `hasOne()`, `hasMany()`, and `belongsTo()` 
will be implemented in the next stage of the exercise.

---

## Suggested Project Structure

Follow the existing project organization.

```text
models/
├── phone.js
├── user.js
├── userRole.js
├── userStatus.js
├── roomStatus.js
├── roomType.js
├── room.js
├── booking.js
├── bookingStatus.js
├── paymentStatus.js
├── paymentMethod.js
└── payment.js
```

Follow the naming conventions already established in the project.

---

## Technical Requirements

Your solution must use:

- Node.js
- Sequelize
- PostgreSQL
- ES Modules
- Sequelize `DataTypes`
- `sequelize.define()`

Do not create raw SQL tables for this challenge.

The objective is to practice translating a relational database design into a 
Sequelize-based application architecture.

---

## Challenge Questions

Before implementing the models, answer the following questions:

1. Which table contains the most foreign keys?
2. Which table is the parent of `payment.method`?
3. Which table is the parent of `payment.status`?
4. Which table is the parent of `payment.processedBy`?
5. What type of relationship exists between `booking` and `payment`?
6. What type of relationship exists between `payment_method` and `payment`?
7. What type of relationship exists between `payment_status` and `payment`?
8. Why should `payment_method.name` and `payment_status.name` be unique?
9. Why should `amount` use a numeric data type instead of a float?
10. Why is it useful to track `processedBy` on a payment record?

---

## Expected Result

At the end of the challenge, your project should contain three functional Sequelize models:

```text
payment_status
payment_method
payment
```

The models should correctly represent:

- Primary keys.
- Foreign keys.
- Required fields.
- Unique fields.
- Numeric constraints.
- Timestamp management.
- Database naming conventions.
- Relationships between entities.

The main objective is not simply to reproduce the diagram in code.

You must understand how a relational database design is translated into a 
Sequelize-based application architecture.

Do not simply copy an existing model and change the table name. Analyze each 
entity and determine the appropriate Sequelize configuration for every field, 
constraint, and relationship.