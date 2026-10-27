# Project: University Course Registration System

## Project Introduction

In this project, you will work as a database designer for a university
that wants to replace its manual student registration process with a
relational database management system.

Currently, the university manages students, professors, academic
programs, and course enrollments using spreadsheets and paper forms.
Each academic semester, administrative staff spend many hours processing
registrations, assigning professors to courses, and keeping track of
student enrollments.

As the university continues to grow, the current system has become
inefficient. Information is duplicated across multiple files, updating
student or professor information requires modifying several documents,
and generating academic reports has become increasingly difficult.

The university administration has hired your software development team
to analyze the current business process and design a relational database
that organizes all academic information efficiently.

Rather than immediately implementing the database, the objective of this
project is to understand the business requirements, identify the data
that must be stored, and progressively improve the database design by
applying the principles of **First Normal Form (1NF)**, **Second Normal
Form (2NF)**, and **Third Normal Form (3NF)**.

---

# Business Scenario

The university offers several academic programs such as Computer
Science, Business Administration, Civil Engineering, and Graphic Design.

Each program offers multiple courses every semester.

Students enroll in one academic program and can register for several
courses during the semester.

Each course is taught by one professor during a particular semester.

After completing a course, students receive a final grade.

The university administration needs a database capable of managing all
this information while avoiding duplicated data and maintaining data
integrity.

---

# Business Requirements

The university needs to store information about:

- Students
- Professors
- Academic programs
- Courses
- Course registrations
- Academic semesters
- Final grades

The administration would like to answer questions such as:

- Which students are enrolled in a specific course?
- Which professor teaches each course?
- Which courses belong to an academic program?
- What courses is a student taking?
- What grades has a student obtained?
- Which semester does each registration belong to?

---

# Student Information

For every student, the university records information such as:

- First name
- Last name
- Date of birth
- Gender
- Email address
- Phone number
- Home address
- Student identification number

---

# Professor Information

For every professor, the university records:

- First name
- Last name
- Employee number
- Email address
- Phone number
- Office location

---

# Academic Programs

The university offers several academic programs.

Examples include:

- Computer Science
- Software Engineering
- Business Administration
- Architecture
- Graphic Design
- Civil Engineering

Each program includes:

- Program name
- Description
- Duration in semesters

---

# Courses

Each course contains information such as:

- Course name
- Course code
- Number of credits
- Weekly hours
- Academic program
- Assigned professor

---

# Academic Semesters

The university organizes classes by academic semesters.

Examples include:

- 2026-1
- 2026-2
- 2027-1

For each semester, the university records:

- Semester name
- Start date
- End date

---

# Course Registrations

Whenever a student enrolls in a course, the university stores:

- Student
- Course
- Semester
- Registration date
- Final grade
- Registration status

Possible registration status values include:

- Active
- Completed
- Withdrawn
- Failed

---

# Your Task

Before creating any tables, carefully analyze the business
requirements.

Discuss how the information should be organized and identify possible
improvements that reduce duplicated information.

Remember that the goal is not to design the final database immediately,
but to progressively improve the design through normalization.

---

# Questions for Analysis

Work with your classmates to answer the following questions.

1. What information must the university store?

2. Which information appears repeatedly?

3. Which data belongs together?

4. Which information should remain unique?

5. What entities can you identify?

6. Which attributes belong to each entity?

7. Which relationships exist between the entities?

8. What relationship cardinalities can you identify?

9. Which information should become foreign keys?

10. How can the database be improved through normalization?

---

# Class Activity

As a class, we will:

- Analyze the business problem.
- Identify entities and attributes.
- Design an initial database model.
- Create an Entity-Relationship Diagram (ERD).
- Create a Relational Diagram.
- Apply First Normal Form (1NF).
- Improve the design to Second Normal Form (2NF).
- Refine the database to Third Normal Form (3NF).

---

# Expected Deliverables

By the end of this activity, every student should have completed:

- Business requirements analysis.
- Entity identification.
- Attribute identification.
- Primary key identification.
- Relationship analysis.
- Cardinality analysis.
- Entity-Relationship Diagram (ERD).
- Relational Diagram.
- Database design in 1NF.
- Database design in 2NF.
- Database design in 3NF.

---

# Learning Objectives

By completing this project, you will learn how to:

- Analyze real-world business requirements.
- Transform business processes into relational databases.
- Identify entities and attributes.
- Design Entity-Relationship Diagrams.
- Design Relational Diagrams.
- Understand relationship cardinality.
- Apply First, Second, and Third Normal Forms.
- Build scalable relational database models that are ready to be
  implemented in PostgreSQL.