# Inventory and Warehouse Management System

A MySQL 8.0 capstone database project for managing products, suppliers, warehouses, purchase orders, inventory balances and stock movements.

## Project contents

- Eight relational tables with primary keys, foreign keys and validation constraints.
- Seven source CSV files containing 325 fictional input records.
- SQL scripts for schema creation, indexes, CSV imports, querying, reporting, views, triggers and transaction examples.
- Five analytical report CSVs plus a calculated warehouse-stock balance CSV.
- ERD explanation in `02_Database_Design/ER_Diagram/README.md`.

## Requirements

- MySQL Server 8.0+ and MySQL Workbench.
- CSV files copied to a server-readable directory. The import script currently uses `C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/`; change paths if your setup differs.

## Rebuild order

1. Run `03_Database_Schema/01_create_database.sql`.
2. Run `03_Database_Schema/02_create_tables.sql`.
3. Copy the seven CSV files from `04_Raw_CSV_Data/` into the MySQL server Uploads directory.
4. Run `05_Data_Import/csv_import_queries.sql` in order.
5. Populate the historical stock balance using the query below (do this before installing the stock movement triggers).
6. Run `03_Database_Schema/03_indexes.sql`, then the query/report scripts as needed.
7. Run views and triggers only after validating the imported data and stock balances.

### Initialize warehouse_stock from historical movements

```sql
INSERT INTO warehouse_stock (product_id, warehouse_id, quantity_on_hand)
SELECT product_id, warehouse_id,
       SUM(CASE WHEN movement_type='IN' THEN quantity ELSE -quantity END)
FROM stock_movements
GROUP BY product_id, warehouse_id
HAVING SUM(CASE WHEN movement_type='IN' THEN quantity ELSE -quantity END) >= 0;
```

## CSV input data

| File | Table | Rows in source pack |
|---|---|---:|
| 01_categories.csv | categories | 12 |
| 02_suppliers.csv | suppliers | 20 |
| 03_warehouses.csv | warehouses | 8 |
| 04_products_supplier_price_list.csv | products | 60 |
| 05_purchase_orders.csv | purchase_orders | 25 |
| 06_purchase_order_items.csv | purchase_order_items | 50 |
| 07_stock_movements.csv | stock_movements | 150 |
| **Total** | | **325** |

## Analytical outputs

The `07_Analytical_Reports/exported_csv/` folder contains report CSVs generated from the supplied fictional CSV source data using equivalent relational calculations. Re-run the SQL files in `07_Analytical_Reports/sql_queries/` against your MySQL database to produce fresh outputs using `SELECT ... INTO OUTFILE`. These files are example expected outputs, not exports captured from your local Workbench session.

## Important notes

- All supplied records are fictional demonstration data.
- `warehouse_stock` is a derived current-balance table; initialize it from historical movements before creating the AFTER INSERT trigger.
- The trigger scripts are designed for new movements after initialization. Do not replay historical movement CSV imports after triggers are installed, or balances will be counted twice.
- SQL scripts include comments for destructive or illustrative operations. Review before execution.
- Generate the native ERD `.mwb` and screenshots from your own MySQL Workbench session and add them to the designated folders.

## Screenshot evidence
Screenshots supplied by the project owner are stored in `10_Screenshots/`. See `10_Screenshots/SCREENSHOT_INDEX.md` for descriptions and file locations. These captures document table structures and sample records. Add further genuine screenshots for indexes, CSV imports, analytical outputs, views, triggers, transactions and backup/restore after those operations are executed and verified.

## Important schema-name consistency note
The supplied terminal screenshots visibly show the schema name `inventory_management`, whereas the SQL scripts in this repository currently use `inventory_db`. Choose one schema name and update all `CREATE DATABASE`, `USE`, import and report scripts consistently before a fresh end-to-end run. The screenshots are retained as supplied and the scripts have not been silently rewritten.
