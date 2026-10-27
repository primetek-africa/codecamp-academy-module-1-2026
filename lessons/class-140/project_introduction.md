# Project: Electronics Store Database

## Problem Description

A local electronics retailer has experienced significant growth in recent
months. The business currently sells a wide variety of electronic
products, including laptops, smartphones, gaming devices, monitors, and
audio equipment.

At the moment, the store manages most of its information using
spreadsheets and handwritten notes. Employees manually record products,
customer information, and customer orders. As the number of products and
sales has increased, this process has become slow, difficult to manage,
and prone to errors.

Some of the problems the company faces include:

- Products are difficult to organize by category.
- Employees cannot easily determine whether a product is available or
  out of stock.
- Customer information is duplicated across different spreadsheets.
- Order records are stored separately from customer information.
- Finding information requires searching through multiple files.
- Generating reports about products and orders takes a significant
  amount of time.
- Data inconsistencies occur because multiple employees update different
  spreadsheets independently.

To improve its operations, the company has decided to replace the manual
system with a relational database using PostgreSQL.

The new system should organize all information in a structured way,
reduce duplicated data, improve data consistency, and make it easier to
retrieve information using SQL queries.

---

# Business Requirements

The company needs to store information about:

- Product categories.
- Products sold by the store.
- Customers.
- Customer orders.

---

# Product Categories

Each category should include:

- Category name.
- Description.

Examples:

- Laptops
- Smartphones
- Monitors
- Gaming
- Audio

---

# Products

Each product belongs to one category.

For every product, the company wants to store:

- Product name.
- Brand.
- Price.
- Stock quantity.
- Current status.
- Category.

Possible product status values include:

- Available
- Out of Stock
- Discontinued

---

# Customers

For each customer, the company wants to store:

- First name.
- Last name.
- Email address.
- City.

---

# Customer Orders

Whenever a customer purchases one or more products, an order should be
recorded.

Each order should contain:

- Customer.
- Product purchased.
- Quantity.
- Total amount.
- Order date.
- Order status.

Possible order status values include:

- Pending
- Processing
- Shipped
- Delivered
- Cancelled

---

# Your Task

Before writing any SQL code, analyze the business requirements and
answer the following questions.

1. What entities can you identify in the system?

2. Which attributes belong to each entity?

3. Which attribute should be the primary key of each table?

4. How are the entities related to one another?

5. Which tables depend on other tables?

6. Which foreign keys will be required?

7. Which data types should be used for each attribute?

8. Which constraints should be applied to improve data integrity?

---

# Expected Database Design

After completing the analysis, the database should contain four tables:

- `category`
- `product`
- `customer`
- `customer_order`

These tables should be connected through appropriate primary and foreign
key relationships.

Once the design is complete, the next steps will be:

1. Create the database.
2. Create the tables.
3. Insert sample data.
4. Query the data using SQL.
5. Update records.
6. Delete records.
7. Continue expanding the database with more advanced SQL concepts.