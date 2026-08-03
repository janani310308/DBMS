-- Create Database
CREATE DATABASE ProductCategoryDB;

-- Use Database
USE ProductCategoryDB;

-- Create Category Table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
);