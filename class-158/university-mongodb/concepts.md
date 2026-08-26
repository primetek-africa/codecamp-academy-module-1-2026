# MongoDB Lesson Recap: Building Our First Project

> **Course:** Database Design — NoSQL with MongoDB
> **Session topic:** Introduction to MongoDB, `mongosh`, and CRUD basics
> **Audience:** Students who missed the live session and need to catch up

This document walks through everything we practiced together in `mongosh`
during today's session. It follows the exact order of the commands we ran,
explains the concept behind each one, and calls out the mistakes we made
along the way (which are actually great learning moments). Read it top to
bottom, type each command yourself in your own terminal, and you'll be
caught up and ready to continue with the group next class.

---

## 1. Connecting to MongoDB with `mongosh`

We start every session by opening `mongosh`, the official MongoDB Shell.
When it connects, it prints useful information: the MongoDB server
version, the shell version, and a warning that access control (security
authentication) is not enabled on our local server.

```
mongosh
```

**Key takeaway:** in a local development environment it's normal to run
MongoDB without authentication enabled, but in any real (production)
environment, access control must always be turned on. We'll cover users
and roles in a later session.

---

## 2. Exploring existing databases: `show dbs`

Once connected, we listed the databases already present on the server:

```js
show dbs
```

This showed three system/default databases: `admin`, `config`, and
`local`. These are created automatically by MongoDB and are used
internally — we don't store our own application data in them.

We also ran `db` on its own, which simply prints the name of the database
we are **currently using**. By default, that was `test`.

---

## 3. Creating and switching to our own database: `use`

To start our project, we switched to a new database called
`university_db`:

```js
use university_db
```

**Important concept:** MongoDB does not create a database the moment you
run `use`. The database only becomes permanent once you write data into
it (for example, by creating a collection or inserting a document). This
is why, right after running `use university_db`, `show dbs` still did not
list it — it only appeared once we created our first collection.

---

## 4. Creating a collection: `db.createCollection()`

A **collection** in MongoDB is the equivalent of a "table" in a
relational database, but without a fixed structure (schema). We created
our first collection for storing student records:

```js
db.createCollection("students")
```

We then confirmed it existed with:

```js
show collections
```

---

## 5. Inserting documents: `insertOne()`

A **document** is the equivalent of a "row" in a relational database.
Documents are stored in JSON-like format (technically BSON) and are
made of key/value pairs.

### 5.1 Inserting an empty document

```js
db.students.insertOne({})
```

This is technically valid in MongoDB — a document can be inserted with
no fields at all. MongoDB will still generate a unique `_id` for it.
This demonstrated an important concept: **MongoDB collections do not
enforce a schema by default.** Every document can have different
fields, or none.

### 5.2 Inserting a complete document

```js
db.students.insertOne({
  studentId: "STU-0001",
  firstName: "Bruce",
  lastName: "wayne",
  age: 21,
  program: "Software Development"
})
```

### 5.3 A common typo: misspelled field names

We inserted a second student, but accidentally typed `pogram` instead of
`program`:

```js
db.students.insertOne({
  studentId: "STU-0002",
  firstName: "Cristian",
  lastName: "Camilo",
  age: 28,
  pogram: "Aerospace engineering",
  nationality: "Colombian"
})
```

MongoDB accepted this without any error, because — again — there is no
schema being enforced. This is a good reminder of why field-naming
discipline (and, later, **schema validation**) matters in real projects:
a typo like this would silently create an inconsistent field across your
data, and no application code checking for `program` would ever find
this document's value.

### 5.4 A common typo: misspelled collection names

We then tried to insert a document into a collection called `stundets`
(a typo for `students`):

```js
db.stundets.insertOne({
  phoneNumber: "+57 3195043571",
  address: "Street 12 # 3 - 45",
  city: "Cali",
  fullName: "Tony Stark",
  dateOfBirth: "1999-08-14"
})
```

**This is a very important lesson.** In MongoDB, if you insert into a
collection that does not exist yet, MongoDB does **not** throw an error —
it silently creates that collection for you. This means our typo did not
fail; it quietly created a brand-new, separate collection called
`stundets`, completely disconnected from our real `students` collection.
By the end of the session we had two collections coexisting:
`students` and `stundets`. Always double-check collection names before
inserting data, since MongoDB will not warn you about a typo.

### 5.5 Nested documents (embedded objects) and arrays

Our next student record introduced two new concepts at once: an
**embedded document** (`address`) and an **array of documents**
(`phones`):

```js
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

This is one of MongoDB's biggest advantages over relational databases:
related data (like an address, or a list of phone numbers) can live
**inside the same document**, instead of requiring separate tables and
JOINs. We repeated the same pattern for a second student, "John Doe", to
reinforce it.

**Syntax note:** while typing this out live, we hit a `SyntaxError`
because we wrote `{ type: "home": "+4732143543433" }` — mixing up curly
braces and colons. The fix was `{ type: "home", number: "..." }`. When
you see `Unexpected token, expected ","`, check your object syntax for a
misplaced colon or a missing comma.

---

## 6. Reading documents: `find()` and `findOne()`

### 6.1 `find()` — returns all matching documents

```js
db.students.find()
```

Called with no arguments (an empty filter), `find()` returns **every**
document in the collection, as an array.

### 6.2 `findOne()` — returns a single document

```js
db.students.findOne()
```

With no filter, `findOne()` returns the **first** document MongoDB
happens to find (not necessarily the first one you inserted). In our
case it kept returning the very first, empty `{}` document.

### 6.3 Filtering by a field value

```js
db.students.findOne({ _id: ObjectId('6a8d9fb310234fe6c5585b12') })
```

### 6.4 The `_id` field and `ObjectId()`

Every document in MongoDB automatically gets a special field called
`_id`, which acts as its unique, permanent identifier — similar to a
primary key in a relational database. Its value is generated using the
`ObjectId()` type.

**Common mistakes we made while querying by `_id`:**

- `db.students.findOne(6a8da28d10234fe6c5585b13)` failed with a
  `SyntaxError`, because a raw hexadecimal-looking value is not valid
  JavaScript syntax on its own.
- `db.students.findOne("6a8da28d10234fe6c5585b13")` failed with
  `MongoInvalidArgumentError: Query filter must be a plain object or
  ObjectId`, because `findOne()` expects a **filter object** (like
  `{ field: value }`), not a bare string.
- The correct form always wraps the id both in the filter object *and*
  in the `ObjectId()` constructor:
  `db.students.findOne({ _id: ObjectId('...') })`.

We also saw that querying for an `_id` that belongs to a *different*
collection (in this case, one that actually exists in `stundets`, not
`students`) correctly returns `null` — a good reminder that `_id` values
are only guaranteed unique **within a single collection**, and that
collections are fully independent of each other.

### 6.5 Calling `insertOne()` with no arguments

We also (accidentally) ran `db.students.insertOne()` a few times with no
document at all. This throws:

```
MongoshInvalidInputError: [COMMON-10001] Missing required argument at
position 0 (Collection.insertOne)
```

Unlike an empty document (`{}`), which is valid, calling `insertOne()`
with **nothing** is not — the method always requires at least one
argument.

---

## 7. Inserting multiple documents at once: `insertMany()`

After creating a second collection for the course catalog:

```js
db.createCollection("courses")
```

We inserted our first course with `insertOne()`, including nested
objects for the `instructor` and the `schedule`:

```js
db.courses.insertOne({
  courseId: "CS1001",
  name: "Introduction to NoSQL databases",
  credits: 3,
  instructor: {
    instructorId: "INS-001",
    firstName: "Clark",
    lastname: "kent"
  },
  schedule: {
    day: "Monday",
    startTime: "08:00",
    endTime: "11:00",
    classroom: "LAB-101"
  }
})
```

Then, to insert several courses in a single command, we used
`insertMany()`, which expects an **array of documents** (note the
square brackets `[ ]` around the curly braces):

```js
db.courses.insertMany([
  { courseId: "CS1002", name: "Web development" },
  { courseId: "CS1003", name: "Computer Networks" },
  { courseId: "CS1003", name: "alogorithms design" }
])
```

**Syntax note:** our first attempt wrapped the documents in an extra set
of `{ { ... }, { ... } }` braces instead of an array `[ ... ]`, which
caused a `SyntaxError`. Remember: `insertOne()` takes **one object**,
while `insertMany()` takes **one array of objects**.

The result of `insertMany()` is different from `insertOne()`: instead of
a single `insertedId`, it returns an `insertedIds` object, mapping each
document's position (`'0'`, `'1'`, `'2'`) to its generated `_id`.

We also noticed the two last courses were both inserted with the same
`courseId: "CS1003"` (a copy-paste mistake) — this foreshadows why
**unique indexes** matter, which we'll cover in an upcoming session.

---

## 8. Updating documents: `updateOne()` and `$set`

To modify an existing document instead of replacing it entirely, we used
`updateOne()` together with the `$set` **update operator**:

```js
db.courses.updateOne(
  { courseId: 'CS1001' },
  { $set: { semester: "IV" } }
)
```

The general shape of `updateOne()` is:

```js
db.<collection>.updateOne(
  <filter: which document to update>,
  { $set: { <field to add or change>: <new value> } }
)
```

We repeated this pattern to add a `semester` field to each course, and
also used it to **fix** the duplicate `courseId` mistake from the
previous section — matching the course by its (unique-in-practice) `name`
field instead, and correcting its `courseId`:

```js
db.courses.updateOne(
  { name: 'alogorithms design' },
  { $set: { courseId: "CS1004" } }
)
```

**Reading the result of an update:** every update returns a summary
object with:

- `matchedCount` — how many documents matched the filter.
- `modifiedCount` — how many were actually changed.
- `upsertedCount` — how many new documents were created (0 here, since
  we did not use the `upsert` option).

If `matchedCount` is `0`, it almost always means your filter didn't find
the document you expected — usually because of a typo in the field value
or in the collection name (exactly like our `stundets` situation above).

---

## 9. Summary of concepts covered today

| Concept              | Command / Syntax                              |
|-----------------------|-----------------------------------------------|
| Connect to the shell   | `mongosh`                                     |
| List databases         | `show dbs`                                    |
| Show current database  | `db`                                          |
| Switch/create database | `use <db_name>`                               |
| Create a collection    | `db.createCollection("<name>")`               |
| List collections       | `show collections`                            |
| Insert one document    | `db.<col>.insertOne({ ... })`                 |
| Insert many documents  | `db.<col>.insertMany([{ ... }, { ... }])`     |
| Read all documents     | `db.<col>.find()`                             |
| Read one document      | `db.<col>.findOne()`                          |
| Filter by a field      | `db.<col>.findOne({ field: value })`          |
| Filter by id           | `db.<col>.findOne({ _id: ObjectId('...') })`  |
| Update a document      | `db.<col>.updateOne(filter, { $set: {...} })` |
| Embedded document      | a field whose value is itself an object       |
| Array of documents     | a field whose value is an array of objects    |

---

## 10. Key lessons and things to remember

1. **MongoDB is schema-less by default.** Documents in the same
   collection can have completely different fields. This gives
   flexibility but also demands discipline — a misspelled field
   (`pogram` instead of `program`) is accepted silently.
2. **Collections and databases are created lazily.** They only start
   existing once you actually write data into them (`use` alone is not
   enough; `insertOne`/`insertMany`/`createCollection` are).
3. **A typo in a collection name creates a brand-new collection**
   instead of raising an error. Always run `show collections` if a
   query unexpectedly returns nothing.
4. **`_id` is automatic, unique per collection, and must be wrapped**
   both in a filter object and in `ObjectId()` when querying by id.
5. **Embedded documents and arrays let you model relationships inside
   a single document**, which is very different from the
   table-and-foreign-key approach used in relational databases.
6. **`insertOne()` takes an object; `insertMany()` takes an array of
   objects.** Mixing them up is one of the most common syntax errors.
7. **`updateOne()` + `$set` modifies specific fields** without
   overwriting the rest of the document, and its result tells you
   exactly how many documents were matched and changed.

---

## 11. Sample dataset: build your own `university_db`

If you missed the session, you don't need to retype everything we did
live. Instead, run the two `insertMany()` commands below to seed your
own `students` and `courses` collections with clean, consistent
example data (no typos this time!). This gives you the same starting
point as the rest of the class before you move on to the exercises in
section 12.

### 11.1 Seed the `students` collection (5 documents)

```js
db.students.insertMany([
  {
    studentId: "STU-0001",
    firstName: "Bruce",
    lastName: "Wayne",
    email: "bruce.wayne@email.com",
    age: 21,
    address: {
      street: "1007 Mountain Drive",
      city: "Cali",
      country: "Colombia"
    },
    phones: [
      { type: "mobile", number: "+57 300 111 2233" }
    ],
    program: "Software Development"
  },
  {
    studentId: "STU-0002",
    firstName: "Cristian",
    lastName: "Camilo",
    email: "cristian.camilo@email.com",
    age: 28,
    address: {
      street: "Carrera 10 # 5 - 20",
      city: "Tuluá",
      country: "Colombia"
    },
    phones: [
      { type: "mobile", number: "+57 319 504 3571" }
    ],
    program: "Aerospace Engineering"
  },
  {
    studentId: "STU-0003",
    firstName: "Tony",
    lastName: "Stark",
    email: "tony.stark@email.com",
    age: 27,
    address: {
      street: "Street 12 # 3 - 45",
      city: "Cali",
      country: "Colombia"
    },
    phones: [
      { type: "mobile", number: "+57 319 435 6783" },
      { type: "home", number: "+57 2 555 0134" }
    ],
    program: "Data Science"
  },
  {
    studentId: "STU-0004",
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
      { type: "mobile", number: "+34 612 433 212" },
      { type: "home", number: "+34 913 214 354" }
    ],
    program: "Data Science"
  },
  {
    studentId: "STU-0005",
    firstName: "John",
    lastName: "Doe",
    email: "john.doe@email.com",
    age: 21,
    address: {
      street: "Main Street 126",
      city: "Rome",
      country: "Italy"
    },
    phones: [
      { type: "mobile", number: "+39 342 434 2142" },
      { type: "home", number: "+39 342 543 5547" }
    ],
    program: "Mobile Development"
  }
])
```

### 11.2 Seed the `courses` collection (5 documents)

```js
db.courses.insertMany([
  {
    courseId: "CS1001",
    name: "Introduction to NoSQL databases",
    credits: 3,
    semester: "IV",
    instructor: {
      instructorId: "INS-001",
      firstName: "Clark",
      lastName: "Kent"
    },
    schedule: {
      day: "Monday",
      startTime: "08:00",
      endTime: "11:00",
      classroom: "LAB-101"
    }
  },
  {
    courseId: "CS1002",
    name: "Web development",
    credits: 4,
    semester: "V",
    instructor: {
      instructorId: "INS-002",
      firstName: "Diana",
      lastName: "Prince"
    },
    schedule: {
      day: "Tuesday",
      startTime: "10:00",
      endTime: "13:00",
      classroom: "LAB-102"
    }
  },
  {
    courseId: "CS1003",
    name: "Computer Networks",
    credits: 3,
    semester: "III",
    instructor: {
      instructorId: "INS-003",
      firstName: "Barry",
      lastName: "Allen"
    },
    schedule: {
      day: "Wednesday",
      startTime: "14:00",
      endTime: "17:00",
      classroom: "LAB-103"
    }
  },
  {
    courseId: "CS1004",
    name: "Algorithms design",
    credits: 4,
    semester: "VI",
    instructor: {
      instructorId: "INS-004",
      firstName: "Arthur",
      lastName: "Curry"
    },
    schedule: {
      day: "Thursday",
      startTime: "08:00",
      endTime: "11:00",
      classroom: "LAB-101"
    }
  },
  {
    courseId: "CS1005",
    name: "Mobile application development",
    credits: 4,
    semester: "V",
    instructor: {
      instructorId: "INS-005",
      firstName: "Victor",
      lastName: "Stone"
    },
    schedule: {
      day: "Friday",
      startTime: "10:00",
      endTime: "13:00",
      classroom: "LAB-104"
    }
  }
])
```

After running both commands, confirm everything loaded correctly:

```js
db.students.find()
db.courses.find()
```

You should see 5 documents in each collection (or 6 in `students`, if
you already had one from an earlier command). From here, follow along
with the exercises in the next section.

---

## 12. Practice exercises for catching up

Try these on your own local `mongosh`, using the `university_db`
database we built together:

1. Create a new collection called `professors` and insert two
   documents with at least `professorId`, `firstName`, `lastName`, and
   `department` fields.
2. Insert a `professors` document that includes an embedded `contact`
   object (with `email` and `phone`) and an array field called
   `coursesTaught`.
3. Use `find()` to list every document in `professors`.
4. Use `findOne()` with a filter to retrieve a single professor by
   their `professorId`.
5. Use `updateOne()` with `$set` to add a `yearsOfExperience` field to
   one professor.
6. Deliberately insert a document into a misspelled collection name
   (for example, `proffessors`) and confirm with `show collections`
   that MongoDB created it as a separate collection — then remove your
   confusion by comparing it with `db.proffessors.find()`.

---

*Prepared as a companion document for students who need to catch up.
Bring any questions about these steps to our next session so we can
continue building on this same `university_db` project together.*