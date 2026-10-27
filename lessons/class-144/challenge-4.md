# Code Challenge 4: Design the University Course Registration Database

## Objective

In this challenge, you will apply everything we have learned about
database analysis, normalization, and relational database design by
creating a complete database model for the **University Course
Registration System**.

Unlike previous exercises where the database structure was provided,
this time you will design the solution yourself. Starting from the
business requirements, you must identify the information that needs to
be stored, organize it into entities, and progressively improve the
database through the normalization process.

The objective is not simply to create tables, but to think like a
database designer by transforming a real-world business problem into a
well-structured relational database.

---

# Business Scenario

The university needs a database capable of managing students,
professors, academic programs, courses, enrollments, and course
registrations.

Currently, much of this information is stored in spreadsheets, making it
difficult to manage student records, assign professors to courses,
organize academic programs, and generate reports.

Your task is to analyze the requirements and design a relational
database that eliminates duplicated information while maintaining data
integrity and scalability.

---

# Your Tasks

Complete the following activities in order.

## Part 1 — Analyze the Business Requirements

Read the project description carefully.

Identify:

- The information that must be stored.
- The business rules.
- The relationships between the different pieces of information.

---

## Part 2 — Identify the Entities

Determine all entities required by the system.

Examples may include:

- Students
- Professors
- Courses

Remember that your final solution may contain additional entities after
the normalization process.

---

## Part 3 — Identify the Attributes

For every entity, determine:

- The attributes that describe it.
- Which attributes are mandatory.
- Which attribute should be the primary key.

---

## Part 4 — Identify the Relationships

Determine how the entities relate to one another.

For every relationship, identify its cardinality.

Examples:

- One-to-One (1:1)
- One-to-Many (1:N)
- Many-to-Many (N:M)

---

## Part 5 — Design the Database

Create the database progressively through the normalization process.

You must produce:

- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

For each stage, explain the changes you made and why they improve the
database design.

---

## Part 6 — Create the Entity-Relationship Diagram

Design an Entity-Relationship Diagram (ERD) representing the final
normalized database.

The diagram must include:

- Entities
- Attributes
- Primary keys
- Foreign keys
- Relationships
- Cardinality

---

## Part 7 — Create the Relational Diagram

Using your final 3NF design, create the relational model.

The diagram should clearly show:

- Table names
- Columns
- Primary keys
- Foreign keys
- Relationships between tables

---

# Requirements

Your solution must:

- Follow the principles of database normalization.
- Reach Third Normal Form (3NF).
- Eliminate duplicated information.
- Use meaningful entity and attribute names.
- Correctly identify primary and foreign keys.
- Clearly represent all relationships and cardinalities.
- Be organized and easy to understand.

---

# Deliverables

Each student must submit:

- Business requirements analysis.
- First Normal Form (1NF).
- Second Normal Form (2NF).
- Third Normal Form (3NF).
- Entity-Relationship Diagram (ERD).
- Relational Diagram.

---

# Evaluation Criteria

Your submission will be evaluated based on:

- Understanding of the business requirements.
- Correct identification of entities and attributes.
- Proper application of normalization principles.
- Correct use of primary and foreign keys.
- Accurate relationship cardinalities.
- Quality of the Entity-Relationship Diagram.
- Quality of the Relational Diagram.
- Organization, clarity, and professionalism of your work.

---

# Learning Outcomes

By completing this challenge, you will demonstrate your ability to:

- Analyze a real-world business problem.
- Design a relational database from scratch.
- Apply First, Second, and Third Normal Forms.
- Model relationships between entities.
- Identify primary and foreign keys.
- Create professional Entity-Relationship Diagrams.
- Create professional Relational Diagrams.

This challenge simulates the work performed by database designers and
backend developers when planning a new information system. It is an
opportunity to apply the complete database design process before writing
any SQL code.