-- 1. Display all products
SELECT * FROM Product;

-- 2. Display all categories
SELECT * FROM Category;

-- 3. Display products with their category names
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock
FROM Product p
INNER JOIN Category c
ON p.category_id = c.category_id;

-- 4. Category-wise product report
SELECT
    c.category_name,
    COUNT(p.product_id) AS Total_Products
FROM Category c
LEFT JOIN Product p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- 5. Display products with stock greater than 20
SELECT *
FROM Product
WHERE stock > 20;

-- 6. Display products sorted by price
SELECT *
FROM Product
ORDER BY price DESC;