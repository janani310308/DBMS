-- Insert Categories
INSERT INTO Category (category_id, category_name) VALUES
(101, 'Electronics'),
(102, 'Clothing'),
(103, 'Books'),
(104, 'Home Appliances'),
(105, 'Sports');

-- Insert Products
INSERT INTO Product (product_id, product_name, category_id, price, stock) VALUES
(1001, 'Laptop', 101, 55000.00, 15),
(1002, 'Wireless Mouse', 101, 850.00, 40),
(1003, 'T-Shirt', 102, 599.00, 75),
(1004, 'Data Structures Book', 103, 720.00, 30),
(1005, 'Microwave Oven', 104, 9500.00, 12),
(1006, 'Football', 105, 1200.00, 25);