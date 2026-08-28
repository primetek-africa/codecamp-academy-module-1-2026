# Code Challenge 8: PostgreSQL Views

## Airline Reservation System

Dear Students,

For this new challenge you will create **two views that are different from
the ones we've already built** (`vw_flight_details`, `vw_passenger_profiles`,
`vw_flight_occupancy`, `vw_passenger_travel_history`, `vw_flight_revenue`).

This time the focus shifts to two entities we haven't built a dedicated
view for yet: **airports** and **pilots**.

You will create:

1. A **beginner-level view** that builds a full airport directory with its
   location hierarchy.
2. An **intermediate/advanced-level view** that summarizes each pilot's
   flight activity.

As always, the goal is not only to make the queries work, but to write SQL
that is **clear, readable, reusable, and meaningful from a business
perspective**.

---

## Beginner Level

### Airport Directory View

#### Business Scenario

The route-planning team currently has to look up an airport's city,
department, and country in three separate queries every time they want to
evaluate a new route.

They want a single reusable view that lists every airport in the system
together with its full location hierarchy, so they can filter and sort
airports by country or department without repeating the joins each time.

Your task is to create a view called:

`vw_airport_directory`

#### Requirements

The view must include:

- Airport ID
- Airport code
- Airport name
- City name
- Department name
- Country name
- Country ISO2 code

The result should be ordered alphabetically by airport name.

#### Tables to Use

- `airport`
- `city`
- `department`
- `country`

#### Expected Relationships

```text
airport
   |
   +-- city
          |
          +-- department
                 |
                 +-- country
```

This is a straight join chain — unlike `vw_flight_details`, you only need
each table **once** here, so no aliasing tricks are required.

#### View Requirements

```sql
CREATE OR REPLACE VIEW vw_airport_directory AS ...
```

The resulting view should be queryable using:

```sql
SELECT *
FROM vw_airport_directory;
```

#### Additional Challenge

Write a query against the view that returns only airports **located
outside** a country of your choice, sorted alphabetically by airport name.

---

## Intermediate / Advanced Level

### Pilot Flight Summary View

#### Business Scenario

Flight operations management wants a performance and activity summary for
every pilot: how many flights they've been assigned in total, how many of
those flights actually completed, how many were cancelled, and which
aircraft brands they have experience flying.

Pilots who haven't been assigned to any flight yet should still appear in
the report, with a count of zero.

Your task is to create a view called:

`vw_pilot_flight_summary`

#### Requirements

The view must include:

- Pilot ID
- Employee number
- License number
- Complete pilot name (via `CONCAT()`)
- Total number of flights assigned
- Number of **completed** flights
- Number of **cancelled** flights
- A comma-separated list of the **distinct aircraft brands** the pilot has
  flown

#### Tables to Use

- `pilot`
- `flight`
- `flight_status`
- `aircraft`
- `aircraft_brand`

#### Expected Relationships

```text
pilot
   |
   +-- flight (LEFT JOIN)
          |
          +-- flight_status
          |
          +-- aircraft
                 |
                 +-- aircraft_brand
```

Use `LEFT JOIN` from `pilot` to `flight` so that pilots with no assigned
flights still appear in the results, with all counts at 0.

#### Important Business Rule

- A flight only counts toward "completed flights" if its status is
  `Completed`.
- A flight only counts toward "cancelled flights" if its status is
  `Cancelled`.

Use conditional aggregation with `CASE` inside `COUNT()` to implement both
rules — do not use `WHERE` to filter by status, since that would drop
pilots whose flights don't match and break the "show every pilot" rule.

#### Aggregation Requirements

Your view must use:

- `COUNT()`
- `CASE`
- `STRING_AGG()` with `DISTINCT`, to list aircraft brands without
  duplicates
- `GROUP BY`
- `LEFT JOIN`

The result should contain one row per pilot, ordered by total flights
assigned, from highest to lowest.

#### View Requirements

```sql
CREATE OR REPLACE VIEW vw_pilot_flight_summary AS ...
```

```sql
SELECT *
FROM vw_pilot_flight_summary;
```

#### Additional Challenge

Write a query against the view that returns only pilots who have flown
**more than one distinct aircraft brand**.

---

## Deliverables

You must submit the SQL required to create both views.

Your submission should contain:

1. `vw_airport_directory`
2. `vw_pilot_flight_summary`

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
- Use explicit `JOIN` and `LEFT JOIN` conditions.
- Use meaningful column and table aliases.
- Use `GROUP BY` correctly in the pilot summary view.
- Make sure both views can be queried independently after creation.

---

## What You Are Practicing

This challenge is designed to reinforce:

- `CREATE VIEW` / `CREATE OR REPLACE VIEW`
- `SELECT`, `JOIN`, `LEFT JOIN`
- Multi-level join chains through a single path (no repeated tables)
- `CONCAT()`
- `COUNT()`, `CASE` for conditional aggregation
- `STRING_AGG()` with `DISTINCT` for aggregating text values
- `GROUP BY`, `ORDER BY`
- Preserving rows with no matching child records via `LEFT JOIN`
- Business-oriented SQL

---

## Success Criteria

Your solution is considered complete when:

- Both views are created successfully.
- Both views return meaningful results.
- `vw_airport_directory` correctly resolves the full location hierarchy
  for every airport.
- `vw_pilot_flight_summary` returns **every** pilot, including those with
  zero assigned flights.
- Completed and cancelled flight counts are calculated using `CASE`, not
  `WHERE`.
- Aircraft brands are listed without duplicates.
- The requested additional queries work correctly.
- The SQL is readable and properly formatted.

---

## Recommendation

Do not immediately try to write the entire query at once.

For each view, first identify:

1. Which tables contain the required information.
2. How those tables are related, and whether the join chain is linear or
   branches out.
3. Which columns must be displayed.
4. Which values need to be calculated or aggregated.
5. Which business rules must be applied — and whether they belong in a
   `WHERE` clause or inside a `CASE` expression.
6. Whether any join needs to be a `LEFT JOIN` to avoid losing valid rows.
7. Which columns need to be included in `GROUP BY`.

Then build the query progressively and test each part before creating the
final view.