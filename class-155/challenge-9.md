# Stored procedures - Challenge 9: Register a New Pilot

## Introduction

In today's lesson, we introduced **Stored Procedures in PostgreSQL** and
created our first procedure, `sp_register_passenger`, using the
**Airline Reservation System** database.

Now it is your turn to create a new stored procedure independently.

The objective of this challenge is to practice the fundamental concepts
introduced today while applying them to a different entity in the database.

## Challenge

Create a PostgreSQL stored procedure named:

```sql
sp_register_pilot
```

The procedure must register a new pilot in the `pilot` table.

Your procedure should receive the information required to create a pilot,
validate the input data, verify that the pilot does not already exist, and
insert the new record into the database.

## Requirements

Your procedure must:

1. Receive the following information as parameters:

   * Employee number
   * First name
   * Last name
   * Date of birth
   * Gender ID
   * License number
   * Email

2. Validate the employee number using this format:

```text
PIL-001
PIL-002
PIL-1001
```

Use the following regular expression:

```regex
^PIL-[0-9]{3,}$
```

3. Validate the pilot license number using this format:

```text
LIC-INT-1001
LIC-USA-2002
LIC-AB-1234
```

Use the following regular expression:

```regex
^LIC-[A-Z]{2,4}-[0-9]{3,}$
```

4. Validate the email format using a regular expression.

Use the following regular expression:

```regex
^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$
```

5. Verify that the employee number does not already exist.

6. Verify that the license number does not already exist.

7. Verify that the email does not already exist.

8. If any validation or business rule fails, raise a clear exception using
   `RAISE EXCEPTION`.

9. Insert the new pilot into the `pilot` table.

10. Return the generated pilot ID using an `OUT` parameter.

## Expected Procedure Structure

Your procedure should use the PostgreSQL concepts introduced in today's
lesson, including:

* `CREATE OR REPLACE PROCEDURE`
* `IN` parameters
* `OUT` parameters
* `DECLARE`
* Variables and constants
* `IF`
* `EXISTS`
* Regular expressions with `~`
* `RAISE EXCEPTION`
* `INSERT ... RETURNING`
* `LANGUAGE plpgsql`

## Example Execution

After creating your procedure, test it with at least two different pilots.

For example:

```sql
CALL sp_register_pilot(
    'PIL-101',
    'James',
    'Anderson',
    '1985-07-14',
    1,
    'LIC-USA-1001',
    'james.anderson@email.com',
    NULL
);
```

Create a second test case using different information.

Then test at least three invalid scenarios, such as:

* An invalid employee number.
* A duplicated license number.
* A duplicated email address.

## Objective

The goal of this challenge is **not to copy `sp_register_passenger` and
simply change the table name**.

You should analyze the `pilot` table, identify its required fields,
determine which values need validation, and design the procedure yourself.

This exercise will help you understand how stored procedures can be used to
implement reusable business rules directly inside a PostgreSQL database.
