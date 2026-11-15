# Data Dictionary (summary)

| Table | Primary key | Important columns / foreign keys |
|---|---|---|
| categories | category_id | category_name (unique), description |
| suppliers | supplier_id | supplier_name, email (unique), status |
| warehouses | warehouse_id | warehouse_name (unique), address, capacity_units |
| products | product_id | sku (unique), category_id FK, preferred_supplier_id FK, unit_cost, selling_price, reorder_level |
| purchase_orders | purchase_order_id | supplier_id FK, warehouse_id FK, order_date, expected_date, status |
| purchase_order_items | purchase_order_item_id | purchase_order_id FK, product_id FK, quantities, unit_cost |
| warehouse_stock | (product_id, warehouse_id) | both columns are FKs; quantity_on_hand, updated_at |
| stock_movements | movement_id | product_id FK, warehouse_id FK, movement_type, quantity, movement_date, reference fields |
