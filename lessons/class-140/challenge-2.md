# Code Challenge 2: SQL Query Practice
## Electronics Store Database

## Overview

In this challenge, you will apply the SQL concepts learned in class by
working with a realistic **Electronics Store** database. The goal is to
become comfortable retrieving information from a relational database
using SQL queries.

During the lesson, we will first create the database and all four tables
together. After the database structure is complete, you will receive a
SQL script containing the data (`INSERT` statements). Once the data has
been inserted successfully, your task will be to solve a series of SQL
query exercises.

This activity is designed to reinforce the SQL fundamentals that every
backend developer uses on a daily basis.

---

# Learning Objectives

By completing this challenge, you will learn how to:

- Query data from a PostgreSQL database.
- Retrieve complete records using `SELECT`.
- Select specific columns from a table.
- Filter records using the `WHERE` clause.
- Sort query results with `ORDER BY`.
- Search for text using the `LIKE` operator.
- Count records using aggregate functions.
- Find maximum values using `MAX()`.
- Combine multiple conditions using `AND` and `OR`.
- Limit the number of returned records using `LIMIT`.

---

# Project Description

The database represents an online electronics store.

It contains information about:

- Product categories
- Products
- Customers
- Customer orders

The database includes products with different availability statuses and
orders with different processing statuses, allowing you to practice a
variety of SQL queries.

---

# Database Tables

The project contains the following tables:

- `category`
- `product`
- `customer`
- `customer_order`

Each table has already been designed to represent a real-world business
scenario.

---

# Challenge Workflow

Follow these steps carefully.

## Step 1

Create the database.

---

## Step 2

Create all four tables using the SQL script provided during class.

---

## Step 3

Execute the provided `INSERT` statements to populate every table with
sample data.

---

## Step 4

Verify that the records were inserted successfully by executing `SELECT`
queries on each table.

Example:

```sql
SELECT * FROM category;

SELECT * FROM product;

SELECT * FROM customer;

SELECT * FROM customer_order;
```

---

## Step 5

Complete all twenty SQL exercises by writing the correct query for each
question.

---

## Step 6

Test every query before submitting your work.

Make sure each query returns the expected results.

---

# Rules

- Use **PostgreSQL**.
- Use only `SELECT` statements.
- Do not modify the database structure.
- Do not create additional tables.
- Do not insert new records.
- Do not update existing records.
- Do not delete records.
- Do not change any column names.
- Execute every query before submitting your solution.

---

# Expected Deliverable

Create a SQL file named:

```text
queries.sql
```

The file must contain:

- A SQL comment indicating the exercise number.
- The SQL query that answers the corresponding question.

Example:

```sql
-- Exercise 1

SELECT * FROM category;
```

Repeat this format for all twenty exercises.

---

# Evaluation Criteria

Your submission will be evaluated based on:

- Correct SQL syntax.
- Correct use of SQL clauses.
- Accuracy of the returned results.
- Proper formatting and organization.
- Completion of all twenty exercises.

---

# Tips

Before writing each query:

- Identify which table contains the required information.
- Read the exercise carefully.
- Choose the appropriate SQL clause.
- Execute the query and verify the output.
- Correct any errors before moving to the next exercise.

---

# Topics Covered

This challenge reinforces the following SQL concepts:

- `SELECT`
- Selecting specific columns
- `WHERE`
- Comparison operators
- `LIKE`
- `ORDER BY`
- `COUNT()`
- `MAX()`
- `AND`
- `OR`
- `LIMIT`

These are fundamental SQL skills that every backend developer should
master before learning more advanced topics such as `JOIN`, `GROUP BY`,
subqueries, and database relationships.

Good luck, and remember to test every query before submitting your
solution.