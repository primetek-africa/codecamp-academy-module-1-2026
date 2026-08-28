-- =====================================================
-- SQL Query Practice Solutions
-- Electronics Store Database
-- =====================================================

-------------------------------------------------------------------------------
-- Exercise 1
-- Display all categories.
-------------------------------------------------------------------------------

SELECT * FROM category;

-------------------------------------------------------------------------------
-- Exercise 2
-- Display all products.
-------------------------------------------------------------------------------

SELECT * FROM product;

-------------------------------------------------------------------------------
-- Exercise 3
-- Display only the product name, brand, and price.
-------------------------------------------------------------------------------

SELECT name, brand, price
FROM product;

-------------------------------------------------------------------------------
-- Exercise 4
-- Display all customers.
-------------------------------------------------------------------------------

SELECT * FROM customer;

-------------------------------------------------------------------------------
-- Exercise 5
-- Display all customer orders.
-------------------------------------------------------------------------------

SELECT * FROM customer_order;

-------------------------------------------------------------------------------
-- Exercise 6
-- Display all products with the status "Available".
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE status = 'Available';

-------------------------------------------------------------------------------
-- Exercise 7
-- Display all products with the status "Out of Stock".
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE status = 'Out of Stock';

-------------------------------------------------------------------------------
-- Exercise 8
-- Display all products that cost more than $1,000.
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE price > 1000;

-------------------------------------------------------------------------------
-- Exercise 9
-- Display all customers who live in New York.
-------------------------------------------------------------------------------

SELECT *
FROM customer
WHERE city = 'New York';

-------------------------------------------------------------------------------
-- Exercise 10
-- Display all orders with the status "Delivered".
-------------------------------------------------------------------------------

SELECT *
FROM customer_order
WHERE status = 'Delivered';

-------------------------------------------------------------------------------
-- Exercise 11
-- Display all products ordered by price from highest to lowest.
-------------------------------------------------------------------------------

SELECT *
FROM product
ORDER BY price DESC;

-------------------------------------------------------------------------------
-- Exercise 12
-- Display all customers ordered alphabetically by last name.
-------------------------------------------------------------------------------

SELECT *
FROM customer
ORDER BY last_name ASC;

-------------------------------------------------------------------------------
-- Exercise 13
-- Display all products whose name starts with the letter "S".
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE name LIKE 'S%';

-------------------------------------------------------------------------------
-- Exercise 14
-- Display all products whose name contains the word "Monitor".
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE name LIKE '%Monitor%';

-------------------------------------------------------------------------------
-- Exercise 15
-- Count the total number of products.
-------------------------------------------------------------------------------

SELECT COUNT(*)
FROM product;

-------------------------------------------------------------------------------
-- Exercise 16
-- Display the most expensive product price.
-------------------------------------------------------------------------------

SELECT MAX(price)
FROM product;

-------------------------------------------------------------------------------
-- Exercise 17
-- Display all available products that cost more than $500.
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE status = 'Available'
AND price > 500;

-------------------------------------------------------------------------------
-- Exercise 18
-- Display all products that are either Out of Stock or Discontinued.
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE status = 'Out of Stock'
OR status = 'Discontinued';

-------------------------------------------------------------------------------
-- Exercise 19
-- Display the five most expensive products.
-------------------------------------------------------------------------------

SELECT *
FROM product
ORDER BY price DESC
LIMIT 5;

-------------------------------------------------------------------------------
-- Exercise 20
-- Display all products with 0 units in stock.
-------------------------------------------------------------------------------

SELECT *
FROM product
WHERE stock = 0;