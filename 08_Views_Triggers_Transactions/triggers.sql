USE inventory_db;
DELIMITER $$
CREATE TRIGGER trg_stock_movement_before_insert BEFORE INSERT ON stock_movements FOR EACH ROW BEGIN DECLARE v_current_stock INT DEFAULT 0; IF NEW.quantity<=0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Movement quantity must be positive'; END IF; IF NEW.movement_type='OUT' THEN SELECT COALESCE(MAX(quantity_on_hand),0) INTO v_current_stock FROM warehouse_stock WHERE product_id=NEW.product_id AND warehouse_id=NEW.warehouse_id; IF v_current_stock<NEW.quantity THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Insufficient stock for outgoing movement'; END IF; END IF; END$$
CREATE TRIGGER trg_stock_movement_after_insert AFTER INSERT ON stock_movements FOR EACH ROW BEGIN INSERT INTO warehouse_stock(product_id,warehouse_id,quantity_on_hand) VALUES(NEW.product_id,NEW.warehouse_id,IF(NEW.movement_type='IN',NEW.quantity,-NEW.quantity)) ON DUPLICATE KEY UPDATE quantity_on_hand=quantity_on_hand+IF(NEW.movement_type='IN',NEW.quantity,-NEW.quantity),updated_at=CURRENT_TIMESTAMP; END$$
DELIMITER ;
-- IMPORTANT: Populate warehouse_stock from historical stock_movements BEFORE creating these triggers.
