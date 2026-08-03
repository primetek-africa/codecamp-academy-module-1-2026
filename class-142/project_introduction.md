# Project: Hospital Management System

## Project Introduction

In this project, you will work as a database designer for a modern
hospital that wants to replace its paper-based record system with a
relational database management system.

The hospital currently manages patient information, doctors,
appointments, and medical treatments using spreadsheets and handwritten
documents. As the hospital has grown, managing this information has
become increasingly difficult, leading to duplicated records, lost
information, scheduling conflicts, and inefficient patient care.

The hospital administration has hired your software development team to
analyze the current business process and design a relational database
that stores all information in a structured, organized, and secure
manner.

Before writing any SQL code, your team must understand the business
requirements, identify the information that needs to be stored, and
design a database capable of supporting the hospital's daily operations.

During this activity, we will gradually improve the database design by
applying database normalization techniques. Rather than starting with a
perfect design, we will analyze the business requirements together and
progressively refine the database throughout the course.

---

# Business Scenario

The hospital serves hundreds of patients every month. Every patient can
visit the hospital multiple times for different medical conditions.

The hospital employs several doctors with different areas of expertise.
When a patient requests medical attention, an appointment is scheduled
with one of the available doctors.

During each appointment, the doctor examines the patient, determines a
diagnosis, recommends a treatment, and records the consultation in the
hospital system.

The hospital also keeps track of contact information for patients and
doctors, appointment dates and times, consultation results, and the
current status of each appointment.

The current paper-based system has become difficult to maintain because
information is duplicated, records are sometimes incomplete, and finding
patient history requires searching through multiple documents.

The hospital wants a computerized database that stores all information
efficiently and makes it easy to retrieve information using SQL queries.

---

# Business Requirements

The database should be able to store information about:

- Patients
- Doctors
- Medical consultations
- Appointments
- Diagnoses
- Treatments
- Contact information
- Appointment dates and times
- Appointment status

The hospital administration would also like to know:

- Which doctor attended each patient.
- When appointments took place.
- Whether an appointment was completed or cancelled.
- Which treatments were recommended.
- A patient's consultation history.

---

# Patient Information

For every patient, the hospital records information such as:

- Full name
- Date of birth
- Gender
- Phone number
- Email address
- Home address

---

# Doctor Information

For every doctor, the hospital records information such as:

- Full name
- Medical license number
- Phone number
- Email address
- Area of medical expertise

---

# Appointment Information

For every appointment, the hospital stores information including:

- Appointment date
- Appointment time
- Appointment status
- Patient information
- Doctor information
- Diagnosis
- Treatment
- Additional notes

Possible appointment status values include:

- Scheduled
- Completed
- Cancelled

---

# Your Task

Before creating any database tables, carefully analyze the business
requirements.

Think about how the information should be organized and discuss
different possible database designs.

There is no single correct solution at this stage. The objective is to
understand the problem before implementing the database.

---

# Questions to Analyze

Work with your classmates to answer the following questions.

1. What information does the hospital need to store?

2. What pieces of information appear to describe the same real-world
   object?

3. Which information is repeated several times?

4. Which information changes frequently?

5. Which information should remain unique?

6. Which pieces of information seem to depend on other information?

7. What problems could occur if information is duplicated?

8. How could the information be organized to make it easier to manage?

9. How can we avoid storing the same information multiple times?

10. How can we make future updates easier and more reliable?

---

# Class Activity

As a class, we will:

- Analyze the business requirements.
- Identify the information that needs to be stored.
- Discuss possible ways to organize the data.
- Create an initial database design.
- Improve the design step by step throughout the course.
- Apply database normalization techniques in later lessons.
- Convert the final design into a PostgreSQL relational database.

---

# Expected Deliverables

By the end of this activity, every student should have completed:

- A written analysis of the business problem.
- An initial database design proposal.
- A list of the information that should be stored.
- An Entity-Relationship Diagram (ERD).
- A Relational Diagram.

These deliverables will serve as the foundation for implementing the
database in PostgreSQL during the next lessons.

---

# Learning Objectives

By completing this activity, you will learn how to:

- Analyze real-world business requirements.
- Transform a business problem into a database solution.
- Identify the information that must be stored.
- Recognize duplicated information.
- Understand why good database design is important.
- Design an initial Entity-Relationship Diagram (ERD).
- Create a Relational Diagram.
- Prepare a database design before writing SQL code.

Throughout the following lessons, we will progressively refine this
design by applying normalization principles and implementing the final
solution in PostgreSQL.