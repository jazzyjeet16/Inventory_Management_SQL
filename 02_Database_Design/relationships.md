# Database relationships

- categories (1) to products (many): `products.category_id`.
- suppliers (1) to products (many): `products.preferred_supplier_id`.
- suppliers (1) to purchase_orders (many): `purchase_orders.supplier_id`.
- warehouses (1) to purchase_orders (many): `purchase_orders.warehouse_id`.
- purchase_orders (1) to purchase_order_items (many): `purchase_order_items.purchase_order_id`.
- products (1) to purchase_order_items (many): `purchase_order_items.product_id`.
- products and warehouses each have one-to-many relationships with stock_movements.
- products and warehouses each have one-to-many relationships with warehouse_stock; together they identify a unique stock row.

Use MySQL Workbench Database > Reverse Engineer to generate the native `.mwb` EER model from the created schema. Save your own Workbench model and export an image into this folder; a native Workbench file cannot be truthfully pre-generated without running Workbench.
