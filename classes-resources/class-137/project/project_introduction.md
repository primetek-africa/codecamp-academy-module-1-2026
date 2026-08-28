# Library Management System Database Project

## Project Overview

Welcome to your first PostgreSQL database project.

Throughout this project, you will design and build a relational database for a 
**Library Management System**. The objective is to apply the database concepts 
learned in class while developing a realistic system capable of storing and 
managing library information.

Instead of working with isolated SQL examples, you will create a complete 
database from the ground up, including its tables, relationships, constraints, 
and sample data. As the course progresses, you will also learn how to retrieve, 
update, and analyze information using SQL queries.

This project will serve as the foundation for understanding how relational 
databases are designed and how they are used in real-world software applications.

---

# Project Scenario

A local public library currently keeps track of its books and members using 
spreadsheets. As the collection continues to grow, managing information has 
become increasingly difficult.

The library has decided to migrate its records to a PostgreSQL database that 
will allow librarians to organize books, register members, record book loans, 
and monitor which books are currently available.

Your task is to design and implement this database from scratch.

---

# Project Objectives

By completing this project, you will learn how to:

* Create a PostgreSQL database.
* Design relational database tables.
* Define primary and foreign keys.
* Apply database constraints.
* Create relationships between entities.
* Insert, update, and delete records.
* Query data using SQL.
* Understand how relational databases organize information.

---

# System Requirements

The database should be capable of managing the following information:

* Authors
* Books
* Library Members
* Book Loans

Each entity will be stored in its own table and connected using relational 
database principles.

---

# Entities

## Authors

Stores information about every author whose books belong to the library.

Example information:

* Full name
* Country
* Birth year

One author may have written many books.

---

## Books

Stores all books available in the library.

Each book includes information such as:

* Title
* ISBN
* Publication year
* Availability status
* Author

Every book belongs to exactly one author.

---

## Members

Stores information about registered library members.

Each member has personal information including:

* First name
* Last name
* Email
* Phone number
* Registration date

Members are allowed to borrow books from the library.

---

## Loans

Stores every borrowing transaction.

Each loan records:

* Which member borrowed the book
* Which book was borrowed
* Loan date
* Return date

The Loans table connects Members and Books together.

---

# Database Relationships

The project contains the following relationships:

* One Author can write many Books.
* One Book can appear in many Loan records over time.
* One Member can borrow many Books.
* Every Loan belongs to one Member and one Book.

These relationships will be implemented using foreign keys.

---

# Skills You Will Practice

During this project you will gain practical experience with:

* PostgreSQL
* Docker
* pgAdmin 4
* SQL
* Relational database design
* Primary Keys
* Foreign Keys
* Constraints
* CRUD operations
* Database normalization fundamentals

---

# Technologies

The following technologies will be used throughout the project:

* PostgreSQL 17
* Docker
* Docker Compose
* pgAdmin 4

---

# Learning Roadmap

The project will be developed progressively during the course.

### Phase 1

* Install Docker
* Create PostgreSQL container
* Create pgAdmin container
* Connect pgAdmin to PostgreSQL

### Phase 2

* Create the database
* Create tables
* Define primary keys
* Define foreign keys
* Apply constraints

### Phase 3

* Insert sample records
* Modify records
* Delete records
* Practice CRUD operations

### Phase 4

* Retrieve data with SELECT
* Filter records
* Sort results
* Aggregate information
* Group records

### Phase 5

* Learn SQL JOIN operations
* Query information across multiple tables
* Generate reports

---

# Expected Outcome

By the end of this project, you will have created a fully functional relational 
database capable of:

* Managing authors.
* Managing books.
* Managing library members.
* Recording book loans.
* Retrieving meaningful information using SQL queries.

More importantly, you will understand the complete process of designing and 
implementing a relational database, an essential skill for every backend and 
full-stack software developer.

---

# Submission

Your final project should include:

* PostgreSQL database
* All SQL scripts used to create the database
* SQL scripts for inserting sample data
* SQL scripts demonstrating CRUD operations
* SQL queries answering the exercises assigned throughout the course

---

# Learning Goals

After completing this project, you should be able to confidently:

* Design a relational database.
* Build tables with appropriate data types.
* Create relationships using foreign keys.
* Write SQL statements to manipulate data.
* Retrieve information using SQL queries.
* Understand how databases support modern software applications.

This project represents your first step into database development and will 
provide the foundation needed for future backend technologies such as Node.js, 
Express.js, ORMs, REST APIs, and full-stack web applications.