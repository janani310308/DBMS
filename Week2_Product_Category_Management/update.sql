-- Update the price of a product
UPDATE Product
SET price = 58000.00
WHERE product_id = 1001;

-- Update the stock quantity
UPDATE Product
SET stock = 20
WHERE product_id = 1005;

-- Update the product name
UPDATE Product
SET product_name = 'Gaming Laptop'
WHERE product_id = 1001;

-- Update the category of a product
UPDATE Product
SET category_id = 105
WHERE product_id = 1006;