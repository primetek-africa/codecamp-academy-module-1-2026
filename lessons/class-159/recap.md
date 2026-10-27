# MongoDB First Project — Class Recap

> University Database (`university_db`) — Students & Courses
> This document was generated from our live `mongosh` session so that
> anyone who missed class (or wants to review) can catch up and follow
> along with the exact commands we ran, in order, including the
> mistakes we made and what they taught us.

---

## 1. Connecting to MongoDB with `mongosh`

We started by opening a shell connection to a local MongoDB server:

```bash
mongosh
```

This connects to `mongodb://127.0.0.1:27017` by default. The shell
told us three important things on startup:

- The MongoDB **server version** (`8.3.7`) and **mongosh version**
  (`2.9.2`).
- A **security warning**: access control was not enabled, meaning
  anyone on the machine could read/write data. In a real project we
  must enable authentication before going to production.
- The default database when you connect is `test`.

### Key commands

| Command       | What it does                                   |
|---------------|-------------------------------------------------|
| `db`          | Shows the database you are currently using      |
| `show dbs`    | Lists all databases on the server                |
| `use <name>`  | Switches to (or creates) a database              |

```javascript
db
// "test"

show dbs
// admin, config, local, university_db, ...

use university_db
// switched to db university_db
```

**Concept:** MongoDB does not "create" a database or collection with
a command the way SQL does with `CREATE DATABASE`. A database and its
collections are created **implicitly**, the first time you insert a
document into them. This is important — we will see it cause a
mistake later in the class.

---

## 2. Collections and Documents

A **collection** in MongoDB is the equivalent of a "table" in a
relational database, but it does not enforce a fixed schema — each
**document** (the equivalent of a "row") can have different fields.

```javascript
db.students.find()
```

This returns every document in the `students` collection. In our
first `find()`, we noticed the collection already had messy,
inconsistent data left over from a previous exercise:

- A document with **only** an `_id` and nothing else.
- A document using `pogram` instead of `program` (typo).
- Two documents that look like **login credentials**, not
  **students** (`nickname`, `password`, `fullName`, `phoneNumber`).
  These do not belong in a `students` collection.

**Lesson:** Because MongoDB is schema-flexible, it will happily store
whatever you insert. It is the developer's job — not the database's —
to keep documents consistent within a collection.

---

## 3. Dropping a Collection

To clean up and start fresh, we removed the entire collection:

```javascript
db.students.drop()
// true
```

`drop()` deletes the collection and **all of its documents and
indexes**. After running it, `db.students.find()` returned nothing,
because the collection no longer existed (it gets re-created
automatically on the next insert).

⚠️ **Warning:** `drop()` is irreversible. There is no confirmation
prompt, so always double-check which collection you are dropping.

---

## 4. Creating Documents — `insertOne()`

We rebuilt the `students` collection one document at a time using
`insertOne()`.

### 4.1 A simple, flat document

```javascript
db.students.insertOne({
  studentId: "STU-0001",
  firstName: "Bruce",
  lastName: "wayne",
  age: 21,
  program: "Software Development"
})
```

Result:

```javascript
{ acknowledged: true, insertedId: ObjectId('...') }
```

- `acknowledged: true` confirms the write was accepted by the server.
- `insertedId` is the auto-generated `_id` (a `ObjectId`) MongoDB
  assigns when you do not provide one yourself.

### 4.2 A document with a field name typo

```javascript
db.students.insertOne({
  studentId: "STU-0002",
  firstName: "Cristian",
  lastName: "Camilo",
  age: 28,
  pogram: "Aerospace engineering",   // should be "program"
  nationality: "Colombian"
})
```

This insert **succeeds** — MongoDB does not validate field names
against a schema by default. The document was saved with a field
literally called `pogram`, which will not show up if you later query
by `program`. This is a real-world reminder to **double-check field
names**, especially in an unstructured database.

### 4.3 The collection-name typo mistake — `stundets` vs `students`

```javascript
db.stundets.insertOne({
  phoneNumber: "+57 3195043571",
  address: "Street 12 # 3 - 45",
  city: "Cali",
  fullName: "Tony Stark",
  dateOfBirth: "1999-08-14"
})
```

Because we misspelled the collection name (`stundets` instead of
`students`), MongoDB did **not** raise an error. Instead, it silently
created a **brand-new collection** called `stundets` and inserted the
document there. Running `db.students.find()` afterward did not show
this document, because it was never in the `students` collection.

We confirmed this later with:

```javascript
show collections
// courses
// students
// stundets   <-- the accidental collection
```

**Lesson:** In MongoDB, a typo in a collection name is not a syntax
error — it is a *silent* data-modeling error. Always confirm your
collection name with `show collections` if a document seems to be
missing.

### 4.4 Documents with nested objects and arrays

MongoDB documents can nest objects and arrays directly, which is one
of its biggest advantages over relational tables (no separate "join"
table needed for one-to-many data like phone numbers).

```javascript
db.students.insertOne({
  studentId: "STU-004",
  firstName: "Danna",
  lastName: "Smith",
  email: "danna.smith@email.com",
  age: 23,
  address: {
    street: "Main Street 25",
    city: "Madrid",
    country: "Spain"
  },
  phones: [
    { type: "mobile", number: "+47231433212" },
    { type: "home", number: "+4732143543433" }
  ],
  program: "Data science"
})
```

- `address` is an **embedded document** (an object inside a field).
- `phones` is an **array of embedded documents**, letting one student
  have multiple phone numbers without a separate collection.

We repeated the same pattern for a second student (`STU-005`,
`John Doe`).

### 4.5 Duplicate inserts

Later in the session we accidentally ran the same `insertOne()` for
`STU-005` **three times in a row**. Because we did not provide our
own `_id`, MongoDB generated a new unique `ObjectId` each time and
happily inserted three near-identical documents.

**Lesson:** MongoDB will not stop you from inserting "duplicate"
data unless you explicitly create a **unique index** on a field
(for example, `studentId`). We will cover indexes in a future class.

---

## 5. Reading Documents — `find()`

```javascript
db.students.find()
```

With no arguments, `find()` returns **every** document in the
collection as an array (technically a cursor that mongosh prints
automatically). We used this constantly after every write to verify
the result.

---

## 6. Deleting Documents

### 6.1 The deprecated `remove()`

```javascript
db.students.remove()
```

This produced two errors:

1. A **deprecation warning** — `remove()` is an old method kept only
   for backward compatibility.
2. A **missing argument error** — even the deprecated method still
   requires a filter (an empty `remove()` is not allowed, unlike
   `deleteMany({})` which *can* target every document).

**Takeaway:** Use the modern methods instead:

| Method                | Deletes                                   |
|------------------------|-------------------------------------------|
| `deleteOne(filter)`    | The first document matching the filter    |
| `deleteMany(filter)`   | All documents matching the filter         |
| `findOneAndDelete(filter)` | The first match, and **returns** it   |

### 6.2 `deleteOne()` by a field value

```javascript
db.students.deleteOne({ fullName: 'Tony Stark' })
// { acknowledged: true, deletedCount: 1 }
```

### 6.3 `deleteOne()` by `_id`

```javascript
db.students.deleteOne({ _id: ObjectId('6a8ef0dac45cb41e8be43f20') })
```

Deleting by `_id` is the safest option, since `_id` is always unique.

### 6.4 `deleteMany()` with a query operator

```javascript
db.students.deleteMany({ address: { $exists: false } })
// { acknowledged: true, deletedCount: 2 }
```

`$exists: false` matches every document that does **not** have an
`address` field at all. This is how we cleaned out the two leftover
"login credential" documents that never should have been in the
`students` collection.

### 6.5 `findOneAndDelete()`

```javascript
db.students.findOneAndDelete({ fullName: 'Tony Stark' })
```

Unlike `deleteOne()`, this method **returns the deleted document**
itself instead of just a summary, which is useful when you need to
know exactly what was removed (for example, to log it or show it to
a user).

```javascript
db.students.findOneAndDelete({ studentId: 'STU-0001' })
```

⚠️ Method names are **case-sensitive**. We tried
`db.students.findoneAndDelete(...)` (lowercase "o") and `findAndDelete`
first, and both threw `TypeError: ... is not a function`. Always use
the exact camelCase spelling: `findOneAndDelete`.

---

## 7. Updating Documents — `updateOne()`

`updateOne()` takes two arguments: a **filter** (which document to
update) and an **update operator** (what to change).

### 7.1 The positional operator `$` — and why it failed

We first tried to update an item **inside an array** using the
positional operator:

```javascript
db.students.updateOne(
  { studentId: 'STU-004', program: 'Data science' },
  { $set: {
      'enrollments.$.grade': 4.5,
      'enrollments.$.status': 'Completed'
  } }
)
```

This failed with:

```
MongoServerError: Plan executor error during update ::
caused by :: The positional operator did not find the
match needed from the query.
```

**Why it failed:** The `$` positional operator only works when your
**filter itself matches an element inside the array** (for example,
`{ 'enrollments.grade': 4.5 }`). Our filter matched the student
document, not any element inside an `enrollments` array — and in
fact, `enrollments` did not exist on that document yet at all. You
cannot use `$` to update an element that isn't there.

### 7.2 Adding a new array with `$push`

To create the array first, we used `$push`, which appends a value to
an array field (creating the array if it does not exist yet):

```javascript
db.students.updateOne(
  { studentId: 'STU-004', program: 'Data science' },
  { $push: {
      enrollments: { grade: 4.5, status: 'Completed' }
  } }
)
```

Result:

```javascript
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

- `matchedCount` — how many documents matched the filter.
- `modifiedCount` — how many documents were actually changed.
- `upsertedCount` — would be `1` only if `upsert: true` had been set
  and no match was found (creating a new document instead).

After this, `enrollments` was correctly an **array**:

```javascript
enrollments: [ { grade: 4.5, status: 'Completed' } ]
```

### 7.3 A modeling mistake — `$set` on an object instead of an array

For the second student we used `$set` instead of `$push`:

```javascript
db.students.updateOne(
  { studentId: 'STU-005' },
  { $set: { enrollments: { grade: 0.0, status: 'in-course' } } }
)
```

This *succeeded*, but it stored `enrollments` as a plain **object**,
not an **array**:

```javascript
enrollments: { grade: 0, status: 'in-course' }
```

This is an important reminder that MongoDB will not stop you from
mixing data types across documents (one student has `enrollments` as
an array, the other as an object). In application code this
inconsistency would cause bugs. Always agree on a schema shape for
your team, even though MongoDB does not enforce one.

### 7.4 Updating nested fields with dot notation

Because `enrollments` on `STU-005` was an object (not an array), the
positional `$` operator was not applicable there either. Instead, we
used **dot notation** to target the nested fields directly:

```javascript
db.students.updateOne(
  { studentId: 'STU-005' },
  { $set: {
      'enrollments.grade': 3.5,
      'enrollments.status': 'Completed'
  } }
)
```

This worked, because `'enrollments.grade'` addresses a field **inside**
an embedded object — no array matching is needed.

**Rule of thumb:**

- `field.nestedField` → use for embedded **objects**.
- `field.$.nestedField` → use for embedded documents inside an
  **array**, and only when the filter matches an array element.

---

## 8. Syntax Pitfalls We Hit Along the Way

The shell also caught a few pure JavaScript syntax mistakes, which
are worth reviewing:

```javascript
db.students.updateOne(
  { studentId: 'STU-004', program: 'Data science' },
  { $set: { 'enrollments.$.grade': 4.5,
            'enrollments.$.status': 'Completed' } } }
)
```

```
SyntaxError: Unexpected token, expected "," (1:151)
```

This happened because of one **extra closing brace `}`**. In
JavaScript/MongoDB shell syntax, every `{` must have exactly one
matching `}` — always count your brackets, or better, write multi-
line commands so mismatches are easier to spot visually.

We also saw a `SyntaxError: Unexpected token (2:4)` after pressing
Enter on an incomplete line — the shell was still waiting for the
rest of a multi-line command when a new one was typed on top of it.
**Tip:** if the prompt changes from `university_db>` to `|`, the
shell is waiting for you to close a bracket or string; finish it or
press `Ctrl+C` to cancel.

---

## 9. Exploring the `courses` Collection

We also briefly inspected a second, related collection:

```javascript
show collections
// courses
// students
// stundets

db.courses.find()
```

Each course document embeds its own **instructor** as a nested
object:

```javascript
{
  courseId: 'CS1001',
  name: 'Introduction to NoSQL databases',
  credits: 3,
  instructor: {
    instructorId: 'INS-001',
    firstName: 'Clark',
    lastname: 'kent'
  },
  schedule: {
    day: 'Monday',
    startTime: '08:00',
    endTime: '11:00',
    classroom: 'LAB-101'
  },
  semester: 'IV'
}
```

Notice that other course documents in the same collection (`CS1002`,
`CS1003`, `CS1004`) only have `courseId`, `name`, and `semester` —
again demonstrating that MongoDB collections do not require every
document to share the same fields.

---

## 10. Summary Cheat Sheet

| Task                              | Command                                              |
|------------------------------------|-------------------------------------------------------|
| Show current database              | `db`                                                  |
| List all databases                 | `show dbs`                                            |
| Switch/create a database           | `use <dbName>`                                        |
| List collections in current DB     | `show collections`                                    |
| Show all documents                 | `db.<collection>.find()`                              |
| Insert one document                | `db.<collection>.insertOne({ ... })`                  |
| Delete first match                 | `db.<collection>.deleteOne({ ... })`                  |
| Delete all matches                 | `db.<collection>.deleteMany({ ... })`                 |
| Delete and return the document     | `db.<collection>.findOneAndDelete({ ... })`           |
| Update fields on first match       | `db.<collection>.updateOne(filter, { $set: {...} })`  |
| Append to an array field           | `db.<collection>.updateOne(filter, { $push: {...} })` |
| Update an item inside an array     | `{ $set: { 'arrayField.$.field': value } }`           |
| Update a field inside an object    | `{ $set: { 'objectField.field': value } }`            |
| Check a field does not exist       | `{ field: { $exists: false } }`                       |
| Delete an entire collection        | `db.<collection>.drop()`                              |

---

## 11. Common Mistakes Recap (What Went Wrong and Why)

1. **`db.students.remove()`** — deprecated and still requires a
   filter argument. Use `deleteOne`/`deleteMany` instead.
2. **Positional operator `$` with no array match** — the filter must
   match an *element inside the array*, not just the parent document.
3. **Collection name typo (`stundets`)** — MongoDB creates it as a
   brand-new, separate collection instead of throwing an error.
4. **Field name typo (`pogram`)** — saved successfully as its own,
   unintended field; no schema validation caught it.
5. **Inconsistent data shape** — `enrollments` ended up as an array
   on one student and an object on another, because two different
   update operators (`$push` vs `$set`) were used.
6. **Mismatched braces** — extra or missing `{`/`}` characters cause
   `SyntaxError`s; write multi-line commands to catch this visually.
7. **Case-sensitive method names** — `findoneAndDelete` and
   `findAndDelete` do not exist; the correct method is
   `findOneAndDelete`.
8. **Duplicate documents** — without a unique index, MongoDB allows
   the same "logical" record to be inserted multiple times.

---

## 12. Suggested Practice Before Next Class

- Re-run today's commands from scratch in a **new, empty** database
  to build muscle memory.
- Fix the `pogram` typo on `STU-0002` using `updateOne` and `$rename`
  (a new operator we have not covered yet — try to find it in the
  official MongoDB docs).
- Delete the extra duplicate `STU-005` documents so only one remains.
- Rename or drop the accidental `stundets` collection.
- Make `enrollments` consistent as an **array** on every student
  document, then practice using the positional `$` operator
  correctly to update a specific enrollment inside that array.

---

*Prepared as a class recap for students who missed the session, based*
*on the live `mongosh` transcript from the first MongoDB project.*