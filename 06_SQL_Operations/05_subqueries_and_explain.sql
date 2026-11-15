USE inventory_db;
SELECT product_id,product_name,selling_price FROM products WHERE selling_price>(SELECT AVG(selling_price) FROM products);
SELECT product_id,product_name FROM products WHERE product_id IN (SELECT product_id FROM purchase_order_items GROUP BY product_id HAVING SUM(quantity_ordered)>50);
EXPLAIN SELECT * FROM products WHERE product_name='Smartphone X1';
