# Code Challenge: Advanced SQL Queries

## Hospital Management System

### Introduction

The Hospital Management System database has now been designed,
normalized to 3NF, implemented in PostgreSQL, and populated with
realistic data.

In this challenge, you will use the database to solve real-world
business requirements through SQL queries.

The objective is to move beyond basic `SELECT` statements and practice
combining the fundamental database concepts covered throughout the
course.

You will need to analyze each business requirement, identify the tables
and relationships involved, and determine which SQL techniques are
required to obtain the correct result.

---

## Challenge Objective

Your task is to solve **20 advanced SQL queries** based on business
requirements from the Hospital Management System.

The queries should demonstrate your ability to work with:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `DISTINCT`
- `INNER JOIN`
- `LEFT JOIN`
- Multiple-table `JOIN`s
- Aggregate functions
- `COUNT()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `HAVING`
- `IN`
- `NOT IN`
- `EXISTS`
- `NOT EXISTS`
- Subqueries
- Nested queries
- Correlated subqueries
- Conditional expressions
- Date filtering
- Combining multiple conditions
- Business-rule-based filtering

---

## Challenge Rules

For each requirement, you must create an SQL query that returns the
requested information.

Before writing the query, analyze the business requirement and identify:

1. What information is being requested?
2. Which table contains the required information?
3. Which additional tables are necessary?
4. What relationships exist between those tables?
5. Which conditions must be applied?
6. Is aggregation required?
7. Is a subquery or nested query required?
8. What columns should be returned?
9. How should the results be ordered?

---

## Important Requirement

Some queries should be solved using **nested queries or subqueries**.

Do not attempt to solve every requirement using only simple joins.

Depending on the business rule, consider whether you need:

- A subquery inside `WHERE`
- A subquery inside `FROM`
- A correlated subquery
- `EXISTS`
- `NOT EXISTS`
- `IN`
- `NOT IN`
- Aggregation inside a subquery

The goal is to understand **when and why** these techniques are useful.

---

## Business Requirements

Solve the following 20 business requirements.

### Query 01

Display the full name and email of every patient who has at least one
appointment.

### Query 02

Display each doctor's full name, medical specialty, and the total number
of appointments assigned to that doctor.

### Query 03

Display the patients who have had more appointments than the average
number of appointments per patient.

### Query 04

Display the doctors who have attended at least one completed
appointment.

### Query 05

Display the patients who have never had a cancelled appointment.

### Query 06

Display the patients who have more than one appointment.

### Query 07

Display the doctor or doctors with the highest number of appointments.

### Query 08

Display all appointments together with the patient's full name, doctor's
full name, specialty, appointment status, diagnosis, and treatment.

### Query 09

Display the patients who have an appointment with a doctor whose
specialty is Cardiology.

### Query 10

Display the diagnoses that have been used in at least one completed
appointment and the number of times each diagnosis has been used.

### Query 11

Display the patients whose number of appointments is greater than the
number of appointments of patient `1`.

### Query 12

Display the doctors who have more appointments than the average number
of appointments assigned to all doctors.

### Query 13

Display the patients who have had appointments with more than one
different doctor.

### Query 14

Display the rooms that have been used for at least one completed
appointment.

### Query 15

Display the patients who have never had a completed appointment.

### Query 16

Display the doctor or doctors who have attended the oldest appointment
recorded in the database.

### Query 17

Display the patients whose most recent appointment is later than the
average appointment date.

### Query 18

Display each appointment status and the percentage of total appointments
represented by that status.

### Query 19

Display the patients who have appointments with a doctor from the same
specialty as the doctor who attended patient `1`.

### Query 20

Display the patients who have had appointments with every doctor from
at least one specialty.

---

## Technical Requirements

Your solution must:

- Use PostgreSQL syntax.
- Use meaningful table and column names.
- Use table aliases when they improve readability.
- Return only the information requested by each requirement.
- Use appropriate joins based on the relationships in the database.
- Use aggregation when the requirement involves counting or comparing
  groups of records.
- Use `GROUP BY` when required.
- Use `HAVING` when filtering aggregated results.
- Use subqueries or nested queries where appropriate.
- Avoid modifying the database structure.
- Do not insert, update, or delete data as part of the challenge.

---

## Query Analysis

For every query, follow this process:

```text
Business Requirement
        |
        v
Identify the required information
        |
        v
Identify the tables
        |
        v
Identify the relationships
        |
        v
Determine the filtering conditions
        |
        v
Determine whether aggregation is required
        |
        v
Determine whether a subquery is required
        |
        v
Write the SQL query
        |
        v
Execute and validate the result
```

---

## Validation

After writing each query, execute it in PostgreSQL and verify that the
result makes sense according to the business requirement.

Do not assume that a query is correct simply because PostgreSQL executes
it without an error.

A query can be syntactically valid but logically incorrect.

Ask yourself:

- Does the query return the correct records?
- Are duplicate records appearing?
- Are any expected records missing?
- Are the joins correct?
- Are aggregate values correct?
- Does the result satisfy the original business rule?

---

## Learning Objective

The purpose of this challenge is not simply to write 20 SQL statements.

The objective is to develop the ability to translate real-world
business requirements into database queries.

By completing this challenge, you should be able to:

- Analyze complex business requirements.
- Navigate relationships between multiple tables.
- Combine data using different types of joins.
- Group and aggregate relational data.
- Filter aggregated results.
- Compare records against calculated values.
- Use nested and correlated queries.
- Use EXISTS and NOT EXISTS.
- Use subqueries to solve complex business rules.
- Validate whether a query is logically correct.

The database has already been designed and populated.

Your challenge now is to make the database answer meaningful
business questions.