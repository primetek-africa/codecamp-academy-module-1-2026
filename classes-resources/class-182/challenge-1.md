# Code Challenge 1: Hotel Room Management Models

## Challenge Introduction

In this challenge, you will apply the Sequelize concepts covered in today's class
to create three new models for our backend application.

The database design represents part of a hotel room management system.

Your objective is to translate the relational database structure into Sequelize 
models while preserving its data types, constraints, naming conventions, and relationships.

You will create the following models:

- `room_status`
- `room_type`
- `room`

The challenge requires you to analyze the database diagram and determine how each 
table should be represented using Sequelize.

---

## Database Structure

### 1. Room Status

The `room_status` table represents the current state of a hotel room.

Examples of possible statuses include:

- AVAILABLE
- OCCUPIED
- MAINTENANCE
- CLEANING
- OUT_OF_SERVICE

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

### 2. Room Type

The `room_type` table defines the characteristics of the different types of 
rooms offered by the hotel.

Examples include:

- Standard Room
- Deluxe Room
- Suite
- Family Room

The table contains the following fields:

| Field           | Type          | Constraints                |
| --------------- | ------------- | -------------------------- |
| id              | INTEGER       | PK, NN, UQ, auto-increment |
| name            | VARCHAR(50)   | NN, UQ                     |
| description     | TEXT          | NN                         |
| price_per_night | NUMERIC(10,2) | CHECK                      |
| max_occupancy   | SMALLINT      | NN, CHECK                  |
| amenities       | JSONB         | NN                         |
| created_at      | TIMESTAMP     | NN                         |
| updated_at      | TIMESTAMP     |                            |

The JavaScript properties should use camelCase.

For example:

```text
pricePerNight -> price_per_night
maxOccupancy  -> max_occupancy
```

The `amenities` field must use Sequelize's PostgreSQL JSONB data type.

Example:

```json
{
  "wifi": true,
  "tv": true,
  "airConditioning": true,
  "breakfast": false
}
```

### 3. Room

The `room` table represents the individual physical rooms in the hotel.

Examples of room numbers could be:

```text
101
102
103
201
202
203
```

The table contains the following fields:

| Field      | Type        | Constraints                |
| ---------- | ----------- | -------------------------- |
| id         | INTEGER     | PK, NN, UQ, auto-increment |
| number     | VARCHAR(10) | NN, UQ                     |
| type       | INTEGER     | FK, NN                     |
| floor      | SMALLINT    | NN                         |
| status     | INTEGER     | FK, NN                     |
| created_at | TIMESTAMP   | NN                         |
| updated_at | TIMESTAMP   |                            |

The `type` column references the `room_type` table.

The `status` column references the `room_status` table.

The relationships are:

```text
room_type   1 -------- N   room
room_status 1 -------- N   room
```

This means that one room type can be assigned to many rooms, while each room 
belongs to one room type.

Likewise, one room status can be assigned to many rooms, while each room has one 
current status.

---

## Your Challenge

Create the following three Sequelize models:

```text
roomStatus.js
roomType.js
room.js
```

Place the files in the appropriate `models` directory of the project.

You must follow the same architecture and conventions used by the existing 
Sequelize models.

### Requirement 1: Create the `room_status` Model

Create a Sequelize model representing the `room_status` table.

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

### Requirement 2: Create the `room_type` Model

Create a Sequelize model representing the `room_type` table.

The model must:

- Configure the primary key.
- Configure automatic ID generation.
- Make `name` required.
- Make `name` unique.
- Limit `name` to 50 characters.
- Add the `description` field as TEXT.
- Add the `pricePerNight` field.
- Add the `maxOccupancy` field.
- Add the `amenities` field using JSONB.
- Configure the timestamp fields.
- Map JavaScript names to database column names.
- Enable Sequelize timestamps.

The following mapping must be respected:

```text
pricePerNight -> price_per_night
maxOccupancy  -> max_occupancy
createdAt     -> created_at
updatedAt     -> updated_at
```

### Requirement 3: Create the `room` Model

Create a Sequelize model representing the `room` table.

The model must:

- Configure the primary key.
- Configure automatic ID generation.
- Make `number` required.
- Make `number` unique.
- Limit `number` to 10 characters.
- Add the room type foreign key.
- Add the `floor` field.
- Add the room status foreign key.
- Configure the timestamp fields.
- Configure the appropriate table name.
- Configure the appropriate model name.

The foreign keys must reference:

```text
room.type   -> room_type.id
room.status -> room_status.id
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
room_status.name
room_type.name
room.number
```

This prevents duplicate records that should represent different entities.

### Required Values

Fields marked as NN in the database diagram must not accept NULL.

Use the appropriate Sequelize configuration to enforce this requirement.

### Foreign Keys

The `room` model contains two foreign keys:

```text
type
status
```

They must reference the appropriate primary keys.

### Validation Requirements

The database diagram contains CHECK constraints for numeric fields.

Your implementation should prevent invalid values from being stored.

#### Room Price

A room type should not have a negative nightly price.

```text
pricePerNight >= 0
```

#### Maximum Occupancy

A room type should allow at least one person.

```text
maxOccupancy > 0
```

Use Sequelize validation mechanisms to represent these rules.

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
room_type
    |
    | 1
    |
    | N
    v
  room
```

And:

```text
room_status
    |
    | 1
    |
    | N
    v
  room
```

At this stage, focus on correctly defining the models and their foreign key references.

The Sequelize associations such as `hasMany()` and `belongsTo()` will be 
implemented in the next stage of the exercise.

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
└── room.js
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

1. Which table contains the foreign keys?
2. Which table is the parent of `room.type`?
3. Which table is the parent of `room.status`?
4. What type of relationship exists between `room_type` and `room`?
5. What type of relationship exists between `room_status` and `room`?
6. Why should `room.number` be unique?
7. Why should `room_type.name` be unique?
8. Why is `amenities` represented using the JSONB data type?
9. Why should `price_per_night` use a numeric data type?
10. Why should `created_at` and `updated_at` be managed automatically?

---

## Expected Result

At the end of the challenge, your project should contain three functional 
Sequelize models:

```text
room_status
room_type
room
```

The models should correctly represent:

- Primary keys.
- Foreign keys.
- Required fields.
- Unique fields.
- Numeric constraints.
- PostgreSQL-specific data types.
- Timestamp management.
- Database naming conventions.
- Relationships between entities.

The main objective is not simply to reproduce the diagram in code.

You must understand how a relational database design is translated into a 
Sequelize-based application architecture.

Do not simply copy an existing model and change the table name. Analyze each 
entity and determine the appropriate Sequelize configuration for every field, 
constraint, and relationship.