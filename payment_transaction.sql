-- Week 5 DBMS Task
-- Payment Transaction Management System

CREATE DATABASE IF NOT EXISTS PaymentTransactionDB;
USE PaymentTransactionDB;

-- 1. Create Payment table
DROP TABLE IF EXISTS Payment;

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_ID INT NOT NULL,
    Payment_Mode VARCHAR(30) NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL
);

-- 2. Insert sample payment records
INSERT INTO Payment
(Payment_ID, Customer_ID, Order_ID, Payment_Mode, Payment_Date, Amount, Status)
VALUES
(101, 1, 1001, 'UPI',         '2026-08-01', 2500.00, 'Successful'),
(102, 2, 1002, 'Credit Card', '2026-08-02', 1800.00, 'Successful'),
(103, 3, 1003, 'Debit Card',  '2026-08-03', 3200.00, 'Failed'),
(104, 4, 1004, 'UPI',         '2026-08-04', 1500.00, 'Successful'),
(105, 5, 1005, 'Net Banking', '2026-08-05', 4500.00, 'Successful'),
(106, 6, 1006, 'UPI',         '2026-08-06', 2200.00, 'Failed'),
(107, 7, 1007, 'Credit Card', '2026-08-07', 3800.00, 'Successful'),
(108, 8, 1008, 'Cash',        '2026-08-08', 1200.00, 'Successful'),
(109, 9, 1009, 'Debit Card',  '2026-08-09', 2700.00, 'Successful'),
(110, 10, 1010, 'UPI',        '2026-08-10', 3500.00, 'Successful');

-- 3. Display all payment transactions
SELECT * FROM Payment;

-- 4. Display successful transactions
SELECT *
FROM Payment
WHERE Status = 'Successful';

-- 5. Display failed transactions
SELECT *
FROM Payment
WHERE Status = 'Failed';

-- 6. Count successful and failed transactions
SELECT Status, COUNT(*) AS Transaction_Count
FROM Payment
GROUP BY Status;

-- 7. Calculate total successful payment amount
SELECT SUM(Amount) AS Total_Successful_Amount
FROM Payment
WHERE Status = 'Successful';

-- 8. Calculate total failed payment amount
SELECT SUM(Amount) AS Total_Failed_Amount
FROM Payment
WHERE Status = 'Failed';

-- 9. Analyze payment methods used by customers
SELECT Payment_Mode, COUNT(*) AS Number_of_Transactions
FROM Payment
GROUP BY Payment_Mode
ORDER BY Number_of_Transactions DESC;

-- 10. Calculate successful amount collected through each payment method
SELECT Payment_Mode, SUM(Amount) AS Total_Amount
FROM Payment
WHERE Status = 'Successful'
GROUP BY Payment_Mode
ORDER BY Total_Amount DESC;

-- 11. Find the highest payment
SELECT *
FROM Payment
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

-- 12. Find the lowest payment
SELECT *
FROM Payment
WHERE Amount = (SELECT MIN(Amount) FROM Payment);

-- 13. Generate payment transaction report
SELECT
    Payment_ID,
    Customer_ID,
    Order_ID,
    Payment_Mode,
    Payment_Date,
    Amount,
    Status
FROM Payment
ORDER BY Payment_Date;

-- 14. Generate a report showing only successful payments
SELECT
    Payment_ID,
    Customer_ID,
    Order_ID,
    Payment_Mode,
    Payment_Date,
    Amount
FROM Payment
WHERE Status = 'Successful'
ORDER BY Payment_Date;

-- 15. Generate a report showing only failed payments
SELECT
    Payment_ID,
    Customer_ID,
    Order_ID,
    Payment_Mode,
    Payment_Date,
    Amount
FROM Payment
WHERE Status = 'Failed'
ORDER BY Payment_Date;
