-- DATABASE RELATIONSHIP ANALYSIS USING JOINS

-- 1. CREATE DATABASE
CREATE DATABASE ShopDB;
USE ShopDB;

-- 2. CREATE CUSTOMER TABLE
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

-- 3. CREATE PRODUCT TABLE
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2)
);

-- 4. CREATE ORDERS TABLE
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT,
    Order_Date DATE,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

-- 5. CREATE PAYMENT TABLE
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Mode VARCHAR(30),
    Amount DECIMAL(10,2),
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);

-- 6. INSERT CUSTOMER RECORDS
INSERT INTO Customer VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Villupuram'),
(3, 'Kumar', 'Pondicherry'),
(4, 'Divya', 'Chennai');

-- 7. INSERT PRODUCT RECORDS
INSERT INTO Product VALUES
(101, 'Laptop', 50000),
(102, 'Mobile', 20000),
(103, 'Keyboard', 1500),
(104, 'Mouse', 500);

-- 8. INSERT ORDER RECORDS
INSERT INTO Orders VALUES
(201, 1, 101, 1, '2026-10-20'),
(202, 2, 102, 2, '2026-10-21'),
(203, 1, 103, 1, '2026-10-22'),
(204, 3, 104, 2, '2026-10-23');

-- 9. INSERT PAYMENT RECORDS
INSERT INTO Payment VALUES
(301, 201, 'UPI', 50000),
(302, 202, 'Cash', 40000),
(303, 203, 'Card', 1500);

-- 10. INNER JOIN
SELECT
    Customer.Customer_Name,
    Orders.Order_ID,
    Product.Product_Name,
    Orders.Quantity
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
INNER JOIN Product
ON Orders.Product_ID = Product.Product_ID;

-- 11. LEFT JOIN
SELECT
    Customer.Customer_Name,
    Orders.Order_ID
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;

-- 12. RIGHT JOIN
SELECT
    Customer.Customer_Name,
    Orders.Order_ID
FROM Orders
RIGHT JOIN Customer
ON Orders.Customer_ID = Customer.Customer_ID;

-- 13. COMPLETE ORDER DETAILS
SELECT
    Customer.Customer_Name,
    Orders.Order_ID,
    Product.Product_Name,
    Orders.Quantity,
    Product.Price,
    Payment.Payment_Mode,
    Payment.Amount
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
INNER JOIN Product
ON Orders.Product_ID = Product.Product_ID
LEFT JOIN Payment
ON Orders.Order_ID = Payment.Order_ID;

-- 14. CUSTOMER PURCHASE HISTORY
SELECT
    Customer.Customer_Name,
    Product.Product_Name,
    Orders.Quantity,
    Orders.Order_Date
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
INNER JOIN Product
ON Orders.Product_ID = Product.Product_ID
ORDER BY Customer.Customer_Name;

-- 15. MULTI-TABLE REPORT
SELECT
    Customer.Customer_Name,
    COUNT(DISTINCT Orders.Order_ID) AS Total_Orders,
    COALESCE(SUM(Payment.Amount), 0) AS Total_Amount
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
LEFT JOIN Payment
ON Orders.Order_ID = Payment.Order_ID
GROUP BY Customer.Customer_ID,
         Customer.Customer_Name;

-- 16. PAYMENT REPORT
SELECT
    Customer.Customer_Name,
    Orders.Order_ID,
    Product.Product_Name,
    Payment.Payment_Mode,
    Payment.Amount
FROM Payment
INNER JOIN Orders
ON Payment.Order_ID = Orders.Order_ID
INNER JOIN Customer
ON Orders.Customer_ID = Customer.Customer_ID
INNER JOIN Product
ON Orders.Product_ID = Product.Product_ID;
