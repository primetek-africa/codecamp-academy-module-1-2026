-- =====================================================
-- INSERT DATA
-- TABLE: CATEGORY
-- =====================================================

INSERT INTO category (name, description)
VALUES
('Laptops', 'Portable computers'),
('Smartphones', 'Mobile phones and accessories'),
('Monitors', 'Computer displays'),
('Gaming', 'Gaming peripherals and consoles'),
('Audio', 'Headphones and speakers');

-- =====================================================
-- INSERT DATA
-- TABLE: PRODUCT
-- =====================================================

INSERT INTO product (name, brand, price, stock, status, category_id)
VALUES
('MacBook Air M2', 'Apple', 1199.99, 15, 'Available', 1),
('Dell XPS 13', 'Dell', 1299.99, 8, 'Available', 1),
('Lenovo ThinkPad X1', 'Lenovo', 1499.99, 0, 'Out of Stock', 1),
('HP Spectre x360', 'HP', 1399.99, 4, 'Available', 1),
('Asus ROG Zephyrus', 'Asus', 1899.99, 2, 'Available', 1),
('iPhone 16', 'Apple', 999.99, 20, 'Available', 2),
('Galaxy S25', 'Samsung', 949.99, 0, 'Out of Stock', 2),
('Google Pixel 10', 'Google', 899.99, 10, 'Available', 2),
('Motorola Edge 60', 'Motorola', 699.99, 5, 'Available', 2),
('Nokia XR30', 'Nokia', 599.99, 0, 'Discontinued', 2),
('LG UltraWide 34"', 'LG', 499.99, 7, 'Available', 3),
('Samsung Odyssey G7', 'Samsung', 699.99, 3, 'Available', 3),
('Dell UltraSharp', 'Dell', 549.99, 0, 'Out of Stock', 3),
('Acer Nitro Monitor', 'Acer', 349.99, 12, 'Available', 3),
('MSI Curved Monitor', 'MSI', 429.99, 0, 'Discontinued', 3),
('PlayStation 5', 'Sony', 499.99, 6, 'Available', 4),
('Xbox Series X', 'Microsoft', 499.99, 0, 'Out of Stock', 4),
('Nintendo Switch OLED', 'Nintendo', 349.99, 18, 'Available', 4),
('Logitech G Pro X', 'Logitech', 129.99, 25, 'Available', 4),
('Razer BlackWidow V4', 'Razer', 189.99, 0, 'Discontinued', 4),
('AirPods Pro 3', 'Apple', 249.99, 30, 'Available', 5),
('Sony WH-1000XM6', 'Sony', 399.99, 9, 'Available', 5),
('JBL Charge 6', 'JBL', 199.99, 14, 'Available', 5),
('Bose QuietComfort', 'Bose', 349.99, 0, 'Out of Stock', 5),
('Anker Soundcore Q45', 'Anker', 149.99, 11, 'Available', 5);

-- =====================================================
-- INSERT DATA
-- TABLE: CUSTOMER
-- =====================================================

INSERT INTO customer (first_name, last_name, email, city)
VALUES
('John', 'Smith', 'john.smith@email.com', 'New York'),
('Emily', 'Johnson', 'emily.johnson@email.com', 'Chicago'),
('Michael', 'Brown', 'michael.brown@email.com', 'Dallas'),
('Sophia', 'Davis', 'sophia.davis@email.com', 'Miami'),
('Daniel', 'Wilson', 'daniel.wilson@email.com', 'Seattle'),
('Olivia', 'Martinez', 'olivia@email.com', 'New York'),
('Ethan', 'Walker', 'ethan@email.com', 'Boston'),
('Isabella', 'Hall', 'isabella@email.com', 'Chicago'),
('Liam', 'Young', 'liam@email.com', 'Houston'),
('Mia', 'Allen', 'mia@email.com', 'Los Angeles'),
('Noah', 'King', 'noah@email.com', 'Dallas'),
('Charlotte', 'Scott', 'charlotte@email.com', 'Seattle'),
('James', 'Green', 'james@email.com', 'Phoenix'),
('Amelia', 'Baker', 'amelia@email.com', 'Miami'),
('Benjamin', 'Adams', 'benjamin@email.com', 'New York');

-- =====================================================
-- INSERT DATA
-- TABLE: CUSTOMER_ORDER
-- =====================================================

INSERT INTO customer_order (customer_id, product_id, quantity, total, order_date, status)
VALUES
(1, 6, 1, 999.99, '2026-07-01', 'Delivered'),
(2, 1, 1, 1199.99, '2026-07-02', 'Delivered'),
(3, 16, 2, 999.98, '2026-07-03', 'Processing'),
(4, 21, 1, 249.99, '2026-07-04', 'Pending'),
(5, 18, 1, 349.99, '2026-07-05', 'Shipped'),
(6, 12, 2, 1399.98, '2026-07-06', 'Delivered'),
(7, 22, 1, 399.99, '2026-07-07', 'Cancelled'),
(8, 4, 1, 1399.99, '2026-07-08', 'Delivered'),
(9, 23, 3, 599.97, '2026-07-09', 'Processing'),
(10, 14, 2, 699.98, '2026-07-10', 'Pending'),
(11, 2, 1, 1299.99, '2026-07-11', 'Delivered'),
(12, 25, 2, 299.98, '2026-07-12', 'Shipped'),
(13, 11, 1, 499.99, '2026-07-13', 'Cancelled'),
(14, 8, 1, 899.99, '2026-07-14', 'Delivered'),
(15, 19, 2, 259.98, '2026-07-15', 'Processing'),
(1, 24, 1, 349.99, '2026-07-16', 'Pending'),
(2, 5, 1, 1899.99, '2026-07-17', 'Delivered'),
(3, 3, 1, 1499.99, '2026-07-18', 'Cancelled'),
(4, 9, 2, 1399.98, '2026-07-19', 'Delivered'),
(5, 17, 1, 499.99, '2026-07-20', 'Shipped');