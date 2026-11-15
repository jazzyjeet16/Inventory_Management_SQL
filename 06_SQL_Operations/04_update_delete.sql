USE inventory_db;
-- Demonstration only: use a transaction and verify target rows before committing.
START TRANSACTION;
UPDATE products SET selling_price = selling_price * 1.02 WHERE product_id = 1;
UPDATE suppliers SET status = 'INACTIVE' WHERE supplier_id = 20;
UPDATE warehouses SET capacity_units = capacity_units + 100 WHERE warehouse_id = 1;
ROLLBACK; -- Reverts demonstration updates.

-- Safe DELETE examples: execute only if the selected IDs are disposable test records.
-- DELETE FROM purchase_order_items WHERE purchase_order_item_id = 999999;
-- DELETE FROM stock_movements WHERE movement_id = 999999;
