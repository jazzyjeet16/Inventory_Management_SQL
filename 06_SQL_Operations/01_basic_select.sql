USE inventory_db;
SELECT * FROM products;
SELECT product_id, product_name, selling_price FROM products WHERE selling_price > 10000;
SELECT * FROM products WHERE product_name LIKE '%phone%';
SELECT * FROM products WHERE unit_cost BETWEEN 1000 AND 20000;
SELECT * FROM products WHERE status IN ('ACTIVE','DISCONTINUED');
SELECT * FROM products ORDER BY selling_price DESC LIMIT 10;
