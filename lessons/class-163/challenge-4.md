# Code challenge 4: MongoDB Atlas Intermediate Query Activity
## Sample Analytics Database

### Activity Overview

In this activity, we will work with the `sample_analytics` database provided by 
MongoDB Atlas. The objective is to strengthen our ability to work with MongoDB 
queries from Visual Studio Code while connecting to a remote MongoDB Atlas cluster.

Throughout this activity, we will analyze real-world financial data and write 
MongoDB queries to retrieve, filter, sort, and manipulate documents.

The activity contains 20 intermediate-level queries. We will solve the queries 
progressively during class, applying the MongoDB concepts covered in previous lessons.

### Learning Objectives

By completing this activity, students will practice how to:

- Connect MongoDB Atlas Cluster in VS Code.
- Select and work with the `sample_analytics` database.
- Explore MongoDB collections and documents.
- Use `find()` to retrieve documents.
- Apply comparison operators such as `$gt`, `$gte`, `$lt`, and `$lte`.
- Combine multiple conditions using `$and` and `$or`.
- Use `$in` and `$nin` to filter values.
- Search for specific values inside arrays.
- Work with nested documents.
- Use projections to control returned fields.
- Sort query results.
- Limit the number of returned documents.
- Update documents using `$set`.
- Update array fields using `$push`.
- Delete documents using MongoDB delete operations.
- Combine multiple MongoDB operators in a single query.

### Database

We will use the following MongoDB Atlas sample database:

```javascript
use sample_analytics
```

The database contains collections such as:

- `accounts`
- `customers`
- `transactions`

Before beginning the activity, make sure that your VS Code project is successfully 
connected to your MongoDB Atlas cluster.

> **Important**
>
> For this activity, all queries must be executed from the VS Code project.
>
> Do not solve the exercises manually through MongoDB Compass.
>
> The purpose of this activity is to practice communicating with a remote MongoDB Atlas database through application code.

### Activity Rules

For each exercise:

1. Read the requirement carefully.
2. Identify the collection that contains the required information.
3. Determine which MongoDB operator or method is appropriate.
4. Write the query in your VS Code project.
5. Execute the query against MongoDB Atlas.
6. Inspect the returned documents.
7. Verify that the result satisfies the requirement.

Students should write clean and readable MongoDB queries and avoid modifying 
documents unless the exercise explicitly requires an update operation.

---

### Query Challenges

**Query 01 — Find All Customers**
Retrieve all documents from the `customers` collection.

**Query 02 — Customers From a Specific Country**
Retrieve all customers whose country is "Brazil".

**Query 03 — Customers With Multiple Accounts**
Find customers who have more than one account.

**Query 04 — Customers With a Specific Account**
Find customers whose `accounts` array contains the account number 371138.

**Query 05 — Customers From Multiple Countries**
Retrieve customers whose country is either "Brazil" or "Canada".

**Query 06 — Customers Excluding a Country**
Retrieve all customers whose country is not "Brazil".

**Query 07 — Accounts With High Limits**
Find all accounts whose limit is greater than 9000.

**Query 08 — Accounts Within a Range**
Find accounts whose limit is greater than or equal to 5000 and less than or equal to 10000.

**Query 09 — Accounts With Specific Products**
Find accounts whose `products` array contains "InvestmentStock".

**Query 10 — Accounts With Multiple Products**
Find accounts that contain both "InvestmentStock" and "Commodity" in their `products` array.

**Query 11 — Sort Accounts by Limit**
Retrieve all accounts and sort them by limit from highest to lowest.

**Query 12 — Top Five Accounts**
Retrieve the five accounts with the highest limit.

**Query 13 — Project Customer Information**
Retrieve all customers but return only: `name`, `username`, `email`, `country`. Do not return the `_id` field.

**Query 14 — Search by Email Domain**
Find customers whose email address contains "@gmail.com". Use a regular expression with `$regex`.

**Query 15 — Accounts With Specific Products**
Find accounts that contain either "InvestmentStock" or "Brokerage". Use the `$in` operator.

**Query 16 — Customers With Multiple Conditions**
Find customers who:
- Are from "Brazil".
- Have an account number greater than 100000.

Use an appropriate combination of MongoDB operators.

**Query 17 — Update a Customer**
Find one customer using their username and update their email address. Use the `$set` operator.

**Query 18 — Add a Product to an Account**
Find an account using its account number and add "NewProduct" to its `products` array. Use the `$push` operator.

**Query 19 — Delete an Account**
Find an account with a specific account number and delete that document. Use `deleteOne()`.

**Query 20 — Combined Analysis Query**
Find the accounts that satisfy all of the following conditions:
- The account limit is greater than 5000.
- The account contains "InvestmentStock" in its `products` array.
- Return only the account number, limit, and products.
- Sort the results by limit from highest to lowest.
- Return only the first five results.

---

### Expected Result

By the end of this activity, students should be able to construct intermediate 
MongoDB queries that combine:

- Filtering
- Comparison operators
- Logical operators
- Array queries
- Regular expressions
- Projection
- Sorting
- Limiting
- Updating documents
- Modifying arrays
- Deleting documents

The main objective is not only to obtain the correct result, but to understand 
why each MongoDB operator is appropriate for the problem.

---

### Submission

For each query, students should provide:

- The MongoDB query.
- A screenshot showing the query execution in VS Code.
- A short explanation of what the query does.

Students should organize their work using the following structure:

```
Query 01
- Requirement:
- MongoDB Query:
- Result:
- Explanation:

Query 02
- Requirement:
- MongoDB Query:
- Result:
- Explanation:

...

Query 20
- Requirement:
- MongoDB Query:
- Result:
- Explanation:
```
