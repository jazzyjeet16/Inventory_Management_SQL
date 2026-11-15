USE inventory_db;
CREATE INDEX idx_product_name ON products(product_name);
CREATE INDEX idx_po_order_date ON purchase_orders(order_date);
CREATE INDEX idx_movement_date ON stock_movements(movement_date);
CREATE INDEX idx_movement_warehouse_date ON stock_movements(warehouse_id, movement_date);
-- PK, UNIQUE and FK supporting indexes are created automatically where required.
