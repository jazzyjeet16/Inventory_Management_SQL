# Screenshot Evidence Index

These screenshots were supplied by the project owner and copied into the folders below. They show MySQL terminal/result output, not fabricated mockups.

| Folder | Evidence |
|---|---|
| `database_creation/` | Database/schema table listing showing the eight project tables |
| `table_structures/` | DESCRIBE-style outputs for categories, products, purchase_order_items, purchase_orders, stock_movements, suppliers, warehouse_stock and warehouses |
| `query_outputs/` | Sample records shown for categories, products, purchase_order_items, purchase_orders, stock_movements, suppliers, warehouse_stock and warehouses |

## Evidence limitations
These captures document only the structures and sample rows visible in the screenshots. They do not independently prove every row count, all index definitions, successful analytical exports, or execution of all project scripts. Add further genuine evidence after those operations are run and verified.

## Schema-name consistency note
The supplied terminal screenshot visibly shows the schema name `inventory_management`, while the SQL scripts in this repository currently create/use `inventory_db`. Choose one schema name and use it consistently in `CREATE DATABASE`, `USE`, import and report scripts before a fresh end-to-end run. The screenshots are retained as supplied; scripts have not been silently rewritten.
