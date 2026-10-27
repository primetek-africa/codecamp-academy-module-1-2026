# Hotel Booking API

## 1. Project Overview

The **Hotel Booking API** is a RESTful backend application designed to
manage the core operations of a hotel reservation system.

The API will allow hotel staff to manage rooms and bookings while guests
can search for available rooms, create bookings, manage their reservations,
and view their booking history.

The project will implement three different user roles:

* `admin`
* `staff`
* `guest`

The application must provide different permissions depending on the
authenticated user's role.

---

# 2. Project Objective

The main objective is to develop a secure and maintainable REST API for
managing hotel reservations.

Students must apply the concepts learned throughout the Advanced API
Development module, including:

* REST API architecture
* GraphQL
* WebSockets
* Node.js
* Express.js
* PostgreSQL
* ORM usage
* JWT authentication
* Role-based authorization
* CRUD operations
* Request validation
* Database relationships
* Filtering
* Pagination
* Sorting
* Error handling
* HTTP status codes
* Middleware
* Transactions
* Business rules
* API testing with Postman
* API documentation
* Environment variables
* Git and GitHub

The project should demonstrate that students understand that a backend API
is more than a collection of CRUD endpoints.

The API must enforce business rules and protect the integrity of the
application.

---

# 3. System Users

The API will contain three different user roles.

```text
ADMIN
STAFF
GUEST
```

Each role will have different permissions.

---

# 4. Administrator

The `admin` role represents a user responsible for managing the entire
hotel system.

Administrators can:

* Manage users.
* Create users.
* Update users.
* Disable users.
* Manage room types.
* Manage rooms.
* View all bookings.
* View all payments.
* View hotel statistics.

Administrators have the highest level of access within the application.

However, authentication and authorization must still be enforced for
administrator endpoints.

---

# 5. Staff

The `staff` role represents hotel employees who manage day-to-day hotel
operations.

Staff members can:

* View rooms.
* Create rooms.
* Update rooms.
* View bookings.
* Create bookings for guests.
* Confirm bookings.
* Check guests in.
* Check guests out.
* Process payments.
* View booking history.

Staff members should not be able to manage administrator accounts or
change system-level user permissions.

---

# 6. Guest

The `guest` role represents customers using the hotel reservation system.

Guests can:

* Register an account.
* Log in.
* View available rooms.
* Search rooms.
* Filter rooms.
* View room details.
* Create bookings.
* View their own bookings.
* Cancel eligible bookings.
* View their booking history.
* View payment information related to their bookings.

Guests cannot:

* Create rooms.
* Delete rooms.
* Manage room types.
* Access other guests' bookings.
* Manage users.
* Perform check-in or check-out operations for other users.

---

# 7. Authentication

The API must implement authentication using **JSON Web Tokens (JWT)**.

The authentication process should follow this workflow:

```text
Register
   |
   v
Login
   |
   v
Validate credentials
   |
   v
Generate JWT
   |
   v
Client receives token
   |
   v
Client sends token
   |
   v
Protected API endpoint
```

Protected requests must include the token in the Authorization header.

Example:

```http
Authorization: Bearer <JWT>
```

The API must reject requests when:

* The token is missing.
* The token is invalid.
* The token is expired.
* The token has an invalid format.

---

# 8. Role-Based Authorization

The API must implement authorization middleware.

Authentication answers:

```text
Who is the user?
```

Authorization answers:

```text
What is this user allowed to do?
```

For example:

```text
authenticate
     |
     v
authorize("STAFF")
     |
     v
controller
```

---

# 9. Room Availability

One of the most important features of the API is room availability.

A room cannot be considered available simply because its current status
is `AVAILABLE`.

The API must also consider existing bookings.

For example, suppose Room 205 has a booking:

```text
Check-in:  2026-10-10
Check-out: 2026-10-15
```

Another guest cannot create a booking for Room 205 that overlaps this
period.

The API must therefore check the booking dates before creating a new
reservation.

---

# 10. Booking Date Rules

The API must validate booking dates.

The following rule must be enforced:

```text
check_out_date > check_in_date
```

The API must reject:

```text
check_in_date == check_out_date
```

and:

```text
check_out_date < check_in_date
```

Students should also decide how the system handles bookings for dates
that have already passed.

---

# 11. Preventing Double Booking

The system must prevent two guests from booking the same room for
overlapping dates.

For example:

```text
Booking A
2026-10-10 -> 2026-10-15
```

The following booking must be rejected:

```text
Booking B
2026-10-12 -> 2026-10-18
```

because the dates overlap.

However, this booking could be valid:

```text
Booking B
2026-10-15 -> 2026-10-20
```

because the first booking ends when the second booking begins.

Students must implement the appropriate date-overlap logic on the backend.

---

# 12. Booking Price Calculation

The backend must calculate the booking price.

The client must not be trusted to send the final price.

For example:

```text
number_of_nights =
check_out_date - check_in_date
```

Then:

```text
total_price =
number_of_nights * room_type.price_per_night
```

For example:

```text
Price per night: $100

Check-in:  2026-10-10
Check-out: 2026-10-13

Nights: 3

Total:
3 * $100 = $300
```

The server must calculate this value.

---

# 13. Booking Lifecycle

Bookings should follow a defined lifecycle.

Example:

```text
PENDING
   |
   v
CONFIRMED
   |
   v
CHECKED_IN
   |
   v
CHECKED_OUT
```

A booking may also be cancelled:

```text
PENDING
   |
   v
CANCELLED
```

or:

```text
CONFIRMED
   |
   v
CANCELLED
```

Students must prevent invalid state transitions.

For example, a booking that has already been checked out should not be
changed back to `PENDING`.

---

# 14. Check-In

Staff members should be able to check guests into the hotel.

Before checking in a guest, the API should verify:

* The booking exists.
* The booking is confirmed.
* The check-in date is valid.
* The booking has not been cancelled.
* The room is available for the reservation.

After a successful check-in, the booking status becomes:

```text
CHECKED_IN
```

The room status should become:

```text
OCCUPIED
```

---

# 15. Check-Out

Staff members should be able to check guests out.

The API should verify that the booking is currently:

```text
CHECKED_IN
```

After a successful check-out:

```text
Booking:
CHECKED_IN -> CHECKED_OUT
```

The room can then become:

```text
OCCUPIED -> AVAILABLE
```

This operation should be handled carefully because multiple pieces of
database state may need to change.

---

# 16. Database Transactions

Transactions should be used when multiple database operations must either
all succeed or all fail.

For example, checking out a guest may require:

```text
1. Validate booking
2. Update booking status
3. Update room status
4. Update payment information
5. Commit transaction
```

If one operation fails:

```text
ROLLBACK
```

The database should return to its previous consistent state.

Students must identify other operations where transactions would be
appropriate.

---

# 17. Payment Management

The API must track payments associated with bookings.

A payment should include information such as:

```text
amount
payment_method
status
paid_at
```

The API should support payment statuses such as:

```text
PENDING
PAID
FAILED
REFUNDED
```

Students should implement business rules around payment transitions.

For example, a payment marked as `REFUNDED` should not simply be changed
back to `PAID` without following the appropriate business logic.

---

### User validation

```text
name
email
password
role
```

### Room validation

```text
room_number
room_type_id
floor
status
```

### Booking validation

```text
room_id
check_in_date
check_out_date
guests
```

### Payment validation

```text
booking_id
amount
payment_method
status
```

The API must reject invalid input before attempting unsafe database
operations.

---

# 18. Error Handling

The API must implement centralized error handling.

Responses should follow a consistent format.

Example:

```json
{
  "success": false,
  "message": "Room is not available for the selected dates",
  "error": "ROOM_NOT_AVAILABLE"
}
```

Another example:

```json
{
  "success": false,
  "message": "You are not authorized to access this resource",
  "error": "FORBIDDEN"
}
```

Students should avoid exposing sensitive database or server information
in production-style error responses.

---

# 19. HTTP Status Codes

Students must use appropriate HTTP status codes.

Examples:

```text
200 OK
201 Created
204 No Content
400 Bad Request
401 Unauthorized
403 Forbidden
404 Not Found
409 Conflict
422 Unprocessable Entity
500 Internal Server Error
```

---

# 20. Security Requirements

The project must follow basic API security practices.

Students must implement:

* Password hashing.
* JWT authentication.
* Role-based authorization.
* Request validation.
* Secure environment variables.
* CORS configuration.
* Protection against unauthorized resource access.
* Consistent error handling.
* Secure HTTP headers.
* Rate limiting where appropriate.
* Protection against SQL injection through the ORM or parameterized
  queries.

Sensitive credentials must never be committed to Git.

# 21. Project Architecture

A typical request flow should look like:

```text
HTTP Request
     |
     v
Route
     |
     v
Authentication
     |
     v
Authorization
     |
     v
Validation
     |
     v
Controller
     |
     v
Service
     |
     v
Database
     |
     v
HTTP Response
```

---

# 22. Learning Objectives

After completing this project, students should be able to:

1. Design a relational database for a real-world API.
2. Build a REST API using Node.js and Express.js.
3. Implement JWT authentication.
4. Implement role-based authorization.
5. Design CRUD endpoints.
6. Implement relational database relationships.
7. Validate user input.
8. Implement date-based business rules.
9. Prevent conflicting bookings.
10. Implement transactions.
11. Calculate values on the server.
12. Implement pagination and filtering.
13. Handle API errors consistently.
14. Protect sensitive configuration.
15. Test APIs with Postman.
16. Document APIs using OpenAPI.
17. Organize a backend application using modular architecture.
18. Apply professional backend development practices.
