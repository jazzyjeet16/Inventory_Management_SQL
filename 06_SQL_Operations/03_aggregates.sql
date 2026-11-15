USE inventory_db;
SELECT category_id,COUNT(*) total_products,AVG(selling_price) average_selling_price FROM products GROUP BY category_id HAVING COUNT(*)>=2 ORDER BY total_products DESC;
SELECT warehouse_id,COUNT(*) product_rows,SUM(quantity_on_hand) total_units FROM warehouse_stock GROUP BY warehouse_id ORDER BY total_units DESC;
SELECT movement_type,COUNT(*) movement_count,SUM(quantity) total_quantity FROM stock_movements GROUP BY movement_type;
