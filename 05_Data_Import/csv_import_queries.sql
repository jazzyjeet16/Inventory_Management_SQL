USE inventory_db;

-- Run in this order after copying CSV files to the server Uploads directory.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/01_categories.csv' INTO TABLE categories FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (category_id, category_name, description);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/02_suppliers.csv' INTO TABLE suppliers FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (supplier_id, supplier_name, contact_person, email, phone, city, state, status);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/03_warehouses.csv' INTO TABLE warehouses FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (warehouse_id, warehouse_name, address, city, state, capacity_units, status);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/04_products_supplier_price_list.csv' INTO TABLE products FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (product_id, sku, product_name, category_id, preferred_supplier_id, unit_cost, selling_price, reorder_level, unit_of_measure, status);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/05_purchase_orders.csv' INTO TABLE purchase_orders FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (purchase_order_id, supplier_id, warehouse_id, order_date, expected_date, status, notes);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/06_purchase_order_items.csv' INTO TABLE purchase_order_items FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (purchase_order_item_id, purchase_order_id, product_id, quantity_ordered, quantity_received, unit_cost);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/07_stock_movements.csv' INTO TABLE stock_movements FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (movement_id, product_id, warehouse_id, movement_type, quantity, unit_cost, movement_date, reference_type, @reference_id, remarks) SET reference_id = NULLIF(@reference_id, '');
