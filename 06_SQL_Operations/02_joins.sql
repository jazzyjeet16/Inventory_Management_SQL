USE inventory_db;
SELECT p.product_id,p.product_name,c.category_name,s.supplier_name FROM products p INNER JOIN categories c ON p.category_id=c.category_id INNER JOIN suppliers s ON p.preferred_supplier_id=s.supplier_id;
SELECT p.product_id,p.product_name,ws.quantity_on_hand FROM products p LEFT JOIN warehouse_stock ws ON p.product_id=ws.product_id;
SELECT po.purchase_order_id,s.supplier_name,w.warehouse_name,po.order_date,po.status FROM purchase_orders po JOIN suppliers s ON po.supplier_id=s.supplier_id JOIN warehouses w ON po.warehouse_id=w.warehouse_id;
