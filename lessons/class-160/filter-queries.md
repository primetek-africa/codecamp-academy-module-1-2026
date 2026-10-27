# MongoDB Compass: Practical Filter Queries

## Introduction

MongoDB Compass provides a graphical interface for working with MongoDB
databases and collections. One of its most useful features is the
**Filter** bar, which allows us to retrieve specific documents by defining
query conditions.

In this practice, we will work with a **professor dataset** and use
MongoDB query operators such as `$in`, `$gt`, `$lt`, `$regex`, and `$or`.

The following filters can be copied directly into the **Filter** bar in
MongoDB Compass.

---

## 1. Find Tenured Full Professors

### Objective

Find professors who have reached the highest academic rank and have
secured tenure.

### Filter

```json
{ "Academic_Rank": "Full Professor", "Tenure_Status": "Tenured" }
```

### Concepts

This query demonstrates how to combine multiple conditions in a single
MongoDB filter.

MongoDB uses an implicit **AND** when multiple fields are specified in
the same query document.

The query therefore requires both conditions to be true:

* `Academic_Rank` must be `"Full Professor"`.
* `Tenure_Status` must be `"Tenured"`.

### Equivalent SQL

```sql
SELECT *
FROM professor
WHERE Academic_Rank = 'Full Professor'
  AND Tenure_Status = 'Tenured';
```

---

## 2. Find High-Earning Faculty in STEM Departments

### Objective

Find professors who work in either **Computer Science** or **Physics**
and earn more than `$120,000`.

### Filter

```json
{
  "Department": {
    "$in": ["Computer Science", "Physics"]
  },
  "Salary": {
    "$gt": 120000
  }
}
```

### Concepts

This query introduces two important MongoDB operators.

**`$in`**

The `$in` operator matches documents where a field contains one of the
specified values.

```json
{ "Department": { "$in": ["Computer Science", "Physics"] } }
```

**`$gt`**

The `$gt` operator means **greater than**.

```json
{ "Salary": { "$gt": 120000 } }
```

Both conditions must be satisfied because they are defined together.

### Equivalent SQL

```sql
SELECT *
FROM professor
WHERE Department IN ('Computer Science', 'Physics')
  AND Salary > 120000;
```

---

## 3. Find Experienced Faculty Hired Before 2005

### Objective

Identify professors who were hired before the year 2005.

### Filter

```json
{ "Hire_Year": { "$lt": 2005 } }
```

### Concepts

This query uses the `$lt` operator.

**`$lt`** means **less than**.

Therefore:

```json
{ "Hire_Year": { "$lt": 2005 } }
```

matches documents where `Hire_Year` is earlier than `2005`.

This is useful for analyzing faculty experience based on hiring dates.

### Equivalent SQL

```sql
SELECT *
FROM professor
WHERE Hire_Year < 2005;
```

---

## 4. Find Professors Located in the Science Center

### Objective

Find professors whose office is located inside the
**Science Center** building.

### Filter

```json
{
  "Office_Location": {
    "$regex": "^Science Center"
  }
}
```

### Concepts

This query introduces MongoDB's `$regex` operator, which allows us to
search for values that match a regular expression pattern.

The expression:

```text
^Science Center
```

means that the value must **start with** `"Science Center"`.

For example, it can match values such as:

```text
Science Center - Room 201
Science Center - Room 305
Science Center Building - Office 12
```

The `^` character is important because it specifies the beginning of the
string.

### Equivalent SQL

```sql
SELECT *
FROM professor
WHERE Office_Location LIKE 'Science Center%';
```

---

## 5. Find Non-Tenure Track or Adjunct Faculty

### Objective

Find professors who satisfy at least one of the following conditions:

1. Their tenure status is `"Non-Tenure Track"`.
2. Their academic rank is `"Adjunct Professor"`.

### Filter

```json
{
  "$or": [
    {
      "Tenure_Status": "Non-Tenure Track"
    },
    {
      "Academic_Rank": "Adjunct Professor"
    }
  ]
}
```

### Concepts

This query introduces the `$or` logical operator.

The `$or` operator returns documents when **at least one** of the
specified conditions is true.

The structure is:

```json
{
  "$or": [
    { "condition1": "value1" },
    { "condition2": "value2" }
  ]
}
```

Therefore, a professor will be returned if they are:

* Non-tenure track, **OR**
* An adjunct professor.

A professor can also satisfy both conditions and still be included.

### Equivalent SQL

```sql
SELECT *
FROM professor
WHERE Tenure_Status = 'Non-Tenure Track'
   OR Academic_Rank = 'Adjunct Professor';
```

---

# MongoDB Operators Practiced

The five exercises introduce several fundamental MongoDB query
operators.

| Operator | Purpose                                               |
| -------- | ----------------------------------------------------- |
| `$in`    | Matches any value from a specified list               |
| `$gt`    | Matches values greater than a specified value         |
| `$lt`    | Matches values less than a specified value            |
| `$regex` | Matches values using a regular expression             |
| `$or`    | Matches documents when at least one condition is true |

These operators are fundamental when building more advanced MongoDB
queries.

---

# MongoDB Compass Practice Workflow

For each exercise:

1. Open **MongoDB Compass**.
2. Connect to your MongoDB deployment.
3. Open the database containing the professor collection.
4. Select the professor collection.
5. Locate the **Filter** field.
6. Paste the corresponding MongoDB query.
7. Click **Find**.
8. Analyze the returned documents.
9. Identify which fields caused each document to match the filter.

---

# Practice Challenge

After completing the five filters, create **five additional filters**
without copying the examples directly.

Your new queries should include:

1. A query using `$in`.
2. A query using `$gt` or `$lt`.
3. A query using `$regex`.
4. A query using `$or`.
5. A query combining at least two different operators.

For each query, write a short explanation describing:

* What information the query is looking for.
* Which MongoDB operators are being used.
* Why each document is returned.
* The equivalent SQL query, if applicable.

## Learning Objective

By completing this practice, you should be able to construct MongoDB
Compass filters using comparison operators, logical operators, lists of
possible values, and regular expressions.

The goal is not only to memorize MongoDB syntax, but to understand how
these operators can be combined to answer real-world questions from a
NoSQL database.
