# Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    CATEGORIES ||--o{ PRODUCTS : classifies
    SUPPLIERS ||--o{ PRODUCTS : preferred_supplier
    SUPPLIERS ||--o{ PURCHASE_ORDERS : receives_orders
    WAREHOUSES ||--o{ PURCHASE_ORDERS : destination
    PURCHASE_ORDERS ||--o{ PURCHASE_ORDER_ITEMS : contains
    PRODUCTS ||--o{ PURCHASE_ORDER_ITEMS : ordered_as
    PRODUCTS ||--o{ STOCK_MOVEMENTS : moved
    WAREHOUSES ||--o{ STOCK_MOVEMENTS : records
    PRODUCTS ||--o{ WAREHOUSE_STOCK : stocked_as
    WAREHOUSES ||--o{ WAREHOUSE_STOCK : stores
```

`warehouse_stock` uses a composite primary key `(product_id, warehouse_id)`. `purchase_order_items` is the associative entity between purchase orders and products.
