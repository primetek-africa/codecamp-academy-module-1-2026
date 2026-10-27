# Project: Airline Reservation Management System

## Project Introduction

In this project, you will work as a database designer for an airline
company that wants to modernize its reservation system by replacing
manual processes with a relational database management system.

Currently, the airline stores passenger information, flight schedules,
aircraft details, reservations, and tickets using multiple spreadsheets
and disconnected software applications. As the number of daily flights
and passengers has increased, managing this information has become
difficult, leading to duplicated records, booking errors, and delays in
customer service.

The airline has hired your software development team to analyze the
current business process and design a relational database capable of
supporting its daily operations efficiently.

Rather than immediately creating the database, the objective of this
project is to understand the business requirements, identify the
information that needs to be stored, and progressively improve the
database design through the normalization process.

Throughout this project, we will move from **First Normal Form (1NF)**,
to **Second Normal Form (2NF)**, and finally to **Third Normal Form
(3NF)** before implementing the database in PostgreSQL.

---

# Business Scenario

The airline operates hundreds of domestic and international flights
every week.

Passengers can search for available flights, make reservations, and
purchase tickets.

Each flight is operated by a specific aircraft and is assigned to a
pilot.

The airline keeps track of flight schedules, aircraft capacity,
reservations, passenger information, ticket status, and flight status.

The current system has become difficult to maintain because information
is duplicated across several spreadsheets, making updates slow and
increasing the risk of inconsistent data.

The airline administration wants a centralized relational database that
stores all operational information while maintaining data integrity and
allowing employees to retrieve information quickly using SQL queries.

---

# Business Requirements

The new system should manage information about:

- Passengers
- Flights
- Aircraft
- Pilots
- Reservations
- Tickets
- Airports
- Flight schedules
- Flight status

The airline administration would like to answer questions such as:

- Which passengers are booked on a particular flight?
- Which pilot is assigned to each flight?
- Which aircraft operates each flight?
- Which airport is the origin and destination of each flight?
- Which reservations have been confirmed or cancelled?
- How many passengers are booked on each flight?

---

# Passenger Information

For every passenger, the airline stores:

- Passport or identification number
- First name
- Last name
- Date of birth
- Nationality
- Email
- Phone number

---

# Pilot Information

For every pilot, the airline stores:

- Employee number
- First name
- Last name
- License number
- Email
- Phone number

---

# Aircraft Information

For every aircraft, the airline stores:

- Registration number
- Manufacturer
- Model
- Capacity
- Year of manufacture

---

# Flight Information

Every flight includes information such as:

- Flight number
- Departure date
- Departure time
- Arrival time
- Origin airport
- Destination airport
- Aircraft
- Pilot
- Flight status

Possible flight status values include:

- Scheduled
- Boarding
- Delayed
- Departed
- Arrived
- Cancelled

---

# Reservation Information

Whenever a passenger books a flight, the airline stores:

- Passenger
- Flight
- Reservation date
- Seat number
- Reservation status

Possible reservation status values include:

- Pending
- Confirmed
- Cancelled

---

# Ticket Information

Each reservation generates a ticket containing:

- Ticket number
- Reservation
- Purchase date
- Price
- Payment status

Possible payment status values include:

- Pending
- Paid
- Refunded

---

# Your Task

Before creating any database tables, carefully analyze the business
requirements.

Discuss with your classmates how the information should be organized,
identify duplicated information, and determine how the database can be
improved through normalization.

Do not focus on writing SQL code yet. Your goal is to understand the
business problem and design an efficient relational database.

---

# Questions for Analysis

Work with your classmates to answer the following questions.

1. What information must the airline store?

2. What entities can you identify?

3. Which attributes belong to each entity?

4. Which attributes should uniquely identify each entity?

5. What relationships exist between the entities?

6. What is the cardinality of each relationship?

7. Which information appears to be duplicated?

8. Which attributes should become foreign keys?

9. How can the database be improved through normalization?

10. How would your design change from 1NF to 3NF?

---

# Class Activity

As a class, we will:

- Analyze the business requirements.
- Identify entities and attributes.
- Design the First Normal Form (1NF).
- Improve the database to Second Normal Form (2NF).
- Complete the database in Third Normal Form (3NF).
- Design the Entity-Relationship Diagram (ERD).
- Design the Relational Diagram.

---

# Expected Deliverables

By the end of this project, every student should submit:

- Business requirements analysis.
- First Normal Form (1NF).
- Second Normal Form (2NF).
- Third Normal Form (3NF).
- Entity-Relationship Diagram (ERD).
- Relational Diagram.

---

# Learning Objectives

By completing this project, you will learn how to:

- Analyze real-world business requirements.
- Identify entities and attributes.
- Design normalized relational databases.
- Apply First, Second, and Third Normal Forms.
- Identify primary keys and foreign keys.
- Define relationship cardinality.
- Create professional Entity-Relationship Diagrams.
- Create professional Relational Diagrams.

This project simulates the work performed by database analysts and
backend developers when designing an enterprise airline reservation
system, providing practical experience in database modeling before
implementation using PostgreSQL.