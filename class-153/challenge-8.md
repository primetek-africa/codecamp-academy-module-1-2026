# Code Challenge — PostgreSQL Views

## Airline Reservation System

Dear Students,

Today you will apply the concepts introduced in class about **PostgreSQL Views**.

The objective of this challenge is to create two reusable views based on the `airline_reservation_system` database.

You will create:

1. One **beginner-level view** focused on combining related information.
2. One **intermediate-level view** that introduces aggregation and business analysis.

The goal is not only to make the queries work, but also to practice writing SQL that is **clear, readable, reusable, and meaningful from a business perspective**.

---

## Challenge 01 — Beginner Level

### Passenger Information View

#### Business Scenario

The airline's customer service department frequently needs to consult basic passenger information.

Currently, employees would need to query the `passenger`, `gender`, and `country` tables separately to obtain all the information they need.

The development team wants to create a reusable database view that provides this information in a single query.

Your task is to create a view called:

`vw_passenger_information`

#### Requirements

The view must include the following information:

- Passenger ID
- Passport number
- Passenger's complete name
- Date of birth
- Gender
- Nationality
- Nationality ISO2 code
- Email address

The complete passenger name must be generated using `CONCAT()`.

The view must obtain the gender from the `gender` table and the nationality information from the `country` table.

#### Tables to Use

You should work with:

- `passenger`
- `gender`
- `country`

#### Expected Relationships

The relationships you need to identify are:

```text
passenger
    |
    +-- gender
    |
    +-- country
```

Use the appropriate `JOIN` operations to retrieve the related information.

#### View Requirements

Create the view using:

```sql
CREATE OR REPLACE VIEW
```

The resulting view should be queryable using:

```sql
SELECT *
FROM vw_passenger_information;
```

#### Additional Challenge

After creating the view, write another query that displays only passengers whose nationality is different from the United States.

Sort the results alphabetically by passenger name.

---

## Challenge 02 — Intermediate Level

### Flight Revenue Analysis View

#### Business Scenario

The airline management team wants to analyze the financial performance of each flight.

They need a reusable report that shows how many tickets were sold for each flight and how much revenue each flight generated.

Instead of repeatedly writing the required joins and aggregation logic, the development team wants this information to be available through a database view.

Your task is to create:

`vw_flight_revenue_analysis`

#### Requirements

The view must include:

- Flight ID
- Flight number
- Departure date
- Origin airport code
- Destination airport code
- Number of tickets sold
- Total revenue
- Average ticket price

The view must obtain the origin and destination airport codes from the `airport` table.

The number of tickets sold must be calculated using an aggregate function.

The total revenue must be calculated from the ticket prices.

The average ticket price must also be calculated using an aggregate function.

#### Tables to Use

You should work with:

- `flight`
- `airport`
- `reservation`
- `ticket`
- `payment_status`

#### Expected Relationships

The main relationship structure is:

```text
flight
   |
   +-- airport
   |
   +-- reservation
          |
          +-- ticket
                 |
                 +-- payment_status
```

You will need to determine how these tables should be joined based on the database structure.

#### Important Business Rule

Only tickets with the payment status **Paid** should contribute to the total revenue.

Tickets with other payment statuses must not be included in the revenue calculation.

You should use conditional aggregation with `CASE` to implement this business rule.

#### Aggregation Requirements

Your view must use:

- `COUNT()`
- `SUM()`
- `AVG()`
- `CASE`
- `GROUP BY`

The result should contain one row per flight.

#### Example Structure

Your final result should conceptually look similar to:

| Flight | Number | Date       | Origin | Destination | Sold | Revenue |
|--------|--------|------------|--------|-------------|------|---------|
| 1      | 1001   | 2026-08-01 | CLO    | BOG         | 5    | 895.00  |
| 2      | 1002   | 2026-08-01 | BOG    | CLO         | 4    | 710.00  |

The exact values will depend on your database.

#### Additional Challenge

After creating the view, write a query that identifies the top 5 flights with the highest revenue.

The result should display:

- Flight number
- Origin
- Destination
- Tickets sold
- Total revenue

Order the results from the highest revenue to the lowest.

---

## Deliverables

You must submit the SQL required to create both views.

Your submission should contain:

1. `vw_passenger_information`
2. `vw_flight_revenue_analysis`

For each view, include:

- The `CREATE OR REPLACE VIEW` statement.
- A `SELECT` statement demonstrating that the view works.
- The additional query requested in each challenge.

Your SQL should be properly formatted and use meaningful aliases.

---

## Technical Constraints

For this challenge:

- Do not modify the existing tables.
- Do not insert additional records.
- Do not create new tables.
- Do not use stored procedures or functions.
- Use PostgreSQL syntax.
- Use explicit `JOIN` conditions.
- Use meaningful column aliases.
- Use `GROUP BY` correctly in the intermediate view.
- Make sure the views can be queried independently after creation.

---

## What You Are Practicing

This challenge is designed to reinforce:

- `CREATE VIEW`
- `CREATE OR REPLACE VIEW`
- `SELECT`
- `JOIN`
- `LEFT JOIN`
- `CONCAT()`
- `COUNT()`
- `SUM()`
- `AVG()`
- `CASE`
- `GROUP BY`
- `ORDER BY`
- Conditional aggregation
- Business-oriented SQL

The first challenge focuses on building a simple reusable data representation.

The second challenge moves toward analytical views, where SQL is used not only to retrieve information but also to calculate meaningful business metrics.

---

## Success Criteria

Your solution is considered complete when:

- Both views are created successfully.
- Both views return meaningful results.
- The beginner view correctly combines passenger, gender, and nationality information.
- The intermediate view returns one row per flight.
- Revenue only includes tickets with `Paid` status.
- Ticket counts and financial calculations are correct.
- The requested additional queries work correctly.
- The SQL is readable and properly formatted.

---

## Recommendation

Do not immediately try to write the entire query at once.

First identify:

1. Which tables contain the required information.
2. How those tables are related.
3. Which columns must be displayed.
4. Which values need to be calculated.
5. Which business rules must be applied.
6. Which columns need to be included in `GROUP BY`.

Then build the query progressively and test each part before creating the final view.