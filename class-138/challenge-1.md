# Code Challenge 1: Insert Data into the Library Database

## Objective

In this challenge, you will practice inserting records into an existing
PostgreSQL database using the `INSERT INTO` statement.

You will work with the **member** and **loan** tables of the
**Library Management System** project.

---

## Scenario

The library has recently registered several new members, and some of
them have already borrowed books.

Your task is to insert the new members into the database and then record
their corresponding book loans.

---

## Requirements

### Part 1 - Insert Members

Insert the following **five members** into the `member` table.

| First Name | Last Name | Email | Phone |
|------------|-----------|-------|-------|
| Olivia | Martinez | olivia.martinez@email.com | 555-2001 |
| Ethan | Walker | ethan.walker@email.com | 555-2002 |
| Isabella | Hall | isabella.hall@email.com | 555-2003 |
| Liam | Young | liam.young@email.com | 555-2004 |
| Mia | Allen | mia.allen@email.com | 555-2005 |

Do **not** insert values for:

- `id`
- `created_at`

These fields are generated automatically.

---

### Part 2 - Insert Loans

After inserting the members, register the following book loans.

| Member ID | Book ID | Loan Date | Return Date |
|-----------|----------|------------|-------------|
| 6 | 2 | 2026-08-01 | NULL |
| 7 | 5 | 2026-08-02 | NULL |
| 8 | 1 | 2026-08-03 | 2026-08-10 |
| 9 | 4 | 2026-08-04 | NULL |
| 10 | 3 | 2026-08-05 | 2026-08-12 |

Do **not** insert values for:

- `id`
- `created_at`

These fields are generated automatically.

---

## Expected Deliverables

Create a SQL script named:

```text
insert_data.sql
```

The script must contain:

- Five `INSERT` statements (or one multi-row `INSERT`) for the
  `member` table.
- Five `INSERT` statements (or one multi-row `INSERT`) for the `loan`
  table.

---

## Verification

After inserting the records, execute the following queries to verify
that the data was inserted successfully.

```sql
SELECT * FROM member;
```

```sql
SELECT * FROM loan;
```

---

## Challenge Rules

- Use only SQL.
- Do not modify the table structure.
- Do not manually assign values to identity columns.
- Ensure that every loan references an existing member and an existing
  book.
- Verify your results before submitting.

---

## Learning Objectives

By completing this challenge, you will practice:

- Writing `INSERT INTO` statements.
- Inserting multiple records.
- Working with automatically generated identity columns.
- Understanding relationships between tables.
- Maintaining data integrity in a relational database.
- Verifying inserted data using `SELECT` queries.