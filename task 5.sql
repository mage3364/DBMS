-- ============================================
-- PAYMENT MANAGEMENT SYSTEM
-- ============================================

-- Create Database
CREATE DATABASE OnlinePaymentDB;

-- Select Database
USE OnlinePaymentDB;

-- Create Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Create Payment Table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    order_id INT,
    payment_mode VARCHAR(30) NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id)
);

-- Insert Customer Records
INSERT INTO Customer VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', '9876501001'),
(102, 'Priya Nair', 'priya@gmail.com', '9876501002'),
(103, 'Vikram Singh', 'vikram@gmail.com', '9876501003'),
(104, 'Anjali Rao', 'anjali@gmail.com', '9876501004'),
(105, 'Suresh Babu', 'suresh@gmail.com', '9876501005');

-- Insert Payment Records
INSERT INTO Payment VALUES
(701, 101, 3001, 'UPI', '2026-09-01', 8500.00, 'Successful'),
(702, 102, 3002, 'Credit Card', '2026-09-02', 14200.00, 'Successful'),
(703, 103, 3003, 'Debit Card', '2026-09-03', 5600.00, 'Pending'),
(704, 104, 3004, 'Net Banking', '2026-09-04', 11800.00, 'Failed'),
(705, 105, 3005, 'UPI', '2026-09-05', 9200.00, 'Successful'),
(706, 101, 3006, 'Cash', '2026-09-06', 2500.00, 'Successful'),
(707, 103, 3007, 'UPI', '2026-09-07', 16500.00, 'Failed'),
(708, 102, 3008, 'Credit Card', '2026-09-08', 7800.00, 'Successful');

-- Display Customers
SELECT * FROM Customer;

-- Display Payments
SELECT * FROM Payment;

-- Display Successful Payments
SELECT *
FROM Payment
WHERE payment_status = 'Successful';

-- Display Failed Payments
SELECT *
FROM Payment
WHERE payment_status = 'Failed';

-- Display Pending Payments
SELECT *
FROM Payment
WHERE payment_status = 'Pending';

-- Update Pending Payment
UPDATE Payment
SET payment_status = 'Successful'
WHERE payment_id = 703;

-- Display Payment Details with Customer Name
SELECT
    p.payment_id,
    c.customer_name,
    p.order_id,
    p.payment_mode,
    p.payment_date,
    p.amount,
    p.payment_status
FROM Payment p
JOIN Customer c
ON p.customer_id = c.customer_id
ORDER BY p.payment_date;

-- Count Transactions by Payment Mode
SELECT
    payment_mode,
    COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_mode
ORDER BY total_transactions DESC;

-- Total Successful Amount by Payment Mode
SELECT
    payment_mode,
    SUM(amount) AS total_amount
FROM Payment
WHERE payment_status = 'Successful'
GROUP BY payment_mode
ORDER BY total_amount DESC;

-- Count Payments by Status
SELECT
    payment_status,
    COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_status;

-- Total Successful Payment Amount
SELECT
    SUM(amount) AS total_successful_amount
FROM Payment
WHERE payment_status = 'Successful';

-- Total Failed Payment Amount
SELECT
    SUM(amount) AS total_failed_amount
FROM Payment
WHERE payment_status = 'Failed';

-- Payments Above 10000
SELECT
    payment_id,
    customer_id,
    order_id,
    payment_mode,
    amount,
    payment_status
FROM Payment
WHERE amount > 10000
ORDER BY amount DESC;

-- Customer Payment Summary
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(p.payment_id) AS total_payments,
    SUM(
        CASE
            WHEN p.payment_status = 'Successful'
            THEN p.amount
            ELSE 0
        END
    ) AS successful_amount
FROM Customer c
LEFT JOIN Payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY successful_amount DESC;

-- Daily Payment Summary
SELECT
    payment_date,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM Payment
GROUP BY payment_date
ORDER BY payment_date;

-- Final Payment Report
SELECT
    p.payment_id,
    c.customer_name,
    p.order_id,
    p.payment_mode,
    p.payment_date,
    p.amount,
    p.payment_status
FROM Payment p
JOIN Customer c
ON p.customer_id = c.customer_id
ORDER BY p.payment_id;
