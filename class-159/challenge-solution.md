# MongoDB Code Challenge 1 Solution

## University Course Management System

This solution demonstrates the required MongoDB operations using the
`university_db` database and the `courses` collection.

## Step 1 — Select the Database

```javascript
use university_db
```

Verify the current database:

```javascript
db
```

Expected result:

```text
university_db
```

## Step 2 — Add Three Courses

We create three new courses using `insertMany()`.

```javascript
db.courses.insertMany([
  {
    courseId: "CS2001",
    name: "Data Structures",
    semester: "2026-2",
    credits: 4
  },
  {
    courseId: "CS2002",
    name: "Operating Systems",
    semester: "2026-2",
    credits: 3
  },
  {
    courseId: "CS2003",
    name: "Software Engineering",
    semester: "2026-2",
    credits: 4
  }
])
```

Verify the courses:

```javascript
db.courses.find({
  courseId: {
    $in: ["CS2001", "CS2002", "CS2003"]
  }
})
```

---

## Step 3 — Delete One Course with `deleteOne()`

We delete the first course using its `courseId`.

```javascript
db.courses.deleteOne({
  courseId: "CS2001"
})
```

Expected result:

```text
{
  acknowledged: true,
  deletedCount: 1
}
```

Verify that the course was deleted:

```javascript
db.courses.findOne({
  courseId: "CS2001"
})
```

The result should be:

```text
null
```

---

## Step 4 — Delete Another Course with

`findOneAndDelete()`

We delete the second course using `findOneAndDelete()`.

```javascript
db.courses.findOneAndDelete({
  courseId: "CS2002"
})
```

MongoDB returns the document that was deleted.

Verify that it no longer exists:

```javascript
db.courses.findOne({
  courseId: "CS2002"
})
```

The result should be:

```text
null
```

At this point, only `CS2003` from the three newly created courses should
remain.

---

## Step 5 — Add a Value Using `$push`

First, verify the remaining course:

```javascript
db.courses.findOne({
  courseId: "CS2003"
})
```

Now use `$push` to add the first topic to the `topics` array.

```javascript
db.courses.updateOne(
  {
    courseId: "CS2003"
  },
  {
    $push: {
      topics: "Software Design"
    }
  }
)
```

Add another topic using `$push`:

```javascript
db.courses.updateOne(
  {
    courseId: "CS2003"
  },
  {
    $push: {
      topics: "Design Patterns"
    }
  }
)
```

Verify the document:

```javascript
db.courses.findOne({
  courseId: "CS2003"
})
```

The document should now contain:

```javascript
{
  courseId: "CS2003",
  name: "Software Engineering",
  semester: "2026-2",
  credits: 4,
  topics: [
    "Software Design",
    "Design Patterns"
  ]
}
```

The `$push` operator adds a new value to an array.

---

## Step 6 — Update an Existing Value Using `$set`

Now modify an existing field.

The course currently has:

```javascript
credits: 4
```

Change the number of credits to `5` using `$set`.

```javascript
db.courses.updateOne(
  {
    courseId: "CS2003"
  },
  {
    $set: {
      credits: 5
    }
  }
)
```

Verify the change:

```javascript
db.courses.findOne({
  courseId: "CS2003"
})
```

The final document should look similar to:

```javascript
{
  courseId: "CS2003",
  name: "Software Engineering",
  semester: "2026-2",
  credits: 5,
  topics: [
    "Software Design",
    "Design Patterns"
  ]
}
```

## Step 7 — Final Verification

Display all courses:

```javascript
db.courses.find()
```

You can also verify the remaining course directly:

```javascript
db.courses.findOne({
  courseId: "CS2003"
})
```

The final state of the three courses should be:

```text
CS2001
    |
    └── Deleted with deleteOne()

CS2002
    |
    └── Deleted with findOneAndDelete()

CS2003
    |
    ├── Created with insertMany()
    ├── topics added with $push
    └── credits updated with $set
```

## Operations Practiced

This challenge demonstrates:

```text
insertMany()
find()
findOne()
deleteOne()
findOneAndDelete()
updateOne()
$push
$set
```

The most important distinction in this exercise is:

```text
$push
    ↓
Adds a value to an array

$set
    ↓
Creates or modifies a field
```

For example:

```javascript
$push: {
  topics: "Design Patterns"
}
```

adds a value to an array, while:

```javascript
$set: {
  credits: 5
}
```

modifies the value of a field.
