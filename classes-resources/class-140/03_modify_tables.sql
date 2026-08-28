-- =====================================================
-- UPDATE STATEMENTS
-- =====================================================

-- =====================================================
-- Update the price of the product number 1
SELECT * FROM product WHERE id = 1;
SELECT * FROM product WHERE id = 1;
UPDATE product SET price = 1249.99 WHERE id = 1;
-- =====================================================

-- =====================================================
-- Increase the stock of product number 7
SELECT * FROM product WHERE id = 7;
UPDATE product SET stock = 15 WHERE id = 7;
-- =====================================================

-- =====================================================
-- Change the status of the product number 7 to Available
SELECT * FROM product WHERE id = 7;
UPDATE product SET status = 'Available' WHERE id = 7;
-- =====================================================

-- =====================================================
-- Update the city of a customer number 6
SELECT * FROM customer WHERE id = 6;
UPDATE customer SET city = 'San Francisco' WHERE id = 6;
-- =====================================================

-- =====================================================
-- Update the email of the customer number 7
SELECT * FROM customer WHERE id = 7;
UPDATE customer SET email = 'ethan/walker@email.com' WHERE id = 7;
-- =====================================================

-- =====================================================
-- Update the quantity of the order number 4
SELECT * FROM customer_order WHERE id = 4;
UPDATE customer_order SET quantity = 3 WHERE id = 4;
-- =====================================================

-- =====================================================
-- Update the total of the order number 4
SELECT * FROM customer_order WHERE id = 4;
UPDATE customer_order SET total = 749.97 WHERE id = 4;
-- =====================================================

-- =====================================================
-- DELETE STATEMENTS
-- =====================================================

-- =====================================================
-- Delete a customer order number 20
SELECT * FROM customer_order WHERE id = 20;
DELETE FROM customer_order WHERE id = 20;
-- =====================================================

-- =====================================================
-- Delete a customer number 15
SELECT * FROM customer WHERE id = 15;
DELETE FROM customer WHERE id = 15;
-- =====================================================

-- =====================================================
-- Delete a discontinued product number 20
SELECT * FROM product WHERE id = 20;
DELETE FROM product WHERE id = 20;
-- =====================================================

-- =====================================================
-- Delete a category
SELECT * FROM category;
DELETE FROM category WHERE id = 3;
-- =====================================================

