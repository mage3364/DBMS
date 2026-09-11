-- ============================================
-- CUSTOMER MANAGEMENT SYSTEM
-- ============================================

-- Create Database
CREATE DATABASE CustomerDB1;

-- Select Database
USE CustomerDB1;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Membership VARCHAR(20),
    Frequency INT,
    Recency INT,
    T INT,
    AvgOrderValue DECIMAL(10,2),
    TotalSpent DECIMAL(10,2)
);

-- Insert Customer Records
INSERT INTO Customers
(
    CustomerID,
    Age,
    Gender,
    Membership,
    Frequency,
    Recency,
    T,
    AvgOrderValue,
    TotalSpent
)
VALUES
('C001', 25, 'Male', 'Basic', 3, 20, 200, 799.00, 2397.00),
('C002', 30, 'Female', 'Premium', 9, 8, 365, 1599.00, 14391.00),
('C003', 34, 'Male', 'Standard', 5, 35, 280, 1199.00, 5995.00),
('C004', 26, 'Female', 'Premium', 11, 6, 410, 1899.00, 20889.00),
('C005', 29, 'Male', 'Basic', 4, 50, 300, 999.00, 3996.00),
('C006', 23, 'Female', 'Free', 2, 90, 180, 699.00, 1398.00),
('C007', 32, 'Male', 'Premium', 13, 4, 450, 1699.00, 22087.00),
('C008', 38, 'Female', 'Standard', 7, 25, 340, 1099.00, 7693.00),
('C009', 21, 'Male', 'Free', 2, 75, 220, 599.00, 1198.00),
('C010', 35, 'Female', 'Premium', 10, 10, 395, 1799.00, 17990.00);

-- Display All Customer Records
SELECT * FROM Customers;