# MongoDB Code Challenge 1

## University Course Management System

In this challenge, you will continue working with the
**`university_db`** database and the `courses` collection.

The objective is to practice the MongoDB operations we have learned in class,
including inserting documents, deleting documents, and updating documents
using `$push` and `$set`.

You must complete all the operations using MongoDB Shell (`mongosh`).

## Requirements

Connect to MongoDB:

```bash
mongosh
```

Select the project database:

```javascript
use university_db
```

Before starting, verify the existing courses:

```javascript
db.courses.find()
```

Do not delete or modify the existing courses unless specifically required
by the challenge.

---

## Challenge 1 — Add Three Courses

Create **3 new course documents** in the `courses` collection.

Each course must contain at least the following fields:

* `courseId`
* `name`
* `semester`
* `credits`

Each course must have a **different `courseId`**.

For example, a course could have this structure:

```javascript
{
  courseId: "CS2001",
  name: "Data Structures",
  semester: "2026-2",
  credits: 4
}
```

You must add all three courses using:

```javascript
insertMany()
```

After inserting the courses, verify that they were created:

```javascript
db.courses.find()
```

---

## Challenge 2 — Delete One Course with `deleteOne()`

Choose **one of the three courses you created**.

Delete it using the:

```javascript
deleteOne()
```

method.

Your operation must use the `courseId` to identify the course.

For example:

```javascript
db.courses.deleteOne({
  courseId: "CS2001"
})
```

After deleting the course, verify that it no longer exists:

```javascript
db.courses.find({
  courseId: "CS2001"
})
```

The query should return no matching documents.

---

## Challenge 3 — Delete Another Course with

`findOneAndDelete()`

Choose **another course from the three courses you originally created**.

This time, delete it using:

```javascript
findOneAndDelete()
```

For example:

```javascript
db.courses.findOneAndDelete({
  courseId: "CS2002"
})
```

The operation must delete a different course from the one deleted in
Challenge 2.

After deleting it, verify that it no longer exists:

```javascript
db.courses.find({
  courseId: "CS2002"
})
```

At this point, you should have only **one of the three newly created courses**
remaining.

---

## Challenge 4 — Add a New Value Using `$push`

Now work with the **remaining course**.

First, select the course using its `courseId` and verify its current
information.

You must add a new field called:

```text
topics
```

The `topics` field must be an array containing at least two topics.

For example:

```javascript
{
  topics: [
    "Arrays",
    "Linked Lists"
  ]
}
```

Use the `$push` operator to add the topics.

The first topic should be added using:

```javascript
$push
```

Then add a second topic using `$push` again.

For example:

```javascript
db.courses.updateOne(
  {
    courseId: "CS2003"
  },
  {
    $push: {
      topics: "Arrays"
    }
  }
)
```

Then add another topic:

```javascript
db.courses.updateOne(
  {
    courseId: "CS2003"
  },
  {
    $push: {
      topics: "Linked Lists"
    }
  }
)
```

Verify the result:

```javascript
db.courses.findOne({
  courseId: "CS2003"
})
```

The course should now contain a `topics` array.

---

## Challenge 5 — Update an Existing Value Using `$set`

Finally, update an **existing field** in the remaining course.

You must use:

```javascript
$set
```

Choose one existing value and modify it.

For example, if the course currently contains:

```javascript
{
  credits: 3
}
```

change it to:

```javascript
{
  credits: 4
}
```

The operation should use:

```javascript
db.courses.updateOne(
  {
    courseId: "CS2003"
  },
  {
    $set: {
      credits: 4
    }
  }
)
```

You can choose another existing field instead, such as `name` or
`semester`.

Do not create a completely new field for this step. The objective is to
practice updating an **existing value** using `$set`.

---

## Final Verification

At the end of the challenge, verify the final state of the
`courses` collection:

```javascript
db.courses.find()
```

The three courses you initially created should have the following final
state:

```text
Course 1
    |
    └── Deleted with deleteOne()

Course 2
    |
    └── Deleted with findOneAndDelete()

Course 3
    |
    ├── Original information
    ├── topics array added with $push
    └── Existing value modified with $set
```

## Operations Required

Your solution must demonstrate all of the following:

```text
insertMany()
deleteOne()
findOneAndDelete()
updateOne()
$push
$set
find()
findOne()
```

## Learning Objective

The purpose of this challenge is to reinforce the difference between
MongoDB's **create, read, update, and delete operations**.

You should be able to explain:

* How `insertMany()` creates multiple documents.
* How `deleteOne()` removes a matching document.
* How `findOneAndDelete()` finds and removes a single document.
* How `$push` adds a new value to an array.
* How `$set` modifies an existing field value.
* How `find()` and `findOne()` are used to verify your operations.

Do not use operations or concepts that have not been covered in class.
