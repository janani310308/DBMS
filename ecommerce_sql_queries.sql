-- SQL Query Implementation for E-Commerce Database
-- DBMS: MySQL 8.0
-- Task: SELECT, WHERE, ORDER BY, DISTINCT, filtering and basic reports

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- 1. Create Tables

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,
    Available BOOLEAN,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 2. Insert Sample Data

INSERT INTO Customers VALUES
(1, 'Ravi', 'ravi@gmail.com', 'Chennai'),
(2, 'Priya', 'priya@gmail.com', 'Villupuram'),
(3, 'Arun', 'arun@gmail.com', 'Pondicherry'),
(4, 'Divya', 'divya@gmail.com', 'Chennai'),
(5, 'Kavin', 'kavin@gmail.com', 'Madurai');

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances');

INSERT INTO Products VALUES
(101, 'Laptop', 1, 55000.00, 10, TRUE),
(102, 'Smartphone', 1, 25000.00, 15, TRUE),
(103, 'Headphones', 1, 2500.00, 25, TRUE),
(104, 'T-Shirt', 2, 799.00, 30, TRUE),
(105, 'Jeans', 2, 1499.00, 20, TRUE),
(106, 'SQL Book', 3, 650.00, 12, TRUE),
(107, 'Python Book', 3, 850.00, 0, FALSE),
(108, 'Mixer Grinder', 4, 3500.00, 8, TRUE);

-- 3. SELECT Queries

-- Display all customers
SELECT * FROM Customers;

-- Display all products
SELECT * FROM Products;

-- Display selected customer information
SELECT CustomerID, CustomerName, City
FROM Customers;

-- Display selected product information
SELECT ProductID, ProductName, Price
FROM Products;

-- 4. WHERE Queries

-- Products costing more than 2000
SELECT *
FROM Products
WHERE Price > 2000;

-- Products costing less than or equal to 1500
SELECT *
FROM Products
WHERE Price <= 1500;

-- Products with stock available
SELECT *
FROM Products
WHERE Stock > 0;

-- Products that are unavailable
SELECT *
FROM Products
WHERE Available = FALSE;

-- 5. ORDER BY Queries

-- Products from lowest to highest price
SELECT *
FROM Products
ORDER BY Price ASC;

-- Products from highest to lowest price
SELECT *
FROM Products
ORDER BY Price DESC;

-- Customers sorted alphabetically
SELECT *
FROM Customers
ORDER BY CustomerName ASC;

-- 6. DISTINCT Queries

-- Display unique customer cities
SELECT DISTINCT City
FROM Customers;

-- Display unique category IDs used by products
SELECT DISTINCT CategoryID
FROM Products;

-- 7. Search Products by Price

SELECT *
FROM Products
WHERE Price BETWEEN 1000 AND 30000;

-- 8. Search Products by Category

SELECT p.ProductID, p.ProductName, c.CategoryName, p.Price
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Electronics';

-- 9. Search Available Products in a Category

SELECT p.ProductID, p.ProductName, c.CategoryName, p.Price, p.Stock
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Books'
AND p.Available = TRUE;

-- 10. Apply Multiple Filtering Conditions

SELECT *
FROM Products
WHERE Price > 1000
AND Stock > 0
AND Available = TRUE;

-- Products matching either condition
SELECT *
FROM Products
WHERE CategoryID = 1
OR Price < 1000;

-- 11. Retrieve Customer and Product Information

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    p.ProductName,
    p.Price
FROM Customers c
CROSS JOIN Products p
LIMIT 10;

-- 12. Basic Business Reports

-- Total number of products
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- Number of available products
SELECT COUNT(*) AS AvailableProducts
FROM Products
WHERE Available = TRUE;

-- Average product price
SELECT AVG(Price) AS AveragePrice
FROM Products;

-- Highest product price
SELECT MAX(Price) AS HighestPrice
FROM Products;

-- Lowest product price
SELECT MIN(Price) AS LowestPrice
FROM Products;

-- Total stock available
SELECT SUM(Stock) AS TotalStock
FROM Products;

-- Number of products in each category
SELECT
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- Average price by category
SELECT
    c.CategoryName,
    AVG(p.Price) AS AveragePrice
FROM Categories c
JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- Products ordered by category and price
SELECT
    c.CategoryName,
    p.ProductName,
    p.Price,
    p.Stock
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName ASC, p.Price DESC;
