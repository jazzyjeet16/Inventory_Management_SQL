USE inventory_db;
-- Example transfer: replace IDs/quantity with a valid product, source, destination and quantity.
START TRANSACTION;
-- Check source balance first.
SELECT quantity_on_hand FROM warehouse_stock WHERE product_id=1 AND warehouse_id=1 FOR UPDATE;
-- The two movement inserts are atomic when run after triggers are installed.
-- INSERT INTO stock_movements(movement_id,product_id,warehouse_id,movement_type,quantity,unit_cost,movement_date,reference_type,remarks) VALUES (900001,1,1,'OUT',5,15999.00,CURDATE(),'TRANSFER','Transfer out');
-- INSERT INTO stock_movements(movement_id,product_id,warehouse_id,movement_type,quantity,unit_cost,movement_date,reference_type,remarks) VALUES (900002,1,2,'IN',5,15999.00,CURDATE(),'TRANSFER','Transfer in');
-- COMMIT;
-- ROLLBACK;
