# Analytical Reports

Each SQL file in `sql_queries/` returns a result set for display in MySQL Workbench. The matching CSV files in `exported_csv/` are example outputs calculated from the supplied fictional raw CSV records. To export directly from MySQL, append an `INTO OUTFILE` clause before the `FIELDS TERMINATED BY` options, using a unique file name in the server's permitted directory. MySQL does not overwrite existing OUTFILE paths.

Reports: warehouse valuation, low stock/reorder, supplier purchase analysis, monthly movement and detailed purchase orders.
