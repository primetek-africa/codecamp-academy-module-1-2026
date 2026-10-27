# Activity: Advanced SQL Queries and Business Rules

## Introduction

During the past week, we worked on the **Hospital Management System**,
taking the project from a real-world business problem to a functional
relational database in PostgreSQL.

We started by analyzing the hospital's business requirements and
identifying the information that the system needed to manage. From this
analysis, we identified the main entities, their attributes, and the
relationships between them.

We then progressively improved the database design by applying
**database normalization principles**, moving toward a **Third Normal
Form (3NF)** design.

After designing the relational model, we implemented the database in
PostgreSQL using:

- Tables and relationships
- Primary keys
- Foreign keys
- Unique constraints
- `NOT NULL` constraints
- Lookup and catalog tables
- `ENUM` types
- Many-to-many relationships using bridge tables
- One-to-one relationships
- Foreign-key indexes
- Referential integrity rules

We also populated the database with realistic sample data representing
patients, doctors, specialties, appointments, diagnoses, treatments,
rooms, phone numbers, and medical records.

Finally, we practiced basic SQL operations to create and populate the
database.

---

## Today's Activity: Advanced SQL Queries

Now that the database is designed and populated, we are moving to the
next stage: **using SQL to answer real business questions**.

In a real software system, databases are not created only to store
information. They must also allow applications, administrators, and
business users to retrieve meaningful information from that data.

For this reason, today's activity will focus on transforming **business
rules and requirements into SQL queries**.

Instead of simply asking questions such as:

> "Show all patients."

We will work with questions such as:

> "Which doctors have attended patients with completed appointments?"

or:

> "Which patients have had more than one appointment?"

These questions require us to understand the relationships between
tables and combine information from different parts of the database.

---

## Concepts We Will Practice

During this activity, we will work with more advanced SQL concepts,
including:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `DISTINCT`
- `JOIN`
- `INNER JOIN`
- `LEFT JOIN`
- Multiple-table joins
- Filtering related records
- `GROUP BY`
- Aggregate functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `HAVING`
- Subqueries
- Conditional filtering
- Business-rule-based queries

---

## Business Rules

The main challenge is to understand that a **business rule must be
translated into SQL logic**.

For example:

**Business rule:**

> The hospital needs to identify patients who have attended more than
> one appointment.

The SQL query must determine:

1. Which table contains the appointments.
2. Which column identifies the patient.
3. How many appointments each patient has.
4. Which patients have more than one appointment.
5. How to display meaningful patient information.

This requires more than simply retrieving rows. It requires us to
**analyze the data model and translate the business requirement into a
query**.

---

## Your Objective

For each business rule, you should first understand the requirement,
identify the tables involved, determine the relationships between those
tables, and then construct the SQL query.

The objective is not to memorize SQL syntax.

The objective is to develop the ability to think:

```text
Business Requirement
        |
        v
Identify Information
        |
        v
Identify Tables
        |
        v
Identify Relationships
        |
        v
Define Filtering / Aggregation
        |
        v
Write SQL Query
        |
        v
Validate the Result
```

---

## Expected Outcome

At the end of this activity, you should be able to take a real-world
hospital requirement and determine how it can be represented as an SQL
query.

You will also begin to understand how the database design we created
during the previous lessons directly affects the complexity, accuracy,
and reliability of the queries we write.

The database is now built. Today, we start using it to answer
real-world business questions.