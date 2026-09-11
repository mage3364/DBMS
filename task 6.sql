-- =====================================================
-- CUSTOMER PAYMENT MANAGEMENT SYSTEM
-- =====================================================

-- Remove the database if it already exists
DROP DATABASE IF EXISTS OnlinePaymentDB;

-- Create Database
CREATE DATABASE OnlinePaymentDB;

-- Select Database
USE OnlinePaymentDB;


-- =====================================================
-- 1. CREATE CUSTOMER TABLE
-- =====================================================

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);


-- =====================================================
-- 2. CREATE PAYMENT TABLE
-- =====================================================

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_id INT NOT NULL,
    payment_mode VARCHAR(30) NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_payment_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);


-- =====================================================
-- 3. INSERT CUSTOMER DATA
-- =====================================================

INSERT INTO Customer
(customer_id, customer_name, email, phone)
VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', '9876501001'),
(102, 'Priya Nair', 'priya@gmail.com', '9876501002'),
(103, 'Vikram Singh', 'vikram@gmail.com', '9876501003'),
(104, 'Anjali Rao', 'anjali@gmail.com', '9876501004'),
(105, 'Suresh Babu', 'suresh@gmail.com', '9876501005'),
(106, 'Kavya Iyer', 'kavya@gmail.com', '9876501006'),
(107, 'Arun Kumar', 'arun@gmail.com', '9876501007'),
(108, 'Divya Menon', 'divya@gmail.com', '9876501008');


-- =====================================================
-- 4. INSERT PAYMENT DATA
-- =====================================================

INSERT INTO Payment
(payment_id, customer_id, order_id, payment_mode, payment_date, amount, payment_status)
VALUES
(701, 101, 3001, 'UPI',          '2026-09-01',  8500.00, 'Successful'),
(702, 102, 3002, 'Credit Card',  '2026-09-02', 14200.00, 'Successful'),
(703, 103, 3003, 'Debit Card',   '2026-09-03',  5600.00, 'Pending'),
(704, 104, 3004, 'Net Banking', '2026-09-04', 11800.00, 'Failed'),
(705, 105, 3005, 'UPI',          '2026-09-05',  9200.00, 'Successful'),
(706, 101, 3006, 'Cash',         '2026-09-06',  2500.00, 'Successful'),
(707, 103, 3007, 'UPI',          '2026-09-07', 16500.00, 'Failed'),
(708, 102, 3008, 'Credit Card',  '2026-09-08',  7800.00, 'Successful'),
(709, 106, 3009, 'UPI',          '2026-09-09',  6300.00, 'Successful'),
(710, 107, 3010, 'Debit Card',   '2026-09-10',  9900.00, 'Successful'),
(711, 108, 3011, 'Net Banking', '2026-09-11', 15200.00, 'Pending');


-- =====================================================
-- 5. DISPLAY ALL CUSTOMERS
-- =====================================================

SELECT * FROM Customer;


-- =====================================================
-- 6. DISPLAY ALL PAYMENTS
-- =====================================================

SELECT * FROM Payment;


-- =====================================================
-- 7. DISPLAY CUSTOMER TABLE STRUCTURE
-- =====================================================

DESC Customer;


-- =====================================================
-- 8. DISPLAY PAYMENT TABLE STRUCTURE
-- =====================================================

DESC Payment;


-- =====================================================
-- 9. DISPLAY SUCCESSFUL PAYMENTS
-- =====================================================

SELECT *
FROM Payment
WHERE payment_status = 'Successful';


-- =====================================================
-- 10. DISPLAY FAILED PAYMENTS
-- =====================================================

SELECT *
FROM Payment
WHERE payment_status = 'Failed';


-- =====================================================
-- 11. DISPLAY PENDING PAYMENTS
-- =====================================================

SELECT *
FROM Payment
WHERE payment_status = 'Pending';


-- =====================================================
-- 12. DISPLAY PAYMENTS ABOVE 10000
-- =====================================================

SELECT *
FROM Payment
WHERE amount > 10000
ORDER BY amount DESC;


-- =====================================================
-- 13. DISPLAY PAYMENTS BETWEEN 5000 AND 10000
-- =====================================================

SELECT *
FROM Payment
WHERE amount BETWEEN 5000 AND 10000
ORDER BY amount;


-- =====================================================
-- 14. DISPLAY PAYMENTS USING UPI
-- =====================================================

SELECT *
FROM Payment
WHERE payment_mode = 'UPI';


-- =====================================================
-- 15. UPDATE A PENDING PAYMENT
-- =====================================================

UPDATE Payment
SET payment_status = 'Successful'
WHERE payment_id = 703;


-- =====================================================
-- 16. UPDATE PAYMENT AMOUNT
-- =====================================================

UPDATE Payment
SET amount = 5700.00
WHERE payment_id = 703;


-- =====================================================
-- 17. UPDATE CUSTOMER PHONE NUMBER
-- =====================================================

UPDATE Customer
SET phone = '9876599999'
WHERE customer_id = 106;


-- =====================================================
-- 18. INNER JOIN CUSTOMER AND PAYMENT
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    p.payment_id,
    p.order_id,
    p.payment_mode,
    p.payment_date,
    p.amount,
    p.payment_status
FROM Customer c
INNER JOIN Payment p
ON c.customer_id = p.customer_id
ORDER BY c.customer_id;


-- =====================================================
-- 19. CUSTOMER PAYMENT DETAILS
-- =====================================================

SELECT
    c.customer_name,
    p.payment_id,
    p.order_id,
    p.amount,
    p.payment_status
FROM Customer c
JOIN Payment p
ON c.customer_id = p.customer_id;


-- =====================================================
-- 20. COUNT PAYMENTS BY PAYMENT MODE
-- =====================================================

SELECT
    payment_mode,
    COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_mode
ORDER BY total_transactions DESC;


-- =====================================================
-- 21. COUNT PAYMENTS BY STATUS
-- =====================================================

SELECT
    payment_status,
    COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_status;


-- =====================================================
-- 22. TOTAL PAYMENT AMOUNT
-- =====================================================

SELECT
    SUM(amount) AS total_payment_amount
FROM Payment;


-- =====================================================
-- 23. TOTAL SUCCESSFUL PAYMENT AMOUNT
-- =====================================================

SELECT
    SUM(amount) AS total_successful_amount
FROM Payment
WHERE payment_status = 'Successful';


-- =====================================================
-- 24. TOTAL FAILED PAYMENT AMOUNT
-- =====================================================

SELECT
    SUM(amount) AS total_failed_amount
FROM Payment
WHERE payment_status = 'Failed';


-- =====================================================
-- 25. AVERAGE PAYMENT AMOUNT
-- =====================================================

SELECT
    AVG(amount) AS average_payment_amount
FROM Payment;


-- =====================================================
-- 26. HIGHEST PAYMENT
-- =====================================================

SELECT
    MAX(amount) AS highest_payment
FROM Payment;


-- =====================================================
-- 27. LOWEST PAYMENT
-- =====================================================

SELECT
    MIN(amount) AS lowest_payment
FROM Payment;


-- =====================================================
-- 28. TOTAL NUMBER OF PAYMENTS
-- =====================================================

SELECT
    COUNT(*) AS total_payments
FROM Payment;


-- =====================================================
-- 29. CUSTOMER PAYMENT SUMMARY
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(p.payment_id) AS total_payments,
    SUM(p.amount) AS total_amount
FROM Customer c
LEFT JOIN Payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_amount DESC;


-- =====================================================
-- 30. SUCCESSFUL PAYMENT SUMMARY BY CUSTOMER
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(p.payment_id) AS successful_payments,
    SUM(p.amount) AS successful_amount
FROM Customer c
JOIN Payment p
ON c.customer_id = p.customer_id
WHERE p.payment_status = 'Successful'
GROUP BY c.customer_id, c.customer_name
ORDER BY successful_amount DESC;


-- =====================================================
-- 31. PAYMENT SUMMARY BY PAYMENT MODE
-- =====================================================

SELECT
    payment_mode,
    COUNT(*) AS transactions,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM Payment
GROUP BY payment_mode
ORDER BY total_amount DESC;


-- =====================================================
-- 32. DAILY PAYMENT SUMMARY
-- =====================================================

SELECT
    payment_date,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM Payment
GROUP BY payment_date
ORDER BY payment_date;


-- =====================================================
-- 33. CUSTOMERS WHO MADE PAYMENTS ABOVE 10000
-- =====================================================

SELECT DISTINCT
    c.customer_id,
    c.customer_name,
    p.amount
FROM Customer c
JOIN Payment p
ON c.customer_id = p.customer_id
WHERE p.amount > 10000
ORDER BY p.amount DESC;


-- =====================================================
-- 34. PAYMENT STATUS USING CASE
-- =====================================================

SELECT
    payment_id,
    customer_id,
    amount,
    payment_status,
    CASE
        WHEN payment_status = 'Successful'
            THEN 'Payment Completed'
        WHEN payment_status = 'Pending'
            THEN 'Payment Waiting'
        WHEN payment_status = 'Failed'
            THEN 'Payment Unsuccessful'
        ELSE 'Unknown Status'
    END AS status_description
FROM Payment;


-- =====================================================
-- 35. DELETE A PAYMENT
-- =====================================================

DELETE FROM Payment
WHERE payment_id = 711;


-- =====================================================
-- 36. FINAL CUSTOMER RECORDS
-- =====================================================

SELECT * FROM Customer;


-- =====================================================
-- 37. FINAL PAYMENT RECORDS
-- =====================================================

SELECT * FROM Payment;


-- =====================================================
-- 38. FINAL CUSTOMER PAYMENT REPORT
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    p.payment_id,
    p.order_id,
    p.payment_mode,
    p.payment_date,
    p.amount,
    p.payment_status
FROM Customer c
INNER JOIN Payment p
ON c.customer_id = p.customer_id
ORDER BY p.payment_date;

