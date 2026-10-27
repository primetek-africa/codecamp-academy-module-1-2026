# Code Challenge 6: Advanced Nested SQL Queries

## Introduction

In this challenge, you will work with the **Hospital Management System** database 
developed throughout the previous lessons.

You have already practiced database design, normalization up to 3NF, relational 
models, PostgreSQL, CRUD operations, joins, filtering, aggregation, grouping, 
and business-rule queries.

The objective of this activity is to apply these concepts to more complex business 
requirements using **nested SQL queries**.

You must solve the five business requirements below using PostgreSQL.

---

## Learning Objectives

By completing this challenge, you will practice:

- Nested queries and subqueries
- Scalar subqueries
- Subqueries with `IN`
- Subqueries with `EXISTS`
- Subqueries with `NOT EXISTS`
- Correlated subqueries
- `JOIN` operations
- Aggregate functions
- `GROUP BY`
- `HAVING`
- Comparison with calculated values
- Translating business rules into SQL

---

## Database Context

The database contains information about:

- Patients
- Doctors
- Medical specialties
- Appointments
- Appointment statuses
- Diagnoses
- Treatments
- Rooms
- Medical records
- Patient phone numbers
- Doctor phone numbers

> The database is already populated with the provided seed data. 
> **Do not modify the database structure or data** while solving this challenge.

---

## Challenge Requirements

You must create **five advanced SQL queries**.

- Each query must contain **at least one nested query or subquery**.
- Your task is to translate each business requirement into a valid SQL statement.
- **Do not simply search for the expected output.** The query must obtain the result dynamically from the database.

---

## Query 1 — Doctors Above the Average

**Business rule:** The hospital administration wants to identify doctors who 
have attended more appointments than the average number of appointments attended 
by all doctors.

**Return:**

| Column | Description |
|---|---|
| Doctor ID | |
| Doctor first name | |
| Doctor last name | |
| Number of appointments attended | |

Only doctors whose appointment count is greater than the overall average should be returned.

### Technical Requirements

Your query must:

1. Count appointments for each doctor.
2. Calculate the average appointment count.
3. Compare each doctor's count against that average.
4. Use a nested query to calculate the average.

### Expected structure

```
Calculate appointments per doctor
        |
        v
Calculate the average
        |
        v
Compare each doctor's count
        |
        v
Return doctors above the average
```

---

## Query 2 — Patients With More Appointments Than Average

**Business rule:** The hospital wants to identify patients who have scheduled 
more appointments than the average number of appointments per patient.

**Return:**

| Column | Description |
|---|---|
| Patient ID | |
| Patient first name | |
| Patient last name | |
| Number of appointments | |

Only patients whose appointment count is greater than the average should be returned.

### Technical Requirements

Your query must:

1. Calculate the number of appointments for each patient.
2. Calculate the average number of appointments per patient.
3. Compare each patient's appointment count with the average.
4. Use a nested query.

> Think carefully about the difference between `COUNT(*)` and `AVG(...)`. 
The average must be calculated **from the appointment counts per patient**, 
not directly from the appointment table.

---

## Query 3 — Doctors Without Cancelled Appointments

**Business rule:** The hospital administration wants to identify doctors who 
have never had a cancelled appointment.

**Return:**

| Column | Description |
|---|---|
| Doctor ID | |
| Doctor first name | |
| Doctor last name | |
| Medical license | |

A doctor should appear in the result only if there is no appointment associated 
with that doctor whose status is `Cancelled`.

### Technical Requirements

Use a nested query. You may solve this problem using `NOT EXISTS` or another 
appropriate subquery technique.

### The query should conceptually answer:

```
Does this doctor have a cancelled appointment?
            |
       +----+----+
       |         |
      Yes        No
       |         |
     Exclude    Include
```

---

## Query 4 — Patients With the Same Diagnosis

**Business rule:** The hospital wants to identify patients who have received at 
least one diagnosis that was also assigned to **Carlos Martinez**.

**Return:**

| Column | Description |
|---|---|
| Patient ID | |
| Patient first name | |
| Patient last name | |
| Diagnosis name | |

Carlos Martinez must **not** appear in the final result.

### Technical Requirements

Your query must:

1. Identify Carlos Martinez.
2. Find the diagnoses associated with Carlos Martinez.
3. Find other patients who have received one of those diagnoses.
4. Exclude Carlos Martinez from the results.
5. Use a nested query.

You may use an `IN` subquery or another appropriate nested-query technique.

### Conceptually:

```
Carlos Martinez
       |
       v
His diagnoses
       |
       v
Other patients
       |
       v
Matching diagnosis
```

---

## Query 5 — Doctors Above the Average of Completed Appointments

**Business rule:** The hospital wants to identify doctors whose number of 
completed appointments is greater than the average number of completed appointments 
among all doctors.

**Return:**

| Column | Description |
|---|---|
| Doctor ID | |
| Doctor first name | |
| Doctor last name | |
| Specialty name | |
| Number of completed appointments | |

Only doctors above the average should be returned.

### Technical Requirements

Your query must:

1. Consider only appointments with the `Completed` status.
2. Count completed appointments for each doctor.
3. Calculate the average number of completed appointments.
4. Compare each doctor's count with that average.
5. Display the doctor's specialty.
6. Use a nested query.

> Be careful to calculate the average using **completed appointments per doctor**, 
rather than calculating an average directly from the appointment rows.

---

## Submission Requirements

Create a file named:

```
04_advanced_nested_queries.sql
```

Organize your solution using the following structure:

```sql
-- ============================================================
-- HOSPITAL MANAGEMENT SYSTEM
-- ADVANCED NESTED SQL QUERIES
-- ============================================================


-- ============================================================
-- QUERY 1
-- Doctors Above the Average
-- ============================================================

-- Your solution here


-- ============================================================
-- QUERY 2
-- Patients With More Appointments Than Average
-- ============================================================

-- Your solution here


-- ============================================================
-- QUERY 3
-- Doctors Without Cancelled Appointments
-- ============================================================

-- Your solution here


-- ============================================================
-- QUERY 4
-- Patients With the Same Diagnosis
-- ============================================================

-- Your solution here


-- ============================================================
-- QUERY 5
-- Doctors Above the Average of Completed Appointments
-- ============================================================

-- Your solution here
```

---

## Restrictions

For this challenge:

- Use only `SELECT` statements.
- Do not modify any tables.
- Do not insert new records.
- Do not update existing records.
- Do not delete records.
- Do not create new tables.
- Do not modify the database structure.
- Use the existing Hospital Management System database.
- Use nested queries in every solution.
- Do not manually calculate or hard-code the expected results.

---

## Query Quality Requirements

Your SQL should follow professional practices. Use:

- Meaningful table aliases.
- Clear indentation.
- Explicit column names.
- Appropriate `JOIN` conditions.
- Appropriate filtering conditions.
- Descriptive comments.
- Consistent formatting.

**Example:**

```sql
SELECT
    d.id_doctor,
    d.first_name_doctor,
    d.last_name_doctor
FROM doctor AS d
WHERE ...
```

Avoid unnecessarily complex queries when a simpler and more readable solution 
satisfies the requirement.

---

## Analysis Before Coding

Before writing each query, answer these questions:

1. What business rule am I trying to solve?
2. Which table contains the main entity?
3. Which tables contain the required information?
4. What relationships are required?
5. What information must be calculated?
6. What information must be compared?
7. What should the nested query return?
8. How will the outer query use the nested result?

---

## Expected Learning Outcome

At the end of this challenge, you should be able to take a business 
requirement such as:

> "Find doctors who have more completed appointments than the average doctor."

and transform it into a structured SQL solution using relational thinking, 
aggregation, joins, and nested queries.

The objective is not only to make the query execute successfully, but to 
**understand why the query works** and how it represents the business rule.