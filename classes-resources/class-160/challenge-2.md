# MongoDB Compass Code Challenge 2

## Student Collection: Filter Queries

### Objective

In this challenge, you will practice retrieving documents from the
`students` collection using the **Filter** bar in MongoDB Compass.

You must analyze the structure of the student documents and construct
MongoDB filter queries that satisfy each requirement.

The objective is to practice:

* Filtering documents by field values.
* Filtering nested fields.
* Using comparison operators.
* Using the `$in` operator.
* Using the `$or` operator.
* Working with nested arrays and objects.
* Combining multiple filtering conditions.

The student documents contain information such as:

* `studentId`
* `firstName`
* `lastName`
* `email`
* `age`
* `address`
* `phones`
* `program`
* `enrollments`

For nested fields, remember that MongoDB uses **dot notation**.

For example:

```text
address.country
```

---

## Instructions

For each challenge:

1. Open MongoDB Compass.
2. Open the database containing the `students` collection.
3. Select the `students` collection.
4. Use the **Filter** bar.
5. Write the MongoDB filter that satisfies the requirement.
6. Execute the query.
7. Review the returned documents.
8. Verify that every returned document satisfies the requirement.
9. Do not modify the documents in the collection.

Do **not** use aggregation pipelines for this activity.

Your solution for each exercise must be a MongoDB **filter query**.

---

# Challenge 1 — Students in Selected Programs

Find all students whose program is either:

* `Cybersecurity`
* `Artificial Intelligence`
* `Data Science`

### Requirements

Your query must:

* Use the `program` field.
* Use the `$in` operator.
* Return students enrolled in any of the three programs.
* Return the complete student documents.

### Expected skill

Practice filtering a field against multiple possible values.

### Your solution

```json
// Write your MongoDB filter here
```

---

# Challenge 2 — High-Achieving Students

Find all students who meet **both** of the following conditions:

* Their age is greater than `25`.
* Their enrollment grade is greater than `4.5`.

The grade is stored inside the `enrollments` array.

### Requirements

Your query must:

* Filter the `age` field.
* Filter the nested `enrollments.grade` field.
* Use the `$gt` comparison operator.
* Combine both conditions in the same query.

### Expected skill

Practice comparison operators and filtering nested array fields.

### Your solution

```json
// Write your MongoDB filter here
```

---

# Challenge 3 — Students from Specific Countries

Find all students whose address is located in one of the following
countries:

* `Colombia`
* `Brazil`
* `Mexico`
* `Argentina`

### Requirements

Your query must:

* Access the nested `address.country` field.
* Use the `$in` operator.
* Match students from any of the four countries.
* Not filter by city or program.

### Expected skill

Practice MongoDB dot notation with nested objects and `$in`.

### Your solution

```json
// Write your MongoDB filter here
```

---

# Challenge 4 — Students with Completed or Deferred Enrollment

Find all students whose enrollment status is either:

* `Completed`
* `Deferred`

### Requirements

Your query must:

* Access the nested `enrollments.status` field.
* Use the `$in` operator.
* Return students matching either status.
* Not filter based on their age, country, or program.

### Expected skill

Practice querying fields contained inside an array of embedded
documents.

### Your solution

```json
// Write your MongoDB filter here
```

---

# Challenge 5 — Advanced Combined Filter

Find students who satisfy **at least one** of the following conditions:

### Condition A

The student:

* Is enrolled in `Full Stack Web Development`.
* Has a grade greater than or equal to `4.5`.

### Condition B

The student:

* Is enrolled in `Cybersecurity`.
* Has an age less than `25`.

### Requirements

Your query must:

* Use the `$or` operator.
* Use `$and` conditions where necessary, or an equivalent MongoDB
  structure.
* Filter the `program` field.
* Filter the nested `enrollments.grade` field for Condition A.
* Filter the `age` field for Condition B.
* Correctly group the two alternatives.

### Expected skill

Practice combining logical and comparison operators to construct a
more advanced MongoDB filter.

### Your solution

```json
// Write your MongoDB filter here
```

---

# Submission Requirements

For each of the five challenges, submit:

1. The MongoDB filter query.
2. A screenshot of the results in MongoDB Compass.
3. The number of documents returned.
4. A brief explanation of how your query works.

Your explanation should identify the MongoDB operators used and explain
how the conditions are evaluated.

---

# Important Restrictions

For this challenge:

* Do not use aggregation pipelines.
* Do not modify the database.
* Do not use `updateOne()` or `updateMany()`.
* Do not delete any documents.
* Do not copy another student's queries.
* Use only MongoDB filter syntax supported by MongoDB Compass.

The purpose of this challenge is to demonstrate that you understand how
MongoDB filtering works, not simply that you can obtain a result.

---

# Learning Outcome

After completing this challenge, you should be able to construct
MongoDB Compass filters involving simple fields, nested documents,
embedded arrays, comparison operators, `$in`, `$or`, and combinations
of multiple conditions.

You should also be able to read a MongoDB document structure and
translate a real-world information requirement into an appropriate
MongoDB filter query.
