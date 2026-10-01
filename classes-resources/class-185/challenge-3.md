# Code Challenge 3: Create Phone and Room Migrations

## Overview

In today's class, we worked with Sequelize models and learned how to create
database migrations based on the structure and constraints defined in those
models.

Your challenge is to create the database migrations for two tables:

* `phone`
* `room`

The migrations must correctly represent the structure, data types,
constraints, default values, and foreign-key relationships defined in the
corresponding Sequelize models.

The goal is to practice translating a Sequelize model into a migration that
can be executed safely against the database.

---

## Learning Objectives

By completing this challenge, you will practice:

1. Creating Sequelize migrations.
2. Translating model attributes into migration columns.
3. Using Sequelize `DataTypes` inside migrations.
4. Defining primary keys.
5. Defining auto-incrementing fields.
6. Defining unique constraints.
7. Defining non-null constraints.
8. Creating foreign-key relationships.
9. Defining default timestamp values.
10. Creating migration rollback operations.
11. Maintaining consistency between models and database tables.
12. Using the project's configured migration generation script.

---

# Challenge Requirements

You must create **two migration files**.

The migrations must be generated using the NPM script already configured in
the project's `package.json`.

The two migrations are:

```text
phone
room
```

---

# Step 1: Generate the Phone Migration

Remember that migrations are generated using the project script that we
configured in `package.json`.

Use:

```bash
npm run migrations:generate -- phone
```

This command generates the migration file using the project's configured
migration tool.

After generating the migration, **rename the generated file** so that it
uses the `.cjs` extension.

The migration must therefore use:

```text
.cjs
```

and not:

```text
.js
```

For example:

```text
migrations/XXXXXXXXXXXX-create-phone.cjs
```

The exact timestamp will depend on when you generate the migration.

---

# Step 2: Generate the Room Migration

Generate the second migration using the same project script:

```bash
npm run migrations:generate -- room
```

After generating the migration, rename the generated file from `.js` to
`.cjs`.

The final file should follow this structure:

```text
migrations/XXXXXXXXXXXX-create-room.cjs
```

Remember that the timestamp will be generated automatically.

---

# Important: Migration Extension

The migration generator may create the migration with a `.js` extension.

For this project, migrations must use the `.cjs` extension.

Therefore, after generating each migration:

```text
.js
```

must be renamed to:

```text
.cjs
```

For example:

```text
XXXXXXXXXXXX-create-phone.js
```

must become:

```text
XXXXXXXXXXXX-create-phone.cjs
```

And:

```text
XXXXXXXXXXXX-create-room.js
```

must become:

```text
XXXXXXXXXXXX-create-room.cjs
```

Do not change the migration filename manually before using the generation
script. First generate the migration using the configured NPM script, then
rename the extension.

---

# Phone Migration

Create a migration that generates the following table structure:

```text
phone
├── id
├── number
├── user
├── created_at
└── updated_at
```

### Requirements

The `id` column must:

* Use the INTEGER data type.
* Be the primary key.
* Automatically increment.
* Not accept `NULL`.

The `number` column must:

* Use STRING with a maximum length of 20.
* Not accept `NULL`.
* Contain unique values.

The `user` column must:

* Use the INTEGER data type.
* Not accept `NULL`.
* Reference the `id` column of the `user` table.

The `created_at` column must:

* Use the DATE data type.
* Not accept `NULL`.
* Have the current timestamp as its default value.

The `updated_at` column must:

* Use the DATE data type.
* Not accept `NULL`.
* Have the current timestamp as its default value.

---

# Room Migration

Create a migration that generates the following table structure:

```text
room
├── id
├── number
├── type
├── floor
├── status
├── created_at
└── updated_at
```

### Requirements

The `id` column must:

* Use the INTEGER data type.
* Be the primary key.
* Automatically increment.
* Not accept `NULL`.

The `number` column must:

* Use STRING with a maximum length of 10.
* Not accept `NULL`.
* Contain unique values.

The `type` column must:

* Use the INTEGER data type.
* Not accept `NULL`.
* Reference `room_type.id`.

The `floor` column must:

* Use the SMALLINT data type.
* Not accept `NULL`.

The `status` column must:

* Use the INTEGER data type.
* Not accept `NULL`.
* Reference `room_status.id`.

The `created_at` column must:

* Use the DATE data type.
* Not accept `NULL`.
* Have the current timestamp as its default value.

The `updated_at` column must:

* Use the DATE data type.
* Not accept `NULL`.
* Have the current timestamp as its default value.

---

# Model-to-Migration Rules

When converting the models into migrations, pay attention to the difference
between the Sequelize model property and the actual database column name.

For example, the model defines:

```javascript
createdAt: {
  type: DataTypes.DATE,
  field: 'created_at',
}
```

Therefore, the database column must be:

```text
created_at
```

The same rule applies to:

```text
updated_at
```

Your migrations must use the database column names, not the JavaScript model
property names.

---

# Foreign-Key Relationships

Your migrations must correctly implement the following relationships:

```text
phone.user -> user.id
```

And:

```text
room.type   -> room_type.id
room.status -> room_status.id
```

Do not replace the foreign keys with regular INTEGER columns.

The database must enforce these relationships.

---

# Migration Structure

Each migration should contain the standard Sequelize migration structure.

The `up` function must create the table.

The `down` function must reverse the operation performed by `up`.

Conceptually, your migration should contain:

```javascript
module.exports = {
  async up({ context: queryInterface }) {
    // Create table
  },

  async down({ context: queryInterface }) {
    // Remove table
  },
};
```

Use the migration structure already configured and demonstrated in the
project.

---

# Migration Order

Pay attention to migration dependencies.

The `phone` migration depends on the existence of:

```text
user
```

The `room` migration depends on the existence of:

```text
room_type
room_status
```

Therefore, the migrations that create these referenced tables must execute
before the migrations that create `phone` and `room`.

Think about the following question:

> What happens if a migration tries to create a foreign key referencing a
> table that does not exist yet?

You should understand why migration order matters.

---

# Validation

After creating the migrations, execute the project's migration command.

Verify that both tables are created successfully.

You should be able to inspect the database and confirm that:

```text
phone
room
```

exist in the database.

---

# Database Validation

Verify the structure of the `phone` table.

Confirm that:

* `id` is the primary key.
* `id` is auto-incrementing.
* `number` cannot be `NULL`.
* `number` is unique.
* `user` cannot be `NULL`.
* `user` references `user.id`.
* `created_at` exists.
* `updated_at` exists.

Then verify the `room` table.

Confirm that:

* `id` is the primary key.
* `id` is auto-incrementing.
* `number` cannot be `NULL`.
* `number` is unique.
* `type` references `room_type.id`.
* `floor` cannot be `NULL`.
* `status` references `room_status.id`.
* `created_at` exists.
* `updated_at` exists.

---

# Restrictions

For this challenge:

* Do not modify the existing models.
* Do not use `sequelize.sync()`.
* Do not manually create the tables in PostgreSQL.
* Do not use SQL scripts to create the tables.
* Use Sequelize migrations.
* Generate migrations using the configured NPM script.
* Use the migration name when running the generation script.
* Rename generated migration files from `.js` to `.cjs`.
* Do not remove foreign-key constraints.
* Do not change the column names defined by the models.
* Do not change the data types specified by the models.
* Do not omit timestamps.
* Do not omit rollback functionality.

---

# Expected Deliverables

Submit the following migration files:

```text
migrations/
├── <timestamp>-create-phone.cjs
└── <timestamp>-create-room.cjs
```

Your submission must contain:

1. The `phone` migration.
2. The `room` migration.
3. Working `up` functions.
4. Working `down` functions.
5. Correct foreign-key relationships.
6. Correct constraints.
7. Correct timestamp columns.
8. The `.cjs` extension for both migrations.

---

# Success Criteria

Your challenge is complete when:

* Both migrations have been generated using the project script.
* Both generated files have been renamed to `.cjs`.
* The migration names identify their corresponding tables.
* The migrations execute without errors.
* The `phone` table is created correctly.
* The `room` table is created correctly.
* All required constraints are present.
* All foreign keys are working.
* The timestamps use the correct database column names.

---

# Bonus Challenge

If you finish the required challenge early, investigate the following.

### Question 1

What is the difference between:

```javascript
allowNull: false
```

and:

```javascript
unique: true
```

### Question 2

Why should foreign-key constraints be implemented at the database level?

### Question 3

What is the difference between:

```text
createdAt
```

and:

```text
created_at
```

in the context of the models used in this project?

### Question 4

What could happen if the `room_type` migration runs after the `room`
migration?

### Question 5

Why is it important for migrations to have a working `down` operation?

### Question 6

Why does this project use `.cjs` files for migrations instead of `.js`
files?

---

# Final Goal

The main objective of this challenge is to demonstrate that you can take an
existing Sequelize model and translate its structure into a reliable,
reversible database migration.

The migration should represent the model accurately while also enforcing
data integrity through primary keys, unique constraints, non-null
constraints, timestamps, and foreign-key relationships.
