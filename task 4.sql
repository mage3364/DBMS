-- ============================================
-- ORDER MANAGEMENT SYSTEM
-- ============================================

-- Create Database
CREATE DATABASE order_management_db1;

-- Use Database
USE order_management_db1;

-- Create ORDERS Table
CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Create ORDER_DETAILS Table
CREATE TABLE ORDER_DETAILS (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
    REFERENCES ORDERS(order_id)
);

-- Display Tables
SHOW TABLES;

-- Insert Order Records
INSERT INTO ORDERS
(order_id, customer_id, order_date, total_amount)
VALUES
(201, 11, '2024-01-15', 750.00),
(202, 12, '2024-02-20', 1200.00),
(203, 13, '2024-03-12', 450.00),
(204, 14, '2024-04-18', 1850.00),
(205, 15, '2024-05-25', 950.00);

-- Insert Order Details
INSERT INTO ORDER_DETAILS
(order_details_id, order_id, quantity, price, total_amount)
VALUES
(11, 201, 3, 250.00, 750.00),
(12, 202, 4, 300.00, 1200.00),
(13, 203, 2, 225.00, 450.00),
(14, 204, 5, 370.00, 1850.00),
(15, 205, 2, 475.00, 950.00);

-- Display Orders
SELECT * FROM ORDERS;

-- Display Order Details
SELECT * FROM ORDER_DETAILS;

-- Describe Tables
DESC ORDERS;

DESC ORDER_DETAILS;

-- Insert New Order
INSERT INTO ORDERS
(order_id, customer_id, order_date, total_amount)
VALUES
(206, 16, '2024-06-10', 1600.00);

-- Insert Details for New Order
INSERT INTO ORDER_DETAILS
(order_details_id, order_id, quantity, price, total_amount)
VALUES
(16, 206, 4, 400.00, 1600.00);

-- Update Order Amount
UPDATE ORDERS
SET total_amount = 800.00
WHERE order_id = 201;

-- Update Order Details
UPDATE ORDER_DETAILS
SET quantity = 4,
    total_amount = 1000.00
WHERE order_details_id = 11;

-- Update Order Date
UPDATE ORDERS
SET order_date = '2024-01-20'
WHERE order_id = 201;

-- Find Orders for Customer 11
SELECT *
FROM ORDERS
WHERE customer_id = 11;

-- Find Orders Above 1000
SELECT *
FROM ORDERS
WHERE total_amount > 1000;

-- Find Orders Within 2024
SELECT *
FROM ORDERS
WHERE order_date
BETWEEN '2024-01-01' AND '2024-12-31';

-- Join Orders and Order Details
SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.quantity,
    od.price,
    od.total_amount
FROM ORDERS o
JOIN ORDER_DETAILS od
ON o.order_id = od.order_id
ORDER BY o.customer_id;

-- Inner Join
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount AS order_total,
    od.order_details_id,
    od.quantity,
    od.price,
    od.total_amount AS detail_total
FROM ORDERS o
INNER JOIN ORDER_DETAILS od
ON o.order_id = od.order_id;

-- Calculate Total Order Amount
SELECT SUM(total_amount) AS total_order_amount
FROM ORDERS;

-- Calculate Average Order Amount
SELECT AVG(total_amount) AS average_order_amount
FROM ORDERS;

-- Find Highest Order Amount
SELECT MAX(total_amount) AS highest_order_amount
FROM ORDERS;

-- Find Lowest Order Amount
SELECT MIN(total_amount) AS lowest_order_amount
FROM ORDERS;

-- Count Total Orders
SELECT COUNT(*) AS total_orders
FROM ORDERS;

-- Group Orders by Customer
SELECT
    customer_id,
    COUNT(order_id) AS number_of_orders,
    SUM(total_amount) AS total_amount
FROM ORDERS
GROUP BY customer_id;

-- Delete New Order Details
DELETE FROM ORDER_DETAILS
WHERE order_id = 206;

-- Delete New Order
DELETE FROM ORDERS
WHERE order_id = 206;

-- Display Final Orders
SELECT * FROM ORDERS;

-- Display Final Order Details
SELECT * FROM ORDER_DETAILS;

-- Final Join Query
SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.quantity,
    od.price,
    od.total_amount
FROM ORDERS o
INNER JOIN ORDER_DETAILS od
ON o.order_id = od.order_id
ORDER BY o.customer_id;

