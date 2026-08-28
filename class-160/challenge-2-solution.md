# MongoDB Compass Code Challenge — Solutions

## Challenge 2 — Students in Selected Programs

Find students enrolled in Cybersecurity, Artificial Intelligence, or Data Science.

```json
{
  "program": {
    "$in": [
      "Cybersecurity",
      "Artificial Intelligence",
      "Data Science"
    ]
  }
}
```

**Explanation**
The `$in` operator checks whether the `program` field matches at least one value
 from the specified list.

---

## Challenge 2 — High-Achieving Students

Find students who are older than 25 and have an enrollment grade greater than 4.5.

```json
{
  "age": {
    "$gt": 25
  },
  "enrollments.grade": {
    "$gt": 4.5
  }
}
```

**Explanation**
When multiple fields are included in the same MongoDB filter, MongoDB applies an 
implicit AND between the conditions. Therefore, both conditions must be satisfied:
- `age > 25`
- AND `enrollments.grade > 4.5`

---

## Challenge 3 — Students from Specific Countries

Find students whose country is Colombia, Brazil, Mexico, or Argentina.

```json
{
  "address.country": {
    "$in": [
      "Colombia",
      "Brazil",
      "Mexico",
      "Argentina"
    ]
  }
}
```

**Explanation**
The query uses dot notation to access the `country` field inside the `address` 
object. The `$in` operator then checks whether the country matches one of the 
specified values.

---

## Challenge 4 — Completed or Deferred Enrollment

Find students who have an enrollment with a status of Completed or Deferred.

```json
{
  "enrollments.status": {
    "$in": [
      "Completed",
      "Deferred"
    ]
  }
}
```

**Explanation**
MongoDB allows us to query fields inside embedded documents stored in arrays 
using dot notation. The query returns students where at least one enrollment has 
a status of either Completed or Deferred.

---

## Challenge 5 — Advanced Combined Filter

Find students who satisfy either of the following conditions:
- Full Stack Web Development with a grade of at least 4.5.
- Cybersecurity with an age below 25.

```json
{
  "$or": [
    {
      "enrollments.program": "Full Stack Web Development",
      "enrollments.grade": {
        "$gte": 4.5
      }
    },
    {
      "enrollments.program": "Cybersecurity",
      "age": {
        "$lt": 25
      }
    }
  ]
}
```

**Explanation**
The `$or` operator allows us to define alternative conditions.

The first condition requires:
- `program = Full Stack Web Development`
- AND `grade >= 4.5`

The second condition requires:
- `program = Cybersecurity`
- AND `age < 25`

A student is returned when either condition is satisfied.

### Advanced Solution Using `$elemMatch`

If `enrollments` is an array of embedded documents, `$elemMatch` can ensure that 
the `program` and `grade` belong to the same enrollment.

```json
{
  "$or": [
    {
      "enrollments": {
        "$elemMatch": {
          "program": "Full Stack Web Development",
          "grade": {
            "$gte": 4.5
          }
        }
      }
    },
    {
      "enrollments": {
        "$elemMatch": {
          "program": "Cybersecurity"
        }
      },
      "age": {
        "$lt": 25
      }
    }
  ]
}
```

This version is more precise when querying multiple fields within the same 
embedded document.

---

## MongoDB Operators Practiced

| Challenge | Operators / Concepts |
|---|---|
| 1 | `$in` |
| 2 | `$gt`, dot notation |
| 3 | `$in`, dot notation |
| 4 | `$in`, arrays, dot notation |
| 5 | `$or`, `$gte`, `$lt` |
| Advanced | `$or`, `$elemMatch`, `$gte`, `$lt` |