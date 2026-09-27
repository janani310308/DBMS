# SQL Query Implementation for E-Commerce Database

## Task Name

**SQL Query Implementation for E-Commerce Database**

## Description

This project demonstrates the implementation of basic and practical SQL queries for an E-Commerce database using **MySQL 8.0**.

The project covers data retrieval, filtering, sorting, product searching, customer and product information retrieval, and basic business reports.

## Objectives

The main objectives of this project are:

1. Perform `SELECT`, `WHERE`, `ORDER BY`, and `DISTINCT` queries.
2. Search products based on price, category, and availability.
3. Retrieve customer and product information.
4. Apply different filtering conditions.
5. Generate basic business reports using aggregate functions and grouping.

## Technologies Used

- **Database:** MySQL
- **DBMS Tool:** MySQL Workbench
- **SQL:** MySQL 8.0

## Database Structure

The project uses three main tables:

### 1. Customers

Stores customer information.

| Column | Data Type | Description |
|---|---|---|
| CustomerID | INT | Unique customer ID |
| CustomerName | VARCHAR(100) | Customer name |
| Email | VARCHAR(100) | Customer email |
| City | VARCHAR(50) | Customer city |

### 2. Categories

Stores product category information.

| Column | Data Type | Description |
|---|---|---|
| CategoryID | INT | Unique category ID |
| CategoryName | VARCHAR(50) | Category name |

### 3. Products

Stores product details.

| Column | Data Type | Description |
|---|---|---|
| ProductID | INT | Unique product ID |
| ProductName | VARCHAR(100) | Product name |
| CategoryID | INT | Product category ID |
| Price | DECIMAL(10,2) | Product price |
| Stock | INT | Available stock |
| Available | BOOLEAN | Product availability |

## Database Relationship

The `Products` table is connected to the `Categories` table using `CategoryID`.

```text
Categories
    |
    | CategoryID
    |
    v
Products

Customers
```

## Sample Data

### Customers

| CustomerID | CustomerName | City |
|---:|---|---|
| 1 | Ravi | Chennai |
| 2 | Priya | Villupuram |
| 3 | Arun | Pondicherry |
| 4 | Divya | Chennai |
| 5 | Kavin | Madurai |

### Categories

| CategoryID | CategoryName |
|---:|---|
| 1 | Electronics |
| 2 | Clothing |
| 3 | Books |
| 4 | Home Appliances |

### Products

| ProductID | ProductName | CategoryID | Price | Stock | Available |
|---:|---|---:|---:|---:|---|
| 101 | Laptop | 1 | 55000.00 | 10 | TRUE |
| 102 | Smartphone | 1 | 25000.00 | 15 | TRUE |
| 103 | Headphones | 1 | 2500.00 | 25 | TRUE |
| 104 | T-Shirt | 2 | 799.00 | 30 | TRUE |
| 105 | Jeans | 2 | 1499.00 | 20 | TRUE |
| 106 | SQL Book | 3 | 650.00 | 12 | TRUE |
| 107 | Python Book | 3 | 850.00 | 0 | FALSE |
| 108 | Mixer Grinder | 4 | 3500.00 | 8 | TRUE |

## SQL Queries Implemented

### 1. SELECT Queries

Used to retrieve data from the database.

Examples:

```sql
SELECT * FROM Customers;

SELECT * FROM Products;

SELECT CustomerID, CustomerName, City
FROM Customers;

SELECT ProductID, ProductName, Price
FROM Products;
```

### 2. WHERE Queries

Used to filter records based on conditions.

Examples:

```sql
SELECT *
FROM Products
WHERE Price > 2000;
```

```sql
SELECT *
FROM Products
WHERE Stock > 0;
```

```sql
SELECT *
FROM Products
WHERE Available = FALSE;
```

### 3. ORDER BY Queries

Used to sort records in ascending or descending order.

```sql
SELECT *
FROM Products
ORDER BY Price ASC;
```

```sql
SELECT *
FROM Products
ORDER BY Price DESC;
```

### 4. DISTINCT Queries

Used to retrieve unique values.

```sql
SELECT DISTINCT City
FROM Customers;
```

```sql
SELECT DISTINCT CategoryID
FROM Products;
```

### 5. Product Search by Price

Products can be searched within a specific price range.

```sql
SELECT *
FROM Products
WHERE Price BETWEEN 1000 AND 30000;
```

### 6. Product Search by Category

Products can be searched based on their category.

```sql
SELECT p.ProductID, p.ProductName, c.CategoryName, p.Price
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Electronics';
```

### 7. Product Search by Availability

Available products can be filtered using stock and availability conditions.

```sql
SELECT p.ProductID, p.ProductName, c.CategoryName, p.Price, p.Stock
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Books'
AND p.Available = TRUE;
```

### 8. Multiple Filtering Conditions

Multiple conditions can be combined using `AND` and `OR`.

```sql
SELECT *
FROM Products
WHERE Price > 1000
AND Stock > 0
AND Available = TRUE;
```

### 9. Customer and Product Information

Customer and product information can be retrieved using SQL queries and joins.

```sql
SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    p.ProductName,
    p.Price
FROM Customers c
CROSS JOIN Products p
LIMIT 10;
```

### 10. Basic Business Reports

Aggregate functions are used to generate business information.

#### Total Number of Products

```sql
SELECT COUNT(*) AS TotalProducts
FROM Products;
```

#### Number of Available Products

```sql
SELECT COUNT(*) AS AvailableProducts
FROM Products
WHERE Available = TRUE;
```

#### Average Product Price

```sql
SELECT AVG(Price) AS AveragePrice
FROM Products;
```

#### Highest Product Price

```sql
SELECT MAX(Price) AS HighestPrice
FROM Products;
```

#### Lowest Product Price

```sql
SELECT MIN(Price) AS LowestPrice
FROM Products;
```

#### Total Stock

```sql
SELECT SUM(Stock) AS TotalStock
FROM Products;
```

#### Number of Products in Each Category

```sql
SELECT
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
```

#### Average Price by Category

```sql
SELECT
    c.CategoryName,
    AVG(p.Price) AS AveragePrice
FROM Categories c
JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
```

## How to Run the Project

1. Install and open **MySQL Workbench**.
2. Open the file `ecommerce_sql_queries.sql`.
3. Execute the complete SQL script.
4. The script creates the database `ecommerce_db`.
5. The script creates the `Customers`, `Categories`, and `Products` tables.
6. Sample data is inserted into the tables.
7. Execute the queries individually to view their outputs in the Result Grid.

## Project Files

```text
E-Commerce-SQL/
│
├── ecommerce_sql_queries.sql
├── README.md
└── output/
    ├── 01_select_output.png
    ├── 02_where_output.png
    ├── 03_order_by_output.png
    ├── 04_distinct_output.png
    └── 05_business_report.png
```

> The `output` folder contains screenshots of the SQL queries and their corresponding results from MySQL Workbench.

## Output Screenshots

### SELECT Query Output

![SELECT Query Output](output/01_select_output.png)

### WHERE Query Output

![WHERE Query Output](output/02_where_output.png)

### ORDER BY Query Output

![ORDER BY Query Output](output/03_order_by_output.png)

### DISTINCT Query Output

![DISTINCT Query Output](output/04_distinct_output.png)

### Business Report Output

![Business Report Output](output/05_business_report.png)

## Key SQL Concepts Used

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `DISTINCT`
- `BETWEEN`
- `AND`
- `OR`
- `JOIN`
- `CROSS JOIN`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`

## Expected Learning Outcomes

After completing this project, the student will be able to:

- Retrieve records from database tables.
- Filter records using different conditions.
- Sort query results.
- Retrieve unique values using `DISTINCT`.
- Search products using price, category, and availability.
- Combine information from multiple tables.
- Use aggregate functions for simple business reports.
- Use `GROUP BY` for category-wise analysis.
- Execute SQL queries and view their results in MySQL Workbench.

## Conclusion

This project demonstrates how SQL can be used to manage and analyze basic E-Commerce data. The implemented queries provide product search, customer information retrieval, filtering, sorting, and simple business reports that can support day-to-day database operations.
