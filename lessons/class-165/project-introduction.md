# PrimeTech.Africa - CodeCamp

## MongoDB_Course

### Collaborative MongoDB Atlas Project

## Project Introduction

In this project, we will work collaboratively using **MongoDB Atlas**.

All students will join the **PrimeTech.Africa - CodeCamp** organization and
will work together inside the **MongoDB_Course** project.

The objective is to simulate the development of a real-world application
where multiple developers need to work with the same cloud-based MongoDB
environment.

This project will allow us to move beyond isolated MongoDB exercises and
experience a workflow similar to what developers use when working on a real
software development team.

---

# Real-World Scenario

## Prime Delivery

Imagine that we are developing the database for a company called
**Prime Delivery**.

Prime Delivery is a logistics company that allows customers to request
deliveries through an online platform.

The company needs a database capable of managing information about:

* Customers
* Delivery drivers
* Vehicles
* Delivery orders
* Packages
* Delivery locations
* Payment information
* Delivery status
* Delivery history

The system must allow the company to answer questions such as:

* Which customers have created delivery orders?
* Which driver is assigned to each delivery?
* Which vehicle is being used?
* What packages are included in an order?
* Where should a package be delivered?
* Which deliveries are pending?
* Which deliveries have already been completed?
* How many deliveries has a driver completed?
* Which customers have placed the most orders?
* What is the total value of deliveries?
* Which delivery areas generate the most activity?

Our goal is to design and build the MongoDB database that could support
this application.

---

# Why MongoDB?

A logistics platform can generate large amounts of information with
different structures.

For example, a delivery can contain:

* Customer information
* One or more packages
* Delivery addresses
* Driver information
* Vehicle information
* Payment information
* Status information
* Timestamps

MongoDB allows us to model this information using documents and
collections while maintaining flexibility in the structure of the data.

Throughout this project, we will practice how to design a MongoDB database
for a realistic application instead of working only with artificial examples.

---

# Team Environment

We will work together using **MongoDB Atlas**.

The collaboration structure will be:

```text
PrimeTech.Africa - CodeCamp
│
└── Mongo_DB_Course
    │
    └── Prime Delivery Database
```

Each student will be part of the same organization and project.

This means that we will work with the same cloud environment and database
architecture.

The instructor will guide the development process while students execute
the assigned database tasks.

---

# Learning Objectives

By completing this project, students will practice:

1. Creating and organizing MongoDB databases.
2. Designing collections for a real-world application.
3. Creating MongoDB documents.
4. Working with BSON data types.
5. Inserting documents with `insertOne()`.
6. Inserting multiple documents with `insertMany()`.
7. Querying documents with `find()`.
8. Filtering documents using query operators.
9. Updating documents with `updateOne()`.
10. Updating multiple documents with `updateMany()`.
11. Removing documents with MongoDB delete operations.
12. Working with arrays and embedded documents.
13. Modeling relationships between collections.
14. Understanding one-to-one relationships.
15. Understanding one-to-many relationships.
16. Understanding many-to-many relationships.
17. Using MongoDB transactions.
18. Designing databases for real-world applications.
19. Working collaboratively with MongoDB Atlas.
20. Applying production-oriented MongoDB practices.

---

# Initial Database Architecture

For the project, we will eventually work with collections such as:

```text
prime_delivery
│
├── customers
├── drivers
├── vehicles
├── orders
├── packages
├── locations
├── payments
└── delivery_events
```

We will not create all of these collections immediately.

Instead, we will progressively design the database as we learn new MongoDB
concepts.

This approach allows us to understand why each collection exists and how
the collections relate to one another.

---

# Collaboration Rules

Because everyone is working inside the same MongoDB Atlas project, we need
to follow professional development practices.

### Rule 1: Do not delete shared data

Do not execute operations such as:

```javascript
db.dropDatabase()
```

or:

```javascript
db.collection.drop()
```

unless the instructor explicitly asks you to do so.

### Rule 2: Use meaningful names

Collections and fields must use descriptive names.

For example:

```javascript
{
  firstName: "Daniel",
  lastName: "Miller",
  email: "daniel@example.com"
}
```

is preferable to:

```javascript
{
  a: "Daniel",
  b: "Miller",
  c: "daniel@example.com"
}
```

### Rule 3: Do not modify another student's work

When we begin dividing the database into tasks, only modify the data or
collections assigned to you.

### Rule 4: Ask before changing the database structure

The database structure is a shared resource.

Any major structural modification should be discussed with the instructor
before it is implemented.

---

# Class Activity 01

## Join the Organization and Explore the Project

### Objective

The first activity is to establish our collaborative MongoDB Atlas
environment.

Every student must successfully join the organization and access the
shared project.

---

## Part 1: Join the Organization

The instructor will provide the invitation to:

**PrimeTech.Africa - CodeCamp**

Each student must:

1. Open the invitation.
2. Sign in to MongoDB Atlas.
3. Accept the organization invitation.
4. Confirm that the organization is visible in MongoDB Atlas.

---

## Part 2: Access the Project

Inside the organization, locate:

**Mongo_DB_Course**

Open the project and verify that you have access to the shared environment.

Do not create a second project.

The purpose of this exercise is for the entire class to work inside the
same MongoDB Atlas project.

---

## Part 3: Explore the Atlas Interface

Inside **MongoDB_Course**, identify:

* The project dashboard.
* Database deployments.
* Database access.
* Network access.
* Data Explorer.
* Collections.
* Database users.
* Project settings.

You do not need to modify these settings.

The objective is to understand where MongoDB Atlas manages the different
parts of our development environment.

---

## Part 4: Connect to MongoDB

Using the connection method demonstrated by the instructor, connect to the
MongoDB Atlas deployment.

You may use:

* MongoDB Compass
* `mongosh`
* Visual Studio Code with the MongoDB extension

Confirm that your connection works successfully.

---

## Part 5: Create the Project Database

Create the database that will contain our application data.

Use the following database name:

```text
prime_delivery
```

Initially, create the following collection:

```text
customers
```

Insert at least one customer document using the following structure:

```javascript
{
  firstName: "Carlos",
  lastName: "Mendoza",
  email: "carlos.mendoza@example.com",
  phone: "+57 300 555 0101",
  active: true,
  createdAt: new Date()
}
```

---

# Verification Challenge

At the end of the activity, each student must be able to demonstrate that
they can:

* Access the **Prime Tech Africa / CodeCamp** organization.
* Access the **Mongo_DB_Code** project.
* Access the shared MongoDB deployment.
* Connect using their selected MongoDB tool.
* Access the `prime_delivery` database.
* Access the `customers` collection.
* Insert a MongoDB document.
* Retrieve the inserted document.

Run:

```javascript
db.customers.find()
```

The result should contain the customer document created during the
activity.

---

# Important

This is a **shared classroom environment**.

The purpose is not simply to create a MongoDB database.

The purpose is to simulate how a development team collaborates on a
real-world database hosted in the cloud.

As we continue the project, we will progressively introduce:

* BSON types
* Data modeling
* Embedded documents
* References
* One-to-one relationships
* One-to-many relationships
* Many-to-many relationships
* CRUD operations
* Query operators
* Aggregation
* Indexes
* Transactions
* Validation
* Security
* Production best practices

By the end of the project, **Prime Delivery** will have a complete MongoDB
data model capable of supporting a realistic logistics application.
